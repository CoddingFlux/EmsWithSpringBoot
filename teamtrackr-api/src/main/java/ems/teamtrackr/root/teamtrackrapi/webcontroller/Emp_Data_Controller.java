package ems.teamtrackr.root.teamtrackrapi.webcontroller;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.firebase.auth.FirebaseAuthException;

import ems.teamtrackr.root.teamtrackrapi.authservices.Firebase_Authservice;
import ems.teamtrackr.root.teamtrackrapi.empdataservice.EmpDataService;

@Controller
public class Emp_Data_Controller {

	//Inject (EmpDataService)
	EmpDataService dataService;
	
	@Autowired
	public Emp_Data_Controller(EmpDataService dataService) {
		super();
		this.dataService = dataService;
	}
	
	@Autowired
	Firebase_Authservice service;
	
	


	//Show Employee
	@RequestMapping(value="/employees",method=RequestMethod.GET)
	public String employees(ModelMap map)
	{
				try {
			if(service.isInternetReachable())
			{
			List<Object> employees 	= (List<Object>) dataService.getAllEmployees();
			List<Object> companys 	= (List<Object>) dataService.showcompany();
			List<Object> departments 	= (List<Object>) dataService.showDepartments();
			List<Object> designations 	= (List<Object>) dataService.showdesignation();
			map.put("employees", employees);
			map.put("companys", companys);
			map.put("departments", departments);
			map.put("designations", designations);
		return "Admin/employees";
			}
			else {
				return "Admin/isConnected";
			}
		}
		catch(Exception e)
		{
			map.put("exception",e); 
			return "Admin/exception";
		}
		
	}

	//Sign Up Employee
	@RequestMapping(value="/employees",method=RequestMethod.POST)
	public String createEmployees(
			  @RequestParam String email,
			 
	            @RequestParam String password,
	            @RequestParam String fname,
	            @RequestParam String lname,
	            @RequestParam String uname,
	            @RequestParam String copassword,
	            @RequestParam String userrole,
	            @RequestParam String jodate,
	            @RequestParam long contact,
	            @RequestParam String company,
	            @RequestParam String deptname,
	            @RequestParam String designation,
	            @RequestParam("imageFile") MultipartFile imageFile,
	            ModelMap map
			)
	{
		
		try {
			if(service.isInternetReachable())
			{
			if(password.equals(copassword))
			{
             dataService.signUp(email, password,copassword,fname,lname,uname,userrole,jodate,contact,company,deptname,designation,imageFile);
            return "redirect:employees";
			}
			return "redirect:dashboard";
			}
			else
			{
				return "Admin/isConnected";
			}
        } catch (Exception e) {
        	map.put("exception", e);
            return "Admin/exception";
        }
		
	}
	
	
	//Update Employee
	@RequestMapping(value="/updateEmployee",method=RequestMethod.POST)
	public String updateEmployee(
			@RequestParam String email,
            @RequestParam String fname,
            @RequestParam String lname,
            @RequestParam String uname,
            @RequestParam String userrole,
            @RequestParam String jodate,
            @RequestParam long contact,
            @RequestParam String company,
            @RequestParam String deptname,
            @RequestParam String designation,
            @RequestParam("imageFile") MultipartFile imageFile,
            ModelMap maps
			) throws InterruptedException, ExecutionException, FirebaseAuthException, IOException
	{
		try {
			if(service.isInternetReachable())
			{
			dataService.updateEmployeeByEmail(email,fname,lname,uname,userrole,jodate,contact,company,deptname,designation,imageFile);
			//dataService.updateEmployeeByEmail(email,"Hello","One","two","1-2-3",478738237,"ooo","yyay","kkkk",imageFile);
			return "redirect:employees";
			}
			else
			{
				return "Admin/isConnected";
			}
			
		}
		catch(Exception e)
		{
			maps.put("exception",e); 
			return "Admin/exception";
		}
		}
	
	//Delete Employee
	@RequestMapping(value="/deleteEmployee",method=RequestMethod.GET)
	public String deleteEmployee(@RequestParam String empid,@RequestParam String email,ModelMap map) throws InterruptedException, ExecutionException
	{
		try {
		if(service.isInternetReachable()) {
		dataService.deleteEmployeeByEmpId(empid,email);
		return "redirect:employees";
		}
	else
	{
		return "Admin/isConnected";
	}
		}
		catch(Exception e)
		{
			map.put("exception",e); 
			return "Admin/exception";
		}
	}

	
	//Add/update/delete/select Company 
	
	@RequestMapping(value="/company",method=RequestMethod.GET)
	public String showCompany(ModelMap map) throws InterruptedException, ExecutionException 
	{
		try {
		if(service.isInternetReachable()) {
			
		List<Object> data=dataService.showcompany();
		map.put("companys",data);
		return "Admin/company";
			
	}
	else
	{
		return "Admin/isConnected";
	}
		}
		catch(Exception e)
		{
			map.put("exception",e); 
			return "Admin/exception";
		}
	}
	
	@RequestMapping(value="/company",method=RequestMethod.POST)
	public String addCompany(@RequestParam String company,ModelMap map) throws InterruptedException, ExecutionException, IOException 
	{
		try {
		if(service.isInternetReachable()) {
		dataService.addcompany(company);
		return "redirect:company";
	}
	else
	{
		return "Admin/isConnected";
	}
		}
		catch(Exception e)
		{
			map.put("exception",e); 
			return "Admin/exception";
		}
	}
	
