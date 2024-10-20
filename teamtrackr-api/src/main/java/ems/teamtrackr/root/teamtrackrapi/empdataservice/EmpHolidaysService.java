package ems.teamtrackr.root.teamtrackrapi.empdataservice;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.concurrent.ExecutionException;

import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;

@Service
public class EmpHolidaysService {

	
	Firestore db;
	
	
	File_Input_Output_Service fileService;
	
	public EmpHolidaysService(File_Input_Output_Service fileService) {
		super();
		this.fileService = fileService;
	}

	public void addHoliDays(String holidayname, String holidaydate) throws IOException, InterruptedException, ExecutionException {
		
		int hid=fileService.managefileIncrement("holidayid.txt");
		
		db=FirestoreClient.getFirestore();
		DocumentReference ref=db.collection("HoliDays").document();
		Map<String,Object> maplist=new HashMap<String,Object>();
		maplist.put("HolidayId",hid);
		maplist.put("HolidayName",holidayname);
		maplist.put("HolidayDate",holidaydate);
		ref.set(maplist).get();
	}

	public List<Object> loadHoliDays() throws InterruptedException, ExecutionException {
	
		db=FirestoreClient.getFirestore(); 
		List<Object> holiday = new ArrayList<Object>();
	        ApiFuture<QuerySnapshot> documents = db.collection("HoliDays").orderBy("HolidayId").get();
	        List<QueryDocumentSnapshot> holidays = documents.get().getDocuments();
	        for (QueryDocumentSnapshot document : holidays) {
	            Map<String, Object> holidaydata = new HashMap<>(document.getData());
	            holiday.add(holidaydata);
	        }
	        return holiday;
	}

	public void editHoliDays(String holidayid,String holidayname, String holidaydate) throws InterruptedException, ExecutionException {
		// TODO Auto-generated method stub
		db=FirestoreClient.getFirestore();
		com.google.cloud.firestore.Query query=db.collection("HoliDays").whereEqualTo("HolidayId",Integer.parseInt(holidayid));
		ApiFuture<QuerySnapshot> future=query.get();
		
		for(QueryDocumentSnapshot document : future.get().getDocuments())
		{
			DocumentReference docRef=document.getReference();
			ApiFuture<WriteResult> write = docRef.update("HolidayName",holidayname,"HolidayDate",holidaydate);
		} 
	}

	public void deleteHoliDays(String holidayid) {
		 db=FirestoreClient.getFirestore();
			com.google.cloud.firestore.Query query=db.collection("HoliDays").whereEqualTo("HolidayId",Integer.parseInt(holidayid));
			ApiFuture<QuerySnapshot> querySnapshot=query.get();
			
			try {
				List<QueryDocumentSnapshot> document=querySnapshot.get().getDocuments();
				if(!document.isEmpty())
				{	
					fileService.managefileDecrement("holidayid.txt");
					String docid=document.get(0).getId();
					DocumentReference ref=db.collection("HoliDays").document(docid);
					ref.delete();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
	}

	
	
}
