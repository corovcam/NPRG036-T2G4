<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://mff.cuni.cz/NPRG036-T2G4/</xsl:variable>
    
    <xsl:template match="languages">@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix schema: &lt;http://schema.org/&gt; .
@prefix dbpedia: &lt;http://dbpedia.org/ontology/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
    <xsl:apply-templates select="language"/>
    </xsl:template>

    <xsl:template match="language">
&lt;<xsl:copy-of select="$prefix"/>language/<xsl:value-of select="@id"/>&gt; a schema:Language ;
    <xsl:apply-templates select="name"/>
    <xsl:apply-templates select="description"/>
    <xsl:apply-templates select="tag"/>
    </xsl:template>
    <xsl:template match="name">
    schema:name &quot;<xsl:value-of select="text()"/>&quot;@en ;
    </xsl:template>
    <xsl:template match="description">
    schema:description &quot;<xsl:value-of select="text()"/>&quot;@en ;
    </xsl:template>
    <xsl:template match="tag">
    schema:alternateName &quot;<xsl:value-of select="text()"/>&quot;@en .
    </xsl:template>
    <xsl:template match="text()" mode="#all"/>
</xsl:stylesheet>
