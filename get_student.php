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
// Code for Subjects
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
  <p> <?php echo htmlentities($row['SubjectName']); ?><input type="text"  name="marks[]" value="" class="form-control" required="" placeholder="Enter marks according out of" autocomplete="off"></p>
  
<?php  }
}
}

?>

<?php
if (!empty($_POST["studclass"]) && isset($_POST["examtype"])) {
    $id = $_POST['studclass'];
    $dta = explode("$", $id);
    $classId = $dta[0];
    $studentId = $dta[1];
    $examTypeId = $_POST['examtype'];

    // // Debugging: print received values
    // echo "<p>Received: classId = $classId, studentId = $studentId, examTypeId = $examTypeId</p>";
    
    $query = $dbh->prepare("SELECT * FROM tblresult 
                            WHERE StudentId = :studentId 
                            AND ClassId = :classId 
                            AND ExamTypeId = :examTypeId");
    $query->bindParam(':studentId', $studentId, PDO::PARAM_STR);
    $query->bindParam(':classId', $classId, PDO::PARAM_STR);
    $query->bindParam(':examTypeId', $examTypeId, PDO::PARAM_STR);
    $query->execute();
    
    if ($query->rowCount() > 0) {
        echo "<p><span style='color:red'>Result Already Declared for this Exam Type.</span></p>";
        echo "<script>$('#submit').prop('disabled', true);</script>";
    } else {
        echo "<script>$('#submit').prop('disabled', false);</script>";
    }
}
?>

