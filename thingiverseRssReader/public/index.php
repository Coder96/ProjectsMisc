<?php


include '../db.inc.php';

//<div style="margin: 5px;">
//  <a href="https://www.thingiverse.com/thing:5178099">
//    <img src="https://cdn.thingiverse.com/assets/47/bb/66/d1/2a/large_preview_20211229_223728_Small.jpg"  
//    class="preview_large" style="width: 240px; height: 180px">
//  </a>
//<br/>
//</div>

echo '
<style>
body {
  font-family: Arial, sans-serif;
}
.floatLeft { width: 500px; float: left;  border: 1px solid;}
.floatRight {width: 500px; float: right; }
.container { overflow: hidden; }
</style>
';

$lastThingID = 0;

if(isset($_POST['fbthingID']) and is_numeric($_POST['fbthingID']) and $_POST['fbthingID'] > 0){
  $lastThingID = $_POST['fbthingID'];
  saveLastThingViewed($lastThingID);
} else {
  $lastThingID = getLastThingViewed();
}

$itemList = selectOldestNotRead($lastThingID);

if(!$itemList){
  echo 'No items found.';
  exit;
}
echo '<div class="container">';

foreach($itemList as $item){
  echo itemForm($item);
  $lastThingID = $item['tid_thingId'];
}
echo '
<div class="floatLeft" >
  <form method=post>
    <input type=hidden name=fbthingID value="'.$lastThingID.'">
    <P><input type=submit value="Next"></P>
  </form>
</div>
';
echo '</div>';
//////////////////////////////////////////////////////////
function returnImageLink($isLink, $isImgLink){
  return '
<a href="'.$isLink.'" target="_blank">
  <img src="'.$isImgLink.'"  
  style="width: 240px; height: 180px">
</a>
  ';
}
//////////////////////////////////////////////////////////
function itemForm($iaItem){
  return '
<div class="floatLeft">
  <table width=500px>
    <tr>
      <td colspan=3><h1>'.substr($iaItem['tid_title'],0,20).'</h1></td>
    </tr>  
    <tr>
      <td>'.substr($iaItem['tid_description'],0,100).'<td>
      <td>'.returnImageLink($iaItem['tid_link'], $iaItem['tid_imageLink']).'<td>
    </tr>
  </table>
</div>
';
}
//////////////////////////////////////////////////////////
//	tid_title
//	tid_link
//  tid_imageLink
//	tid_thingId
//	tid_description
//	tid_author
//	tid_pubDate
	function selectOldestNotRead($inLastThingID){
		
		$stmt = $GLOBALS['tiv']['pdo']->prepare('
Select
	*
From
	tiv_thingItemDetail
Where 
  tid_thingId > '.$inLastThingID.'
Order By
  tid_thingId
Limit 100
');
		$stmt->execute();
		if($stmt->rowCount() > 0){
		  return $stmt->fetchall();
		} else {
			return False;
		}
	}
//////////////////////////////////////////////////////////
function getLastThingViewed(){
  
		$stmt = $GLOBALS['tiv']['pdo']->prepare('
Select
	*
From
	tiv_KeyValue
Where 
  kv_keyName Like "lastThingID"
');
		$stmt->execute();
		if($stmt->rowCount() > 0){
		  return $stmt->fetchall()[0]['kv_keyValue'];
		} else {
			return 0;
		}
}
//////////////////////////////////////////////////////////
function saveLastThingViewed($iiLastthingViewed){

		$stmt = $GLOBALS['tiv']['pdo']->prepare('
Insert Ignore Into
	tiv_KeyValue
SET
	kv_keyName  = :kv_keyName  ,
	kv_keyValue = :kv_keyValue
ON DUPLICATE KEY UPDATE
	kv_keyName = :kv_keyName2,
	kv_keyValue = :kv_keyValue2
');
	$stmt->execute([
		':kv_keyName'   => 'lastThingID',
		':kv_keyValue'  => $iiLastthingViewed,
		':kv_keyName2'  => 'lastThingID',
		':kv_keyValue2' => $iiLastthingViewed
	]);

	if($stmt->rowCount() > 0){
		$stmt->execute();
		if($stmt->rowCount() > 0){
		  return $iiLastthingViewed;
		} else {
			return False;
		}
	}
}
