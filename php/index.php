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
            require("db_verbindung.php");
            session_start();
            ?>
            <?php
            if($_SERVER['REQUEST_METHOD'] == 'POST')
            {
                $anmeldename = $_POST['anmeldename'];
                $passwort = md5($_POST['passwort']);
                $sql = "SELECT * FROM users WHERE anmeldename = '$anmeldename'";
                $result = mysqli_query($conn, $sql);
                if(mysqli_num_rows($result) == 0)
                {
                    echo "Benutzername existiert nicht!";
                }
                else
                {
                    $row = mysqli_fetch_assoc($result);

                    if($passwort != $row['passwort'])
                    {
                        echo "Passwort stimmt nicht überein!";
                    }
                    else
                    {
                        $_SESSION['ID'] = $row['ID'];                        
                    }
                }

            }

            if(!isset($_SESSION['ID']))
            {
                ?>
                <div class="container secondContainer">
                <div class="row" id="start1">
                    <div class="col">
                        <main>
                            <form method="post" action="index.php" id="login">
                                    <table>
                                        <tr>
                                            <td>Anmeldename:</td>
                                            <td><input class="form-control" type="text" name="anmeldename"></td>
                                        </tr>
                                        <tr>
                                            <td>Passwort:</td>
                                            <td><input class="form-control" type="password" name="passwort"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="1"><input class="btn btn-primary" type="submit" name="anmelden_button" value="Anmelden"></td>
                                            <td colspan="1"><a href="registration.php" class="btn btn-secondary">Hier Registrieren</a></td>
                                        </tr>
                                    </table>
                            </form>
                        </main>
                <?php
            }
            else
            {
                ?>
                <div class="container secondContainer">
                <div class="row" id="start2">
                    <div class="col">                
                    <main>
                        <form method="post" action="logout.php" align="center" id="logout">
                            <p align="center"><?php echo "Anmeldung Erfolgreich!"; ?></p>
                            <a href="tippen.php" class="btn btn-info">Jetzt Tippen</a>
                            <input class="btn btn-danger" type="submit" name="ausloggen_button" value="Ausloggen">                            
                        </form>
                    </main>

                <?php
            }
        ?>
        </div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>       
</div>    
</body>
</html>