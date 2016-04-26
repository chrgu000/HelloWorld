
//time_test();
setTimeout(function(){time_test();},5000);

function actionBtn(buttonid)
{
	document.getElementById("frmContent").contentWindow.document.getElementById(buttonid).click();
}


function time_test(){
	var dateTime=new Date();	
	time=dateTime.getHours()*100+dateTime.getMinutes();	
	
	if(time>745&&time<806)
		{
			actionBtn("view:_id1:btnSignIN");
			//setTimeout(function(){time_test();},Math.ceil(Math.random()*10000));			
		}
	else if(time>1735&&time<1756)
		{
			actionBtn("view:_id1:btnSignOut");
			//setTimeout(function(){time_test();},60000*(60+Math.ceil(Math.random()*20))+Math.ceil(Math.random()*60000));//60+rand20 min				
		}		
	
}

