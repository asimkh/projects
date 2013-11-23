//on click user function

//need external interface
import flash.external.*;

//if target=action in xml
function onClickForFlash(mc)
{
	var arr=mc.url.split(";");
	for (var i=1;i<=arr.length;i++)
	{
		var cmd=arr[i-1].split(",");
		var _mc=eval(cmd[0]);
		var func=cmd[1];
		var par1=cmd[2];
		var par2=cmd[3];
		var par3=cmd[4];
		var par4=cmd[5];
		var par5=cmd[6];
		_mc[func](par1,par2,par3,par4,par5);
	}
}

//if target=javascript in xml
function onClickForJavaScript(mc)
{
	var arr=mc.url.split(";");
	for (var i=1;i<=arr.length;i++)
	{
		var cmd=arr[i-1].split(",");
		var func=cmd[0];
		var par1=cmd[1];
		var par2=cmd[2];
		var par3=cmd[3];
		var par4=cmd[4];
		var par5=cmd[5];
		ExternalInterface.call(func,par1,par2,par3,par4,par5);
	}
}


//is user click on item
function doOnClick(mc)
{
	if (mc.trg!="action" && mc.trg!="javaScript")
	{
		getURL(mc.url,mc.trg);
	}
	if (mc.trg=="action")
	{
		onClickForFlash(mc);
	}
	if (mc.trg=="javaScript")
	{
		onClickForJavaScript(mc);
	}
}