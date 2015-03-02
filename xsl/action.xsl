<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="2.0">

	<xsl:output method="text" />

	<xsl:param name="actionclassId" />
	<xsl:variable name="actionclassPath" select="//actionclass[@id=$actionclassId]" />
	<xsl:variable name="actionclassArgs" select="distinct-values($actionclassPath/DaoMethod/customArgs/@arg)" />
	<xsl:template match="/">
		<xsl:call-template name="node"></xsl:call-template>
	</xsl:template>

	<xsl:template name="node">
		<xsl:text>package </xsl:text>
		<xsl:value-of select="$actionclassPath/@package"></xsl:value-of>
		<xsl:text>;
		
import cn.canetwork.project.</xsl:text><xsl:value-of select="$actionclassPath/@projectname"></xsl:value-of><xsl:text>.dao.I</xsl:text><xsl:value-of select="replace($actionclassPath/@daoname,'Option','')"></xsl:value-of><xsl:text>Option;</xsl:text>
import cn.crazyasp.common.DealAction;
<xsl:text>
/**
  * </xsl:text>
       <xsl:value-of select="$actionclassPath/@name"></xsl:value-of>
		<xsl:text>
  *    		
  * @copyright 天津华网畅达科技有限公司 canetwork.cn:8080 www.canetworkcom@163.com
  */
public class </xsl:text>
		<xsl:value-of select="$actionclassPath/@name"></xsl:value-of>
		<xsl:text> extends DealAction {

	private static final long serialVersionUID = 1L;</xsl:text>
	
	<xsl:for-each select="$actionclassArgs">
	<xsl:variable name="ss" select="position()" />
	<xsl:text>
	private </xsl:text>	<xsl:value-of select="$actionclassArgs[$ss]"></xsl:value-of><xsl:text>;</xsl:text>
	</xsl:for-each>
	<xsl:text>
</xsl:text>
	<xsl:for-each select="$actionclassArgs">
	<xsl:variable name="ss" select="position()" />
	<xsl:text>
	public </xsl:text> <xsl:value-of select="substring-before($actionclassArgs[$ss], ' ')"></xsl:value-of>
	<xsl:text> get</xsl:text>
			<xsl:value-of select="upper-case(substring(substring-after($actionclassArgs[$ss], ' '),1,1))"></xsl:value-of>
			<xsl:value-of select="substring(substring-after($actionclassArgs[$ss], ' '),2,string-length(substring-after($actionclassArgs[$ss], ' ')))"></xsl:value-of>
	<xsl:text>() {
		return </xsl:text><xsl:value-of select="substring-after($actionclassArgs[$ss], ' ')"></xsl:value-of>
		<xsl:text>;
	}</xsl:text>
	</xsl:for-each>
	<xsl:text>
</xsl:text>
<xsl:for-each select="$actionclassArgs">
	<xsl:variable name="ss" select="position()" />
	<xsl:text>
	public void set</xsl:text><xsl:value-of select="upper-case(substring(substring-after($actionclassArgs[$ss], ' '),1,1))"></xsl:value-of>
			<xsl:value-of select="substring(substring-after($actionclassArgs[$ss], ' '),2,string-length(substring-after($actionclassArgs[$ss], ' ')))"></xsl:value-of>
	<xsl:text>(</xsl:text><xsl:value-of select="substring-before($actionclassArgs[$ss], ' ')"></xsl:value-of><xsl:text> </xsl:text><xsl:value-of select="substring-after($actionclassArgs[$ss], ' ')"></xsl:value-of><xsl:text>) {
		this.</xsl:text><xsl:value-of select="substring-after($actionclassArgs[$ss], ' ')"></xsl:value-of><xsl:text> = </xsl:text><xsl:value-of select="substring-after($actionclassArgs[$ss], ' ')"></xsl:value-of>
		<xsl:text>;
	}</xsl:text>
	</xsl:for-each>

<xsl:text>
	public String getBySearch() throws Exception{
		this.setList(((I</xsl:text><xsl:value-of select="$actionclassPath/@daoname"></xsl:value-of><xsl:text>)this.getOption()).select</xsl:text><xsl:value-of select="replace($actionclassPath/@daoname,'Option','')"></xsl:value-of><xsl:text>(this.getPojo()));</xsl:text>
		<xsl:text>
		return SUCCESS;
	}
	</xsl:text>


<xsl:for-each select="$actionclassPath/DaoMethod">
<xsl:if test="@CustomSearchId">
	<xsl:variable name="ss" select="position()" />
	<xsl:text>
	public String </xsl:text><xsl:value-of select="@CustomSearchAction"></xsl:value-of><xsl:text>() throws Exception {
	
		this.setList(((I</xsl:text><xsl:value-of select="$actionclassPath/@daoname"></xsl:value-of><xsl:text>)this.getOption()).</xsl:text><xsl:value-of select="@name"></xsl:value-of>
		<xsl:text>(</xsl:text><xsl:for-each select="customArgs"><xsl:value-of select="@name"></xsl:value-of>
		 <xsl:if test="position() &lt; ../@ArgsSize">
		<xsl:text>,</xsl:text> </xsl:if></xsl:for-each><xsl:text>));
		return this.getMyUrl();
	}</xsl:text>
	</xsl:if>
	</xsl:for-each>
<xsl:text>
}</xsl:text>
	</xsl:template>
</xsl:stylesheet>
		