package ems.teamtrackr.root.teamtrackrapi.empdataservice;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.UUID;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.ssl.SslProperties.Bundles;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.api.core.ApiFuture;
import com.google.api.core.ApiFutures;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.FirestoreOptions;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.SetOptions;
import com.google.cloud.firestore.WriteResult;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import com.google.firebase.cloud.FirestoreClient;
import com.google.firebase.cloud.StorageClient;
import com.google.firebase.database.Query;


@Service
public class  EmpDataService {
	
	
File_Input_Output_Service fileService;
	
	public EmpDataService(File_Input_Output_Service fileService) {
		super();
		this.fileService = fileService;
	}
	
	//Add Employee
	public void signUp(String email,String password,String copassword,String fname,String lname,String uname,String userrole,String date,long contact,String coname,String deptname,String designation,MultipartFile imageFile) throws FirebaseAuthException, InterruptedException, ExecutionException, IOException 
	{
	
	UserRecord.CreateRequest request = new UserRecord.CreateRequest()
			.setEmail(email)
			.setPassword(password);
	UserRecord userRecord = FirebaseAuth.getInstance().createUser(request);
	
	String imageUrl=uploadImageToStorage(imageFile);
	
	Firestore db=FirestoreClient.getFirestore();
	DocumentReference docRef = db.collection("Employees").document(userRecord.getUid());
	
	String GeneratedEmpId="EMP-"+generateEmployeeId();
//	int tempcount=0;
	
	
	Map<String,Object> userData=new HashMap<String,Object>();
	userData.put("FirstName",fname);
	userData.put("LastName",lname);
	userData.put("UserName",uname);
	userData.put("EmailId",email);
	userData.put("EmployeeId",GeneratedEmpId.trim());	
//	do {
//	if(hasEmployee(GeneratedEmpId))
//	{
//		tempcount=1;
//		userData.put("EmployeeId",GeneratedEmpId);	
//	}
//	else {
//		GeneratedEmpId=generateEmployeeId();
//		tempcount=0;
//	}
//	}while(tempcount==0);
	
	userData.put("UserRole",userrole);
	userData.put("JoiningDate",date);
	userData.put("PhoneNumber",contact);
	userData.put("CompanyName",coname);
	userData.put("DepartmentName",deptname);
	userData.put("Designation",designation);
	userData.put("ImageUrl",imageUrl);
	//List<Employee_Info> userData=List.of(new Employee_Info("","","","","",1,Date.fromYearMonthDay(2023, 03, 03),223,"","",""));
	docRef.set(userData).get();
//	return userRecord.getUid();
		
	}
	
	//Generate Employee id
	public String generateEmployeeId() {
        String employeeId = UUID.randomUUID().toString().replace("-", "").substring(0, 10); // Generate a random UUID and extract a substring
        return employeeId;
    }
	
//	public boolean hasEmployee(String eid)
//	{
//		 Firestore db = FirestoreClient.getFirestore();
//		    com.google.cloud.firestore.Query query = db.collection("Employees").whereEqualTo("EmployeeId", eid);
//		    try {
//		        ApiFuture<QuerySnapshot> querySnapshot = query.get();
//		        QuerySnapshot snapshot = querySnapshot.get(); // Wait for the result
//		        return !snapshot.isEmpty(); // Check if any documents exist in the snapshot
//		    } catch (Exception e) {
//		        System.out.println("Error checking employee existence: " + e);
//		        return false;
//		    }
//	}
	
	//Update Employee Data
	public void updateEmployeeByEmail(String email, String fname, String lname, String uname,String userrole,String date, long contact, String coname, String deptname, String designation, MultipartFile imageFile) throws InterruptedException, ExecutionException, IOException, URISyntaxException {
        // Query Firestore to find the employee document with the matching email
    	 Firestore firestore=FirestoreClient.getFirestore();
    	 String imageUrl = uploadImageToStorage(imageFile);
        com.google.cloud.firestore.Query query = firestore.collection("Employees").whereEqualTo("EmailId", email);
        ApiFuture<QuerySnapshot> querySnapshot = query.get();
        for (QueryDocumentSnapshot document : querySnapshot.get().getDocuments()) {
            // Update the fields of the employee document
        	//String oldImageUrl = document.getString("ImageUrl");
        	//System.out.println(oldImageUrl);
            DocumentReference docRef = document.getReference();
            ApiFuture<WriteResult> writeResult = docRef.update(
                  "FirstName",fname ,
                  "LastName",lname,
                  "UserName", uname,
                  "UserRole",userrole,
                  "JoiningDate", date,
                  "PhoneNumber", contact,
                  "CompanyName", coname,
                  "DepartmentName", deptname,
                  "Designation", designation,
                  "ImageUrl",imageUrl
            );
          
        }
    }
	 
