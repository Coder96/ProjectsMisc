#!/usr/bin/php
<?php
/*
 Payload:
 base 64 string:ewogICAiZGF0ZVRpbWUiOiI3LzE0LzIwMjAgODowMDowMCBBTSIsCiAgICJ0b3BpYyI6IlRvcGljIgp9

	That contains a json object.
{
   "dateTime":"7/14/2020 8:00:00 AM",
   "topic":"Topic"
}
*/

	$gScriptPath = dirname(get_included_files()[0]);

	$GLOBALS['fc']['debug'] = True;
	$GLOBALS['fc']['debug'] = False;

	$gTimeToDelay = 0;
	$min02 = 60 * 2;
	$min05 = 60 * 5;
	$min10 = 60 * 10;
	
	$font = json_decode(file_get_contents($gScriptPath.'/microfont.json'), True);
	$displayBuff = [];
	$font[' '] = ['0', '0', '0', '0', '0', '0'];

	$iMessage = json_decode(base64_decode($argv[1]), True);

	$timeNow = date("U");
	$timeDow = date("w");
	$timeMet = strtotime($iMessage['dateTime']);

	@list($junk, $meettingTime) = explode(' ', $iMessage['dateTime'],2);

	$time24h = date("Hi");
	$timeDiff = $timeMet - $timeNow;

	debugPrint($time24h);
	debugPrint($timeNow);
	debugPrint($timeMet);
	debugPrint($timeDiff);



	//
	// Don't display if meetting in the past or not at work. Need a way to know if I'm at work.
	//
	if($timeNow > 1700 or $timeNow < 800 or $timeDow == 0 or $timeDow == 6 or $timeDiff < 0){
//		exit;
	}

	if($timeDiff > $min10){
		// do nothing 
	} else {
		$aMeettingTime = str_split(trim($meettingTime));
		//$aMeettingTime[] = 'A';
		$x = 0;
		foreach($aMeettingTime as $char){
			debugPrint($char);
			foreach($font[$char] as $line){
				$displayBuff[$x] = $line;
				$x++;
			}
		}
		// send display
//		var_dump($displayBuff);
	}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
	function debugPrint($iLine){
		if($GLOBALS['fc']['debug']){
		echo $iLine . PHP_EOL;
		}
	}




