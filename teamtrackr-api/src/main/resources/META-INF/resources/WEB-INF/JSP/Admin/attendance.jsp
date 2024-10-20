<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@include  file="../includes/header.jsp"%>
<%@include  file="../includes/sidebar.jsp"%>


<!-- Page Wrapper -->
<div class="page-wrapper">
    <div class="content container-fluid">
    
        <!-- Page Header -->
        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <h3 class="page-title">Attendance</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
                        <li class="breadcrumb-item active">Attendance</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /Page Header -->
        
        <!-- Search Filter -->
        <div class="row filter-row">
            <div class="col-sm-6 col-md-3">  
                <div class="input-block mb-3 form-focus">
                    <input type="text" class="form-control floating">
                    <label class="focus-label">Employee Name</label>
                </div>
            </div>
            <div class="col-sm-6 col-md-3"> 
                <div class="input-block mb-3 form-focus select-focus">
                    <select class="select floating"> 
                        <option>-</option>
                        <option>Jan</option>
                        <option>Feb</option>
                        <option>Mar</option>
                        <option>Apr</option>
                        <option>May</option>
                        <option>Jun</option>
                        <option>Jul</option>
                        <option>Aug</option>
                        <option>Sep</option>
                        <option>Oct</option>
                        <option>Nov</option>
                        <option>Dec</option>
                    </select>
                    <label class="focus-label">Select Month</label>
                </div>
            </div>
            <div class="col-sm-6 col-md-3"> 
                <div class="input-block mb-3 form-focus select-focus">
                    <select class="select floating"> 
                        <option>-</option>
                        <option>2019</option>
                        <option>2018</option>
                        <option>2017</option>
                        <option>2016</option>
                        <option>2015</option>
                    </select>
                    <label class="focus-label">Select Year</label>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">  
                <div class="d-grid">
                    <a href="#" class="btn btn-success"> Search </a>  
                </div>
            </div>     
        </div>
        <!-- /Search Filter -->
        
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table table-striped custom-table table-nowrap mb-0">
                        <thead>
                            <tr>
                                <th>Employee</th>
                                <th>1</th>
                                <th>2</th>
                                <th>3</th>
                                <th>4</th>
                                <th>5</th>
                                <th>6</th>
                                <th>7</th>
                                <th>8</th>
                                <th>9</th>
                                <th>10</th>
                                <th>11</th>
                                <th>12</th>
                                <th>13</th>
                                <th>14</th>
                                <th>15</th>
                                <th>16</th>
                                <th>17</th>
                                <th>18</th>
                                <th>19</th>
                                <th>20</th>
                                <th>22</th>
                                <th>23</th>
                                <th>24</th>
                                <th>25</th>
                                <th>26</th>
                                <th>27</th>
                                <th>28</th>
                                <th>29</th>
                                <th>30</th>
                                <th>31</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <h2 class="table-avatar">
                                        <a class="avatar avatar-xs" href="profile.html"><img src="assets/img/profiles/avatar-09.jpg" alt="User Image"></a>
                                        <a href="profile.html">John Doe</a>
                                    </h2>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td>
                                    <div class="half-day">
                                        <span class="first-off"><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></span> 
                                        <span class="first-off"><i class="fa fa-close text-danger"></i></span>
                                    </div>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td>
                                    <div class="half-day">
                                        <span class="first-off"><i class="fa fa-close text-danger"></i></span> 
                                        <span class="first-off"><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></span>
                                    </div>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                            </tr>
                            <tr>
                                <td>
                                    <h2 class="table-avatar">
                                        <a class="avatar avatar-xs" href="profile.html"><img src="assets/img/profiles/avatar-09.jpg" alt="User Image"></a>
                                        <a href="profile.html">Richard Miles</a>
                                    </h2>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                            </tr>
                            <tr>
                                <td>
                                    <h2 class="table-avatar">
                                        <a class="avatar avatar-xs" href="profile.html"><img src="assets/img/profiles/avatar-10.jpg" alt="User Image"></a>
                                        <a href="profile.html">John Smith</a>
                                    </h2>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                            </tr>
                            <tr>
                                <td>
                                    <h2 class="table-avatar">
                                        <a class="avatar avatar-xs" href="profile.html"><img src="assets/img/profiles/avatar-05.jpg" alt="User Image"></a>
                                        <a href="profile.html">Mike Litorus</a>
                                    </h2>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                            </tr>
                            <tr>
                                <td>
                                    <h2 class="table-avatar">
                                        <a class="avatar avatar-xs" href="profile.html"><img src="assets/img/profiles/avatar-11.jpg" alt="User Image"></a>
                                        <a href="profile.html">Wilmer Deluna</a>
                                    </h2>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                            </tr>
                            <tr>
                                <td>
                                    <h2 class="table-avatar">
                                        <a class="avatar avatar-xs" href="profile.html"><img src="assets/img/profiles/avatar-12.jpg" alt="User Image"></a>
                                        <a href="profile.html">Jeffrey Warden</a>
                                    </h2>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                            </tr>
                            <tr>
                                <td>
                                    <h2 class="table-avatar">
                                        <a class="avatar avatar-xs" href="profile.html"><img src="assets/img/profiles/avatar-13.jpg" alt="User Image"></a>
                                        <a href="profile.html">Bernardo Galaviz</a>
                                    </h2>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                            </tr>
                            <tr>
                                <td>
                                    <h2 class="table-avatar">
                                        <a class="avatar avatar-xs" href="profile.html"><img src="assets/img/profiles/avatar-01.jpg" alt="User Image"></a>
                                        <a href="profile.html">Lesley Grauer</a>
                                    </h2>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                            </tr>
                            <tr>
                                <td>
                                    <h2 class="table-avatar">
                                        <a class="avatar avatar-xs" href="profile.html"><img src="assets/img/profiles/avatar-16.jpg" alt="User Image"></a>
                                        <a href="profile.html">Jeffery Lalor</a>
                                    </h2>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                            </tr>
                            <tr>
                                <td>
                                    <h2 class="table-avatar">
                                        <a class="avatar avatar-xs" href="profile.html"><img src="assets/img/profiles/avatar-04.jpg" alt="User Image"></a>
                                        <a href="profile.html">Loren Gatlin</a>
                                    </h2>
                                </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><i class="fa fa-close text-danger"></i> </td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                                <td><a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#attendance_info"><i class="fa-solid fa-check text-success"></i></a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- /Page Content -->
    
    <!-- Attendance Modal -->
    <div class="modal custom-modal fade" id="attendance_info" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Attendance Info</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card punch-status">
                                <div class="card-body">
                                    <h5 class="card-title">Timesheet <small class="text-muted">11 Mar 2019</small></h5>
                                    <div class="punch-det">
                                        <h6>Punch In at</h6>
                                        <p>Wed, 11th Mar 2019 10.00 AM</p>
                                    </div>
                                    <div class="punch-info">
                                        <div class="punch-hours">
                                            <span>3.45 hrs</span>
                                        </div>
                                    </div>
                                    <div class="punch-det">
                                        <h6>Punch Out at</h6>
                                        <p>Wed, 20th Feb 2019 9.00 PM</p>
                                    </div>
                                    <div class="statistics">
                                        <div class="row">
                                            <div class="col-md-6 col-6 text-center">
                                                <div class="stats-box">
                                                    <p>Break</p>
                                                    <h6>1.21 hrs</h6>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-6 text-center">
                                                <div class="stats-box">
                                                    <p>Overtime</p>
                                                    <h6>3 hrs</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card recent-activity">
                                <div class="card-body">
                                    <h5 class="card-title">Activity</h5>
                                    <ul class="res-activity-list">
                                        <li>
                                            <p class="mb-0">Punch In at</p>
                                            <p class="res-activity-time">
                                                <i class="fa-regular fa-clock"></i>
                                                10.00 AM.
                                            </p>
                                        </li>
                                        <li>
                                            <p class="mb-0">Punch Out at</p>
                                            <p class="res-activity-time">
                                                <i class="fa-regular fa-clock"></i>
                                                11.00 AM.
                                            </p>
                                        </li>
                                        <li>
                                            <p class="mb-0">Punch In at</p>
                                            <p class="res-activity-time">
                                                <i class="fa-regular fa-clock"></i>
                                                11.15 AM.
                                            </p>
                                        </li>
                                        <li>
                                            <p class="mb-0">Punch Out at</p>
                                            <p class="res-activity-time">
                                                <i class="fa-regular fa-clock"></i>
                                                1.30 PM.
                                            </p>
                                        </li>
                                        <li>
                                            <p class="mb-0">Punch In at</p>
                                            <p class="res-activity-time">
                                                <i class="fa-regular fa-clock"></i>
                                                2.00 PM.
                                            </p>
                                        </li>
                                        <li>
                                            <p class="mb-0">Punch Out at</p>
                                            <p class="res-activity-time">
                                                <i class="fa-regular fa-clock"></i>
                                                7.30 PM.
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Attendance Modal -->
    
</div>
<!-- Page Wrapper -->

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