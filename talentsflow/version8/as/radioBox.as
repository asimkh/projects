//initial values needed
stop();
this.gotoAndStop(2);
var parinte="";
var parinteVar="";
var varAccess="";
var parinteFunc="";
var sel=0;
var selRoll=0;
var parinteRollOver="";
var parinteRollOut="";

//refresh variables on click
function refreshVar()
{
	if (parinteVar!=undefined)
	{
		for (var i=1;i<=parinteVar.length;i++)
		{
			var mc=eval(parinteVar[i-1]);
			if (mc[varAccess[i-1]].length!=0)
			{
				mc[varAccess[i-1]]=sel;
			}
			if (parinteFunc.length!=0)
			{
				
				mc[parinteFunc](sel);
			}
		}
	}
	
}

//on roll over event
this.onRollOver=function()
{
	var mc=eval(parinteVar);
	if (this._totalframes>3)
	this.gotoAndStop(4);
	selRoll=0;
	for (var i=1;i<=parinte.length-1;i++)
	{
		if (parinte[i]==this)
		{
			selRoll=i;
		}
	}
	mc[parinteRollOver](selRoll);
}

//on roll out event
this.onRollOut=function()
{
	selRoll=0;
	this.gotoAndStop(2);
	var mc=eval(parinteVar);
	mc[parinteRollOut](selRoll);
}

//function when user click the element
function doPress(mc,cum)
{
	clearAll(mc);
	if (mc.pressed)
	{
		mc.gotoAndStop(3);
	}
	else
	{
		mc.gotoAndStop(2);
	}
	if (!cum) refreshVar();
	selRoll=0;
	var mc=eval(parinteVar);
	mc[parinteRollOut](selRoll);


}

// on click event
this.onPress=function()
{
	doPress(this);
}

// remove all setings
function clearAll(mc)
{
	for (var i=1;i<=parinte.length-1;i++)
	{
		parinte[i].enabled=true;
		parinte[i].pressed=false;
		parinte[i].gotoAndStop(2);
		if (parinte[i]==this)
		{
			sel=i;
		}
	}
	mc.pressed=true;
	mc.enabled=false;
	
}

//initial loading
function init(how,parinte,pr,vr,pf,prr,pro)
{
	parinteVar=pr;
	varAccess=vr;
	
	parinteFunc=pf;
	parinteRollOver=prr;
	parinteRollOut=pro;

	this.pressed=false;
	if (how) 
	{
		clearAll(this)
		this.pressed=true;
		this.gotoAndStop(3);
		refreshVar();
	}
	this.parinte=parinte;
	
}