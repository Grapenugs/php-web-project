<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Search Business Properties</title>
</head>
<body>
    <h1>Search Business Properties</h1>
    <form method="post">
        Min Price: <input type="number" name="minPrice"><br>
        Max Price: <input type="number" name="maxPrice"><br>
        Min Size: <input type="number" name="minSize"><br>
        Max Size: <input type="number" name="maxSize"><br>
        <input type="submit" value="Search">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $minPrice = $_POST["minPrice"] ?? 0;
        $maxPrice = $_POST["maxPrice"] ?? 10000000;
        $minSize = $_POST["minSize"] ?? 0;
        $maxSize = $_POST["maxSize"] ?? 100000;

        $conn = mysqli_connect("localhost", "root", "", "mls");
        if (!$conn) die("Connection failed");

        $query = "SELECT b.address, b.`type`, b.size, p.price
                  FROM BusinessProperty b JOIN Property p ON b.address = p.address
                  WHERE p.price BETWEEN $minPrice AND $maxPrice
                  AND b.size BETWEEN $minSize AND $maxSize";

        $result = mysqli_query($conn, $query);
        echo "<h2>Results</h2>";
        echo "<table border='1'><tr><th>Address</th><th>Type</th><th>Size</th><th>Price</th></tr>";
        while($row = mysqli_fetch_assoc($result)){
            echo "<tr>";
            foreach($row as $val) echo "<td>$val</td>";
            echo "</tr>";
        }
        echo "</table>";

        mysqli_close($conn);
    }
    ?>
</body>
</html>

