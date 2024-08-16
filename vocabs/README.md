# Controlled Vocabularies for Representing Enumerations
- For representing Enumerations or ENUMs in semantic metadata models, it would be preferable use URIs from existing (controlled) vocabularies, instead of plain string literals.
- In case there are no existing vocabularies for a given ENUM-type, we would create new ones and define the concerned terms under the DRK IM's vocabulary namespace: `http://w3id.org/drk/vocabs/`
- Examples
  - Theatrical Genres Vocabulary: `http://w3id.org/drk/vocabs/theatrical-genres/`
  - Term: `http://w3id.org/drk/vocabs/theatrical-genres#Musical`

---
# Domain-agnostic Vocabularies

## Languages Vocabulary
- Namespace: ``
- Term example: ``
- Usage example:
```turtle

```

## Countries Vocabulary
- Namespace: ``
- Term example: ``
- Usage example:
```turtle

```

## Currencies Vocabulary
- Namespace: ``
- Term example: ``
- Usage example:
```turtle

```

---
# Culture-domain-specific Vocabularies
## Theatrical Genres Vocabulary
- Namespace: `http://w3id.org/drk/vocabs/theatrical-genres#`
- Term example: `http://w3id.org/drk/vocabs/theatrical-genres#Opera`
- Usage example: 
```turtle

```

## Theatrical Production Types Vocabulary
- Namespace: `http://w3id.org/drk/vocabs/theatrical-production-types#`
- Term example: `http://w3id.org/drk/vocabs/theatrical-production-types#WorldPremiere`
- Usage example:
```turtle

```

## Theatrical Event Types Vocabulary
- Namespace: `http://w3id.org/drk/vocabs/theatrical-event-types#`
- Term example: `http://w3id.org/drk/vocabs/theatrical-event-types#LastPerformance`
- Usage example:
```turtle

```
---
