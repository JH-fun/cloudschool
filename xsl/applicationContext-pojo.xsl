<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"> 
	
	<xsl:output method="text" />
	
	<xsl:template match="/">
		<xsl:apply-templates select="project"></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="project">
		<xsl:text>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:tx="http://www.springframework.org/schema/tx"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xsi:schemaLocation="  
        	http://www.springframework.org/schema/beans  
          	http://www.springframework.org/schema/beans/spring-beans-3.0.xsd  
       		http://www.springframework.org/schema/tx  
       		http://www.springframework.org/schema/tx/spring-tx-3.0.xsd  
          	http://www.springframework.org/schema/aop  
          	http://www.springframework.org/schema/aop/spring-aop-3.0.xsd"&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
		<xsl:apply-templates select="pojos//pojo"></xsl:apply-templates>
		<xsl:text>&lt;/beans&gt;</xsl:text>
	</xsl:template>
	
	<xsl:template match="pojos//pojo">
		<xsl:variable name="length" select="string-length(@name)"/>
		<xsl:text>	&lt;bean id="</xsl:text>
		<xsl:value-of select="lower-case(substring(@name,1,1))"></xsl:value-of>
		<xsl:value-of select="substring(@name,2,$length)"></xsl:value-of>
		<xsl:text>" class="</xsl:text>
		<xsl:value-of select="@package"></xsl:value-of>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="@name"></xsl:value-of>
		<xsl:text>" scope="prototype"&gt;</xsl:text>
		<xsl:apply-templates select="property"></xsl:apply-templates>
		<xsl:text>&lt;/bean&gt;</xsl:text><xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
	</xsl:template>
	
	<xsl:template match="property">
		<xsl:apply-templates select="relation"></xsl:apply-templates>
	</xsl:template>

	<xsl:template match="relation">
		<xsl:choose>
			<xsl:when test="@er-type='many_to_one' or @er-type='one_to_one_to'">
				<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
				<xsl:text>		&lt;property name="</xsl:text>
				<xsl:value-of select="../@name"></xsl:value-of>
				<xsl:text>" ref="</xsl:text>
				<xsl:call-template name="getPojoName">
            				<xsl:with-param name="pojoClassName" select="@pojo"/>
				</xsl:call-template>
				<xsl:text>"&gt;&lt;/property&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
				<xsl:text>	</xsl:text>
			</xsl:when>
		</xsl:choose>
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
				<xsl:value-of select="lower-case(substring($pojoClassName,1,1))"></xsl:value-of>
				<xsl:value-of select="substring($pojoClassName,2,string-length($pojoClassName))"></xsl:value-of>			
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>