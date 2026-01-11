<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Search Houses</title>
</head>
<body>
    <h1>Search Houses</h1>
    <form method="post">
        Min Price: <input type="number" name="minPrice"><br>
        Max Price: <input type="number" name="maxPrice"><br>
        Bedrooms: <input type="number" name="bedrooms"><br>
        Bathrooms: <input type="number" name="bathrooms"><br>
        <input type="submit" value="Search">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $minPrice = $_POST["minPrice"] ?? 0;
        $maxPrice = $_POST["maxPrice"] ?? 1000000;
        $bedrooms = $_POST["bedrooms"] ?? 0;
        $bathrooms = $_POST["bathrooms"] ?? 0;

        $conn = mysqli_connect("localhost", "root", "", "mls");
        if (!$conn) die("Connection failed");

        $query = "SELECT h.address, h.bedrooms, h.bathrooms, h.size, p.price
                  FROM House h JOIN Property p ON h.address = p.address
                  WHERE p.price BETWEEN $minPrice AND $maxPrice
                  AND h.bedrooms >= $bedrooms
                  AND h.bathrooms >= $bathrooms";

        $result = mysqli_query($conn, $query);
        echo "<h2>Results</h2>";
        echo "<table border='1'><tr><th>Address</th><th>Bedrooms</th><th>Bathrooms</th><th>Size</th><th>Price</th></tr>";
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

