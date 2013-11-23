//math functions needed
//minimum between 2 numbers
function us_min(_a,_b) { if (_a<=_b) return _a;else return _b;}

//maximum between 2 numbers
function us_max(_a,_b) { if (_a>=_b) return _a;else return _b;}

//a random number
function rnd(_min,_max){var nr:Number=Math.floor(Math.floor(Math.random() * (_max - _min + 1)) + _min);return nr;}

// make a vector object from 3 vars
function vector(_px,_py,_pz){var v=new Object();v.x=_px;v.y=_py;v.z=_pz;return v;}

//make a vector from 2 vars
function mcVector(_px,_py){var v=new Object();v._x=_px;v._y=_py;return v;}

//conevert movieclip position to vector
function point_vector(_p){var v=new Object();v.x=_p._x;v.y=_p._y;v.z=0;return v;}

//convert vector to movieclip position
function vector_point(_v,_p){_p._x=_v.x;_p._y=_v.y;}

//round a number to x number of decimals
function zecimale(number:Number,precision):Number
{
    var correction:Number = Math.pow(10, precision);
    return Math.round(correction * number) / correction;
}

//return radians from degree
function radiani(_angle){return _angle*Math.PI/180;}

//return degree from radians
function grade(_angle){return _angle*180/Math.PI;}

//add 2 vectors
function suma(_v1,_v2){var v=new Object();v.x=_v1.x+_v2.x;v.y=_v1.y+_v2.y;v.z=_v1.z+_v2.z;return v;}

//substract 2 vectors
function diferenta(_v1,_v2){var v=new Object();v.x=_v2.x-_v1.x;v.y=_v2.y-_v1.y;v.z=_v2.z-_v1.z;return v;}

//length of a vector
function modul(_v1){return Math.sqrt(Math.pow(_v1.x,2)+Math.pow(_v1.y,2)+Math.pow(_v1.z,2));}

//angle between 2 vectors with sign
function unghi(_v1,_v2)
{
	m1=modul(_v1);
	m2=modul(_v2);
	if (m1==0) m1=1;
	if (m2==0) m2=1;
	var semn=1;sadse
	var dp=dot_product(_v1,_v2)/(m1*m2);
	if (_v1.y<_v2.y) semn=-1;
	var rez=zecimale(grade(Math.acos(dp)),2)*semn;
	return rez;
}

//angle between 2 vectors without sign
function unghi2(_v1,_v2)
{
	m1=modul(_v1);
	m2=modul(_v2);
	if (m1==0) m1=1;
	if (m2==0) m2=1;
	var semn=1;
	var dp=dot_product(_v1,_v2)/(m1*m2);
	if (_v1.y<_v2.y) semn=-1;
	var rez=zecimale(grade(Math.acos(dp)),2)*semn;
	
	if (rez<0) rez=360-Math.abs(rez);
	return rez;
}

//return null vector
function null_vector(_v){_v.x=0;_v.y=0;_v.z=0;}

//return distance between 2 vectors
function distanta(_v1,_v2)
{
	var di=Math.sqrt(Math.pow(_v2.y-_v1.y,2)+Math.pow(_v2.x-_v1.x,2)+Math.pow(_v2.z-_v1.z,2));
	
	if (_v1.x==_v2.x and _v1.y==_v2.y and _v1.z==_v2.z) di =0;
	return di;
}

//normalize a vector
function normalize(_v1){if (_v1.x==0 and _v1.y==0 and _v1.z==0) return vector(0,0,0);else {var v=multiplica(_v1,1/modul(_v1));return v;}}

//dot product of 2 vectors
function dot_product(_v1,_v2)
{
	var rez=_v1.x*_v2.x+_v1.y*_v2.y+_v1.z*_v2.z;
	return rez;
}

//cross produce of 2 vectors
function cross_product(_v1,_v2)
{
	var v=vector((_v1.y * _v2.z) - (_v1.z * _v2.y),(_v1.z * _v2.x) - (_v1.x * _v2.z),(_v1.x * _v2.y) - (_v1.y * _v2.x));
	return v;
	}

//	add a value to a vector
function aduna_scalar(_v1,_val){var v=new Object();v.x=_v1.x+val;v.y=_v1.y+val;v.z=_v1.z+val;return v;}

// substract a value from a vector
function scade_scalar(_v1,_val){var v=new Object();v.x=_v1.x-val;v.y=_v1.y-val;v.z=_v1.z-val;return v;}

//multiply a value to a vector
function multiplica(_v1,_val){var v=new Object();v.x=_v1.x*_val;v.y=_v1.y*_val;v.z=_v1.z*_val;return v;}

//compare 2 vectors lengths
function compara(_v1,_v2){if (modul(_v1)>modul(_v2)) return 1;if (modul(_v1)<modul(_v2)) return 2;if (modul(_v1)==modul(_v2)) return 0;}

