<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@include  file="../includes/header.jsp"%>
<%@include  file="../includes/sidebar.jsp"%>

<script>
    function toggleSections(section) {
 
    	 if (section === 'employee') {
            document.getElementById('employee').classList.add('show');
            document.getElementById('employee-list').classList.remove('show');
        } else if (section === 'employee-list') {
            document.getElementById('employee').classList.remove('show');
            document.getElementById('employee-list').classList.add('show');
        }
    }
    
    function checkPasswordMatch() {
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirmPassword').value;
        var passwordMatchInfo = document.getElementById('passwordMatchInfo');
        var submitButton = document.getElementById('submitButton');

        if(password.length >=8)
        	{
        if(password != "" || confirmPassword != "")
        	{
        if (password === confirmPassword) {
            passwordMatchInfo.innerHTML = 'Password Matched!';
            passwordMatchInfo.style.color = 'green';
            submitButton.style.display = 'block';
        } else {
            passwordMatchInfo.innerHTML = 'Password Not Matched!';
            passwordMatchInfo.style.color = 'red';
            submitButton.style.display = 'none';
        }
        	}
        else
        	{
        	 passwordMatchInfo.innerHTML = 'Password Not Matched!';
             passwordMatchInfo.style.color = 'red';
             submitButton.style.display = 'none';
        	}
        	}
        else{
        	 passwordMatchInfo.innerHTML = 'Password atlist 8 character long!';
             passwordMatchInfo.style.color = 'red';
             submitButton.style.display = 'none';
        }
    }
