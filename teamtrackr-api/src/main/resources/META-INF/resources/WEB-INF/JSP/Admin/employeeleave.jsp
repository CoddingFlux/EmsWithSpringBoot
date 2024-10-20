<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@include  file="../includes/header.jsp"%>
<%@include  file="../includes/sidebar.jsp"%>


			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="page-title">Leaves</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
									<li class="breadcrumb-item active">Leaves</li>
								</ul>
							</div>
							<div class="col-auto float-end ms-auto">
								<a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_leave"><i class="fa-solid fa-plus"></i> Add Leave</a>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<!-- Leave Statistics -->
					<div class="row">
						<div class="col-md-3">
							<div class="stats-info">
								<h6>Annual Leave</h6>
								<h4>12</h4>
							</div>
						</div>
						<div class="col-md-3">
							<div class="stats-info">
								<h6>Medical Leave</h6>
								<h4>3</h4>
							</div>
						</div>
						<div class="col-md-3">
							<div class="stats-info">
								<h6>Other Leave</h6>
								<h4>4</h4>
							</div>
						</div>
						<div class="col-md-3">
							<div class="stats-info">
								<h6>Remaining Leave</h6>
								<h4>5</h4>
							</div>
						</div>
					</div>
					<!-- /Leave Statistics -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-striped custom-table leave-employee-table mb-0 datatable">
									<thead>
										<tr>
											<th>EmpEmail</th>
											<th>LeaveType</th>
											<th>From</th>
											<th>To</th>
											<th>Reason</th>
											<th class="text-center">Status</th>
											<th>Approved by</th>
											<th class="text-end">Actions</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${empleaves}" var="empleave">
										<tr>
										<td>${empleave.Email}</td>
											<td>${empleave.LeaveType}</td>
											<td>${empleave.FromDate}</td>
											<td>${empleave.ToDate}</td>
											<td>${empleave.LeaveReason}</td>
											<td class="text-center">
												<div class="action-label">
												<c:set var="empstatus" scope="session" value="${empleave.LeaveStatus}"/>
											<c:set var="approvedstatus" scope="session" value="Approved"/>
											<c:set var="newstatus" scope="session" value="New"/>
											<c:set var="declinedstatus" scope="session" value="Declined"/>
											
												<c:if test="${empstatus eq newstatus}">
													<a class="btn btn-white btn-sm btn-rounded" href="javascript:void(0);">
														<i class="fa-regular fa-circle-dot text-purple"></i>${empleave.LeaveStatus}
													</a></c:if>
												
												<c:if test="${empstatus eq approvedstatus}">
												
												<a class="btn btn-white btn-sm btn-rounded" href="javascript:void(0);">
														<i class="fa-regular fa-circle-dot text-success"></i> ${empleave.LeaveStatus}
													</a>
												</c:if>	
												
												<c:if test="${empstatus eq declinedstatus}">
													<a class="btn btn-white btn-sm btn-rounded" href="javascript:void(0);">
														<i class="fa-regular fa-circle-dot text-danger"></i> ${empleave.LeaveStatus}
													</a>
												</c:if>
												</div>
											</td>
											<td>
												<h2 class="table-avatar">
													<a href="profile.html" class="avatar avatar-xs"><img src="assets/img/profiles/avatar-09.jpg" alt="User Image"></a>
													<a href="#">Richard Miles</a>
												</h2>
											</td>
											<td class="text-end">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_leave${empleave.DocId}"><i class="fa-solid fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_approve${empleave.DocId}"><i class="fa-regular fa-trash-can m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
										
											<!-- Edit Leave Modal -->
				<div id="edit_leave${empleave.DocId}" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Edit Leave</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="editemployeeLeave" method="post">
									<div class="input-block mb-3">
										<label class="col-form-label">Leave Type <span class="text-danger">*</span></label>
										<select class="selected1" name="leavetype">
										
											<option>--Select LeaveType--</option>
											<c:forEach items="${leavetypes}" var="leavetype">
											<option value="${leavetype.LeaveTypeName}" 
											<c:set var="type" scope="session"  value="${leavetype.LeaveTypeName}"/>
											<c:set var="oldtype" scope="session" value="${empleave.LeaveType}"/>
											<c:if test="${type eq oldtype}">selected</c:if>
											>${leavetype.LeaveTypeName}</option>
											</c:forEach>
											
										</select>
									</div>
									<div class="input-block mb-3">
										<label class="col-form-label">From <span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input class="form-control datetimepicker" value="${empleave.FromDate}" name="from" type="text">
											<input type="hidden" name="docid" value="${empleave.DocId}"/>
										</div>
									</div>
									<div class="input-block mb-3">
										<label class="col-form-label">To <span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input class="form-control datetimepicker" value="${empleave.ToDate}" name="to" type="text">
										</div>
									</div>
									<div class="input-block mb-3">
										<div class="input-block mb-3">
										<label class="col-form-label">Update Status <span class="text-danger">*</span></label>
										<select class="selected1" name="leavestatus">
										<c:set var="status" scope="session" value="${empleave.LeaveStatus}"/>
											<option>--Select Status--</option>
										
											<option 		
											<c:set var="Approvedstatus" scope="session" value="Approved"/>
											<c:if test="${status eq Approvedstatus}">selected</c:if> >Approved
											</option>
											
											<option
											<c:set var="Declinedstatus" scope="session" value="Declined"/>
											<c:if test="${status eq Declinedstatus}">selected</c:if>>Declined
											</option>
											
											<option
											<c:set var="Newstatus" scope="session" value="New"/>
											<c:if test="${status eq Newstatus}">selected</c:if>>New
											</option>
											
										</select>
									</div>
										
									</div>
									<div class="input-block mb-3">
										<label class="col-form-label">Remaining Leaves <span class="text-danger">*</span></label>
										<input class="form-control" readonly value="12" name="remainingleave" type="text">
									</div>
									<div class="input-block mb-3">
										<label class="col-form-label">Leave Reason <span class="text-danger">*</span></label>
										<textarea rows="4" name="leavereason" class="form-control">${empleave.LeaveReason}</textarea>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Save</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /Edit Leave Modal -->
				
				
				<!-- Delete Leave Modal -->
				<div class="modal custom-modal fade" id="delete_approve${empleave.DocId}" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Delete Leave</h3>
									<p>Are you sure want to Cancel this leave?</p>
								</div>
								<div class="modal-btn delete-action">
									<div class="row">
										<div class="col-6">
											<a href="deleteemployeeLeave?docid=${empleave.DocId}" class="btn btn-primary continue-btn">Delete</a>
										</div>
										<div class="col-6">
											<a href="javascript:void(0);" data-bs-dismiss="modal" class="btn btn-primary cancel-btn">Cancel</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Delete Leave Modal -->
				
										
										</c:forEach>
										</tbody>
								</table>
							</div>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
				<!-- Add Leave Modal -->
				<div id="add_leave" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Leave</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form>
									<div class="input-block mb-3">
										<label class="col-form-label">Leave Type <span class="text-danger">*</span></label>
										<select class="select">
											<option>Select Leave Type</option>
											<option>Casual Leave 12 Days</option>
											<option>Medical Leave</option>
											<option>Loss of Pay</option>
										</select>
									</div>
									<div class="input-block mb-3">
										<label class="col-form-label">From <span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input class="form-control datetimepicker" type="text">
										</div>
									</div>
									<div class="input-block mb-3">
										<label class="col-form-label">To <span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input class="form-control datetimepicker" type="text">
										</div>
									</div>
									<div class="input-block mb-3">
										<label class="col-form-label">Number of days <span class="text-danger">*</span></label>
										<input class="form-control" readonly type="text">
									</div>
									<div class="input-block mb-3">
										<label class="col-form-label">Remaining Leaves <span class="text-danger">*</span></label>
										<input class="form-control" readonly value="12" type="text">
									</div>
									<div class="input-block mb-3">
										<label class="col-form-label">Leave Reason <span class="text-danger">*</span></label>
										<textarea rows="4" class="form-control"></textarea>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /Add Leave Modal -->
				
			
				
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