#!/usr/bin/php
<?php

  $dbUser = 'misc01';
  $dbPass = '!howTO001';
  $dbHost = 'thingiverse';
    
  $GLOBALS['tiv']['rssUrl'] = 'https://www.thingiverse.com/rss/newest';
  $GLOBALS['tiv']['xmlStr'] = '';
  $GLOBALS['tiv']['cwd'] = '/home/jklein/Projects/ProjectsMisc/thingiverseRssReader/';
  $GLOBALS['tiv']['ignoreCount'] = 0;

	$options = [
	    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
	    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
	    PDO::ATTR_EMULATE_PREPARES   => false,
//			    PDO::ATTR_PERSISTENT				 => true,
	];
	try {
		$pdo = new PDO(
	  	$dsn = 'mysql:host=localhost;dbname='.$dbHost.';charset=utf8', 
	    $dbUser,
	    $dbPass,
	    $options);
	} catch (\PDOException $e) {
	  	sysLogWrite(' Database connection failed: ' . $e->getMessage());
			echo('System Error');
	   die();
	}
	
	getRssData();
	
	$xml = simplexml_load_string($GLOBALS['tiv']['xmlStr']);
//	$xml = simplexml_load_file($GLOBALS['tiv']['cwd'].'xmlfiles/20211228_162819_newest.xml');

//echo count($xml->channel->item); exit;

foreach($xml->channel->item as $item){
  $thingID = retThingID($item->link);
  addRecord_tiv_thingItemDetail([
		'tid_title'      => $item->title,
		'tid_link'       => $item->link,
		'tid_imageLink'  => getfirstImagepath($item->description),
		'tid_thingId'    => $thingID,
		'tid_description'=> getDivText($item->description),
		'tid_author'     => $item->author,
		'tid_pubDate'    => $item->pubDate 
  ]);
}
  file_put_contents(
    $GLOBALS['tiv']['cwd'] . 'logs/' . date("Ymd") . '.txt',
    date("Ymd_His") . ':IgnoreCount:' . $GLOBALS['tiv']['ignoreCount'] . PHP_EOL,
    FILE_APPEND
  );	
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	Parm: URL string https://www.thingiverse.com/thing:5177354
//
function retThingID($isURL){
	$a = parse_url($isURL);
	$b = explode(':', $a['path']);
	return $b[1];
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Pass in array format:
//	tid_title
//	tid_link
//  tid_imageLink
//	tid_thingId
//	tid_description
//	tid_author
//	tid_pubDate

function addRecord_tiv_thingItemDetail($iaItem){
		global $pdo;
		$stmt = $pdo->prepare('
Insert Ignore Into
	tiv_thingItemDetail
SET
	tid_title       = :tid_title      ,
	tid_link        = :tid_link       ,
	tid_imageLink   = :tid_imageLink  ,
	tid_thingId     = :tid_thingId    ,
	tid_description = :tid_description,
	tid_author      = :tid_author     ,
	tid_pubDate     = :tid_pubDate
');
	$stmt->execute([
		':tid_title'      =>$iaItem['tid_title'],
		':tid_link'       =>$iaItem['tid_link'],
		':tid_imageLink'  =>$iaItem['tid_imageLink'],
		':tid_thingId'    =>$iaItem['tid_thingId'],
		':tid_description'=>$iaItem['tid_description'],
		':tid_author'     =>$iaItem['tid_author'],
		':tid_pubDate'    =>$iaItem['tid_pubDate']
	]);

	if($stmt->rowCount() > 0){
// new record added		
	} else {
		$GLOBALS['tiv']['ignoreCount'] ++;
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
function getRssData(){
  
  // create curl resource
  $ch = curl_init();

  // set url
  curl_setopt($ch, CURLOPT_URL, $GLOBALS['tiv']['rssUrl']);

  //return the transfer as a string
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

  // $output contains the output string
  $GLOBALS['tiv']['xmlStr'] = curl_exec($ch);

  // close curl resource to free up system resources
  curl_close($ch); 

  file_put_contents(
    $GLOBALS['tiv']['cwd'] . 'xmlfiles/' . date("Ymd_His") . '_newest.xml',
    $GLOBALS['tiv']['xmlStr']
  );
  
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
function getfirstImagepath($content){

  $doc = new DOMDocument();
  $doc->loadHTML($content);
  $imagepaths=array();
  $imageTags = $doc->getElementsByTagName('img');

  foreach($imageTags as $tag) {
    $imagepaths[]=$tag->getAttribute('src');
  }
  if(!empty($imagepaths)){
    return $imagepaths[0];
  } else {
    return FALSE;
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
function getDivText($content){
  $doc = new DOMDocument();
  $doc->loadHTML($content);
  if(!empty($doc->textContent)){
    return trim($doc->textContent);
  } else {
    return FALSE;
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
