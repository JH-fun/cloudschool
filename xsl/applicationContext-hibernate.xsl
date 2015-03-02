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
          http://www.springframework.org/schema/aop/spring-aop-3.0.xsd"&gt;
	&lt;bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource"
		destroy-method="close"&gt;
		&lt;property name="driverClass"&gt;
			&lt;value&gt;</xsl:text>
		<xsl:value-of select="dataBase/@driverClass"></xsl:value-of>
			<xsl:text>&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="jdbcUrl"&gt;
			&lt;value&gt;</xsl:text>
		<xsl:value-of select="dataBase/@jdbcUrl"></xsl:value-of>
			<xsl:text>&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="user"&gt;
			&lt;value&gt;</xsl:text>
		<xsl:value-of select="dataBase/@userName"></xsl:value-of>
			<xsl:text>&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="password"&gt;
			&lt;value&gt;</xsl:text>
		<xsl:value-of select="dataBase/@passWord"></xsl:value-of>
			<xsl:text>&lt;/value&gt;
		&lt;/property&gt;
		&lt;property name="maxPoolSize"&gt;
			&lt;value&gt;</xsl:text>
		<xsl:value-of select="dataBase/@maxPoolSize"></xsl:value-of>
			<xsl:text>&lt;/value&gt;
		&lt;/property&gt;
	&lt;/bean&gt;

	&lt;!-- Hibernate SessionFactory --&gt;
	&lt;bean id="sessionFactory"
		class="org.springframework.orm.hibernate4.LocalSessionFactoryBean"&gt;
		&lt;!-- org.springframework.orm.hibernate3.LocalSessionFactoryBean --&gt;
		&lt;property name="dataSource" ref="dataSource" /&gt;
		&lt;property name="mappingResources"&gt;
			&lt;list&gt;
				&lt;value&gt;cn/crazyasp/common/rights/user/TUser.hbm.xml&lt;/value&gt;
				&lt;value&gt;cn/crazyasp/common/rights/role/TRole.hbm.xml&lt;/value&gt;
				&lt;value&gt;cn/crazyasp/common/rights/role/TResource.hbm.xml&lt;/value&gt;
				&lt;value&gt;cn/crazyasp/common/operationlog/TOperationLog.hbm.xml&lt;/value&gt;
				&lt;value&gt;cn/canetwork/project/</xsl:text>
			<xsl:value-of select="name/text()"></xsl:value-of>
				<xsl:text>/hbm/pojo_</xsl:text>
			<xsl:value-of select="name/text()"></xsl:value-of>
				<xsl:text>.hbm.xml&lt;/value&gt;
			&lt;/list&gt;
		&lt;/property&gt;
		&lt;property name="hibernateProperties"&gt;
			&lt;props&gt;
				&lt;prop key="hibernate.dialect"&gt;org.hibernate.dialect.PostgreSQLDialect&lt;/prop&gt;
				&lt;prop key="hibernate.show_sql"&gt;true&lt;/prop&gt;
				&lt;prop key="hibernate.hbm2ddl.auto"&gt;update&lt;/prop&gt;
				&lt;prop key="hibernate.generate_statistics"&gt;false&lt;/prop&gt;
				&lt;prop key="connection.useUnicode"&gt;true&lt;/prop&gt;
				&lt;prop key="connection.characterEncoding"&gt;UTF-8&lt;/prop&gt;
			&lt;/props&gt;
		&lt;/property&gt;
		&lt;!-- &lt;property name="eventListeners"&gt; &lt;map&gt; &lt;entry key="merge"&gt; &lt;bean class="org.hibernate.event.internal.DefaultMergeEventListener"/&gt; 
			&lt;/entry&gt; &lt;/map&gt; &lt;/property&gt; --&gt;
	&lt;/bean&gt;

	&lt;!-- Transaction manager for a single Hibernate SessionFactory (alternative 
		to JTA) --&gt;
	&lt;bean id="transactionManager"
		class="org.springframework.orm.hibernate4.HibernateTransactionManager"&gt;
		&lt;property name="sessionFactory" ref="sessionFactory" /&gt;
	&lt;/bean&gt;
	&lt;tx:advice id="txAdvice" transaction-manager="transactionManager"&gt;
		&lt;tx:attributes&gt;
			&lt;tx:method name="save*" propagation="REQUIRED" /&gt;
			&lt;tx:method name="add*" propagation="REQUIRED" /&gt;
			&lt;tx:method name="create*" propagation="REQUIRED" /&gt;
			&lt;tx:method name="insert*" propagation="REQUIRED" /&gt;
			&lt;tx:method name="update*" propagation="REQUIRED" /&gt;
			&lt;tx:method name="merge*" propagation="REQUIRED" /&gt;
			&lt;tx:method name="del*" propagation="REQUIRED" /&gt;
			&lt;tx:method name="remove*" propagation="REQUIRED" /&gt;
			&lt;tx:method name="put*" propagation="REQUIRED" /&gt;
			&lt;tx:method name="get*" propagation="REQUIRED" read-only="true" /&gt;
			&lt;tx:method name="count*" propagation="REQUIRED" read-only="true" /&gt;
			&lt;tx:method name="find*" propagation="REQUIRED" read-only="true" /&gt;
			&lt;tx:method name="list*" propagation="REQUIRED" read-only="true" /&gt;
			&lt;tx:method name="*" propagation="REQUIRED" read-only="true" /&gt;
		&lt;/tx:attributes&gt;
	&lt;/tx:advice&gt;
	&lt;aop:config expose-proxy="true" proxy-target-class="true"&gt;
		&lt;aop:pointcut id="txPointcut" expression="execution(* cn..*Option.*(..))" /&gt;
		&lt;aop:advisor advice-ref="txAdvice" pointcut-ref="txPointcut" /&gt;
	&lt;/aop:config&gt;
&lt;/beans&gt;
		</xsl:text>
	</xsl:template>
</xsl:stylesheet>