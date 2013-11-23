//initial classes needed
stop();
import flash.filters.BlurFilter;
import flash.geom.Transform;
import flash.geom.ColorTransform;
#include "as/effects.as"
#include "as/functions.as"
#include "as/onclick.as"


//variables from xml
var spherePoints=inst.valNeeded[0];
var sphereType=inst.valNeeded[1];
var radius=inst.valNeeded[2];
var maxScale=inst.valNeeded[3];
var minScale=inst.valNeeded[4];
var maxAlpha=inst.valNeeded[5];
var minAlpha=inst.valNeeded[6];
var maxBlur=inst.valNeeded[7];
var minBlur=inst.valNeeded[8];
var maxScaleRay=inst.valNeeded[9];
var minScaleRay=inst.valNeeded[10];
var maxAlphaRay=inst.valNeeded[11];
var minAlphaRay=inst.valNeeded[12];
var maxBlurRay=inst.valNeeded[13];
var minBlurRay=inst.valNeeded[14];
var limitProc=inst.valNeeded[15];
var plusProc=inst.valNeeded[16];
var alphaDistance=inst.valNeeded[17];
var enLine=makeBool("on",inst.valNeeded[18]);
var lineType=inst.valNeeded[19];
var enLineCol=makeBool("on",inst.valNeeded[20]);
var lineColor=inst.valNeeded[21];
var hovEffect=inst.valNeeded[22];
var zoomSizeOnHover=inst.valNeeded[23];
var zoomSpeedOnHover=inst.valNeeded[24];
var quality=inst.valNeeded[25];
var enGuide=makeBool("on",inst.valNeeded[26]);
var rotSpeed=inst.valNeeded[27];
var enAutoRotate=makeBool("on",inst.valNeeded[28]);
var autoRotX=inst.valNeeded[29];
var autoRotY=inst.valNeeded[30];
var stopRotOnHover=makeBool("on",inst.valNeeded[31]);
var procRadZone=inst.valNeeded[32];
var forceImagesWidth=inst.valNeeded[33];
var forceImagesHeight=inst.valNeeded[34];
var enableToolTip=makeBool("on",inst.valNeeded[35]);
var tooltipType=retValFromArr(["white","black"],[1,2],inst.valNeeded[36]);
var tooltipPosition=retValFromArr(["top","bottom","center","follow"],[1,2,3,4],inst.valNeeded[37]);
var tooltipAlwaysVisible=makeBool("on",inst.valNeeded[38]);
var ttOffsY=inst.valNeeded[39];
var tooltipScale=inst.valNeeded[40];
var normalStrokeColor=inst.valNeeded[41];
var normalStrokeSize=inst.valNeeded[42];
var hoverStrokeColor=inst.valNeeded[43];
var hoverStrokeSize=inst.valNeeded[44];
var brightenMaxOnMouseOver=inst.valNeeded[45];
var brightenSpeedOnMouseOver=inst.valNeeded[46];
var desaturateMaxOnMouseOver=inst.valNeeded[47];
var desaturateSpeedOnMouseOver=inst.valNeeded[48];
var alphaMaxOnMouseOver=inst.valNeeded[49];
var alphaSpeedOnMouseOver=inst.valNeeded[50];


//initial values needed
if (_root.panel==undefined)
{
	var allignElement=inst.valNeeded2[0];
	var offX=inst.valNeeded2[1];
	var offY=inst.valNeeded2[2];
	if (allignElement=="center")
	{
		this._x=Stage.width/2;
		this._y=Stage.height/2;
	}
	if (allignElement=="left")
	{
		this._x=radius+offX;
		this._y=radius+offY;
	}
}

var ttDepX=5;
var objectsLoaded=false;
inst.paused=false;
hoverZone._alpha=0;
hoverZone.isOut=false;
var rotX=0;
var rotY=0;
var spherePoints2=0;
var sphereType2=0;
var isSel="";
var isSel2="";
var factSpeed=20;
var rotZ=0;
var nrPoints=0;
mcEmb._visible=false;
orig.pos=point_vector(orig);
orig.sc=0;
orig._visible=false;
orig._width=radius*2;
orig._height=radius*2;
orig._alpha=0;
inst._parent.panel.initGUI();
inst.selMax=0;
inst.elements._alpha=0;
//add movie for text
var child2=inst.elements.createEmptyMovieClip("lines",inst.elements.getNextHighestDepth());
child2.sonAv="mcLine";
//add movie for lines
var child1=inst.elements.createEmptyMovieClip("items",inst.elements.getNextHighestDepth());
child1.sonAv="mcLoader";


