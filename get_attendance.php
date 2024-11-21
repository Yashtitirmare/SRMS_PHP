<?php
include('includes/config.php');

if(!empty($_POST["classid"])) 
{
 $cid=intval($_POST['classid']);
 if(!is_numeric($cid)){
 
 	echo htmlentities("invalid Class");exit;
 }
 else{
 $stmt = $dbh->prepare("SELECT StudentName,StudentId FROM tblstudents WHERE ClassId= :id order by StudentName");
 $stmt->execute(array(':id' => $cid));
 ?><option value="">Select Student </option><?php
 while($row=$stmt->fetch(PDO::FETCH_ASSOC))
 {
  ?>
  <option value="<?php echo htmlentities($row['StudentId']); ?>"><?php echo htmlentities($row['StudentName']); ?></option>
  <?php
 }
}

}


//attendance subject id
if(!empty($_POST["classid1"])) 
{
 $cid1=intval($_POST['classid1']);
 if(!is_numeric($cid1)){
 
  echo htmlentities("invalid Class");exit;
 }
 else{
 $status=0;	
 $stmt = $dbh->prepare("SELECT tblsubjects.SubjectName,tblsubjects.id FROM tblsubjectcombination join  tblsubjects on  tblsubjects.id=tblsubjectcombination.SubjectId WHERE tblsubjectcombination.ClassId=:cid and tblsubjectcombination.status!=:stts order by tblsubjects.SubjectName");
 $stmt->execute(array(':cid' => $cid1,':stts' => $status));
 
 while($row=$stmt->fetch(PDO::FETCH_ASSOC))
 {?>
  <p> <?php echo htmlentities($row['SubjectName']); ?><input type="text"  name="attendance[]" value="" class="form-control" required="" placeholder="Enter total attendent classes out of 100" autocomplete="off"></p>
  
<?php  }
}
}
?>



<?php
if (!empty($_POST["studclass"])) {
    $id = $_POST['studclass'];
    $dta = explode("$", $id);
    $classId = $dta[0];
    $studentId = $dta[1];
    $attendanceTypeId = $_POST['attendancetype'];
    $query = $dbh->prepare("SELECT * FROM tblattendance
                            WHERE StudentId = :studentId 
                            AND ClassId = :classId
                            AND AttendanceTypeId = :attendanceTypeId");
    $query->bindParam(':studentId', $studentId, PDO::PARAM_STR);
    $query->bindParam(':classId', $classId, PDO::PARAM_STR);
    $query->bindParam(':attendanceTypeId', $attendanceTypeId, PDO::PARAM_STR);
    $query->execute();
    
    if ($query->rowCount() > 0) {
        echo "<p><span style='color:red'>Attendence Already Declared for this Student.</span></p>";
        echo "<script>$('#submit').prop('disabled', true);</script>";
    } else {
        echo "<script>$('#submit').prop('disabled', false);</script>";
    }
}
?>

