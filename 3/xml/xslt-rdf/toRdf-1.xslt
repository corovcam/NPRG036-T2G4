<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://mff.cuni.cz/NPRG036-T2G4/</xsl:variable>
    
    <xsl:template match="libraries">@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix schema: &lt;http://schema.org/&gt; .
@prefix dbpedia: &lt;http://dbpedia.org/ontology/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
    <xsl:apply-templates select="library/makesOffer"/>
    <xsl:apply-templates select="library"/>
    </xsl:template>

    <xsl:template match="library/makesOffer">
&lt;<xsl:copy-of select="$prefix"/>lease-offer/<xsl:value-of select="@id"/>&gt; a schema:OfferForLease ;
    <xsl:apply-templates select="sku"/>
    <xsl:apply-templates select="availability"/>
    <xsl:apply-templates select="availabilityStarts"/>
    <xsl:apply-templates select="availabilityEnds"/>
    <xsl:apply-templates select="itemOffered"/>
    </xsl:template>
    <xsl:template match="sku">
    schema:sku &quot;<xsl:value-of select="text()"/>&quot;@en ;
    </xsl:template>
    <xsl:template match="availability">
    schema:availability schema:<xsl:value-of select="text()"/> ;
    </xsl:template>
    <xsl:template match="availabilityStarts">
    schema:availabilityStarts &quot;<xsl:value-of select="text()"/>&quot;^^xsd:date ;
    </xsl:template>
    <xsl:template match="availabilityEnds">
    schema:availabilityEnds &quot;<xsl:value-of select="text()"/>&quot;^^xsd:date ;
    </xsl:template>
    <xsl:template match="itemOffered">
    schema:itemOffered &lt;<xsl:copy-of select="$prefix"/>book/<xsl:value-of select="@id"/>&gt; .
    </xsl:template>

    <xsl:template match="library">
&lt;<xsl:copy-of select="$prefix"/>library/<xsl:value-of select="@id"/>&gt; a schema:Library ;
    <xsl:apply-templates select="name"/>
    <xsl:apply-templates select="emailAdress"/>
    <xsl:call-template name="offerIRIs"/>
    <xsl:apply-templates select="url"/>
    </xsl:template>
    <xsl:template match="name">
    schema:name &quot;<xsl:value-of select="text()"/>&quot;@<xsl:value-of select="../@xml:lang"/> ;
    </xsl:template>
    <xsl:template match="emailAdress">
    schema:email &lt;mailto:<xsl:value-of select="text()"/>&gt; ;
    </xsl:template>
    <xsl:template name="offerIRIs">
    <xsl:for-each select="makesOffer">
    schema:makesOffer &lt;<xsl:copy-of select="$prefix"/>lease-offer/<xsl:value-of select="@id"/>&gt; ;
    </xsl:for-each>
    </xsl:template>
    <xsl:template match="url">
    schema:url &quot;<xsl:value-of select="text()"/>&quot;^^xsd:anyURI .
    </xsl:template>
</xsl:stylesheet>
