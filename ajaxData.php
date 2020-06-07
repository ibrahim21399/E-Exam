<?php 
// Include the database config file 
$conn =new mysqli("localhost","root","","e_exam");  
 
if(!empty($_POST["faculty_id"])){ 
    // Fetch department data based on the specific faculty 
    $query = "SELECT * FROM department WHERE faculty_id = ".$_POST['faculty_id']." AND status = 1 ORDER BY department_name ASC"; 
    $result = $conn->query($query); 
     
    // Generate HTML of department options list 
    if($result->num_rows > 0){ 
        echo '<option value="">Select department</option>'; 
        while($row = $result->fetch_assoc()){  
            echo '<option value="'.$row['department_id'].'">'.$row['department_name'].'</option>'; 
        } 
    }else{ 
        echo '<option value="">department not available</option>'; 
    } 
}
 
?>