//compare 2 vectors components
function compara_comp(_v1,_v2){if (_v1.x==_v2.x and _v1.y==_v2.y) return true;else return false;}

//make a vector from another one
function egal(_v1){return vector(_v1.x,_v1.y,_v1.z);}

//find a position betwwen 2 vectors return in procent
function gaseste_vector(_v1,_v2,_d){var v=suma(_v1,multiplica(diferenta(_v1,_v2),_d));return v;}

//find a position between 2 vectors return a distance value
function gaseste_vector_lungime(_v1,_v2,_l){var v1=diferenta(_v1,_v2);var d=_l/modul(v1);var v=suma(_v1,multiplica(v1,d));return v;}

//angle defined be 3 points with sign
function unghi_laturi(_a,_b,_c)
{
	var v1=diferenta(_b,_a);
	var v2=diferenta(_b,_c);
	return unghi(v1,v2);
}

//angle defined by 3 points without sign
function unghi_laturi2(_a,_b,_c)
{
	var v1=diferenta(_b,_a);
	var v2=diferenta(_b,_c);
	return unghi2(v1,v2);
}

//angle defined be 2 points
function panta(v1,v2)
{
	var v3=vector(v2.x+1,v2.y,v2.z);
	var v=unghi_laturi(v1,v2,v3);
	return v;
}

//return components of a vector
function debug(_v)
{
	trace("x="+_v.x+" y="+_v.y+" z="+_v.z);
}

//y axis rotation
function roteste_y(_v1,_vo,_grd)
{
	var x,y,z;
	var sin=Math.sin(radiani(_grd));
	var cos=Math.cos(radiani(_grd));
	var vd=new Object();
	var vo=vector(_vo.x,_vo.y,_vo.z);
	var v1=vector(_v1.x,_v1.y,_v1.z);
	var vd=diferenta(vo,v1);
	y=vd.y;
	x=vd.z*sin+vd.x*cos;
	z=vd.z*cos-vd.x*sin;
	var v=suma(vo,vector(x,y,z));
	return v;
}

//x axis rotation
function roteste_x(_v1,_vo,_grd)
{
	var x,y,z;
	var sin=Math.sin(radiani(_grd));
	var cos=Math.cos(radiani(_grd));
	var vd=new Object();
	var vo=vector(_vo.x,_vo.y,_vo.z);
	var v1=vector(_v1.x,_v1.y,_v1.z);
	var vd=diferenta(vo,v1);
	x=vd.x;
	y=vd.y*cos-vd.z*sin;
	z=vd.y*sin+vd.z*cos;
	var v=suma(vo,vector(x,y,z));
	return v;
}


//z axis rotation
function roteste_z(_v1,_vo,_grd)
{
	var x,y,z;
	var sin=Math.sin(radiani(_grd));
	var cos=Math.cos(radiani(_grd));
	var vd=new Object();
	var vo=vector(_vo.x,_vo.y,_vo.z);
	var v1=vector(_v1.x,_v1.y,_v1.z);
	var vd=diferenta(vo,v1);
	z=vd.z;
	x=vd.x*cos-vd.y*sin;
	y=vd.x*sin+vd.y*cos;
	var v=suma(vo,vector(x,y,z));
	return v;
}

//rotate all of axis
function roteste_xyz(_v1,_vo,_axa)
{
	var v=roteste_y(_v1,_vo,_axa.y);
	v=roteste_x(v,_vo,_axa.x);
	return v;
}


//detect 3 points coliniarity
function coliniarity(a,b,c)
{
	var rez=false;
	var d1=zecimale(distanta(a,b)+distanta(b,c),0);
	var d2=zecimale(distanta(a,c),0);
	if (d1==d2) rez=true;
	return rez;
}


//detect if a point is in a circle
function pct_cerc(_p,_o,_r) {if (distanta(_p,_o)<=_r) return true;else return false}

//detect if a point is on a plane
function pct_plan(_p,_v1,_v2,_v3)
{
	var ok=false;
	var u1=coliniaritate(_v1,_p,_v2);
	var u2=coliniaritate(_v2,_p,_v3);
	var u3=coliniaritate(_v1,_p,_v3);
	
	
	if (compara_comp(_p,_v1) or compara_comp(_p,_v2) or compara_comp(_p,_v3)) ok=true;
	if (u1==0 or u1==1 or u1==2) ok=true;
	if (u2==0 or u2==1 or u2==2) ok=true;
	if (u3==0 or u3==1 or u3==2) ok=true;
	u1=unghi_laturi(_v1,_p,_v2);
	u2=unghi_laturi(_v2,_p,_v3);
	u3=unghi_laturi(_v1,_p,_v3);
	if (Math.round(u1+u2+u3)==360) ok=true;
	return ok;
}

