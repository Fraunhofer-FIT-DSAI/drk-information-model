# Controlled Vocabularies for Representing Enumerations

- For modeling Enumerations (ENUMs) in semantic metadata schemas (and later using them while instantiating these
  metadata models in the DRK Knowledge Graph), it would be preferable use URIs from existing controlled vocabularies (
  preferably standard-based), instead of plain string literals.
- In case there are no existing vocabularies for a given ENUM-type, new ones can be created and defined under the DRK
  IM's vocabulary namespace: `http://w3id.org/drk/vocabs/`
- Examples
    - DRK Theatrical Genres Vocabulary: [Direct link](theatrical-genres.ttl)
    - DRK Theatrical Genres Vocabulary Namespace: `http://w3id.org/drk/vocabs/theatrical-genres/`
    - Term: `http://w3id.org/drk/vocabs/theatrical-genres#Musical`

---

# Domain-agnostic Vocabularies

## Languages Vocabulary

- Name: DRK Languages Vocabulary Based on **ISO 639-1**
- Description: A controlled vocabulary for languages based on _ISO 639-1:2002, Codes for the representation of names of
  languages—Part 1_. The ISO 639-1 standard provides two-character codes for languages. This DRK vocabulary is derived
  from [LOC's languages vocabulary](https://id.loc.gov/vocabulary/iso639-1.html).
- [Link to TTL representation](languages-iso639-1.ttl)
- Namespace: `http://w3id.org/drk/vocabs/languages-iso639-1#`
- Term example: `http://w3id.org/drk/vocabs/languages-iso639-1#en` OR `lang:en`
- Usage example:

```turtle

@prefix rdf:          <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:         <http://www.w3.org/2000/01/rdf-schema#> .
@prefix drk:          <https://w3id.org/drk/ontology/> .
@prefix drkr:         <https://w3id.org/drk/resources/> .
@prefix schema:       <https://schema.org/> .
@prefix lang:         <https://w3id.org/drk/vocabs/languages-iso639-1#> .

drkr:Hedwig_and_the_Angry_Inch_Play_Augsburg
    a                 drk:PlayProduction ;
    schema:inLanguage lang:en, lang:de .

drkr:Hedwig_and_the_Angry_Inch_Event_20241228
    a                 drk:TheaterEvent ;
    schema:inLanguage lang:de .
```

- See also: Another vocabulary based on ISO
  639-1: [OMG's Languages Vocabulary](https://www.omg.org/spec/LCC/Languages/ISO639-1-LanguageCodes.ttl)

## Countries Vocabulary

- Title: OMG's **ISO 3166-1** Country Codes Vocabulary
- Description: A controlled vocabulary for countries based on _ISO 3166-1, Codes for the representation of names of
  countries and their subdivisions–Part 1: Country codes_. Together with standardized country names the ISO 3166-1
  alpha-2 and alpha-2 parts of this standard provide two-letter and three-letter country codes respectively.
- [Link to homepage](https://www.omg.org/spec/LCC/1.2/About-LCC)
- [Link to TTL representation](https://www.omg.org/spec/LCC/20211101/Countries/ISO3166-1-CountryCodes.ttl)
- Namespace: `https://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/`
- Term example: `https://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/Germany` OR `lcc-3166-1:Germany`
- Usage example:

```turtle

@prefix rdf:                   <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:                  <http://www.w3.org/2000/01/rdf-schema#> .
@prefix drk:                   <https://w3id.org/drk/ontology/> .
@prefix drkr:                  <https://w3id.org/drk/resources/> .
@prefix schema:                <https://schema.org/> .
@prefix lcc-3166-1:            <https://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/> .
@prefix lcc-3166-2-de:         <https://www.omg.org/spec/LCC/Countries/Regions/ISO3166-2-SubdivisionCodes-DE/> .

drkr:DE_Staatstheater_Augsburg
    a              schema:Organization ;
    schema:address drkr:DE_Staatstheater_Augsburg_Address .

drkr:DE_Staatstheater_Augsburg_Address
    a                      schema:PostalAddress ;
    schema:name            "Staatstheater Augsburg" ;
    schema:streetAddress   "Provinostr. 52" ;
    schema:postalCode      "86153" ;
    schema:addressLocality "Augsburg" ;
    schema:addressRegion   lcc-3166-2-de:Bayern ;
    schema:addressCountry  lcc-3166-1:Germany .
```

## Country Subdivision (States/Provinces) Vocabulary

- Title: OMG's **ISO 3166-2** Country Subdivision Region Codes Vocabulary
- Description: A controlled vocabulary for country subdivisions based on _ISO 3166-2, Codes for the representation of
  names of countries and their subdivisions – Part 2: Country subdivision code_. OMG's vocabulary homepage provides
  links to the TTL representations of subdivision codes for each country.
- [Link to homepage](https://www.omg.org/spec/LCC/1.2/About-LCC)
- For
  example: [Link to Germany's (DE) subdivision codes in TTL format](https://www.omg.org/spec/LCC/Countries/Regions/ISO3166-2-SubdivisionCodes-DE.ttl)
- Namespace: `https://www.omg.org/spec/LCC/Countries/Regions/ISO3166-2-SubdivisionCodes-<replace_with_country_code>/`
- Term example: `https://www.omg.org/spec/LCC/Countries/Regions/ISO3166-2-SubdivisionCodes-DE/Bayern`
  OR `lcc-3166-2-de:Bayern`
- Usage example: See above in 'Countries Vocabulary' section.

## Currencies Vocabulary

- Title: EDM Council's **ISO 4217-1** Currency Codes Vocabulary
- [Link to homepage](https://spec.edmcouncil.org/fibo/ontology/FND/Accounting/ISO4217-CurrencyCodes/)
- Namespace: `https://spec.edmcouncil.org/fibo/ontology/FND/Accounting/ISO4217-CurrencyCodes/`
- Term example: `https://spec.edmcouncil.org/fibo/ontology/FND/Accounting/ISO4217-CurrencyCodes/EUR`
  OR `fibo-fnd-acc-4217:EUR`
- Usage example:

```turtle

@prefix rdf:               <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:              <http://www.w3.org/2000/01/rdf-schema#> .
@prefix drk:               <https://w3id.org/drk/ontology/> .
@prefix drkr:              <https://w3id.org/drk/resources/> .
@prefix schema:            <https://schema.org/> .
@prefix xsd:               <http://www.w3.org/2001/XMLSchema#> .
@prefix fibo-fnd-acc-4217: <https://spec.edmcouncil.org/fibo/ontology/FND/Accounting/ISO4217-CurrencyCodes/> .

drkr:Hedwig_and_the_Angry_Inch_Event_20241228
    a             drk:TheaterEvent ;
    schema:offers [ a                         schema:Offer ;
                    schema:priceSpecification [ a                    schema:PriceSpecification ;
                                                schema:price         "25"^^xsd:decimal ;
                                                schema:priceCurrency fibo-fnd-acc-4217:EUR ; ] ; ] .

```

---

# Culture-domain-specific Vocabularies

## Theatrical Genres Vocabulary

- Title: DRK Theatrical Genres Vocabulary
- [Link to TTL representation](theatrical-genres.ttl)
- Namespace: `http://w3id.org/drk/vocabs/theatrical-genres#`
- Term example: `http://w3id.org/drk/vocabs/theatrical-genres#Opera` OR `tgenres:Opera`
- Usage example:

```turtle

@prefix rdf:             <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:            <http://www.w3.org/2000/01/rdf-schema#> .
@prefix drk:             <https://w3id.org/drk/ontology/> .
@prefix drkr:            <https://w3id.org/drk/resources/> .
@prefix schema:          <https://schema.org/> .
@prefix tgenres:         <http://w3id.org/drk/vocabs/theatrical-genres#> .

drkr:Hedwig_and_the_Angry_Inch_Play_Augsburg
    a            drk:PlayProduction ;
    schema:genre tgenres:Musical .
```

## Theatrical Production Types Vocabulary

- Title: DRK Theatrical Production Types Vocabulary
- [Link to TTL representation](theatrical-production-types.ttl)
- Namespace: `http://w3id.org/drk/vocabs/theatrical-production-types#`
- Term example: `http://w3id.org/drk/vocabs/theatrical-production-types#WorldPremiere` OR `tprod:WorldPremiere`
- Usage example:

```turtle

@prefix rdf:             <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:            <http://www.w3.org/2000/01/rdf-schema#> .
@prefix drk:             <https://w3id.org/drk/ontology/> .
@prefix drkr:            <https://w3id.org/drk/resources/> .
@prefix schema:          <https://schema.org/> .
@prefix tprod:           <http://w3id.org/drk/vocabs/theatrical-production-types#> .

drkr:Hedwig_and_the_Angry_Inch_Play_Augsburg
    a                  drk:PlayProduction ;
    drk:productionType tprod:Revival .
```

## Theatrical Event Types Vocabulary

- Title: DRK Theatrical Event Types Vocabulary
- [Link to TTL representation](theatrical-event-types.ttl)
- Namespace: `http://w3id.org/drk/vocabs/theatrical-event-types#`
- Term example: `http://w3id.org/drk/vocabs/theatrical-event-types#LastPerformance` OR `tevent:LastPerformance`
- Usage example:

```turtle

@prefix rdf:              <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:             <http://www.w3.org/2000/01/rdf-schema#> .
@prefix drk:              <https://w3id.org/drk/ontology/> .
@prefix drkr:             <https://w3id.org/drk/resources/> .
@prefix schema:           <https://schema.org/> .
@prefix tevent:           <http://w3id.org/drk/vocabs/theatrical-event-types#> .

drkr:Hedwig_and_the_Angry_Inch_Event_20241228
    a             drk:TheaterEvent ;
    drk:eventType tevent:LastPerformance .
```

## Character Types Vocabulary

- Title: DRK Character Types Vocabulary
- [Link to TTL representation](character-types.ttl)
- Namespace: `http://w3id.org/drk/vocabs/character-types#`
- Term example: `http://w3id.org/drk/vocabs/character-types#Robot` OR `tchar:Robot`
- Usage example:

```turtle

@prefix rdf:             <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:            <http://www.w3.org/2000/01/rdf-schema#> .
@prefix drk:             <https://w3id.org/drk/ontology/> .
@prefix drkr:            <https://w3id.org/drk/resources/> .
@prefix schema:          <https://schema.org/> .
@prefix tchar:           <http://w3id.org/drk/vocabs/character-types#> .

drkr:Hedwig_and_the_Angry_Inch_Play_Augsburg
    a                 drk:PlayProduction ;
    drk:characterRole drkr:CharacterRoleHedwig .

drkr:CharacterRoleHedwig
    a               drk:CharacterPerformanceRole ;
    schema:roleName "Actor"@en, "Protagonist"@en, "Narrator"@en, "Singer"@en ;
    drk:character   [ a                 drk:Character ;
                      schema:name       "Hedwig Robinson"@en ;
                      drk:characterType tchar:Person ] .
```

## Performer Types Vocabulary

- Title: DRK Performer Types Vocabulary
- [Link to TTL representation](performer-types.ttl)
- Namespace: `http://w3id.org/drk/vocabs/performer-types#`
- Term example: `http://w3id.org/drk/vocabs/performer-types#CGI` OR `tperf:CGI`
- Usage example:

```turtle

@prefix rdf:             <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:            <http://www.w3.org/2000/01/rdf-schema#> .
@prefix drk:             <https://w3id.org/drk/ontology/> .
@prefix drkr:            <https://w3id.org/drk/resources/> .
@prefix schema:          <https://schema.org/> .
@prefix wikidata:        <https://www.wikidata.org/entity/> .
@prefix tchar:           <http://w3id.org/drk/vocabs/character-types#> .
@prefix tperf:           <http://w3id.org/drk/vocabs/performer-types#> .

drkr:Hedwig_and_the_Angry_Inch_Play_Augsburg
    a               drk:PlayProduction ;
    drk:creatorRole [ a               drk:ProductionRole ;
                      schema:roleName "Sponsor"@en, "Funder"@en ;
                      drk:performer   [ a                 drk:Performer ;
                                        schema:name       "Staatstheater (State Theater) Augsburg"@en ;
                                        drk:performerType tperf:Organization ;
                                        schema:sameAs     drkr:DE_Augsburg_STAugsburg ] ] .

drkr:Hedwig_and_the_Angry_Inch_Event_20241228
    a                            drk:TheaterEvent ;
    drk:characterPerformanceRole [ a               drk:CharacterPerformanceRole ;
                                   schema:roleName "Actor"@en, "Protagonist"@en, "Narrator"@en, "Singer"@en ;
                                   drk:character   [ a                 drk:Character ;
                                                     schema:name       "Hedwig Robinson"@en ;
                                                     drk:characterType tchar:Person ] ;
                                   drk:performer   [ a                 drk:Performer ;
                                                     schema:name       "Thomas Prazak" ;
                                                     drk:performerType tperf:Person ;
                                                     schema:sameAs     wikidata:Q18631797 ] ] .
```

## Personal Profile for Accessibility Vocabulary

- Title: DRK Personal Profile for Accessibility Vocabulary
- [Link to TTL representation](personal-profile-for-accessibility.ttl)
- Namespace: `http://w3id.org/drk/vocabs/personal-profile-for-accessibility#`
- Term example: `http://w3id.org/drk/vocabs/personal-profile-for-accessibility#blindness` OR `ppfa:blindness`
- Usage example:

```turtle

@prefix rdf:             <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:            <http://www.w3.org/2000/01/rdf-schema#> .
@prefix drk:             <https://w3id.org/drk/ontology/> .
@prefix drkr:            <https://w3id.org/drk/resources/> .
@prefix schema:          <https://schema.org/> .
@prefix ppfa:            <http://w3id.org/drk/vocabs/personal-profile-for-accessibility#> .

drkr:DE_Augsburg_STAugsburg_Place
    a                           drk:PerformingArtsTheater ;
    schema:name                 "Staatstheater Augsburg - brecht stage im Gaswerk"@en ;
    drk:hasAccessibilityFeature [ a                  drk:PlaceAccessibilityFeature ;
                                  drk:accessibleWith ppfa:wheelchair, ppfa:mobilityImpairment ;
                                  drk:accessibleWith ppfa:blindness, ppfa:visualImpairment ; ] ;
    schema:latitude             48.3874688 ;
    schema:longitude            10.8597226 .
```

---