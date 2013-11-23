// create a new ColorMatrixFilter that will
// be used to desaturate the image
var colorFilter = new flash.filters.ColorMatrixFilter();

// Each channel (RGBA) is represented in a ColorMatrixFilter
// instance with 5 values stored sequentially in its matrix
// property (4x5 matrix stored in a one-dimensional array).
// Each value represents an RGBA and an additional adder
// for that channel. The identity for this matrix will show
// an image with normal color and alpha. It is as follows
var redIdentity		= [1, 0, 0, 0, 0];
var greenIdentity	= [0, 1, 0, 0, 0];
var blueIdentity	= [0, 0, 1, 0, 0];
var alphaIdentity	= [0, 0, 0, 1, 0];

// A desaturated channel has a luminance of 30% red, 59% green,
// and 11% blue. Its row in the matrix would be the following -
// this will be used to blend with the identity rows to show
// a variable grayscale or desaturation in the image
var grayluma		= [.3, .59, .11, 0, 0];

// when the slider changes (or is initiated)
// update the grayscale for the image
function Desaturate (mc,amount)
{
	// create new array to represent the matrix
	// information used in colorFilter
	var colmatrix:Array = new Array();
	
	// populate the array with values resulting from the blended
	// grayluma array and the color identities given the amount
	// provided by the slider. 0 = all grayluma, no identity
	// 1 = no grayluma, all identity
	colmatrix = colmatrix.concat( interpolateArrays(grayluma,	redIdentity,	amount) );
	colmatrix = colmatrix.concat( interpolateArrays(grayluma,	greenIdentity,	amount) );
	colmatrix = colmatrix.concat( interpolateArrays(grayluma,	blueIdentity,	amount) );
	colmatrix = colmatrix.concat( alphaIdentity ); // alpha not affected
	
	// assign the new matrix to colorFilter
	colorFilter.matrix = colmatrix;
	
	// apply the filter to the image
	return colorFilter;
}

// interpolateArrays interpolates the values
// in two arrays by an amount t (0-1)
function interpolateArrays(ary1, ary2, t){
	var result:Array = (ary1.length >= ary2.length) ? ary1.slice() : ary2.slice();
	var i = result.length;
	while(i--) result[i] = ary1[i] + (ary2[i] - ary1[i])*t;
	return result;
}

function darken(mc,am)
{
	var transformer:Transform = new Transform(mc);
	var colorTransformer:ColorTransform = transformer.colorTransform;
	colorTransformer.redMultiplier =am;
	colorTransformer.greenMultiplier = am;
	colorTransformer.blueMultiplier = am;
	transformer.colorTransform = colorTransformer;
}
