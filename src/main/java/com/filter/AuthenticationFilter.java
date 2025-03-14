package com.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
/*
@WebFilter("/dashboard.jsp")
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        boolean isLoggedIn = false;

        if (session != null && session.getAttribute("admin") != null) {
            isLoggedIn = true;
            chain.doFilter(request, response);
        } else if (session != null && session.getAttribute("member") != null) {
            isLoggedIn = true;
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }


}
*/