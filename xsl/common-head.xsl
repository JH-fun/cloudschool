<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"> 
	
	<xsl:output method="text" />
	
	<xsl:template match="/">
		<xsl:apply-templates select="project"></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="project">
		<xsl:text>&lt;#-- #页面模版的头，页面上方的显示布局，具体位置由common模版里面的位置决定 --&gt; &lt;#macro head&gt;
&lt;script type="text/javascript"&gt;

//控制菜单显示状态
$(function(){
	var value=request("noneid");
	if(value==1){
		return;
	}
	if(value!="undefined"&amp;&amp;value!=""){
		showsubmenu(value);
	}
	getValue();
});

//js获取url参数
function request(paras){ 
	var url = location.href;  
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&amp;");  
	var paraObj = {}  
		for (i=0; j=paraString[i]; i++){  
			paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
		}  
	var returnValue = paraObj[paras.toLowerCase()];  
	if(typeof(returnValue)=="undefined"){  
		return "";  
	}else{  
		return returnValue; 
	}
}

//控制菜单开关
function showsubmenu(sid)
{
	whichEl = eval("submenu" + sid);
	if (whichEl.style.display == "none"){
	eval("submenu" + sid + ".style.display=\"\";");
		for(var j=1;j&lt;</xsl:text><xsl:value-of select="count(//pojo)+1"></xsl:value-of><xsl:text>;j++){
			if(j!=sid&amp;&amp;typeof("#submenu"+j)!="undefined"){
				$("#submenu"+j).css('display','none');
				//eval("submenu" + j + ".style.display=\"none\";");
			}
		}
	}else{
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}

//菜单保持打开
function opensubmenu(sid)
{
	whichEl = eval("submenu" + sid);
	if (whichEl.style.display == "none"){
	eval("submenu" + sid + ".style.display=\"\";");
		for(var j=1;j&lt;</xsl:text><xsl:value-of select="count(//pojo)+1"></xsl:value-of><xsl:text>;j++){
			if(j!=sid&amp;&amp;typeof("#submenu"+j)!="undefined"){
				$("#submenu"+j).css('display','none'); 
				//eval("submenu" + j + ".style.display=\"none\";");
			}
		}
	}
}
//菜单保持打开所需
function getValue(){
</xsl:text>
<xsl:for-each select="//pojos//pojo">
<xsl:text>
	if(typeof($("#M</xsl:text><xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
	<xsl:text>").val())!="undefined"){
		opensubmenu($("#M</xsl:text><xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of><xsl:text>").val());
	}
	</xsl:text>
</xsl:for-each>
<xsl:text>
}	
	&lt;/script&gt;	
		
		
&lt;table border="0" cellspacing=0 cellpadding=0 width="50%"&gt;
	&lt;tr valign="middle"&gt;
		&lt;td align="left"&gt;
			&lt;a href="${base}"&gt;&lt;h1&gt;
					&lt;i&gt;</xsl:text>
		<xsl:value-of select="cname/text()"></xsl:value-of>
		<xsl:text>&lt;/i&gt;
				&lt;/h1&gt;
			&lt;/a&gt;
		&lt;/td&gt;
		&lt;td align="right"&gt;
		&lt;p&gt;
			当前登录人：&lt;#if currentUser??&gt;&lt;#if currentUser.name??&gt;${currentUser.name}&lt;#else&gt;访客&lt;/#if&gt;&lt;/#if&gt;&lt;/p&gt;
				&lt;#if currentUser.name??&gt; &lt;#if currentUser.name?substring(0,4)!='gues'&gt;&lt;/#if&gt;&lt;/#if&gt;
		&lt;/td&gt;
	&lt;/tr&gt;
&lt;/table&gt;
&lt;/#macro&gt;
</xsl:text>
	</xsl:template>
</xsl:stylesheet>