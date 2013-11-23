stop();
#include "resize.as"

//initial values for component
var inst=this;
inst._visible=false;
var parinte=inst.der;
var comp=_root.component;
var panelPos=0;
var maxPanelPos=0;

//initialise radio groups buttons
function initRadioGroup(arr,pr,vr,pf)
{
	for (var i=1;i<=arr.length-1;i++)
	{
		arr[i].init(false,arr,pr,vr,pf);
	}
	arr[arr[0]].init(true,arr,pr,vr,pf);
}

//function different configuration
function loadSettings(par)
{
	par=par-1;
	comp.pathFile2="";
	if (par!=0)
	{
		comp.pathFile2="config/config"+par+".xml";
	}
	comp.gotoAndStop(1);
}

//event if user click on vertical panel slider
function sliderPress(a)
{
	panelPos=a;
	if (panelPos>=0) panelPos=0;
	if (panelPos<=-maxPanelPos) panelPos=-maxPanelPos;
	parinte._y=panelPos;
}


//resize slider width()
function initSlider()
{
	panelPos=0;
	maxPanelPos=parinte._height-maska._height+10;
	slider.init(0,maxPanelPos,0,this,"","sliderPress",-1);
}


//initalise GUI sistem
function initGUI()
{
	btnGen.onPress=function()
	{
		_root.xmlWindow.init();
	}
	
	//event for mouse wheel up down scrolling panel
	var mouseListener:Object = new Object();
	mouseListener.onMouseWheel = function(delta:Number) 
	{
		if (parinte._xmouse<=inst._width)
		{
			panelPos+=delta*20;
			slider.gotoPosition(-panelPos);
		}
	}
	Mouse.addListener(mouseListener);
	initSlider();
	initRadioGroup([-1,btnDef,cnf1,cnf2,cnf3,cnf4,cnf5,cnf6],[inst],"","loadSettings");

	parinte.sidPoints.init(2,7,comp.spherePoints,[comp],["spherePoints"],"initAll");
	parinte.sldStyle.init(2,10,comp.sphereType,[comp],["sphereType"],"initAll");
	parinte.sldRadius.init(1,300,comp.radius,[comp],["radius"],"refresh");
	parinte.sldXRot.init(-360,360,comp.rotX,[comp],["rotX"],"refresh");
	parinte.sldYRot.init(-360,360,comp.rotY,[comp],["rotY"],"refresh");
	parinte.sldRotSpeed.init(1,360,comp.rotSpeed,[comp],["rotSpeed"]);
	
	parinte.sldForeScale.init(0,300,comp.maxScale,[comp],["maxScale"],"refresh");
	parinte.sldBackScale.init(0,300,comp.minScale,[comp],["minScale"],"refresh");
	parinte.sldForeAlpha.init(0,100,comp.maxAlpha,[comp],["maxAlpha"],"refresh");
	parinte.sldBackAlpha.init(0,100,comp.minAlpha,[comp],["minAlpha"],"refresh");
	parinte.sldForeBlur.init(0,30,comp.maxBlur,[comp],["maxBlur"],"refresh");
	parinte.sldBackBlur.init(0,30,comp.minBlur,[comp],["minBlur"],"refresh");

	parinte.sldForeScaleRay.init(0,100,comp.maxScaleRay,[comp],["maxScaleRay"],"refresh");
	parinte.sldBackScaleRay.init(0,100,comp.minScaleRay,[comp],["minScaleRay"],"refresh");
	parinte.sldForeAlphaRay.init(0,100,comp.maxAlphaRay,[comp],["maxAlphaRay"],"refresh");
	parinte.sldBackAlphaRay.init(0,100,comp.minAlphaRay,[comp],["minAlphaRay"],"refresh");
	parinte.sldForeBlurRay.init(0,30,comp.maxBlurRay,[comp],["maxBlurRay"],"refresh");
	parinte.sldBackBlurRay.init(0,30,comp.minBlurRay,[comp],["minBlurRay"],"refresh");

	parinte.sldUnderDist.init(0,200,comp.limitProc,[comp],["limitProc"],"refresh");
	parinte.sldMultEff.init(0,20,comp.plusProc,[comp],["plusProc"],"refresh");
	parinte.sldAlphaDist.init(0,200,comp.alphaDistance,[comp],["alphaDistance"],"refresh");
	
	
	parinte.chkEnRay.init(comp.enLine,[comp],["enLine"],["enableLines"]);
	var maxLineTypes=3;
	parinte.sldRayType.init(1,4,comp.lineType,[comp],"lineType","genLines");
	
	parinte.chkEnRayCol.init(comp.enLineCol,[parinte.cpRayCol,comp,comp],["_visible","enLineCol",""],["","","refRaysCols"]);
	parinte.cpRayCol.init(comp.lineColor,[comp],"lineColor","refRaysCols");
	
	parinte.sldHovArea.init(0,200,comp.hovEffect,[comp],["hovEffect"],"refresh");
	parinte.sldHovZoom.init(0,500,comp.zoomSizeOnHover,[comp],["zoomSizeOnHover"]);
	parinte.sldHovSpeed.init(0,100,comp.zoomSpeedOnHover,[comp],["zoomSpeedOnHover"]);
	parinte.sldBlurQ.init(0,3,comp.quality,[comp],["quality"],"refresh");
	
	parinte.chSpG.init(comp.enGuide,[comp],["enGuide"],["refresh"]);
	
	parinte.chStopOnHover.init(comp.stopRotOnHover,[comp],["stopRotOnHover"]);
	parinte.sldBackArea.init(1,200,comp.procRadZone,[comp],["procRadZone"],"refresh");
	parinte.chShowHov.init(false,[comp],["canSee"],["refresh"]);
	
	parinte.chAuto.init(comp.enAutoRotate,[comp,parinte.mcAuto,parinte.mcRot],["enAutoRotate","_visible","!_visible"],["autoRotate"]);
	
	parinte.mcRot.sldRot.init(-85,85,comp.rotSpeed,[comp],["rotSpeed"]);
	
	parinte.mcAuto.sldAutoRotX.init(-85,85,comp.autoRotX,[comp],["autoRotX"]);
	parinte.mcAuto.sldAutoRotY.init(-85,85,comp.autoRotY,[comp],["autoRotY"]);
	
	parinte.sldNorSize.init(0,20,comp.normalStrokeSize,[comp],["normalStrokeSize"],"refresh");
	parinte.cpNorCol.init(comp.normalStrokeColor,[comp],"normalStrokeColor","refresh");
	parinte.sldHovSize.init(0,20,comp.hoverStrokeSize,[comp],["hoverStrokeSize"],"refresh");
	parinte.cpHovCol.init(comp.hoverStrokeColor,[comp],"hoverStrokeColor","refresh");
	
	
	parinte.sldBrIm.init(0,20,comp.brightenMaxOnMouseOver,[comp],["brightenMaxOnMouseOver"],"refresh");
	parinte.sldBrImSp.init(0,100,comp.brightenSpeedOnMouseOver,[comp],"brightenSpeedOnMouseOver","refresh");
	parinte.sldDes.init(0,10,comp.desaturateMaxOnMouseOver,[comp],["desaturateMaxOnMouseOver"],"refresh");
	parinte.sldDesSp.init(0,100,comp.desaturateSpeedOnMouseOver,[comp],"desaturateSpeedOnMouseOver","refresh");
	parinte.sldAl.init(0,100,comp.alphaMaxOnMouseOver,[comp],["alphaMaxOnMouseOver"],"refresh");
	parinte.sldAlSp.init(0,100,comp.alphaSpeedOnMouseOver,[comp],"alphaSpeedOnMouseOver","refresh");
	
	parinte.chShowTool.init(comp.enableToolTip,[parinte.mcTool,comp],["_visible","enableToolTip"],["","addAllTooltips"]);
	
	initRadioGroup([comp.tooltipType,parinte.mcTool.radT1,parinte.mcTool.radT2],[comp],["tooltipType"],"addAllTooltips");
	initRadioGroup([comp.tooltipPosition,parinte.mcTool.radPos1,parinte.mcTool.radPos2,parinte.mcTool.radPos3,parinte.mcTool.radPos4],[comp],["tooltipPosition"],"addAllTooltips");
	
	parinte.mcTool.chAllSh.init(comp.tooltipAlwaysVisible,[comp],["tooltipAlwaysVisible"],["addAllTooltips"]);
	parinte.mcTool.sldTOffY.init(-149,147,comp.ttOffsY,[comp],["ttOffsY"],["addAllTooltips"]);
	parinte.mcTool.sldTSc.init(1,100,comp.tooltipScale,[comp],["tooltipScale"],["addAllTooltips"]);
	inst._visible=true;
}

