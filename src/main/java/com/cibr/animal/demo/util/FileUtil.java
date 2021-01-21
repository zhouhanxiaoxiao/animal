package com.cibr.animal.demo.util;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FileUtil {

    private static Logger logger = LoggerFactory.getLogger(FileUtil.class);

    public static final String NUCLEIC_ACID_FILENAME = "核酸样本";
    public static final String TISSUE_FILENAME = "组织样本";
    public static final String CELL_FILENAME = "细胞样本";


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
            if (r == null){
                continue;
            }
            List rowList = new ArrayList<String>();
            for (int col = 0; col < cols; col++) {
                String cell = null;
                Cell excleCell = r.getCell(col);
                try {
                    cell = excleCell.getStringCellValue();
                }catch (Exception e){
                    if (HSSFDateUtil.isCellDateFormatted(r.getCell(col))){
                        cell = TimeUtil.date2str(HSSFDateUtil.getJavaDate(r.getCell(col).getNumericCellValue()),"yyyy-MM-dd");
                    }else if (r.getCell(col) == null){
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
        }else if (FileUtil.CELL_FILENAME.equals(type)){
            name_code.put("单细胞悬液","41");
            name_code.put("其它","40");
        }
        return name_code;
    }

    public static String getSampleMsgCode(String zh,String type){
        return getSampleMsgNum(type).get(zh);
    }

    public static String getInitSampleType(String sampleType){
        switch (sampleType){
            case NUCLEIC_ACID_FILENAME:
                return "01";
            case TISSUE_FILENAME:
                return "02";
            case CELL_FILENAME:
                return "03";
            default:
                return null;
        }
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
                case "10X VDJ":
                    return "34";
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
                case "WGS":
                    return "35";
                default:
                    return null;
            }
        }else if (FileUtil.CELL_FILENAME.equals(type)){
            switch (zh){
                case "10X单细胞转录组":
                    return "41";
                case "10X VDJ":
                    return "46";
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

    /**
     * 生成Excel
     * @param writeList
     */
    public static HSSFWorkbook write(List<List<String>> writeList){
        // 创建工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 创建工作表
        HSSFSheet sheet = workbook.createSheet("sheet1");
        for(int row=0;row<writeList.size();row++){
            HSSFRow rows = sheet.createRow(row);
            for (int col = 0; col < writeList.get(row).size(); col++){
                sheet.setColumnWidth(col,5000);
                rows.createCell(col).setCellValue(writeList.get(row).get(col));
            }
        }
        return workbook;
    }

    public static String getInitSampleFlag(String initsample) {
        if (StringUtils.isEmpty(initsample)){
            return null;
        }
        switch (initsample){
            case "01":
                return NUCLEIC_ACID_FILENAME;
            case "02":
                return TISSUE_FILENAME;
            case "03":
                return CELL_FILENAME;
            default:
                return null;
        }
    }

    public static String getSampleTypeFlag(String samplemsg) {
        if (StringUtils.isEmpty(samplemsg)){
            return null;
        }
        switch (samplemsg){
            case "01": return"基因组DNA";
            case "02": return"total RNA";
            case "03": return"PCR产物";
            case "04": return"chip-seq DNA";
            case "05": return"单细胞扩增产物";
            case "06": return"FFPE";
            case "00": return"其它";
            case "21": return "组织";
            case "22": return "全血";
            case "23": return "石蜡组织";
            case "24": return "血清";
            case "25": return "口腔拭子";
            case "26": return "菌体";
            case "20": return "其它";
            case "41": return "单细胞悬液";
            case "40": return "其它";
            default:
                return null;
        }
    }

    public static String getSampleStatuFlag(String samplestatu) {
        if (StringUtils.isEmpty(samplestatu)){
            return null;
        }
        switch (samplestatu){
            case "01": return "溶于纯水";
            case "02": return "溶于TE";
            case "03": return "溶于无Rnase水";
            case "04": return "溶于EB";
            case "05": return "干粉";
            case "00": return "其它";
            case "21": return"速冻组织";
            case "22": return"活体";
            case "23": return"RNAlater保存";
            case "24": return"Trlzol保存";
            case "20": return"其它";
            case "41": return "裂解液";
            case "42": return "液氮速冻";
            case "40": return "其它";
            default: return null;
        }
    }

    public static String getCellsortFlag(String cellsort) {
        if (StringUtils.isEmpty(cellsort)){
            return null;
        }
        switch (cellsort){
            case "01": return "过筛网";
            case "02": return "磁珠分选";
            case "03": return "口吸管法";
            case "04": return "BD流式分选";
            case "05": return "NanoCellect 流式分选";
            default: return null;
        }
    }

    public static String getDatabaseFlag(String databasetype) {
        if (StringUtils.isEmpty(databasetype)){
            return null;
        }
        switch (databasetype){
            case "01": return "DNA常规小片段";
            case "02": return "DNA非常规小片段";
            case "03": return "人外显子";
            case "04": return "PCR-free文库";
            case "05": return "真核普通转录组";
            case "06": return "真核链特异性";
            case "07": return "LncRNA";
            case "21": return "10X单细胞转录组";
            case "34": return "10X VDJ";
            case "22": return "10X空间转录组";
            case "23": return "10X ATAC";
            case "24": return "smart-seq";
            case "25": return "ATAC";
            case "26": return "HI-C";
            case "27": return "DNA常规小片段";
            case "28": return "DNA非常规小片段";
            case "29": return "人外显子";
            case "30": return "PCR-free文库";
            case "31": return "真核普通转录组";
            case "32": return "真核链特异性";
            case "33": return "LncRNA";
            case "35": return "WGS";
            case "41": return "10X单细胞转录组";
            case "42": return "10X ATAC";
            case "43": return "smart-seq";
            case "44": return "ATAC";
            case "45": return "HI-C";
            case "46": return "10X VDJ";

            default:return null;
        }
    }

    public static String getSeqFlag(String sequencingplatform) {
        if (StringUtils.isEmpty(sequencingplatform)){
            return null;
        }
        switch (sequencingplatform){
            case "01": return "Hiseq-SE50";
            case "02": return "Hiseq-PE150";
            case "03": return "Hiseq-PE250";
            case "00": return "其它";
            default : return null;
        }
    }

    public static Object getExtractFlag(String extractmethod) {
        if (StringUtils.isEmpty(extractmethod)){
            return null;
        }
        switch (extractmethod){
            case "01":
                return "柱提法";
            case "02":
                return "磁珠提法";
            case "00":
                return "其它";
            default:
                return null;
        }
    }

    public static Object getCheckResultFlag(String checkresult) {
        if (StringUtils.isEmpty(checkresult)){
            return null;
        }
        switch (checkresult){
            case "01":
                return "合格";
            case "02":
                return "风险";
            case "03":
                return "不合格";
            default:
                return null;
        }
    }

    public static String getExtractCode(String extract) {
        if (StringUtils.isEmpty(extract)){
            return null;
        }
        switch (extract){
            case "柱提法":
                return "01";
            case "磁珠提法":
                return "02";
            case "其它":
                return "00";
            default:
                return null;
        }
    }

    public static String getCheckResultCode(String checkResult) {
        if (StringUtils.isEmpty(checkResult)){
            return null;
        }
        switch (checkResult){
            case "合格":
                return "01";
            case "风险":
                return "02";
            case "不合格":
                return "03";
            default:
                return null;
        }
    }
}
