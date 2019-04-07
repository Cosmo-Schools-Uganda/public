<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
    <xsl:template match="/note">

      <html>
        <head>
               
                </head>

        <body>

          <div class="well-sm">

            <p>
              <xsl:value-of select="messsage"/>
            </p>
             
            
            
          </div>

        </body>
      </html>

    </xsl:template>
</xsl:stylesheet>
