<?php
session_start();

if (isset($_POST["logs2"])) {

$email = $_POST['email'];
$password = $_POST['password'];
$conn =new mysqli("localhost","root","","e_exam");
$result = mysqli_query($conn,"SELECT name FROM professors WHERE email = '$email' and password = '$password'") or die('Error');
$count=mysqli_num_rows($result);
if($count==1){
while($row = mysqli_fetch_array($result)) {
	$name = $row['name'];
}
$_SESSION["name"] = $name;
$_SESSION["email"] = $email;
header("location:dash.php");
}
else
header("location:$ref?w=Wrong Username or Password");


}
?>