// return a value from an array coresponding to a value from an array arr=["a","b"],vals=[-1,1] 
//val="a" return -1,val ="b" return 1
function retValFromArr(arr,vals,val)
{
	var rez=vals[0];
	for (var i=1;i<=arr.length;i++)
	{
		if (arr[i-1]==val)
		{
			rez=vals[i-1];
			break;
		}
	}
	return rez;
}

//if val is str return true otherwise return false
function makeBool(str,val)
{
	var rez=false;
	if (val==str) rez=true;
	return rez;
}

//user rotate the sphere
function axisConditions()
{
	var catX=hoverZone._ymouse/factSpeed*rotSpeed/factSpeed;
	var catY=hoverZone._xmouse/factSpeed*rotSpeed/factSpeed;
	rotX=-catX;
	rotY=catY;
	if (hoverZone.isOut) 
	{
		rotX=0;
		rotY=0;
	}
}

//apply function when user is on the sphere
function hoverFunction()
{
	if (!inst.paused)
	{
		axisConditions();
	}
	else
	{
		rotX=0;
		rotY=0;
	}
	refresh();
}

//if mouse over on sphere or not
function doHover()
{
	delete hoverZone.onEnterFrame;
	hoverZone.onEnterFrame=function()
	{
		if (!enAutoRotate) hoverFunction();
		else delete hoverZone.onEnterFrame;
		refresh();
	}
}


//initiales hover area events
function initHover()
{
//	delete hoverZone.onEnterFrame;
	if (!enAutoRotate)
	{
		hoverZone.onRollOver=function()
		{
			hoverZone.isOut=false;
			doHover();
		}
		
		hoverZone.onRollOut=hoverZone.onReleaseOutside=function()
		{
			rotX=0;
			rotY=0;
			isSel="";
			for (var i=1;i<=nrPoints;i++)
			{
				var mc=child1["element"+i];
				mc.onOut(true);
			}
			hoverZone.isOut=true;
			refresh();
		}
	}
}


//generate all
function initAll()
{
	initHover();
	if (spherePoints!=spherePoints2 ||sphereType!=sphereType2)
	{
	sphereType2=sphereType;
	if (objectsLoaded)
	{
		spherePoints2=spherePoints;
	}
	removeAll();
	var o=egal(orig.pos);
	var rad=radius;
	var nr=spherePoints;
	var u=180/(nr-1);
	var buf=[];
	for (var i=1;i<=nr;i++)
	{
		var v1=egal(o);
		var vR="";
		v1.x+=rad;
		vR=roteste_z(v1,o,(i-1)*u-90);
		vector_point(vR,mc);
		buf.push(vR);
	}
	
	if (child1!=undefined)
	{
	addPoint(vector(o.x,o.y-rad,o.z),inst.elemNeeded[nrPoints]);
	for (var j=1;j<=nr-2;j++)
	{
		var u=180/(nr-1);
		var cate=nr*2-2;
		var tp=nr-sphereType;
		
		if (j==1 || j==nr-2) 
		{
			cate=sphereType;
			u=360/(sphereType);
		}
		
		
		for (var i=1;i<=cate;i++)
		{
			k++;
			var orig2=egal(buf[j]);orig2.x=o.x;
			vR=roteste_y(buf[j],o,(i-1)*u);
			addPoint(vR,inst.elemNeeded[nrPoints]);
		}
	}
	addPoint(vector(o.x,o.y+radius,o.z),inst.elemNeeded[nrPoints]);
	refresh();
	}
	}
}


//draw a line by rotation
function rotateLine(mc,v1,v2)
{
	mc._x=v1.x;mc._y=v1._y;
	var u=panta(v1,v2)+180;
	var dist=distanta(v1,v2);
	mc.maska._width=dist;
	mc._rotation=u;
}

