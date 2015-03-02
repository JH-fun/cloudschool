<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"> 
	
	<xsl:output method="text" />
	
	<xsl:param name="pojoId"/>
	<xsl:variable name="pojoPath" select="//pojo[@id=$pojoId]"/>

	<xsl:template match="/">
		<xsl:call-template name="node"></xsl:call-template>	
	</xsl:template>

	<xsl:template name="node">
		<xsl:text>&lt;#import "${templatePath}/xhtml/common/common.html" as crazyasp&gt;
&lt;@crazyasp.managePage title="后台管理页面"&gt;</xsl:text>
		<xsl:text>
&lt;div style="text-align: center"&gt;
&lt;div style="float:right"&gt;&lt;a href="#" style="cursor:hand" onclick="javascript:history.go(-1);"&gt;&lt;img style="height:50px;width:50px;" src="${base}/images/return.png" /&gt;&lt;/a&gt;&lt;/div&gt;
	&lt;h4&gt;详细内容&lt;/h4&gt;
	&lt;table border="1" cellpadding="3" cellspacing="0"
		style="width: 60%; margin: auto"&gt;
		&lt;tbody&gt;
			&lt;tr&gt;
				&lt;td&gt;名称：&lt;/td&gt;
				&lt;td&gt;${pojo.name}&lt;/td&gt;
			&lt;/tr&gt;</xsl:text>
		<xsl:for-each select="$pojoPath//property">
			<xsl:choose>
				<xsl:when test="relation/@er-type='one_to_many'"></xsl:when>
				<xsl:when test="relation/@er-type='many_to_one'">
					<xsl:text>
			&lt;tr&gt;
				&lt;td&gt;</xsl:text>
					<xsl:value-of select="@cname"></xsl:value-of>
					<xsl:text>：&lt;/td&gt;
				&lt;td&gt;&lt;#if pojo.</xsl:text>
					<xsl:value-of select="@name"></xsl:value-of>
					<xsl:text>??&gt;&lt;a
					href="getInfo</xsl:text>
					<xsl:call-template name="getPojoName">
						<xsl:with-param name="pojoClassName" select="relation/@pojo"></xsl:with-param>
					</xsl:call-template>
					<xsl:text>.action?MyUrl=success&amp;pojo.id=${pojo.</xsl:text>
					<xsl:value-of select="@name"></xsl:value-of>
					<xsl:text>.id?c}&amp;themesName=${themesName}"&gt;${(pojo.</xsl:text>
					<xsl:value-of select="@name"></xsl:value-of>
					<xsl:text>.name)!''}&lt;/a&gt;&lt;/#if&gt;
				&lt;/td&gt;
			&lt;/tr&gt;</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>
			&lt;tr&gt;
				&lt;td&gt;</xsl:text>
					<xsl:value-of select="@cname"></xsl:value-of>
				<xsl:text>：&lt;/td&gt;
				&lt;td&gt;${pojo.</xsl:text>
					<xsl:value-of select="@name"></xsl:value-of>
				<xsl:text>}&lt;/td&gt;
			&lt;/tr&gt;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text>
		&lt;/tbody&gt;
	&lt;/table&gt;
&lt;/div&gt;</xsl:text>
		<xsl:if test="$pojoPath//property/relation[@er-type='one_to_many']">
			<xsl:for-each select="$pojoPath//property/relation[@er-type='one_to_many']">
				<xsl:text>
&lt;div class="control-group"&gt; 
&lt;h4&gt;</xsl:text>
				<xsl:value-of select="../@cname"></xsl:value-of>
				<xsl:text>&lt;/h4&gt;</xsl:text>
				<xsl:text>
	&lt;table border="1" cellpadding="3" cellspacing="0" style="width: 60%; margin: auto"&gt;
		&lt;thead&gt;
			&lt;tr&gt;
				&lt;th style="text-align: center"&gt;名&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;称&lt;/th&gt;
				&lt;th style="text-align: center"&gt;创建时间&lt;/th&gt;
			&lt;/tr&gt;
		&lt;/thead&gt;
		&lt;tbody&gt;
			&lt;#list pojo.</xsl:text>
				<xsl:value-of select="../@name"></xsl:value-of>
				<xsl:text> as item&gt;
			&lt;tr&gt;
				&lt;td style="text-align: center"&gt;&lt;a
					href="getInfo</xsl:text>
				<xsl:call-template name="getPojoName">
					<xsl:with-param name="pojoClassName" select="@pojo" />
				</xsl:call-template>
				<xsl:text>.action?MyUrl=success&amp;pojo.id=${item.id?c}&amp;themesName=${themesName}"&gt;${item.name}&lt;/a&gt;&lt;/td&gt;
			&lt;td style="text-align: center"&gt;&lt;#if item.inTime??&gt;${item.inTime?string('MM-dd HH:mm')}&lt;/#if&gt;&lt;/td&gt;
			&lt;/tr&gt;
			&lt;/#list&gt;
		&lt;/tbody&gt;
	&lt;/table&gt;
&lt;/div&gt;</xsl:text>
			</xsl:for-each>
		</xsl:if>
		<xsl:text>
&lt;/@crazyasp.managePage&gt;</xsl:text>
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
		