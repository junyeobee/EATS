<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
{"list":[<c:forEach var="list" items="${unitList }" varStatus="cnt">"${list }"<c:if test="${!cnt.last }">,</c:if></c:forEach>]}