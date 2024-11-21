<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
include('includes/config.php');

function getOrdinalSuffix($year) {
if (in_array($year % 100, [11, 12, 13])) {
return 'th';
}
switch ($year % 10) {
case 1: return 'st';
case 2: return 'nd';
case 3: return 'rd';
default: return 'th';
}
}

// Retrieve POST data
$rollid = $_POST['rollid'] ?? '';
$classid = $_POST['class'] ?? '';
$attendancetypeid = $_POST['attendancetype'] ?? ''; // Get the selected attendance type
$_SESSION['rollid'] = $rollid;
$_SESSION['classid'] = $classid;

// Fetch student data
$query = "SELECT tblstudents.StudentName, tblstudents.RollId, tblstudents.Semester, tblstudents.RegDate, tblstudents.StudentId, tblstudents.Status, tblclasses.ClassName, tblclasses.Year, tblclasses.Section 
FROM tblstudents 
JOIN tblclasses ON tblclasses.id = tblstudents.ClassId 
WHERE tblstudents.RollId = :rollid AND tblstudents.ClassId = :classid";
$stmt = $dbh->prepare($query);
$stmt->bindParam(':rollid', $rollid, PDO::PARAM_STR);
$stmt->bindParam(':classid', $classid, PDO::PARAM_STR);
$stmt->execute();
$resultss = $stmt->fetchAll(PDO::FETCH_OBJ);


if ($stmt->rowCount() > 0) {
foreach ($resultss as $row) {
// Fetch session data based on the exam type and student ID
$query = "SELECT Session FROM tblattendance WHERE AttendanceTypeId = :attendancetypeid AND StudentId = :studentid";
$stmt = $dbh->prepare($query);
$stmt->bindParam(':attendancetypeid', $attendancetypeid, PDO::PARAM_STR);
$stmt->bindParam(':studentid', $row->StudentId, PDO::PARAM_STR); // Assuming $row->StudentId is the fetched Student ID
$stmt->execute();
$sessionData = $stmt->fetch(PDO::FETCH_OBJ);

if ($sessionData) {
$session = $sessionData->Session;
// echo "StudentId: " . $row->StudentId . " - AttendanceTypeId: " . $attendancetypeid . "<br>";
}else {
    $session = 'N/A'; // Default value when no session data is found
}
// Fetch attendance type name
$sql = "SELECT * FROM tbltattendance WHERE id = :attendancetype";
$query = $dbh->prepare($sql);
$query->bindParam(':attendancetype', $attendancetypeid, PDO::PARAM_STR);
$query->execute();
$attendanceName = $query->fetch(PDO::FETCH_OBJ);
$maxAttendance = $attendanceName->TotalAttendance;

$totalAttendance = 0;
$totalClasses = 0;
$totalPercentage = 0;

// Fetch attendance records for the student 
$query = "SELECT t.StudentName, t.RollId, t.ClassId, t.StudentId, t.Attendance, tblsubjects.SubjectName, tbltattendance.TotalAttendance AS TotalClasses, t.AttendanceTypeId
FROM (SELECT sts.StudentName, sts.RollId, sts.ClassId, sts.StudentId, ta.Attendance, ta.SubjectId, ta.AttendanceTypeId 
FROM tblstudents AS sts 
JOIN tblattendance AS ta ON ta.StudentId = sts.StudentId 
WHERE ta.AttendanceTypeId = :attendancetypeid) AS t 
JOIN tblsubjects ON tblsubjects.id = t.SubjectId 
JOIN tbltattendance ON tbltattendance.id = t.AttendanceTypeId
WHERE t.RollId = :rollid AND t.ClassId = :classid";
$query = $dbh->prepare($query);
$query->bindParam(':rollid', $rollid, PDO::PARAM_STR);
$query->bindParam(':classid', $classid, PDO::PARAM_STR);
$query->bindParam(':attendancetypeid', $attendancetypeid, PDO::PARAM_STR);
$query->execute();
$results = $query->fetchAll(PDO::FETCH_OBJ);

$cnt = 1;
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Attendance Management System</title>
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/main.css" media="screen">
<script src="js/modernizr/modernizr.min.js"></script>
</head>
<body>
<div class="main-wrapper">
<div class="content-wrapper">
<div class="content-container">
<div class="main-page">
<div class="container-fluid">
<div class="row page-title-div">
<div class="col-md-12">
<h2 class="title" style="text-align: center">Attendance Management System</h2>
</div>
</div>
</div>
<section class="section" id="exampl">
<div class="container-fluid">
<div class="row">
<div class="col-md-8 col-md-offset-2">
<div class="panel">
<div class="panel-heading">
<div class="panel-title">
<h2 style="text-align: center"><strong>K. D. K College of Engineering, Nagpur</strong></h2>
<h3 style="text-align: center"><strong>- An Autonomous Institute -</strong></h3>
<h4 style="text-align: center">(NBA & NAAC Accredited)</h4>
<h4 style="text-align: center"><strong>Department of Computer Application</strong></h4>
<h3 style="text-align: center"><strong>Session: </strong><?php echo htmlentities($session); ?></h3>
<h3 style="text-align: center">Attendance Record</h3>
<h4 style="text-align: center"><strong><?php echo htmlentities($attendanceName->AttendanceName); ?></strong></h4>

<hr />

<p><b>Name :</b> <?php echo htmlentities($row->StudentName);?></p>
<p><b>Roll Id :</b> <?php echo htmlentities($row->RollId);?></p>
<p><b>Class:</b> <?php echo htmlentities($row->ClassName);?>-<?php echo htmlentities($row->Year);?><sup><?php echo getOrdinalSuffix($row->Year);?></sup></p>
<p><b>Semester :</b> <?php echo htmlentities($row->Semester);?></p>
<?php
}
}
?>
</div>
<div class="panel-body p-20">
<table class="table table-hover table-bordered" border="1" width="100%">
<thead>
<tr style="text-align: center">
<th style="text-align: center">Sr. No</th>
<th style="text-align: center">Subject</th>    
<th style="text-align: center">Total Classese</th>    
<th style="text-align: center">Attendance</th>
<th style="text-align: center">Percentage</th>
</tr>
</thead>
<tbody>
<?php



