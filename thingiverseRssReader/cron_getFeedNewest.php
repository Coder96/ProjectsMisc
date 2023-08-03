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
	
	
##############################################################################
#
#	Parm: URL string https://www.thingiverse.com/thing:5177354
#
function retThingID($isURL){
	$a = parse_url($isURL);
	$b = explode(':', $a['path']);
	return $b[1];
}
##############################################################################
#
#  Pass in array format:
#  	tid_title
# 	tid_link
#   tid_imageLink
#	  tid_thingId
# 	tid_description
# 	tid_author
# 	tid_pubDate

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

    $ws_image_fileName = get_imageFile($iaItem['tid_imageLink']);
    		$stmt = $pdo->prepare('
UPDATE
	tiv_thingItemDetail
SET
	tid_imageLink = :tid_imageLink
WHERE
  tid_thingId = :tid_thingId
');
  $stmt->execute([
		':tid_imageLink' => $ws_image_fileName,
		':tid_thingId'   => $iaItem['tid_thingId'],
		]);

	} else {
		$GLOBALS['tiv']['ignoreCount'] ++;
	}
}
##############################################################################
function get_imageFile($is_imageLink){
  if(empty(trim($is_imageLink))){
    return '';
  }
  $imageData = file_get_contents($is_imageLink);
#   echo $img; 

  $path_parts = pathinfo($is_imageLink);
#  print_r($path_parts);
/*
(
  [dirname] => https://www.google.com/images/branding/googlelogo/1x
  [basename] => googlelogo_light_color_272x92dp.png
  [extension] => png
  [filename] => googlelogo_light_color_272x92dp
)
*/
  $ws_year = date('Y');
  $ws_month = date('m');
  $ws_extension = trim(substr($path_parts['extension'].'  ', 0, 3));
  $ws_pathWeb = "images/$ws_year/";
  $ws_path = $GLOBALS['tiv']['cwd'] . 'public/' . $ws_pathWeb;
  
  @mkdir($ws_path);
  $ws_path .= "$ws_month/";
  $ws_pathWeb .= "$ws_month/";
  @mkdir($ws_path);
  $ws_fileName = guidv4().'.'.$ws_extension;
#  echo $ws_fileName.PHP_EOL;
  file_put_contents($ws_path.$ws_fileName, $imageData);
  
  return $ws_pathWeb.$ws_fileName;
}
##############################################################################
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
##############################################################################
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
##############################################################################
function getDivText($content){
  $doc = new DOMDocument();
  $doc->loadHTML($content);
  if(!empty($doc->textContent)){
    return trim($doc->textContent);
  } else {
    return FALSE;
  }
}
##################################################################################
function guidv4($data = null) {
  # Generate 16 bytes (128 bits) of random data or use the data passed into the function.
  $data = $data ?? random_bytes(16);
  assert(strlen($data) == 16);

  # Set version to 0100
  $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
  # Set bits 6-7 to 10
  $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

  # Output the 36 character UUID.
  return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
}
##############################################################################
