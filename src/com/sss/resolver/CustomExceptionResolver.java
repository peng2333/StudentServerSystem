package com.sss.resolver;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.support.DefaultHandlerExceptionResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@ControllerAdvice
public class CustomExceptionResolver extends DefaultHandlerExceptionResolver {

    @ExceptionHandler(value = Exception.class)
    public ModelAndView defalutErrorHandler(HttpServletRequest request,
                                            HttpServletResponse response,
                                            Object handler,
                                            Exception e){
        ModelAndView mav = new ModelAndView();
         mav.setViewName("/user/error");
        return mav;
    }
}
