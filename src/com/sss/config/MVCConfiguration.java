package com.sss.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@Configuration
@ComponentScan(basePackages = {"com.sss.controller","com.sss.service","com.sss.resolver"})
@EnableWebMvc
public class MVCConfiguration extends WebMvcConfigurerAdapter {

    @Bean
    /**
     * 添加跳转前缀后缀
     * 前缀：/WEB-INF/jsp/
     * 后缀：.jsp
     */
    public InternalResourceViewResolver viewResolver(){
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    /**
     * 静态资源放行
     * @author 赵飞
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        /* handler : 配置访问路径，例如：/js/** 表示js路径下任意子路径
         * location : 配置实际访问资源位置
         * 例如：
         * 	registry.addResourceHandler("/js/**").addResourceLocations("/xxx/");
         *  访问路径：http://localhost:9090/demo/js/jquery.js
         *  实际访问资源：WebContent/xxx/jquery.js
         */
        registry.addResourceHandler("/js/**").addResourceLocations("/js/");
        registry.addResourceHandler("/css/**").addResourceLocations("/css/");
        registry.addResourceHandler("/admin/**").addResourceLocations("/admin/");
        registry.addResourceHandler("/breakfast/**").addResourceLocations("/breakfast/");
        registry.addResourceHandler("/cases/**").addResourceLocations("/case/");
        registry.addResourceHandler("/cases/**").addResourceLocations("/cases/");
        registry.addResourceHandler("/font/**").addResourceLocations("/font/");
        registry.addResourceHandler("/images/**").addResourceLocations("/images/");
        registry.addResourceHandler("/layui/**").addResourceLocations("/layui/");
        registry.addResourceHandler("/mods/**").addResourceLocations("/mods/");
        registry.addResourceHandler("/netdisk/**").addResourceLocations("/netdisk/");
        registry.addResourceHandler("/user/**").addResourceLocations("/user/");
        registry.addResourceHandler("/upload/**").addResourceLocations("/upload/");
        registry.addResourceHandler("/layer/**").addResourceLocations("/layer/");
        registry.addResourceHandler("/ViewerJS/**").addResourceLocations("/ViewerJS/");
        registry.addResourceHandler("/competition/**").addResourceLocations("/competition/");
    }






    /**
     * <bean id="multipartResolver"
     *           class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
     *         <!-- 上传文件大小上限，单位为字节（10MB） -->
     *         <property name="maxUploadSize">
     *             <value>999999999999999999</value>
     *         </property>
     *         <!-- 请求的编码格式，必须和jSP的pageEncoding属性一致，以便正确读取表单的内容，默认为ISO-8859-1 -->
     *         <property name="defaultEncoding">
     *             <value>UTF-8</value>
     *         </property>
     *     </bean>
     */
    @Bean(name="multipartResolver")
    public CommonsMultipartResolver commonsMultipartResolver(){
        CommonsMultipartResolver commonsMultipartResolver=new CommonsMultipartResolver();
        commonsMultipartResolver.setDefaultEncoding("UTF-8");
        commonsMultipartResolver.setMaxUploadSize(999999999999999999L);
        return commonsMultipartResolver;
    }


    /**
     * 添加全局时间转换器
     *
     * @param registry
     */
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new DateConverter());
    }


    /**
     * 文件上传解析器
     * @return
     */
    @Bean
    public CommonsMultipartResolver multipartResolver(){
        //spring提供基于commons-fileupload 文件上传解析器实现类
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        //文件上传最大值：单位字节
        multipartResolver.setMaxUploadSize(5242880);	//5M
        //服务器端内存
        multipartResolver.setMaxInMemorySize(4096);
        //默认编码：需与表单页面编码保持一致
        multipartResolver.setDefaultEncoding("UTF-8");
        return multipartResolver;
    }


}
