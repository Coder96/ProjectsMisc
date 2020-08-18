#!/usr/bin/php
<?php
//
// Conver font data from https://pjrp.github.io/MDParolaFontEditor to json format
//
//
//
// Command line Parms
//
	$GLOBALS['fc']['errorMessages'] = [];
	$GLOBALS['fc']['debug'] = False;

	CmdLineParms();
	
	$gFont = [];
	
/*

File format:
Width of character 
Array for each virtical line of character in decimal csv. Matched count in field 1.
Comment seperator //
Counter from tool 
Font key
Comment

	1, 23, 					// 33  ! Comment

*/


	$inFontLines = file_get_contents($igFontIncommingFileName);

	$inFontLines = explode("\n", $inFontLines);

	foreach($inFontLines as $fontLine){
		$fontLine = trim(preg_replace('/\s+/', ' ', $fontLine));
		debugPrint('Line:'. $fontLine);
//	 Skip if line does not start with a number
		if(!is_numeric(substr(trim($fontLine),0,1))){
			$GLOBALS['fc']['errorMessages'][] = 'Not a number:' . $fontLine;
			continue;
		}
		if(!parseCharacterLine($fontLine, $fKey, $fWidth, $fArray, $fComment)){
			continue;
		}
		$gFont[$fKey] = $fArray;
		debugPrint('Key:'.$fKey);
		debugPrint('width:'.$fWidth);
		debugPrint('Comment:'.$fComment);
		debugPrint(print_r($fArray, True));
		
	}
	debugPrint(print_r($GLOBALS['fc']['errorMessages'], True));


	file_put_contents($igFontOutgoingFileName, json_encode($gFont, JSON_PRETTY_PRINT));

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
	function parseCharacterLine($iLine, &$oCharacterKey, &$oCharacterWidth, &$oaCharacterCollums, &$oCharacterComment){
		$oCharacterKey = '';
		$oCharacterWidth = '';
		$oaCharacterCollums = [];
		$oCharacterComment = '';
		
		global $igFontHeigth;
		
		@list($fontColums, $fontDesc) = explode('//', $iLine, 2);
		
		$wCharacterCollums = trim(preg_replace('/\s+/', '', $fontColums));
		$wCharacterCollums = explode(',', $fontColums);
		$oCharacterWidth = $wCharacterCollums[0];
		
		$fItemId = '';
		
		$fontDesc = trim(preg_replace('/\s+/', ' ', $fontDesc));
		@list($fItemId, $oCharacterKey, $oCharacterComment) = explode(' ', $fontDesc,3);

		$junk = array_shift($wCharacterCollums);
		$junk = array_pop($wCharacterCollums);
		debugPrint('Character Collums:'.array_sum($wCharacterCollums));
		if(array_sum($wCharacterCollums) < 1){
			$GLOBALS['fc']['errorMessages'][] = 'Empty Character ' . $fontDesc . '.';
			return false;
		}
		$v = 0;
		foreach($wCharacterCollums as $oaCharacterCollum){
			$oaCharacterCollumArray = str_split(strrev(sprintf( "%0${igFontHeigth}d", decbin($oaCharacterCollum))));
			foreach ($oaCharacterCollumArray as $char) {
				$oaCharacterCollums[$v][] = $char;
			}
			$v++;
		}
		return True;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
	function debugPrint($iLine){
		if($GLOBALS['fc']['debug']){
		echo $iLine . PHP_EOL;
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
	function CmdLineParms(){
		
		global $igFontIncommingFileName;
		global $igFontOutgoingFileName;
		global $igFontHeigth;
		global $argv;

		$helpText = '
  Required
    Parm 1: Font file to read from.
    Parm 2: Font File to write to.
    Parm 3: Font heigth. 1 - 8
    
  Optinal
    Parm 4: Turn debug on. 1

    ';
		if(empty($argv[1]) or !isset($argv[1]) ){
			echo $helpText;
			exit;
		} else {
			$igFontIncommingFileName = trim($argv[1]);
		}
		if(empty($argv[2]) or !isset($argv[2]) ){
			echo $helpText;
			exit;
		} else {
			if(trim($argv[1]) != trim($argv[2]) ){
				$igFontOutgoingFileName = trim($argv[2]);
			} else {
				echo 'File Names must not match.' . PHP_EOL;
				exit;
			}
		}
		if(empty($argv[3]) or !isset($argv[3]) ){
			echo $helpText;
			exit;
		} else {
			$igFontHeigth = trim($argv[3]);
		}

		if(empty($argv[4]) or !isset($argv[4]) ){
		} else {
			$GLOBALS['fc']['debug'] = True;
		}
	}