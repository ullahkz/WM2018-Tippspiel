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
<!--     <form method="get" action="tippen.php" id="formSort" style="display: block;height: 100px;">
        <select name="sortieren">
            <option value="groupsort">Nach Gruppe sortieren</option>
            <option value="datesort">Nach Spieltag sortieren</option>
        </select>
        <input type="submit" name="sorting" value="Absenden">
    </form> -->
    <form method="get" action="tippen.php" id="formSort" style="display: block;height: 50px;">    
        <div class="input-group">
          <select name="sortieren" class="custom-select" id="inputGroupSelect04">
                <option value="groupsort">Nach Gruppe sortieren</option>
                <option value="datesort">Nach Spieltag sortieren</option>
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
        else if(isset($_GET['sortieren']) && $_GET['sortieren']=='datesort')
        {
            datum();
        }
    }
    else
    {
        echo "<div style='text-align:center;'><h2>Sie sind nicht angemeldet!</h2>";
        echo "<a class='btn btn-primary' href='index.php'>Jetzt Anmelden</a></div>";
    }



        function gruppe()
        {
            require ("db_verbindung.php");


    ?>

    <form method="post" action="tippen.php?sortieren=groupsort&sorting=Absenden">
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

    <form name = "gruppeabgeben" method="post" action="tippabgeben.php">
        <table class="table table-hover" style="margin-top: 20px">
            <thead class="thead-dark">
                <td>Spiele</td>
                <td>Gruppe</td>
                <td>Spielort</td>
                <td>Datum</td>
                <td>Uhrzeit</td>
                <td>Heimmannschaft</td>
                <td>Gastmannschaft</td>
                <!-- <td>Heimmannschaft Halbzeit</td>
                <td>Gastmannschaft Halbzeit</td> -->
                <td>Heimmannschaft Ende</td>
                <td>Gastmannschaft Ende</td>
                <!-- <td>Heimmannschaft Gelb</td>
                <td>Gastmannschaft Gelb</td>
                <td>Heimmannschaft Rot</td>
                <td>Gastmannschaft Rot</td> -->
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

                    $sp_dm = date_format($datumuhrzeit, "d.m.y");
                    $now_dm = date("d.m.y");

                    if($now_dm > $sp_dm){
                        $flag = 'readonly';
                        $class = 'table-danger';
                    }
                    else{
                        $flag = '';
                        $class = '';
                    }                    


                    if($flag == 'readonly'){
                        echo "<tr class='".$class."'><td>$spieleID</td><td>$spielbezeichnung</td><td>$spielort</td><td>$datum</td><td>$uhrzeit</td><td>$heimmannschaft</td><td>$gastmannschaft</td>                         
                            <td><p class='beenden' data-toggle='tooltip' title='Spiel beendet' align='center'>".($row2)['tippheimende']."</p></td><input class='dpn' ".$flag."  type='number' name='hme" . $i . "'  value='".($row2)['tippheimende']."'>
                            <td><p data-toggle='tooltip' title='Spiel beendet' class='beenden' align='center'>".($row2)['tippgastende']."</p></td><td><input class='dpn' ".$flag." type='number' name='gme" . $i . "'  value='".($row2)['tippgastende']."'></td>
                            </tr>"; 
                    }
                    else{
                    echo "<tr class='".$class."'><td>$spieleID</td><td>$spielbezeichnung</td><td>$spielort</td><td>$datum</td><td>$uhrzeit</td><td>$heimmannschaft</td><td>$gastmannschaft</td>                         
                            <td><input type='number' name='hme" . $i . "'  value='".($row2)['tippheimende']."'></td>
                            <td><input type='number' name='gme" . $i . "'  value='".($row2)['tippgastende']."'></td>
                            </tr>";                    
                    }

                    // echo "<tr><td>$spieleID</td><td>$spielbezeichnung</td><td>$spielort</td><td>$datum</td><td>$uhrzeit</td><td>$heimmannschaft</td><td>$gastmannschaft</td>                         
                    //         <td><input type='number' name='hmhz" . $i . "' value='".$row2['tippheimhz']."'></td>
                    //         <td><input type='number' name='gmhz" . $i . "' value='".$row2['tippgasthz']."'></td>
                    //         <td><input type='number' name='hme" . $i . "'  value='".($row2)['tippheimende']."'></td>
                    //         <td><input type='number' name='gme" . $i . "'  value='".($row2)['tippgastende']."'></td>
                    //         <td><input type='number' name='hmg" . $i . "'  value='".($row2)['tippgelbeheim']."'></td>
                    //         <td><input type='number' name='gmg" . $i . "'  value='".($row2)['tippgelbegast']."'></td>
                    //         <td><input type='number' name='hmr" . $i . "'  value='".($row2)['tipproteheim']."'></td>
                    //         <td><input type='number' name='gmr" . $i . "'  value='".($row2)['tipprotegast']."'></td>
                    //         </tr>";
                    $i++;

                }
            }

            ?>
    <tr><td colspan="14" align="center"><input class="btn btn-dark" type="submit" value="Tipp abgeben"></td></tr>
    </table>
    </form>
        <?php
        }

        function datum()
        {
            require ("db_verbindung.php");
        ?>
    <form name="abgebendatum" method="post" action="tippabgeben.php">
        <table class="table table-hover">
            <tr>
                <td>Spiele</td>
                <td>Gruppe</td>
                <td>Spielort</td>
                <td>Datum</td>
                <td>Uhrzeit</td>
                <td>Heimmannschaft</td>
                <td>Gastmannschaft</td>
                <!-- <td>Heimmannschaft Halbzeit</td>
                <td>Gastmannschaft Halbzeit</td> -->
                <td>Heimmannschaft Ende</td>
                <td>Gastmannschaft Ende</td>
<!--                 <td>Heimmannschaft Gelb</td>
                <td>Gastmannschaft Gelb</td>
                <td>Heimmannschaft Rot</td>
                <td>Gastmannschaft Rot</td> -->
            </tr>
            <?php

                $_SESSION['sortierart']= 'datum';

                $sql = "SELECT * FROM spielplan ORDER BY Datum";
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

                    $sp_dm = date_format($datumuhrzeit, "d.m.y");
                    $now_dm = date("d.m.y");

                    if($now_dm > $sp_dm){
                        $flag = 'readonly';
                        $class = 'table-danger';
                    }
                    else{
                        $flag = '';
                        $class = '';
                    }

                    // echo "<tr><td>$spieleID</td><td>$spielbezeichnung</td><td>$spielort</td><td>$datum</td><td>$uhrzeit</td><td>$heimmannschaft</td><td>$gastmannschaft</td>                         
                    //         <td><input type='number' name='hmhz" . $i . "' value='".$row2['tippheimhz']."'></td>
                    //         <td><input type='number' name='gmhz" . $i . "' value='".$row2['tippgasthz']."'></td>
                    //         <td><input type='number' name='hme" . $i . "'  value='".($row2)['tippheimende']."'></td>
                    //         <td><input type='number' name='gme" . $i . "'  value='".($row2)['tippgastende']."'></td>
                    //         <td><input type='number' name='hmg" . $i . "'  value='".($row2)['tippgelbeheim']."'></td>
                    //         <td><input type='number' name='gmg" . $i . "'  value='".($row2)['tippgelbegast']."'></td>
                    //         <td><input type='number' name='hmr" . $i . "'  value='".($row2)['tipproteheim']."'></td>
                    //         <td><input type='number' name='gmr" . $i . "'  value='".($row2)['tipprotegast']."'></td>
                    //         </tr>";

                    if($flag == 'readonly'){
                        echo "<tr class='".$class."'><td>$spieleID</td><td>$spielbezeichnung</td><td>$spielort</td><td>$datum</td><td>$uhrzeit</td><td>$heimmannschaft</td><td>$gastmannschaft</td>                         
                            <td><p class='beenden' data-toggle='tooltip' title='Spiel beendet' align='center'>".($row2)['tippheimende']."</p></td><input class='dpn' ".$flag."  type='number' name='hme" . $i . "'  value='".($row2)['tippheimende']."'>
                            <td><p data-toggle='tooltip' title='Spiel beendet' class='beenden' align='center'>".($row2)['tippgastende']."</p></td><td><input class='dpn' ".$flag." type='number' name='gme" . $i . "'  value='".($row2)['tippgastende']."'></td>
                            </tr>"; 
                    }
                    else{
                        echo "<tr class=".$class."><td>$spieleID</td><td>$spielbezeichnung</td><td>$spielort</td><td>$datum</td><td>$uhrzeit</td><td>$heimmannschaft</td><td>$gastmannschaft</td>                         
                            <td><input ".$flag."  type='number' name='hme" . $i . "'  value='".($row2)['tippheimende']."'></td>
                            <td><input ".$flag." type='number' name='gme" . $i . "'  value='".($row2)['tippgastende']."'></td>
                            </tr>";                            
                    }
                    $i++;

                }


            ?>
    <tr><td colspan="14"><input class="btn btn-dark" type="submit" value="Tipp abgeben"></td></tr>
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