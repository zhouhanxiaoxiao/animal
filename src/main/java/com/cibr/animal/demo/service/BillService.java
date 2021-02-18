package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrBillMonthMapper;
import com.cibr.animal.demo.dao.CibrTaskProcessPriceMapper;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service
public class BillService {

    @Autowired
    CibrTaskProcessPriceMapper priceMapper;

    @Autowired
    CibrBillMonthMapper billMonthMapper;

    public List<CibrTaskProcessPrice> getPriceUnit() {
        CibrTaskProcessPriceExample ex = new CibrTaskProcessPriceExample();
        ex.setOrderByClause("pricename desc");
        List<CibrTaskProcessPrice> prices = priceMapper.selectByExample(ex);
        return prices;
    }

    @Transactional(rollbackFor = Exception.class)
    public void updatePrice(CibrTaskProcessPrice price, CibrSysUser user) {
        if (StringUtils.isEmpty(price.getId())){
            price.setId(Util.getUUID());
            price.setCreater(user.getId());
            price.setCreatetime(new Date());
            priceMapper.insert(price);
        }else {
            price.setUpdater(user.getId());
            price.setUpdatetime(new Date());
            priceMapper.updateByPrimaryKey(price);
        }
    }


    /**
     * 获取当前月份账单
     *
     * @param currentMonth
     * @return
     */
    public List<CibrBillMonth> getCurrentMonthBills(String currentMonth) {
        CibrBillMonthExample monthExample = new CibrBillMonthExample();
        monthExample.createCriteria().andBelongmonthEqualTo(currentMonth);
        List<CibrBillMonth> bills = billMonthMapper.selectByExample(monthExample);
        return bills;
    }
}
