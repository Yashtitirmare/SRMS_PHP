<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])=="") {   
header("Location: index.php"); 
} else {
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Learner Report</title>
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
<link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
<link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
<link rel="stylesheet" type="text/css" href="js/DataTables/datatables.min.css"/>
<link rel="stylesheet" href="css/main.css" media="screen" >
<script src="js/modernizr/modernizr.min.js"></script>
<style>
.errorWrap {
padding: 10px;
margin: 0 0 20px 0;
background: #fff;
border-left: 4px solid #dd3d36;
-webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
padding: 10px;
margin: 0 0 20px 0;
background: #fff;
border-left: 4px solid #5cb85c;
-webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
</style>
</head>
<body class="top-navbar-fixed">
<div class="main-wrapper">

<!-- ========== TOP NAVBAR ========== -->
<?php include('includes/topbar.php');?> 
<!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
<div class="content-wrapper">
<div class="content-container">
<?php include('includes/leftbar.php');?>  

<div class="main-page">
<div class="container-fluid">
<div class="row page-title-div">
<div class="col-md-6">
<h2 class="title">Learner Category Report</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class="row breadcrumb-div">
<div class="col-md-6">
<ul class="breadcrumb">
<li><a href="dashboard.php"><i class="fa fa-home"></i> Home</a></li>
<li> Gadget</li>
<li class="active">Learner Category Report</li>
</ul>
</div>

</div>
<!-- /.row -->
</div>
<!-- /.container-fluid -->

<section class="section">
<div class="container-fluid">

<div class="row">
<div class="col-md-12">

<div class="panel">
<div class="panel-heading">
<div class="panel-title">
<h5>View Learner Category Report Info</h5>
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
<div class="panel-body p-20">

<table id="example" class="display table table-striped table-bordered" cellspacing="0" width="100%">
<thead>
        <tr>
            <th>Sr.no</th>
            <th>Session</th>
            <th>Class Name</th>
            <th>Year</th>
            <th>Section</th>
            <th>Exam Name</th>
            <th>Fast</th>
            <th>Slow</th>
            <th>Weak</th>
            <th>Fail</th>
            <th>Action</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>Sr.no</th>
            <th>Session</th>
            <th>Class Name</th>
            <th>Year</th>
            <th>Section</th>
            <th>Exam Name</th>
            <th>Fast</th>
            <th>Slow</th>
            <th>Weak</th>
            <th>Fail</th>
            <th>Action</th>
        </tr>
    </tfoot>
<tbody>
<?php
try {
    // Check if data already exists before insertion
    $checkSql = "SELECT COUNT(*) FROM tblLearnerCategoryCount 
                 WHERE Session = :session 
                   AND ExamName = :examName 
                   AND ClassName = :className
                   AND Year = :year
                   AND Section = :section";
    $checkQuery = $dbh->prepare($checkSql);
    $checkQuery->bindParam(':session', $session);
    $checkQuery->bindParam(':examName', $examName);
    $checkQuery->bindParam(':className', $className);
    $checkQuery->bindParam(':year', $year);
    $checkQuery->bindParam(':section', $section);
    $checkQuery->execute();

    if ($checkQuery->fetchColumn() == 0) {
        // Insert data if it does not exist
        $sql = "INSERT INTO tblLearnerCategoryCount (ExamName, Session, ClassName, Year, Section, Fast, Slow, Weak, Fail)
        SELECT 
            tblexams.ExamName,
            tbllearner.Session,
            tblclasses.ClassName,
            tblclasses.Year, 
            tblclasses.Section, 
            SUM(CASE WHEN tbllearner.LearnerCategory = 'Fast' THEN 1 ELSE 0 END) AS FastCount,
            SUM(CASE WHEN tbllearner.LearnerCategory = 'Slow' THEN 1 ELSE 0 END) AS SlowCount,
            SUM(CASE WHEN tbllearner.LearnerCategory = 'Weak' THEN 1 ELSE 0 END) AS WeakCount,
            SUM(CASE WHEN tbllearner.LearnerCategory = 'Fail' THEN 1 ELSE 0 END) AS FailCount
        FROM tbllearner
        JOIN tblexams ON tblexams.id = tbllearner.ExamTypeId
        JOIN tblclasses ON tblclasses.id = tbllearner.ClassId 
        GROUP BY tblexams.ExamName, tbllearner.Session, tblclasses.ClassName, tblclasses.Year, tblclasses.Section
        ON DUPLICATE KEY UPDATE
            Fast = VALUES(Fast),
            Slow = VALUES(Slow),
            Weak = VALUES(Weak),
            Fail = VALUES(Fail)";
                
        $query = $dbh->prepare($sql);
        $query->execute();
    } else {
        echo "Data already exists.";
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}


// Fetch and display data from tblLearnerCategory
// Fetch data from tblLearnerCategoryCount
$fetchSql = "SELECT * FROM tblLearnerCategoryCount";
$fetchQuery = $dbh->prepare($fetchSql);
$fetchQuery->execute();

$results = $fetchQuery->fetchAll(PDO::FETCH_OBJ);
$cnt = 1;

if ($fetchQuery->rowCount() > 0) {
    foreach ($results as $result) { ?>
    <tr>
        <td><?php echo htmlentities($cnt); ?></td>
        <td><?php echo htmlentities($result->Session); ?></td>
        <td><?php echo htmlentities($result->ClassName); ?></td>
        <td><?php echo htmlentities($result->Year); ?></td>
        <td><?php echo htmlentities($result->Section); ?></td>
        <td><?php echo htmlentities($result->ExamName); ?></td>
        <td><?php echo htmlentities($result->Fast); ?></td>
        <td><?php echo htmlentities($result->Slow); ?></td>
        <td><?php echo htmlentities($result->Weak); ?></td>
        <td><?php echo htmlentities($result->Fail); ?></td>
        <td>
            <a href="edit-result.php?stid=<?php echo htmlentities($result->StudentId); ?>&examtypeid=<?php echo htmlentities($result->ExamTypeId); ?>" class="btn btn-primary btn-xs">View</a>
        </td>
    </tr>
    <?php $cnt++; }
} else {
    echo "<tr><td colspan='9'>No data found</td></tr>";
}

?>

</tbody>
</table>

</div>
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

<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>

<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script src="js/DataTables/datatables.min.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>
<script>
$(function($) {
$('#example').DataTable();

$('#example2').DataTable( {
"scrollY":        "300px",
"scrollCollapse": true,
"paging":         false
} );

$('#example3').DataTable();
});
</script>
</body>
</html>
<?php } ?>