	//Get All Employees
	public List<Object> getAllEmployees() throws ExecutionException, InterruptedException {
        Firestore firestore = FirestoreClient.getFirestore();
        ApiFuture<QuerySnapshot> future = firestore.collection("Employees").orderBy("JoiningDate").get();
        
        List<Object> employees = new ArrayList<>();
        List<QueryDocumentSnapshot> documents = future.get().getDocuments();
        for (DocumentSnapshot document : documents) {
            employees.add(document.getData());
        } 
        return employees;
    }
	
	//Delete Employee
	public void deleteEmployeeByEmpId(String empid,String email) throws InterruptedException, ExecutionException
	{
		 Firestore db = FirestoreClient.getFirestore();

		    // Query the collection to find the document by email
		    com.google.cloud.firestore.Query query = db.collection("Employees").whereEqualTo("EmployeeId", empid);
		    ApiFuture<QuerySnapshot> querySnapshot = query.get();

		    try {
		        List<QueryDocumentSnapshot> documents = querySnapshot.get().getDocuments();
		        if (!documents.isEmpty()) {
		            // Get the document ID of the first document found with the matching email
		            String docId = documents.get(0).getId();
		           // String imageUrl = documents.get(0).getString("ImageUrl");
		           
		           // deleteImageFromStorage(imageUrl);
		            // Delete the document using its document ID
		            DocumentReference documentRef = db.collection("Employees").document(docId);
		            ApiFuture<WriteResult> writeResult = documentRef.delete();
		            WriteResult result = writeResult.get();
		           
		            // Delete the corresponding user in Firebase Authentication using email
	                FirebaseAuth auth = FirebaseAuth.getInstance();
	                UserRecord userRecord = auth.getUserByEmail(email);
	                String uid = userRecord.getUid();
	                auth.deleteUser(uid);
	                
	                

	                // Delete the image from Firebase Storage using the image URL
	               // deleteImageFromStorage(imageUrl);

	                
		        } else {
		            System.out.println("No document found with email: " + email);
		        }
		    } catch (Exception e) {
		        System.err.println("Error deleting document: " + e.getMessage());
		        e.printStackTrace(); // Print the stack trace for detailed error information
		    }
	}
	
	
	//Upload Image
	private final String BUCKET_NAME = "employee-management-syst-e0b3c.appspot.com";

	private String uploadImageToStorage(MultipartFile imageFile) throws IOException {
    try {
    	 String fileName = imageFile.getOriginalFilename();
    	 StorageClient.getInstance().bucket(BUCKET_NAME).create(fileName, imageFile.getBytes(), imageFile.getContentType());
    	 return "https://firebasestorage.googleapis.com/v0/b/" + BUCKET_NAME + "/o/" + fileName + "?alt=media";
    } catch (IOException e) {
        // Handle IOException
        throw new IOException("Error uploading image to Firebase Storage", e);
    }
	}

	public void addDepartments(String department) throws InterruptedException, ExecutionException, IOException {
		
		
        int deptid=fileService.managefileIncrement("deptid.txt");
		
		Firestore db=FirestoreClient.getFirestore();
		DocumentReference ref=db.collection("Departments").document();
		Map<String,Object> dept=new HashMap<String,Object>();
		dept.put("DepartmentId",deptid);
		dept.put("DepartmentName",department);
		ref.set(dept).get();
	}
	
	public List<Object> showDepartments() throws InterruptedException, ExecutionException{
		
		
		Firestore db=FirestoreClient.getFirestore();
	    ApiFuture<QuerySnapshot> ref=db.collection("Departments").orderBy("DepartmentId").get();
		
		List<Object> list=new ArrayList<Object>();
		List<QueryDocumentSnapshot> documents=ref.get().getDocuments();
		
		for(DocumentSnapshot document : documents)
		{
			list.add(document.getData());
		}
		
		return list;
	}

