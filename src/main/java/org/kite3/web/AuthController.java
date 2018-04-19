package org.kite3.web;

import javax.servlet.http.HttpServletRequest;

import org.kite3.entity.User;
import org.kite3.service.UserService;
import org.kite3.util.JsonView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    /**
     * 注册页面
     */
    @RequestMapping(value = "/register")
    public ModelAndView register() {
        return new ModelAndView("auth/register");
    }

    /**
     * 实现注册
     *
     * @param User         注册的用户名和密码组成的实体类
     * @param identiryCode 验证码
     */
    @RequestMapping(value = "/doRegister")
    @ResponseBody
    public String doRegister(User User, String identiryCode, HttpServletRequest request) {
        // 如果验证码输入错误，则返回2
        if (identiryCode != null && !identiryCode.equalsIgnoreCase((String) request.getSession().getAttribute("random"))) {
            return JsonView.render(2);
        }
        User tmpUser = userService.getByUsername(User.getUsername());
        // 如果用户已注册，则返回1
        if (tmpUser != null) {
            return JsonView.render(1);
        } else {
            userService.createSelectivity(User);
            return JsonView.render(0);
        }
    }

    /**
     * 登录页面
     */
    @RequestMapping(value = "/login")
    public ModelAndView login() {
        return new ModelAndView("auth/login");
    }

    /**
     * 实现登录
     *
     * @param user         登录的用户名和密码组成的实体类
     * @param identiryCode 验证码
     */
    @RequestMapping(value = "/doLogin")
    @ResponseBody
    public String doLogin(User user, String identiryCode, HttpServletRequest request) {
        if (identiryCode != null && !identiryCode.equalsIgnoreCase((String) request.getSession().getAttribute("random"))) {
            // 验证码错误返回1
            return JsonView.render(1);
        }
        User tmpUser = userService.getByUsername(user.getUsername());
        if (tmpUser == null) {
            // 用户不存在错误返回2
            return JsonView.render(2);
        } else {
            if (!tmpUser.getPassword().equals(user.getPassword())) {
                // 密码错误返回3
                return JsonView.render(3);
            }
        }
        // 验证通过
        request.getSession().setAttribute("username", user.getUsername());
        return JsonView.render(0);
    }


    /**
     * 注销
     */
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request) {
        // false代表：不创建session对象，只是从request中获取。
        request.getSession(false).removeAttribute("username");
        // 重定向到登录页面
        return new ModelAndView("redirect:login");
    }

}
