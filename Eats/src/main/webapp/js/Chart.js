/**
 * 
 */
const ChartManager = {
    colors: {
        primary: ['#2570eb', '#3b82f6', '#609afa', '#93bbfd', '#bfd7fe'],
        secondary: ['#64748b', '#94a3b8', '#cbd5e1', '#e2e8f0', '#f1f5f9']
    },
    //레전드만들기
    createLegend(chart, id) {
        const legendContainer = document.getElementById(id);
        let labelLi = legendContainer.querySelector('ul');

        if (!labelLi) {
            labelLi = document.createElement('ul');
            labelLi.style.margin = 0;
            labelLi.style.padding = 0;
            labelLi.style.display = 'grid';
            labelLi.style.flexWrap = 'wrap';
            labelLi.style.gap = '10px';

            legendContainer.appendChild(labelLi);
        }

        return labelLi;
    },
    //htmlLegendPlugin 함수(도넛차트 레전드)
    htmlLegendPlugin: {
        id: 'htmlLegend',
        afterUpdate(chart, args, options) {
            const ul = ChartManager.createLegend(chart, options.containerID);
            ul.style.margin = '15px 0px';
            ul.style.alignItems = 'center';

            while (ul.firstChild) {
                ul.firstChild.remove();
            }
            //라벨 아이템 지정
            const items = chart.options.plugins.legend.labels.generateLabels(chart);

            items.forEach(item => {
                const li = document.createElement('li');
                li.style.alignItems = 'right';
                li.style.cursor = 'pointer';
                li.style.display = 'flex';
                li.style.gap = '3px';
                li.style.alignItems = 'center';

                const keywBox = document.createElement('span');
                keywBox.style.background = item.fillStyle;
                keywBox.style.width = '10px';
                keywBox.style.height = '10px';
                keywBox.style.borderRadius = '50%';
                keywBox.style.display = 'inline-block';

                const textContainer = document.createElement('p');
                textContainer.style.margin = 0;
                textContainer.style.padding = 0;
                textContainer.style.color = '#64748b';
                textContainer.style.fontSize = '13px';
                textContainer.innerHTML = item.text;

                li.appendChild(keywBox);
                li.appendChild(textContainer);
                ul.appendChild(li);
            });
        }
    },
    //차트그리기 함수
    createChart(ctx, type, data, options = {}) {
        const chartConfig = {
            type,
            data: this.transformData(type, data),
            options: this.getChartOptions(type, options)
        };

        if (type === 'doughnut') {
            chartConfig.plugins = [this.htmlLegendPlugin];
        }

        return new Chart(ctx, chartConfig);
    },
    //타입,데이터로 차트 모양 지정(바,도넛)
    transformData(type, rawData) {
        switch(type) {
            case 'bar':
                return {
                    labels: rawData.labels,
                    datasets: rawData.datasets.map((dataset, index) => ({
                        label: dataset.label,
                        data: dataset.data,
                        backgroundColor: this.colors.primary[index % this.colors.primary.length],
                        borderRadius: 4
                    }))
                };
            case 'doughnut':
                return {
                    labels: rawData.labels,
                    datasets: [{
                        data: rawData.data,
                        backgroundColor: this.colors.primary
                    }]
                };
            case 'line':
                return {
                    labels: rawData.labels,
                    datasets: rawData.datasets.map((dataset, index) => ({
                        label: dataset.label,
                        data: dataset.data,
                        tension: dataset.tension,
                        pointStyle: dataset.pointStyle,
                        pointRadius: dataset.pointRadius,
                        pointHoverRadius: dataset.pointHoverRadius,
                        borderWidth: dataset.borderWidth
                    }))
                };
            default:
                return rawData;
        }
    },
    //차트 옵션 지정
    getChartOptions(type, customOptions = {}) {
        const baseOptions = {
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            }
        };
        //타입별로 옵션
        const typeSpecificOptions = {
            //바타입 지정
            bar: {
                scales: {
                   legend: {
                        display: false
                    },
                    
                },
                plugins: {
                    legend: {
                        display: false
                    },
                    htmlLegend: {
                        containerID: 'legend-container'
                    }
                },

            },
            //도넛타입 지정
            doughnut: {
                cutout: '70%',
                maintainAspectRatio: true,  /* 비율 유지 */
                responsive: true,
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0
                    }
                },
                plugins: {
                    legend: {
                        display: false
                    },
                    htmlLegend: {
                        containerID: 'legend-container'
                    }
                }
            }
        };

        return {
            //기본옵션 + 타입별옵션 + 사용자정의옵션
            ...baseOptions,
            ...(typeSpecificOptions[type] || {}),
            ...customOptions
        };
    }
};