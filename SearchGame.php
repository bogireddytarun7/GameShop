<!DOCTYPE html>
<html>
<head>
<style>
table {
    width: 100%;
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
    padding: 5px;
}

th {text-align: left;}
</style>
</head>


<?php
$q = $_POST['game'];

$con = mysqli_connect('localhost','root',"",'gameshop');
if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
}
  
mysqli_select_db($con,"search");
$sql="SELECT * FROM games g,item i WHERE g.item_id=i.item_id AND i.title LIKE '%$q%'";
$result = mysqli_query($con,$sql);

echo "<body><h2 align=\"center\">Game Shop - Search Game</h2><table align=\"center\">
<tr>
<th>Game_Name</th>
<th>Game_Title</th>
<th>Developer</th>
<th>Price</th>
<th>RentalPrice</th>
<th>Publisher</th>
<th>ReleaseDate</th>
<th>Description</th>
</tr>";
while($row = mysqli_fetch_array($result)) {
    echo "<tr>";
    echo "<td>" . $row['name'] . "</td>";
    echo "<td>" . $row['title'] . "</td>";
    echo "<td>" . $row['developer'] . "</td>";
    echo "<td>" . $row['price'] . "</td>";
    echo "<td>" . $row['rental_price'] . "</td>";
    echo "<td>" . $row['publisher'] . "</td>";
    echo "<td>" . $row['release_date'] . "</td>";
    echo "<td>" . $row['description'] . "</td>";
 
    echo "</tr>";
}
echo "</table>";
mysqli_close($con);
?>
</body>
</html>