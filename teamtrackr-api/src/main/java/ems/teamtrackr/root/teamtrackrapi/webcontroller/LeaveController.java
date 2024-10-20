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

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.firebase.cloud.FirestoreClient;

import ems.teamtrackr.root.teamtrackrapi.authservices.InternetService;
import ems.teamtrackr.root.teamtrackrapi.empdataservice.EmpLeaveService;

@Controller
public class LeaveController {

	@Autowired
	EmpLeaveService service;
	
	@Autowired
	InternetService internetservice;
	
	@RequestMapping(value="/employeeLeave",method=RequestMethod.GET)
	public String showEmployeeLeave(ModelMap map) throws InterruptedException, ExecutionException
	{
		if(internetservice.isInternetReachable())
		{
		List<Object> leavetype=service.loadLeaveType();
		List<Object> empleaves=service.loadEmpLeave();
		map.put("empleaves", empleaves);
		map.put("leavetypes", leavetype);
		}
		return "Admin/employeeleave";
	}
	
	@RequestMapping(value="/editemployeeLeave",method=RequestMethod.POST)
	public String editEmployeeLeave(@RequestParam String docid,@RequestParam String leavetype,@RequestParam String from,@RequestParam String to,@RequestParam String leavestatus,@RequestParam String remainingleave,@RequestParam String leavereason) throws InterruptedException, ExecutionException
	{
		if(internetservice.isInternetReachable())
		{
		service.editEmployeeLeaves(docid,leavetype,from,to,leavestatus,remainingleave,leavereason);
		}
		return "redirect:employeeLeave";
	}
	
	@RequestMapping(value="/deleteemployeeLeave",method=RequestMethod.GET)
	public String deleteEmployeeLeave(@RequestParam String docid) throws InterruptedException, ExecutionException
	{
		if(internetservice.isInternetReachable())
		{
		service.deleteEmployeeLeaves(docid);
		}
		return "redirect:employeeLeave";
	}
	
	
	
	@RequestMapping(value="/leavesettings",method=RequestMethod.GET)
	public String showLeaveSettings(ModelMap map) throws InterruptedException, ExecutionException
	{
		if(internetservice.isInternetReachable())
		{

		List<Object> allleavetype=service.loadLeaveType();
		map.put("allleavetypes",allleavetype);
	map.put("totalleave",service.getTotalLeave());
		}
		return "Admin/LeaveSettings";
	}
	
	@RequestMapping(value="/leavesettings",method=RequestMethod.POST)
	public String addLeaveType(@RequestParam String leavetype) throws IOException, InterruptedException, ExecutionException
	{
		if(internetservice.isInternetReachable())
		{
		service.addLeaveType(leavetype);
		}
		return "redirect:leavesettings";
		
	}
	
	@RequestMapping(value="/editleavetype",method=RequestMethod.POST)
	public String editLeaveType(@RequestParam String leavetypeid,@RequestParam String leavetypename) throws InterruptedException, ExecutionException
	{
		if(internetservice.isInternetReachable())
		{
		service.editLeaveType(leavetypeid,leavetypename);
		}
		return "redirect:leavesettings";
	}
	
	@RequestMapping(value="/deleteleavetype",method=RequestMethod.GET)
	public String deleteLeaveType(@RequestParam String leavetypeid) throws InterruptedException, ExecutionException
	{
		if(internetservice.isInternetReachable())
		{
		service.deleteLeaveType(leavetypeid);
		}
		return "redirect:leavesettings";
	}
	
	@RequestMapping(value="/totalleave",method=RequestMethod.POST)
	public String totalLeave(@RequestParam String totalleave) throws InterruptedException, ExecutionException
	{
		if(internetservice.isInternetReachable())
		{
		service.editTotalLeave(totalleave);
		}
		return "redirect:leavesettings";
	}
	
}
