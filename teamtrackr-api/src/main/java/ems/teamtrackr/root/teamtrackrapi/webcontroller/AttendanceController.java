package ems.teamtrackr.root.teamtrackrapi.webcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AttendanceController {

	@RequestMapping(value="/attendance",method=RequestMethod.GET)
	public String showEmployeeLeave()
	{
		return "Admin/attendance";
	}
	
}
