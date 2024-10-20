//package ems.teamtrackr.root.teamtrackrapi.config;
//
//import static org.springframework.security.config.Customizer.withDefaults;
//
//import java.util.function.Function;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.HttpMethod;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.provisioning.InMemoryUserDetailsManager;
//import org.springframework.security.web.SecurityFilterChain;
//
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig{
//      
//	@Bean
//	public InMemoryUserDetailsManager userDetails() {
//		Function<String, String> passwordEncoder=
//				 input -> passwordEncoder().encode(input);
//		UserDetails userDetails=User.builder()
//				.passwordEncoder(passwordEncoder)
//				.username("admin")
//				.password("admin")
//				.roles("USER")
//				.build();
//		return  new InMemoryUserDetailsManager(userDetails);
//	}
//	
//	@Bean
//	public PasswordEncoder passwordEncoder()
//	{ 
//		return new BCryptPasswordEncoder();
//	}
//	
//	@Bean
//	public SecurityFilterChain filterchain(HttpSecurity http) throws Exception
//	{   
//		http.authorizeHttpRequests(auth->auth.requestMatchers("/dashboard").hasRole("USER").anyRequest().authenticated());
//		
//		http.formLogin(form->form.loginPage("/login").defaultSuccessUrl("/dashboard", true).);
//			return http.build();
//		
//		http
//		.authorizeHttpRequests((requests) -> requests
//			.requestMatchers("/", "/dashboard").hasRole("USER").anyRequest().permitAll()
//		)
//		.formLogin((form) -> form
//			.loginPage("/login")
//			.permitAll()
//		)
//		.logout((logout) -> logout.permitAll());
//
//	return http.build();
//	}
//	
//	
//}
