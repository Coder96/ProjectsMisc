
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function rowHeaderTableCreate(iGridRows){

	ts = `
<table cellspacing="0" border="1"> <!-- Row Header  -->
	<tbody>
		<tr><th class=gGridPixelClass >0</th></tr>
`

	for(ctr = 1;ctr <= iGridRows;ctr++){
		ts += `
		<tr><th class=` + gGridPixelClass + ' id="' + gGridSaveRowPixelId + ctr + '" >' + ctr + `</th></tr>`
	}
	ts += `
	</tbody>
</table>
`
	document.getElementById('rowHeaderTable').innerHTML = ts

}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function colHeaderTableCreate(gGridCols){
	ts = `
<table cellspacing="0" border="1"> <!-- Col Pixel Header  -->
	<thead>
		<tr>`

	for(ctr = 1;ctr <= gGridCols;ctr++){
		ts += `
		<th class=` + gGridPixelClass + ' id="' + gGridSaveColPixelId + ctr + '" >' + zeroFill( ctr, 3 ) + '</th>'
	}
	ts += `

		</tr>
	</thead>
	<tbody>`+
		pixelTableCreate(gGridRows, gGridCols) + `
	</tbody>
</table>
`
	document.getElementById('colHeaderTable').innerHTML = ts
	pixelTableCreate(gGridRows, gGridCols)
	
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function pixelTableCreate(gGridRows, gGridCols){
	ts = ``
cellCtr = 1
	for(rowCtr = 1;rowCtr <= gGridRows;rowCtr++){
	ts += `
		<tr>`

		for(colCtr = 1;colCtr <= gGridCols;colCtr++){
			mCellId = gGridPixelId + rowCtr + '_' + colCtr
			ts += `
			<td class=` + gGridPixelClass + ' name="' + gGridPixelName + cellCtr + '" id="' + mCellId + '" onclick=pixelSetColor(\'' + mCellId + '\'); align="center"></td>'
		cellCtr ++
		}
		ts += `
		</tr>`	
	}
	ts += `
	</thead>
	<tbody>
		<div id="LedTable"></div>
	</tbody>
</table>
`
	return ts
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function zeroFill( number, width ){
  width -= number.toString().length;
  if ( width > 0 )
  {
    return new Array( width + (/\./.test( number ) ? 2 : 1) ).join( '0' ) + number;
  }
  return number + ""; // always return a string
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function gridCalculateSomething(){
	
}