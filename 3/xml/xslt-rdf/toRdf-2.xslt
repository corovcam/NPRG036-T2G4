<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://mff.cuni.cz/NPRG036-T2G4/</xsl:variable>
    
    <xsl:template match="books">@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix schema: &lt;http://schema.org/&gt; .
@prefix dbpedia: &lt;http://dbpedia.org/ontology/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
    <xsl:apply-templates select="book"/>
    </xsl:template>

    <xsl:template match="book">
&lt;<xsl:copy-of select="$prefix"/>book/<xsl:value-of select="@id"/>&gt; a schema:Book ;
    <xsl:apply-templates select="ISBN"/>
    <xsl:apply-templates select="name"/>
    <xsl:apply-templates select="keywords"/>
    <xsl:apply-templates select="author"/>
    <xsl:apply-templates select="language"/>
    <xsl:apply-templates select="book"/>
    <xsl:apply-templates select="inGenre"/>
    </xsl:template>
    <xsl:template match="ISBN">
    schema:isbn &quot;<xsl:value-of select="text()"/>&quot;@en ;
    </xsl:template>
    <xsl:template match="name">
    schema:name &quot;<xsl:value-of select="text()"/>&quot;@<xsl:value-of select="../@xml:lang"/> ;
    <xsl:if test="../book">
    schema:name &quot;<xsl:value-of select="../book/name/text()"/>&quot;@<xsl:value-of select="../book/@xml:lang"/> ;
    </xsl:if>
    </xsl:template>
    <xsl:template match="keywords">
    schema:keywords &quot;<xsl:value-of select="text()"/>&quot;@en ;
    </xsl:template>
    <xsl:template match="author">
    schema:author &lt;<xsl:copy-of select="$prefix"/>author/<xsl:value-of select="@id"/>&gt; ;
    </xsl:template>
    <xsl:template match="language">
    schema:inLanguage &lt;<xsl:copy-of select="$prefix"/>language/<xsl:value-of select="@id"/>&gt; ;
    </xsl:template>
    <xsl:template match="//book/book">
    schema:translationOfWork &lt;<xsl:copy-of select="$prefix"/>book/<xsl:value-of select="@id"/>&gt; ;
    </xsl:template>
    <xsl:template match="inGenre">
    schema:genre &lt;<xsl:copy-of select="$prefix"/>literary-genre/<xsl:value-of select="@id"/>&gt; .
    </xsl:template>
    <xsl:template match="text()" mode="#all"/>
</xsl:stylesheet>
