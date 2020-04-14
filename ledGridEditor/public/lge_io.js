////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function importXML(){
		var frameCnt = document.getElementById('FrameCounter').value;
		
		var picture = " ";
		var pause		= " ";
		
		if(frameCnt > 0){
			var ctf = document.getElementById("sCopyToFrame");
			var cff = document.getElementById("sCopyFromFrame");
			
			for(xCtr = 1; xCtr <= frameCnt; xCtr++ ){
				ctf.remove(2);
				cff.remove(1);
			}
			ctf.value = '';
		}
		document.getElementById('FrameCounter').value = 0;
		document.getElementById('framesDiv').innerHTML = '';
		
		var parser = new DOMParser();
		var xmlDoc = parser.parseFromString(document.getElementById('xmlstream').value, "text/xml");
		
		var frameCnt = xmlDoc.getElementsByTagName("frameCounter")[0].childNodes[0].nodeValue;
		document.getElementById('description').value = xmlDoc.getElementsByTagName("description")[0].childNodes[0].nodeValue;
		
		for(xCtr = 1; xCtr <= frameCnt; xCtr++ ){

			picture = xmlDoc.evaluate('/animation/frames/frame_' + xCtr + '/picture', xmlDoc, null, 2, null);
			pause = xmlDoc.evaluate('/animation/frames/frame_' + xCtr + '/pause', xmlDoc, null, 2, null);
			
			document.getElementById('outScreen').value = picture.stringValue.trim();
			document.getElementById('frameMicroseconds').value = pause.stringValue.trim();
			
			copyToFrame('New');
			
		}
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function exportXML(){
		var frameCnt = document.getElementById('FrameCounter').value;
		var frameMicroSec = document.getElementById('frameMicroseconds').value;
		var descpt = document.getElementById('description').value;
		
		var xmlString = `<?xml version="1.0" encoding="UTF-8"?>
<animation>
  <description>` + descpt + `</description>
  <frameCounter>` + frameCnt + `</frameCounter>
	<frames>
	`;
		
		for(xCtr = 1; xCtr <= frameCnt; xCtr++ ){
			xmlString += `	<frame_` + xCtr + `> <!-- This block will repeat for each frame -->
			<picture> <!-- This is each pixel $00_00_00_00, ... -->
				<![CDATA[ `+ document.getElementById('Frame_' + xCtr).value + `
				]]>
			</picture>
			<pause>`+ frameMicroSec + `</pause> <!-- microseconds -->
		</frame_` + xCtr + `>
	`;
			
		}
		xmlString += `</frames>
</animation>
`;
		document.getElementById('xmlstream').value = xmlString;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  function setOutString(){
  	var outStr = '';
  	for(x=1;x <= gGridLastCellNumber;x++){
			if(document.getElementById(document.getElementsByName(gGridPixelName + x)[0].id).style.backgroundColor){
 				outStr += rgb2String(document.getElementById(document.getElementsByName(gGridPixelName + x)[0].id).style.backgroundColor)
  		} else {
  			outStr += '000_000_000_000, ';
   		}
  	}
  	document.getElementById('outScreen').value = outStr;
  }
