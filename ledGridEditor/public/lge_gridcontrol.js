////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function moveUp(){
// Move Top row to the save space
		for(l = 1;l <= gGridCols;l++){
			document.getElementById(gGridSaveColPixelId + l).style.backgroundColor = 
				document.getElementById(document.getElementsByName(gGridPixelName + l)[0].id).style.backgroundColor;			
		}
// Move the grid up one
		var lstart = 1
		var lstop = gGridLastCellNumber - gGridCols
	 	for(y=lstart;y <= lstop;y++){
	 		var cell = y + gGridCols;
			document.getElementById(document.getElementsByName(gGridPixelName + (cell - gGridCols))[0].id).style.backgroundColor = 
				document.getElementById(document.getElementsByName(gGridPixelName + cell)[0].id).style.backgroundColor;
	 	}
// Move the save space to the last row.
	 	for(l=1;l <= gGridCols;l++){
			document.getElementById(document.getElementsByName(gGridPixelName + (l + lstop))[0].id).style.backgroundColor =
				document.getElementById(gGridSaveColPixelId + l).style.backgroundColor;
			document.getElementById(gGridSaveColPixelId + l).style.backgroundColor = '';			
		}
		setOutString();
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function moveDown(){
// Move last row to save space
		lstart = gGridLastCellNumber
		lstop = 1
		x=0
		for(l=gGridCols;l >= lstop ;l--){
			document.getElementById(gGridSaveColPixelId + l).style.backgroundColor = 
				document.getElementById(document.getElementsByName(gGridPixelName + (lstart - x))[0].id).style.backgroundColor;
			x++
		}

// Move the grid down 1 row
		lstart = gGridLastCellNumber - gGridCols
		lstop = 1
	 	for(curPix=lstart;curPix >= lstop;curPix--){
			document.getElementById(document.getElementsByName(gGridPixelName + (curPix + gGridCols))[0].id).style.backgroundColor = 
				document.getElementById(document.getElementsByName(gGridPixelName + curPix)[0].id).style.backgroundColor;
	
	 	}
// Move the save space to the first row
	 	for(l=1;l<=gGridCols;l++){
			document.getElementById(document.getElementsByName(gGridPixelName + l)[0].id).style.backgroundColor =
				document.getElementById(gGridSaveColPixelId + l).style.backgroundColor;
			document.getElementById(gGridSaveColPixelId + l).style.backgroundColor = '';			
		}
		setOutString();
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function moveGridLeftRight(iDir){
//		zCtr = 0
//		console.log('Move:' + iDir)
		if(iDir == 'L'){
			dir = 'l'
			colToSave = '_1'
			colFromSave = '_' + gGridCols
			colMoveToDir = -1
			colMoveFromDir = 0
			colStart = 2
			colStop = gGridCols
		} else {
			dir = 'r'
			colToSave = '_' + gGridCols
			colFromSave = '_1'
			colMoveToDir = 1
			colMoveFromDir = -2
			colStart = gGridCols -1
			colStop = 1
		}
// Move Colum to save colum
		for(curRow=1;curRow <= gGridRows;curRow++){
			document.getElementById(gGridSaveRowPixelId + curRow).style.backgroundColor = 
				document.getElementById(gGridPixelId + curRow + colToSave).style.backgroundColor
			document.getElementById(gGridPixelId + curRow + colToSave).style.backgroundColor = ''
		}
// Move colums over 1
	 	for(curRow=1;curRow <= gGridRows;curRow++){
			for(curCol=colStart;curCol <= gGridCols && curCol >= 1 ;curCol++){
				
//				console.log(
//				' Fr:'+ gGridPixelId + curRow + '_' + (curCol+(1*colMoveToDir)) +
//				' to:'+ gGridPixelId + curRow + '_' + curCol +
//				' curRow:' + curRow +
//				' curCol:' + curCol 
//				)
				document.getElementById(gGridPixelId + curRow + '_' + (curCol+(1*colMoveToDir))).style.backgroundColor = 
					document.getElementById(gGridPixelId + curRow + '_' + curCol).style.backgroundColor
				curCol = curCol + colMoveFromDir
			}
	 	}
// Move save colum to colum
	 	for(curRow=1;curRow<=gGridRows;curRow++){	
			document.getElementById(gGridPixelId + curRow + colFromSave ).style.backgroundColor =
				document.getElementById(gGridSaveRowPixelId + curRow).style.backgroundColor
			document.getElementById(gGridSaveRowPixelId + curRow).style.backgroundColor = ''	
		}


/*
// Move left Colum to save colum
		for(curRow=1;curRow <= gGridRows;curRow++){
			document.getElementById(gGridSaveRowPixelId + curRow).style.backgroundColor = 
				document.getElementById(gGridPixelId + curRow + colToSave).style.backgroundColor
			document.getElementById(gGridPixelId + curRow + colToSave).style.backgroundColor = ''
		}
// Move colums left 1
	 	for(curRow=1;curRow <= gGridRows;curRow++){
			for(curCol=2;curCol <= gGridCols;curCol++){
				document.getElementById(gGridPixelId + curRow + '_' + (curCol-1)).style.backgroundColor = 
					document.getElementById(gGridPixelId + curRow + '_' + curCol).style.backgroundColor;
			}
	 	}
// Move save colum to las colum
	 	for(curRow=1;curRow<=gGridRows;curRow++){
			document.getElementById(gGridPixelId + curRow + '_' + gGridCols ).style.backgroundColor =
				document.getElementById(gGridSaveRowPixelId + curRow).style.backgroundColor
			document.getElementById(gGridSaveRowPixelId + curRow).style.backgroundColor = ''	
		}
*/
		setOutString();
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function clearRowCol(were){
		if(were === 'top'){
			for(curCol = 1; curCol <= gGridCols; curCol++){
				document.getElementById(gGridPixelId + '1_' + curCol).style.backgroundColor = ''
			}
		} else if(were === 'bot'){
			for(curCol = 1; curCol <= gGridCols; curCol++){
				document.getElementById(gGridPixelId + gGridRows + '_' + curCol).style.backgroundColor = ''
			}
		} else if(were === 'left'){
			for(curRow = 1; curRow <= gGridRows; curRow++){
				document.getElementById(gGridPixelId + curRow + '_' + 1).style.backgroundColor = ''
			}
		} else if(were === 'right'){
			for(curRow = 1; curRow <= gGridRows; curRow++){
				document.getElementById(gGridPixelId + curRow + '_' + gGridCols).style.backgroundColor = ''
			}
		}
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function gridLoad(fLocation){

		var papaConfig = {
			delimiter: ",",	// auto-detect
			newline: "",	// auto-detect
			quoteChar: '"',
			header: false,
			dynamicTyping: false,
			preview: 0,
			encoding: "",
			worker: false,
			comments: false,
			step: undefined,
			complete: undefined,
			error: undefined,
			download: false,
			skipEmptyLines: true,
			chunk: undefined,
			fastMode: undefined,
			beforeFirstChunk: undefined,
			withCredentials: undefined
		};
		
		var myParsed = Papa.parse(document.getElementById(fLocation).value, papaConfig);
		
		var outStr = '';
		for(x=0;x < gGridLastCellNumber ;x++){
//		for(x=0;x < 288 ;x++){
			if(typeof myParsed.data[0][x] === 'undefined') {
				document.getElementById(document.getElementsByName(gGridPixelName + (x + 1))[0].id).style.backgroundColor = '';
			} else {
				myRgbVal = myParsed.data[0][x].replace(/ /g, '')
				myRgbVal = myRgbVal.replace(/_/g, '')
//				console.log(myParsed.data[0][x])
//				if(myParsed.data[0][x].replace(/ /g, '') == '$00_00_00_00'){
				if(myRgbVal == 0){
					myParsed.data[0][x] = '';
				}
//				console.log(myParsed.data[0][x])
				document.getElementById(document.getElementsByName(gGridPixelName + (x + 1))[0].id).style.backgroundColor = string2hex(myParsed.data[0][x])
//				console.log(document.getElementById(document.getElementsByName(gGridPixelName + (x + 1))[0].id).style.backgroundColor)
//				return
//					myParsed.data[0][x]
//					.replace(/\$/g, '#')
//					.replace(/_/g, '')
//					.replace(/ /g, '')
//					.substr(0,7);
			}
		}
		setOutString()
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function copyToFrame(selectedOption){
		
		var frameName = '';
		var framePauseName = '';
		
		if(selectedOption == "New"){
			var tf = document.getElementById("sCopyToFrame");
			var tf_option = document.createElement("option");
			
			document.getElementById('FrameCounter').value = parseInt(document.getElementById('FrameCounter').value) + 1;
			frameName = "Frame " + document.getElementById('FrameCounter').value;
			framePauseName = "FramePause " + document.getElementById('FrameCounter').value;
			
			tf_option.text = frameName;
			tf.add(tf_option);
			
			var ff = document.getElementById("sCopyFromFrame");
			var ff_option = tf_option.cloneNode(true);
			ff.add(ff_option);
			
			document.getElementById('sCopyToFrame').value = frameName;
			
			var dummy = '<INPUT type="hidden" id="' + frameName.replace(/ /g, '_') + '" value="">\n';
			document.getElementById('framesDiv').innerHTML += dummy; 
			
			dummy = '<INPUT type="hidden" id="' + framePauseName.replace(/ /g, '_') + '" value="">\n';
			document.getElementById('framesPauseDiv').innerHTML += dummy; 
			
		} else {
			frameName = selectedOption.replace(/ /g, '_');
			framePauseName = "FramePause " + frameName.substr(frameName.indexOf('_')+1);
		}
		document.getElementById(frameName.replace(/ /g, '_')).value = document.getElementById('outScreen').value;
		document.getElementById(framePauseName.replace(/ /g, '_')).value = document.getElementById('frameMicroseconds').value;
		
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function copyFromFrame(selectedOption){
		
		gridLoad(selectedOption.replace(/ /g, '_'));

	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function movethoroughFames(direction){
			
		var numberOfFrames = parseInt(document.getElementById('FrameCounter').value);
		
		var startFrame = parseInt(document.getElementById('frameMovementBox').value);
		
		if(direction == 'back'){
			if(startFrame < 2){
				startFrame = 2;
			}
			startFrame = startFrame - 1;
			document.getElementById('sCopyFromFrame').value = 'Frame ' + startFrame;
			gridLoad('Frame_' + startFrame);
		} else {
			if(startFrame >= numberOfFrames){
				startFrame = numberOfFrames - 1;
			}
			startFrame = startFrame + 1;
			document.getElementById('sCopyFromFrame').value = 'Frame ' + startFrame;
			gridLoad('Frame_' + startFrame);
		}
		
		document.getElementById('frameMovementBox').value = startFrame;
		
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	var Key = {
			LEFT:   37,
			RIGHT:  39
		//	UP:     38,
		//	DOWN:   40
		};

		/**
		* old IE: attachEvent
		* Firefox, Chrome, or modern browsers: addEventListener
		*/
		function _addEventListener(evt, element, fn) {
			if (window.addEventListener) {
				element.addEventListener(evt, fn, false);
			}
			else {
				element.attachEvent('on'+evt, fn);
			}
		}

		function handleKeyboardEvent(evt) {
			if (!evt) {evt = window.event;} // for old IE compatible
			var keycode = evt.keyCode || evt.which; // also for cross-browser compatible

			var info = document.getElementById("info");
			switch (keycode) {
				case Key.LEFT:
					movethoroughFames('back');
					break;
//				case Key.UP:
//					info.value += "UP ";
//					break;
				case Key.RIGHT:
					movethoroughFames('forward');
					break;
//				case Key.DOWN:
//					info.value += "DOWN ";
//					break;
				default:
//					info.value += "SOMEKEY ";
			}
		}

_addEventListener('keydown', document, handleKeyboardEvent);
