<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="2.0"> 
	<!-- 指定输出格式 -->
	<xsl:output method="text" />
	<xsl:output method="html" indent="yes" name="html" />
	<xsl:template match="/">
	<!-- 匹配xml文件的根节点 -->
		<xsl:for-each select="//pojo">
		<!-- 查找根节点下面的任何一个pojo元素 -->
			<xsl:variable name="filename" select="concat(@package,@name,'.java')" />
			<xsl:value-of select="$filename" />
			<!-- Creating -->
			<xsl:result-document href="{$filename}" >
			<!-- 输出多个文件，格式按下面指定的格式 -->
package <xsl:value-of select="@package" />;
/**
 * <xsl:value-of select="annotation" />
 * 
 * @author xsltGen
 * 
 */
public class <xsl:value-of select="@name" /> extends <xsl:value-of select="@extends" /> {
<xsl:apply-templates select="property"></xsl:apply-templates>
}
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="property">
	<!-- pojo属性的模板，按xml指定的属性来生成java类中的属性 -->
	//<xsl:value-of select="annotation" />
	private <xsl:value-of select="@type" /> <xsl:value-of select="@name" />;
	/**
	 * <xsl:value-of select="annotation" />
	 */
	<xsl:value-of></xsl:value-of>
	public <xsl:value-of select="@type" /> get<xsl:value-of select="upper-case(substring(@name,1))"/><xsl:text> </xsl:text><xsl:value-of select="substring(@name,2)"/>() {
		return <xsl:value-of select="@name" />;
	}

	/**
	 * <xsl:value-of select="annotation" />
	 */
	public void set<xsl:value-of select="@name" />(<xsl:value-of select="@type" /> type) {
		this.<xsl:value-of select="@name" /> = type;
	}
	</xsl:template>
</xsl:stylesheet>