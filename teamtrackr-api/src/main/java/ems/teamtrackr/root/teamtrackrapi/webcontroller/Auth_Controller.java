package ems.teamtrackr.root.teamtrackrapi.webcontroller;

import java.util.concurrent.ExecutionException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import ems.teamtrackr.root.teamtrackrapi.authservices.Firebase_Authservice;
import jakarta.servlet.http.HttpSession;


@Controller
@SessionAttributes(names={"name","adminprofile"})

public class Auth_Controller {

	//Injecting service instance to Firebase_Authservice class
	Firebase_Authservice service; 
	
	public Auth_Controller(Firebase_Authservice service) {
		super();
		this.service = service;
	}

	//Login controller
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String showLogin1(HttpSession session)
	{
		
		if(service.isInternetReachable())
		{
			if(service.isAuthenticated())
			{
				return "Admin/dashboard";
			}
			else
			{
				return "index";	
			}
		}
		return "Admin/isConnected";
		
	}

	@RequestMapping(value="/",method=RequestMethod.POST)
	public String implLogin2(@RequestParam String username, @RequestParam String password,ModelMap map) throws InterruptedException, ExecutionException
	{
		if(service.signInWithEmailAndPassword(username, password))
		{
			map.put("name", username);
			map.put("adminprofile",service.getProfileImage(username).toString());
			
			return "Admin/dashboard";
		}
		return "index";
	}
	
	
	//Dashboard controller
	@RequestMapping(value="/dashboard",method=RequestMethod.GET)
	public String showDashboard()
	{
		if(service.isAuthenticated())
		{
		return "Admin/dashboard";
		}
		return "redirect:/";			
	}
	
	//Logout
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String makeLogout()
	{
		if(service.logout())
		{
			return "redirect:/";
		}
		return "redirect:dashboard";
	}
}
