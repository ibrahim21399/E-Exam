<?php
$con =new mysqli("localhost","root","","e_exam");
session_start();
$email=$_SESSION['email'];

//delete student
if(isset($_SESSION['key'])){
  if(@$_GET['demail'] && $_SESSION['key']=='sunny7785068889') {
  $demail=@$_GET['demail'];
  $r1 = mysqli_query($con,"DELETE FROM rank WHERE email='$demail' ") or die('Error');
  $r2 = mysqli_query($con,"DELETE FROM history WHERE email='$demail' ") or die('Error');
  $result = mysqli_query($con,"DELETE FROM students WHERE email='$demail' ") or die('Error');
  header("location:dashadmin.php?q=1");
  }
  }

//delete professor
if(isset($_SESSION['key'])){
  if(@$_GET['dpemail'] && $_SESSION['key']=='sunny7785068889') {
  $dpemail=@$_GET['dpemail'];
  $result = mysqli_query($con,"DELETE FROM professors WHERE email='$dpemail' ") or die('Error');
  header("location:dashadmin.php?q=2");
  }
  }

//remove quiz
if(@$_GET['q']== 'rmquiz') {
  $eid=@$_GET['eid'];
  $result = mysqli_query($con,"SELECT * FROM questions WHERE eid='$eid' ") or die('Error');
  while($row = mysqli_fetch_array($result)) {
    $qid = $row['qid'];
  $r1 = mysqli_query($con,"DELETE FROM options WHERE qid='$qid'") or die('Error');
  $r2 = mysqli_query($con,"DELETE FROM answer WHERE qid='$qid' ") or die('Error');
  }
  $r3 = mysqli_query($con,"DELETE FROM questions WHERE eid='$eid' ") or die('Error');
  $r4 = mysqli_query($con,"DELETE FROM quiz WHERE eid='$eid' ") or die('Error');
  $r4 = mysqli_query($con,"DELETE FROM history WHERE eid='$eid' ") or die('Error');
  
  header("location:dashadmin.php?q=5");
  }
?>



