//initial values for slider
stop();
#include "functions.as"
var sens="x";
var maxPos=0;
var minVal=0;
var maxVal=100;
var cPos=0;
var parinteVar="";
var varAccess="";
var parinteFunc="";
var fact=1;
var pos=0;
var dif=0;
var inv="";

//recalculate parent values
function refreshVar()
{
	var mc=eval(parinteVar);
	var cat=Number(pos*fact);
	if (inv=="invers") 
	{
		cat=maxVal*fact-cat+minVal*fact;
	}
	mc[varAccess]=cat;
	mc[parinteFunc](cat);
	
}

//calculate position of tap acording to mouse
function calcPosition()
{
	if (sens=="x")
	{
		pos=minMaxInterval(0,minVal,maxPos,maxVal,tap._x);
		if (_xmouse>=maxPos+dif) pos=maxVal;
	}
	if (sens=="y")
	{
		pos=minMaxInterval(0,minVal,maxPos,maxVal,tap._y);
		if (_ymouse>=maxPos+dif) pos=maxVal;
	}
	
	
	pos=zecimale(pos,0);
	mcScris.scris.text=pos;
	refreshVar();
}

// force tap to specified position
function gotoPosition(val,cum)
{
	pos=minMaxInterval(minVal,0,maxVal,maxPos,val);
	if (sens=="x")
	{
		tap._x=pos;
	}
	if (sens=="y")
	{
		tap._y=pos;
	}
	pos=val;
	mcScris.scris.text=pos;
	if (!cum) refreshVar();
}


//tap events
tap.onRollOver=function()
{
	this.gotoAndStop(2);
}

tap.onRollOut=function()
{
	this.gotoAndStop(1);
}

tap.onPress=function()
{
	dif=this._parent._xmouse;
	if (tap._width<5) dif=this._xmouse;
	if (sens=="y") dif=tap._ymouse;
	this.gotoAndStop(3);
	if (sens=="x") this.startDrag(false,0,0,maxPos,0);
	if (sens=="y") this.startDrag(false,0,0,0,maxPos);
	this.onEnterFrame=function()
	{
		calcPosition();
	}
}

tap.onRelease=function()
{
	this.gotoAndStop(2);
	this.stopDrag();
	delete this.onEnterFrame;
}
tap.onReleaseOutside=function()
{
	this.gotoAndStop(1);
	this.stopDrag();
	delete this.onEnterFrame;
}

//init slider with those values
function init(mi,ma,cp,pr,vr,pf,fa,invers)
{
	maxPos=slider_length._width-tap._width+slider_length._x*2;
	if (slider_length._height>slider_length._width) 
	{
		maxPos=slider_length._height-tap._height+slider_length._y*2;
		sens="y";
	}
	

	minVal=mi;
	maxVal=ma;
	cPos=cp;
	parinteVar=pr;
	varAccess=vr;
	parinteFunc=pf;
	inv=invers;
	if (fa!=undefined) fact=fa;
	gotoPosition(cp);
}

//initial loading 
init(minVal,maxVal,cPos);
			
			
			