//add an image
function addImage(mc,path)
{
	var mclListener:Object = new Object();
	var image_mcl:MovieClipLoader = new MovieClipLoader();
	image_mcl.addListener(mclListener);
	var str=elementsPath+path;
	if (path.substr(0,7)=="http://")
	{
		str=path;
	}
	image_mcl.loadClip(str,mc);
	mclListener.onLoadInit = function(target_mc:MovieClip) 
	{
		addProperties(target_mc);
	}
}

// add a tooltip
function addToolTip(mc)
{
	var tx=mc.obiect[1];
	removeMovieClip(mc.tooltip);
	mc.attachMovie("mcToolTip"+inst.tooltipType,"tooltip",mc.getNextHighestDepth());
	mc.tt=tx;
	mc.tooltip.scris.text=tx;
	mc.tooltip.scris.autoSize=true;
	mc.tooltip.bgr._width=mc.tooltip.scris._width+ttDepX*2;
	mc.tooltip._xscale=tooltipScale;
	mc.tooltip._yscale=tooltipScale;
	
	if (inst.tooltipPosition==1)
	{
		mc.tooltip.bgr._x=-mc.tooltip.bgr._width/2;
		mc.tooltip.scris._x=-mc.tooltip.bgr._width/2+ttDepX;
		mc.tooltip._y=-mc.holder._height/2-mc.tooltip._height;
		mc.tooltip.bgr._y=inst.ttOffsY;
		mc.tooltip.scris._y=inst.ttOffsY;
		
	}
	
	if (inst.tooltipPosition==2)
	{
		mc.tooltip.bgr._x=-mc.tooltip.bgr._width/2;
		mc.tooltip.scris._x=-mc.tooltip.bgr._width/2+ttDepX;
		mc.tooltip.bgr._y=inst.ttOffsY;
		mc.tooltip.scris._y=inst.ttOffsY;
		mc.tooltip._y=mc.holder._height/2;
	}
	
	if (inst.tooltipPosition==3)
	{
		mc.tooltip.bgr._x=-mc.tooltip.bgr._width/2;
		mc.tooltip.scris._x=-mc.tooltip.bgr._width/2+ttDepX;
		mc.tooltip.bgr._y=-mc.tooltip.bgr._height/2;
		mc.tooltip.scris._y=-mc.tooltip.bgr._height/2;
	}
	
	mc.tooltip.sageata._visible=false;
	
	
	if (!tooltipAlwaysVisible)
	{
		mc.tooltip._alpha=0;
	}
}


//add all tooltips
function addAllTooltips()
{
	if (inst.nrPoints>0)
	{
	removeMovieClip(inst.tooltip);
	for (var i=1;i<=inst.nrPoints;i++)
	{
		var mc=child1["element"+i];
		removeMovieClip(mc.tooltip);
	}
	if (inst.enableToolTip)
	{
		if (inst.tooltipPosition==4)
		{
			if (inst.tooltip.length==undefined)
			{
				inst.tooltip=inst.attachMovie("mcToolTip"+inst.tooltipType,"tooltip",inst.getNextHighestDepth());
				inst.tooltip._alpha=0;
			}
		}
		else
		{
			for (var i=1;i<=inst.nrPoints;i++)
		{
			var mc=child1["element"+i];
			addToolTip(mc);
		}
		}
	}
	}
}


//draw border for a picture
function drawBorder(mc,w,h,s,c)
{
	mc.clear();
	if (s!=0)
	{
		mc.lineStyle(s,c,100);
		mc.moveTo(-w/2, -h/2);
		mc.lineTo(w/2,-h/2);
		mc.lineTo(w/2,h/2);
		mc.lineTo(-w/2,h/2);
		mc.lineTo(-w/2,-h/2);
	}
}

//set tint to an image
function setTint(mc)
{
	var transformer:Transform = new Transform(mc);
	var colorTransformer:ColorTransform = transformer.colorTransform;
	colorTransformer.redMultiplier =mc.tint;
	colorTransformer.greenMultiplier = mc.tint;
	colorTransformer.blueMultiplier = mc.tint;
	transformer.colorTransform = colorTransformer;
}