	public void editDepartment(String departmentid, String departmentname) throws InterruptedException, ExecutionException {
	
		Firestore firestore=FirestoreClient.getFirestore();
       com.google.cloud.firestore.Query query = firestore.collection("Departments").whereEqualTo("DepartmentId",Integer.parseInt(departmentid));
       ApiFuture<QuerySnapshot> querySnapshot = query.get();
       for (QueryDocumentSnapshot document : querySnapshot.get().getDocuments()) {
           // Update the fields of the employee document
       	//String oldImageUrl = document.getString("ImageUrl");
       	//System.out.println(oldImageUrl);
           DocumentReference docRef = document.getReference();
           ApiFuture<WriteResult> writeResult = docRef.update(
                 "DepartmentName",departmentname

           );
         
       }   		 
	}

	public void deleteDepartment(String departmentid) {
		Firestore db=FirestoreClient.getFirestore();
		 com.google.cloud.firestore.Query query = db.collection("Departments").whereEqualTo("DepartmentId",Integer.parseInt(departmentid));
		    ApiFuture<QuerySnapshot> querySnapshot = query.get();

		    try {
		    	
		        List<QueryDocumentSnapshot> documents = querySnapshot.get().getDocuments();
		        if (!documents.isEmpty()) {
		        	
		        	
		        	fileService.managefileDecrement("deptid.txt");
		        	
		            // Get the document ID of the first document found with the matching email
		            String docId = documents.get(0).getId();
		           
		            // Delete the document using its document ID
		            DocumentReference documentRef = db.collection("Departments").document(docId);
		            ApiFuture<WriteResult> writeResult = documentRef.delete();
		            WriteResult result = writeResult.get();
		          
		        } else {
		            System.out.println("No document found with Id: " +departmentid);
		        }
		    } catch (Exception e) {
		        System.err.println("Error deleting document: " + e.getMessage());
		        e.printStackTrace(); // Print the stack trace for detailed error information
		    }	
		
	}


	public List<Object> showcompany() throws InterruptedException, ExecutionException {
		// TODO Auto-generated method stub
		Firestore db=FirestoreClient.getFirestore();
		ApiFuture<QuerySnapshot> ref=db.collection("Company").orderBy("CompanyId").get();
		
		List<Object> list = new ArrayList<Object>();
		List<QueryDocumentSnapshot> documents=ref.get().getDocuments();
		
		for(DocumentSnapshot document : documents)
		{
			list.add(document.getData());
		}
		
		return list;
	}

	public void addcompany(String company) throws InterruptedException, ExecutionException, IOException {
		
		int compid=fileService.managefileIncrement("compid.txt");
		
		Firestore db=FirestoreClient.getFirestore();
		DocumentReference ref=db.collection("Company").document();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("CompanyId",compid);
		map.put("CompanyName",company);
		ref.set(map).get();
	}

	public void editcompany(String companyid, String companyname) throws InterruptedException, ExecutionException {
		// TODO Auto-generated method stub
		Firestore db=FirestoreClient.getFirestore();
		com.google.cloud.firestore.Query query=db.collection("Company").whereEqualTo("CompanyId",Integer.parseInt(companyid));
		ApiFuture<QuerySnapshot> future=query.get();
		
		for(QueryDocumentSnapshot document : future.get().getDocuments())
		{
			DocumentReference docRef=document.getReference();
			ApiFuture<WriteResult> write = docRef.update("CompanyName",companyname);
		}
	}

