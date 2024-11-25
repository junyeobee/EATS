<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    alert('결제가 완료되었습니다.');
    opener.location.href = '/reportLoad';
    window.self.close();
</script>