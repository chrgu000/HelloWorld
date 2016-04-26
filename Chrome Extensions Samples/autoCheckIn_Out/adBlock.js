
document.getElementById("narutologo").onclick=function(){blockAfter();};
var childList=document.getElementsByTagName('iframe');
//alert("iframe num: "+childList.length);
for(var i=0;i<childList.length;++i)
{
	childList[i].parentNode.removeChild(childList[i]);
}

function blockAfter(){
	

	var cs=document.getElementById('cs_right_bottom');
	if(cs!=null)
	{
		cs.parentNode.removeChild(cs);
	}

	var ft=document.getElementById('ft_right_bottom');
	if(ft!=null)
	{
		ft.parentNode.removeChild(ft);
	}


	var besides=document.getElementById('beitou');
	besides.parentNode.removeChild(beitou);
	
	var childList=document.getElementsByTagName('iframe');
	//alert("iframe num: "+childList.length);
	for(var i=0;i<childList.length;++i)
	{
		childList[i].parentNode.removeChild(childList[i]);
	}
}
