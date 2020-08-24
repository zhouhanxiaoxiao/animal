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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FileUtil {

    private static Logger logger = LoggerFactory.getLogger(FileUtil.class);

    public static final String NUCLEIC_ACID_FILENAME = "-核酸-";
    public static final String TISSUE_FILENAME = "-组织-";
    public static final String CELL_FILENAME = "-细胞-";


    public static Map<String,List<List<String>>> getAllWorkSheet(File file){
        Map ret = new HashMap();
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
        int sheetIndex = 0;
        while (sheetIndex<numOfSheet){
            Sheet sheet = workbook.getSheetAt(sheetIndex);
            if(sheet == null) {
                continue;
            }
            String sheetName = sheet.getSheetName();
            int lastRowNum = sheet.getLastRowNum();
            logger.info("工作表【" + sheetName + "】共有多少行【" + lastRowNum + "】");
            if(lastRowNum == 0) {
                continue;
            }
            Row tmp = sheet.getRow(0);
            int cols = tmp.getPhysicalNumberOfCells();
            List<List<String>> retList = new ArrayList<List<String>>();
            for (int row = 0;row<=lastRowNum;row++){
                Row r = sheet.getRow(row);
                if (r == null){
                    continue;
                }
                List rowList = new ArrayList<String>();
                for (int col = 0; col < cols; col++) {
                    String cell = null;
                    try {
                        cell = r.getCell(col).getStringCellValue();
                    }catch (Exception e){
                        if (r.getCell(col) == null){
                            cell = "";
                        }else {
                            cell = String.valueOf(r.getCell(col).getNumericCellValue());
                        }
                    }
                    rowList.add(cell);
                }
                retList.add(rowList);
            }
            ret.put(sheetName,retList);
            sheetIndex++;
        }
        return ret;
    }

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
                    if (r.getCell(col) == null){
                        cell = "";
                    }else {
                        cell = String.valueOf(r.getCell(col).getNumericCellValue());
                    }
                }
                rowList.add(cell);
            }
            retList.add(rowList);
        }
        return retList;
    }

    public static  Map<String,String> getSampleMsgNum(String type){
        Map<String,String> name_code = new HashMap<String,String>();
        if (FileUtil.NUCLEIC_ACID_FILENAME.equals(type)){
            name_code.put("基因组DNA","01");
            name_code.put("total RNA","02");
            name_code.put("PCR产物","03");
            name_code.put("chip-seq DNA","04");
            name_code.put("单细胞扩增产物","05");
            name_code.put("FFPE","06");
            name_code.put("其它","00");
        }else if (FileUtil.TISSUE_FILENAME.equals(type)){
            name_code.put("组织","21");
            name_code.put("全血","22");
            name_code.put("石蜡组织","23");
            name_code.put("血清","24");
            name_code.put("口腔拭子","25");
            name_code.put("菌体","26");
            name_code.put("其它","20");
        }
        return name_code;
    }

    public static String getSampleMsgCode(String zh,String type){
        return getSampleMsgNum(type).get(zh);
    }

    /**
     * 测序平台
     * @param zh
     * @return
     */
    public static String getSeqCode(String zh){
        switch (zh){
            case "Hiseq-SE50":
                return "01";
            case "Hiseq-PE150":
                return "02";
            case "Hiseq-PE250":
                return "03";
            case "其它":
                return "00";
            default:
                return null;
        }
    }

    /**
     * 建库类型
     * @param zh
     * @param type
     * @return
     */
    public static String getDatabaseType(String zh,String type){
        if (FileUtil.NUCLEIC_ACID_FILENAME.equals(type)){
            switch (zh){
                case "DNA常规小片段":
                    return "01";
                case "DNA非常规小片段":
                    return "02";
                case "人外显子":
                    return "03";
                case "PCR-free文库":
                    return "04";
                case "真核普通转录组":
                    return "05";
                case "真核链特异性":
                    return "06";
                case "LncRNA":
                    return "07";
                default:
                    return null;
            }
        }else if (FileUtil.TISSUE_FILENAME.equals(type)){
            switch (zh){
                case "10X单细胞转录组":
                    return "21";
                case "10X空间转录组":
                    return "22";
                case "10X ATAC":
                    return "23";
                case "smart-seq":
                    return "24";
                case "ATAC":
                    return "25";
                case "HI-C":
                    return "26";
                case "DNA常规小片段":
                    return "27";
                case "DNA非常规小片段":
                    return "28";
                case "人外显子":
                    return "29";
                case "PCR-free文库":
                    return "30";
                case "真核普通转录组":
                    return "31";
                case "真核链特异性":
                    return "32";
                case "LncRNA":
                    return "33";
                default:
                    return null;
            }
        }else if (FileUtil.CELL_FILENAME.equals(type)){
            switch (zh){
                case "10X单细胞转录组":
                    return "41";
                case "10X ATAC":
                    return "42";
                case "smart-seq":
                    return "43";
                case "ATAC":
                    return "44";
                case "HI-C":
                    return "45";
                default:
                    return null;
            }
        }
        return null;
    }

    /**
     * 细胞分选法
     * @param zh
     * @return
     */
    public static String getCellSortCode(String zh ){
        switch (zh){
            case "过筛网":
                return "01";
            case "磁珠分选":
                return "02";
            case "口吸管法":
                return "03";
            case "BD流式分选":
                return "04";
            case "NanoCellect 流式分选":
                return "05";
            default:
                return null;
        }
    }

    /**
     * 样本状态
     * @param zh
     * @param type
     * @return
     */
    public static String getSampleStatuCode(String zh,String type){
        if (FileUtil.NUCLEIC_ACID_FILENAME.equals(type)){
            switch (zh){
                case "溶于纯水":
                    return "01";
                case "溶于TE":
                    return "02";
                case "溶于无Rnase水":
                    return "03";
                case "溶于EB":
                    return "04";
                case "干粉":
                    return "05";
                case "其它":
                    return "00";
                default:
                    return null;
            }
        }else if (FileUtil.TISSUE_FILENAME.equals(type)){
            switch (zh){
                case "速冻组织":
                    return "21";
                case "活体":
                    return "22";
                case "RNAlater保存":
                    return "23";
                case "Trlzol保存":
                    return "24";
                case "其它":
                    return "20";
                default:
                    return null;
            }
        }else if (FileUtil.CELL_FILENAME.equals(type)){
            switch (zh){
                case "裂解液":
                    return "41";
                case "液氮速冻":
                    return "42";
                case "其它":
                    return "40";
                default:
                    return null;
            }
        }
        return null;
    }
}