if ($query->rowCount() > 0) {
foreach ($results as $result) {
$attendancePercentage = ($result->Attendance / $result->TotalClasses) * 100;
$totalAttendance += $result->Attendance;
$totalClasses += $result->TotalClasses;
?>
<tr>
<th scope="row" style="text-align: center"><?php echo htmlentities($cnt);?></th>
<td style="text-align: center"><?php echo htmlentities($result->SubjectName);?></td>
<td style="text-align: center"><?php echo htmlentities($result->TotalClasses);?></td>
<td style="text-align: center"><?php echo htmlentities($result->Attendance);?></td>
<td style="text-align: center"><?php echo htmlentities(number_format($attendancePercentage, 2));?>%</td>
</tr>

<?php 
$cnt++;
}
// Final update for overall result status
$totalPercentage = ($totalAttendance / $totalClasses) * 100;
} else {
echo "<tr><td colspan='5' style='text-align: center'>No Results Found</td></tr>";
}
?>
<tr>
<th scope="row" colspan="3" style="text-align: center">Total Attendance</th>
<td  colspan="2" style="text-align: center"><b><?php echo htmlentities($totalAttendance); ?></b> out of <b><?php echo htmlentities($totalClasses); ?></b>

</td>
</tr>
<tr>
<th scope="row" colspan="3" style="text-align: center">Percentage</th>           
<td colspan="2" style="text-align: center"><b><?php echo htmlentities(number_format($totalPercentage, 2)); ?> %</b></td>
</tr>
<tr>
<th scope="row" colspan="3" style="text-align: center">Final Result</th>           
<td colspan="2" style="text-align: center"><b>
<?php 
$overallPassStatus = $totalPercentage >= 75 ? 'Passed' : 'Failed';
echo htmlentities($overallPassStatus); 
?>
</b></td>
</tbody>
</table>
</div>
<br>


<div style="text-align: center">
<i class="fa fa-print fa-2x" aria-hidden="true" style="cursor:pointer" OnClick="CallPrint()"></i>
</div>
<br>
<br>

<div class="form-group" style="display: flex; justify-content: space-between;">
    <div class="col-sm-6" style="text-align: left;">
        <p><strong>Class Incharge Sign.</strong></p>
    </div>
    <div class="col-sm-6" style="text-align: right;">
        <p><strong>Parent Sign.</strong></p>
    </div>
</div>


<br>


<!-- <div class="text-center">
<button onclick="CallPrint()" class="btn btn-primary">Print</button>
</div> -->

</div>
</div>
</div>
</div>
</div>
</section>
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
<script src="js/main.js"></script>
<script>

function CallPrint() {
    var prtContent = document.getElementById("exampl");
    var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
    WinPrint.document.write('<html><head><title>Print</title>');
    WinPrint.document.write('<style>h2, h3, h4 { margin: 0; text-align: center; }</style>');
    WinPrint.document.write('</head><body>');
    WinPrint.document.write(prtContent.innerHTML);
    WinPrint.document.write('</body></html>');
    WinPrint.document.close();
    WinPrint.focus();
    WinPrint.print();
}

</script>
</body>
</html>
