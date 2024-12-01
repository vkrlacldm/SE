package com.sp.yorizori.admin.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.mainCotroller")
public class MainController {
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String method() {
		return ".adminLayout";
	}
}
