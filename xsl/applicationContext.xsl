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
          	http://www.springframework.org/schema/aop/spring-aop-3.0.xsd"&gt;
	&lt;import resource="applicationContext-hibernate.xml"/&gt;
	&lt;import resource="applicationContext-common.xml"/&gt;
	&lt;import resource="applicationContext-security.xml"/&gt; 
	&lt;import resource="applicationContext-</xsl:text>
		<xsl:value-of select="name/text()"></xsl:value-of>	
		<xsl:text>pojo.xml"/&gt; 
	&lt;import resource="applicationContext-</xsl:text>
		<xsl:value-of select="name/text()"></xsl:value-of>	
		<xsl:text>option.xml"/&gt; 
	&lt;!-- &lt;import resource="applicationContext-ws.xml"/&gt;--&gt;
	&lt;!-- common classes --&gt;
	&lt;bean id="siteConfig" class="com.crazyasp.SiteConfig"&gt;
		&lt;property name="name"&gt;
			&lt;value&gt;</xsl:text>
		<xsl:value-of select="@cname"></xsl:value-of>	
		<xsl:text>&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="url"&gt;
			&lt;value&gt;http://localhost:8080/</xsl:text>
		<xsl:value-of select="name/text()"></xsl:value-of>	
		<xsl:text>&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="path"&gt;
