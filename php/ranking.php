<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title>WM 2018 - Tippspiel</title>
    <?php require('header.php'); ?>
</head>
<body>
    <div class="container">
    <?php
    require('pageheader.php');
    session_start();
    require ("db_verbindung.php");

    if(isset($_SESSION['ID']))
    {

    ?>

<div class="container secondContainer">
    <div class="row" style="min-height:768px;background: #fff; padding-top: 15px;opacity: 0.85">
<div class="col-12">
    <form method="get" action="ranking.php" id="formSort" style="display: block;height: 50px;">    
        <div class="input-group">
          <select name="sortieren" class="custom-select" id="inputGroupSelect04">
                <option value="groupsort">Nach Gruppe sortieren</option>
                <option value="datesort">Nach Spieltag sortieren</option>
                <option value="ranksort">Ranking aussehen</option>
          </select>
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="submit" name="sorting" value="Absenden" style="color:#000;">Absenden</button>
        </div>    
        </div>
    </form>

<main>
    <?php
        if(isset($_GET['sortieren']) && $_GET['sortieren']=='groupsort')
        {
            gruppe();
        }
        else if(isset($_GET['sortieren']) && $_GET['sortieren']=='ranksort'){
            ranking();
        }
        else if(isset($_GET['sortieren']) && $_GET['sortieren']=='datesort')
        {
            datum();
        }
    }
        else{
            echo 'Sie sind nicht angemeldet<br>';
            echo '<a class="btn btn-dark" href="index.php">Jetzt Anmelden</a>';
        }

        function ranking(){
            require ("db_verbindung.php");

            if ($_SERVER['REQUEST_METHOD'] == 'GET')
            {

                $_SESSION['sortierart']= 'ranking';
                $userID = $_SESSION['ID'];

                $sql = "SELECT `benutzerid`, `punkte`, `anmeldename` FROM `ranking` LEFT JOIN `users` ON `ID`=`benutzerid`";
                
                $results = mysqli_query($conn, $sql);
                print_r($results);
                $i = 1;

                while ($row = mysqli_fetch_assoc($results))
                {
                    print_r($row);                 
                    $benutzername = $row['anmeldename'];
                    $benutzerid = $row['benutzerid'];
                    $punkte = $row['punkte'];


                    echo "<tr><td>$benutzername</td><td>$benutzerid</td><td>$punkte</td></tr>";                    

                    $i++;

                }
            }    
    ?>
        
    <?php
        }

        function gruppe()
        {
            require ("db_verbindung.php");


    ?>

    <form method="post" action="ranking.php?sortieren=groupsort&sorting=Absenden">
        <div class="input-group">
        <select name="Spiel" class="custom-select">
            <option value="A">Gruppe A</option>
            <option value="B">Gruppe B</option>
            <option value="C">Gruppe C</option>
            <option value="D">Gruppe D</option>
            <option value="E">Gruppe E</option>
            <option value="F">Gruppe F</option>
            <option value="G">Gruppe G</option>
            <option value="H">Gruppe H</option>
        </select>
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="submit" value="Anzeigen" style="color:#000;">Anzeigen</button>
        </div>         
        </div>
    </form>
        <table class="table table-dark" style="margin-top: 20px">
            <thead class="thead-dark">
                <td>Spiele</td>
                <td>Gruppe</td>
                <td>Spielort</td>
                <td>Datum</td>
                <td>Uhrzeit</td>
                <td align='center'>Heimmannschaft</td>
                <td align='center'>Gastmannschaft</td>                
            </thead>
            <?php

            if ($_SERVER['REQUEST_METHOD'] == 'POST')
            {
                $_SESSION['sortierart']= 'gruppe';
                $gruppe = $_POST['Spiel'];
                $_SESSION['gruppe'] = $gruppe;

                $sql = "SELECT * FROM spielplan WHERE Gruppe = '$gruppe'";
                $result = mysqli_query($conn, $sql);

                $userID = $_SESSION['ID'];

                $i = 1;

                while ($row = mysqli_fetch_assoc($result))
                {
                    $spieleID = $row['ID'];
                    $_SESSION['SpieleID' . $i] = $spieleID;

                    $schongetippt = "SELECT * FROM tipps WHERE benutzerid = '$userID' AND spieleid = '$spieleID'";
                    $result2 = mysqli_query($conn, $schongetippt);
                    $row2=mysqli_fetch_assoc($result2);

                    $spielbezeichnung = $row['Gruppe'];
                    $spielort = UTF8_encode($row['Spielort']);
                    $datumuhrzeit = $row['Datum'];
                    $heimmannschaft = UTF8_encode($row['Heimmannschaft']);
                    $gastmannschaft = UTF8_encode($row['Gastmannschaft']);
                    $datumuhrzeit = date_create($datumuhrzeit);
                    $datum = date_format($datumuhrzeit, "d.m.y");
                    $uhrzeit = date_format($datumuhrzeit, "H:i:s");
                    $imagehome = '<img style="float:right" width="24px" height="16px" src="../images/flags/'.str_replace(' ', '_',$heimmannschaft).'.png" alt="flag">';
                    $imageaway = '<img style="float:left" width="24px" height="16px" src="../images/flags/'.str_replace(' ', '_',$gastmannschaft).'.png" alt="flag">';

                    echo "<tr><td>$spieleID</td><td>$spielbezeichnung</td><td>$spielort</td><td>$datum</td><td>$uhrzeit</td><td align='center'>$heimmannschaft $imagehome</td><td align='center'>$gastmannschaft $imageaway</td></tr>";                    

                    $i++;

                }
            }

            ?>
    </table>
        <?php
        }

        function datum()
        {
            require ("db_verbindung.php");
        ?>
    <form name="abgebendatum" method="post" action="tippabgeben.php">
        <table class="table table-dark">
            <tr>
                <td>Spiele</td>
                <td>Gruppe</td>
                <td>Spielort</td>
                <td>Datum</td>
                <td>Uhrzeit</td>
                <td align='center'>Heimmannschaft</td>
                <td align='center'>Gastmannschaft</td>
            </tr>
            <?php

                $_SESSION['sortierart']= 'datum';

                $sql = "SELECT * FROM spielplan ORDER BY Datum";
                $result = mysqli_query($conn, $sql);

                $userID = $_SESSION['ID'];
                echo $userID;
                $i = 1;

                while ($row = mysqli_fetch_assoc($result))
                {
                    $spieleID = $row['ID'];
                    $_SESSION['SpieleID' . $i] = $spieleID;

                    $schongetippt = "SELECT * FROM tipps WHERE benutzerid = '$userID' AND spieleid = '$spieleID'";
                    $result2 = mysqli_query($conn, $schongetippt);
                    $row2=mysqli_fetch_assoc($result2);

                    $spielbezeichnung = $row['Gruppe'];
                    $spielort = UTF8_encode($row['Spielort']);
                    $datumuhrzeit = $row['Datum'];
                    $heimmannschaft = UTF8_encode($row['Heimmannschaft']);
                    $gastmannschaft = UTF8_encode($row['Gastmannschaft']);
                    $datumuhrzeit = date_create($datumuhrzeit);
                    $datum = date_format($datumuhrzeit, "d.m.y");
                    $uhrzeit = date_format($datumuhrzeit, "H:i:s");
                    $imagehome = '<img style="float:right" width="24px" height="16px" src="../images/flags/'.str_replace(' ', '_',$heimmannschaft).'.png" alt="flag">';
                    $imageaway = '<img style="float:left" width="24px" height="16px" src="../images/flags/'.str_replace(' ', '_',$gastmannschaft).'.png" alt="flag">';

                    echo "<tr><td>$spieleID</td><td>$spielbezeichnung</td><td>$spielort</td><td>$datum</td><td>$uhrzeit</td><td align='center'>$heimmannschaft $imagehome</td><td align='center'>$gastmannschaft $imageaway</td></tr>";                             

                    $i++;

                }


            ?>
    </table>
    </form>
    <?php
        }

        ?>
</main>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script> 
</div>
</body>
</html>