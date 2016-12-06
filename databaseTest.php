<!DOCTYPE html>
<html>
  <head>
    <title>Thank You</title>
    <link rel="stylesheet" type="text/css" href="temp.css">
</head>
<body>

<h1>Thank You for choosing our Virtual Adviser!</h1>
<h2>Based on the classes you've taken already, here is what you can take next:</h2>

<?php

// get the classes that student has taken
$taken = $_POST['taken'];

$name   = $_POST['name'];
$id     = $_POST['studentID'];
$email  = $_POST['email'];



//information for connecting to database
$servername = "130.85.241.247";
$username = "ikirk";
$password = "umbc";
$DBname = "scripting";

// Create connection to the database
$conn = new mysqli($servername, $username, $password, $DBname);

// Validate the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 


// Reset the database table to its initial state
// first reset all the classes marked as taken
$sql0 = "UPDATE classes SET taken=0";
$result0 = $conn->query($sql0);
if (!$result0) 
{  
    exit('<p> Error resetting the taken column in the dababase: ' . mysql_error() . '</p>');  
}  

// then reset all the classesStable marked as satisfied
$sql1 = "UPDATE classes SET satisfied=0";
$result1 = $conn->query($sql1);

if (!$result1) 
{  
    exit('<p> Error resetting the satisfied column: ' . mysql_error() . '</p>');  
} 

$classesTaken = array();

// Mark the classes the student had previously taken in the table
for ($i = 0; $i < count($taken); ++$i) 
{
    $trimmed = str_replace (" ", "", $taken[$i]);
    array_push($classesTaken, $trimmed);
    $sql = "UPDATE classes SET taken='1' WHERE courseNum='$trimmed'";
    $result = $conn->query($sql);

    if (!$result) 
    {  
        exit('<p>Error parsing taken list: ' . mysql_error() . '</p>');  
    }  
}

$notTakenSQL = "SELECT * FROM classes WHERE taken = 0";
$resultNotTaken = $conn->query($notTakenSQL);

if($resultNotTaken->num_rows > 0) {
    while($row = $resultNotTaken->fetch_assoc()) {
        $class = $row["courseNum"];
        $prereqString = $row["prerequisites"];
        $prereqs = explode(" ", $prereqString);
        $prereqsMet = true;

        if(!empty($prereqString)) {
            foreach($prereqs as $prereq) {
                if(!in_array($prereq, $classesTaken)) {
                    $prereqsMet = false;
                    break;
                }
            }
        }

        if($prereqsMet) {
            $updateSatisfiedSQL = "UPDATE classes SET satisfied=1 WHERE courseNum=\"$class\"";
            $updateResult = $conn->query($updateSatisfiedSQL);

        }
    }
}
/* OLD CODE NOT USED
// mark the prerequisites of the checked classes as taken 
$takenSQL = "SELECT  * FROM  classes WHERE taken = 1";
$resultTaken = $conn->query($takenSQL); 

if ($resultTaken->num_rows > 0) {

    while($row = $resultTaken->fetch_assoc()) {

        $class = $row["courseNum"];
        $courses = explode(" ", $row["prerequisites"]);
        
        // for each prerequisite 
        foreach ($courses as $value) 
        {
            // update the taken column of each prequisite of the taken class.
            $changeToTaken = "UPDATE classes SET taken = 1 WHERE courseNum='$value'";
            $changeToTakenSQL = $conn->query($changeToTaken);

            // validates that the record was updated
            if ($conn->query($changeToTaken) === TRUE) 
            {
                echo "";
            } else {
                echo "Error with the prereq stuff: " . $conn->error;
            }
        }
    }
}


// Identify all of the classes for which the prerequisites have been satisfied. 
// get all of the classes marked unsatisfied
$prereqSQL = "SELECT  * FROM  classes WHERE  satisfied = 0";
$resultSQL = $conn->query($prereqSQL);

if ($resultSQL->num_rows > 0) 
{
    while($row = $resultSQL->fetch_assoc()) 
    {
        $class = $row["courseNum"];

        // if this variable becomes 0, the prerequisite was not satisfied
        $satisfiedSQL = 1;

        // split prereqisites for a course into an array
        $courses = explode(" ", $row["prerequisites"]);

        // for each prerequisite 
        foreach ($courses as $value) 
        {
            // check whether this prerequisite was taken by accessing the `taken` column
            $testSQL = "SELECT * FROM classes WHERE courseNum='$value'";
            $valueSQL = $conn->query($testSQL);

            if ($valueSQL->num_rows > 0) 
            {
                while($row1 = $valueSQL->fetch_assoc()) 
                {
                    $satisfiedSQL = $satisfiedSQL * $row1["taken"];
                }
            }

            // update the satisfied column of the class for which the prerequisites were set.
            $updateSQL = "UPDATE classes SET satisfied=$satisfiedSQL WHERE courseNum='$class'";

            // validates that the record was updated
            if ($conn->query($updateSQL) === TRUE) {
                echo "";
            } else {
                echo "Error satisfied stuff: " . $conn->error;
            }
        }
    }
}
*/


