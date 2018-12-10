package com.sss.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 专门用来读取Excel信息存进javabean中的工具类
 * @author XDerhuo
 */
public class POIUtil {
    private static  Object obj;

    private static List<String> FirstRowValueInExcel = new ArrayList<>();
    /**
     * 按指定的map集合的键值对对应格式把制定路径下的Excel表格存储进javabean
     * @param c
     * @param maps
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    public static <T> List<T>  toBean(Class<T> c, Map<String , String> maps, String excel_url) throws Exception {
        List<T> lists = new ArrayList<>();
        //读取xlsx文件
        XSSFWorkbook xssfWorkbook = null;
        //寻找目录读取文件
        File excelFile = new File(excel_url);
        InputStream is = new FileInputStream(excelFile);
        xssfWorkbook = new XSSFWorkbook(is);

        if(xssfWorkbook==null){
            System.out.println("未读取到内容,请检查路径！");
            return null;
        }

        //初始化
        setTheFirstRowValueInExcel(xssfWorkbook);

        //遍历xlsx中的sheet
        for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
            XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
            if (xssfSheet == null) {
                continue;
            }

            //每行迭代器
            Iterator<Row> rowIterator = xssfSheet.rowIterator();
            //跳过第一行
            if (rowIterator.hasNext()){
                rowIterator.next();
            }

            //遍历每行
            while (rowIterator.hasNext()){
                //创建一个新的对象
                obj = c.newInstance();
                Row row = rowIterator.next();
                //单元迭代器
                Iterator<Cell> cellIterator = row.cellIterator();
                //遍历单元
                int index = 0;
                //将获取到的值存进javabean
                while (cellIterator.hasNext()){
                    Cell cell = cellIterator.next();
                    String s = maps.get(FirstRowValueInExcel.get(index));
                    String methodName = "set"+s.substring(0,1).toUpperCase()+s.substring(1,s.length());
                    Method method = null;

                    //可能性
                    try {
                        method = c.getMethod(methodName, String.class);
                        method.invoke(obj, getValue(cell));
                    }catch (Exception e){
                        try {
                            method = c.getMethod(methodName, Integer.class);
                            method.invoke(obj, Integer.parseInt(getValue(cell)));
                        }catch (Exception e1){
                            try {
                                method = c.getMethod(methodName, Date.class);
                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                Date parse = dateFormat.parse(getValue(cell));
                                method.invoke(obj, parse);
                            }catch (Exception e2){
                                try {
                                    method = c.getMethod(methodName, Double.class);
                                    method.invoke(obj, Double.parseDouble(getValue(cell)));
                                }catch (Exception e3){
                                    throw new RuntimeException(e3);
                                }
                            }
                        }
                    }
                    index++;
                }
                lists.add((T)obj);
            }
        }
        return lists;
    }


    /**
     * 将第一排的标识存储
     * @param xssfWorkbook
     */
    private static void setTheFirstRowValueInExcel(XSSFWorkbook xssfWorkbook){
        XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
        //获取他的第一行
        XSSFRow xssfRow = xssfSheet.getRow(0);
        if (xssfRow != null)  {
            //列集合
            Iterator<Cell> cellIterator = xssfRow.cellIterator();
            while (cellIterator.hasNext()){
                Cell cell = cellIterator.next();
                //拿到第一排的值
                FirstRowValueInExcel.add(Trim_str(getValue(cell)));
            }
        }
    }

    /**
     *  判断普通celll的excel文件的数据类型
     * @param cell
     * @return
     */
    private static String getValue(Cell cell) {
        if(cell==null){
            return "---";
        }
        if (cell.getCellType() == cell.CELL_TYPE_BOOLEAN) {
            return String.valueOf(cell.getBooleanCellValue());
        } else if (cell.getCellType() == cell.CELL_TYPE_NUMERIC) {
            double cur=cell.getNumericCellValue();
            long longVal = Math.round(cur);
            Object inputValue = null;
            if(Double.parseDouble(longVal + ".0") == cur)
                inputValue = longVal;
            else
                inputValue = cur;
            return String.valueOf(inputValue);
        } else if(cell.getCellType() == cell.CELL_TYPE_BLANK || cell.getCellType() == cell.CELL_TYPE_ERROR){
            return "---";
        }
        else {
            return String.valueOf(cell.getStringCellValue());
        }
    }

    /**
     *  判断后缀为xls的excel文件的数据类型
      * @param xssfRow
     * @return
     */
    private static String getValue(XSSFCell xssfRow) {
        if(xssfRow==null){
            return "---";
        }
        if (xssfRow.getCellType() == xssfRow.CELL_TYPE_BOOLEAN) {
            return String.valueOf(xssfRow.getBooleanCellValue());
        } else if (xssfRow.getCellType() == xssfRow.CELL_TYPE_NUMERIC) {
            double cur=xssfRow.getNumericCellValue();
            long longVal = Math.round(cur);
            Object inputValue = null;
            if(Double.parseDouble(longVal + ".0") == cur)
                inputValue = longVal;
            else
                inputValue = cur;
            return String.valueOf(inputValue);
        } else if(xssfRow.getCellType() == xssfRow.CELL_TYPE_BLANK || xssfRow.getCellType() == xssfRow.CELL_TYPE_ERROR){
            return "---";
        }
        else {
            return String.valueOf(xssfRow.getStringCellValue());
        }
    }

    /**
     * 判断后缀为xls的excel文件的数据类型
     * @param hssfCell
     * @return
     */
    private static String getValue(HSSFCell hssfCell) {
        if(hssfCell==null){
            return "---";
        }
        if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
            return String.valueOf(hssfCell.getBooleanCellValue());
        } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
            double cur=hssfCell.getNumericCellValue();
            long longVal = Math.round(cur);
            Object inputValue = null;
            if(Double.parseDouble(longVal + ".0") == cur)
                inputValue = longVal;
            else
                inputValue = cur;
            return String.valueOf(inputValue);
        } else if(hssfCell.getCellType() == hssfCell.CELL_TYPE_BLANK || hssfCell.getCellType() == hssfCell.CELL_TYPE_ERROR){
            return "---";
        }
        else {
            return String.valueOf(hssfCell.getStringCellValue());
        }
    }

    /**
     *     字符串修剪  去除所有空白符号 ， 问号 ， 中文空格
     */
    static private String Trim_str(String str){
        if(str==null) {
            return null;
        }
        return str.replaceAll("[\\s\\?]", "").replace("　", "");
    }
}
