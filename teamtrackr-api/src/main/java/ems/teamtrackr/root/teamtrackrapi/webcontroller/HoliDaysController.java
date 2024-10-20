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

import ems.teamtrackr.root.teamtrackrapi.authservices.InternetService;
import ems.teamtrackr.root.teamtrackrapi.empdataservice.EmpHolidaysService;

@Controller
public class HoliDaysController {
	
		@Autowired
		EmpHolidaysService service;
		
		@Autowired
		InternetService internetservice;
		
		@RequestMapping(value="holidays",method=RequestMethod.GET)
		public String showHollyDays(ModelMap map) throws InterruptedException, ExecutionException
		{
			if(internetservice.isInternetReachable())
			{
			List<Object> holiday=service.loadHoliDays();
			map.put("holidaylist", holiday);
			}
			return "Admin/holidays";
			
		}
		
		@RequestMapping(value="holidays",method=RequestMethod.POST)
		public String addHollyDays(@RequestParam String holidayname,@RequestParam String holidaydate) throws IOException, InterruptedException, ExecutionException
		{
			if(internetservice.isInternetReachable())
			{
			service.addHoliDays(holidayname,holidaydate);
			}
			return "redirect:holidays";
		}
		
		@RequestMapping(value="editholiday",method=RequestMethod.POST)
		public String editHollyDays(@RequestParam String holidayid,@RequestParam String holidayname,@RequestParam String holidaydate) throws IOException, InterruptedException, ExecutionException
		{
			if(internetservice.isInternetReachable())
			{
			service.editHoliDays(holidayid,holidayname,holidaydate);
			}
			return "redirect:holidays";
		}
		
		
		@RequestMapping(value="deleteholiday",method=RequestMethod.GET)
		public String deleteHollyDays(@RequestParam String holidayid) throws IOException, InterruptedException, ExecutionException
		{
			if(internetservice.isInternetReachable())
			{
			service.deleteHoliDays(holidayid);
			}
			return "redirect:holidays";
			}
		
		

	
}
