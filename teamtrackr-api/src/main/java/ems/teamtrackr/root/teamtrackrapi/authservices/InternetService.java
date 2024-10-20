package ems.teamtrackr.root.teamtrackrapi.authservices;

import java.io.IOException;
import java.net.InetAddress;

import org.springframework.stereotype.Service;

@Service
public class InternetService {

	
	public boolean isInternetReachable()
	{
		try {
			InetAddress iNetAddress = InetAddress.getByName("www.google.com");
			return iNetAddress.isReachable(5000);
		}
		catch(IOException e){
			return false;
		}
	}
}
