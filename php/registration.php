<!DOCTYPE html>
<html lang="de">
    <head>
    <meta charset="UTF-8">
    <title>FIFA Fussball-Weltmeisterschaft Russland 2018™</title>
    <?php require('header.php'); ?>
    </head>
    <body>
        <div class="container">        
        <?php
            require('pageheader.php');
            require("db_verbindung.php");?>

                <div class="container secondContainer">
                <div class="row" id="start1">
                    <div class="col">
                        <main>
                            <form method="post" action="registration.php" id="login">

        <?php

            if($_SERVER['REQUEST_METHOD'] == 'POST')
            {
                $anmeldename = $_POST["anmeldename"];
                $vorname = $_POST["vorname"];
                $nachname = $_POST["nachname"];
                $passwort = $_POST["passwort"];

                if (empty($anmeldename) || empty($passwort))
                {
                    echo "Es müssen alle Felder ausgefüllt sein!";
                }
                else if($passwort != $_POST["passwortwdh"])
                {
                    echo "Die Passwörter müssen übereinstimmen!";
                }
                else
                {
                    $sql = "SELECT * FROM users WHERE anmeldename = '$anmeldename'";
                    $result = mysqli_query($conn, $sql);
                    if(mysqli_num_rows($result) > 0)
                    {
                        echo "Benutzername ist bereits vergeben!";
                    }
                    else
                    {
                        $passwort = md5($passwort);
                        $sql = "INSERT INTO users (anmeldename, vorname, nachname, passwort) VALUES('$anmeldename', '$vorname', '$nachname', '$passwort')";

                        if (mysqli_query($conn, $sql))
                        {
                            echo "Registrierung war erfolgreich!";
                            echo '<a class="btn btn-primary" href="index.php">Jetzt Anmelden</a>';
                        } else
                        {
                            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
                        }

                        mysqli_close($conn);
                    }
                }
            }
        ?>                                    
                                    <table>
                                        <tr>
                                            <td>Anmeldename:</td><td><input class="form-control" type="text" name="anmeldename"></td>
                                        </tr>
                                        <tr>
                                            <td>Vorname:</td><td><input class="form-control" type="text" name="vorname"></td>
                                        </tr>
                                        <tr>
                                            <td>Nachname:</td><td><input class="form-control" type="text" name="nachname"></td>
                                        </tr>
                                        <tr>
                                            <td>Passwort:</td><td><input class="form-control" type="password" name="passwort"></td>
                                        </tr>
                                        <tr>
                                            <td>Passwort wiederholen:</td><td><input class="form-control" type="password" name="passwortwdh"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input class="btn btn-primary" type="submit" name="submit_button" value="Registrieren"></td>
                                        </tr>
                                    </table>                                    
                            </form>
                        </main>
        </div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>       
</div>    
</body>
</html>