//add properties to a movieclip after loading an image
function addProperties(mc2)
{
	removeMovieClip(inst.tooltip);
	var mc=mc2._parent;
	if (forceImagesWidth!="none" && forceImagesHeight!="none")
	{
		if (mc.obiect[2]!="none" && mc.obiect[3]!="none")
		{
			mc2._width=mc.obiect[2];
			mc2._height=mc.obiect[3];
		}
		else
		{
			mc2._width=forceImagesWidth;
			mc2._height=forceImagesHeight;
		}
	}
	mc.al=0;
	mc.tint=1;
	mc.des=1;
	mc.fW=mc2._width;
	mc.fH=mc2._height;
	mc2._x=-mc2._width/2;
	mc2._y=-mc2._height/2;
	mc2.forceSmoothing=true;
	if (inst.enableToolTip)
	{
	if (inst.tooltipPosition==4)
	{
		if (inst.tooltip.length==undefined)
		{
			inst.tooltip=inst.attachMovie("mcToolTip"+inst.tooltipType,"tooltip",inst.getNextHighestDepth());
			inst.tooltip._alpha=0;
		}
	}
	else
	{
		addToolTip(mc);
	}
	}
	var trg=mc.obiect[4];
	var url=mc.obiect[5];
	vR=mc.vR;
	mc.initSc=0;
	mc.pos=vR;
	vector_point(vR,mc);
	mc.trg=trg;
	mc.url=url;
	mc.filt=[];
	mc.filt.push(new BlurFilter(0, 0, 0));
	if (enLine) mc.link=addLine(mc.id);
	//point events:
	mc.onRoll=function()
	{
		this.onEnterFrame=function()
		{
			this.ro=true;
			this.initSc+=zoomSpeedOnHover;
			if (this.initSc>=zoomSizeOnHover) 
			{
				this.initSc=zoomSizeOnHover;
				delete this.onEnterFrame;
			}
			if (!tooltipAlwaysVisible)
			{
				this.tooltip._alpha+=10;
				if (this.tooltip._alpha>=100)
				{
					this.tooltip._alpha==100;
				}
			}
		}
	}
	mc.onOut=function(cum)
	{
		this.onEnterFrame=function()
		{
			if (inst.brightenMaxOnMouseOver!=0)
			{
			this.tint-=inst.brightenSpeedOnMouseOver/100;
			if (this.tint<=1)
			{
				this.tint=1;
			}
			setTint(this);
			}
		if (!tooltipAlwaysVisible)
			{
				this.tooltip._alpha-=50;
				if (this.tooltip._alpha<=0)
				{
					this.tooltip._alpha=0;
				}
			}
			this.initSc-=zoomSpeedOnHover;
			if (this.initSc<=0) 
			{
				this.ro=false;
				this.initSc=0;
				delete this.onEnterFrame;
			}
			if (cum)
			{
				this._xscale=this.sc+this.initSc;
				this._yscale=this.sc+this.initSc;
			}
			
		}
	}
	mc.onClick=function()
	{
		doOnClick(this);
	}
	mc.onROut=function()
	{
		
		this.onROut();
	}
	refOne(mc);
	if (mc.id==inst.nrPoints)
	{
		allLoaded();
	}
}

//add a line
function addLine(cat)
{
	var mc2=child2.attachMovie(child2.sonAv+lineType,"element"+cat,child2.getNextHighestDepth());
	mc2.cacheAsBitmap=true;
	if (enLineCol)
	{
		new Color(mc2).setRGB(lineColor); 
	}
	mc2.filt=[];
	mc2.filt.push(new BlurFilter(0, 0, 0));
	return mc2;
}

//add one point with specific text and make all events rollOver rollOut onPress...
function addPoint(vR,obj,cum)
{
	nrPoints++;
	if (obj[0]==undefined)
	{
		if (inst.selMax==0) 
		{
			inst.selMax=nrPoints-1;
		}
		var care=rnd(1,inst.selMax);
		obj=inst.elemNeeded[care-1]
	}
	var mc=child1.attachMovie(child1.sonAv,"element"+nrPoints,child1.getNextHighestDepth());
	mc.obiect=obj;
	mc.id=nrPoints;
	mc.vR=vR;
	addImage(mc.holder,obj[0]);
}
	
