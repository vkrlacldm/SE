package com.sp.yorizori.admin.chefManage.sales;

import java.util.List;
import java.util.Map;

public interface SalesService {
	public int dataCount(Map<String, Object> map);
	public List<Sales> listSales(Map<String, Object> map);

}
