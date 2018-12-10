//package com.sss.service.netdisk;
//
//import com.jacob.activeX.ActiveXComponent;
//import com.jacob.com.Dispatch;
//import org.docx4j.Docx4J;
//import org.docx4j.convert.out.FOSettings;
//import org.docx4j.fonts.IdentityPlusMapper;
//import org.docx4j.fonts.Mapper;
//import org.docx4j.fonts.PhysicalFonts;
//import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
//import org.docx4j.org.apache.poi.util.IOUtils;
//
//import java.io.File;
//import java.io.OutputStream;
//
///**
// * Created by ZhangJun on 2018/6/14.
// */
//public class PdfUtil {
//    public static void convertDocxToPDF(String docxPath, String pdfPath) throws Exception {
//        OutputStream os = null;
//        try {
//            WordprocessingMLPackage mlPackage = WordprocessingMLPackage.load(new File(docxPath));
//            Mapper fontMapper = new IdentityPlusMapper();
//            fontMapper.put("华文行楷", PhysicalFonts.get("STXingkai"));
//            fontMapper.put("华文仿宋", PhysicalFonts.get("STFangsong"));
//            fontMapper.put("隶书", PhysicalFonts.get("LiSu"));
//            mlPackage.setFontMapper(fontMapper);
//
//            os = new java.io.FileOutputStream(pdfPath);
//
//            FOSettings foSettings = Docx4J.createFOSettings();
//            foSettings.setWmlPackage(mlPackage);
//            Docx4J.toFO(foSettings, os, Docx4J.FLAG_EXPORT_PREFER_XSL);
//
//        }catch(Exception ex){
//            ex.printStackTrace();
//        }finally {
//            IOUtils.closeQuietly(os);
//        }
//    }
//
//
//    public static void convert(String in,String out){
//        ActiveXComponent app = null;
//        String wordFile =in;
//        String pdfFile = out;
//        System.out.println("开始转换...");
//        // 开始时间
//        long start = System.currentTimeMillis();
//        try {
//            // 打开word
//            app = new ActiveXComponent("Word.Application");
//            // 设置word不可见,很多博客下面这里都写了这一句话，其实是没有必要的，因为默认就是不可见的，如果设置可见就是会打开一个word文档，对于转化为pdf明显是没有必要的
//            //app.setProperty("Visible", false);
//            // 获得word中所有打开的文档
//            Dispatch documents = app.getProperty("Documents").toDispatch();
//            System.out.println("打开文件: " + wordFile);
//            // 打开文档
//            Dispatch document = Dispatch.call(documents, "Open", wordFile, false, true).toDispatch();
//            // 如果文件存在的话，不会覆盖，会直接报错，所以我们需要判断文件是否存在
//            File target = new File(pdfFile);
//            if (target.exists()) {
//                target.delete();
//            }
//            System.out.println("另存为: " + pdfFile);
//            // 另存为，将文档报错为pdf，其中word保存为pdf的格式宏的值是17
//            Dispatch.call(document, "SaveAs", pdfFile, 17);
//            // 关闭文档
//            Dispatch.call(document, "Close", false);
//            // 结束时间
//            long end = System.currentTimeMillis();
//            System.out.println("转换成功，用时：" + (end - start) + "ms");
//        }catch(Exception e) {
//            System.out.println("转换失败"+e.getMessage());
//        }finally {
//            // 关闭office
//            app.invoke("Quit", 0);
//        }
//    }
//
//    public static void Kmeansmain(String[] args) throws Exception {
//        convert("E:\\杰信\\day23_elasticsearch\\课后资料\\Elasticsearch 学习笔记.docx","C:\\Users\\ZhangJun\\Desktop\\youknow.pdf");
//    }
//}