	@RequestMapping(value="/editCompany",method=RequestMethod.POST)
	public String editCompany(@RequestParam String companyid,@RequestParam String companyname,ModelMap map) throws InterruptedException, ExecutionException
	{
		try {
		if(service.isInternetReachable())
		{
		dataService.editcompany(companyid,companyname);
		return "redirect:company";
	}
	else
	{
		return "Admin/isConnected";
	}
		}
		catch(Exception e)
		{
			map.put("exception",e); 
			return "Admin/exception";
		}
	}
	
	@RequestMapping(value="/deleteCompany",method=RequestMethod.GET)
	public String deleteCompany(@RequestParam String companyid,ModelMap map) throws InterruptedException, ExecutionException
	{
		try {
		if(service.isInternetReachable()) {
		dataService.deletecompany(companyid);
		return "redirect:company";
	}
	else
	{
		return "Admin/isConnected";
	}
		}
		catch(Exception e)
		{
			map.put("exception",e); 
			return "Admin/exception";
		}
	}

	
	
	//Add/update/delete/select department
	
	@RequestMapping(value="/department",method=RequestMethod.GET)
	public String showDepartments(ModelMap map) throws InterruptedException, ExecutionException 
	{
		try {
		if(service.isInternetReachable()) {
		List<Object> data=dataService.showDepartments();
		map.put("departments",data);
		return "Admin/departments";
	}
	else
	{
		return "Admin/isConnected";
	}
		}
		catch(Exception e)
		{
			map.put("exception",e); 
			return "Admin/exception";
		}
	}
	
	@RequestMapping(value="/department",method=RequestMethod.POST)
	public String addDepartments(@RequestParam String department,ModelMap map) throws InterruptedException, ExecutionException, IOException 
	{
		try {
		if(service.isInternetReachable()) {
		dataService.addDepartments(department);
		return "redirect:department";
		}
		else
		{
			return "Admin/isConnected";
		}
		}
		catch(Exception e)
		{
			map.put("exception",e); 
			return "Admin/exception";
		}
	}
	
	@RequestMapping(value="/editDepartment",method=RequestMethod.POST)
	public String editDepartment(@RequestParam String departmentid,@RequestParam String departmentname,ModelMap map) throws InterruptedException, ExecutionException
	{
		try {
		if(service.isInternetReachable())
		{
		dataService.editDepartment(departmentid,departmentname);
		return "redirect:department";
		}
		else
		{
			return "Admin/isConnected";
		}
		}
		catch(Exception e)
		{
			map.put("exception",e); 
			return "Admin/exception";
		}
		}
	
	@RequestMapping(value="/deleteDepartment",method=RequestMethod.GET)
	public String deleteDepartment(@RequestParam String departmentid,ModelMap map) throws InterruptedException, ExecutionException
	{
		try {
		if(service.isInternetReachable()) {
		dataService.deleteDepartment(departmentid);
		return "redirect:department";
		}
		else
		{
			return "Admin/isConnected";
		}
		}
		catch(Exception e)
		{
			map.put("exception",e); 
			return "Admin/exception";
		}
	}
	
	
	//Add/update/delete/select designation 
	
		@RequestMapping(value="/designation",method=RequestMethod.GET)
		public String showDesignation(ModelMap map) throws InterruptedException, ExecutionException 
		{
			try {
			if(service.isInternetReachable()) {
			List<Object> data=dataService.showdesignation();
			map.put("designations",data);
			return "Admin/designation";
			}
			else
			{
				return "Admin/isConnected";
			}
			}
			catch(Exception e)
			{
				map.put("exception",e); 
				return "Admin/exception";
			}
		}
		
		@RequestMapping(value="/designation",method=RequestMethod.POST)
		public String addDesignation(@RequestParam String designation,ModelMap map) throws InterruptedException, ExecutionException, IOException 
		{
			try {
			if(service.isInternetReachable()) {
			dataService.adddesignation(designation);
			return "redirect:designation";
			}
			else
			{
				return "Admin/isConnected";
			}
			}
			catch(Exception e)
			{
				map.put("exception",e); 
				return "Admin/exception";
			}
		}
		
		@RequestMapping(value="/editDesignation",method=RequestMethod.POST)
		public String editDesignation(@RequestParam String designationid,@RequestParam String designationname,ModelMap map) throws InterruptedException, ExecutionException
		{
			try {
			if(service.isInternetReachable())
			{
			dataService.editdesignation(designationid,designationname);
			return "redirect:designation";
			}
			else
			{
				return "Admin/isConnected";
			}
			}
			catch(Exception e)
			{
				map.put("exception",e); 
				return "Admin/exception";
			}
		}
		
		@RequestMapping(value="/deleteDesignation",method=RequestMethod.GET)
		public String deleteDesignation(@RequestParam String designationid,ModelMap map) throws InterruptedException, ExecutionException
		{
			try {
			if(service.isInternetReachable())
			{
			dataService.deletedesignation(designationid);
			return "redirect:designation";
			}
			else
			{
				return "Admin/isConnected";
			}
			}
			catch(Exception e)
			{
				map.put("exception",e); 
				return "Admin/exception";
			}
		}

	
	
}
