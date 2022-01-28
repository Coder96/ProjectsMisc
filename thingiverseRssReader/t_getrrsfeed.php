#!/usr/bin/php
<?php

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