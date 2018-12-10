package com.sss.util;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

public class ReadDataPoi {
    private String fileAddress;
    private ArrayList<double[]> dataSet = new ArrayList<double[]>();
    public void read(String address) throws IOException {
        //几维
        int index = 2;


        File file = new File(address);
        FileInputStream is = new FileInputStream(file);

        //按2010格式初始化
        Workbook wb = new XSSFWorkbook(is);
        //第一个表单
        Sheet sheet = wb.getSheetAt(0);
        //迭代器
        Iterator<Row> rows = sheet.rowIterator();
        while (true){
            //下一行
            if (!rows.hasNext()){
                break;
            }
            Row next = rows.next();

            //过滤
            Iterator<Cell> cells = next.cellIterator();
            if (!cells.hasNext()){
                break;
            }
            Cell c = cells.next();
            System.out.println(c.getNumericCellValue());
            if (0.0 == c.getNumericCellValue()){
                break;
            }
            //过滤结束


            //存储
            double[] arr = new double[index];
            int i = 0;
            while (cells.hasNext()){
                Cell cell = cells.next();
                float num = (float) cell.getNumericCellValue();
                arr[i] = num;
                i++;
            }
            dataSet.add(arr);
        }

    }

    public ArrayList<double[]> getDataSet() {
        return dataSet;
    }

    public void setDataSet(ArrayList<double[]> dataSet) {
        this.dataSet = dataSet;
    }

    public String getFileAddress() {
        return fileAddress;
    }

    public void setFileAddress(String fileAddress) {
        this.fileAddress = fileAddress;
    }
}
