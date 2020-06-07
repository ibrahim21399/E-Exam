<?php
if(@$_GET['demail']){
$conn =new mysqli("localhost","root","","e_exam");
$demail=@$_GET['demail'];
$result = mysqli_query($conn,"SELECT * FROM un_professors WHERE email='$demail'") or die('Error');
while($row = mysqli_fetch_array($result)) {  
	$name = $row['name'];
	$gender = $row['gender'];
    $email = $row['email'];
    $phone = $row['phone'];
    $faculty = $row['faculty'];
    $department = $row ['department'];
    $course = $row['course'];
    $password=$row['password'];
}
$insert="INSERT INTO `professors`(`name`,`gender`,`email`,`phone`,`faculty`,`department`,`course`,`password`) VALUES ('$name','$gender','$email','$phone','$faculty','$department','$course','$password')";
$query=mysqli_query($conn,$insert);


if($query)
{
$result = mysqli_query($conn,"DELETE FROM un_professors WHERE email='$demail'") or die('Error');
       
header("location:dashadmin.php?q=4");
}
else
{
header("location:dashadmin.php?q=4");
}
}
//dont approve student 
//delete student
    if(@$_GET['nemail']) {
    $nemail=@$_GET['nemail'];
    $conn =new mysqli("localhost","root","","e_exam");
    $result = mysqli_query($conn,"DELETE FROM un_professors WHERE email='$nemail'") or die('Error');
    header("location:dashadmin.php?q=4");
    }
    
?>