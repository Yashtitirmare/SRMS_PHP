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
$examtypeid = $_POST['examtype'] ?? ''; // Get the selected exam type
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

$session = 'N/A'; // Default value if no session data is found

if ($stmt->rowCount() > 0) {
foreach ($resultss as $row) {
// Fetch session data based on the exam type and student ID
$query = "SELECT Session FROM tblresult WHERE ExamTypeId = :examtypeid AND StudentId = :studentid";
$stmt = $dbh->prepare($query);
$stmt->bindParam(':examtypeid', $examtypeid, PDO::PARAM_STR);
$stmt->bindParam(':studentid', $row->StudentId, PDO::PARAM_STR); // Assuming $row->StudentId is the fetched Student ID
$stmt->execute();
$sessionData = $stmt->fetch(PDO::FETCH_OBJ);

if ($sessionData) {
$session = $sessionData->Session;
}
// Fetch exam name
$sql = "SELECT * FROM tblexams WHERE id = :examtype";
$query = $dbh->prepare($sql);
$query->bindParam(':examtype', $examtypeid, PDO::PARAM_STR);
$query->execute();
$examName = $query->fetch(PDO::FETCH_OBJ);
$maxMarks = $examName->Marks;
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Result Management System</title>
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
<h2 class="title" style="text-align: center">Result Management System</h2>
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
<h3 style="text-align: center">Score Card</h3>
<h4 style="text-align: center"><strong><?php echo htmlentities($examName->ExamName); ?></strong></h4>

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
<th style="text-align: center">Out of Marks</th>    
<th style="text-align: center">Marks</th>
<th style="text-align: center">Grade</th>
</tr>
</thead>
<tbody>
<?php
// Fetch results for the student 
$query = "SELECT t.StudentName, t.RollId, t.ClassId,t.StudentId, t.marks, tblsubjects.SubjectName, tblexams.Marks AS OutOfMarks, t.ExamTypeId
FROM (SELECT sts.StudentName, sts.RollId, sts.ClassId, sts.StudentId, tr.marks, tr.SubjectId, tr.ExamTypeId 
FROM tblstudents AS sts 
JOIN tblresult AS tr ON tr.StudentId = sts.StudentId 
WHERE tr.ExamTypeId = :examtypeid) AS t 
JOIN tblsubjects ON tblsubjects.id = t.SubjectId 
JOIN tblexams ON tblexams.id = t.ExamTypeId
WHERE t.RollId = :rollid AND t.ClassId = :classid";
$query = $dbh->prepare($query);
$query->bindParam(':rollid', $rollid, PDO::PARAM_STR);
$query->bindParam(':classid', $classid, PDO::PARAM_STR);
$query->bindParam(':examtypeid', $examtypeid, PDO::PARAM_STR);
$query->execute();
$results = $query->fetchAll(PDO::FETCH_OBJ);


$cnt = 1;
$totlcount = 0;
$outofTotal = 0;

// Arrays to hold subjects by grade
$weakLearnerSubjects = [];
$fastLearnerSubjects = [];
$normalLearnerSubjects = [];
$FailInSubject = [];

$overallPassStatus = "Pass";


if ($query->rowCount() > 0) {
foreach ($results as $result) {
     // Debugging output to check what properties are available
    //  var_dump($result);
        
        $studentName = isset($result->StudentName) ? $result->StudentName : 'Unknown';
        $examType = isset($result->ExamTypeId) ? $result->ExamTypeId : 'Unknown';
        $subjectName = isset($result->SubjectName) ? $result->SubjectName : 'Unknown';
        $marks = isset($result->Marks)? $result->Marks :'Unknown';
        $studentId = isset($result->StudentId) ? $result->StudentId : 'Unknown'; // Added StudentId
        $rollid = isset($result->RollId) ? $result->RollId : 'Unknown'; // Added StudentId
        $passStatus = "Pass"; // Default value
        $combinedClassName = $row->ClassName . '-' . $row->Year . '-' . $row->Section;


        //
        $percentage = ($result->marks / $result->OutOfMarks) * 100;
        $learnerCategory = '';
        $grade = '';
        
        
        if ($percentage >= 80) {
            $grade = "A";
            $fastLearnerSubjects[] = $subjectName;
            $learnerCategory = 'Fast';
        } elseif ($percentage >= 50) {
            $grade = "B";
            $normalLearnerSubjects[] = $subjectName;
            $learnerCategory = 'Slow';
        } elseif ($percentage >= 40) {
            $grade = "C";
            $weakLearnerSubjects[] = $subjectName;
            $learnerCategory = 'Weak';
        } else {
            $grade = "D";
            $FailInSubject[] = $subjectName;
            $learnerCategory = 'Fail';
            $overallPassStatus = "Fail";
            $passStatus = "Fail";
        }

        // Check if record exists
        $checkSql = "SELECT 1 FROM tbllearner 
        WHERE ClassID = :classId 
        AND ExamTypeId = :examType 
        AND StudentId = :studentId 
        AND SubjectName = :subjectName";
        $checkStmt = $dbh->prepare($checkSql);
        $checkStmt->execute([
        ':classId' => $result->ClassId, 
        ':examType' => $result->ExamTypeId, 
        ':studentId' => $studentId, 
        ':subjectName' => $subjectName
        ]);

        $sql = "INSERT INTO tbllearner (ClassID, ExamTypeId, StudentId, StudentName, RollId, SubjectName, marks, LearnerCategory, Grade, PassStatus, ResultStatus, Session, CombinedClassName) 
        VALUES (:classId, :examType, :studentId, :studentName, :rollid, :subjectName, :marks, :learnerCategory, :grade, :passStatus, :resultStatus, :session, :combinedClassName)
        ON DUPLICATE KEY UPDATE
        StudentName = VALUES(StudentName),
        RollId = VALUES(RollId),
        marks = VALUES(marks),
        LearnerCategory = VALUES(LearnerCategory),
        Grade = VALUES(Grade),
        PassStatus = VALUES(PassStatus),
        ResultStatus = VALUES(ResultStatus),
        Session = VALUES(Session),
        CombinedClassName = VALUES(CombinedClassName)";

        $stmt = $dbh->prepare($sql);
        $stmt->execute([
            ':classId' => $result->ClassId, 
            ':examType' => $result->ExamTypeId, 
            ':studentId' => $studentId, 
            ':studentName' => $result->StudentName,
            ':rollid' => $result->RollId,
            ':subjectName' => $result->SubjectName,
            ':marks' => $result->marks,
            ':learnerCategory' => $learnerCategory,
            ':grade' => $grade,
            ':passStatus' => $passStatus,
            ':resultStatus' => $passStatus,
            ':session' => $session,
            ':combinedClassName' => $combinedClassName,
        ]);

$totlcount += $result->marks;
$outofTotal += $result->OutOfMarks;

?>
<tr>
<th scope="row" style="text-align: center"><?php echo htmlentities($cnt);?></th>
<td style="text-align: center"><?php echo htmlentities($result->SubjectName);?></td>
<td style="text-align: center"><?php echo htmlentities($result->OutOfMarks);?></td>
<td style="text-align: center"><?php echo htmlentities($result->marks);?></td>
<td style="text-align: center"><?php echo htmlentities($grade);?></td>
</tr>

<?php 
$cnt++;
}// End of results loop
// Final update for overall result status
$finalSql = "UPDATE tbllearner 
SET ResultStatus = :resultStatus
WHERE StudentId = :studentId AND ExamTypeId = :examTypeId";
$finalStmt = $dbh->prepare($finalSql);
$finalStmt->execute([
':resultStatus' => $overallPassStatus,
':studentId' => $studentId,
':examTypeId' => $examtypeid
]);
} else {
echo "<tr><td colspan='5' style='text-align: center'>No Results Found</td></tr>";
}
?>
<tr>
<th scope="row" colspan="3" style="text-align: center">Total Marks</th>
<td  colspan="2" style="text-align: center"><b><?php echo htmlentities($totlcount); ?></b> out of <b><?php echo htmlentities($outofTotal); ?></b>
<!-- Display Overall Grade according to total marks-->
[Grade - 
<b>
<?php 
$totalPercentage = ($totlcount / $outofTotal) * 100;
if ($totalPercentage >= 80) {
echo "A";
} elseif ($totalPercentage >= 50) {
echo "B";
} elseif ($totalPercentage >= 40) {
echo "C";
} else {
echo "D";
}
?>
</b>]
</td>
</tr>
<tr>
<th scope="row" colspan="3" style="text-align: center">Percentage</th>           
<td colspan="2" style="text-align: center"><b><?php echo htmlentities($totalPercentage); ?> %</b></td>
</tr>
<tr>
<th scope="row" colspan="3" style="text-align: center">Final Result</th>           
<td colspan="2" style="text-align: center"><b><?php echo htmlentities($overallPassStatus); ?></b></td>
</tr>
</tbody>
</table>
</div>
<br>
<hr>
<br>
<!-- <hr /> -->
<div class="panel-body p-20">
<table class="table table-hover table-bordered" border="1" width="100%">
<thead>
<tr style="text-align: center">
<th style="text-align: center">Learner Category</th>
<th style="text-align: center">Subjects</th>    
</tr>
</thead>
<tbody>
<tr>
<th scope="row" colspan="1" style="text-align: center">Fast Learner Subjects (Grade A)</th>           
<td colspan="1" style="text-align: center"><?php echo !empty($fastLearnerSubjects) ? implode(", ", $fastLearnerSubjects) : "None"; ?></td>
</tr>
<tr>
<th scope="row" colspan="1" style="text-align: center">Slow Learner Subjects (Grade B)</th>           
<td colspan="1" style="text-align: center"><?php echo !empty($normalLearnerSubjects) ? implode(", ", $normalLearnerSubjects) : "None"; ?></td>
</tr>
<tr>
<th scope="row" colspan="1" style="text-align: center">Weak Learner Subjects (Grade C)</th>           
<td colspan="1" style="text-align: center"><?php echo !empty($weakLearnerSubjects) ? implode(", ", $weakLearnerSubjects) : "None"; ?></td>
</tr>
<tr>
<th scope="row" colspan="1" style="text-align: center">Fail In Subjects (Grade D)</th>           
<td colspan="1" style="text-align: center"><?php echo !empty($FailInSubject) ? implode(", ", $FailInSubject) : "None"; ?></td>
</tr>
</tbody>
</table>
</div>

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
