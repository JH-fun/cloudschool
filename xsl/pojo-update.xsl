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
&lt;@crazyasp.managePage title="后台管理页面"&gt;</xsl:text>
		<xsl:if test="$pojoPath//property/relation/@er-type='many_to_one'">
			<xsl:text>
&lt;script type="text/javascript"&gt;
	$(document).ready(function() {</xsl:text>
			<xsl:for-each select="$pojoPath//property/relation[@er-type='many_to_one']">
				<xsl:text>
		$.ajax({
			url : "getAll</xsl:text>
				<xsl:call-template name="getPojoName">
					<xsl:with-param name="pojoClassName" select="@pojo"/>				
				</xsl:call-template>
				<xsl:text>.action?myUrl=ajaxOption",
			cache : false
		}).done(function(html) {
			$("#</xsl:text>
				<xsl:call-template name="getPojoName">
					<xsl:with-param name="pojoClassName" select="@pojo"/>				
				</xsl:call-template>
				<xsl:text>").append(html);
			&lt;#if pojo.</xsl:text>
				<xsl:value-of select="../@name"></xsl:value-of>
				<xsl:text>??&gt;
				document.getElementById("</xsl:text>
				<xsl:call-template name="getPojoName">
					<xsl:with-param name="pojoClassName" select="@pojo"/>				
				</xsl:call-template>
				<xsl:text>").value=${pojo.</xsl:text>
				<xsl:value-of select="../@name"></xsl:value-of>
				<xsl:text>.id?c};
			&lt;/#if&gt;
		});</xsl:text>
			</xsl:for-each>
			<xsl:text>
	});
&lt;/script&gt;</xsl:text>
		</xsl:if>
			<xsl:text>
&lt;form name="update</xsl:text>
			<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
			<xsl:text>" action="update</xsl:text>
			<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
			<xsl:text>.action" method="post"&gt;
	&lt;div style="text-align: center"&gt;
	&lt;div style="float:right"&gt;&lt;a href="#" style="cursor:hand" onclick="javascript:history.go(-1);"&gt;&lt;img style="height:50px;width:50px;" src="${base}/images/return.png" /&gt;&lt;/a&gt;&lt;/div&gt;
		&lt;h4&gt;</xsl:text>
			<xsl:value-of select="$pojoPath/@cname"></xsl:value-of>
			<xsl:text>修改&lt;/h4&gt;
		&lt;input style="display: none" type="hidden" name="pojo.inTime" value="${(pojo.inTime)!}" /&gt; 
		&lt;table border="1" cellpadding="3" cellspacing="0"
			style="width: 60%; margin: auto"&gt;
			&lt;tbody&gt;
				&lt;tr&gt;
					&lt;td&gt;名称&lt;/td&gt;
					&lt;td&gt;&lt;input type="text" name="pojo.name" value="${(pojo.name)!}" /&gt;&lt;/td&gt;
				&lt;/tr&gt;</xsl:text>
			<xsl:for-each select="$pojoPath//property">
				<xsl:choose>
					<xsl:when test="relation/@er-type='one_to_many'"></xsl:when>
					<xsl:when test="relation/@er-type='many_to_many_to'"></xsl:when>
					<xsl:when test="relation/@er-type='many_to_many_from'"></xsl:when>
					<xsl:when test="relation/@er-type='many_to_one'">
					<xsl:text>
				&lt;tr&gt;
					&lt;td&gt;</xsl:text>
						<xsl:value-of select="@cname"></xsl:value-of>
						<xsl:text>&lt;/td&gt;
					&lt;td&gt;&lt;select id="</xsl:text>
						<xsl:call-template name="getPojoName">
							<xsl:with-param name="pojoClassName" select="relation/@pojo" />
						</xsl:call-template>						
						<xsl:text>" name="pojo.</xsl:text>
						<xsl:value-of select="@name"></xsl:value-of>					
						<xsl:text>.id"&gt;&lt;/select&gt;&lt;/td&gt;
				&lt;/tr&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>
				&lt;tr&gt;
					&lt;td&gt;</xsl:text>
						<xsl:value-of select="@cname"></xsl:value-of>
						<xsl:text>&lt;/td&gt;
					&lt;td&gt;&lt;input type="text" name="pojo.</xsl:text>
						<xsl:value-of select="@name"></xsl:value-of>
						<xsl:text>" value="${pojo.</xsl:text>
						<xsl:value-of select="@name"></xsl:value-of>
						<xsl:text>}" /&gt;&lt;/td&gt;
				&lt;/tr&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>				
			</xsl:for-each>
			<xsl:text>
				&lt;tr&gt;
					&lt;td&gt;&lt;/td&gt;
					&lt;td&gt;&lt;div class="controls"&gt;
							&lt;button class="btn btn-primary"&gt;修改&lt;/button&gt;
						&lt;/div&gt;&lt;/td&gt;
				&lt;/tr&gt;
			&lt;/tbody&gt;
		&lt;/table&gt;
	&lt;/div&gt;
&lt;/form&gt;</xsl:text>
			<xsl:text>
&lt;input id="M</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>" type="hidden" value="</xsl:text>
		<xsl:for-each select="//pojos/pojo">
		<xsl:if test="@name=$pojoName">
		<xsl:value-of select="position()"/></xsl:if>
		</xsl:for-each><xsl:text>"&gt;
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