	public void deletecompany(String companyid) {
		// TODO Auto-generated method stub
		Firestore db=FirestoreClient.getFirestore();
		com.google.cloud.firestore.Query query=db.collection("Company").whereEqualTo("CompanyId",Integer.parseInt(companyid));
		ApiFuture<QuerySnapshot> querySnapshot=query.get();
		
		try {
			List<QueryDocumentSnapshot> document=querySnapshot.get().getDocuments();
			if(!document.isEmpty())
			{
				fileService.managefileDecrement("compid.txt");
				
				String docid=document.get(0).getId();
				DocumentReference ref=db.collection("Company").document(docid);
				ref.delete();
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

	public List<Object> showdesignation() throws InterruptedException, ExecutionException {
		// TODO Auto-generated method stub
		Firestore db=FirestoreClient.getFirestore();
		ApiFuture<QuerySnapshot> ref=db.collection("Designation").orderBy("DesignationId").get();
		
		List<Object> list = new ArrayList<Object>();
		List<QueryDocumentSnapshot> documents=ref.get().getDocuments();
		
		for(DocumentSnapshot document : documents)
		{
			list.add(document.getData());
		}
		
		return list;
	}

	public void adddesignation(String designation) throws IOException, InterruptedException, ExecutionException {
		// TODO Auto-generated method stub
		int desigid=fileService.managefileIncrement("desigid.txt");
		
		Firestore db=FirestoreClient.getFirestore();
		DocumentReference ref=db.collection("Designation").document();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("DesignationId",desigid);
		map.put("DesignationName",designation);
		ref.set(map).get();
		
	}

	public void editdesignation(String designationid, String designationname) throws InterruptedException, ExecutionException {
		// TODO Auto-generated method stub
		Firestore db=FirestoreClient.getFirestore();
		com.google.cloud.firestore.Query query=db.collection("Designation").whereEqualTo("DesignationId",Integer.parseInt(designationid));
		ApiFuture<QuerySnapshot> future=query.get();
		
		for(QueryDocumentSnapshot document : future.get().getDocuments())
		{
			DocumentReference docRef=document.getReference();
			ApiFuture<WriteResult> write = docRef.update("DesignationName",designationname);
		}
		
	}

	public void deletedesignation(String designationid) {
		// TODO Auto-generated method stub
		Firestore db=FirestoreClient.getFirestore();
		com.google.cloud.firestore.Query query=db.collection("Designation").whereEqualTo("DesignationId",Integer.parseInt(designationid));
		ApiFuture<QuerySnapshot> querySnapshot=query.get();
		
		try {
			List<QueryDocumentSnapshot> document=querySnapshot.get().getDocuments();
			if(!document.isEmpty())
			{
				fileService.managefileDecrement("desigid.txt");
				String docid=document.get(0).getId();
				DocumentReference ref=db.collection("Designation").document(docid);
				ref.delete();
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}


//	private void deleteImageFromStorage(String imageUrl) throws URISyntaxException {
//		 // Parse the URL to get the bucket and object path
//        URI uri = new URI(imageUrl);
//        String bucketName = uri.getHost();
//        String objectPath = uri.getPath();
//
//        // Remove query parameters from the object path
//        if (objectPath.contains("?")) {
//            objectPath = objectPath.substring(0, objectPath.indexOf('?'));
//        }
//
//        // Replace spaces with underscores in the object path
//        objectPath = objectPath.replaceAll(" ", "_");
//        
//        // Initialize Firebase Storage
//        Storage storage = StorageOptions.newBuilder().setProjectId("employee-management-syst-e0b3c").build().getService();
//
//        // Delete the image from Firebase Storage
//        storage.delete(BUCKET_NAME, objectPath);
//        System.out.println("Image deleted from Firebase Storage: " + objectPath);
//		
//	}
	
//	public void deleteImageFromStorage(String imageUrl) throws IOException {
//		 // Initialize Google Cloud Storage
//        Storage storage = StorageOptions.getDefaultInstance().getService();
//
//        // Construct the bucket name and object name from the imageUrl
//        String bucketName = BUCKET_NAME; // Replace with your bucket name
//        String objectName = imageUrl.substring(imageUrl.indexOf("/o/") + 3); // Extract object name from imageUrl
//
//        // Get a reference to the Blob in Google Cloud Storage
//        Blob blob = storage.get(bucketName, objectName);
//
//        // Check if the Blob exists
//        if (blob != null) {
//            // Delete the Blob from Google Cloud Storage
//            boolean deleted = blob.delete();
//            if (deleted) {
//                System.out.println("Image deleted successfully: " + imageUrl);
//            } else {
//                System.err.println("Failed to delete image: " + imageUrl);
//            }
//        } else {
//            System.err.println("Image not found in storage: " + imageUrl);
//        }
//		
////		if (imageUrl != null && !imageUrl.isEmpty()) {
////            Storage storage = StorageOptions.getDefaultInstance().getService();
////            BlobId blobId = BlobId.of(BUCKET_NAME, imageUrl); // Specify your bucket name
////            Blob blob = storage.get(blobId);
////            if (blob != null && blob. ()) {
////                blob.delete();
////                System.out.println("Image deleted successfully.");
////            } else {
////                System.out.println("Image not found in storage.");
////            }
////        }
//    }


  

	
	
}
