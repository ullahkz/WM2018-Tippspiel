	function getValue(e){
		var input_id = e.id;
		var value = e.value;

		var previousURL = $('#resultSubmit').attr('action');
		var finalURL = previousURL+'&'+input_id+'='+value;
		// $('form#resultSubmit').attr('action', finalURL);
		// console.log(finalURL);
	}

	var datas;

	var xmlhttp = new XMLHttpRequest();

	var url = './data/data.json';

	xmlhttp.onreadystatechange=function() {
	    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	        myFunction(xmlhttp.responseText);
	    }
	}
	xmlhttp.open("GET", url, true);
	xmlhttp.send();
	function myFunction(response) { 
	    var dataJSON = JSON.parse(response);
	    datas = dataJSON;

	    var teams_id = ['0']; 
	    var teams_name = ['0'];
	    var teams_flag_url = ['0'];
	    var teams_fifa_code = ['0'];

	    $.each(datas.teams, function(index, value){	    	
	    	teams_id.push(value.id);	    	
	    	teams_name.push(value.name);
	    	teams_fifa_code.push(value.fifaCode);
	    	teams_flag_url.push(value.flag);
	    });

    	var group = datas.groups.a;
    	var number_of_matches = group.matches.length;

    	console.log(datas.stadiums[1].name);

    	$('div#groupA').find('tbody').html('');    	
	    for (var i = 0; i< number_of_matches; i++) {

	    	var date = new Date(group.matches[i].date);
	    	var date_now = Date.now();

	    	if(group.matches[i].home_result !== null && group.matches[i].away_result !== null || date<date_now){
	    		var input_disable = 'disabled';
	    		var _home_result = group.matches[i].home_result;
				var _away_result = group.matches[i].away_result;
	    	}
	    	else {
	    		var input_disable = '';
		  		var _home_result  = '';
				var _away_result  = '';

	    	}

			var properDate = ("0" + date.getDate()).slice(-2)+'-'+("0" + (date.getMonth() + 1)).slice(-2) +'-'+ date.getFullYear();
			var properTime = ("0" + date.getHours()).slice(-2) +':'+ ("0" + date.getMinutes()).slice(-2);

	    	var new_row = '<tr><th scope="row">Match '+group.matches[i].name+'<br>'+properDate+'<br>'+properTime+'</th>';
	    	    new_row+= '<td align="right">'+teams_name[group.matches[i].home_team]+' <img class="flag" src="'+teams_flag_url[group.matches[i].home_team]+'" alt="'+teams_name[group.matches[i].home_team]+'"></td>'
	    	    new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score1" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].home_team].replace(' ','_')+'_score" value="'+_home_result+'" min="0" '+input_disable+'></td>';
	    	    new_row+= '<td>-</td>';
	    	    new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score2" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].away_team].replace(' ','_')+'_score" value="'+_away_result+'" min="0" '+input_disable+'></td>';
	    	    new_row+= '<td align="left"><img class="flag" src="'+teams_flag_url[group.matches[i].away_team]+'" alt="'+teams_name[group.matches[i].away_team]+'"> '+teams_name[group.matches[i].away_team]+' </td><td>'+datas.stadiums[group.matches[i].stadium - 1].name+', '+datas.stadiums[group.matches[i].stadium - 1].city+'</td></tr>';
	    	
    		$('div#groupA').find('tbody').append(new_row);
	    }

	    $('input#group_Name').attr('value', 'grpA');

	    $('a#grpA').click(function(){

	    	$('input#group_Name').attr('value', 'grpA');

	    	var group = datas.groups.a;
	    	var number_of_matches = group.matches.length;

	    	$('div#groupA').find('tbody').html('');
		    for (var i = 0; i< number_of_matches; i++) {  	    		    	

	    	var date = new Date(group.matches[i].date);
	    	var date_now = Date.now();

	    	if(group.matches[i].home_result !== null && group.matches[i].away_result !== null || date<date_now){
	    		var input_disable = 'disabled';
	    		var _home_result = group.matches[i].home_result;
				var _away_result = group.matches[i].away_result;
	    	}
	    	else {
	    		var input_disable = '';
		  		var _home_result  = '';
				var _away_result  = '';

	    	} 
	
	    	var date = new Date(group.matches[i].date);
			var properDate = ("0" + date.getDate()).slice(-2)+'-'+("0" + (date.getMonth() + 1)).slice(-2) +'-'+ date.getFullYear();
			var properTime = ("0" + date.getHours()).slice(-2) +':'+ ("0" + date.getMinutes()).slice(-2);

	    	var new_row = '<tr><th scope="row">Match '+group.matches[i].name+'<br>'+properDate+'<br>'+properTime+'</th>';
		    	    new_row+= '<td align="right">'+teams_name[group.matches[i].home_team]+' <img class="flag" src="'+teams_flag_url[group.matches[i].home_team]+'" alt="'+teams_name[group.matches[i].home_team]+'"></td>'
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score1" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].home_team].replace(' ','_')+'_score" value="'+_home_result+'" min="0" '+input_disable+'></td>';
	    	    	new_row+= '<td>-</td>';
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score2" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].away_team].replace(' ','_')+'_score" value="'+_away_result+'" min="0" '+input_disable+'></td>';
		    	    new_row+= '<td align="left"><img class="flag" src="'+teams_flag_url[group.matches[i].away_team]+'" alt="'+teams_name[group.matches[i].away_team]+'"> '+teams_name[group.matches[i].away_team]+' </td><td>'+datas.stadiums[group.matches[i].stadium - 1].name+', '+datas.stadiums[group.matches[i].stadium - 1].city+'</td></tr>';
	    		$('div#groupA').find('tbody').append(new_row);
		    }

	    });	    

	    $('a#grpB').click(function(){

	    	$('input#group_Name').attr('value', 'grpB');

	    	var group = datas.groups.b;
	    	var number_of_matches = group.matches.length;	
	    	$('div#groupB').find('tbody').html('');
		    for (var i = 0; i< number_of_matches; i++) {  	    		    	

	    	var date = new Date(group.matches[i].date);
	    	var date_now = Date.now();

	    	if(group.matches[i].home_result !== null && group.matches[i].away_result !== null || date<date_now){
	    		var input_disable = 'disabled';
	    		var _home_result = group.matches[i].home_result;
				var _away_result = group.matches[i].away_result;
	    	}
	    	else {
	    		var input_disable = '';
		  		var _home_result  = '';
				var _away_result  = '';

	    	} 
	
	    	var date = new Date(group.matches[i].date);
			var properDate = ("0" + date.getDate()).slice(-2)+'-'+("0" + (date.getMonth() + 1)).slice(-2) +'-'+ date.getFullYear();
			var properTime = ("0" + date.getHours()).slice(-2) +':'+ ("0" + date.getMinutes()).slice(-2);

	    	var new_row = '<tr><th scope="row">Match '+group.matches[i].name+'<br>'+properDate+'<br>'+properTime+'</th>';
		    	    new_row+= '<td align="right">'+teams_name[group.matches[i].home_team]+' <img class="flag" src="'+teams_flag_url[group.matches[i].home_team]+'" alt="'+teams_name[group.matches[i].home_team]+'"></td>'
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score1" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].home_team].replace(' ','_')+'_score" value="'+_home_result+'" min="0" '+input_disable+'></td>';
	    	    	new_row+= '<td>-</td>';
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score2" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].away_team].replace(' ','_')+'_score" value="'+_away_result+'" min="0" '+input_disable+'></td>';
		    	    new_row+= '<td align="left"><img class="flag" src="'+teams_flag_url[group.matches[i].away_team]+'" alt="'+teams_name[group.matches[i].away_team]+'"> '+teams_name[group.matches[i].away_team]+' </td><td>'+datas.stadiums[group.matches[i].stadium - 1].name+', '+datas.stadiums[group.matches[i].stadium - 1].city+'</td></tr>';

	    		$('div#groupB').find('tbody').append(new_row);
		    }

	    });

	    $('a#grpC').click(function(){

	    	$('input#group_Name').attr('value', 'grpC');

	    	var group = datas.groups.c;
	    	var number_of_matches = group.matches.length;	
	    	$('div#groupC').find('tbody').html('');
		    for (var i = 0; i< number_of_matches; i++) {  	    		    	

	    	var date = new Date(group.matches[i].date);
	    	var date_now = Date.now();

	    	if(group.matches[i].home_result !== null && group.matches[i].away_result !== null || date<date_now){
	    		var input_disable = 'disabled';
	    		var _home_result = group.matches[i].home_result;
				var _away_result = group.matches[i].away_result;
	    	}
	    	else {
	    		var input_disable = '';
		  		var _home_result  = '';
				var _away_result  = '';

	    	} 
	
	    	var date = new Date(group.matches[i].date);
			var properDate = ("0" + date.getDate()).slice(-2)+'-'+("0" + (date.getMonth() + 1)).slice(-2) +'-'+ date.getFullYear();
			var properTime = ("0" + date.getHours()).slice(-2) +':'+ ("0" + date.getMinutes()).slice(-2);

	    	var new_row = '<tr><th scope="row">Match '+group.matches[i].name+'<br>'+properDate+'<br>'+properTime+'</th>';
		    	    new_row+= '<td align="right">'+teams_name[group.matches[i].home_team]+' <img class="flag" src="'+teams_flag_url[group.matches[i].home_team]+'" alt="'+teams_name[group.matches[i].home_team]+'"></td>'
    	    	    new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score1" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].home_team].replace(' ','_')+'_score" value="'+_home_result+'" min="0" '+input_disable+'></td>';
	    	    	new_row+= '<td>-</td>';
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score2" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].away_team].replace(' ','_')+'_score" value="'+_away_result+'" min="0" '+input_disable+'></td>';
		    	    new_row+= '<td align="left"><img class="flag" src="'+teams_flag_url[group.matches[i].away_team]+'" alt="'+teams_name[group.matches[i].away_team]+'"> '+teams_name[group.matches[i].away_team]+' </td><td>'+datas.stadiums[group.matches[i].stadium - 1].name+', '+datas.stadiums[group.matches[i].stadium - 1].city+'</td></tr>';
	    		$('div#groupC').find('tbody').append(new_row);
		    }

	    });

	    $('a#grpD').click(function(){

	    	$('input#group_Name').attr('value', 'grpD');

	    	var group = datas.groups.d;
	    	var number_of_matches = group.matches.length;	
	    	$('div#groupD').find('tbody').html('');
		    for (var i = 0; i< number_of_matches; i++) {  	    		    	

	    	var date = new Date(group.matches[i].date);
	    	var date_now = Date.now();

	    	if(group.matches[i].home_result !== null && group.matches[i].away_result !== null || date<date_now){
	    		var input_disable = 'disabled';
	    		var _home_result = group.matches[i].home_result;
				var _away_result = group.matches[i].away_result;
	    	}
	    	else {
	    		var input_disable = '';
		  		var _home_result  = '';
				var _away_result  = '';

	    	} 
	
	    	var date = new Date(group.matches[i].date);
			var properDate = ("0" + date.getDate()).slice(-2)+'-'+("0" + (date.getMonth() + 1)).slice(-2) +'-'+ date.getFullYear();
			var properTime = ("0" + date.getHours()).slice(-2) +':'+ ("0" + date.getMinutes()).slice(-2);

	    	var new_row = '<tr><th scope="row">Match '+group.matches[i].name+'<br>'+properDate+'<br>'+properTime+'</th>';
		    	    new_row+= '<td align="right">'+teams_name[group.matches[i].home_team]+' <img class="flag" src="'+teams_flag_url[group.matches[i].home_team]+'" alt="'+teams_name[group.matches[i].home_team]+'"></td>'
		    	    new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score1" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].home_team].replace(' ','_')+'_score" value="'+_home_result+'" min="0" '+input_disable+'></td>';
	    	    	new_row+= '<td>-</td>';
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score2" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].away_team].replace(' ','_')+'_score" value="'+_away_result+'" min="0" '+input_disable+'></td>';
		    	    new_row+= '<td align="left"><img class="flag" src="'+teams_flag_url[group.matches[i].away_team]+'" alt="'+teams_name[group.matches[i].away_team]+'"> '+teams_name[group.matches[i].away_team]+' </td><td>'+datas.stadiums[group.matches[i].stadium - 1].name+', '+datas.stadiums[group.matches[i].stadium - 1].city+'</td></tr>'; 
	    		$('div#groupD').find('tbody').append(new_row);
		    }

	    });	    

	    $('a#grpE').click(function(){

	    	$('input#group_Name').attr('value', 'grpE');

	    	var group = datas.groups.e;
	    	var number_of_matches = group.matches.length;	
	    	$('div#groupE').find('tbody').html('');
		    for (var i = 0; i< number_of_matches; i++) {  	    		    	

	    	var date = new Date(group.matches[i].date);
	    	var date_now = Date.now();

	    	if(group.matches[i].home_result !== null && group.matches[i].away_result !== null || date<date_now){
	    		var input_disable = 'disabled';
	    		var _home_result = group.matches[i].home_result;
				var _away_result = group.matches[i].away_result;
	    	}
	    	else {
	    		var input_disable = '';
		  		var _home_result  = '';
				var _away_result  = '';

	    	} 
	
	    	var date = new Date(group.matches[i].date);
			var properDate = ("0" + date.getDate()).slice(-2)+'-'+("0" + (date.getMonth() + 1)).slice(-2) +'-'+ date.getFullYear();
			var properTime = ("0" + date.getHours()).slice(-2) +':'+ ("0" + date.getMinutes()).slice(-2);

	    	var new_row = '<tr><th scope="row">Match '+group.matches[i].name+'<br>'+properDate+'<br>'+properTime+'</th>';
		    	    new_row+= '<td align="right">'+teams_name[group.matches[i].home_team]+' <img class="flag" src="'+teams_flag_url[group.matches[i].home_team]+'" alt="'+teams_name[group.matches[i].home_team]+'"></td>'
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score1" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].home_team].replace(' ','_')+'_score" value="'+_home_result+'" min="0" '+input_disable+'></td>';
	    	    	new_row+= '<td>-</td>';
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score2" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].away_team].replace(' ','_')+'_score" value="'+_away_result+'" min="0" '+input_disable+'></td>';
		    	    new_row+= '<td align="left"><img class="flag" src="'+teams_flag_url[group.matches[i].away_team]+'" alt="'+teams_name[group.matches[i].away_team]+'"> '+teams_name[group.matches[i].away_team]+' </td><td>'+datas.stadiums[group.matches[i].stadium - 1].name+', '+datas.stadiums[group.matches[i].stadium - 1].city+'</td></tr>'; 
	    		$('div#groupE').find('tbody').append(new_row);
		    }

	    });	  

	    $('a#grpF').click(function(){

	    	$('input#group_Name').attr('value', 'grpF');

	    	var group = datas.groups.f;
	    	var number_of_matches = group.matches.length;	
	    	$('div#groupF').find('tbody').html('');
		    for (var i = 0; i< number_of_matches; i++) {  	    		    	

	    	var date = new Date(group.matches[i].date);
	    	var date_now = Date.now();

	    	if(group.matches[i].home_result !== null && group.matches[i].away_result !== null || date<date_now){
	    		var input_disable = 'disabled';
	    		var _home_result = group.matches[i].home_result;
				var _away_result = group.matches[i].away_result;
	    	}
	    	else {
	    		var input_disable = '';
		  		var _home_result  = '';
				var _away_result  = '';

	    	} 
	
	    	var date = new Date(group.matches[i].date);
			var properDate = ("0" + date.getDate()).slice(-2)+'-'+("0" + (date.getMonth() + 1)).slice(-2) +'-'+ date.getFullYear();
			var properTime = ("0" + date.getHours()).slice(-2) +':'+ ("0" + date.getMinutes()).slice(-2);

	    	var new_row = '<tr><th scope="row">Match '+group.matches[i].name+'<br>'+properDate+'<br>'+properTime+'</th>';
		    	    new_row+= '<td align="right">'+teams_name[group.matches[i].home_team]+' <img class="flag" src="'+teams_flag_url[group.matches[i].home_team]+'" alt="'+teams_name[group.matches[i].home_team]+'"></td>'
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score1" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].home_team].replace(' ','_')+'_score" value="'+_home_result+'" min="0" '+input_disable+'></td>';
	    	    	new_row+= '<td>-</td>';
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score2" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].away_team].replace(' ','_')+'_score" value="'+_away_result+'" min="0" '+input_disable+'></td>';
		    	    new_row+= '<td align="left"><img class="flag" src="'+teams_flag_url[group.matches[i].away_team]+'" alt="'+teams_name[group.matches[i].away_team]+'"> '+teams_name[group.matches[i].away_team]+' </td><td>'+datas.stadiums[group.matches[i].stadium - 1].name+', '+datas.stadiums[group.matches[i].stadium - 1].city+'</td></tr>'; 
	    		$('div#groupF').find('tbody').append(new_row);
		    }

	    });

	    $('a#grpG').click(function(){

	    	$('input#group_Name').attr('value', 'grpG');

	    	var group = datas.groups.g;
	    	var number_of_matches = group.matches.length;	
	    	$('div#groupG').find('tbody').html('');
		    for (var i = 0; i< number_of_matches; i++) {  	    		    	

	    	var date = new Date(group.matches[i].date);
	    	var date_now = Date.now();

	    	if(group.matches[i].home_result !== null && group.matches[i].away_result !== null || date<date_now){
	    		var input_disable = 'disabled';
	    		var _home_result = group.matches[i].home_result;
				var _away_result = group.matches[i].away_result;
	    	}
	    	else {
	    		var input_disable = '';
		  		var _home_result  = '';
				var _away_result  = '';

	    	} 
	
	    	var date = new Date(group.matches[i].date);
			var properDate = ("0" + date.getDate()).slice(-2)+'-'+("0" + (date.getMonth() + 1)).slice(-2) +'-'+ date.getFullYear();
			var properTime = ("0" + date.getHours()).slice(-2) +':'+ ("0" + date.getMinutes()).slice(-2);

	    	var new_row = '<tr><th scope="row">Match '+group.matches[i].name+'<br>'+properDate+'<br>'+properTime+'</th>';
		    	    new_row+= '<td align="right">'+teams_name[group.matches[i].home_team]+' <img class="flag" src="'+teams_flag_url[group.matches[i].home_team]+'" alt="'+teams_name[group.matches[i].home_team]+'"></td>'
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score1" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].home_team].replace(' ','_')+'_score" value="'+_home_result+'" min="0" '+input_disable+'></td>';
	    	    	new_row+= '<td>-</td>';
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score2" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].away_team].replace(' ','_')+'_score" value="'+_away_result+'" min="0" '+input_disable+'></td>';
		    	    new_row+= '<td align="left"><img class="flag" src="'+teams_flag_url[group.matches[i].away_team]+'" alt="'+teams_name[group.matches[i].away_team]+'"> '+teams_name[group.matches[i].away_team]+' </td><td>'+datas.stadiums[group.matches[i].stadium - 1].name+', '+datas.stadiums[group.matches[i].stadium - 1].city+'</td></tr>'; 
	    		$('div#groupG').find('tbody').append(new_row);
		    }

	    });		    	

	    $('a#grpH').click(function(){

	    	$('input#group_Name').attr('value', 'grpH');

	    	var group = datas.groups.h;
	    	var number_of_matches = group.matches.length;	
	    	$('div#groupH').find('tbody').html('');
		    for (var i = 0; i< number_of_matches; i++) {  	    		    	

	    	var date = new Date(group.matches[i].date);
	    	var date_now = Date.now();

	    	if(group.matches[i].home_result !== null && group.matches[i].away_result !== null || date<date_now){
	    		var input_disable = 'disabled';
	    		var _home_result = group.matches[i].home_result;
				var _away_result = group.matches[i].away_result;
	    	}
	    	else {
	    		var input_disable = '';
		  		var _home_result  = '';
				var _away_result  = '';

	    	} 
	
	    	var date = new Date(group.matches[i].date);
			var properDate = ("0" + date.getDate()).slice(-2)+'-'+("0" + (date.getMonth() + 1)).slice(-2) +'-'+ date.getFullYear();
			var properTime = ("0" + date.getHours()).slice(-2) +':'+ ("0" + date.getMinutes()).slice(-2);

	    	var new_row = '<tr><th scope="row">Match '+group.matches[i].name+'<br>'+properDate+'<br>'+properTime+'</th>';
		    	    new_row+= '<td align="right">'+teams_name[group.matches[i].home_team]+' <img class="flag" src="'+teams_flag_url[group.matches[i].home_team]+'" alt="'+teams_name[group.matches[i].home_team]+'"></td>'
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score1" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].home_team].replace(' ','_')+'_score" value="'+_home_result+'" min="0" '+input_disable+'></td>';
	    	    	new_row+= '<td>-</td>';
	    	    	new_row+= '<td><input class="form-control" onchange="getValue(this)" type="number" maxlength="2" id="'+group.matches[i].name+'_score2" name="M'+group.matches[i].name+'_'+teams_fifa_code[group.matches[i].away_team].replace(' ','_')+'_score" value="'+_away_result+'" min="0" '+input_disable+'></td>';
		    	    new_row+= '<td align="left"><img class="flag" src="'+teams_flag_url[group.matches[i].away_team]+'" alt="'+teams_name[group.matches[i].away_team]+'"> '+teams_name[group.matches[i].away_team]+' </td><td>'+datas.stadiums[group.matches[i].stadium - 1].name+', '+datas.stadiums[group.matches[i].stadium - 1].city+'</td></tr>'; 
	    		$('div#groupH').find('tbody').append(new_row);
		    }

	    });	

	}

$(document).ready(function(){

	$('#getthevalue').click(function(){
		console.log($('#1_score1').val());
	});

	$('tr td:nth-child(3)').each(function(index,item){
		$(item).addClass('tor');
	});

	$('tr td:nth-child(5)').each(function(index,item){
		$(item).addClass('tor');
	});

});