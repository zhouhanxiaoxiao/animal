package com.cibr.animal.demo.util;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class FileUtil {

    private static Logger logger = LoggerFactory.getLogger(FileUtil.class);

    public static final String NUCLEIC_ACID_FILENAME = "-核酸-";
    public static final String TISSUE_FILENAME = "-组织-";
    public static final String CELL_FILENAME = "-细胞-";



    public static List<List<String>> getRows(File file){
        Workbook workbook = null;
        try {
            if (file.getName().endsWith(".xls")) {
                workbook = new HSSFWorkbook(new FileInputStream(file));
            } else if (file.getName().endsWith(".xlsx")) {
                workbook = new XSSFWorkbook(new FileInputStream(file));
            }
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        if (workbook == null){
            return null;
        }
        int numOfSheet = workbook.getNumberOfSheets();
        logger.info("有几个工作表【" + numOfSheet + "】");
        Sheet sheet = workbook.getSheetAt(0);
        if(sheet == null) {
            return null;
        }
        int lastRowNum = sheet.getLastRowNum();
        logger.info("工作表共有多少行【" + lastRowNum + "】");
        if(lastRowNum == 0) {
            return null;
        }
        Row tmp = sheet.getRow(0);
        int cols = tmp.getPhysicalNumberOfCells();
        List<List<String>> retList = new ArrayList<List<String>>();
        for (int row = 1;row<=lastRowNum;row++){
            Row r = sheet.getRow(row);
            List rowList = new ArrayList<String>();
            for (int col = 0; col < cols; col++) {
                String cell = null;
                try {
                    cell = r.getCell(col).getStringCellValue();
                }catch (Exception e){
                    cell = String.valueOf(r.getCell(col).getNumericCellValue());
                }
                rowList.add(cell);
            }
            retList.add(rowList);
        }
        return retList;
    }
}
