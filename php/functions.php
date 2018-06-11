<?php

function updateRanking(){
    require ('DB_Verbindung.php');
    $i=1;

    $userID = $_SESSION['ID'];

    $query = "SELECT `benutzerid`,`spieleid`, `tippheimende`, `tippgastende`, `ID`, `Tore 1`, `Tore 2` FROM `tipps` INNER JOIN `spielplan` ON `spieleid`=`ID`";

    $matching = mysqli_query($conn, $query);

	$final_point = 0;

    while($row = mysqli_fetch_assoc($matching)){
    	$userID = $row['benutzerid'];
    	$home_Tor = $row['tippheimende'];
    	$away_Tor = $row['tippgastende'];
    	$home_Tor_final_result = $row['Tore 1'];
    	$away_Tor_final_result = $row['Tore 2'];

    	$points = 0;

    	if(($home_Tor>$away_Tor && $home_Tor_final_result>$away_Tor_final_result) || ($home_Tor<$away_Tor && $home_Tor_final_result<$away_Tor_final_result)){
    		$points = winnerPoint($home_Tor, $away_Tor, $home_Tor_final_result, $away_Tor_final_result);
    	}
    	else if($home_Tor>$away_Tor && $home_Tor_final_result<$away_Tor_final_result){
    		$points = 0;	
    	}
    	else if($home_Tor == $away_Tor && ($home_Tor_final_result < $away_Tor_final_result || $home_Tor_final_result > $away_Tor_final_result)){
    		$points = 0;
    	}
    	else if($home_Tor_final_result == $away_Tor_final_result && ($home_Tor < $away_Tor || $home_Tor > $away_Tor)){
    		$points = 0;
    	}
    	echo $points.'<br>';
    	$final_point = $final_point + $points;

    }

    date_default_timezone_set("Europe/London");

    $pointCalculationDate = date("Y-m-d H:i:sa");

    $rankingtable_query = "SELECT * FROM ranking WHERE benutzerid = '$userID'";

    $benutzerid_status = mysqli_query($conn, $rankingtable_query);

    $row = mysqli_fetch_assoc($benutzerid_status);

    if(mysqli_num_rows($benutzerid_status) <= 0){
    	$sql = "INSERT INTO ranking (datum, benutzerid, punkte, platz) 
                VALUES ('$pointCalculationDate', '$userID', '$final_point', '')";
        mysqli_query($conn, $sql);             
    }
    else{
    	$sql = "UPDATE ranking SET datum = '$pointCalculationDate', benutzerid='$userID', punkte='$final_point', platz='' WHERE benutzerid='$userID'";
    	mysqli_query($conn, $sql);	
    }

    }

function winnerPoint($ht, $at, $htf, $atf){
	if($ht == $htf && $at == $atf){
		return 3;
	}
	else if(abs($ht-$at) == abs($htf-$atf)){
		return 2;
	}
	else if(abs($ht-$at) !== abs($htf-$atf)){
		return 1;
	}
}

?>