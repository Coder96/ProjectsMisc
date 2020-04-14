////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function rgb2String(rgb){		
 		rgb = rgb.match(/^rgba?[\s+]?\([\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?/i);
 		return(
	 		zeroFill(rgb[1], 3) + '_' + 
 			zeroFill(rgb[2], 3) + '_' + 
 			zeroFill(rgb[3], 3) + '_000, '
 		)
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function string2hex(iString){		// 0_0_0_0
		items = iString.split('_')
//		console.log(iString)
		items[0] = parseInt(items[0])
		items[1] = parseInt(items[1])
		items[2] = parseInt(items[2])
//		console.log(zeroFill(items[0].toString(16), 2))
//		console.log(zeroFill(items[1].toString(16), 2))
//		console.log(zeroFill(items[2].toString(16), 2))
		return(
			zeroFill(items[0].toString(16), 2) +
			zeroFill(items[1].toString(16), 2) +
			zeroFill(items[2].toString(16), 2)
		)
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  function rgb2hex(rgb){
 		rgb = rgb.match(/^rgba?[\s+]?\([\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?/i);
 		return (rgb && rgb.length === 4) ? "$" +
  		("0" + parseInt(rgb[1],10).toString(16)).slice(-2) + '_' +
 			("0" + parseInt(rgb[2],10).toString(16)).slice(-2) + '_' +
	  	("0" + parseInt(rgb[3],10).toString(16)).slice(-2) : '';
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function rgb2hex2(rgb) {
    rgb = Array.apply(null, arguments).join().match(/\d+/g);
    rgb = ((rgb[0] << 16) + (rgb[1] << 8) + (+rgb[2])).toString(16);

    // for (var i = rgb.length; i++ < 6;) rgb = '0' + rgb;

    return rgb;
	};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function hex2rgb(hex) {
    hex = hex.replace(/ |#/g, '');
    if(hex.length === 3) hex = hex.replace(/(.)/g, '$1$1');

    // http://stackoverflow.com/a/6637537/1250044
    hex = hex.match(/../g);    
    return [parseInt(hex[0], 16), parseInt(hex[1], 16), parseInt(hex[2], 16)];
	}