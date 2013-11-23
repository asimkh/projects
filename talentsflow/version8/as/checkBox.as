//checkbox programming functions
stop();

//initial values needed
this.gotoAndStop(2);
var parinteVar="";
var varAccess="";
var parinteFunc="";

//refresh variables on click
function refreshVar()
{
	for (var i=1;i<=parinteVar.length;i++)
	{
		var mc=eval(parinteVar[i-1]);
		var semn=varAccess[i-1].substr(0,1);
		
		if (semn!="!")
		{
			if (this._currentframe==2) mc[varAccess[i-1]]=false;
			else mc[varAccess[i-1]]=true;
		}
		else
		{
			var mcVar=varAccess[i-1].substr(1,varAccess[i-1].length);
			if (this._currentframe==2) mc[mcVar]=true;
			else mc[mcVar]=false;
		}
		
		mc[parinteFunc[i-1]]();
	}
}

//on click event
this.onPress=function()
{
	this.pressed=!this.pressed;
	if (this.pressed)
	{
		this.gotoAndStop(3);
	}
	else
	{
		this.gotoAndStop(2);
	}
	refreshVar();
}

//initial loading
function init(how,pr,vr,pf)
{
	parinteVar=pr;
	varAccess=vr;
	parinteFunc=pf;
	this.pressed=false;
	this.gotoAndStop(2);
	if (how) 
	{
		this.gotoAndStop(3);
		this.pressed=true;
	}
	refreshVar();
}
