<?php
session_start();
if ($_SESSION['sortierart']=='gruppe')
{
    gruppesortiert();
}
elseif ($_SESSION['sortierart']=='datum')
{
    datumsortiert();
}

function gruppesortiert()
{
    if($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        require("db_verbindung.php");
        $gruppe = $_SESSION['gruppe'];
        $sql = "SELECT * FROM spielplan WHERE Gruppe = '$gruppe'";
        $result = mysqli_query($conn, $sql);
        insert($result);
    }
    require 'functions.php';
    updateRanking();
    mysqli_close($conn);
    //header('Location: tippen.php');
}

function datumsortiert()
{
    if($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        require("db_verbindung.php");

        $sql = "SELECT * FROM spielplan ORDER BY Datum";
        $result = mysqli_query($conn, $sql);
        insert($result);
    }
    require 'functions.php';
    updateRanking();
    mysqli_close($conn);
    header('Location: tippen.php');

}

function insert ($result)
{
    require ('DB_Verbindung.php');
    $i = 1;
    while ($row = mysqli_fetch_assoc($result))
    {
        $spieleID = $_SESSION['SpieleID' . $i];
        $userID = $_SESSION['ID'];

        $schongetippt = "SELECT * FROM tipps WHERE benutzerid = '$userID' AND spieleid = '$spieleID'";
        $result2 = mysqli_query($conn, $schongetippt);

        $hme = $_POST['hme' . $i];
        $gme = $_POST['gme' . $i];

        date_default_timezone_set("Europe/London");

        $tippdatum = date("Y-m-d H:i:sa");

        if (mysqli_num_rows($result2) <= 0)
        {
            $sql = "INSERT INTO tipps (benutzerid, spieleid, tippdatum, tippheimende, tippgastende) 
                VALUES ('$userID', '$spieleID', '$tippdatum', '$hme', '$gme')";
            if (mysqli_query($conn, $sql)) {
                echo "<p style='background: green; color: lightgray; width: 270px; padding: 5px;'>Der Tipp wurde gespeichert!</p>";
            }
            else
            {
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }
        }
        else
        {
            $sql = "UPDATE tipps SET tippdatum = '$tippdatum', tippheimende='$hme', tippgastende='$gme'
                        WHERE benutzerid='$userID' AND spieleid='$spieleID'";

            if (mysqli_query($conn, $sql))
            {
                echo "Record updated successfully";
            }
            else
            {
                echo "Error updating record: " . mysqli_error($conn);
            }
        }
        $i++;

    }
}
?>