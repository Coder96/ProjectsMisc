#!/usr/bin/php
<?php

$xml = simplexml_load_file('newest');

foreach($xml->channel->item as $item){
  echo (string)$item->title . PHP_EOL;
  echo (string)$item->link . PHP_EOL . PHP_EOL;
}

