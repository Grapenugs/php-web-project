<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Buyers</title>
</head>
<body>
    <h1>All Buyers</h1>
    <?php
    $conn = mysqli_connect("localhost","root","","mls");
    if (!$conn) die("Connection failed");

    $query = "SELECT * FROM Buyer";
    $result = mysqli_query($conn, $query);

    echo "<table border='1'>";
    echo "<tr><th>ID</th><th>Name</th><th>Phone</th><th>Property Type</th><th>Bedrooms</th><th>Bathrooms</th>
          <th>Business Type</th><th>Min Price</th><th>Max Price</th></tr>";

    while($row = mysqli_fetch_assoc($result)){
        echo "<tr>";
        foreach($row as $val) echo "<td>$val</td>";
        echo "</tr>";
    }

    echo "</table>";
    mysqli_close($conn);
    ?>
</body>
</html>

