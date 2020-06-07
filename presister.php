
<?php
include_once 'dbconn.php';
if(isset($_POST["btn2"])){
//send to approved professor 
//singleton design pattern 
$db = Database::getInstance();
$mysqli = $db->getConnection(); 

$name=$_POST['name'];
$gender=$_POST['gender'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$faculty = $_POST['faculty'];
$department = $_POST['department'];
$course=$_POST['course'];
$password = $_POST['password'];

$sql_query ="SELECT * FROM professors WHERE email='$email'";
$result = $mysqli->query($sql_query);


if(mysqli_num_rows($result) > 0){

    $row = mysqli_fetch_assoc($result); 
    if($email==$row['email']){ 
    header("location:professor.php?q7=Email Registered!!!");   
 }
}
//send to admin to make approve
else{



$name=$_POST['name'];
$gender=$_POST['gender'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$faculty = $_POST['faculty'];
$department = $_POST['department'];
$course=$_POST['course'];
$password = $_POST['password'];
$conn =new mysqli("localhost","root","","e_exam");  
$insert="INSERT INTO `un_professors`(`name`,`gender`,`email`,`phone`,`faculty`,`department`,`course`,`password`) VALUES ('$name','$gender','$email','$phone','$faculty','$department','$course','$password')";
$query=mysqli_query($conn,$insert);

if($query)
{
header("location:professor.php?q7=wait for your approval Be patient!!");
}
else
{
header("location:professor.php?q7=Email Already Registered!!!");
}
}
}

?>