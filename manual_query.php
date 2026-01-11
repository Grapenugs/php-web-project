<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Manual Query</title>
</head>
<body>
    <h1>Manual SQL Query</h1>
    <form method="post">
        <textarea name="query" rows="5" cols="80" placeholder="Enter any SQL query"></textarea><br>
        <input type="submit" value="Run Query">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $query = $_POST["query"];
        $conn = mysqli_connect("localhost","root","","mls");
        if (!$conn) die("Connection failed");

        $result = mysqli_query($conn, $query);
        if(!$result) die("Query failed: " . mysqli_error($conn));

        echo "<h2>Results</h2>";
        echo "<table border='1'>";
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

