<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"> 
	
	<xsl:output method="text" />
	
	<xsl:template match="/">
		<xsl:apply-templates select="project"></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="project">
		<xsl:text>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
	"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd"&gt;
&lt;hibernate-mapping&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
		<xsl:apply-templates select="pojos//pojo"></xsl:apply-templates>
		<xsl:text>&lt;/hibernate-mapping&gt;</xsl:text>
	</xsl:template>
	
	<xsl:template match="pojos//pojo">
		<xsl:text>	&lt;class name="</xsl:text>
		<xsl:value-of select="@package"></xsl:value-of>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="@name"></xsl:value-of>
		<xsl:text>" table="</xsl:text>
		<xsl:value-of select="lower-case(@name)"></xsl:value-of>
		<xsl:text>"&gt;</xsl:text>	
		<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
		<xsl:text>		&lt;id name="id" column="LogonId" type="long" length="20"&gt;
			&lt;generator class="native" /&gt;
		&lt;/id&gt;
		&lt;property name="name" column="name" type="string" /&gt;
		&lt;property name="authorName" column="authorName" type="string" /&gt;
		&lt;property name="inTime" column="inTime" type="java.util.Date" /&gt;
		&lt;property name="updateTime" column="updateTime" type="java.util.Date" /&gt;
		&lt;property name="order" column="aorder" type="string" /&gt;
		&lt;property name="delete" column="isdelete" type="boolean" /&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
		<xsl:apply-templates select="property"></xsl:apply-templates>

		<xsl:text>	&lt;/class&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
	</xsl:template>

	<xsl:template match="property">
		<xsl:choose>
			<xsl:when test="relation/@er-type='one_to_many'">
				<xsl:text>		&lt;set name="</xsl:text>
				<xsl:value-of select="@name"></xsl:value-of>
				<xsl:text>" cascade="</xsl:text>
				<xsl:value-of select="relation/@cascade"></xsl:value-of>
				<xsl:text>"&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
				<xsl:text>			&lt;key column="</xsl:text>
				<xsl:value-of select="relation/@pojo-property"></xsl:value-of>
				<xsl:text>"/&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
				<xsl:text>			&lt;one-to-many class="</xsl:text>
				<xsl:value-of select="relation/@pojo"></xsl:value-of>
				<xsl:text>" /&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
				<xsl:text>		&lt;/set&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
			</xsl:when>

			<xsl:when test="relation/@er-type='many_to_one'">
				<xsl:text>		&lt;many-to-one name="</xsl:text>
				<xsl:value-of select="@name"></xsl:value-of>
				<xsl:text>" column="</xsl:text>
				<xsl:value-of select="@name"></xsl:value-of>
				<xsl:text>" class="</xsl:text>
				<xsl:value-of select="relation/@pojo"></xsl:value-of>
				<xsl:text>" /&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
			</xsl:when>
			
			<xsl:when test="relation/@er-type='one_to_one_from'">
				<xsl:text>		&lt;one-to-one name="</xsl:text>
				<xsl:value-of select="@name"></xsl:value-of>
				<xsl:text>" cascade="</xsl:text>
				<xsl:value-of select="relation/@cascade"></xsl:value-of>
				<xsl:text>" property-ref="</xsl:text>
				<xsl:value-of select="relation/@pojo-property"></xsl:value-of>
				<xsl:text>"
			class="</xsl:text>
				<xsl:value-of select="relation/@pojo"></xsl:value-of>
				<xsl:text>" /&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
			</xsl:when>
			
			<xsl:when test="relation/@er-type='one_to_one_to'">
				<xsl:text>		&lt;many-to-one name="</xsl:text>
				<xsl:value-of select="@name"></xsl:value-of>
				<xsl:text>" cascade="</xsl:text>
				<xsl:value-of select="relation/@cascade"></xsl:value-of>
				<xsl:text>"
				class="</xsl:text>
				<xsl:value-of select="relation/@pojo"></xsl:value-of>
				<xsl:text>"
				column="</xsl:text>
				<xsl:value-of select="@name"></xsl:value-of>
				<xsl:text>" unique="true" /&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
			</xsl:when>
			
			<xsl:when test="relation/@er-type='many_to_many_to' or relation/@er-type='many_to_many_from'">
				<xsl:text>		&lt;set name="</xsl:text>
				<xsl:value-of select="@name"></xsl:value-of>
				<xsl:text>" table="</xsl:text>
				<xsl:call-template name="getThirdTableName">
					<xsl:with-param name="erType" select="relation/@er-type"></xsl:with-param>
					<xsl:with-param name="thisName" select="../@name"></xsl:with-param>
					<xsl:with-param name="thatName" select="relation/@pojo"></xsl:with-param>
				</xsl:call-template>
				<xsl:text>" cascade="</xsl:text>
				<xsl:value-of select="relation/@cascade"></xsl:value-of>
				<xsl:text>"&gt;
			&lt;key&gt;
				&lt;column name="</xsl:text>
				<xsl:value-of select="lower-case(substring(../@name,2,1))"></xsl:value-of>
				<xsl:value-of select="substring(../@name,3,string-length(../@name))"></xsl:value-of>
				<xsl:text>_id"/&gt;
			&lt;/key&gt;
			&lt;many-to-many column="</xsl:text>
                <xsl:call-template name="getPojoName">
                	<xsl:with-param name="pojoClassName" select="relation/@pojo"></xsl:with-param>
                </xsl:call-template>
                <xsl:text>_id" class="</xsl:text>
                <xsl:value-of select="relation/@pojo"></xsl:value-of>
                <xsl:text>"/&gt;
		&lt;/set&gt;
				</xsl:text>
				<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
			</xsl:when>

			<xsl:otherwise>
				<xsl:text>		&lt;property name="</xsl:text>
				<xsl:value-of select="@name"></xsl:value-of>
				<xsl:text>" column="</xsl:text>
				<xsl:value-of select="@name"></xsl:value-of>
				<xsl:text>" type="</xsl:text>
				<xsl:value-of select="@type"></xsl:value-of>
				<xsl:text>" /&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
			</xsl:otherwise>	
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="getThirdTableName">
		<xsl:param name="erType"></xsl:param>
		<xsl:param name="thisName"></xsl:param>
		<xsl:param name="thatName"></xsl:param>
		
		<xsl:choose>
			<xsl:when test="$erType='many_to_many_from'">
				<xsl:value-of select="lower-case(substring($thisName,2,1))"></xsl:value-of>
				<xsl:value-of select="substring($thisName,3,string-length($thisName))"></xsl:value-of>
				<xsl:text>_</xsl:text>
				<xsl:call-template name="getPojoName">
					<xsl:with-param name="pojoClassName" select="$thatName"></xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$erType='many_to_many_to'">
				<xsl:call-template name="getPojoName">
					<xsl:with-param name="pojoClassName" select="$thatName"></xsl:with-param>
				</xsl:call-template>
				<xsl:text>_</xsl:text>
				<xsl:value-of select="lower-case(substring($thisName,2,1))"></xsl:value-of>
				<xsl:value-of select="substring($thisName,3,string-length($thisName))"></xsl:value-of>
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
				<xsl:value-of select="lower-case(substring($pojoClassName,2,1))"></xsl:value-of>
				<xsl:value-of select="substring($pojoClassName,3,string-length($pojoClassName))"></xsl:value-of>			
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>