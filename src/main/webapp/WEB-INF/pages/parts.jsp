<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Parts Page</title>

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
<c:if test="${fullList.size() != listAll.size()}">
    <a href="<c:url value='/redirect'/>">Вернуться в основной каталог</a>
</c:if>

<br/>
<br/>

<h1>Каталог частей для компьютеров</h1>
<c:if test="${!empty listParts}">
    <table class="tg">
        <tr>
            <th width="150">Наименование</th>
            <th width="120">Необходимость</th>
            <th width="120">Количество</th>
            <th width="100">Добавить экземпляр</th>
            <th width="100">Удалить деталь из каталога</th>
            <th width="100">Удалить экземпляр</th>
        </tr>
        <c:forEach items="${listParts}" var="part">
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
        </c:forEach>
    </table>
    <c:if test="${listParts.size() < listAll.size()}">
        <table>
            <tr>
                <td><a href="<c:url value='/previous'/>"><<Предыдущие<< </a></td>
                <td width="120"> </td>
                <td><a href="<c:url value='/next'/>">  >>Следующие>></a></td>
            </tr>
        </table>
    </c:if>

    <table class = "tg">
        <tr>
            <td width="150">Можно собрать</td>
            <td width="120">${countComputers}</td>
            <td width="120">Компьютеров</td>

        </tr>
    </table>
    <td>После проведения операций с базой данных происходит переход в основной каталог!</td>
</c:if>

<h1>Выборка детали по значению</h1>
<table>
    <tr>
        <td><a href="<c:url value='/parts/selectNeeded'/>">Отобразить только необходимые</a></td>
        <td><a href="<c:url value='/parts/selectNoNeeded'/>">Отобразить только опциональные</a></td>
    </tr>
</table>

<h1>Добавить новую деталь в каталог</h1>

<c:url var="addAction" value="/parts/add"/>
<form:form action="${addAction}" commandName="part">
    <table>
        <c:if test="${!empty part.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Наименование"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="needed">
                    <spring:message text="Необходимость Да/Нет"/>
                </form:label>
            </td>
            <td>
                <form:input path="needed"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="number">
                    <spring:message text="Количество"/>
                </form:label>
            </td>
            <td>
                <form:input path="number"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">

                    <input type="submit" value="<spring:message text="Добавить деталь"/>"/>
            </td>
        </tr>
    </table>
</form:form>

<h1>Поиск детали по названию</h1>
<c:url var="searchAction" value="/parts/search"/>

<form:form action="${searchAction}" commandName="part">
<table>
    <tr>
        <td>
            <form:label path="name">
                <spring:message text="Наименование"/>
            </form:label>
        </td>
        <td>
            <form:input path="name"/>
        </td>

    </tr>
    <tr>
    <td colspan="2">

        <input type="submit" value="<spring:message text="Найти деталь"/>"/>

    </td>
    </tr>

</table>
</form:form>

</body>
</html>
