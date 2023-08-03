#!/usr/bin/php
<?php

  $GLOBALS['tiv']['cwd'] = '/home/jklein/Projects/ProjectsMisc/thingiverseRssReader/';
#  echo get_image('https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png').PHP_EOL;
#  echo get_image('https://cdn.thingiverse.com/assets/bd/78/97/b4/2b/large_preview_8b0745f8-b86d-4e20-83d9-a7f9eb040280.png').PHP_EOL;
  echo get_image('').PHP_EOL;
  
function get_image($is_imageLink){
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
  echo $ws_path.$ws_fileName.PHP_EOL;
  file_put_contents($ws_path.$ws_fileName, $imageData);
  
  return $ws_pathWeb.$ws_fileName;
  
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

/*
  // create curl resource
  $ch = curl_init();

  // set url
  curl_setopt($ch, CURLOPT_URL, "https://www.thingiverse.com/rss/newest");

  //return the transfer as a string
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

  // $output contains the output string
  $output = curl_exec($ch);

  // close curl resource to free up system resources
  curl_close($ch); 

  

  $outFileName = 'xmlfiles/' . date("Ymd_His") . '_newest.xml';

  file_put_contents($outFileName, $output);
 */