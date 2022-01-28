#!/usr/bin/php
<?php

  $desc = '
<div style="margin: 5px;">
  <a href="https://www.thingiverse.com/thing:5178099"><img src="https://cdn.thingiverse.com/assets/47/bb/66/d1/2a/large_preview_20211229_223728_Small.jpg"  class="preview_large" style="width: 240px; height: 180px">
  </a>
<br/>
</div>
<div>
  <div>
    <p>The white bezel on the Google Nest Hub was far too bright and obnoxious to match the dark black aesthetics of my set up so I printed a cover to hide the frame and blend the device in.</p>
  </div>
</div>
';
 
$q = getfirstImagepath($desc);
print_r($q);


$q = getDivText($desc);
print_r($q);

exit;

  

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
function getDivText($content){
  $doc = new DOMDocument();
  $doc->loadHTML($content);
  if(!empty($doc->textContent)){
    return trim($doc->textContent);
  } else {
    return FALSE;
  }
}