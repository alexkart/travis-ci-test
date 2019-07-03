<?php

echo 'ok' . "\n";

try {
    $dbh = new PDO('mysql:host=localhost;dbname=test', 'root', '');
    print_r($dbh);
    $dbh = null;
} catch (PDOException $e) {
    print 'Error!: ' . $e->getMessage() . "\n";
}

try {
    $conn = new PDO("sqlsrv:server = tcp:localhost,1433; Database = testdb1", "SA", "YourStrong!Passw0rd");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    print_r($conn);
} catch (PDOException $e) {
    print('Error connecting to SQL Server.');
    print_r($e);
}
