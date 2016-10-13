<%

    String lastPage = request.getHeader("Referer");
    
    if(session.getAttribute("language").toString().compareTo("EN") == 0){
        session.setAttribute("language", "FR");
    } else {
        session.setAttribute("language", "EN");
    }
    
    response.sendRedirect(lastPage);
    
    %>