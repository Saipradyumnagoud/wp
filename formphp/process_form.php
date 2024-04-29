<?php
// Define error variables and set to empty values
$nameErr = $rollNumberErr = $departmentErr = $emailErr = $phoneErr = "";
$name = $rollNumber = $department = $email = $phone = "";

// Function to validate input
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Validate form inputs
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["name"])) {
        $nameErr = "Name is required";
    } else {
        $name = test_input($_POST["name"]);
        // Check if name contains only letters and whitespace
        if (!preg_match("/^[a-zA-Z ]*$/", $name)) {
            $nameErr = "Only letters and white space allowed";
        }
    }
    
    if (empty($_POST["roll_number"])) {
        $rollNumberErr = "Roll Number is required";
    } else {
        $rollNumber = test_input($_POST["roll_number"]);
        // Check if roll number is valid
        if (!preg_match("/^[0-9]*$/", $rollNumber)) {
            $rollNumberErr = "Invalid roll number";
        }
    }
    
    if (empty($_POST["department"])) {
        $departmentErr = "Department is required";
    } else {
        $department = test_input($_POST["department"]);
    }
    
    if (empty($_POST["email"])) {
        $emailErr = "Email is required";
    } else {
        $email = test_input($_POST["email"]);
        // Check if email address is well-formed
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Invalid email format";
        }
    }
    
    if (empty($_POST["phone"])) {
        $phoneErr = "Phone is required";
    } else {
        $phone = test_input($_POST["phone"]);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Validation Results</title>
</head>
<body>
    <h1>Form Validation Results</h1>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST" && empty($nameErr) && empty($rollNumberErr) && empty($departmentErr) && empty($emailErr) && empty($phoneErr)) {
        echo "<p>Form submitted successfully!</p>";
        // Further processing or database insertion can be done here
    } else {
        echo "<p>Form submission failed. Please correct the errors below:</p>";
        echo "<ul>";
        echo "<li>$nameErr</li>";
        echo "<li>$rollNumberErr</li>";
        echo "<li>$departmentErr</li>";
        echo "<li>$emailErr</li>";
        echo "<li>$phoneErr</li>";
        echo "</ul>";
    }
    ?>
    <p><a href="student_form.html">Go back to form</a></p>
</body>
</html>
