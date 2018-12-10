package com.sss.config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

public class WebInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext) {
        //1 初始化spring容器
        AnnotationConfigWebApplicationContext appliation = new AnnotationConfigWebApplicationContext();
        //开始整合其他配置文件
        appliation.register(SpringConfiguration.class);
        appliation.register(MyBatisConfiguration.class);
        appliation.register(MVCConfiguration.class);
        appliation.register(RedisConfiguration.class);
        //appliation.setServletContext(servletContext);
        //整合完毕

        //2 post乱码配置
        FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("CharacterEncodingFilter", new CharacterEncodingFilter("UTF-8"));
        encodingFilter.addMappingForUrlPatterns(null, true, "/*");
        //3 前端控制器
        ServletRegistration.Dynamic springMvcServlet = servletContext.addServlet("springmvc", new DispatcherServlet(appliation));
        springMvcServlet.addMapping("/");
        springMvcServlet.setLoadOnStartup(2);
    }
}
