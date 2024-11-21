<?php
session_start();
error_reporting(0);
include('includes/config.php');

if (strlen($_SESSION['alogin']) == "") {   
header("Location: index.php"); 
exit();
} else {

$stid = intval($_GET['stid']);
$examtypeid = intval($_GET['examtypeid']); // Assuming you pass the exam type ID as a parameter

if (isset($_POST['submit'])) {
// Check if id and marks arrays are set and not empty
if (isset($_POST['id']) && isset($_POST['marks'])) {
$rowid = $_POST['id'];
$marks = $_POST['marks']; 
$session = $_POST['session']; // New session input

foreach ($rowid as $count => $id) {
$mrks = $marks[$count];
$iid = $id;

$sql = "UPDATE tblresult SET marks = :mrks, Session = :session WHERE id = :iid";
$query = $dbh->prepare($sql);
$query->bindParam(':mrks', $mrks, PDO::PARAM_STR);
$query->bindParam(':iid', $iid, PDO::PARAM_STR);
$query->bindParam(':session', $session, PDO::PARAM_STR);
$query->execute();
}

$msg = "Result info updated successfully";
} else {
$error = "No results to update";
}
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SMS Admin | Student Result Info</title>
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/select2/select2.min.css">
<link rel="stylesheet" href="css/main.css" media="screen">
<script src="js/modernizr/modernizr.min.js"></script>
</head>
<body class="top-navbar-fixed">
<div class="main-wrapper">

<!-- ========== TOP NAVBAR ========== -->
<?php include('includes/topbar.php');?> 
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
<h2 class="title">Student Result Info</h2>
</div>
</div>

<div class="row breadcrumb-div">
<div class="col-md-6">
<ul class="breadcrumb">
<li><a href="dashboard.php"><i class="fa fa-home"></i> Home</a></li>
<li class="active">Result Info</li>
</ul>
</div>
</div>
</div>

<div class="container-fluid">
<div class="row">
<div class="col-md-12">
<div class="panel">
<div class="panel-heading">
<div class="panel-title">
<h5>Update the Result Info</h5>
</div>
</div>
<div class="panel-body">
<?php if (isset($msg)) { ?>
<div class="alert alert-success left-icon-alert" role="alert">
<strong>Well done!</strong> <?php echo htmlentities($msg); ?>
</div>
<?php } else if (isset($error)) { ?>
<div class="alert alert-danger left-icon-alert" role="alert">
<strong>Oh snap!</strong> <?php echo htmlentities($error); ?>
</div>
<?php } ?>

<form class="form-horizontal" method="post">

<?php 
// Fetch student and class details
$ret = "SELECT tblstudents.StudentName, tblclasses.ClassName, tblclasses.Section, tblresult.Session 
FROM tblresult 
JOIN tblstudents ON tblresult.StudentId = tblstudents.StudentId 
JOIN tblclasses ON tblclasses.id = tblstudents.ClassId 
WHERE tblstudents.StudentId = :stid 
LIMIT 1";
$stmt = $dbh->prepare($ret);
$stmt->bindParam(':stid', $stid, PDO::PARAM_STR);
$stmt->execute();
$student = $stmt->fetch(PDO::FETCH_OBJ);

// Fetch the exam type name
$examSql = "SELECT ExamName 
FROM tblexams 
WHERE id = :examtypeid";
$examStmt = $dbh->prepare($examSql);
$examStmt->bindParam(':examtypeid', $examtypeid, PDO::PARAM_INT);
$examStmt->execute();
$examType = $examStmt->fetch(PDO::FETCH_OBJ);

if ($student) {
?>
<div class="form-group">
<label for="default" class="col-sm-2 control-label">Class</label>
<div class="col-sm-10">
<?php echo htmlentities($student->ClassName) . ' (' . htmlentities($student->Section) . ')'; ?>
</div>
</div>
<div class="form-group">
<label for="default" class="col-sm-2 control-label">Full Name</label>
<div class="col-sm-10">
<?php echo htmlentities($student->StudentName); ?>
</div>
</div>
<div class="form-group">
<label for="default" class="col-sm-2 control-label">Exam Type</label>
<div class="col-sm-10">
<?php echo isset($examType->ExamName) ? htmlentities($examType->ExamName) : 'Not Found'; ?>
</div>
</div>
<div class="form-group">
<label for="session" class="col-sm-2 control-label">Session</label>
<div class="col-sm-10">
<input type="text" name="session" class="form-control" id="session" value="<?php echo htmlentities($student->Session); ?>" required="required">
</div>
</div>
<?php } ?>

<?php 
// Fetch exam results filtered by exam type
$sql = "SELECT tblsubjects.SubjectName, tblresult.marks, tblresult.id AS resultid 
FROM tblresult 
JOIN tblsubjects ON tblsubjects.id = tblresult.SubjectId 
WHERE tblresult.StudentId = :stid AND tblresult.ExamTypeId = :examtypeid";
$query = $dbh->prepare($sql);
$query->bindParam(':stid', $stid, PDO::PARAM_STR);
$query->bindParam(':examtypeid', $examtypeid, PDO::PARAM_INT);
$query->execute();
$results = $query->fetchAll(PDO::FETCH_OBJ);

if ($results) {
foreach ($results as $result) {
?>
<div class="form-group">
<label for="default" class="col-sm-2 control-label"><?php echo htmlentities($result->SubjectName); ?></label>
<div class="col-sm-10">
<input type="hidden" name="id[]" value="<?php echo htmlentities($result->resultid); ?>">
<input type="text" name="marks[]" class="form-control" id="marks" value="<?php echo htmlentities($result->marks); ?>" maxlength="5" required="required" autocomplete="off">
</div>
</div>
<?php 
}
} else {
echo "<p>No results found for the selected exam type.</p>";
}
?>                                                    

<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<button type="submit" name="submit" class="btn btn-primary">Update</button>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
</div>

<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>
<script src="js/prism/prism.js"></script>
<script src="js/select2/select2.min.js"></script>
<script src="js/main.js"></script>
<script>
$(function($) {
$(".js-states").select2();
$(".js-states-limit").select2({
maximumSelectionLength: 2
});
$(".js-states-hide").select2({
minimumResultsForSearch: Infinity
});
});
</script>
</body>
</html>
<?php } ?>
