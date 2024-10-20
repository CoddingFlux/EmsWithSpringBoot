# Employee Management System(Web Application With Java( SpringBoot,React Js Library,PSql))

#Working Set :

(1)=> Login Page :

add bootstrap/js/jquery:
: /META-INF/resources/webjars/bootstrap/5.3.2/css/bootstrap.min.css
<script src="webjars/bootstrap/5.3.2/css/bootstrap.min.css"/>

:/META-INF/resources/webjars/bootstrap/5.3.2/js/bootstrap.min.js
<script src="webjars/bootstrap/5.3.2/js/bootstrap.min.js"/>

:/META-INF/resources/webjars/jquery/3.7.1/jquery.min.js
<script src="webjars/jquery/3.7.1/jquery.min.js"/>
#Configuration With pom.xml

(1)=> Deppendancy :

		<dependency>
			<groupId>org.apache.tomcat.embed</groupId>
			<artifactId>tomcat-embed-jasper</artifactId>
			<scope>provided</scope>
		</dependency>
		
		<dependency>
			<groupId>org.webjars</groupId>
			<artifactId>bootstrap</artifactId>
			<version>5.3.2</version>
		</dependency>
		
		
		<dependency>
			<groupId>org.webjars</groupId>
			<artifactId>jquery</artifactId>
			<version>3.7.1</version>
		</dependency>
		
		<dependency>
			<groupId>org.eclipse.jetty</groupId>
			<artifactId>glassfish-jstl</artifactId>
			<version>11.0.19</version>
		</dependency>	
		
(1)=>application properties :

(jsp url configuration):
 
spring.mvc.view.prefix=WEB-INF/JSP/
spring.mvc.view.suffix=.jsp




#usefull

	
		@RequestMapping(value="/login",method = RequestMethod.GET)
		public String showSignin()
		{
			return "index";
		}
		
		 @PostMapping("/login")
		    public String login(@RequestBody LoginRequest loginRequest) throws FirebaseAuthException {
		        // Call Firebase authentication service
		        return service.signInWithEmailAndPassword(loginRequest.getEmail(), loginRequest.getPassword());
		    }
	
		@RequestMapping(value="/login",method = RequestMethod.POST)
		public String Signin(@RequestParam String username,@RequestParam String password,ModelMap map) throws FirebaseAuthException, IOException
		{
			if(service.signInWithEmailAndPassword(username,password))
			{
				map.put("name",username);
			return "Admin/dashboard";
			}
		 return "index";
		}
	

	@GetMapping("/login")
	public String showLogin()
	{
		return "index";
	}
	
	
		@GetMapping("/dashboard")
		public String showDash()
		{
			return "Admin/dashboard";
		}
		
