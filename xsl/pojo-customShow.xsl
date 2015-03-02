<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"> 
	
	<xsl:output method="text" />
	
	<xsl:param name="pojoId"/>
	<xsl:param name="DaoMethodId"/>
	<xsl:variable name="pojoPath" select="//pojo[@id=$pojoId]"/>
	<xsl:variable name="DaoMethodPath" select="$pojoPath/DaoMethod[@id=$DaoMethodId]"/>
	<xsl:template match="/">
		<xsl:call-template name="node"></xsl:call-template>	
	</xsl:template>

	<xsl:template name="node">
		<xsl:text>&lt;#import "${templatePath}/xhtml/common/common.html" as crazyasp&gt;
&lt;@crazyasp.managePage title="后台管理页面"&gt;
&lt;script type="text/javascript"&gt;
function deleteY(id) {
	var flag = confirm("是否删除？");
	if (flag) {
			window.location.href = "delete</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>.action?pojo.id=" + id;
	}
}
&lt;/script&gt;
&lt;div style="TEXT-ALIGN: center;"&gt;
&lt;div style="float:right"&gt;&lt;a style="cursor:hand" onclick="javascript:history.back();return false;"&gt;&lt;img style="height:50px;width:50px;" src="${base}/images/return.png" /&gt;&lt;/a&gt;&lt;/div&gt;
	&lt;h4&gt;</xsl:text>
		<xsl:value-of select="$pojoPath/@cname"></xsl:value-of>
		<xsl:text>自定义查询&lt;/h4&gt;
&lt;/div&gt;
&lt;form name="getBySearch</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>" action="</xsl:text>
		<xsl:value-of select="$DaoMethodPath/@CustomSearchAction"></xsl:value-of>
		<xsl:text>.action" method="post"&gt;
	&lt;div&gt;
		&lt;table border="1" cellpadding="3" cellspacing="0" style="width: 60%; margin: auto"&gt;
			&lt;tbody&gt;</xsl:text>
				<xsl:for-each select="$DaoMethodPath/customArgs">
				<xsl:if test="../@CustomSearchId">
			<xsl:text>	&lt;tr&gt;
					&lt;td&gt;</xsl:text><xsl:value-of select="@cname"></xsl:value-of><xsl:text>：&lt;/td&gt;
					&lt;td&gt;&lt;input type="text" name="</xsl:text><xsl:value-of select="@name"></xsl:value-of><xsl:text>" /&gt;&lt;/td&gt;
				&lt;/tr&gt;
				</xsl:text>
				</xsl:if>
				</xsl:for-each>
		<xsl:text>&lt;tr&gt;
					&lt;td&gt;&lt;/td&gt;
					&lt;td&gt;&lt;input class="btn btn-primary" type="submit" value="查询"
						style="margin-bottom: 8px; margin-left: 50px;" /&gt;&lt;/td&gt;
				&lt;/tr&gt;
			&lt;/tbody&gt;
		&lt;/table&gt;
	&lt;/div&gt;
&lt;/form&gt;
&lt;table border="1" cellpadding="3" cellspacing="0"
	style="width: 60%; margin: auto"&gt;
	&lt;thead&gt;
		&lt;tr&gt;
			&lt;th style="text-align: center"&gt;名&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;称&lt;/th&gt;
			&lt;th style="text-align: center"&gt;创建时间&lt;/th&gt;
			&lt;th style="text-align: center"&gt;操&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;作&lt;/th&gt;
		&lt;/tr&gt;
	&lt;/thead&gt;
	&lt;tbody&gt;
		&lt;#list list as item&gt;
		&lt;tr&gt;
			&lt;td style="text-align: center"&gt;&lt;a
				href="getInfo</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>.action?MyUrl=success&amp;pojo.id=${item.id?c}&amp;themesName=${themesName}"&gt;${(item.name)!}&lt;/a&gt;&lt;/td&gt;
			&lt;td style="text-align: center"&gt;&lt;#if item.inTime??&gt;${item.inTime?string('MM-dd HH:mm')}&lt;/#if&gt;&lt;/td&gt;
			&lt;td class="center" style="text-align: center"&gt;&lt;a class="btn btn-info"
				href="getInfo</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>.action?MyUrl=update&amp;pojo.id=${item.id?c}&amp;themesName=${themesName}"&gt;编辑
			&lt;/a&gt; &lt;a class="btn btn-danger" href="javascript:deleteY(${item.id?c})"&gt;删除&lt;/a&gt;&lt;/td&gt;
		&lt;/tr&gt;
		&lt;/#list&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
&lt;input id="M</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>" type="hidden" value="8"&gt;
&lt;/@crazyasp.managePage&gt;
</xsl:text>
	</xsl:template>
</xsl:stylesheet>
