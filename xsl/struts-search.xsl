<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"> 
	
	<xsl:output method="text" />
	
	<xsl:template match="/">
		<xsl:apply-templates select="project"></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="project">
		<xsl:text>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE struts PUBLIC "-//Apache Software Foundation//DTD Struts Configuration 2.1//EN" "http://struts.apache.org/dtds/struts-2.1.dtd"&gt;
&lt;struts&gt;
	&lt;package name="customSearch" extends="manage"&gt;

	</xsl:text>
	<xsl:for-each select="//pojo//DaoMethod">
		<xsl:if test="@CustomSearchId"><xsl:text>
		&lt;action name="</xsl:text><xsl:value-of select="@CustomSearchAction"></xsl:value-of><xsl:text>" class="deal</xsl:text><xsl:value-of select="substring(../@name,2)"></xsl:value-of>
		<xsl:text>Action" method="</xsl:text><xsl:value-of select="@CustomSearchAction"></xsl:value-of><xsl:text>"&gt;
			&lt;result name="success" type="freemarker"&gt;
				&lt;param name="location"&gt;
					${templatePath}/${themesName}/</xsl:text><xsl:value-of select="substring(../@name,2)"></xsl:value-of><xsl:text>/</xsl:text><xsl:value-of select="@name"></xsl:value-of><xsl:text>/customList.html
				&lt;/param&gt;
			&lt;/result&gt;
		&lt;/action&gt;

		&lt;action name="getAll</xsl:text><xsl:value-of select="@name"></xsl:value-of><xsl:text>" class="deal</xsl:text><xsl:value-of select="substring(../@name,2)"></xsl:value-of>
		<xsl:text>Action" method="listAll"&gt;
			&lt;result name="customSearch" type="freemarker"&gt;
				&lt;param name="location"&gt;
					${templatePath}/${themesName}/</xsl:text><xsl:value-of select="substring(../@name,2)"></xsl:value-of><xsl:text>/</xsl:text><xsl:value-of select="@name"></xsl:value-of><xsl:text>/customShow.html
				&lt;/param&gt;
			&lt;/result&gt;
		&lt;/action&gt;</xsl:text>
		
		</xsl:if>
	</xsl:for-each>
	
	
	<xsl:text>
	&lt;/package&gt;
&lt;/struts&gt;</xsl:text>
		
		
	</xsl:template>
</xsl:stylesheet>