//refresh one point position,scale and everything
function refOne(mc)
{
	mc.pos=gaseste_vector_lungime(orig.pos,mc.pos,radius);
	mc.pos=roteste_x(mc.pos,orig.pos,rotX);
	mc.pos=roteste_y(mc.pos,orig.pos,rotY);
	focalLength=-1000;
	scaleRatio=1;
	var scaleRatio = focalLength/(focalLength + mc.pos.z);
	pointIn2DX = mc.pos.x * scaleRatio;
	pointIn2DY = mc.pos.y * scaleRatio;
	mc._x=pointIn2DX;
	mc._y=pointIn2DY;
	mc.dist=distanta(orig.sc,mc.pos);
	
	var max=radius*2;
	mc.sc=minMaxInterval(0,maxScale,max,minScale,mc.dist);
	var limit=(limitProc/100)*radius;
	var plus=1+plusProc/10;
	var plusAlpha=alphaDistance/100;
	var hov=(hovEffect/100)*radius;
	
	if (mc.dist>=hov) 
	{
		mc.enabled=false;
		mc.col=false;
		
	}
	else
	{
		mc.enabled=true;
		mc.col=mc.hitTest(_root._xmouse,_root._ymouse);
		if (mc.col && isSel=="")
		{
			isSel=mc;
			isSel2=mc;
			if (hoverZone.isOut) isSel="";
			mc.onRoll();
		}
		else
		{
			
		}
	}
	
	
	if (isSel!=mc)
	{
		
		mc.onOut();
	}
	
	if (mc.dist<=limit) 
	{
		var min=minMaxInterval(0,maxScale,max,minScale,limit);
		mc.sc=minMaxInterval(0,maxScale*plus,limit,min,mc.dist);
	}
	mc._xscale=mc.sc+mc.initSc;
	mc._yscale=mc.sc+mc.initSc;
	drawBorder(mc,mc.fW,mc.fH,normalStrokeSize,normalStrokeColor);
	mc.sw=minMaxInterval(0,nrPcte,radius,0,mc.sc);
	mc.swapDepths(Math.round(mc.sw*10000));
	var mcFil=minMaxInterval(0,maxBlur,max,minBlur,mc.dist);
	if (mcFil!=0)
	{
		mc.filt[0].blurX=mcFil;
		mc.filt[0].blurY=mcFil
		mc.filt[0].quality=quality;
		mc.filters =mc.filt;
	}
	else
	{
//		mc.filters =null;
	}
	var mcFil2=minMaxInterval(0,maxBlurRay,max,minBlurRay,mc.dist);
	if (mcFil2!=0)
	{
		mc.link.filt[0].blurX=mcFil2;
		mc.link.filt[0].blurY=mcFil2;
		mc.link.filt[0].quality=quality;
		mc.link.filters=mc.link.filt;
	}
	else
	{
//		mc.link.filters =null;
	}
	mc._alpha=minMaxInterval(0,maxAlpha,max*plusAlpha,minAlpha,mc.dist)-mc.al;
	if (mc._alpha<=0) mc._alpha=0;
	if (mc._alpha>=100) mc._alpha=100;
	if (mc.dist<=limit) 
	{
		var min=minMaxInterval(0,maxAlpha,max*plusAlpha,minAlpha,limit);
		mc._alpha=minMaxInterval(0,maxAlpha*plus,limit,min,mc.dist);
	}
	
	mc.link.sc=minMaxInterval(0,maxScaleRay,max,minScaleRay,mc.dist);
	if (mc.dist<=limit) 
	{
		var min=minMaxInterval(0,maxScaleRay,max,minScaleRay,limit);
		mc.link.sc=minMaxInterval(0,maxScaleRay*plus,limit,min,mc.dist);
	}
	mc.link.maska._yscale=mc.link.sc;
	mc.link._alpha=minMaxInterval(0,maxAlphaRay,max*plusAlpha,minAlphaRay,mc.dist)-mc.al;
	if (mc.dist<=limit) 
	{
		var min=minMaxInterval(0,maxAlphaRay,max*plusAlpha,minAlphaRay,limit);
		mc.link._alpha=minMaxInterval(0,maxAlphaRay*plus,limit,min,mc.dist);
	}
	mc.scris._x=-mc.scris._width/2;
	mc.scris._y=-mc.scris._height/2;
	
	if (mc._alpha>=100) mc._alpha=100;
	if (mc.link._alpha>=100) mc.link._alpha=100;
	rotateLine(mc.link,orig.pos,point_vector(mc));
}
	
