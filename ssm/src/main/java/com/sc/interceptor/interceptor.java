package com.sc.interceptor;

import com.sc.pojo.OAdmin;
import com.sc.pojo.OMenu;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//虽然控制菜单列表展示 但是无法保证用户发送请求也不能访问
public class interceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //先获取登录用户信息 包含的所有权限
        //在获取发送的请求地址
        //如果没有权限 进入error return false
        //如果有权限 可以访问 return true
        String base = request.getContextPath();

        OAdmin admin = (OAdmin) request.getSession().getAttribute("admin");
        if (admin.getRole() == null || admin.getRole().getMenus() == null) {

            response.sendRedirect(base+"/toError");
            return false;
        }
        // /ssm/toHome
        String url = request.getRequestURI();

        // /ssm
        url = url.substring(base.length());
        for (OMenu m:admin.getRole().getMenus()) {
            if(url.equals(m.getUrl())){
                return true;//可以访问
            }
        }
        response.sendRedirect(base+"/toError");
        return false;
    }
}
