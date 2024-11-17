<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .sales-container {
                max-width: 1200px;
                margin: 20px auto;
                padding: 20px;
                background: #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
    
            .upload-section {
                border: 2px dashed #ddd;
                padding: 30px;
                text-align: center;
                background: #f8fafc;
                border-radius: 8px;
                margin-bottom: 20px;
            }
    
            .upload-section.drag-over {
                border-color: #3b82f6;
                background: #eff6ff;
            }
    
            .file-input {
                display: none;
            }
    
            .upload-btn {
                background: #3b82f6;
                color: white;
                padding: 10px 20px;
                border-radius: 6px;
                cursor: pointer;
                display: inline-block;
                margin: 10px 0;
            }
    
            .preview-section {
                margin-top: 20px;
                border: 1px solid #e5e7eb;
                border-radius: 8px;
                overflow: hidden;
            }
    
            .preview-table {
                width: 100%;
                border-collapse: collapse;
            }
    
            .preview-table th,
            .preview-table td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #e5e7eb;
            }
    
            .preview-table th {
                background: #f8fafc;
                font-weight: 600;
            }
    
            .error-message {
                color: #ef4444;
                margin: 10px 0;
                padding: 10px;
                background: #fef2f2;
                border-radius: 6px;
                display: none;
            }
    
            .submit-btn {
                background: #10b981;
                color: white;
                padding: 12px 24px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
                width: 100%;
            }
    
            .submit-btn:disabled {
                background: #d1d5db;
                cursor: not-allowed;
            }
    
            .loading {
                display: none;
                margin: 20px 0;
            }
        </style>
    </head>
    <body>
        <div class="sales-container">
            <h2>매출 등록</h2>
            <div class="upload-section" id="dropZone">
                <p>CSV 파일을 드래그하여 놓거나 선택하세요</p>
                <input type="file" accept=".csv" class="file-input" id="fileInput">
                <label for="fileInput" class="upload-btn">파일 선택</label>
                <p class="text-sm text-gray-500">CSV 파일만 지원합니다.</p>
            </div>
            
            <div class="error-message" id="errorMessage"></div>
            
            <div class="preview-section">
                <table class="preview-table">
                    <thead>
                        <tr>
                            <th>판매 일시</th>
                            <th>결제 방법</th>
                            <th>주문 수량</th>
                            <th>총 금액</th>
                        </tr>
                    </thead>
                    <tbody id="previewBody">
                    </tbody>
                </table>
            </div>
    
            <div class="loading" id="loading">처리 중...</div>
            <button class="submit-btn" id="submitBtn" disabled>매출 등록하기</button>
        </div>
    
        <script>
	        document.addEventListener('DOMContentLoaded', function() {
	            const dropZone = document.getElementById('dropZone');
	            const fileInput = document.getElementById('fileInput');
	            
	            // 드래그 앤 드롭 이벤트 리스너
	            dropZone.addEventListener('dragover', function(e) {
	                e.preventDefault();
	                dropZone.classList.add('drag-over');
	            });
	            
	            dropZone.addEventListener('dragleave', function(e) {
	                e.preventDefault();
	                dropZone.classList.remove('drag-over');
	            });
	            
	            dropZone.addEventListener('drop', function(e) {
	                e.preventDefault();
	                dropZone.classList.remove('drag-over');
	                const files = e.dataTransfer.files;
	                if (files.length) {
	                    fileInput.files = files;
	                    handleFile(files[0]);
	                }
	            });
	            
	            fileInput.addEventListener('change', function(e) {
	                if (this.files.length) {
	                    handleFile(this.files[0]);
	                }
	            });
	            
	            // 파일 업로드 버튼 이벤트
	            document.getElementById('submitBtn').addEventListener('click', async function() {
	                const fileInput = document.getElementById('fileInput');
	                const file = fileInput.files[0];
	                
	                if (!file) {
	                    showError('업로드할 파일을 선택해주세요.');
	                    return;
	                }
	                await handleSalesUpload(file);
	            });
	        });
	
	        // 파일 처리 함수
	        function handleFile(file) {
	            if (!file) return;
	            
	            if (!file.name.endsWith('.csv')) {
	                showError('CSV 파일만 업로드 가능합니다.');
	                return;
	            }
	            
	            const reader = new FileReader();
	            reader.onload = function(e) {
	                try {
	                    const content = e.target.result;
	                    console.log('File content:', content); // 디버깅용
	                    
	                    const parsedRows = parseCSV(content);
	                    console.log('Parsed rows:', parsedRows); // 디버깅용
	                    
	                    displayPreview(parsedRows);
	                    document.getElementById('submitBtn').disabled = false;
	                } catch (error) {
	                    showError(error.message);
	                    document.getElementById('submitBtn').disabled = true;
	                }
	            };
	            reader.readAsText(file, 'UTF-8');
	        }
	
	        // CSV 파싱 함수
	        function parseCSV(content) {
	        	const rows = content.split(/\r?\n/).map(row => row.trim()).filter(row => row.length > 0);

	            if (rows.length < 2) {
	                throw new Error('데이터가 없는 파일입니다.');
	            }
	
	            const expectedHeaders = ['거래일시', '결제방법', '총주문수량', '총결제금액', '메뉴ID', '메뉴수량', '메뉴단가'];
	            const headers = rows[0].split(',').map(h => h.trim());
	            
	            if (!expectedHeaders.every(h => headers.includes(h))) {
	                throw new Error('올바르지 않은 CSV 파일 형식입니다.');
	            }
	
	            const parsedRows = [];
	            for (let i = 1; i < rows.length; i++) {
	                const fields = rows[i].split(',').map(field => field.trim());
	                
	                if (fields.length < 4) {
	                    continue;
	                }
	
	                parsedRows.push({
	                    date: fields[0],
	                    paymentMethod: fields[1],
	                    totalQuantity: parseInt(fields[2]),
	                    totalAmount: parseInt(fields[3])
	                });
	            }
	            
	            return parsedRows;
	        }
	
	        // 미리보기 표시 함수
	        function displayPreview(rows) {
	            const tbody = document.getElementById('previewBody');
	            tbody.innerHTML = '';
	            
	            rows.forEach(function(row) {
	                const tr = document.createElement('tr');
	                const cells = [
	                    row.date,
	                    row.paymentMethod,
	                    row.totalQuantity,
	                    row.totalAmount.toLocaleString() + '원'
	                ];
	                
	                cells.forEach(function(cell) {
	                    const td = document.createElement('td');
	                    td.textContent = cell;
	                    tr.appendChild(td);
	                });
	                
	                tbody.appendChild(tr);
	            });
	        }
	
	        // 파일 업로드 처리 함수
	        async function handleSalesUpload(file) {
	            const formData = new FormData();
	            formData.append('file', file);

	            const loadingEl = document.getElementById('loading');
	            const errorMessageEl = document.getElementById('errorMessage');
	            const submitBtn = document.getElementById('submitBtn');
	
	            try {
	                loadingEl.style.display = 'block';
	                submitBtn.disabled = true;
	                errorMessageEl.style.display = 'none';
	
	                const response = await fetch('/sellUpload', {
	                    method: 'POST',
	                    body: formData
	                });
	
	                const result = await response.json();
	
	                if (!response.ok) {
	                    throw new Error(result.error || '매출 등록 중 오류가 발생했습니다.');
	                }
	
	                showSuccessMessage(result.processedRows + '건의 매출이 등록되었습니다.');
	                
	                setTimeout(function() {
	                    location.reload();
	                }, 3000);
	
	            } catch (error) {
	                showError(error.message);
	            } finally {
	                loadingEl.style.display = 'none';
	                submitBtn.disabled = false;
	            }
	        }
	
	        // 성공 메시지 표시 함수
	        function showSuccessMessage(message) {
	            const successEl = document.createElement('div');
	            successEl.className = 'success-message';
	            successEl.style.cssText = [
	                'background-color: #dcfce7',
	                'color: #166534',
	                'padding: 12px',
	                'border-radius: 6px',
	                'margin: 10px 0',
	                'text-align: center'
	            ].join(';');
	            
	            successEl.textContent = message;
	            
	            const container = document.querySelector('.sales-container');
	            container.insertBefore(successEl, document.querySelector('.preview-section'));
	        }
	
	        // 에러 메시지 표시 함수
	        function showError(message) {
	            const errorMessageEl = document.getElementById('errorMessage');
	            errorMessageEl.textContent = message;
	            errorMessageEl.style.display = 'block';
	            errorMessageEl.scrollIntoView({ behavior: 'smooth' });
	        }
        </script>
    </body>
</html>