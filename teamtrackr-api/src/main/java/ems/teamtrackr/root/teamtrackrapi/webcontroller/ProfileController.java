package ems.teamtrackr.root.teamtrackrapi.webcontroller;

import java.util.List;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ems.teamtrackr.root.teamtrackrapi.authservices.InternetService;
import ems.teamtrackr.root.teamtrackrapi.empdataservice.AdminProfileService;
import ems.teamtrackr.root.teamtrackrapi.empdataservice.EmpDataService;

@Controller
public class ProfileController {

	@Autowired
	AdminProfileService service;
	
	@Autowired
	InternetService internetservice;
	
	@Autowired
	EmpDataService dataService;
	
	@RequestMapping(value="/profile",method=RequestMethod.GET)
	public String showProfile(@RequestParam String uid,ModelMap map) throws InterruptedException, ExecutionException
	{
		if(internetservice.isInternetReachable())
		{
		List<Object> profiledetail=service.loadProfile(uid);
		List<Object> companys 	= (List<Object>) dataService.showcompany();
		List<Object> departments 	= (List<Object>) dataService.showDepartments();
		List<Object> designations 	= (List<Object>) dataService.showdesignation();
		map.put("pdetail",profiledetail);
		map.put("companys", companys);
		map.put("departments", departments);
		map.put("designations", designations);
		}
		return "Admin/profile";
	}
	
	
	
}