//return position of 90 degree point over 2 points
function inaltime(_v3,_v1,_v2)
{
	var dist=distanta(_v1,_v2);z
	var u=((_v3.x-_v1.x)*(_v2.x-_v1.x)+(_v3.y-_v1.y)*(_v2.y-_v1.y)+(_v3.z-_v1.z)*(_v2.z-_v1.z))/(dist*dist);
	var x1=_v1.x+u*(_v2.x-_v1.x);
	var y1=_v1.y+u*(_v2.y-_v1.y);
	var z1=_v1.z+u*(_v2.z-_v1.z);
	return vector(x1,y1,z1);
}

//return position of a point with 90 degree
function ridicaInaltime(_v1,_v2,d1,h,tip)
{
	if (tip==undefined) var vPos=gaseste_vector_lungime(_v1,_v2,d1);
	else var vPos=gaseste_vector(_v1,_v2,d1);
	var vH=roteste_z(_v2,vPos,90);
	if (tip==undefined) vH=gaseste_vector_lungime(vPos,vH,h);
	else vH=gaseste_vector(vPos,vH,h);
	return vH
}

//return intersection between 2 lines
function pct_intersectie(_v1,_v2,_v3,_v4)
{
	var val1y=_v4.y-_v3.y;
	if (val1y==0) val1y=1;
	
	var val2y=_v2.y-_v1.y;
	if (val2y==0) val2y=1;
	
	var ua= ((_v4.x-_v3.x) *(_v1.y-_v3.y) - (_v4.y-_v3.y) *(_v1.x-_v3.x))/( val1y*(_v2.x-_v1.x) - (_v4.x-_v3.x) * val2y);
	var ub= ((_v2.x-_v1.x) *(_v1.y-_v3.y) - (_v2.y-_v1.y) *(_v1.x-_v3.x))/( val1y*(_v2.x-_v1.x) - (_v4.x-_v3.x) * val2y);
	var _v=vector(0,0,0);
	var vx=_v1.x+ua*(_v2.x-_v1.x);
	var vy=_v1.y+ua*(_v2.y-_v1.y);
	var vz=0;
	
	return vector(vx,vy,vz);
}


//draw a shape between 3 points
function deseneaza_fatza(_mc,_v1,_v2,_v3,_cul1,_cul2,_tr1,_tr2)
{
	_mc.lineStyle(1,_cul1,_tr1);
	_mc.beginFill(_cul2,_tr2);
	_mc.moveTo(_v1.x,_v1.y);
	_mc.lineTo(_v2.x,_v2.y);
	_mc.lineTo(_v3.x,_v3.y);
	_mc.lineTo(_v1.x,_v1.y);
	_mc.endFill();
}

//draw a shape with n points
function deseneaza_nPoints(_mc,_arr,_cul1,_cul2,_tr1,_tr2)
{
	_mc.lineStyle(2,_cul1,_tr1);
	_mc.beginFill(_cul2,_tr2);
	_mc.moveTo(_arr[0]._x,_arr[0]._y);
	var l=_arr.length-1;
	for (var i=1;i<=_arr.length-1;i++) _mc.lineTo(_arr[i]._x,_arr[i]._y);
	 _mc.lineTo(_arr[l]._x,_arr[l]._y);
	_mc.endFill();
}

//draw a line defined be 2 vectors
function deseneaza_linie(_s_mc,_v1,_v2,_col,_trsp,_gr)
{
	_s_mc.lineStyle(_gr, _col, _trsp);
	_s_mc.moveTo(_v1.x, _v1.y);
	_s_mc.lineTo(_v2.x, _v2.y);
}

//draw a line defined by 4 coordinates
function deseneaza_linie2(_s_mc,_x1,_y1,_x2,_y2,_col,_trsp,_gr)
{
	_s_mc.lineStyle(_gr, _col, _trsp);
	_s_mc.moveTo(_x1,_y1);
	_s_mc.lineTo(_x2,_y2);
}

//draw a line by rotation
function drawLine(_mc,p1,p2,_mc2)
{
	
	var v1=point_vector(p1);
	var v2=point_vector(p2);
	
	if (v1.x==undefined) v1=egal(p1);
	if (v2.x==undefined) v2=egal(p2);
	
	var vt=vector(v1.x+1,v1.y,v1.z);
	var d=distanta(v1,v2);
	var u=unghi_laturi(v2,v1,vt);
	vector_point(v1,_mc);
	_mc._rotation=0;
	if (_mc.maska_linie!=undefined) _mc.maska_linie._width=d;	
	_mc.maska_linie._width=d;
	if (d<20) _mc2._visible=false;
	else _mc2._visible=true;
	_mc2._x=d;
	_mc._rotation=u;
	
}


