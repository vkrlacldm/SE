package com.sp.yorizori.admin.chefManage.sales;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.yorizori.common.MyUtil;

@Controller("admin.sales.salesController")
@RequestMapping("/admin/sales/*")
public class SalesController {
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list() throws Exception {
		
		return ".admin.sales.list";
	}
	
}
