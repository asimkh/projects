//programming functions for position of objects on resizing swf window

//initial values needed
var stageListener:Object = new Object();
var stageIWidth=Stage.width;
Stage.align="TL";
Stage.scaleMode = "noScale";
//resize event
stageListener.onResize = function() 
{
	doResize();
};
Stage.addListener(stageListener);

//when panel is loading do resize and delete loop
_root.panel.onEnterFrame=function()
{
	doResize();
	delete this.onEnterFrame;
}

//function called by resize
function doResize()
{
	_root.component._x=(Stage.width-_root.panel._width)/2+_root.panel._width;
	_root.component._y=Stage.height/2;
	var depX=stageIWidth-Stage.width;
	_root.panel.btnGen._y=Stage.height-_root.panel._y-_root.panel.btnGen._height;
	var val=_root.panel.btnGen._y+_root.panel.btnGen._height/2;
	_root.panel.slider.slider_length._height=val+2;
	_root.panel.maska._height=val;
	_root.panel.bg._height=Stage.height;
	var val2=(Stage.width+_root.panou._width)/2;
	initSlider();
	_root.xmlWindow._x=Stage.width/2;
	_root.xmlWindow._y=Stage.height/2;
}



