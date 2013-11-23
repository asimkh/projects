//align the component top left and prepare for beeing resized without flash editor
stop();
Stage.align="TL";
Stage.scaleMode="noScale";

//retrieve swf's path and checking is xml path is defined from outside
this.elementsPath=String(_url).split("/");
this.elementsPath.pop()
this.elementsPath=this.elementsPath.join("/")+"/";
this.pathFile=_url.substr(_url.indexOf('pathFile'),_url.length).split('=')[1];


//reload component with path config file
function loadSettings(path)
{
	this.pathFile2=path;
	gotoAndStop(1);
}

//if not xml path is defined switch to default xml path
if (this.pathFile==undefined || this.pathFile2=="") 
{
	//trace(this.pathFile +","+this.pathFile2)
	this.pathFile=this.elementsPath+"settings_tf.xml";
	
	if (this.pathFile2!=undefined && this.pathFile2!="") this.pathFile=this.elementsPath+this.pathFile2;
}
else
{
	
	this.elementsPath=String(_url).split("?")[0];
	this.elementsPath=String(this.elementsPath).split("/");
	this.elementsPath.pop()
	this.elementsPath=this.elementsPath.join("/")+"/";
	this.pathFile=this.elementsPath+this.pathFile;
}

//variables needed for this component for read0ing XML
var inst=this;
var varNeeded=["spherePoints","style","radius"
			   ,"foreScale","backScale","foreAlpha","backAlpha","foreBlur","backBlur"
			   ,"foreScaleRay","backScaleRay","foreAlphaRay","backAlphaRay","foreBlurRay","backBlurRay"
			   ,"underDistance","multiplyEffects","alphaAreaEffect"
			   ,"enableRay","rayType","enableRayColor","rayColor"
			   ,"hoverAreaEffect","zoomSizeOnHover","zoomSpeedOnHover","blurQuality"
			   ,"enableSphereGuide","rotateSpeed"
			   ,"autoRotate","autoRotateSpeedX","autoRotateSpeedY"
			   ,"stopRotatingOnHover","backgroundHoverArea"
			   ,"forceImagesWidth","forceImagesHeight","enableToolTip"
			   ,"tooltipType","tooltipPosition","tooltipAlwaysVisible","tooltipOffsY","tooltipScale"
			   ,"normalStrokeColor","normalStrokeSize","hoverStrokeColor","hoverStrokeSize"
			   ,"brightenMaxOnMouseOver","brightenSpeedOnMouseOver","desaturateMaxOnMouseOver","desaturateSpeedOnMouseOver","alphaMaxOnMouseOver","alphaSpeedOnMouseOver"
			   ];
var valNeeded=[];
var valNeeded2=[];
var elemNeeded=[];

//static variables
inst._xscale=100;
inst._yscale=100;
orig._visible=false;


//convert a text from a CDATA xml
function cData(val)
{
	var ret=val.split("'").join('"');
	ret.split("p");
	ret=ret.split('&lt;').join('<').split('&gt;').join(">").split('&quot;').join('"');
	ret=ret.split("&apos;").join("'");
	return ret;				
}


//the settings are loaded from xml
function loadSettingsFromXml()
{
	preloader._alpha=0;
	preloader._visible=true;
	preloader.onEnterFrame=function()
	{
		this._alpha+=5;
		if (this._alpha>=100)
		{
			this._alpha=100;
			delete this.onEnterFrame;
		}
	}
	var path=this.pathFile;
	var myXML:XML = new XML();
	myXML.ignoreWhite=true;
	myXML.load(path);
	myXML.onLoad = function(success) 
	{
		if (success) 
		{
			var node1="";
			var node2="";
			var node3="";
			for (var i=1;i<=myXML.childNodes.length;i++)
			{
				var node=myXML.childNodes[i-1];
				if (node.nodeName=="component") node1=node;
				if (node.nodeName=="elements") node2=node;
				if (node.nodeName=="aligment") node3=node;
			}
			
			if (node3!=undefined)
			{
				valNeeded2[0]=node3.attributes["position"];
				valNeeded2[1]=Number(node3.attributes["offsetX"]);
				valNeeded2[2]=Number(node3.attributes["offsetY"]);
			}

			for (var i=1;i<=inst.varNeeded.length;i++)
			{
				var val=node1.attributes[inst.varNeeded[i-1]];
				if (isNaN(Number(val)))	inst.valNeeded[i-1]=val;
				else 
				{
					var def1=val.substr(0,1)+val.substr(1,1);
					if (def1!="0x")	inst.valNeeded[i-1]=Number(val);
					else inst.valNeeded[i-1]=val;
				}
				
			}
			var listItems=node2.childNodes;
			for (var i=1;i<=listItems.length;i++)
			{
				var node=listItems[i-1];
				inst.elemNeeded[i-1]=[];
				var len=node.childNodes.length;
				for (var j=1;j<=len;j++)
				{
					inst.elemNeeded[i-1][j-1]=cData(String(node.childNodes[j-1].childNodes));
				}
			}
			//after loading xml variables go to frame 2 for displaying component
			inst.gotoAndStop(2);
		}
		else
		{
			
		}
	}
}
//starts loading from xml
loadSettingsFromXml();