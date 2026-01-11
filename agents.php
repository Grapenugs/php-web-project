<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Agents</title>
</head>
<body>
    <h1>All Agents</h1>
    <?php
    $conn = mysqli_connect("localhost","root","","mls");
    if (!$conn) die("Connection failed");

    $query = "SELECT a.agentId, a.name, a.phone, f.name AS firm, a.dateStarted
              FROM Agent a
              JOIN Firm f ON a.firmId = f.id";

    $result = mysqli_query($conn, $query);
    echo "<table border='1'><tr><th>ID</th><th>Name</th><th>Phone</th><th>Firm</th><th>Date Started</th></tr>";
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

