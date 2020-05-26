<?php
if(isset($_POST["btn2"])){
$name=$_POST['name'];
$gender=$_POST['gender'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$faculty = $_POST['faculty'];
$department = $_POST['department'];
$course=$_POST['course'];
$password = $_POST['password'];

$conn =new mysqli("localhost","root","","e_exam");
$insert="INSERT INTO `professors`(`name`,`gender`,`email`,`phone`,`faculty`,`department`,`course`,`password`) VALUES ('$name','$gender','$email','$phone','$faculty','$department','$course','$password')";

$query=mysqli_query($conn,$insert);

if($query)
{
session_start();
$_SESSION["email"] = $email;
$_SESSION["name"] = $name;

header("location:dash.php?q=1");
}
else
{
header("location:index.php?q7=Email Already Registered!!!");
}
}
?>