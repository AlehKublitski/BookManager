
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
  <title>search Part</title>

  <style type="text/css">
    .tg {
      border-collapse: collapse;
      border-spacing: 0;
      border-color: #ccc;
    }

    .tg td {
      font-family: Arial, sans-serif;
      font-size: 14px;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #fff;
    }

    .tg th {
      font-family: Arial, sans-serif;
      font-size: 14px;
      font-weight: normal;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #f0f0f0;
    }

    .tg .tg-4eph {
      background-color: #f9f9f9
    }
  </style>

</head>
<body>
<a href="/redirect">Вернуться в общий каталог</a>
<h1>Результат поиска детали</h1>

<table class="tg">
  <tr>

    <th width="120">Наименование</th>
    <th width="120">Необходимость</th>
    <th width="120">Количество</th>
      <th width="100">Добавить экземпляр</th>
      <th width="100">Удалить всю строку</th>
      <th width="100">Удалить экземпляр</th>
  </tr>
  <tr>

    <td>${part.name}</td>
      <td> <c:choose>
          <c:when test="${part.needed !=1}">Нет</c:when>
          <c:otherwise>Да</c:otherwise>
      </c:choose>
      </td>
    <td>${part.number}</td>
      <td><a href="<c:url value='/increment/${part.id}'/>">Добавить экземпляр</a></td>
      <td><a href="<c:url value='/remove/${part.id}'/>">Удалить всю строку</a></td>
      <td><a href="<c:url value='/decrement/${part.id}'/>">Удалить экземпляр</a></td>
  </tr>
</table>
</body>
</html>