package com.cibr.animal.demo.service;

import com.cibr.animal.demo.entity.CibrTaskProcessSampleinput;
import com.cibr.animal.demo.util.FileUtil;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Service
public class FileService {
    public List<CibrTaskProcessSampleinput> handleSampleInput(List<List<String>> rows, MultipartFile file) {
        String fileName = file.getOriginalFilename();
        List<CibrTaskProcessSampleinput> list = new ArrayList<CibrTaskProcessSampleinput>();
        for (List<String> row : rows){
            CibrTaskProcessSampleinput input = new CibrTaskProcessSampleinput();
            input.setSamplename(row.get(0));
            input.setSpecies(row.get(1));
            input.setTissue(row.get(2));
            input.setSamplemsg(row.get(3));
            input.setSamplestatu(row.get(4));
            if (fileName != null && fileName.contains(FileUtil.TISSUE_FILENAME)){
                input.setTissuenumber(row.get(5));
                input.setBloodvolume(row.get(6));
            }
            if (fileName != null && !fileName.contains(FileUtil.TISSUE_FILENAME)){
                input.setConcentration(row.get(7));
                input.setSamplevolume(row.get(8));
                input.setTotalnumber(row.get(9));
            }
            if (fileName != null && fileName.contains(FileUtil.CELL_FILENAME)){
                input.setCelllife(row.get(10));
                input.setCellsort(row.get(11));
            }
            input.setDatabasetype(row.get(12));
            input.setSequencingplatform(row.get(13));
            input.setRemarks(row.get(14));
            list.add(input);
        }
        return list;
    }
}
