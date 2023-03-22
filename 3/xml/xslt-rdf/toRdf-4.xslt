<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://mff.cuni.cz/NPRG036-T2G4/</xsl:variable>
    
    <xsl:template match="people">@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix schema: &lt;http://schema.org/&gt; .
@prefix dbpedia: &lt;http://dbpedia.org/ontology/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
    <xsl:apply-templates select="person"/>
    </xsl:template>

    <xsl:template match="person">
&lt;<xsl:copy-of select="$prefix"/>author/<xsl:value-of select="@id"/>&gt; a schema:Person ;
    <xsl:apply-templates select="familyName"/>
    <xsl:apply-templates select="givenName"/>
    <xsl:apply-templates select="birthDate"/>
    <xsl:apply-templates select="language"/>
    </xsl:template>
    <xsl:template match="familyName">
    schema:familyName &quot;<xsl:value-of select="text()"/>&quot;@<xsl:value-of select="../@xml:lang"/> ;
    </xsl:template>
    <xsl:template match="givenName">
    schema:givenName &quot;<xsl:value-of select="text()"/>&quot;@<xsl:value-of select="../@xml:lang"/> ;
    </xsl:template>
    <xsl:template match="birthDate">
    schema:birthDate &quot;<xsl:value-of select="text()"/>&quot;^^xsd:date ;
    </xsl:template>
    <xsl:template match="language">
    schema:knowsLanguage &lt;<xsl:copy-of select="$prefix"/>language/<xsl:value-of select="@id"/>&gt; .
    </xsl:template>
    <xsl:template match="text()" mode="#all"/>
</xsl:stylesheet>
