<?xml version="2.0" encoding="UTF-8" ?>
<xsl:stylesheet version = "2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:template match="hash">
    <xsl:apply-templates/>
</xsl:template

<xsl:template match="steps">
    <xsl:if test="not(@nil)">
        <ol>
            <xsl:apply-templates/>
        </ol>
    </xsl:if>
</xsl:template>
<xsl:template match="step">
    <li>
        <xsl:apply-templates/>
    </li>
</xsl:template>
<xsl:template match="value">
    <xsl:if test="not(@nil)">
        <p id="response">
            Response: <xsl:apply-templates/>
        </p>
    </xsl:if>
</xsl:template>
<xsl:template match="errors" >
    <xsl:if test="not(@nil)">
        <p id="error">
            Error! <xsl:apply-templates/>
        </p>
    </xsl:if>
</xsl:template>
</xsl:stylesheet>
