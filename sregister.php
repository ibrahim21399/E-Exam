<?php
include_once 'dbconn.php';
if(isset($_POST["btn"])){
$name=$_POST['name'];
$gender=$_POST['gender'];
$email = $_POST['email'];
$studentcode = $_POST['studentcode'];
$phone = $_POST['phone'];
$faculty = $_POST['faculty'];
$level = $_POST['level'];
$department = $_POST['department'];
$password = $_POST['password'];

$db = Database::getInstance();
$mysqli = $db->getConnection(); 
$sql_query = "INSERT INTO `students`(`name`,`gender`,`email`,`studentcode`,`phone`,`faculty`,`level`,`department`,`password`) VALUES ('$name','$gender','$email','$studentcode','$phone','$faculty','$level','$department','$password')";
$result = $mysqli->query($sql_query);

if($result)
{
session_start();
$_SESSION["email"] = $email;
$_SESSION["name"] = $name;

header("location:account.php?q=1");
}
else
{
header("location:index.php?q7=Email Already Registered!!!");
}
}
?>