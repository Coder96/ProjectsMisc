#!/usr/bin/php
<?php

$test = true;

$powerApiFormat = 'json';

$powerBallTestServer = 'http://localhost';
$powerBallAPiTestEstimates 		= '/lt/20200324_estimates.'.$powerApiFormat;
$powerBallApiTestNumbers 			= '/lt/20200324_numbers.json.'.$powerApiFormat;
$powerBallApiTestDrawSummary 	= '/lt/20200324_drawsummary.'.$powerApiFormat;

$powerBallServer = 'https://www.powerball.com';

$powerApiEstimates 		= '/api/v1/estimates/powerball?_format='.$powerApiFormat;
$powerApiNumbers 			= '/api/v1/numbers/powerball/recent?_format='.$powerApiFormat;
$powerApiDrawSummary 	= '/api/v1/draw-summary/powerball?_format='.$powerApiFormat;


$httpRequest = $powerBallServer . $powerApiEstimates;

if($test){
	$httpRequest = $powerBallTestServer . $powerBallAPiTestEstimates;	
}

echo $httpRequest.PHP_EOL;
$homepage = file_get_contents($httpRequest);
echo $homepage;

// 'https://www.powerball.com/api/v1/estimates/powerball?_format=json'
// 'https://www.powerball.com/api/v1/numbers/powerball/recent?_format=json'
// 'https://www.powerball.com/api/v1/draw-summary/powerball?_format=json'
