<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="2.0">

	<xsl:output method="text" />

	<xsl:param name="pojoId" />
	<xsl:variable name="pojoPath" select="//pojo[@id=$pojoId]" />

	<xsl:template match="/">
		<xsl:call-template name="node"></xsl:call-template>
	</xsl:template>

	<xsl:template name="node">
		<xsl:text>package </xsl:text>
		<xsl:value-of select="$pojoPath/@package"></xsl:value-of>
		<xsl:text>;

import cn.crazyasp.common.TObject;

/**
  * </xsl:text>
		<xsl:value-of select="$pojoPath/@cname"></xsl:value-of>
		<xsl:text>
  *    		
  * @copyright 天津华网畅达科技有限公司 canetwork.cn:8080 www.canetworkcom@163.com
  */
public class </xsl:text>
		<xsl:value-of select="$pojoPath/@name"></xsl:value-of>
		<xsl:text> extends TObject {
		</xsl:text>
		<xsl:for-each select="$pojoPath//property">
			<xsl:text>
	// </xsl:text>
		<xsl:value-of select="annotation/text()"></xsl:value-of>
			<xsl:text>		
	private </xsl:text>
			<xsl:value-of select="@type"></xsl:value-of>
			<xsl:if test="@type='java.util.Set'">
				<xsl:text>&lt;</xsl:text>
				<xsl:value-of select="relation/@pojo"></xsl:value-of>
				<xsl:text>&gt;</xsl:text>
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:value-of select="@name"></xsl:value-of>
			<xsl:text>;</xsl:text>
		</xsl:for-each>
		<xsl:for-each select="$pojoPath//property">
			<xsl:text>
	/**
	 * @param </xsl:text>
	 		<xsl:value-of select="@name"></xsl:value-of>
	 		<xsl:text> the </xsl:text>
	 		<xsl:value-of select="@name"></xsl:value-of>
	 		<xsl:text> to set
	 */		
	public void set</xsl:text>
			<xsl:value-of select="upper-case(substring(@name,1,1))"></xsl:value-of>
			<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
			<xsl:text>(</xsl:text>
			<xsl:value-of select="@type"></xsl:value-of>
			<xsl:if test="@type='java.util.Set'">
				<xsl:text>&lt;</xsl:text>
				<xsl:value-of select="relation/@pojo"></xsl:value-of>
				<xsl:text>&gt;</xsl:text>
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:value-of select="@name"></xsl:value-of>
			<xsl:text>)</xsl:text>
			<xsl:text>{
		this.</xsl:text>
			<xsl:value-of select="@name"></xsl:value-of>
			<xsl:text> = </xsl:text>
			<xsl:value-of select="@name"></xsl:value-of>
			<xsl:text>;
	}
	
	/**
	 * @return the </xsl:text>
	 		<xsl:value-of select="@name"></xsl:value-of>
	 		<xsl:text>
	 */
	public </xsl:text>
			<xsl:value-of select="@type"></xsl:value-of>
			<xsl:text> get</xsl:text>
			<xsl:value-of select="upper-case(substring(@name,1,1))"></xsl:value-of>
			<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
			<xsl:text>(){
		return this.</xsl:text>
			<xsl:value-of select="@name"></xsl:value-of>
			<xsl:text>;
	}</xsl:text>
		</xsl:for-each>
		<xsl:text>
}
		</xsl:text>
	</xsl:template>
</xsl:stylesheet>
		