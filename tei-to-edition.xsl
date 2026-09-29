<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="tei">
  <xsl:output method="html" html-version="5" encoding="UTF-8" indent="yes"/>
  <xsl:mode on-no-match="shallow-skip"/>
  <xsl:template match="text()"><xsl:value-of select="."/></xsl:template>

  <xsl:template match="/tei:TEI">
    <html lang="en"><head>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <title><xsl:value-of select="tei:teiHeader//tei:title[@type='main'][1]"/></title>
      <link rel="icon" type="image/svg+xml" href="img/favicon.svg"/>
      
      <link rel="preconnect" href="https://fonts.googleapis.com"/>
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin"/>
      <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;500;600;700&amp;family=EB+Garamond:ital,wght@0,400;0,500;0,600;0,700;1,400;1,600&amp;display=swap" rel="stylesheet"/>
    
      <link rel="stylesheet" href="assets/theme.css?v=6"/>
      <link rel="stylesheet" href="assets/edition.css?v=6"/>
      <script src="assets/edition.js?v=6" defer="defer"/>
      <script src="assets/nav.js?v=6" defer="defer"/>
    </head>
    <body>
      <nav class="site-nav site-nav--static" aria-label="Main navigation">
        <a class="site-nav__brand" href="index.html" title="Home — Digital Lucretius"><img src="img/logo-lucretius.svg" alt="Digital Lucretius logo"/></a>
        <button class="site-nav__toggle" type="button" aria-expanded="false" aria-controls="site-nav-menu" aria-label="Toggle navigation"><span></span></button>
        <ul class="site-nav__menu" id="site-nav-menu">
          <li><a href="index.html">Home</a></li>
          <li class="site-nav__dropdown is-current">
            <button type="button" aria-expanded="false" aria-controls="site-nav-edition">Edition</button>
            <ul id="site-nav-edition">
              <li><a href="edition.html" aria-current="page">Text &amp; Apparatus</a></li>
              <li><a href="keywords.html">Keywords</a></li>
              <li><a href="scholars.html">Scholars &amp; Sources</a></li>
              <li><a href="witnesses.html">Stemma Codicum</a></li>
            </ul>
          </li>
          <li class="site-nav__dropdown">
            <button type="button" aria-expanded="false" aria-controls="site-nav-docs">Documentation</button>
            <ul id="site-nav-docs">
              <li><a href="documentation.html#project">The Project</a></li>
              <li><a href="documentation.html#the-work">The Work</a></li>
              <li><a href="documentation.html#state-of-the-art">State of the Art</a></li>
              <li><a href="documentation.html#digital-edition">The Digital Edition</a></li>
              <li><a href="documentation.html#features-limitations">Evaluation</a></li>
            </ul>
          </li>
          <li><a href="documentation.html#bibliography">Bibliography</a></li>
        </ul>
      </nav>
      <header class="masthead">
        <p class="eyebrow">Digital critical edition</p>
        <h1>De rerum natura</h1>
        <p class="subtitle">Book III: Proem (lines 1 - 93)</p>
        
        <div class="reading-guide-panel">
          <div class="tools-row-edition">
            <button type="button" data-action="translation" aria-pressed="false">Translation</button>
            <button type="button" data-action="lemmas" aria-pressed="false">Lemmatization</button>
            <button type="button" data-action="keywords" aria-pressed="false">Keywords</button>
          </div>

          <p class="guide-instructions">
          Choose your preferred reading display: toggle the facing translation, reveal dictionary headwords upon hovering over Latin words, or highlight core philosophical keywords throughout the text.
          </p>

          <p class="apparatus-intro">
          For the proem of Book III, the text of the archetype <em>Ω</em> is reconstructed from the agreement between <em>O</em> and Γ (preserved by the consensus of <em>Q</em> and <em>V</em>, hence Ω = <em>O</em>Γ [= <em>QV</em>]). Textual variants and editorial conjectures are marked by superscript reference numbers (<em style="color: var(--red, #8b1f2d);">n</em>) linked directly to the critical apparatus below.
          </p>

          <div class="guide-apparatus-structure">
            <p>The critical architecture is divided into three apparatuses accessible in the lower panel:</p>
            <ul>
              <li><strong>Apparatus criticus:</strong> records manuscript readings, humanist variants, and conjectures.</li>
              <li><strong>Testimonia:</strong> gathers ancient indirect witnesses and quotations (e.g., Lactantius, Nonius Marcellus).</li>
              <li><strong>Loci paralleli:</strong> documents internal formulaic recurrences and echoes across the poem.</li>
            </ul>
          </div>
        </div>

        <div class="tools-row-navigation">
          <a href="keywords.html" class="nav-link-btn">Explore the Keywords</a>
          <a href="scholars.html" class="nav-link-btn">Meet the Scholars</a>
          <a href="witnesses.html" class="nav-link-btn">Discover the Witnesses</a>
        </div>
      </header>
      
      <main><div class="reading-desk">
        <article class="parchment latin">
          <h2>LIBER TERTIUS</h2>
          <p class="section-label">Edidit Marcus Deufert</p>
          <div class="verse-block">
            <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='prooemium']/tei:lg[@type='poem']/tei:l"/>
          </div>
        </article>
        <aside class="parchment translation" hidden="hidden">
          <h2>Translation</h2><p class="section-label">By David R. Slavitt</p>
          <div class="verse-block">
            <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='prooemium']/tei:div[@type='translation']//tei:l" mode="translation"/>
          </div>
        </aside>
      </div></main>
      
      <aside id="apparatus" class="apparatus">
        <div class="apparatus-bar"><div role="tablist">
          <button role="tab" data-tab="critical" aria-selected="true">Apparatus criticus</button>
          <button role="tab" data-tab="fontium" aria-selected="false">Testimonia</button>
          <button role="tab" data-tab="iterati" aria-selected="false">Loci paralleli</button>
        </div><button type="button" data-action="expand-apparatus" aria-expanded="false" aria-label="Expand or collapse apparatus" title="Expand / Collapse">&#x2922;</button></div>
        <section id="critical" role="tabpanel" class="app-panel">
          <xsl:call-template name="apparatus-legend"/>
          <xsl:apply-templates select=".//tei:app[@type='critical']" mode="apparatus"/>
        </section>
        <section id="fontium" role="tabpanel" class="app-panel" hidden="hidden">
          <xsl:call-template name="apparatus-legend"><xsl:with-param name="hint" select="true()"/></xsl:call-template>
          <xsl:apply-templates select=".//tei:div[@type='apparatus-fontium']/tei:note[@type='fontium']" mode="fontium"/>
        </section>
        <section id="iterati" role="tabpanel" class="app-panel" hidden="hidden">
          <xsl:call-template name="apparatus-legend"><xsl:with-param name="hint" select="true()"/></xsl:call-template>
          <xsl:apply-templates select=".//tei:note[@type='iterati']" mode="linked-note"/>
        </section>
      </aside>
      
      <div id="lemma-popover" role="status" hidden="hidden"/>

      <footer class="edition-footer">
        <p>Project created for the course of Digital Scholarly Editing: Theory, Methods and Practice at Alma Mater Studiorum - Università di Bologna.</p>
      </footer>
    </body></html>
  </xsl:template>


  <xsl:template name="apparatus-legend">
    <xsl:param name="hint" select="false()"/>
    <div class="app-legend" aria-label="Colour legend of the apparatus">
      <span class="app-legend-title">Legend:</span>
      <span class="app-legend-item"><span class="legend-swatch archetype-swatch"/><span class="stem archetype">Ω</span> archetype</span>
      <span class="app-legend-item"><span class="legend-swatch primary-swatch"/><span class="stem primary">O Γ Q V</span> Carolingian tradition</span>
      <span class="app-legend-item"><span class="legend-swatch secondary-swatch"/><span class="stem secondary">ξ α φ L A</span> Italian (humanist) tradition</span>
      <span class="app-legend-item"><span class="legend-swatch ancient-swatch"/><span class="stem ancient">Sen. Non.</span> ancient authors</span>
      <span class="app-legend-item"><span class="legend-swatch scholar-swatch"/><span class="stem scholar">Lachmann</span> modern scholars &amp; editors</span>
      <xsl:if test="$hint">
        <span class="app-legend-hint">Click on an entry to highlight the corresponding passage in the text.</span>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template match="tei:head"><h2><xsl:apply-templates/></h2></xsl:template>
  <xsl:template match="tei:l"><p class="verse" id="{@xml:id}"><span class="line-number"><xsl:value-of select="@n"/></span><span class="verse-text"><xsl:apply-templates/></span></p></xsl:template>
  <xsl:template match="tei:l" mode="translation"><p class="verse" data-corresp="{substring-after(@corresp,'#')}"><span class="line-number"><xsl:value-of select="@n"/></span><span class="verse-text"><xsl:apply-templates/></span></p></xsl:template>
  <xsl:template match="tei:w"><span class="word" data-lemma="{@lemma}"><xsl:if test="@join"><xsl:attribute name="data-join" select="@join"/></xsl:if><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="tei:seg[@type='parallel']">
  <span class="parallel-locus" data-note="{normalize-space(replace(@corresp, '#', ''))}">
    <xsl:apply-templates/>
  </span>
  </xsl:template>
  <xsl:template match="tei:seg[@type='testimonium']"><span class="testimonium-locus" data-corresp="{substring-after(@corresp,'#')}"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="tei:seg[@type='parallel-phrase']"><em class="parallel-phrase"><xsl:apply-templates/></em></xsl:template>
  <xsl:template match="tei:seg[@type='short-reference']"><small class="short-reference"><xsl:apply-templates/></small></xsl:template>
  <xsl:template match="tei:app">
    <xsl:variable name="n" select="count(preceding::tei:app[@type='critical']) + 1"/>
    <span class="app-reading" id="reading-{$n}" data-app="app-{$n}"><xsl:apply-templates select="tei:lem/node()"/><button type="button" class="app-marker" data-app="app-{$n}" aria-label="Apri variante {$n}"><xsl:value-of select="$n"/></button></span>
  </xsl:template>
  <xsl:template match="tei:anchor"><span id="{@xml:id}" class="anchor"/></xsl:template>
  <xsl:template match="tei:app" mode="apparatus">
    <xsl:variable name="n" select="count(preceding::tei:app[@type='critical']) + 1"/>
    <article class="app-entry" id="app-{$n}" data-reading="reading-{$n}">
      <button type="button" class="app-id" data-reading="reading-{$n}" aria-label="Torna al testo"><xsl:value-of select="$n"/></button>
      <span class="app-locus">v. <xsl:value-of select="ancestor::tei:l/@n"/></span>
      <div class="app-content"><xsl:if test="tei:lem/@wit or tei:lem/@source or tei:lem/@resp"><span class="variant"><xsl:call-template name="render-evidence"><xsl:with-param name="tokens" select="tei:lem/@wit"/><xsl:with-param name="kind" select="'witness'"/></xsl:call-template><xsl:call-template name="render-evidence"><xsl:with-param name="tokens" select="tei:lem/@source"/><xsl:with-param name="kind" select="'source'"/></xsl:call-template><xsl:call-template name="render-evidence"><xsl:with-param name="tokens" select="tei:lem/@resp"/><xsl:with-param name="kind" select="'scholar'"/></xsl:call-template><em class="reading-form"><xsl:apply-templates select="tei:lem/node()"/></em></span></xsl:if>
        <xsl:for-each select="tei:rdg"><span class="variant"><xsl:text>   </xsl:text><xsl:call-template name="render-evidence"><xsl:with-param name="tokens" select="@wit"/><xsl:with-param name="kind" select="'witness'"/></xsl:call-template><xsl:call-template name="render-evidence"><xsl:with-param name="tokens" select="@source"/><xsl:with-param name="kind" select="'source'"/></xsl:call-template><xsl:call-template name="render-evidence"><xsl:with-param name="tokens" select="@resp"/><xsl:with-param name="kind" select="'scholar'"/></xsl:call-template><em class="reading-form"><xsl:apply-templates/></em></span></xsl:for-each>
        <xsl:if test="tei:note"><p class="editorial-note"><xsl:apply-templates select="tei:note/node()"/></p></xsl:if>
      </div>
    </article>
  </xsl:template>

  <xsl:template name="render-evidence">
    <xsl:param name="tokens"/>
    <xsl:param name="kind"/>
    <xsl:variable name="rootDoc" select="/*"/>

    <xsl:if test="normalize-space($tokens)">
      <xsl:for-each select="tokenize(normalize-space(replace($tokens,'#','')),'\s+')">
        <xsl:variable name="id" select="."/>
        
        <span class="evidence-group">
          <xsl:choose>
            <!-- 1. FONTI INDIRETTE ANTICHE (Lact, Non, Macr) CON POPUP E LINK -->
            <xsl:when test="$id = ('Lact', 'Lactantius', 'Non', 'Nonius', 'Nonius Marcellus', 'Macr', 'Macrobius', 'Sen', 'Seneca')">
              <xsl:variable name="targetSlug">
                <xsl:choose>
                  <xsl:when test="$id = ('Lact', 'Lactantius')">lucius-caecilius-firmianus-lactantius</xsl:when>
                  <xsl:when test="$id = ('Non', 'Nonius', 'Nonius Marcellus')">nonius-marcellus</xsl:when>
                  <xsl:when test="$id = ('Macr', 'Macrobius')">ambrosius-theodosius-macrobius</xsl:when>
                  <xsl:when test="$id = ('Sen', 'Seneca')">lucius-annaeus-seneca</xsl:when>
                  <xsl:otherwise>scholars</xsl:otherwise>
                </xsl:choose>
              </xsl:variable>

              <xsl:variable name="displayName">
                <xsl:choose>
                  <xsl:when test="$id = ('Lact', 'Lactantius')">Lactantius</xsl:when>
                  <xsl:when test="$id = ('Non', 'Nonius', 'Nonius Marcellus')">Nonius Marcellus</xsl:when>
                  <xsl:when test="$id = ('Macr', 'Macrobius')">Macrobius</xsl:when>
                  <xsl:when test="$id = ('Sen', 'Seneca')">Seneca</xsl:when>
                  <xsl:otherwise><xsl:value-of select="$id"/></xsl:otherwise>
                </xsl:choose>
              </xsl:variable>

              <a href="scholars.html#{$targetSlug}" class="stem ancient" title="View source profile">
                <xsl:choose>
                  <xsl:when test="$id = ('Lact', 'Lactantius')">
                    <xsl:attribute name="data-citation">Lactantius, Divinae Institutiones (6, 2, 6).</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = ('Non', 'Nonius', 'Nonius Marcellus')">
                    <xsl:attribute name="data-citation">Nonius Marcellus, De compendiosa doctrina.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = ('Macr', 'Macrobius')">
                    <xsl:attribute name="data-citation">Ambrosius Theodosius Macrobius, Saturnalia (6, 2, 15).</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = ('Sen', 'Seneca')">
                    <xsl:attribute name="data-citation">Lucius Annaeus Seneca, Epistulae morales ad Lucilium (110, 6).</xsl:attribute>
                  </xsl:when>
                </xsl:choose>
                <xsl:value-of select="$displayName"/>
              </a>
            </xsl:when>

            <!-- 2. STUDIOSI EDITORIALI E UMANISTI CON CITAZIONI BIBLIOGRAFICHE -->
            <xsl:when test="$kind = 'scholar' or $id = ('Lambinus', 'Heinze', 'Morel', 'MD', 'Wakefield', 'Timpanaro', 'SH', 'Marullus', 'OR', 'LACh', 'Bentley', 'Pont', 'Munro', 'CMueller', 'Cippellarius', 'Zwierlein', 'Bockemueller')">
              <xsl:variable name="targetSlug">
                <xsl:choose>
                  <xsl:when test="$id = ('Pont', 'Pontano')">giovanni-pontano</xsl:when>
                  <xsl:when test="$id = ('Lambinus', 'Lambin')">dionysius-lambinus</xsl:when>
                  <xsl:when test="$id = 'Heinze'">richard-heinze</xsl:when>
                  <xsl:when test="$id = 'Morel'">willy-morel</xsl:when>
                  <xsl:when test="$id = 'MD'">marcus-deufert</xsl:when>
                  <xsl:when test="$id = ('LACh', 'Lachmann')">karl-lachmann</xsl:when>
                  <xsl:when test="$id = 'Bentley'">richard-bentley</xsl:when>
                  <xsl:when test="$id = 'Wakefield'">gilbert-wakefield</xsl:when>
                  <xsl:when test="$id = ('OR', 'Orelli', 'Orellius')">johann-caspar-von-orelli</xsl:when>
                  <xsl:when test="$id = 'Timpanaro'">sebastiano-timpanaro</xsl:when>
                  <xsl:when test="$id = 'SH'">richard-j-shackle</xsl:when>
                  <xsl:when test="$id = 'Marullus'">michele-marullo-tarcaniota</xsl:when>
                  <xsl:when test="$id = 'Munro'">hugh-andrew-johnstone-munro</xsl:when>
                  <xsl:when test="$id = 'CMueller'">konrad-muller</xsl:when>
                  <xsl:when test="$id = 'Cippellarius'">cippellarius</xsl:when>
                  <xsl:when test="$id = 'Zwierlein'">otto-zwierlein</xsl:when>
                  <xsl:when test="$id = 'Bockemueller'">friedrich-bockemuller</xsl:when>
                  <xsl:otherwise><xsl:value-of select="lower-case(replace($id, '[^a-zA-Z0-9]+', '-'))"/></xsl:otherwise>
                </xsl:choose>
              </xsl:variable>

              <xsl:variable name="pNode" select="$rootDoc//*[local-name()='listPerson' and @type='scholars']/*[local-name()='person' and @xml:id=$id]"/>
              <xsl:variable name="scholarName" select="if ($pNode/*[local-name()='persName']/text()) then string($pNode/*[local-name()='persName'][1]) else $id"/>

              <a href="scholars.html#{$targetSlug}" class="stem scholar" title="View scholar profile">
                <xsl:choose>
                  <xsl:when test="$id = ('LACh', 'Lachmann')">
                    <xsl:attribute name="data-citation">Titi Lucreti Cari de rerum natura libri sex. Edidit Karl Lachmann. Berolini 1850.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = 'Bentley'">
                    <xsl:attribute name="data-citation">R. Bentley: Coniecturas eius ex editione Wakefieldi anni 1813 affero.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = 'Wakefield'">
                    <xsl:attribute name="data-citation">Titi Lucretii Cari de rerum natura libros sex … longe emendatiores reddidit … Gilbertus Wakefield … Londini 1796–1797.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = ('OR', 'Orelli', 'Orellius')">
                    <xsl:attribute name="data-citation">Eclogae poetarum latinorum in usum gymnasiorum. edidit Io. Casparus Orellius … Turici 1822.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = ('Lambinus', 'Lambin')">
                    <xsl:attribute name="data-citation">Titi Lucretii Cari de rerum natura libri sex. A Dionysio Lambino … emendati … Parisiis 1563/1564.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = 'Heinze'">
                    <xsl:attribute name="data-citation">T. Lucretius Carus. De rerum natura Buch III. Erklärt von Richard Heinze, Lipsiae 1897.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = 'Morel'">
                    <xsl:attribute name="data-citation">W. Morel, Zu Lukrez, Philologus 85, 1930, 227 sq.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = 'Timpanaro'">
                    <xsl:attribute name="data-citation">S. Timpanaro, Lucrezio III 1, «Philologus» 104, 1960, 147–149.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = 'SH'">
                    <xsl:attribute name="data-citation">R. J. Shackle, Notes on Lucretius, «The Classical Review» 35, 1921, 156.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = 'MD'">
                    <xsl:attribute name="data-citation">M. Deufert, Zu den gegenwärtigen Aufgaben der Lukrezkritik, «Hermes» 138, 2010, 48–69.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = 'Munro'">
                    <xsl:attribute name="data-citation">T. Lucreti Cari de rerum natura libri sex. With notes and a translation by H. A. J. Munro. Third edition revised throughout, Cantabrigiae 1873</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = 'CMueller'">
                    <xsl:attribute name="data-citation">T. Lucreti Cari de rerum natura libri sex. Edidit Konrad Müller, Turici 1975.</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$id = 'Bockemueller'">
                    <xsl:attribute name="data-citation">T. Lucreti Cari de rerum natura libri sex. Redigirt und erklärt von Friedrich Bockemüller, Stadis 1874.</xsl:attribute>
                  </xsl:when>
                </xsl:choose>
                <xsl:value-of select="$scholarName"/>
              </a>
            </xsl:when>

            <!-- 3. TESTIMONI MANOSCRITTI E SIGLE (compreso xi-mu) -->
            <xsl:otherwise>
              <xsl:variable name="wNode" select="$rootDoc//*[local-name()='witness' and @xml:id=$id]"/>
              <xsl:variable name="witnessTarget" select="if ($id = 'xi-mu' or $id = 'xi-mu-alpha') then 'xi' else $id"/>

              <a href="witnesses.html#{$witnessTarget}" 
                 class="{if ($id='Omega') then 'stem archetype' else if ($id=('O','Gamma','O1','OD','O2','O3')) then 'stem primary' else if ($id=('Q','Q1','Qa','Q2','G','V','U')) then 'stem primary' else 'stem secondary'}" 
                 title="View in Stemma Codicum">
                <xsl:choose>
                  <xsl:when test="$wNode/*[local-name()='abbr']">
                    <xsl:apply-templates select="$wNode/*[local-name()='abbr']/node()"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$id"/>
                  </xsl:otherwise>
                </xsl:choose>
              </a>
            </xsl:otherwise>
          </xsl:choose>
        </span>
        <xsl:text> </xsl:text>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <!-- Apparatus fontium: one entry per <note type="fontium">; the source link points to the
       scholars.html card whose id is the slug of the ancient author's persName -->
  <xsl:template match="tei:note[@type='fontium']" mode="fontium">
    <xsl:variable name="sourceId" select="substring-after(@source, '#')"/>
    <xsl:variable name="person" select="/tei:TEI/tei:teiHeader//tei:listPerson[@type='ancientSources']/tei:person[@xml:id = $sourceId]"/>
    <xsl:variable name="author" select="normalize-space(tei:bibl[1]/tei:author)"/>
    <article class="testimonium-entry" data-testimonium-target="{@xml:id}">
      <div class="testimonium-header">
        <span class="app-locus"><xsl:value-of select="if (contains(@n, 'sq')) then 'vv. ' else 'v. '"/><xsl:value-of select="@n"/></span>
        <span class="evidence-group">
          <a href="scholars.html#{lower-case(replace(normalize-space($person/tei:persName), '[^A-Za-z0-9]+', '-'))}" class="stem ancient" title="View source: {$author}"><xsl:value-of select="$author"/></a>
        </span>
        <span class="testimonium-desc"><xsl:apply-templates select="tei:p/node()" mode="fontium"/></span>
      </div>
    </article>
  </xsl:template>
  <xsl:template match="tei:title | tei:quote | tei:mentioned" mode="fontium"><em><xsl:apply-templates mode="fontium"/></em></xsl:template>

  <xsl:template match="tei:hi[@rend='sup']">
    <sup><xsl:apply-templates/></sup>
  </xsl:template>
  <xsl:template match="tei:note[@type='iterati']" mode="linked-note">
    <article class="linked-entry parallel-entry" data-parallel-target="{@xml:id}">
      <span class="app-locus">v. <xsl:value-of select="@n"/></span>
      <span class="parallel-desc">
        <xsl:apply-templates/>
      </span>
    </article>
  </xsl:template>
  <xsl:template match="tei:note" mode="linked-note"><article class="linked-entry" id="{@xml:id}"><xsl:for-each select="tokenize(normalize-space(@target),'\s+')"><a href="{.}" data-target="{substring-after(.,'#')}"><xsl:value-of select="substring-after(.,'#')"/></a><xsl:text> </xsl:text></xsl:for-each><span><xsl:apply-templates/></span></article></xsl:template>
  <xsl:template match="tei:term[not(@ref)]"><span class="term {@rend}"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="tei:term">
    <a href="keywords.html#{substring-after(@ref, '#')}" class="keyword-term" data-term="{substring-after(@ref, '#')}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>
</xsl:stylesheet>
