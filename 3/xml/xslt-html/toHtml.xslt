<?xml version="1.0" encoding="UTF-8"?>
<!-- Transformation of data-2.xml to HTML document -->
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">

    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="books">
        <html>
            <head>
                <title>Books</title>
            </head>
            <body>
            <h1>Library Books</h1>
    <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="book">
                <h3><xsl:value-of select="name/text()"/></h3>
                <p>
                    <ul>
                        <li>ISBN: <xsl:value-of select="ISBN/text()"/></li>
                        <li>Author: <xsl:value-of select="fn:string-join(author/givenName/text(), ' ')"/>&#160;<xsl:value-of select="author/familyName/text()"/></li>
                        <li>Language: <xsl:value-of select="language/name/text()"/></li>
                        <li>Genre: <xsl:value-of select="inGenre/name/text()"/></li>
                        <li>Keywords: <xsl:value-of select="fn:string-join(keyWord/text(), ', ')"/></li>
                        <xsl:variable name="book-leases" select="itemOffered"/>
                        <li># of book leases: <xsl:value-of select="count($book-leases)"/></li>
                        <li>Book leases with Library IDs: 
                            <xsl:choose>
                                <xsl:when test="$book-leases">
                                    <ul>
                                    <xsl:for-each select="$book-leases">
                                        <li><xsl:value-of select="@id"/> [<xsl:value-of select="makesOffer/@id"/>]</li>
                                    </xsl:for-each>
                                    </ul>
                                </xsl:when>
                                <xsl:otherwise>
                                    [No Book Leases]
                                </xsl:otherwise>
                            </xsl:choose>
                        </li>
                    </ul>
                </p>
    </xsl:template>
</xsl:stylesheet>