//function remove all elements
function removeAll()
{
	for (var i=1;i<=nrPoints;i++)
	{
		var mc=child1["element"+i];
		removeMovieClip(mc);
		var mc=child2["element"+i];
		removeMovieClip(mc);
	}
	nrPoints=0;
}
	
//return angle between 2 points	
function angleBetween(p1,p2)
{
	var mc1=child1["element"+p1];
	var mc2=child1["element"+p2];
	var u=unghi(mc1.pos,mc2.pos);
}
	
//refresh all points
function refresh(sh)
{
	isSel="";
	hoverZone._width=radius*procRadZone/50;
	hoverZone._height=radius*procRadZone/50;
	if (inst.canSee) hoverZone._alpha=50;
	else hoverZone._alpha=0;
	orig._visible=enGuide;
	orig.sc=egal(orig.pos);orig.sc.z-=radius;
	orig._width=radius*2;
	orig._height=radius*2;
	for (var i=1;i<=nrPoints;i++)
	{
		var mc=child1["element"+i];
		if (mc!=undefined)
		{
			refOne(mc);
			if (sh)
			{
				mc.link.gotoAndStop(lineType);
				if (enLineCol)
				{
					new Color(mc.link).setRGB(lineColor); 
				}
				else
				{
					new Color(mc.link).setTransform({ra:100, rb:0, ga:100, gb:0, ba:100, bb:0});
				}
			}
		}
	}
	
	for (var i=1;i<=nrPoints;i++)
	{
		var mc=child1["element"+i];
		var desMin=1-inst.desaturateMaxOnMouseOver/10;
		var minAl=inst.alphaMaxOnMouseOver;
		if (isSel!="")
		{
			if (mc!=isSel)
			{
				mc.des-=inst.desaturateSpeedOnMouseOver/100;
				if (mc.des<=desMin) mc.des=desMin;
				mc.filt[1]=Desaturate(mc,mc.des);
				mc.filters =mc.filt;
				var spA=minMaxInterval(0,0,100,100,inst.alphaSpeedOnMouseOver)
				mc.al+=spA;
				if (mc.al>=minAl) mc.al=minAl;
			}
		}
		if (isSel=="" || mc==isSel)
		{
			mc.des+=inst.desaturateSpeedOnMouseOver/100;
			if (mc.des>=1) mc.des=1;
			mc.filt[1]=Desaturate(mc,mc.des);
			mc.filters=mc.filt;
			var spA=minMaxInterval(0,0,100,100,inst.alphaSpeedOnMouseOver)
			mc.al-=spA;
			if (mc.al<=0) mc.al=0;
		}
	}
	
	
	hoverZone.useHandCursor=true;
	hoverZone.onPress=function()
	{
		this.pressed=true;
		if (isSel!="" && isSel.trg!="none")
		{
			isSel.onClick();
		}
	}
	hoverZone.onRelease=hoverZone.onReleaseOutside=function()
	{
		this.pressed=false;
	}
	if (isSel=="")
	{
		inst.tooltip._alpha-=100;
		if (inst.tooltip._alpha<=0)
		{
			inst.tooltip._alpha=0;
		}
		hoverZone.useHandCursor=false;
		
	}
	else
	{
		if (brightenMaxOnMouseOver!=0)
		{
			isSel.tint+=inst.brightenSpeedOnMouseOver/100;
			if (isSel.tint>=inst.brightenMaxOnMouseOver/5)
			{
				isSel.tint=inst.brightenMaxOnMouseOver/5;
			}
			setTint(isSel);
		}
		if (hoverStrokeColor!="none" && hoverStrokeSize!="0")
		{
			drawBorder(isSel,isSel.fW,isSel.fH,hoverStrokeSize,hoverStrokeColor);
		}
		inst.tooltip.scris.text=isSel.obiect[1];
		inst.tooltip.scris.autoSize=true;
		inst.tooltip.bgr._width=inst.tooltip.scris._width+ttDepX*2;
		inst.tooltip.bgr._x=-inst.tooltip.bgr._width/2;
		inst.tooltip.scris._x=-inst.tooltip.bgr._width/2+ttDepX;
		inst.tooltip.bgr._y=-inst.tooltip.bgr._height/2;
		inst.tooltip.scris._y=-inst.tooltip.bgr._height/2;
		inst.tooltip._x=_xmouse;
		inst.tooltip.sageata._x=-inst.tooltip.sageata._width/2;
		if (ttOffsY>=0)
		{
			inst.tooltip.sageata._yscale=-100;
			inst.tooltip.sageata._y=-inst.tooltip.bgr._height/2+0.5;
			inst.tooltip._y=_ymouse+inst.tooltip.bgr._height/2+inst.tooltip.sageata._height+ttOffsY;
		}
		else
		{
			inst.tooltip.sageata._y=inst.tooltip.bgr._height/2;
			inst.tooltip.sageata._yscale=100;
			inst.tooltip._y=_ymouse-inst.tooltip.bgr._height/2-inst.tooltip.sageata._height+ttOffsY;
		}
		inst.tooltip._xscale=tooltipScale*4;
		inst.tooltip._yscale=tooltipScale*4;
		inst.tooltip._alpha+=10;
		if (inst.tooltip._alpha>=100)
		{
			inst.tooltip._alpha=100;
		}
		if (isSel.trg=="none")
		{
			
			hoverZone.useHandCursor=false;
		}
		if (isSel!="")
		{
			isSel.swapDepths(100000);
			isSel._alpha=100;
		}
	}
	if (stopRotOnHover) 
	{
		if(isSel!="") inst.paused=true;
		else inst.paused=false;
	}
	
	var mc=child1["element"+inst.nrPoints];
	if (hoverZone.isOut)
	{	
		if (!isSel2.ro)
		{
			delete hoverZone.onEnterFrame;
		}
	}
}

