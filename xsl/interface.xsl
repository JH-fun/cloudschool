<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="2.0">

	<xsl:output method="text" />

	<xsl:param name="daoId" />
	<xsl:variable name="daoPath" select="//dao[@id=$daoId]" />

	<xsl:template match="/">
		<xsl:call-template name="node"></xsl:call-template>
	</xsl:template>

	<xsl:template name="node">
		<xsl:text>package </xsl:text>
		<xsl:value-of select="$daoPath/@package"></xsl:value-of>
		<xsl:text>;

import java.util.List;

import cn.crazyasp.common.ITObject;
import cn.crazyasp.common.ITableOption;

/**
  * </xsl:text>
		I<xsl:value-of select="$daoPath/@name"></xsl:value-of>
		<xsl:text>
  *    		
  * @copyright 天津华网畅达科技有限公司 canetwork.cn:8080 www.canetworkcom@163.com
  */
public interface I</xsl:text>
		<xsl:value-of select="$daoPath/@name"></xsl:value-of>
		<xsl:text> extends ITableOption {

	List&lt;ITObject&gt; select</xsl:text><xsl:value-of select="replace($daoPath/@name,'Option','')"></xsl:value-of>
		<xsl:text>(ITObject pojo);</xsl:text>

<xsl:for-each select="$daoPath/DaoMethod">
<xsl:variable name="ArgsSize" select="@ArgsSize" />
<xsl:if test="@CustomSearchId">
<xsl:text>
	
	List&lt;ITObject&gt; </xsl:text><xsl:value-of select="@name"></xsl:value-of>
	 <xsl:text>(</xsl:text>
	 <xsl:for-each select="customArgs">
	 <xsl:value-of select="@leiXing"></xsl:value-of><xsl:text> </xsl:text><xsl:value-of select="@name"></xsl:value-of>
	 <xsl:if test="position() &lt; $ArgsSize">
	 <xsl:text>,</xsl:text>
	 </xsl:if>
	</xsl:for-each>
	<xsl:text>);</xsl:text>
	</xsl:if>
	 </xsl:for-each>
<xsl:text>
}</xsl:text>
	</xsl:template>
</xsl:stylesheet>
		