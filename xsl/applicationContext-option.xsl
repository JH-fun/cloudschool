<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"> 
	
	<xsl:output method="text" />
	
	<xsl:template match="/">
		<xsl:apply-templates select="project"></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="project">
		<xsl:text>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tx="http://www.springframework.org/schema/tx"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xsi:schemaLocation="  
          http://www.springframework.org/schema/beans  
          http://www.springframework.org/schema/beans/spring-beans-3.0.xsd  
       http://www.springframework.org/schema/tx  
       http://www.springframework.org/schema/tx/spring-tx-3.0.xsd  
          http://www.springframework.org/schema/aop  
          http://www.springframework.org/schema/aop/spring-aop-3.0.xsd"&gt;</xsl:text>

		<xsl:for-each select="//pojo">
		
		<xsl:text>
	&lt;bean id="</xsl:text>
		<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
		<xsl:text>Option" class="</xsl:text><xsl:value-of select="@daopackage"></xsl:value-of><xsl:text>.</xsl:text><xsl:value-of select="@daoname"></xsl:value-of><xsl:text>"&gt;
		&lt;property name="option" ref="tableoption"&gt;&lt;/property&gt;
		&lt;/bean&gt;</xsl:text>
		<xsl:text>
	&lt;bean id="deal</xsl:text>
		<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
		<xsl:text>Action" class="</xsl:text><xsl:value-of select="@actionclasspackage"></xsl:value-of><xsl:text>.</xsl:text><xsl:value-of select="@actionclassname"></xsl:value-of><xsl:text>" scope="request" parent="dealAction"&gt;
		&lt;property name="option" ref="</xsl:text>
		<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
		<xsl:text>Option" /&gt;
		&lt;property name="pojo" ref="</xsl:text>
		<xsl:value-of select="lower-case(substring(@name,1,1))"></xsl:value-of>
		<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
		<xsl:text>" /&gt;
	&lt;/bean&gt;</xsl:text>
		</xsl:for-each>
	
		<xsl:for-each select="//property/relation[@er-type='many_to_many_to' or @er-type='many_to_many_from']">
			<xsl:text>
	&lt;bean id="deal</xsl:text>
			<xsl:value-of select="substring(../../@name,2,string-length(../../@name))"></xsl:value-of>
			<xsl:call-template name="getPojoName">
				<xsl:with-param name="pojoClassName" select="@pojo"></xsl:with-param>
			</xsl:call-template>
			<xsl:text>Action"
		class="cn.crazyasp.common.DealManyToManyAction"
		scope="request" parent="dealAction"&gt;
		&lt;property name="toPojo" ref="t</xsl:text>
			<xsl:call-template name="getPojoName">
				<xsl:with-param name="pojoClassName" select="@pojo"></xsl:with-param>
			</xsl:call-template>
			<xsl:text>" /&gt;
		&lt;property name="Pojo" ref="t</xsl:text>
			<xsl:value-of select="substring(../../@name,2,string-length(../../@name))"></xsl:value-of>
			<xsl:text>" /&gt;
	&lt;/bean&gt;
			</xsl:text>
		</xsl:for-each>
		<xsl:text>
&lt;/beans&gt;</xsl:text>
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