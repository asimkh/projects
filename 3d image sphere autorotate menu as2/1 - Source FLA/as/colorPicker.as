stop();

//set inital values for colorpicker
initialVisibility=false;
tab._visible=initialVisibility;
btnClose._visible=initialVisibility;
isVisible=initialVisibility;
var redValue=0;
var rgeenValue=0;
var blueValue=0;
var parinteVar="";
var varAccess="";
var fct="";

//refresh variables on click
function refreshVar()
{
	var mc=eval(parinteVar);
	var colourRBG = redValue << 16 | greenValue << 8 | blueValue;
	mc[varAccess]=colourRBG;
	mc[fct]();
}

//show colorpicker
btnShow.onPress=function()
{
	isVisible=!isVisible;
	tab._visible=isVisible;
	btnClose._visible=isVisible;
}

//close colorpicker
btnClose.onPress=function()
{
	isVisible=false;
	tab._visible=isVisible;
	btnClose._visible=isVisible;
}



//set and show color defined by rgb
function setColour()
{
	var colourRBG = redValue << 16 | greenValue << 8 | blueValue;
	new Color(btnShow).setRGB(colourRBG);
	var val=colourRBG.toString(16);
	var newVal=val;
	if (val.length==1) newVal="00000"+val;
	if (val.length==2) newVal="0000"+val;
	if (val.length==3) newVal="000"+val;
	if (val.length==4) newVal="00"+val;
	if (val.length==5) newVal="0"+val;
	txColor.text="0x"+newVal;
	refreshVar();
}
	
//initialise colorpicker
function init(col,pr,vr,fc)
{
	parinteVar=pr;
	varAccess=vr;
	fct=fc;
	redValue=int("0x"+col.substr(2,2));
	greenValue=int("0x"+col.substr(4,2));
	blueValue=int("0x"+col.substr(6,2));
	tab.sldRed.init(0,255,redValue,String(this),"redValue","setColour");
	tab.sldGreen.init(0,255,greenValue,String(this),"greenValue","setColour");
	tab.sldBlue.init(0,255,blueValue,String(this),"blueValue","setColour"    );
	setColour();
}

//events when color is changing in the input text
txColor.onChanged = function(txt) 
{
   var tx=txColor.text;
	if (tx.length==8)
	{
		redValue=int("0x"+tx.substr(2,2));
		greenValue=int("0x"+tx.substr(4,2));
		blueValue=int("0x"+tx.substr(6,2));
		setColour();
		tab.sldRed.gotoPosition(redValue);
		tab.sldGreen.gotoPosition(greenValue);
		tab.sldBlue.gotoPosition(blueValue);
	}
};
