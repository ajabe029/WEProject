<%@include file="common/header.jsp"%>
<%@include file="common/navbar-admin.jsp"%>
<%@ page import="com.user.*" %>
<%
String title = messages.getString("welcomeTitleAdmin");
%>
<script type="text/javascript">
	document.title = "<%=title%>";
</script>
<form method="post" action="">
<div class="container">

<table class="table table-condensed" style="border-collapse:collapse;">
    <thead>
        <tr>
            <th>Issue #</th>
            <th>Issue</th>
            <th>Category</th>
            <th>Description</th>
            <th>Date Issued</th>
            <th>User Affected</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${issues}" var="issue">
            <tr>
            	<td>${issue.issueId}</td>
            	<td>${issue.issueName}</td>
            	<td>${issue.category}</td>
            	<td>${issue.description}</td>
            	<td>${issue.dateCreated}</td>
            	<td>${issue.user}</td>
            	<td><button type="submit" value="resolve" class="btn btn-primary">Issue has been resolved</button></td>
            </tr>
        </c:forEach>
    </tbody>
</table>    
</div>
</form>


<%@include file="common/footer.jsp"%>