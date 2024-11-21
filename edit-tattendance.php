<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])=="")
{   
header("Location: index.php"); 
}
else{
if(isset($_POST['update']))
{
$attendancename=$_POST['attendancename'];
$attendancenamenumeric=$_POST['attendancenamenumeric']; 
$attendancecode=$_POST['attendancecode'];
$totalattendance=$_POST['totalattendance'];
$eid=intval($_GET['attendanceid']);
$sql="update  tbltattendance set AttendanceName=:attendancename,AttendanceNameNumeric=:attendancenamenumeric,AttendanceCode=:attendancecode, TotalAttendance=:totalattendance where id=:eid ";
$query = $dbh->prepare($sql);
$query->bindParam(':attendancename',$attendancename,PDO::PARAM_STR);
$query->bindParam(':attendancenamenumeric',$attendancenamenumeric,PDO::PARAM_STR);
$query->bindParam(':attendancecode',$attendancecode,PDO::PARAM_STR);
$query->bindParam(':totalattendance',$totalattendance,PDO::PARAM_STR);
$query->bindParam(':eid',$eid,PDO::PARAM_STR);
$query->execute();
$msg="Data has been updated successfully";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SMS Admin Update Class Attendance</title>
<link rel="stylesheet" href="css/bootstrap.css" media="screen" >
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
<link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
<link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
<link rel="stylesheet" href="css/main.css" media="screen" >
<script src="js/modernizr/modernizr.min.js"></script>
</head>
<body class="top-navbar-fixed">
<div class="main-wrapper">

<!-- ========== TOP NAVBAR ========== -->
<?php include('includes/topbar.php');?>   
<!-----End Top bar>
<!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
<div class="content-wrapper">
<div class="content-container">

<!-- ========== LEFT SIDEBAR ========== -->
<?php include('includes/leftbar.php');?>                   
<!-- /.left-sidebar -->

<div class="main-page">
<div class="container-fluid">
<div class="row page-title-div">
<div class="col-md-6">
<h2 class="title">Update Class Attendance</h2>
</div>

</div>
<!-- /.row -->
<div class="row breadcrumb-div">
<div class="col-md-6">
<ul class="breadcrumb">
<li><a href="dashboard.php"><i class="fa fa-home"></i> Home</a></li>
<li><a href="#">Attendance</a></li>
<li class="active">Update Attendance</li>
</ul>
</div>

</div>
<!-- /.row -->
</div>
<!-- /.container-fluid -->

<section class="section">
<div class="container-fluid">





<div class="row">
<div class="col-md-8 col-md-offset-2">
<div class="panel">
<div class="panel-heading">
<div class="panel-title">
<h5>Update Class Attendance info</h5>
</div>
</div>
<?php if($msg){?>
<div class="alert alert-success left-icon-alert" role="alert">
<strong>Well done!</strong><?php echo htmlentities($msg); ?>
</div><?php } 
else if($error){?>
<div class="alert alert-danger left-icon-alert" role="alert">
<strong>Oh snap!</strong> <?php echo htmlentities($error); ?>
</div>
<?php } ?>
<div class="panel-body">
<form method="post">
<?php 
$eid=intval($_GET['attendanceid']);
$sql = "SELECT * from tbltattendance where id=:eid";
$query = $dbh->prepare($sql);
$query->bindParam(':eid',$eid,PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{   ?>

<div class="form-group has-success">
<label for="success" class="control-label">Attendance Name</label>
<div class="">
<input type="text" name="attendancename" value="<?php echo htmlentities($result->AttendanceName);?>" required="required" class="form-control" id="success">
<span class="help-block">Eg- Third, Fouth,Sixth etc</span>
</div>
</div>
<div class="form-group has-success">
<label for="success" class="control-label">Attendance Name in Numeric</label>
<div class="">
<input type="number" name="attendancenamenumeric" value="<?php echo htmlentities($result->AttendanceNameNumeric);?>" required="required" class="form-control" id="success">
<span class="help-block">Eg- 1,2,4,5 etc</span>
</div>
</div>
<div class="form-group has-success">
<label for="success" class="control-label">Attendance Code</label>
<div class="">
<input type="text" name="attendancecode" value="<?php echo htmlentities($result->AttendanceCode);?>" class="form-control" required="required" id="success">
<span class="help-block">Eg- A,B,C etc</span>
</div>
</div>
<div class="form-group has-success">
<label for="success" class="control-label">Total Attendance</label>
<div class="">
<input type="text" name="totalattendance" value="<?php echo htmlentities($result->TotalAttendance);?>" class="form-control" required="required" id="success">
<span class="help-block">Eg- 20,50,80 etc</span>
</div>
</div>
<?php }} ?>
<div class="form-group has-success">

<div class="">
<button type="submit" name="update" class="btn btn-success btn-labeled">Update<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
</div>



</form>
</div>

</div>
</div>
</div>
<!-- /.col-md-8 col-md-offset-2 -->
</div>
<!-- /.row -->




</div>
<!-- /.container-fluid -->
</section>
<!-- /.section -->

</div>
<!-- /.main-page -->


<!-- /.right-sidebar -->

</div>
<!-- /.content-container -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->

<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>

<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>



<!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
</body>
</html>
<?php  } ?>
