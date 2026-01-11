<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>All Listings</title>
    <style>
        body  { font-family: sans-serif; background-color: lightyellow; }
        table { background-color: lightblue; border-collapse: collapse; border: 1px solid gray; }
        td, th { padding: 5px; border: 1px solid gray; }
        tr:nth-child(odd) { background-color: white; }
    </style>
</head>
<body>
    <h1>All Listings</h1>
    <?php
        if (!( $conn = mysqli_connect("localhost", "root", "", "mls") ))
            die("Could not connect to database</body></html>");

        // Houses
        $query = "SELECT h.address, h.bedrooms, h.bathrooms, h.size, p.price
                  FROM House h JOIN Property p ON h.address = p.address
                  JOIN Listings l ON p.address = l.address";
        $result = mysqli_query($conn, $query);

        echo "<h2>Houses</h2>";
        echo "<table><tr><th>Address</th><th>Bedrooms</th><th>Bathrooms</th><th>Size</th><th>Price</th></tr>";
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            foreach($row as $val) echo "<td>$val</td>";
            echo "</tr>";
        }
        echo "</table><br>";

        // Business Properties
        $query = "SELECT b.address, b.`type`, b.size, p.price
                  FROM BusinessProperty b
                  JOIN Property p ON b.address = p.address
                  JOIN Listings l ON p.address = l.address";
        $result = mysqli_query($conn, $query);

        echo "<h2>Business Properties</h2>";
        echo "<table><tr><th>Address</th><th>Type</th><th>Size</th><th>Price</th></tr>";
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            foreach($row as $val) echo "<td>$val</td>";
            echo "</tr>";
        }
        echo "</table>";

        mysqli_close($conn);
    ?>
</body>
</html>

