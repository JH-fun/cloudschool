<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="2.0">

	<xsl:output method="text" />

	<xsl:param name="daoId" />
	<xsl:variable name="daoPath" select="//dao[@id=$daoId]" />

	<xsl:template match="/">
		<xsl:call-template name="node"></xsl:call-template>
	</xsl:template>

	<xsl:template name="node">
		<xsl:text>package </xsl:text>
		<xsl:value-of select="$daoPath/@package"></xsl:value-of>
		<xsl:text>;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import cn.crazyasp.common.ITObject;
import cn.crazyasp.common.TableOption;
import </xsl:text><xsl:value-of select="$daoPath/@pojopackage"></xsl:value-of><xsl:text>.</xsl:text><xsl:value-of select="$daoPath/@pojoname"></xsl:value-of><xsl:text>;</xsl:text>

<xsl:text>
/**
  * </xsl:text>
		<xsl:value-of select="$daoPath/@name"></xsl:value-of>
		<xsl:text>
  *    		
  * @copyright 天津华网畅达科技有限公司 canetwork.cn:8080 www.canetworkcom@163.com
  */
public class </xsl:text>
		<xsl:value-of select="$daoPath/@name"></xsl:value-of>
		<xsl:text> extends TableOption implements I</xsl:text>
		<xsl:value-of select="$daoPath/@name"></xsl:value-of>
		<xsl:text>{
		/**
		 * 根据pojo对象里的条件查找数据
		 */
		 public List&lt;ITObject&gt; select</xsl:text>
		<xsl:value-of select="replace($daoPath/@name,'Option','')"></xsl:value-of>
		<xsl:text>(ITObject pojo) {
		 	StringBuilder hql = new StringBuilder("from </xsl:text>
		<xsl:value-of select="$daoPath/@pojoname"></xsl:value-of>
		<xsl:text> as t where 1 = 1");
		        Session session = this.getSessionFactory().getCurrentSession();
		        if (pojo.getName() != null &amp;&amp; !("".equals(pojo.getName()))) {
				hql.append(" and t.name like :name");
			}
		</xsl:text>
			<xsl:for-each select="$daoPath/fuZaChaXun//property">
			<xsl:text>
			if (((</xsl:text> 
			<xsl:value-of select="$daoPath/@pojoname"></xsl:value-of>
			<xsl:text>)pojo).get</xsl:text> 
			<xsl:value-of select="upper-case(substring(@name,1,1))"></xsl:value-of>
			<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
			<xsl:text>() != null &amp;&amp; !("".equals(((</xsl:text> <xsl:value-of select="$daoPath/@pojoname"></xsl:value-of>
			<xsl:text>)pojo).get</xsl:text><xsl:value-of select="upper-case(substring(@name,1,1))"></xsl:value-of>
			<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
			<xsl:text>()))) {</xsl:text>
			<xsl:text>
			     hql.append(" and t.</xsl:text><xsl:value-of select="@name"></xsl:value-of>
			<xsl:text> like :</xsl:text><xsl:value-of select="@name"></xsl:value-of><xsl:text>");</xsl:text>
			<xsl:text>
			}</xsl:text>
			</xsl:for-each>
			<xsl:text>
			hql.append(" order by t.id desc");
			// TODO 将条件拼接到hql里
			Query query = session.createQuery(hql.toString());
			if (pojo.getName() != null &amp;&amp; !("".equals(pojo.getName()))) {
				query.setString("name", "%" + pojo.getName() + "%");
			}
			</xsl:text>
			<xsl:for-each select="$daoPath/fuZaChaXun//property">
			<xsl:text>
			if (((</xsl:text> 
			<xsl:value-of select="$daoPath/@pojoname"></xsl:value-of>
			<xsl:text>)pojo).get</xsl:text> 
			<xsl:value-of select="upper-case(substring(@name,1,1))"></xsl:value-of>
			<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
			<xsl:text>() != null &amp;&amp; !("".equals(((</xsl:text> <xsl:value-of select="$daoPath/@pojoname"></xsl:value-of>
			<xsl:text>)pojo).get</xsl:text><xsl:value-of select="upper-case(substring(@name,1,1))"></xsl:value-of>
			<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
			<xsl:text>()))) {</xsl:text>
			<xsl:text>
			     query.setString("</xsl:text><xsl:value-of select="@name"></xsl:value-of>
			<xsl:text>", "%" + ((</xsl:text>
			<xsl:value-of select="$daoPath/@pojoname"></xsl:value-of>
			<xsl:text>)pojo).get</xsl:text> 
			<xsl:value-of select="upper-case(substring(@name,1,1))"></xsl:value-of>
			<xsl:value-of select="substring(@name,2,string-length(@name))"></xsl:value-of>
			<xsl:text>() + "%");
			}</xsl:text>
			</xsl:for-each>
			<xsl:text>
			return query.list();
		}</xsl:text>
	<xsl:for-each select="$daoPath/DaoMethod">
	<xsl:variable name="ArgsSize" select="@ArgsSize" />
	<xsl:if test="@CustomSearchId">
	<xsl:text>
	
	 	public List&lt;ITObject&gt; </xsl:text><xsl:value-of select="@name"></xsl:value-of>
	 <xsl:text>(</xsl:text>
	 <xsl:for-each select="customArgs">
	 <xsl:value-of select="@leiXing"></xsl:value-of><xsl:text> </xsl:text><xsl:value-of select="@name"></xsl:value-of>
	 <xsl:if test="position() &lt; $ArgsSize">
	 <xsl:text>,</xsl:text>
	 </xsl:if>
	</xsl:for-each>
	<xsl:text>)  {
			String hql = "</xsl:text> <xsl:value-of select="@CustomSearchYuJu"></xsl:value-of><xsl:text>";
			Session session = this.getSessionFactory().getCurrentSession();
			Query query = session.createQuery(hql);</xsl:text>
			<xsl:for-each select="customArgs">
			<xsl:text>
			query.set</xsl:text>
			<xsl:if test="@leiXing = 'int'">
			<xsl:text>Integer("</xsl:text></xsl:if>
			<xsl:if test="@leiXing = 'String'">
			<xsl:text>String("</xsl:text></xsl:if>
			<xsl:if test="@leiXing = 'double'">
			<xsl:text>Double("</xsl:text></xsl:if>
			<xsl:value-of select="@name"></xsl:value-of><xsl:text>",</xsl:text><xsl:value-of select="@name"></xsl:value-of><xsl:text>);</xsl:text>
			</xsl:for-each>
			<xsl:text>
			return query.list();
			}</xsl:text>
		</xsl:if>
	</xsl:for-each><xsl:text>
}</xsl:text>
	</xsl:template>
</xsl:stylesheet>
		