package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrBillMonthMapper;
import com.cibr.animal.demo.dao.CibrConfigPriceMapper;
import com.cibr.animal.demo.dao.CibrConfigSelectMapper;
import com.cibr.animal.demo.dao.CibrTaskProcessPriceMapper;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.scheduled.ScheduleHandle;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class BillService {

    @Autowired
    private CibrBillMonthMapper billMonthMapper;

    @Autowired
    private CibrConfigPriceMapper priceMapper;

    @Autowired
    private CibrConfigSelectMapper selectMapper;

    @Autowired
    private FileService fileService;

    @Autowired
    private ScheduleHandle scheduleHandle;

    public List<CibrConfigPrice> getPriceUnit() {
        CibrConfigPriceExample priceExample = new CibrConfigPriceExample();
        priceExample.setOrderByClause("priceName");
        List<CibrConfigPrice> prices = priceMapper.selectByExample(priceExample);
        return prices;
    }

    @Transactional(rollbackFor = Exception.class)
    public void updatePrice(CibrConfigPrice price, CibrSysUser user) {
        priceMapper.updateByPrimaryKey(price);
    }


    /**
     * 获取当前月份账单
     *
     * @param currentMonth
     * @return
     */
    public List<CibrBillMonth> getCurrentMonthBills(String currentMonth) {
        CibrBillMonthExample monthExample = new CibrBillMonthExample();
        monthExample.createCriteria().andBelongmonEqualTo(currentMonth).andBillstatuNotEqualTo("09");
        monthExample.setOrderByClause("groupName,projectName");
        List<CibrBillMonth> bills = billMonthMapper.selectByExample(monthExample);
        return bills;
    }

    public List<Map<String,String>>  findLibtypes() {

        Map<String, Map<String, String>> selectConfig = fileService.getSelectConfig();
        Map<String, String> select_name_uuid = selectConfig.get("name_uuid");
        Map<String, String> select_uuid_name = selectConfig.get("uuid_name");

        CibrConfigSelectExample selectExample = new CibrConfigSelectExample();
        selectExample.createCriteria().andSelecttypeEqualTo("database");

        List<CibrConfigSelect> selects = selectMapper.selectByExample(selectExample);
        List<Map<String,String>> retList = new ArrayList<>();
        for (CibrConfigSelect select : selects){
            Map<String,String> map = new HashMap<>();
            map.put("key",select.getId());
            map.put("id", select.getId());
            map.put("name", select_uuid_name.get(select.getParentid()) + "_" + select.getName());
            retList.add(map);
        }
        return retList;
    }

    public String addNewPrice(CibrConfigPrice price, CibrSysUser user) {
        price.setId(Util.getUUID());
        price.setCreater(user.getId());
        price.setCreatetime(new Date());
        priceMapper.insert(price);
        return "success";
    }

    @Transactional(rollbackFor = Exception.class)
    public String regenerateBill(String currentMonth, CibrSysUser user) throws Exception {
        CibrBillMonthExample monthExample = new CibrBillMonthExample();
        monthExample.createCriteria().andBelongmonEqualTo(currentMonth);
        List<CibrBillMonth> bills = billMonthMapper.selectByExample(monthExample);
        if (bills != null && bills.size() > 0){
            bills.forEach(bill ->{
                bill.setBillstatu("09");
                bill.setUpdateuser(user.getId());
                bill.setUpdatetime(new Date());
            });
        }
        scheduleHandle.makeBill(currentMonth,user.getId());
        return "success";
    }
}
