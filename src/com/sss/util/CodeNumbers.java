package com.sss.util;

import org.junit.Test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

/**
 * 计算代码量的工具类
 * @author XDerhuo
 * @date 2018年6月28日 17:05:49
 */
public class CodeNumbers {
    private long num;
    public long read(File file) throws FileNotFoundException {
        File[] files = file.listFiles();
        for (File f : files) {
            if (f.isDirectory()){
                System.out.println(file.getAbsolutePath()+"\\"+f.getName());
                read(new File(file.getAbsolutePath()+"\\"+f.getName()));
            }else {
                //是个文件
                BufferedReader bufferedReader = new BufferedReader(new FileReader(f));
                long count = bufferedReader.lines().count();
                num += count;
            }
        }
        return num;
    }

    @Test
    public void test() throws FileNotFoundException {
        CodeNumbers codeNumbers = new CodeNumbers();
        long read = codeNumbers.read(new File("C:\\java5xm\\代码量\\"));
        System.out.println(read);
    }
}
