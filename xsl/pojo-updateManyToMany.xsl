<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"> 
	
	<xsl:output method="text" />
	
	<xsl:param name="pojoId"/>
	<xsl:param name="propertyId"/>
	<xsl:variable name="pojoPath" select="//pojo[@id=$pojoId]"/>
	<xsl:variable name="propertyPath" select="//property[@id=$propertyId]"/>
	
	<xsl:template match="/">
		<xsl:call-template name="node"></xsl:call-template>	
	</xsl:template>

	<xsl:template name="node">
<xsl:text>&lt;#import "${templatePath}/xhtml/common/common.html" as crazyasp&gt; 
&lt;@crazyasp.managePage title="后台管理页面"&gt;
&lt;script type="text/javascript"&gt;
$(document).ready(function(){
	var id = document.getElementById("</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>Id").value;
	var $select = $('#select');
	
	$.ajax({
	  url: "getAll</xsl:text>
	  	<xsl:call-template name="getPojoName">
	  		<xsl:with-param name="pojoClassName" select="$propertyPath/relation/@pojo"></xsl:with-param>
	  	</xsl:call-template>
	  	<xsl:text>.action?myUrl=ajaxCheckbox&amp;pojo.name=toPropertyIds",
	  cache: false
	}).done(function(html) {
	  html = html.replace("&lt;/br&gt;","&amp;nbsp;&amp;nbsp;&amp;nbsp;");
	  $select.append(html);
	  &lt;#list pojo.</xsl:text>
	  	<xsl:value-of select="$propertyPath/@name"></xsl:value-of>
	  	<xsl:text> as item&gt;
	  	$select.find("input[value='" + ${item.id?c} + "']").click();
	  &lt;/#list&gt;
	});
});
&lt;/script&gt;

&lt;form name="insertMany2Many</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>" action="insertMany2Many</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>To</xsl:text>
		<xsl:call-template name="getPojoName">
	  		<xsl:with-param name="pojoClassName" select="$propertyPath/relation/@pojo"></xsl:with-param>
	  	</xsl:call-template>
		<xsl:text>.action?MyUrl=success" method="post"&gt;
	&lt;input style="display: none" type="hidden" name="pojo.id" id="</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>Id" value="${pojo.id}" /&gt;
    &lt;input style="display: none" type="hidden" name="pojo.inTime" value="${pojo.inTime}" /&gt; 
    &lt;input style="display: none" type="hidden" name="fromPropertyName" value="</xsl:text>
	  	<xsl:value-of select="$propertyPath/@name"></xsl:value-of>
	  	<xsl:text>" /&gt; 
	&lt;input style="display: none" type="hidden" name="toPropertyName" value="</xsl:text>
	  	<xsl:value-of select="$propertyPath/relation/@pojo-property"></xsl:value-of>
	  	<xsl:text>" /&gt;
	&lt;div class="span10" id="content"&gt;
		&lt;div class="row-fluid sortable ui-sortable"&gt;
			&lt;div class="box span12"&gt;
				&lt;div data-original-title="" class="box-header well"&gt;
					&lt;h2&gt;</xsl:text>
		<xsl:value-of select="$propertyPath/@cname"></xsl:value-of>
		<xsl:text>&lt;/h2&gt;
					&lt;a style="float: right" class="btn btn-primary" href="getAll</xsl:text>
		<xsl:value-of select="substring($pojoPath/@name,2,string-length($pojoPath/@name))"></xsl:value-of>
		<xsl:text>.action"&gt;返回&lt;/a&gt;
				&lt;/div&gt;
				&lt;div class="box-content"&gt;
					&lt;div style="margin-left: 20px;margin-bottom: 20px"&gt;
						&lt;b&gt;进行分配：&lt;/b&gt;
						&lt;div id="select" style="margin-left: 100px;"&gt;&lt;/div&gt;
					&lt;/div&gt;
					&lt;@crazyasp.formActions buttonText="确定"&gt;&lt;/@crazyasp.formActions&gt;
				&lt;/div&gt;
			&lt;/div&gt;
		&lt;/div&gt;
	&lt;/div&gt;
&lt;/form&gt;
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