//redraw all rays
function genLines()
{
	if (enLine)
	{
		for (var i=1;i<=nrPoints;i++)
		{
			var mc=child1["element"+i];
			var mc2=child2["element"+i];
			removeMovieClip(mc2);
			mc.link=addLine(i);
		}
	refRaysCols();
	}
}

//detect if rays are on or off
function enableLines()
{
	if (enLine)
	{
		genLines();
	}
	else
	{
		for (var i=1;i<=nrPoints;i++)
		{
			var mc=child1["element"+i];
			var mc2=child2["element"+i];
			removeMovieClip(mc2);
		}
	}
	refRaysCols();
}

// refresh everything
function refRaysCols()
{
	refresh(true);
}

//when xml autorotate is on
function autoRotate()
{
	initHover();
	if (autoR==undefined) autoR=inst.createEmptyMovieClip("autoR",inst.getNextHighestDepth());
	delete autoR.onEnterFrame;
	if (enAutoRotate)
	{
		autoR.onEnterFrame=function()
		{
			if (!inst.paused)
			{
				rotX=autoRotX/factSpeed;
				rotY=autoRotY/factSpeed;
			}
			else
			{
				rotX=0;
				rotY=0;
			}
			refresh();
		}
	}
	else
	{
		refresh();
		delete autoR.onEnterFrame;
	}
}

//applyied after all settings are loaded
function allLoaded()
{
	spherePoints2=spherePoints;
	objectsLoaded=true;
	elements._alpha=0;
	delete preloader.onEnterFrame;
	autoRotate();
	inst.onEnterFrame=function()
	{
		orig._alpha+=5;
		if (enGuide)
		{
			orig._visible=true;
		}
		
		elements._alpha+=5;
		preloader._alpha-=5;
		if (preloader._alpha<=0)
		{
			preloader._alpha=0;
		}
		if (elements._alpha>=100)
		{
			preloader._alpha=0;
			preloader._visible=false;
			elements._alpha=100;
			delete inst.onEnterFrame;
		}
	}
	
}

//here program starts
initHover();
initAll();
refresh();