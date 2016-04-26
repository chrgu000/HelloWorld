
window.onload=removeAll();
testState();

//remove all the add from BAIDU_EXP_UNION
function removeAll()
{
	//alert("we are family");
	var divList=document.getElementsByTagName('div');
	//alert("the div count is: "+divList.length);
	for(var i=0;i<divList.length;++i)
	{
		
		var idName=divList[i].getAttribute('id');		
		
		if(idName!=null&&idName.length>15&&idName.substr(0,15)=="BAIDU_EXP_UNION")
		{
			//alert(i+" idName is: "+ idName);
			divList[i].parentNode.removeChild(divList[i]);
		}
	}	
	
}

function testState()
{
	if(document.readyState=="complete")
	{
		//alert("loaded complete!");
		removeNaruto();
		setTimeout(testState,3000);
	}
	else
	{
		setTimeout(testState,5000);
	}
}
function removeNaruto()
{
	var childList=document.getElementsByTagName('iframe');	
	for(var i=0;i<childList.length;++i)
	{
		childList[i].parentNode.removeChild(childList[i]);
	}
	
	var cs=document.getElementById('cs_right_bottom');
	if(cs!=null)
	{
		cs.parentNode.removeChild(cs);
	}
	
	var besides=document.getElementById('beitou');
	if(besides!=null)
	{
		besides.parentNode.removeChild(beitou);	
	}
	

	var ft=document.getElementById('ft_right_bottom');
	if(ft!=null)
	{
		ft.parentNode.removeChild(ft);
	}
}
