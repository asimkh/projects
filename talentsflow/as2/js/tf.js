
$( document ).ready(function() {
console.log("loading js");



//gallerydisplay();
 
});

	function gallerydisplay(id){
			 document.getElementById(id).style.display = 'block';
			 console.log("show div");
		}
		
	function gallerynone(id){
		 document.getElementById(id).style.display = 'none';
		 console.log("show div");
	}
	
	function gotoplay(fr){
		 console.log("play"+fr);
	}

	function functionInHtmlFile(par)
	{
		alert(par);
	}