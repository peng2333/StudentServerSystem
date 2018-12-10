package com.sss.config;


import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter implements Converter<String,Date> {
    private String[] patterns = {"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd"};

    @Override
    public Date convert(String source) {
        Date date = null;
        for (String pattern : patterns) {
            try {
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                simpleDateFormat.parse(source);
                break;
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return date;
    }

}
