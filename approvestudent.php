<?php
if(@$_GET['demail']){
$conn =new mysqli("localhost","root","","e_exam");
$demail=@$_GET['demail'];
$result = mysqli_query($conn,"SELECT * FROM un_students WHERE email='$demail'") or die('Error');
while($row = mysqli_fetch_array($result)) {  
	$name = $row['name'];
	$gender = $row['gender'];
    $email = $row['email'];
    $studentcode = $row['studentcode'];
    $phone = $row['phone'];
    $faculty = $row['faculty'];
    $level = $row['level'];
    $department = $row ['department'];
    $password=$row['password'];
}
$insert="INSERT INTO `students`(`name`,`gender`,`email`,`studentcode`,`phone`,`faculty`,`level`,`department`,`password`) VALUES ('$name','$gender','$email','$studentcode','$phone','$faculty','$level','$department','$password')";
$query=mysqli_query($conn,$insert);


if($query)
{
$result = mysqli_query($conn,"DELETE FROM un_students WHERE email='$demail'") or die('Error');
       
header("location:dashadmin.php?q=3");
}
else
{
header("location:dashadmin.php?q=3");
}
}
//dont approve student 
//delete student
    if(@$_GET['nemail']) {
    $nemail=@$_GET['nemail'];
    $conn =new mysqli("localhost","root","","e_exam");
    $result = mysqli_query($conn,"DELETE FROM un_students WHERE email='$nemail'") or die('Error');
    header("location:dashadmin.php?q=3");
    }
    
?>
