<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"> 
	
	<xsl:output method="text" />
	
	<xsl:template match="/">
		<xsl:apply-templates select="project"></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="project">
		<xsl:text>&lt;#-- #页面左侧菜单 --&gt; &lt;#macro left&gt;

		&lt;table border="0" cellpadding="0" cellspacing="0" width="165" height="100%"&gt;
&lt;tr&gt;
    &lt;td background="${base}/leftimages/main_40.gif" height="28"&gt;&lt;table border="0" cellpadding="0" cellspacing="0" width="100%"&gt;
      &lt;tr&gt;
        &lt;td width="19%"&gt; &lt;/td&gt;
        &lt;td width="81%" height="20"&gt;&lt;span class="STYLE1"&gt;</xsl:text><xsl:value-of select="cname/text()"></xsl:value-of><xsl:text>菜单&lt;/span&gt;&lt;/td&gt;
      &lt;/tr&gt;
    &lt;/table&gt;&lt;/td&gt;
  &lt;/tr&gt;
    &lt;tr&gt;
    &lt;td valign="top"&gt;&lt;table align="center" border="0" cellpadding="0" cellspacing="0" width="151"&gt;
    &lt;tr&gt;
        &lt;td&gt; &lt;table border="0" cellpadding="0" cellspacing="0" width="100%"&gt;
    </xsl:text>
  <xsl:for-each select="//pojo">
  <xsl:variable name="op" select="position()"></xsl:variable>
		<xsl:text>
          &lt;tr&gt;
            &lt;td id="imgmenu</xsl:text><xsl:value-of select="$op"></xsl:value-of><xsl:text>" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(</xsl:text><xsl:value-of select="$op"></xsl:value-of><xsl:text>)" onmouseout="this.className='menu_title';" style="cursor:hand" background="${base}/leftimages/main_47.gif" height="23"&gt; &lt;table border="0" cellpadding="0" cellspacing="0" width="100%"&gt;
              &lt;tr&gt;
                &lt;td width="18%"&gt; &lt;/td&gt;
                &lt;td class="STYLE1" width="82%"&gt;</xsl:text><xsl:value-of select="@cname"></xsl:value-of><xsl:text>管理 &lt;/td&gt;
              &lt;/tr&gt;
            &lt;/table&gt; &lt;/td&gt;
          &lt;/tr&gt;
         &lt;tr&gt;
            &lt;td id="submenu</xsl:text><xsl:value-of select="$op"></xsl:value-of><xsl:text>"</xsl:text>
            <xsl:if test="$op != 1">
            <xsl:text> style="DISPLAY: none"</xsl:text>
            </xsl:if>
            <xsl:text> background="${base}/leftimages/main_51.gif"&gt;
			 &lt;div class="sec_menu"&gt;  
			&lt;table border="0" cellpadding="0" cellspacing="0" width="100%"&gt;
              &lt;tr&gt;
                &lt;td&gt; &lt;table align="center" border="0" cellpadding="0" cellspacing="0" width="90%"&gt;
                 &lt;tr&gt;
                    &lt;td width="16%" height="25"&gt; &lt;div align="center"&gt; &lt;img src="${base}/leftimages/left.gif" width="10" height="10"&gt; &lt;/div&gt; &lt;/td&gt;
                    &lt;td width="84%" height="23"&gt; &lt;table border="0" cellpadding="0" cellspacing="0" width="95%"&gt;
                        &lt;tr&gt;
                         &lt;td style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; " onmouseout="this.style.borderStyle='none'" height="20"&gt;
                          &lt;a href="${base}/goInsert</xsl:text><xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of><xsl:text>.action?MyUrl=success&amp;noneid=</xsl:text><xsl:value-of select="$op"></xsl:value-of><xsl:text>"&gt; &lt;span class="STYLE3"&gt;新建</xsl:text><xsl:value-of select="@cname"></xsl:value-of><xsl:text>&lt;/span&gt; &lt;/a&gt; &lt;/td&gt;
                        &lt;/tr&gt;
                    &lt;/table&gt;&lt;/td&gt;
                  &lt;/tr&gt;
                  &lt;tr&gt;
                    &lt;td height="23"&gt; &lt;div align="center"&gt; &lt;img src="${base}/leftimages/left.gif" width="10" height="10"&gt; &lt;/div&gt; &lt;/td&gt;
                    &lt;td height="23"&gt; &lt;table border="0" cellpadding="0" cellspacing="0" width="95%"&gt;
                        &lt;tr&gt;
                          &lt;td style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; " onmouseout="this.style.borderStyle='none'" height="20"&gt;
                          &lt;a href="getAll</xsl:text><xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of><xsl:text>.action?noneid=</xsl:text><xsl:value-of select="$op"></xsl:value-of><xsl:text>"&gt; &lt;span class="STYLE3"&gt;</xsl:text><xsl:value-of select="@cname"></xsl:value-of><xsl:text>列表 &lt;/span&gt; &lt;/a&gt; &lt;/td&gt;
                        &lt;/tr&gt;
                    &lt;/table&gt; &lt;/td&gt;
                  &lt;/tr&gt;
                  &lt;tr&gt;
                    &lt;td height="23"&gt; &lt;div align="center"&gt; &lt;img src="${base}/leftimages/left.gif" width="10" height="10"&gt; &lt;/div&gt; &lt;/td&gt;
                    &lt;td height="23"&gt; &lt;table border="0" cellpadding="0" cellspacing="0" width="95%"&gt;
                        &lt;tr&gt;
                          &lt;td style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; " onmouseout="this.style.borderStyle='none'" height="20"&gt;
                          &lt;a href="getAll</xsl:text><xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of><xsl:text>.action?MyUrl=search&amp;noneid=</xsl:text><xsl:value-of select="$op"></xsl:value-of><xsl:text>"&gt; &lt;span class="STYLE3"&gt;</xsl:text><xsl:value-of select="@cname"></xsl:value-of><xsl:text>查询 &lt;/span&gt; &lt;/a&gt; &lt;/td&gt;
                       &lt;/tr&gt;
                    &lt;/table&gt; &lt;/td&gt;
                  &lt;/tr&gt;</xsl:text>
                  <xsl:for-each select="DaoMethod">
                  <xsl:if test="@CustomSearchCName"><xsl:text>
                   &lt;tr&gt;
                    &lt;td height="23"&gt; &lt;div align="center"&gt; &lt;img src="${base}/leftimages/left.gif" width="10" height="10"&gt; &lt;/div&gt; &lt;/td&gt;
                    &lt;td height="23"&gt; &lt;table border="0" cellpadding="0" cellspacing="0" width="95%"&gt;
                        &lt;tr&gt;
                          &lt;td style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; " onmouseout="this.style.borderStyle='none'" height="20"&gt;
                          &lt;a href="getAll</xsl:text><xsl:value-of select="@name"></xsl:value-of><xsl:text>.action?MyUrl=customSearch&amp;noneid=</xsl:text><xsl:value-of select="$op"></xsl:value-of><xsl:text>"&gt; &lt;span class="STYLE3"&gt;</xsl:text><xsl:value-of select="@CustomSearchCName"></xsl:value-of><xsl:text> &lt;/span&gt; &lt;/a&gt; &lt;/td&gt;
                        &lt;/tr&gt;
                    &lt;/table&gt; &lt;/td&gt;
                  &lt;/tr&gt;</xsl:text>
                  </xsl:if>
                  </xsl:for-each>
             <xsl:text> &lt;/table&gt; &lt;/td&gt;
              &lt;/tr&gt;
              &lt;tr&gt;
                &lt;td height="5"&gt;&lt;img src="${base}/leftimages/main_52.gif" width="151" height="5"&gt; &lt;/td&gt;
             &lt;/tr&gt;
           &lt;/table&gt;&lt;/div&gt;&lt;/td&gt;
          &lt;/tr&gt;
		</xsl:text>
		</xsl:for-each>
		<xsl:text>
		&lt;/table&gt;&lt;/td&gt;
      &lt;/tr&gt;
   &lt;/table&gt;&lt;/td&gt;
  &lt;/tr&gt;
 &lt;/table&gt;
&lt;/#macro&gt;</xsl:text>
	</xsl:template>
</xsl:stylesheet>