//bezier position of a function
BezierPosition = function(arr,t)
{
	
	t = Math.min(Math.max(t,0),1)
	var a = 3* (arr[1].x - arr[0].x)
	var b = 3* (arr[2].x - arr[1].x) - a
	var c = arr[3].x - arr[0].x -  a-b
	var px = c*Math.pow(t,3) + b*Math.pow(t,2) + a*Math.pow(t,1) + arr[0].x;
	if (isNaN(px))
	{
		px=arr[0].x;
	}
	
	
	var a = 3* (arr[1].y - arr[0].y)
	var b = 3* (arr[2].y - arr[1].y) - a
	var c = arr[3].y - arr[0].y -  a-b
	var py = c*Math.pow(t,3) + b*Math.pow(t,2) + a*Math.pow(t,1) + arr[0].y;
	if (isNaN(py))
	{
		py=arr[0].y;
	}
	
	var v=vector(px,py,0);
	
	
	return v;
}

// bezier angle of a function
BezierRotate=function(arr,t1,t2)
{
	var pos=BezierPosition(arr,t1);
	var vf=BezierPosition(arr,t2);
	var u=panta(vf,pos);
	return u;
}

//return a value betwwen 2 values defined by a 3'rd value
function procInterval(_mi,_ma,_pos)
{
	var pr=(_pos-_mi)/(_ma-_mi);
	if (_pos<=_mi) pr=0;
	if (_pos>=_ma) pr=1;
	return pr;
}

//return a value betwwen 2 values defined by a 3'rd value in procent
function calcProcInterval(_mi,_ma,_proc)
{
	var nr=(_ma+_mi)*_proc;
	if (_proc<=0) nr=_mi;
	if (_proc>=1) nr=_ma;
	return nr;
}

//calculate a position between 2 minimums and 2 maximus
function minMaxInterval(_mi1,_Ma1,_mi2,_Ma2,_pos)
{
	var pr=procInterval(_mi1,_mi2,_pos);
	var nr=_Ma1+(_Ma2-_Ma1)*pr;
	if (_pos<=_mi1) nr=_Ma1;
	if (_pos>=_mi2) nr=_Ma2;
	return nr
}

//bisect of an angle
function bisectoare(v1,v2,v3)
{
	var d1=distanta(v1,v2);
	var d2=distanta(v1,v3);
	var d3=distanta(v2,v3);
	var rap1=d1/d2;
	var d32=d3/(rap1+1);
	v4=gaseste_vector_lungime(v3,v2,d32);
	return v4;
}

//median of 3 points
function mediana(v1,v2,v3)
{
	return gaseste_vector(v2,v3,0.5);
}

//return Ax+B=0 from 2 points
function lineCoordToAB(a,b)
{
	var A=(a.y-b.y)/(a.x-b.x);
	if (a.x==b.x) A=(a.y-b.y);
	var B=a.y-a.x*A;
	return vector(A,B,0);
}

//calculate intersection between 4 points
function line_line_intersection(a,b,c,d)
{
	var fct1=lineCoordToAB(a,b);
	var A1=fct1.x;
	var B1=fct1.y;
	var fct2=lineCoordToAB(c,d);
	var A2=fct2.x;
	var B2=fct2.y;
	var x=(B2-B1)/(A1-A2);
	if (A1==A2) x=B2-B1;
	var y=A1*x+B1;
	return vector(x,y,0);
}

//calculate intersection between 2 points and a plane
function line_plane_intersection(a,b,c,d,e,f)
{
	var v1=line_line_intersection(a,b,c,d);
	var c1=coliniarity(c,v1,d);
	var d1=distanta(a,v1);
	var v2=line_line_intersection(a,b,d,e);
	var c2=coliniarity(d,v2,e);
	var d2=distanta(a,v2);
	var v3=line_line_intersection(a,b,e,f);
	var c3=coliniarity(e,v3,f);
	var d3=distanta(a,v3);
	var v4=line_line_intersection(a,b,f,c);
	var c4=coliniarity(f,v4,c);
	var d4=distanta(a,v4);
	var buf=[];
	buf[0]=v1;
	buf[1]=v2;
	buf[2]=v3;
	buf[3]=v4;
	if (!c1) buf[0]="";
	if (!c2) buf[1]="";
	if (!c3) buf[2]="";
	if (!c4) buf[3]="";
	
	var dMin=distanta(a,b);
	var rez=1;
	for (var i=1;i<=buf.length;i++)
	{
		if (buf[i-1]!="")
		{
			var dis=eval("d"+i);
			if (dis<dMin) 
			{
				dMin=dis;
				rez=i;
			}
		}
	}
	return eval("v"+rez);
}
