package com.husky.shopapp.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author husky
 * @date 2019/4/1 16:25
 */
public class OrderUtil {
    public static String getOrderId(){
        Date curDate = new Date();
        String dateStr4yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss").format(curDate);
        String randomStr = RandomUtil.generateStr(4);
        String dateStr4SSS = new SimpleDateFormat("SSS").format(curDate);
        return dateStr4yyyyMMddHHmmss+randomStr+dateStr4SSS;
    }


}
