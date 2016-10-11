<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>

<%
String language = new String("EN");
String country = new String("CA");
Locale currentLocale = new Locale(language, country);
ResourceBundle messages = ResourceBundle.getBundle("MessagesBundle", currentLocale);
%>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-xs-12 text-center">
                <h1><%=messages.getString("test")%></h1>
                <p class="lead">To be updated in later versions</p>
            </div>
        </div>
    </div>

<%@include file="common/footer.jsp"%>