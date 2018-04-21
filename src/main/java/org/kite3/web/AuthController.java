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
     */
    @RequestMapping(value = "/doRegister")
    @ResponseBody
    public String doRegister(User User, String identiryCode, HttpServletRequest request) {
        if (identiryCode != null && !identiryCode.equalsIgnoreCase((String) request.getSession().getAttribute("random"))) {
            return JsonView.render(2);
        }
        User tmpUser = userService.getByUsername(User.getUsername());
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
     */
    @RequestMapping(value = "/doLogin")
    @ResponseBody
    public String doLogin(User user, String identiryCode, HttpServletRequest request) {
        if (identiryCode != null && !identiryCode.equalsIgnoreCase((String) request.getSession().getAttribute("random"))) {
            return JsonView.render(1);
        }
        User tmpUser = userService.getByUsername(user.getUsername());
        if (tmpUser == null) {
            return JsonView.render(2);
        } else {
            if (!tmpUser.getPassword().equals(user.getPassword())) {
                return JsonView.render(3);
            }
        }
        request.getSession().setAttribute("username", user.getUsername());
        return JsonView.render(0);
    }


    /**
     * 注销
     */
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request) {
        request.getSession(false).removeAttribute("username");
        return new ModelAndView("redirect:login");
    }

}
