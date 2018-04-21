package org.kite3.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 通用的拦截器，拦截所有请求
 * <p>
 * 当前实现的功能：1.登录判断 2.字符编码处理
 *
 * @author kite3
 */
public class CommonInterceptor implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        // TODO Auto-generated method stub

    }

    /**
     * 判断是否公开地址，若是返回true
     */
    private boolean isPublicPath(String url) {
        // 个人中心
        if (url.indexOf("/user") > 0) {
            return false;
        }
        return true;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // 字符编码
        request.setCharacterEncoding("utf-8");
        // 对非公开路径进行拦截
        String url = request.getRequestURI();
        if (!isPublicPath(url)) {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            if (username == null) {
                request.getRequestDispatcher("/WEB-INF/jsp/auth/login.jsp").forward(request, response);
                return false;
            }
        }
        return true;
    }

}
