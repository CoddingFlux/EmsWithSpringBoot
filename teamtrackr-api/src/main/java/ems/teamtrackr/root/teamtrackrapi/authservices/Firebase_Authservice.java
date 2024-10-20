package ems.teamtrackr.root.teamtrackrapi.authservices;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ExecutionException;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.cloud.FirestoreClient;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class Firebase_Authservice {

	//private static final Logger logger = LoggerFactory.getLogger(Firebase_Authservice.class);

	@PostConstruct
	public void initializeFirebase() throws IOException
	{
		
		//logger.info("Initialize firebase App !");
		if(isInternetReachable())
		{
		 try {
			ClassLoader classLoader = Firebase_Authservice.class.getClassLoader();
			    File file = new File(Objects.requireNonNull(classLoader.getResource("serviceAccountKey.json")).getFile());
			    FileInputStream serviceAccount = new FileInputStream(file.getAbsolutePath());
			FirebaseOptions options = new FirebaseOptions.Builder()
					.setCredentials(GoogleCredentials.fromStream(serviceAccount))
					.build();
			FirebaseApp.initializeApp(options);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//logger.error("Initialize firebase app {}",e);
			//return "redirect:login";
		}
		}
		//return "redirect:login";
	}
	
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
	

//	
//	public boolean signIn(String email,String password) throws FirebaseAuthException
//	{
//		FirebaseAuth auth;
//		UserRecord userRecord = FirebaseAuth.getInstance().getUserByEmail(email);
//		return userRecord!=null;	
////		return userRecord.getUid()+" Email is"+userRecord.getEmail();
//	}
	

   
    	   private static final String FIREBASE_AUTH_API_URL = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyD2wtup4rAaSFJSB6QDi2lMMXOHmcezV0Y";
    	    private static final String SESSION_ATTR_USER_ID = "userId"; // Customize as needed

    	    @Autowired
    	    private HttpServletRequest request;

    	    @Autowired
    	    private HttpServletResponse response;

    	    public boolean signInWithEmailAndPassword(String email, String password) {
    	        try {
    	            // Prepare the request body
    	            Map<String, Object> requestBody = new HashMap<>();
    	            requestBody.put("email", email);
    	            requestBody.put("password", password);
    	            requestBody.put("returnSecureToken", true);

    	            // Set headers
    	            HttpHeaders headers = new HttpHeaders();
    	            headers.setContentType(MediaType.APPLICATION_JSON);

    	            // Create the request entity
    	            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

    	            // Make the POST request to Firebase Authentication REST API
    	            ResponseEntity<Map> responseEntity = new RestTemplate().exchange(
    	                    FIREBASE_AUTH_API_URL,
    	                    HttpMethod.POST,
    	                    requestEntity,
    	                    Map.class
    	            );

    	            // Check the response and return true if successful
    	            // Check the response
    	            if (responseEntity.getStatusCode() == HttpStatus.OK) {
    	                // Store user ID in session
    	                String userId = (String) responseEntity.getBody().get("userId");
    	                request.getSession().setAttribute(SESSION_ATTR_USER_ID, userId);
    	                return true;
    	            } else {
    	                return false;
    	            }
    	        } catch (Exception e) {
    	            // Handle exceptions (e.g., log the error)
    	            return false;
    	        }
    	    }
    	    
    	    
    	    public boolean logout() {
    	        try {
    	        	 HttpSession session = request.getSession(false); // Get the current session if it exists
    	             if (session != null) {
    	                 // Remove session attributes
    	                 session.removeAttribute("name");
    	                 session.removeAttribute("adminprofile");
    	                 session.invalidate(); // Invalidate the session
    	                 return true;
    	             }
    	             return false; // Redirect to login page after logout

    	        } catch (Exception e) {
    	            // Handle exceptions (e.g., log the error)
    	            return false;
    	        }
    	    }
    	    

    	    public boolean isAuthenticated() {
    	        // Check if the user is authenticated (i.e., session contains userId attribute)
    	        return request.getSession().getAttribute(SESSION_ATTR_USER_ID) != null;
    	    }

    	    public String getCurrentUserId() {
    	        // Get the current user's ID from the session
    	        return (String) request.getSession().getAttribute(SESSION_ATTR_USER_ID);
    	    }

    	    Firestore db;
			public String getProfileImage(String username) throws InterruptedException, ExecutionException {
				db=FirestoreClient.getFirestore();
				ApiFuture<QuerySnapshot> query = db.collection("Employees").whereEqualTo("EmailId", username).get();
			        List<QueryDocumentSnapshot> documents = query.get().getDocuments();

			        if (!documents.isEmpty()) {
			            QueryDocumentSnapshot document = documents.get(0); // Assuming there is only one matching document
			            String imageUrl = document.getString("ImageUrl");
			            return imageUrl;
			        } else {
			            return null; // No matching document found
			        }
			}
    	    
    	    
	
}
