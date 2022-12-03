package com.easyknowharddo.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.easyknowharddo.utils.TokenUtil;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Component
public class TokenInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        /**不用令牌了，骗骗编辑器，不然身份被拦截*/
        int i = 0;
        if (i == 0) {
            return true;
        }

        if (request.getMethod().equals("OPTIONS")) {
            response.setStatus(HttpServletResponse.SC_OK);
            return true;
        }

        response.setCharacterEncoding("utf-8");

        String token = request.getHeader("token");
        if (token != null) {
            boolean result = Boolean.valueOf(TokenUtil.verify(token).get(0)); // String转Boolean
            if (result) {
                System.out.println("通过拦截器");
                return true;
            }
        }
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = null;
        try {
            JSONObject json = new JSONObject();
            json.put("success", "false");
            json.put("msg", "认证失败，未通过拦截器");
            json.put("code", "50000");
            response.getWriter().append(json.toJSONString());
            System.out.println("认证失败，未通过拦截器");
            //        response.getWriter().write("50000");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500);
            return false;
        }

        return false;
    }
}