&lt;!-- 			&lt;value&gt;/home/samael/software/tomcat-5.5.25/webapps/staticHtml&lt;/value&gt; --&gt;
			&lt;value&gt;/home/samael/software/tomcat-5.5.25/webapps/staticHtml&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="keyWord"&gt;
			&lt;value&gt;&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="templatePath"&gt;
			&lt;value&gt;/WEB-INF/template&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="themesName"&gt;
			&lt;value&gt;xhtml&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="uploadFilePath" value="/uploadfiles" /&gt;
		&lt;property name="initdb"&gt;&lt;value&gt;false&lt;/value&gt;&lt;/property&gt;
		&lt;property name="smtpAddress"&gt;&lt;value&gt;mail.dzsport.cn&lt;/value&gt;&lt;/property&gt;
		&lt;property name="smtpUser"&gt;&lt;value&gt;samael@dzsport.cn&lt;/value&gt;&lt;/property&gt;
		&lt;property name="smtpPasswd"&gt;&lt;value&gt;cuixh&lt;/value&gt;&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="urlCoder" class="com.crazyasp.function.UrlCoder"/&gt;
	
	&lt;bean id="tableoption" class="cn.crazyasp.common.TableOptionH4"&gt;
		&lt;property name="sessionFactory"&gt;
			&lt;ref bean="sessionFactory"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="tableOption" class="cn.crazyasp.common.TableOptionH4"&gt;
		&lt;property name="sessionFactory"&gt;
			&lt;ref bean="sessionFactory"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="deallistaction" class="cn.crazyasp.common.DealListAction" parent="dealaction" scope="request"&gt;
		&lt;property name="siteConfig"&gt;
			&lt;ref bean="siteConfig"&gt;&lt;/ref&gt;
		&lt;/property&gt;
		&lt;property name="urlCoder"&gt;
			&lt;ref bean="urlCoder"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="dealListAction" class="cn.crazyasp.common.DealListAction" parent="dealaction" scope="request"&gt;
		&lt;property name="urlCoder"&gt;
			&lt;ref bean="urlCoder"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="dealaction" class="cn.crazyasp.common.DealAction"&gt;
		&lt;property name="siteConfig"&gt;
			&lt;ref bean="siteConfig"&gt;&lt;/ref&gt;
		&lt;/property&gt;
		&lt;property name="option"&gt;
			&lt;ref bean="tableoption"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="dealAction" class="cn.crazyasp.common.DealAction"&gt;
		&lt;property name="siteConfig"&gt;
			&lt;ref bean="siteConfig"/&gt;
		&lt;/property&gt;
		&lt;property name="option"&gt;
			&lt;ref bean="tableoption"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="tablelist" class="cn.crazyasp.common.TableList"&gt;
		&lt;property name="option"&gt;
			&lt;ref bean="tableoption"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="tableList" class="cn.crazyasp.common.TableList"&gt;
		&lt;property name="option"&gt;
			&lt;ref bean="tableoption"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="baseService" class="cn.crazyasp.common.BaseService"&gt;
		&lt;property name="dao"&gt;
			&lt;ref bean="tableoption"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
		
	&lt;bean id="upload" class="cn.crazyasp.common.uploadfile.Upload" parent="dealaction" scope="request"&gt;
		&lt;property name="path"&gt;
			&lt;value&gt;/home/samael/software/tomcat-5.5.25/webapps/src-HSW-successmap/uploadFiles&lt;/value&gt;	
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="groupUpload" class="cn.crazyasp.common.uploadfile.Upload" parent="dealaction" scope="request"&gt;
		&lt;property name="path"&gt;
			&lt;value&gt;/home/samael/software/tomcat-5.5.25/webapps/src-HSW-successmap/uploadFiles/group/&lt;/value&gt;	
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="uploadVedio" class="cn.crazyasp.common.uploadfile.Upload" parent="dealaction" scope="request"&gt;
		&lt;property name="path"&gt;
			&lt;value&gt;/home/samael/software/tomcat-5.5.25/webapps/src-HSW-successmap/uploadFiles/vedio/&lt;/value&gt;	
		&lt;/property&gt;
	&lt;/bean&gt;
	
	
	&lt;bean id="multiclass" class="cn.crazyasp.common.multiclass.MultiClassControl"&gt;
		&lt;property name="option"&gt;
			&lt;ref bean="tableOption"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="dealmulticlass" class="cn.crazyasp.common.multiclass.DealTMultiClass" parent="dealaction" scope="request"&gt;
		&lt;property name="control"&gt;
			&lt;ref bean="multiclass"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;!-- end of common classes --&gt;
	
	&lt;bean id="validateCode" class="com.crazyasp.function.ValidateCode" scope="request"/&gt;
	&lt;!-- Start config of user Member Score --&gt;
	&lt;!-- End config of user Member Score --&gt;
	&lt;bean id="parseString" class="com.crazyasp.function.ParseString"/&gt;
	&lt;!--Start config of user register and so on--&gt;
	&lt;!--Start config of Mail--&gt;
	&lt;bean id="mail" class="cn.crazyasp.mail.Mail" scope="request"&gt;
		&lt;property name="message"&gt;
			&lt;ref bean="mailMessage"&gt;&lt;/ref&gt;
		&lt;/property&gt;
		&lt;property name="mailSender"&gt;
			&lt;ref bean="mailSender"&gt;&lt;/ref&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="mailSender" class="org.springframework.mail.javamail.JavaMailSenderImpl"&gt;
		&lt;property name="host"&gt;
			&lt;value&gt;mail.prettystory.cn&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="javaMailProperties"&gt;
			&lt;props&gt;
			&lt;prop key="mail.smtp.auth"&gt;true&lt;/prop&gt;
			&lt;/props&gt;
		&lt;/property&gt;
		&lt;property name="username"&gt;
			&lt;value&gt;no-reply@prettystory.cn&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="password"&gt;
			&lt;value&gt;1qazxsw2&lt;/value&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;bean id="mailMessage" class="org.springframework.mail.SimpleMailMessage"&gt;
		&lt;property name="from"&gt;
			&lt;value&gt;no-reply@prettystory.cn&lt;/value&gt;
		&lt;/property&gt;
	&lt;/bean&gt;
	&lt;!--End config of mail--&gt;
	&lt;!--End config of user register and so on--&gt;
&lt;/beans&gt;</xsl:text>
	</xsl:template>
</xsl:stylesheet>