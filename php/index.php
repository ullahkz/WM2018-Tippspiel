<!DOCTYPE html>
<html lang="de">
    <head>
    <meta charset="UTF-8">
    <title>FIFA Fussball-Weltmeisterschaft Russland 2018™</title>
    <?php require('header.php'); ?>
    </head>
    <body>
        <div class="container">        
        <header>
            <img src="../images/logo.png" alt="logo" width="100" height="100" id="logo">
            <h1>FIFA Fussball-Weltmeisterschaft Russland 2018™</h1>
            <h2>Tippspiel</h2>
            <?php
                require("navbar.php");
            ?>
           <!--Hier kommt die Navigationsleiste hin! -->
        </header>

        <?php
            require("db_verbindung.php");
            session_start();
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
                        echo "Anmeldung Erfolgreich!";
                    }
                }

            }

            if(!isset($_SESSION['ID']))
            {
                ?>

                <main>
                    <form method="post" action="index.php">
                        <table>
                            <tr>
                                <td>Anmeldename:</td>
                                <td><input type="text" name="anmeldename"></td>
                            </tr>
                            <tr>
                                <td>Passwort:</td>
                                <td><input type="password" name="passwort"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" name="anmelden_button" value="Anmelden"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><a href="registrieren.php">hier Registrieren</a></td>
                            </tr>
                        </table>
                    </form>
                </main> 
              
                <?php
            }
            else
            {
                ?>
                    <main>
                        <form method="post" action="logout.php">
                            <input type="submit" name="ausloggen_button" value="Ausloggen">
                        </form>
                    </main>

                <?php
            }
        ?>
        </div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>        
    </body>
</html>