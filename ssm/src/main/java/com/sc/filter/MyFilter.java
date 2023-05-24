package com.sc.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

//通过过滤器获取一次项目前缀
@WebFilter("/*")
public class MyFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext app=filterConfig.getServletContext();
        String base = app.getContextPath();//获取动态的项目前缀
        app.setAttribute("base",base);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        filterChain.doFilter(servletRequest,servletResponse);//放行
    }

    @Override
    public void destroy() {

    }
}