// Output the required classes which can be taken next

echo "<div id='req'>";

echo "<script>console.log(\"Made it before required\")</script>";

/*---------REQUIRED CLASSES------------*/
echo "<h2> REQUIRED COURSES </h2>";


//select required courses that the student is eligible to take. 
$sql = "SELECT * FROM classes WHERE required=1 and satisfied=1 and taken=0";
$result = $conn->query($sql);
if (!$result) 
{  
    exit('<p> Error with required: ' . mysql_error() . '</p>');  
}  

if ($result->num_rows > 0) 
{
    // print out classes
    echo "<ul>";
    while($row = $result->fetch_assoc()) 
    {
        echo "<li>" . $row["courseNum"] . " - " . $row["name"] . " ( " .  $row["credits"] . " credits ) " . "</li> <br>";
    }
    echo "</ul>  <br>";
} 

//if the student has taken all required courses
else 
{
    echo "Congratulations! You've completed all of the required classes. ";
}
echo "</div>";

/*-------------------------------------------------*/



echo "<hr>";

echo "<script>console.log(\"Made it before elective\")</script>";

/*-------------ELECTIVE CLASSES--------------------*/
echo "<div id='elec'>";
echo "<h2>CMSC or MATH ELECTIVES</h2>"; 

// select satisfied elective classes 
$sql = "SELECT * FROM classes WHERE taken='0' and elective='1' and satisfied='1' and (department='CMSC' or department='MATH')";
$result = $conn->query($sql);
if (!$result) 
{  
    exit('<p> Error: satisfied electives' . mysql_error() . '</p>');  
}  

// if such classes exist
if ($result->num_rows > 0) 
{
    // print out possible electives
    echo "<ul>";
    while($row = $result->fetch_assoc()) 
    {
        echo "<li>".$row["courseNum"] . " - " . $row["name"] . " ( " .  $row["credits"] . " credits ) " . "</li><br>";
    }
    echo "</ul> <br>";
} 


//if there are no possible electives to take.
else 
{
    echo "There aren't any electives you can take based on the classes you've taken.";
}
echo "</div>";

/*---------------------------------------------------*/


echo "<hr>";




/*-----------------SCIENCE CLASSES-------------------*/

// output the science classes which can be taken
echo "<div id='science'>";
echo "<h2> SCIENCE ELECTIVES </h2>";


echo "<script>console.log(\"Made it before select\")</script>";

//select possible science courses to take
$sql = "SELECT * FROM classes WHERE taken='0' and elective='1' and satisfied='1' and department='SCI'";
$result = $conn->query($sql);
if (!$result) 
{  
    exit('<p>Error start of sciences: ' . mysql_error() . '</p>');  
}  


echo "<script>console.log(\"Made it big query list\")</script>";

// if such classes exist: 
if ($result->num_rows > 0) 
{
    // output science courses of each row
    echo "<ul>";
    while($row = $result->fetch_assoc()) 
    {
        echo "<li>".$row["courseNum"] . " - " . $row["name"] . " ( " .  $row["credits"] . " credits ) " .  "</li><br>";
    }
    echo "</ul>  <br>";

} 

//if you've taken all possible science courses
else 
{
    echo "There aren't any science electives you are eligible to take.";
}
echo "</div>";
/*---------------------------------------------------------------------*/

echo "<script>console.log(\"Made it students\")</script>";
// insert student info 
$insertSQL = "INSERT INTO students (name, student_id, email) VALUES ('$name', '$id', '$email')";
if ($conn->query($insertSQL) === TRUE) {
    echo "";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// close the connection
$conn->close();

?>

</body>
</html>