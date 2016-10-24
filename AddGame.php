<?php
    $con=mysqli_connect("localhost","root","","gameshop");
    if (mysqli_connect_errno($con))
      {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
      }

	$sql = "INSERT INTO item(name,price,rental_price,title,description,quantity) VALUES('$_POST[Game_Name]',$_POST[Price],$_POST[Rental_Price],'$_POST[Game_Title]','$_POST[Description]',$_POST[Quantity])";
if (!mysqli_query($con,$sql))
      {
      die('Error: ' . mysqli_error($con));
	echo "<h3>Game doesn't added successfully!</h3>";
      }
mysqli_select_db($con,"search");
$selectitem="SELECT MAX(item_id) as item_id FROM item";
$result = mysqli_query($con,$selectitem);
while($row = mysqli_fetch_array($result)) {
$item_id=$row['item_id'];
$add_game="INSERT INTO games(item_id,developer,publisher,release_date) VALUES($item_id,'$_POST[Developer]','$_POST[Publisher]','$_POST[Release_Date]')";
if (!mysqli_query($con,$add_game))
      {
      die('Error: ' . mysqli_error($con));
	echo "<h3>Game doesn't added successfully!</h3>";
      }
echo "<h3>Game added successfully!</h3>";
}
    mysqli_close($con);
    ?>