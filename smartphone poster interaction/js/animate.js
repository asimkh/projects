// JavaScript Document

  $(document).ready(function() {
	  	$("body").jpreLoader();
		preloadMyImages();
	  	$("#wrapp").fadeIn();
		$("#qr-code").click(function(){ initQR(); $(this).prop("disabled",true);});
		$("#nfc").click(function(){ initNFC()});
		$("#ibeacon").click(function(){initBecon()});
    	$("#cls").click(function(){ rst()});
		$("#sc1").css('background-image','url("./images/qr-1.jpg")');
		$("#sc2").css('background-image','url("./images/qr-2.jpg")');
		$("#sc3").css('background-image','url("./images/qr-3.jpg")');
		
	function flash() {
		  $( "#mb" ).show().fadeOut( "slow" );
	}
	 
	 function init(){
 			$("#mb").css("display","none");
			$("#sc1").css("display","none");
			$("#sc2").css("display","none");
			$("#sc3").css("display","none");
			$("#sc4").css("display","none");
			$("#sc5").css("display","none");
			$("#cls").css('display','none');
			$("#sc1").css({height:'640px', width:'400px',top:'0px',left:'0px'});
			$("#sc2").css({height:'640px', width:'400px',top:'0px',left:'0px'});
			$("#sc3").css({height:'640px', width:'400px',top:'0px',left:'0px'});
			
			$("#qr-code").css('display','none');
			$("#nfc").css('display','none');
			$("#ibeacon").css('display','none');
			
/*			$('.btn1').css('cursor','not-allowed');
			$('.btn2').css('cursor','not-allowed');
			$('.btn3').css('cursor','not-allowed');
*/
			console.log("disable buttons");

	 }
		function initQR(){
			init();
			
			$("#cls").css('display','none');
			$("#mb").css('background-image','none');
			$("#mb").fadeIn();
			$("#sc1").css("display","block");
			$("#sc1").css('background-image','url("./images/samsung2.png")');
			$("#sc1").css({height:'640px', width:'400px',top:'0px',left:'0px'});
			$("#sc1").fadeIn();
			$("#sc1").delay(1000).animate({left:'-550px', top:'420px', height:'235px', width:'130px'},2000);
			$("#sc2").css("display","none");
			$("#sc2").css('background-image','url("./images/samsung4.png")');
			$("#sc2").css({left:'-550px', top:'420px', height:'235px', width:'130px'});
			$("#sc2").delay(3000).fadeIn();
			
			$("#sc3").css("display","none");
			$("#sc3").css("padding-top","5%");
			$("#sc3").html("<iframe width='75%' height='68%' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://dev.streetlike.com/phoenixoffer/mob/index.php?preview=true'></iframe>");
			$("#sc3").css('background-image','url("./images/samsung3.png")');
			$("#sc3").css({left:'-550px', top:'420px', height:'235px', width:'130px'});
			$("#sc3").delay(6000).fadeIn();
			$("#sc1").delay(4000).fadeOut();
			
			$("#sc2").delay(4000).fadeOut();
			$("#sc3").delay(3000).animate({height:'640px', width:'400px',top:'0px',left:'0px',paddingTop:'17%'},2000);
			$("#sc3").delay(4000).html("<iframe width='75%' height='77%' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://dev.streetlike.com/phoenixoffer/mob/index.php?preview=true'></iframe>")
			$("#cls").fadeIn();
		}
		
		function initNFC(){
			init();
			$("#cls").css('display','none');
			$("#mb").css('background-image','none');
			$("#mb").fadeIn();
			$("#sc1").css("display","block");
			$("#sc1").css('background-image','url("./images/samsung2.png")');
			$("#sc1").css({height:'640px', width:'400px',top:'0px',left:'0px'});
			$("#sc1").fadeIn();
			$("#sc1").delay(1000).animate({left:'-410px', top:'420px', height:'235px', width:'130px'},2000);
			/*
			$("#sc2").css("display","none");
			$("#sc2").css('background-image','url("./images/samsung3.png")');
			$("#sc2").css({left:'-410px', top:'420px', height:'235px', width:'130px'});
			$("#sc2").delay(5000).fadeIn();
			$("#sc1").delay(4000).fadeOut();
			$("#sc2").delay(3000).animate({height:'640px', width:'400px',top:'0px',left:'0px'},2000);*/
			
			$("#sc2").css("display","none");
			$("#sc2").css("padding-top","5%");
			$("#sc2").html("<iframe width='75%' height='68%' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://dev.streetlike.com/phoenixoffer/mob/index.php?preview=true'></iframe>");
			$("#sc2").css('background-image','url("./images/samsung3.png")');
			$("#sc2").css({left:'-410px', top:'420px', height:'235px', width:'130px'});
			$("#sc2").delay(5000).fadeIn();
			$("#sc1").delay(4000).fadeOut();
			$("#sc2").delay(3000).animate({height:'640px', width:'400px',top:'0px',left:'0px',paddingTop:'17%'},2000);
			$("#sc2").delay(4000).html("<iframe width='75%' height='77%' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://dev.streetlike.com/phoenixoffer/mob/index.php?preview=true'></iframe>")
			
			$("#cls").fadeIn();

		}
		
		function initBecon(){
			init();
			$("#cls").css('display','none');
			$("#mb").css('background-image','url("./images/iphone1.png")');
			$("#mb").fadeIn();
			$("#sc1").css("display","block");
			$("#sc1").css("display","none");
			$("#sc1").css({width:'400px',height:'640px',top:'0px',left:'0px'});
			$("#sc1").css('background-image','url("./images/iphone2.png")');
			$("#sc1").delay(3000).fadeIn();
			
			$("#sc2").css("display","none");
			$("#sc2").css({width:'400px',height:'640px',top:'0px',left:'0px',paddingTop:'17%'});
			$("#sc2").css('background-image','url("./images/iphone3.png")');
			$("#sc2").delay(4000).html("<iframe width='75%' height='74%' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://dev.streetlike.com/phoenixoffer/mob/index.php?preview=true'></iframe>")
			$("#sc2").delay(6000).fadeIn();
			
			$("#sc4").css("display","none");
			$("#sc4").css({width:'94px',height:'195px',top:'0px',left:'360px'});
			$("#sc4").css('background-image','url("./images/wireless-signal.gif")');
			$("#sc4").delay(3000).fadeIn('slow');
			$("#sc4").delay(3000).fadeOut('slow');
			
			$("#sc5").css("display","none");
			$("#sc5").css({width:'94px',height:'195px',top:'390px',left:'-200px'});
			$("#sc5").css('background-image','url("./images/wireless-signal.gif")');
			$("#sc5").delay(3000).fadeIn('slow');
			$("#sc5").delay(3000).fadeOut('slow');
			$("#cls").fadeIn();
		}
		
			function rst() {
			$("#mb").fadeOut();
			$("#sc1").fadeOut();
			$("#sc2").fadeOut();
			$("#sc3").fadeOut();
			$("#sc4").fadeOut();
			$("#sc5").fadeOut();
			
			$("#sc1").html("");
			$("#sc2").html("");
			$("#sc3").html("");
			$("#sc4").html("");
			$("#sc5").html("");
			
			console.log("enable buttons");
			$("#qr-code").css('display','block');
			$("#nfc").css('display','block');
			$("#ibeacon").css('display','block');
			
/*			$('.btn1').css('cursor','pointer');
			$('.btn2').css('cursor','pointer');
			$('.btn3').css('cursor','pointer');*/
		};
		
		function preloadMyImages() 
			{
				console.log("loading images");
				var imageList = [
					"images/poster1.jpg",
					"images/poster2.jpg",
					"images/samsung.png",
					"images/samsung1.png",
					"images/samsung2.png",
					"images/samsung3.png",
					"images/samsung4.png",
					"images/wireless-signal.gif",
					"images/iphone1.png",
					"images/iphone2.png",
					"images/iphone3.png",
					"images/qr-1.jpg",
					"images/qr-2.jpg",
					"images/qr-3.jpg"
				];
				for(var i = 0; i < imageList.length; i++ ) 
				{
					var imageObject = new Image();
					imageObject.src = imageList[i];
				}
				
				//$(imageList).each(function(){$('')[0].src = this;});
			}
					
  
		
  });

	