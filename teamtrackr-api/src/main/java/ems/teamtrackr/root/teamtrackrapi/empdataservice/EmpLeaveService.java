package ems.teamtrackr.root.teamtrackrapi.empdataservice;

import java.io.File;
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
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.WriteResult;
import com.google.common.util.concurrent.MoreExecutors;
import com.google.firebase.cloud.FirestoreClient;

@Service
public class EmpLeaveService {

	String uemail="";
	Firestore db;
	
	File_Input_Output_Service fileService;
	
	public EmpLeaveService(File_Input_Output_Service fileService) {
		super();
		this.fileService = fileService;
	}
	
	public List<Object> loadEmpLeave() throws InterruptedException, ExecutionException {
		db=FirestoreClient.getFirestore(); 
		List<Object> leaves = new ArrayList<>();
	        ApiFuture<QuerySnapshot> documents = db.collection("EmployeeLeaves").orderBy("LeaveStatus").get();
	        List<QueryDocumentSnapshot> empleaves = documents.get().getDocuments();
	        for (QueryDocumentSnapshot document : empleaves) {
	            String uid = document.getString("UserId");
	            String userEmail = getEmailid(uid);
	            String docid=document.getId();
	            // Assuming you want to include email along with leave data
	            Map<String, Object> leaveData = new HashMap<>(document.getData());
	            leaveData.put("Email", userEmail);
	            leaveData.put("DocId",docid);
	            leaves.add(leaveData);
	        }
	        return leaves;
	}
	private String getEmailid(String uid) throws InterruptedException, ExecutionException {
		 DocumentReference docRef = db.collection("Employees").document(uid);
	        ApiFuture<DocumentSnapshot> future = docRef.get();
	        DocumentSnapshot empSnapshot = future.get();
	        if (empSnapshot.exists()) {
	            return empSnapshot.getString("EmailId");
	        } else {
	            return "Null"; // Or handle this case as per your requirement
	        }
	}
	
	public String getTotalLeave() {
		Firestore db=FirestoreClient.getFirestore();
	    // Assuming db is your Firestore instance
	    ApiFuture<QuerySnapshot> query = db.collection("TotalLeave").whereEqualTo("TotalLeaveId", 1).get();
	    try {
	        List<QueryDocumentSnapshot> documents = query.get().getDocuments();
	        if (!documents.isEmpty()) {
	            QueryDocumentSnapshot snapshot = documents.get(0);
	            String empSnapshotId = snapshot.getId();
	            DocumentSnapshot empSnapshot = db.collection("TotalLeave").document(empSnapshotId).get().get();

	            if (empSnapshot.exists()) {
	                return empSnapshot.get("TotalLeaveNumber").toString();
	            } else {
	                return "Null"; // Or handle this case as per your requirement
	            }
	        } else {
	            return "Null"; // No documents found with the specified criteria
	        }
	    } catch (InterruptedException | ExecutionException e) {
	        e.printStackTrace(); // Handle the exception as per your application's requirements
	        return "Error"; // Or return an appropriate error message
	    }
	}
	
	
	

	public void editEmployeeLeaves(String docid, String leavetype, String from, String to, String leavestatus,
			String remainingleave, String leavereason) {
		// TODO Auto-generated method stub
		db=FirestoreClient.getFirestore();
		DocumentReference docref	=db.collection("EmployeeLeaves").document(docid);
		
		Map<String, Object> updates = new HashMap<>();
	    updates.put("LeaveType", leavetype);
	    updates.put("FromDate", from);
	    updates.put("ToDate", to);
	    updates.put("LeaveStatus", leavestatus);
	    updates.put("RemainingLeaves", remainingleave);
	    updates.put("LeaveReason", leavereason);
	    	
		ApiFuture<WriteResult> future=docref.update(updates);
		future.addListener(()-> {System.out.println("update Successfull");},MoreExecutors.directExecutor());
	}
	
	
	
	public void addLeaveType(String leavetype) throws IOException, InterruptedException, ExecutionException {
		
		int ltypeid=fileService.managefileIncrement("leavetypeid.txt");
		
		Firestore db=FirestoreClient.getFirestore();
		DocumentReference ref=db.collection("LeaveType").document();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("LeaveTypeId".trim(),ltypeid);
		map.put("LeaveTypeName",leavetype);
		ref.set(map).get();
	}
	
	
	public List<Object> loadLeaveType() throws InterruptedException, ExecutionException {
		
		db=FirestoreClient.getFirestore(); 
		List<Object> leaves = new ArrayList<>();
	        ApiFuture<QuerySnapshot> documents = db.collection("LeaveType").orderBy("LeaveTypeId").get();
	        List<QueryDocumentSnapshot> leavetype = documents.get().getDocuments();
	        for (QueryDocumentSnapshot document : leavetype) {
	            Map<String, Object> leaveData = new HashMap<>(document.getData());
	            leaves.add(leaveData);
	        }
	        return leaves;
	}
	public void editLeaveType(String leavetypeid, String leavetypename) throws InterruptedException, ExecutionException {
		// TODO Auto-generated method stub
		db=FirestoreClient.getFirestore();
		com.google.cloud.firestore.Query query=db.collection("LeaveType").whereEqualTo("LeaveTypeId",Integer.parseInt(leavetypeid));
		ApiFuture<QuerySnapshot> future=query.get();
		
		for(QueryDocumentSnapshot document : future.get().getDocuments())
		{
			DocumentReference docRef=document.getReference();
			ApiFuture<WriteResult> write = docRef.update("LeaveTypeName",leavetypename);
		}
	}
	public void deleteLeaveType(String leavetypeid) {
		// TODO Auto-generated method stub
		 db=FirestoreClient.getFirestore();
			com.google.cloud.firestore.Query query=db.collection("LeaveType").whereEqualTo("LeaveTypeId",Integer.parseInt(leavetypeid));
			ApiFuture<QuerySnapshot> querySnapshot=query.get();
			
			try {
				List<QueryDocumentSnapshot> document=querySnapshot.get().getDocuments();
				if(!document.isEmpty())
				{
					fileService.managefileDecrement("leavetypeid.txt");
					String docid=document.get(0).getId();
					DocumentReference ref=db.collection("LeaveType").document(docid);
					ref.delete();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}

	}
	public void editTotalLeave(String totalleave) throws InterruptedException, ExecutionException {
		db=FirestoreClient.getFirestore();
		com.google.cloud.firestore.Query query=db.collection("TotalLeave").whereEqualTo("TotalLeaveId",1);
		ApiFuture<QuerySnapshot> future=query.get();
		
		for(QueryDocumentSnapshot document : future.get().getDocuments())
		{
			DocumentReference docRef=document.getReference();
			ApiFuture<WriteResult> write = docRef.update("TotalLeaveNumber",Integer.parseInt(totalleave));
		}	
	}
	public void deleteEmployeeLeaves(String docid) {
		// TODO Auto-generated method stub
		 db=FirestoreClient.getFirestore();
			DocumentReference ref=db.collection("EmployeeLeaves").document(docid);
			
			try {
				if(ref!=null)
				{
					ref.delete();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}

	}
	
	
	
	
	
	
}
