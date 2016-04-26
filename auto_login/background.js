var list=[{'username':"maxiaoweii",'token':"Mxw%9891"},
]

var times=1;

var logdate=[]
var nologdate=[1]//new year holiday

function action(){
	chrome.tabs.create({'url':"http://kfzxsoi.zh.abc/attendance/userinfo.nsf/xpIndex.xsp"});
	
	}
		
function login(username,token){
	chrome.tabs.create({'url':"http://web.abc/portal/"});
	chrome.tabs.executeScript({'code':"document.getElementById('UserName').value='"+username+"';"});
	chrome.tabs.executeScript({'code':"document.getElementById('Token').value='"+token+"';"});
	chrome.tabs.executeScript({'code':"document.getElementsByTagName('form')[0].submit();"});
	
	setTimeout(function(){action();},5000);
	}

function logall(){
	
	var username=list[0].username;
	var token=list[0].token;
	
	setTimeout(function(){login(username,token);},5000);//30s	

}

function time_test(){
	var dateTime=new Date();
	if(logdate.indexOf(dateTime.getDate())!=-1 ||(dateTime.getDay()>=1 && dateTime.getDay()<6 && nologdate.indexOf(dateTime.getDate()) == -1 ))
	{
		time=dateTime.getHours()*100+dateTime.getMinutes();	

		if(time>745&&time<806)
			{				
				logall();	
				if(1==times)
				{
					setTimeout(function(){time_test();},60000*8);//in case it doesn't work first time
					times=times+1;
				}
				else
				{
					setTimeout(function(){time_test();},60000*(480+Math.ceil(Math.random()*20))+Math.ceil(Math.random()*60000));//6h+rand20 min	
					times=1;
				}
							
				
			}
		else if(time>1735&&time<1756)
			{
				logall();
				setTimeout(function(){time_test();},60000*(780+Math.ceil(Math.random()*20))+Math.ceil(Math.random()*60000));//13h+rand20 min	
			}
		else{					
			setTimeout(function(){time_test();},60000*20);//20min	
		}
	}else{			
		setTimeout(function(){time_test();},60000*60*24);//not workday,wait for 24h		
	}
}

time_test();