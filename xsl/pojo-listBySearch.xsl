<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"> 
	
	<xsl:output method="text" />
	
	<xsl:param name="pojoId"/>
	<xsl:variable name="pojoPath" select="//pojo[@id=$pojoId]"/>
	<xsl:variable name="pojoName" select="$pojoPath/@name"/>
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
&lt;div style="float:right"&gt;&lt;a href="#" style="cursor:hand" onclick="javascript:history.go(-1);"&gt;&lt;img style="height:50px;width:50px;" src="${base}/images/return.png" /&gt;&lt;/a&gt;&lt;/div&gt;
	&lt;h4&gt;</xsl:text>
		<xsl:value-of select="$pojoPath/@cname"></xsl:value-of>
		<xsl:text>列表&lt;/h4&gt;
&lt;/div&gt;
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
			&lt;/a&gt; &lt;a class="btn btn-danger" href="javascript:deleteY(${item.id?c})"&gt;删除&lt;/a&gt;
		</xsl:text>
		<xsl:for-each select="$pojoPath//property/relation[@er-type='many_to_many_to' or @er-type='many_to_many_from']">
			<xsl:text>
			&lt;br /&gt;
			&lt;a class="btn btn-info" href="getInfo</xsl:text>
			<xsl:value-of select="substring(../../@name,2,string-length(../../@name))"></xsl:value-of>
			<xsl:text>Binding</xsl:text>
			<xsl:call-template name="getPojoName">
				<xsl:with-param name="pojoClassName" select="@pojo"></xsl:with-param>
			</xsl:call-template>
			<xsl:text>.action?MyUrl=success&amp;pojo.id=${item.id?c}&amp;themesName=${themesName}"&gt;关系绑定（</xsl:text>
			<xsl:value-of select="../@cname"></xsl:value-of>
			<xsl:text>）&lt;/a&gt;</xsl:text>
		</xsl:for-each>
		<xsl:text>&lt;/td&gt;
		&lt;/tr&gt;
		&lt;/#list&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
&lt;input id="M</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>" type="hidden" value="</xsl:text>
		<xsl:for-each select="//pojos/pojo">
		<xsl:if test="@name=$pojoName">
		<xsl:value-of select="position()"/></xsl:if>
		</xsl:for-each>
<xsl:text>"&gt;
&lt;/@crazyasp.managePage&gt;
</xsl:text>
	</xsl:template>
	
	<xsl:template name="getPojoName">
		<xsl:param name="pojoClassName"/>
		<xsl:choose>
			<xsl:when test="contains($pojoClassName,'.')">
				<xsl:call-template name="getPojoName">
					<xsl:with-param name="pojoClassName" select="substring-after($pojoClassName,'.')" />				
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring($pojoClassName,2,string-length($pojoClassName))"></xsl:value-of>			
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
