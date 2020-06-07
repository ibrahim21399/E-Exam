 <?php
include_once 'dbconn.php';
if(isset($_POST["btn"])){
//send to approved students
//singleton design pattern 
$db = Database::getInstance();
$mysqli = $db->getConnection(); 

$name=$_POST['name'];
$gender=$_POST['gender'];
$email = $_POST['email'];
$studentcode = $_POST['studentcode'];
$phone = $_POST['phone'];
$faculty = $_POST['faculty'];
$level = $_POST['level'];
$department = $_POST['department'];
$password = $_POST['password'];

$sql_query ="SELECT * FROM students WHERE email='$email'";
$result = $mysqli->query($sql_query);


if(mysqli_num_rows($result) > 0){

    $row = mysqli_fetch_assoc($result); 
    if($email==$row['email']){ 
    header("location:index.php?q7=Email Registered!!!");   
 }
}
//send to admin to make approve
else{



$name=$_POST['name'];
$gender=$_POST['gender'];
$email = $_POST['email'];
$studentcode = $_POST['studentcode'];
$phone = $_POST['phone'];
$faculty = $_POST['faculty'];
$level = $_POST['level'];
$department = $_POST['department'];
$password = $_POST['password'];
$conn =new mysqli("localhost","root","","e_exam");  
$insert="INSERT INTO `un_students`(`name`,`gender`,`email`,`studentcode`,`phone`,`faculty`,`level`,`department`,`password`) VALUES ('$name','$gender','$email','$studentcode','$phone','$faculty','$level','$department','$password')";
$query=mysqli_query($conn,$insert);

if($query)
{
header("location:index.php?q7=wait for your approval Be patient!!");
}
else
{
header("location:index.php?q7=Email Already Registered!!!");
}
}
}

?>