//window programming functions

//initial values for window
stop();
#include "functions.as"

//events for all window buttons
var inst=this;
this._visible=false;
txScris.text="";
txConfirm._visible=false;
btnScroll._visible=false;
panel=_root.panel;
comp=_root.component;


//adding an element to xml Window
function addElem(tx,val)
{
	if (txScris.text=="")
	{
		txScris.text=tx+"="+'"'+val+'"';
	}
	else
	{
		txScris.text+="\n"+tx+"="+'"'+val+'"';
	}
}

// return a value from an array coresponding to a string
function makeStrFromArr(arr,vals,val)
{
	var rez=arr[0];
	for (var i=1;i<=arr.length;i++)
	{
		if (vals[i-1]==val)
		{
			rez=arr[i-1];
			break;
		}
	}
	return rez;
}



//return string from bool
function makeStrFromBool(bl,str)
{
	rez=str[1];
	if (bl) rez=str[0];
	return rez;
}

//scrolling xml window
function scrollWindow(par)
{
	txScris.scroll=par;
}


//prepare window for xml elements;
function loadWindow()
{
	var mc=_root.component;
	txScris.text="";
	addElem(mc.varNeeded[0],mc.spherePoints);
	addElem(mc.varNeeded[1],mc.sphereType);
	addElem(mc.varNeeded[2],mc.radius);
	addElem(mc.varNeeded[3],mc.maxScale);
	addElem(mc.varNeeded[4],mc.minScale);
	addElem(mc.varNeeded[5],mc.maxAlpha);
	addElem(mc.varNeeded[6],mc.minAlpha);
	addElem(mc.varNeeded[7],mc.maxBlur);
	addElem(mc.varNeeded[8],mc.minBlur);
	addElem(mc.varNeeded[9],mc.maxScaleRay);
	addElem(mc.varNeeded[10],mc.minScaleRay);
	addElem(mc.varNeeded[11],mc.maxAlphaRay);
	addElem(mc.varNeeded[12],mc.minAlphaRay);
	addElem(mc.varNeeded[13],mc.maxBlurRay);
	addElem(mc.varNeeded[14],mc.minBlurRay);
	addElem(mc.varNeeded[15],mc.limitProc);
	addElem(mc.varNeeded[16],mc.plusProc);
	addElem(mc.varNeeded[17],mc.alphaDistance);
	addElem(mc.varNeeded[18],makeStrFromBool(mc.enLine,["on","off"]));
	addElem(mc.varNeeded[19],mc.lineType);
	addElem(mc.varNeeded[20],makeStrFromBool(mc.enLineCol,["on","off"]));
	addElem(mc.varNeeded[21],panel.der.cpRayCol.txColor.text);
	addElem(mc.varNeeded[22],mc.hovEffect);
	addElem(mc.varNeeded[23],mc.zoomSizeOnHover);
	addElem(mc.varNeeded[24],mc.zoomSpeedOnHover);
	addElem(mc.varNeeded[25],mc.quality);
	addElem(mc.varNeeded[26],makeStrFromBool(mc.enGuide,["on","off"]));
	addElem(mc.varNeeded[27],mc.rotSpeed);
	addElem(mc.varNeeded[28],makeStrFromBool(mc.enAutoRotate,["on","off"]));
	addElem(mc.varNeeded[29],mc.autoRotX);
	addElem(mc.varNeeded[30],mc.autoRotY);
	addElem(mc.varNeeded[31],makeStrFromBool(mc.stopRotOnHover,["on","off"]));
	addElem(mc.varNeeded[32],mc.procRadZone);
	addElem(mc.varNeeded[33],mc.forceImagesWidth);
	addElem(mc.varNeeded[34],mc.forceImagesHeight);
	addElem(mc.varNeeded[35],makeStrFromBool(mc.enableToolTip,["on","off"]));
	addElem(mc.varNeeded[36],makeStrFromArr(["white","black"],[1,2],mc.tooltipType));
	addElem(mc.varNeeded[37],makeStrFromArr(["top","bottom","center","follow"],[1,2,3,4],mc.tooltipPosition));
	addElem(mc.varNeeded[38],makeStrFromBool(mc.tooltipAlwaysVisible,["on","off"]));
	addElem(mc.varNeeded[39],mc.ttOffsY);
	addElem(mc.varNeeded[40],mc.tooltipScale);
	addElem(mc.varNeeded[41],panel.der.cpNorCol.txColor.text);
	addElem(mc.varNeeded[42],mc.normalStrokeSize);
	addElem(mc.varNeeded[43],panel.der.cpHovCol.txColor.text);
	addElem(mc.varNeeded[44],mc.hoverStrokeSize);
	addElem(mc.varNeeded[45],mc.brightenMaxOnMouseOver);
	addElem(mc.varNeeded[46],mc.brightenSpeedOnMouseOver);
	addElem(mc.varNeeded[47],mc.desaturateMaxOnMouseOver);
	addElem(mc.varNeeded[48],mc.desaturateSpeedOnMouseOver);
	addElem(mc.varNeeded[49],mc.alphaMaxOnMouseOver);
	addElem(mc.varNeeded[50],mc.alphaSpeedOnMouseOver);
}

//detecting scroll on window and position the scroller bar
txScris.onScroller = function (my_txt:TextField)
{
	btnScroll.init(0,inst.txScris.maxscroll,inst.txScris.scroll,inst,"","scrollWindow");
};

//copy to clipboard event
btnCopy.onPress=function()
{
	System.setClipboard(inst.txScris.text);
	inst.txConfirm._visible=true;

}

//event when user click close button
btnClose.onPress=function()
{
	inst._visible=false;
	panel._visible=true;
	comp._visible=true;
}
 
//initialise xml Window
function init()
{
	txConfirm._visible=false;
	panel._visible=false;
	comp._visible=false;
	loadWindow();
	inst._visible=true;
}