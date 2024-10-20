package ems.teamtrackr.root.teamtrackrapi.empdataservice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.firebase.cloud.FirestoreClient;

@Service
public class AdminProfileService {

	Firestore db;
	
	public List<Object> loadProfile(String uid) throws InterruptedException, ExecutionException {
		db=FirestoreClient.getFirestore(); 
		List<Object> profiledetail = new ArrayList<>();
	        ApiFuture<QuerySnapshot> documents = db.collection("Employees").whereEqualTo("EmailId",uid).get();
	        List<QueryDocumentSnapshot> empdetail = documents.get().getDocuments();
	        for (QueryDocumentSnapshot document : empdetail) {
	            // Assuming you want to include email along with leave data
	            Map<String, Object> leaveData = new HashMap<>(document.getData());
	            profiledetail.add(leaveData);
	        }
	        return profiledetail;
	}

}