</script>
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="page-title">Employee ${passvalid}</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
									<li class="breadcrumb-item active">Employee</li>
								</ul>
							</div>
							<div class="col-auto float-end ms-auto">
								<a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_employee"><i class="fa-solid fa-plus"></i> Add Employee</a>
								<div class="view-icons">
									<button data-bs-toggle="collapse"  onclick="toggleSections('employee-list')" class="list-view btn btn-link"><i class="fa-solid fa-bars"></i></button>
									<button  data-bs-toggle="collapse"  onclick="toggleSections('employee')" class="grid-view btn btn-link active"><i class="fa fa-th"></i></button>
									</div>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<!-- employee section -->
					<section class="show">
					<div id="employee" class="collapse">
					<!-- Search Filter -->
					<div class="row filter-row">
						<div class="col-sm-6 col-md-3">  
							<div class="input-block mb-3 form-focus">
								<input type="text" class="form-control floating">
								<label class="focus-label">Employee ID</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">  
							<div class="input-block mb-3 form-focus">
								<input type="text" class="form-control floating">
								<label class="focus-label">Employee Name</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3"> 
							<div class="input-block mb-3 form-focus select-focus">
								<select class="select floating"> 
									<option>Select Designation</option>
									<option>Web Developer</option>
									<option>Web Designer</option>
									<option>Android Developer</option>
									<option>Ios Developer</option>
								</select>
								<label class="focus-label">Designation</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="d-grid">
								<a href="#" class="btn btn-success w-100"> Search </a>  
							</div>  
						</div>
                    </div>
					<!-- Search Filter -->
					
					<div class="row staff-grid-row">
					<c:forEach items="${employees}" var="employee">
						<div class="col-md-4 col-sm-6 col-12 col-lg-4 col-xl-3">
							<div class="profile-widget">
								<div class="profile-img">
									<a href="profile?uid=${employee.EmailId}" class="avatar"><img src="${employee.ImageUrl}" alt="User Image"></a>
								</div>
								<div class="dropdown profile-action">
									<a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="/updateEmployee?email=${employee.EmailId}" data-bs-toggle="modal" data-bs-target="#edit_employee1${employee.EmployeeId}"><i class="fa-solid fa-pencil m-r-5"></i> Edit</a>
										<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_employee1${employee.EmployeeId}""><i class="fa-regular fa-trash-can m-r-5"></i> Delete</a>
									</div>
								</div>
								<h4 class="user-name m-t-10 mb-0 text-ellipsis"><a href="profile.html">${employee.FirstName} ${employee.LastName}</a></h4>
								<div class="small text-muted">${employee.Designation}</div>
							</div>
						</div>
						
												
				<!-- Delete Employee Modal -->
				<div class="modal custom-modal fade" id="delete_employee1${employee.EmployeeId}" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Delete Employee</h3>
									<p>Are you sure want to delete?</p>
								</div>
								<div class="modal-btn delete-action">
									<div class="row">
										<div class="col-6">
											<a href="deleteEmployee?empid=${employee.EmployeeId}&email=${employee.EmailId}" class="btn btn-primary continue-btn">Delete</a>
										</div>
										<div class="col-6">
											<a href="" data-bs-dismiss="modal" class="btn btn-primary cancel-btn">Cancel</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Delete Employee Modal -->
				
					<!-- Edit Employee Modal -->
				<div id="edit_employee1${employee.EmployeeId}" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Edit Employee</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="/updateEmployee" method="post" enctype="multipart/form-data">
									<div class="row">
									
									<div class="col-lg-12 col-12">
											<div class="input-block mb-3">
												<label class="col-form-label">Upload Profile Image <span class="text-danger">*</span></label>
												<input class="form-control" type="file"  name="imageFile" required="required">
											</div>
										</div>
									
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">First Name <span class="text-danger">*</span></label>
												<input class="form-control" type="text" value="${employee.FirstName}" name="fname" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Last Name</label>
												<input class="form-control" type="text" value="${employee.LastName}" name="lname" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Username <span class="text-danger">*</span></label>
												<input class="form-control" type="text" value="${employee.UserName}" name="uname" required="required">
											</div>
										</div>
										
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Email <span class="text-danger">*</span></label>
												<input class="form-control" type="text" readonly name="email" value="${employee.EmailId}">
											</div>
										</div>
										
										<div class="col-md-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Select Role<span class="text-danger">*</span></label>
												<select class="selected1" name="userrole">
													<option value="Admin" 
													<c:set var = "userrole" scope = "session" value = "Admin"/>
													<c:set var = "olduserrole" scope = "session" value ="${employee.UserRole}"/>
													<c:if test="${userrole eq olduserrole}">selected</c:if>
													 >Admin</option>
													<option value="User" 
													<c:set var = "userrole" scope = "session" value = "User"/>
													<c:set var = "olduserrole" scope = "session" value ="${employee.UserRole}"/>
													<c:if test="${userrole eq olduserrole}">selected</c:if>
													 >User</option>
												</select>
											</div>
										</div>
										
										<div class="col-sm-6">  
											<div class="input-block mb-3">
												<label class="col-form-label">Joining Date <span class="text-danger">*</span></label>
												<div class="cal-icon"><input class="form-control datetimepicker" value="${employee.JoiningDate}" type="text" name="jodate" required="required"></div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Phone </label>
												<input class="form-control" type="text" value="${employee.PhoneNumber}" name="contact" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Company</label>
												<select class="selected1" name="company">
												<option value="-">--Select Company--</option>
												<c:forEach items="${companys}" var="company">
													<option value="${company.CompanyName}"  
													<c:set var = "comname" scope = "session" value = "${company.CompanyName}"/>
													<c:set var = "oldcomname" scope = "session" value = "${employee.CompanyName}"/>
													<c:if test="${comname eq oldcomname}">selected</c:if>>${company.CompanyName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Department <span class="text-danger">*</span></label>
												<select class="selected1" name="deptname">
													<option value="-">--Select Department--</option>
													<c:forEach items="${departments}" var="department">
													<option value="${department.DepartmentName}"  
													<c:set var = "deptname" scope = "session" value = "${department.DepartmentName}"/>
													<c:set var = "olddeptname" scope = "session" value = "${employee.DepartmentName}"/>
													<c:if test="${deptname eq olddeptname}">selected</c:if>>${department.DepartmentName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Designation <span class="text-danger">*</span></label>
												<select class="selected1" name="designation">
												<option value="-">--Select Designation--</option>
												
													<c:forEach items="${designations}" var="designation">
													<option value="${designation.DesignationName}" 
													<c:set var = "designame" scope = "session" value = "${designation.DesignationName}"/>
													<c:set var = "olddesigname" scope = "session" value = "${employee.Designation}"/>
													<c:if test="${designame eq olddesigname}">selected</c:if>>${designation.DesignationName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									
									<div class="submit-section">
										<button class="btn btn-primary submit-btn" type="submit" name="update" value="done">Update</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /Edit Employee Modal -->
						
					</c:forEach>
					</div>
			</div>
				</section>
				<!-- /employee section -->
				
				<!-- employee-list section -->
				<section>
				<div id="employee-list" class="collapse show">
				
					<!-- Search Filter -->
					<div class="row filter-row">
						<div class="col-sm-6 col-md-3">  
							<div class="input-block mb-3 form-focus">
								<input type="text" class="form-control floating">
								<label class="focus-label">Employee ID</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">  
							<div class="input-block mb-3 form-focus">
								<input type="text" class="form-control floating">
								<label class="focus-label">Employee Name</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3"> 
							<div class="input-block mb-3 form-focus select-focus">
								<select class="select floating"> 
									<option>Select Designation</option>
									<option>Web Developer</option>
									<option>Web Designer</option>
									<option>Android Developer</option>
									<option>Ios Developer</option>
								</select>
								<label class="focus-label">Designation</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">  
							<a href="#" class="btn btn-success w-100"> Search </a>  
						</div>     
                    </div>
					<!-- /Search Filter -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-striped custom-table datatable">
									<thead>
										<tr>
											<th>Name</th>
											<th>Employee ID</th>
											<th>Email</th>
											<th>Mobile</th>
											<th class="text-nowrap">Join Date</th>
											<th>Role</th>
											<th class="text-end no-sort">Action</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${employees}" var="employee">
										<tr>
											<td>
												<h2 class="table-avatar">
													<a href="/profile?uid=${employee.EmailId}" class="avatar"><img src="${employee.ImageUrl}" alt="User Image"></a>
													<a href="#">${employee.FirstName} ${employee.LastName} <span>${employee.Designation}</span></a>
												</h2>
											</td>
											<td>${employee.EmployeeId}</td>
											<td><a href="https://smarthr.dreamstechnologies.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="0b616463656f646e4b6e736a667b676e25686466">${employee.EmailId}</a></td>
											<td>${employee.PhoneNumber}</td>
											<td>${employee.JoiningDate}</td>
											<td>
												<div class="dropdown">
													<!-- <a href="#" class="btn btn-white btn-sm btn-rounded dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Web Developer </a>
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Software Engineer</a>
														<a class="dropdown-item" href="#">Software Tester</a>
														<a class="dropdown-item" href="#">Frontend Developer</a>
														<a class="dropdown-item" href="#">UI/UX Developer</a>
													</div> -->
													${employee.UserRole}
												</div>
											</td>
											<td class="text-end">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="/updateEmployee?email=${employee.EmailId}" data-bs-toggle="modal" data-bs-target="#edit_employee${employee.EmployeeId}"><i class="fa-solid fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_employee${employee.EmployeeId}"><i class="fa-regular fa-trash-can m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
										
				<!-- Delete Employee Modal -->
				<div class="modal custom-modal fade" id="delete_employee${employee.EmployeeId}" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Delete Employee</h3>
									<p>Are you sure want to delete?</p>
								</div>
								<div class="modal-btn delete-action">
									<div class="row">
										<div class="col-6">
											<a href="deleteEmployee?empid=${employee.EmployeeId}&email=${employee.EmailId}" class="btn btn-primary continue-btn">Delete</a>
										</div>
										<div class="col-6">
											<a href="" data-bs-dismiss="modal" class="btn btn-primary cancel-btn">Cancel</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Delete Employee Modal -->
				
					<!-- Edit Employee Modal -->
				<div id="edit_employee${employee.EmployeeId}" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Edit Employee</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="/updateEmployee" method="post" enctype="multipart/form-data">
									<div class="row">
									
									<div class="col-lg-12 col-12">
											<div class="input-block mb-3">
												<label class="col-form-label">Upload Profile Image <span class="text-danger">*</span></label>
												<input class="form-control" type="file"  name="imageFile" required="required">
											</div>
										</div>
									
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">First Name <span class="text-danger">*</span></label>
												<input class="form-control" type="text" value="${employee.FirstName}" name="fname" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Last Name</label>
												<input class="form-control" type="text" value="${employee.LastName}" name="lname" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Username <span class="text-danger">*</span></label>
												<input class="form-control" type="text" value="${employee.UserName}" name="uname" required="required">
											</div>
										</div>
										
										<div class="col-sm-6">
											<div class="input-block mb-3">
												 <label class="col-form-label">Email <span class="text-danger">*</span></label>
												<input class="form-control" type="text" readonly name="email" value="${employee.EmailId}">
											</div>
										</div>
										
										<div class="col-md-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Select Role<span class="text-danger">*</span></label>
												<select class="selected1" name="userrole">
													<option value="Admin" 
													<c:set var = "userrole" scope = "session" value = "Admin"/>
													<c:set var = "olduserrole" scope = "session" value ="${employee.UserRole}"/>
													<c:if test="${userrole eq olduserrole}">selected</c:if>
													 >Admin</option>
													<option value="User" 
													<c:set var = "userrole" scope = "session" value = "User"/>
													<c:set var = "olduserrole" scope = "session" value ="${employee.UserRole}"/>
													<c:if test="${userrole eq olduserrole}">selected</c:if>
													 >User</option>
												</select>
											</div>
										</div>
										
										<div class="col-sm-6">  
											<div class="input-block mb-3">
												<label class="col-form-label">Joining Date <span class="text-danger">*</span></label>
												<div class="cal-icon"><input class="form-control datetimepicker" value="${employee.JoiningDate}" type="text" name="jodate" required="required"></div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Phone </label>
												<input class="form-control" type="text" value="${employee.PhoneNumber}" name="contact" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Company</label>
												<select class="selected1" name="company">
												<option value="-">--Select Company--</option>
												<c:forEach items="${companys}" var="company">
													<option value="${company.CompanyName}"  
													<c:set var = "comname" scope = "session" value = "${company.CompanyName}"/>
													<c:set var = "oldcomname" scope = "session" value = "${employee.CompanyName}"/>
													<c:if test="${comname eq oldcomname}">selected</c:if>>${company.CompanyName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Department <span class="text-danger">*</span></label>
												<select class="selected1" name="deptname">
													<option value="-">--Select Department--</option>
													<c:forEach items="${departments}" var="department">
													<option value="${department.DepartmentName}"  
													<c:set var = "deptname" scope = "session" value = "${department.DepartmentName}"/>
													<c:set var = "olddeptname" scope = "session" value = "${employee.DepartmentName}"/>
													<c:if test="${deptname eq olddeptname}">selected</c:if>>${department.DepartmentName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Designation <span class="text-danger">*</span></label>
												<select class="selected1" name="designation">
												<option value="-">--Select Designation--</option>
												
													<c:forEach items="${designations}" var="designation">
													<option value="${designation.DesignationName}" 
													<c:set var = "designame" scope = "session" value = "${designation.DesignationName}"/>
													<c:set var = "olddesigname" scope = "session" value = "${employee.Designation}"/>
													<c:if test="${designame eq olddesigname}">selected</c:if>>${designation.DesignationName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									
									<div class="submit-section">
										<button class="btn btn-primary submit-btn" type="submit" name="update" value="done">Update</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /Edit Employee Modal -->
										</c:forEach>
										
										<!-- Extra Dummy data -->
									<!-- 	<tr>
											<td>
												<h2 class="table-avatar">
													<a href="profile.html" class="avatar"><img src="assets/img/profiles/avatar-09.jpg" alt="User Image"></a>
													<a href="profile.html">Richard Miles <span>Web Developer</span></a>
												</h2>
											</td>
											<td>FT-0002</td>
											<td><a href="https://smarthr.dreamstechnologies.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="89fbe0eae1e8fbede4e0e5ecfac9ecf1e8e4f9e5eca7eae6e4">[email&#160;protected]</a></td>
											<td>9876543210</td>
											<td>18 Mar 2014</td>
											<td>
												<div class="dropdown">
													<a href="#" class="btn btn-white btn-sm btn-rounded dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Web Developer </a>
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Software Engineer</a>
														<a class="dropdown-item" href="#">Software Tester</a>
														<a class="dropdown-item" href="#">Frontend Developer</a>
														<a class="dropdown-item" href="#">UI/UX Developer</a>
													</div>
												</div>
											</td>
											<td class="text-end">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_employee"><i class="fa-solid fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_employee"><i class="fa-regular fa-trash-can m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<h2 class="table-avatar">
													<a href="profile.html" class="avatar"><img src="assets/img/profiles/avatar-10.jpg" alt="User Image"></a>
													<a href="profile.html">John Smith <span>Android Developer</span></a>
												</h2>
											</td>
											<td>FT-0003</td>
											<td><a href="https://smarthr.dreamstechnologies.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="96fcf9fef8e5fbffe2fed6f3eef7fbe6faf3b8f5f9fb">[email&#160;protected]</a></td>
											<td>9876543210</td>
											<td>1 Apr 2014</td>
											<td>
												<div class="dropdown">
													<a href="#" class="btn btn-white btn-sm btn-rounded dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Web Developer </a>
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Software Engineer</a>
														<a class="dropdown-item" href="#">Software Tester</a>
														<a class="dropdown-item" href="#">Frontend Developer</a>
														<a class="dropdown-item" href="#">UI/UX Developer</a>
													</div>
												</div>
											</td>
											<td class="text-end">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_employee"><i class="fa-solid fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_employee"><i class="fa-regular fa-trash-can m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<h2 class="table-avatar">
													<a href="profile.html" class="avatar"><img src="assets/img/profiles/avatar-05.jpg" alt="User Image"></a>
													<a href="profile.html">Mike Litorus <span>IOS Developer</span></a>
												</h2>
											</td>
											<td>FT-0004</td>
											<td><a href="https://smarthr.dreamstechnologies.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="1a7773717f76736e75686f695a7f627b776a767f34797577">[email&#160;protected]</a></td>
											<td>9876543210</td>
											<td>1 Apr 2014</td>
											<td>
												<div class="dropdown">
													<a href="#" class="btn btn-white btn-sm btn-rounded dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Web Developer </a>
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Software Engineer</a>
														<a class="dropdown-item" href="#">Software Tester</a>
														<a class="dropdown-item" href="#">Frontend Developer</a>
														<a class="dropdown-item" href="#">UI/UX Developer</a>
													</div>
												</div>
											</td>
											<td class="text-end">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_employee"><i class="fa-solid fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_employee"><i class="fa-regular fa-trash-can m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<h2 class="table-avatar">
													<a href="profile.html" class="avatar"><img src="assets/img/profiles/avatar-11.jpg" alt="User Image"></a>
													<a href="profile.html">Wilmer Deluna <span>Team Leader</span></a>
												</h2>
											</td>
											<td>FT-0005</td>
											<td><a href="https://smarthr.dreamstechnologies.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="f186989d9c948395949d849f90b19489909c819d94df929e9c">[email&#160;protected]</a></td>
											<td>9876543210</td>
											<td>22 May 2014</td>
											<td>
												<div class="dropdown">
													<a href="#" class="btn btn-white btn-sm btn-rounded dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Web Developer </a>
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Software Engineer</a>
														<a class="dropdown-item" href="#">Software Tester</a>
														<a class="dropdown-item" href="#">Frontend Developer</a>
														<a class="dropdown-item" href="#">UI/UX Developer</a>
													</div>
												</div>
											</td>
											<td class="text-end">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_employee"><i class="fa-solid fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_employee"><i class="fa-regular fa-trash-can m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<h2 class="table-avatar">
													<a href="profile.html" class="avatar"><img src="assets/img/profiles/avatar-12.jpg" alt="User Image"></a>
													<a href="profile.html">Jeffrey Warden <span>Web Developer</span></a>
												</h2>
											</td>
											<td>FT-0006</td>
											<td><a href="https://smarthr.dreamstechnologies.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="e68c83808094839f918794828388a6839e878b968a83c885898b">[email&#160;protected]</a></td>
											<td>9876543210</td>
											<td>16 Jun 2013</td>
											<td>
												<div class="dropdown">
													<a href="#" class="btn btn-white btn-sm btn-rounded dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Web Developer </a>
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Software Engineer</a>
														<a class="dropdown-item" href="#">Software Tester</a>
														<a class="dropdown-item" href="#">Frontend Developer</a>
														<a class="dropdown-item" href="#">UI/UX Developer</a>
													</div>
												</div>
											</td>
											<td class="text-end">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_employee"><i class="fa-solid fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_employee"><i class="fa-regular fa-trash-can m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<h2 class="table-avatar">
													<a href="profile.html" class="avatar"><img src="assets/img/profiles/avatar-13.jpg" alt="User Image"></a>
													<a href="profile.html">Bernardo Galaviz <span>Web Developer</span></a>
												</h2>
											</td>
											<td>FT-0007</td>
											<td><a href="https://smarthr.dreamstechnologies.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="81e3e4f3efe0f3e5eee6e0ede0f7e8fbc1e4f9e0ecf1ede4afe2eeec">[email&#160;protected]</a></td>
											<td>9876543210</td>
											<td>1 Jan 2013</td>
											<td>
												<div class="dropdown">
													<a href="#" class="btn btn-white btn-sm btn-rounded dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Web Developer </a>
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Software Engineer</a>
														<a class="dropdown-item" href="#">Software Tester</a>
														<a class="dropdown-item" href="#">Frontend Developer</a>
														<a class="dropdown-item" href="#">UI/UX Developer</a>
													</div>
												</div>
											</td>
											<td class="text-end">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_employee"><i class="fa-solid fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_employee"><i class="fa-regular fa-trash-can m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr> -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				</section>
				<!-- /employee section -->
				
				
				<!-- Add Employee Modal -->
				<div id="add_employee" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Employee</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="/employees" method="post" enctype="multipart/form-data">
									<div class="row">
									
									<div class="col-lg-12 col-12">
											<div class="input-block mb-3">
												<label class="col-form-label">Upload Profile Image <span class="text-danger">*</span></label>
												<input class="form-control" type="file" name="imageFile" required="required">
											</div>
										</div>
									
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">First Name <span class="text-danger">*</span></label>
												<input class="form-control" type="text" name="fname" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Last Name</label>
												<input class="form-control" type="text" name="lname" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Username <span class="text-danger">*</span></label>
												<input class="form-control" type="text" name="uname" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Email <span class="text-danger">*</span></label>
												<input class="form-control" type="email" name="email" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Password</label>
												<input class="form-control" type="password" id="password" min="8" max="16" oninput="checkPasswordMatch()" name="password" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Confirm Password</label>
												<input class="form-control" type="password" id="confirmPassword"  min="8" max="16" oninput="checkPasswordMatch()" name="copassword" required="required">
											</div>
											 <div id="passwordMatchInfo" style="color: green;"></div>
											
										</div>
										
										<div class="col-md-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Select Role<span class="text-danger">*</span></label>
												<select class="selected1" name="userrole">
													<option>Admin</option>
													<option>User</option>
												</select>
											</div>
										</div>
										
										<div class="col-sm-6">  
											<div class="input-block mb-3">
												<label class="col-form-label">Joining Date <span class="text-danger">*</span></label>
												<div class="cal-icon"><input class="form-control datetimepicker" type="text" name="jodate" required="required"></div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Phone </label>
												<input class="form-control" type="text" name="contact" required="required">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Company</label>
												<select class="selected1" name="company">
												<option value="-">--Select Company--</option>
												<c:forEach items="${companys}" var="company">
													<option>${company.CompanyName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Department <span class="text-danger">*</span></label>
												<select class="selected1" name="deptname">
													<option value="-">--Select Department--</option>
													<c:forEach items="${departments}" var="department">
													<option>${department.DepartmentName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="input-block mb-3">
												<label class="col-form-label">Designation <span class="text-danger">*</span></label>
												<select class="selected1" name="designation">
												<option value="-">--Select Designation--</option>
													<c:forEach items="${designations}" var="designation">
													<option>${designation.DesignationName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /Add Employee Modal -->
				
			
				
				
            </div>
			<!-- /Page Wrapper -->
			
        </div>
		<!-- /Main Wrapper -->
		
		<div class="settings-icon"> 
			<span data-bs-toggle="offcanvas" data-bs-target="#theme-settings-offcanvas" aria-controls="theme-settings-offcanvas"><i class="las la-cog"></i></span> 
		</div> 
		<div class="offcanvas offcanvas-end border-0 " tabindex="-1" id="theme-settings-offcanvas"> 
			<div class="sidebar-headerset">
				<div class="sidebar-headersets">
					<h2>Customizer</h2>
					<h3>Customize your overview Page layout</h3>
				</div>
				<div class="sidebar-headerclose">
					<a data-bs-dismiss="offcanvas" aria-label="Close"><img src="assets/img/close.png" alt="Close Icon"></a>
				</div>
			</div>
			<div class="offcanvas-body p-0"> 
				<div data-simplebar class="h-100"> 
					<div class="settings-mains"> 
						<div class="layout-head">
							<h5>Layout</h5>
							<h6>Choose your layout</h6>
						</div>
						<div class="row"> 
							<div class="col-4"> 
								<div class="form-check card-radio p-0"> 
									<input id="customizer-layout01" name="data-layout" type="radio" value="vertical" class="form-check-input"> 
									<label class="form-check-label avatar-md w-100" for="customizer-layout01"> 
										<img src="assets/img/vertical.png" alt="Layout Image">
									</label> 
								</div> 
								<h5 class="fs-13 text-center mt-2">Vertical</h5> 
							</div> 
							<div class="col-4"> 
								<div class="form-check card-radio p-0"> 
								<input id="customizer-layout02" name="data-layout" type="radio" value="horizontal" class="form-check-input"> 
									<label class="form-check-label  avatar-md w-100" for="customizer-layout02"> 
										<img src="assets/img/horizontal.png" alt="Layout Image">
									</label> 
								</div> 
								<h5 class="fs-13 text-center mt-2">Horizontal</h5> 
							</div> 
							<div class="col-4"> 
								<div class="form-check card-radio p-0"> 
									<input id="customizer-layout03" name="data-layout" type="radio" value="twocolumn" class="form-check-input"> 
									<label class="form-check-label  avatar-md w-100" for="customizer-layout03"> 
										<img src="assets/img/two-col.png" alt="Layout Image">
									</label> 
								</div> 
								<h5 class="fs-13 text-center mt-2">Two Column</h5> 
								</div> 
							</div> 
							<div class="layout-head pt-3">
								<h5>Color Scheme</h5>
								<h6>Choose Light or Dark Scheme.</h6>
							</div>
							<div class="colorscheme-cardradio"> 
								<div class="row"> 
									<div class="col-4"> 
										<div class="form-check card-radio p-0"> 
											<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-orange" value="orange"> 
											<label class="form-check-label  avatar-md w-100 " for="layout-mode-orange"> 
												<img src="assets/img/vertical.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Orange</h5> 
								</div> 
								<div class="col-4"> 
									<div class="form-check card-radio p-0"> 
										<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-light" value="light"> 
										<label class="form-check-label  avatar-md w-100" for="layout-mode-light"> 
											<img src="assets/img/vertical.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Light</h5> 
								</div> 
								<div class="col-4"> 
									<div class="form-check card-radio dark  p-0 "> 
										<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-dark" value="dark"> 
										<label class="form-check-label avatar-md w-100 " for="layout-mode-dark"> 
											<img src="assets/img/vertical.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Dark</h5> 
								</div> 
								<div class="col-4"> 
									<div class="form-check card-radio blue  p-0 "> 
										<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-blue" value="blue"> 
										<label class="form-check-label  avatar-md w-100" for="layout-mode-blue"> 
											<img src="assets/img/vertical.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Blue</h5> 
								</div> 
								<div class="col-4"> 
									<div class="form-check card-radio maroon p-0"> 
										<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-maroon" value="maroon"> 
										<label class="form-check-label  avatar-md w-100 " for="layout-mode-maroon"> 
											<img src="assets/img/vertical.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Maroon</h5> 
								</div> 
								<div class="col-4"> 
									<div class="form-check card-radio purple p-0"> 
										<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-purple" value="purple"> 
										<label class="form-check-label  avatar-md w-100 " for="layout-mode-purple"> 
											<img src="assets/img/vertical.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Purple</h5> 
								</div> 
							</div> 
						</div> 

						<div id="layout-width"> 
							<div class="layout-head pt-3">
								<h5>Layout Width</h5>
								<h6>Choose Fluid or Boxed layout.</h6>
							</div>
							<div class="row"> 
								<div class="col-4"> 
									<div class="form-check card-radio p-0"> 
										<input class="form-check-input" type="radio" name="data-layout-width" id="layout-width-fluid" value="fluid"> 
										<label class="form-check-label avatar-md w-100" for="layout-width-fluid"> 
											<img src="assets/img/vertical.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Fluid</h5> 
								</div> 
								<div class="col-4"> 
									<div class="form-check card-radio p-0 "> 
										<input class="form-check-input" type="radio" name="data-layout-width" id="layout-width-boxed" value="boxed"> 
										<label class="form-check-label avatar-md w-100 px-2" for="layout-width-boxed"> 
											<img src="assets/img/boxed.png" alt="Layout Image"> 
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Boxed</h5> 
								</div> 
							</div> 
						</div> 

						<div id="layout-position"> 
							<div class="layout-head pt-3">
								<h5>Layout Position</h5>
								<h6>Choose Fixed or Scrollable Layout Position.</h6>
							</div>
							<div class="btn-group bor-rad-50 overflow-hidden radio" role="group"> 
								<input type="radio" class="btn-check" name="data-layout-position" id="layout-position-fixed" value="fixed"> 
								<label class="btn btn-light w-sm" for="layout-position-fixed">Fixed</label> 

								<input type="radio" class="btn-check" name="data-layout-position" id="layout-position-scrollable" value="scrollable"> 
								<label class="btn btn-light w-sm ms-0" for="layout-position-scrollable">Scrollable</label> 
							</div> 
						</div> 
						<div class="layout-head pt-3">
							<h5>Topbar Color</h5>
							<h6>Choose Light or Dark Topbar Color.</h6>
						</div>
						<div class="row"> 
							<div class="col-4"> 
								<div class="form-check card-radio  p-0"> 
									<input class="form-check-input" type="radio" name="data-topbar" id="topbar-color-light" value="light"> 
									<label class="form-check-label avatar-md w-100" for="topbar-color-light"> 
										<img src="assets/img/vertical.png" alt="Layout Image">
									</label> 
								</div> 
								<h5 class="fs-13 text-center mt-2">Light</h5> 
							</div> 
							<div class="col-4"> 
								<div class="form-check card-radio p-0"> 
									<input class="form-check-input" type="radio" name="data-topbar" id="topbar-color-dark" value="dark"> 
									<label class="form-check-label  avatar-md w-100" for="topbar-color-dark"> 
										<img src="assets/img/dark.png" alt="Layout Image">
									</label> 
								</div> 
								<h5 class="fs-13 text-center mt-2">Dark</h5> 
							</div> 
						</div> 

						<div id="sidebar-size"> 
							<div class="layout-head pt-3">
								<h5>Sidebar Size</h5>
								<h6>Choose a size of Sidebar.</h6>
							</div>
							<div class="row"> 
								<div class="col-4"> 
									<div class="form-check sidebar-setting card-radio  p-0 "> 
										<input class="form-check-input" type="radio" name="data-sidebar-size" id="sidebar-size-default" value="lg" > 
										<label class="form-check-label avatar-md w-100" for="sidebar-size-default"> 
											<img src="assets/img/vertical.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Default</h5> 
								</div> 

								<div class="col-4"> 
									<div class="form-check sidebar-setting card-radio p-0"> 
										<input class="form-check-input" type="radio" name="data-sidebar-size" id="sidebar-size-compact" value="md"> 
										<label class="form-check-label  avatar-md w-100" for="sidebar-size-compact"> 
											<img src="assets/img/compact.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Compact</h5> 
								</div> 

								<div class="col-4"> 
									<div class="form-check sidebar-setting card-radio p-0 "> 
										<input class="form-check-input" type="radio" name="data-sidebar-size" id="sidebar-size-small-hover" value="sm-hover" > 
										<label class="form-check-label avatar-md w-100" for="sidebar-size-small-hover"> 
											<img src="assets/img/small-hover.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Small Hover View</h5> 
								</div> 
							</div> 
						</div> 

						<div id="sidebar-view"> 
							<div class="layout-head pt-3">
								<h5>Sidebar View</h5>
								<h6>Choose Default or Detached Sidebar view.</h6>
							</div>
							<div class="row"> 
								<div class="col-4"> 
									<div class="form-check sidebar-setting card-radio  p-0"> 
										<input class="form-check-input" type="radio" name="data-layout-style" id="sidebar-view-default" value="default"> 
										<label class="form-check-label avatar-md w-100" for="sidebar-view-default"> 
											<img src="assets/img/compact.png" alt="Layout Image">
										</label>
										</div> 
									<h5 class="fs-13 text-center mt-2">Default</h5> 
								</div> 
								<div class="col-4"> 
									<div class="form-check sidebar-setting card-radio p-0"> 
										<input class="form-check-input" type="radio" name="data-layout-style" id="sidebar-view-detached" value="detached"> 
										<label class="form-check-label  avatar-md w-100" for="sidebar-view-detached"> 
											<img src="assets/img/detached.png" alt="Layout Image">
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Detached</h5> 
								</div> 
							</div> 
						</div> 
						<div id="sidebar-color"> 
							<div class="layout-head pt-3">
								<h5>Sidebar Color</h5>
								<h6>Choose a color of Sidebar.</h6>
							</div>
							<div class="row"> 
								<div class="col-4"> 
									<div class="form-check sidebar-setting card-radio p-0" data-bs-toggle="collapse" data-bs-target="#collapseBgGradient.show"> 
										<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-light" value="light"> 
										<label class="form-check-label  avatar-md w-100" for="sidebar-color-light"> 
											<span class="bg-light bg-sidebarcolor"></span>
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Light</h5> 
								</div> 
								<div class="col-4"> 
									<div class="form-check sidebar-setting card-radio p-0" data-bs-toggle="collapse" data-bs-target="#collapseBgGradient.show"> 
										<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-dark" value="dark"> 
										<label class="form-check-label  avatar-md w-100" for="sidebar-color-dark"> 
											<span class="bg-darks bg-sidebarcolor"></span>
										</label> 
									</div> 
									<h5 class="fs-13 text-center mt-2">Dark</h5> 
								</div> 
								<div class="col-4"> 
									<div class="form-check sidebar-setting card-radio p-0"> 
										<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-gradient" value="gradient"> 
										<label class="form-check-label avatar-md w-100" for="sidebar-color-gradient"> 
											<span class="bg-gradients bg-sidebarcolor"></span>
										</label>  
									</div> 
									<h5 class="fs-13 text-center mt-2">Gradient</h5> 
								</div>
								<div class="col-4 d-none"> 
									<button class="btn btn-link avatar-md w-100 p-0 overflow-hidden border collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseBgGradient" aria-expanded="false" aria-controls="collapseBgGradient"> 
										<span class="d-flex gap-1 h-100"> 
											<span class="flex-shrink-0"> 
												<span class="bg-vertical-gradient d-flex h-100 flex-column gap-1 p-1"> 
													<span class="d-block p-1 px-2 bg-soft-light rounded mb-2"></span> 
													<span class="d-block p-1 px-2 pb-0 bg-soft-light"></span> 
													<span class="d-block p-1 px-2 pb-0 bg-soft-light"></span> 
													<span class="d-block p-1 px-2 pb-0 bg-soft-light"></span> 
												</span> 
											</span> 
											<span class="flex-grow-1"> 
												<span class="d-flex h-100 flex-column"> 
													<span class="bg-light d-block p-1"></span> 
													<span class="bg-light d-block p-1 mt-auto"></span> 
												</span> 
											</span> 
										</span> 
									</button> 
									<h5 class="fs-13 text-center mt-2">Gradient</h5> 
								</div> 
							</div>
							<div class="collapse d-none" id="collapseBgGradient"> 
								<div class="d-flex gap-2 flex-wrap img-switch p-2 px-3 bg-light rounded"> 
									<div class="form-check sidebar-setting card-radio"> 
										<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-gradient-1" value="gradient"> 
										<label class="form-check-label p-0 avatar-xs rounded-circle" for="sidebar-color-gradient"> 
											<span class="avatar-title rounded-circle bg-vertical-gradient"></span> 
										</label> 
									</div> 
									<div class="form-check sidebar-setting card-radio"> 
										<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-gradient-2" value="gradient-2"> 
										<label class="form-check-label p-0 avatar-xs rounded-circle" for="sidebar-color-gradient-2"> 
											<span class="avatar-title rounded-circle bg-vertical-gradient-2"></span> 
										</label> 
									</div> 
									<div class="form-check sidebar-setting card-radio"> 
										<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-gradient-3" value="gradient-3"> 
										<label class="form-check-label p-0 avatar-xs rounded-circle" for="sidebar-color-gradient-3"> 
											<span class="avatar-title rounded-circle bg-vertical-gradient-3"></span> 
										</label> 
									</div> 
									<div class="form-check sidebar-setting card-radio"> 
										<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-gradient-4" value="gradient-4"> 
										<label class="form-check-label p-0 avatar-xs rounded-circle" for="sidebar-color-gradient-4"> 
											<span class="avatar-title rounded-circle bg-vertical-gradient-4"></span> 
										</label> 
									</div> 
								</div> 
							</div> 
						</div> 
					</div> 
				</div> 

			</div> 
			<div class="offcanvas-footer border-top p-3 text-center"> 
				<div class="row"> 
					<div class="col-6"> 
						<button type="button" class="btn btn-light w-100 bor-rad-50" id="reset-layout">Reset</button> 
					</div> 
					<div class="col-6"> 
						<a href="https://themeforest.net/item/smarthr-bootstrap-admin-panel-template/21153150" target="_blank" class="btn btn-primary w-100 bor-rad-50">Buy Now</a> 
					</div> 
				</div> 
			</div> 
		</div>  
		
<%@include file="../includes/footer.jsp" %>