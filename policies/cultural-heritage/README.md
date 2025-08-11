# Cultural Heritage Policies

This directory contains ODRL (Open Digital Rights Language) policies specifically designed for cultural heritage institutions, museums, and cultural data spaces. These policies are part of the DRK (Datenraum Kultur) information model for managing rights and access to cultural heritage materials.

## Overview

The **DRK Cultural Heritage Policy Collection** provides comprehensive ODRL policies covering usage rights, fees, quality requirements, and ethical standards for cultural heritage materials. These policies enable automated rights management and policy-based negotiation in cultural data spaces.

## Policy Categories

### 📝 Usage-Based Policies

**Fee Structures by Use Case:**

| Policy | UID | Use Case | Fee Structure |
|--------|-----|----------|---------------|
| `PrivateScientificFreePolicy` | `private-scientific-free` | Private & Scientific Use | **Free** |
| `CommercialFeePolicy` | `commercial-fee` | Commercial Use | **€50.00** |
| `InstitutionalBenefitPolicy` | `institutional-benefit-free` | Institutional Cooperation | **Free** |

**Supported Use Cases:**
- **Private Use**: Personal, non-commercial usage
- **Scientific Use**: Academic research and scholarly activities  
- **Commercial Use**: Business and profit-generating activities
- **Institutional Cooperation**: Museum partnerships, outreach, marketing

### 🔧 Quality and Technical Policies

**Digitization and Resolution Services:**

| Policy | UID | Service | Fee Structure |
|--------|-----|---------|---------------|
| `HighQualityAvailablePolicy` | `high-quality-available` | Existing High-Quality Data | **Free** |
| `DigitizationFeePolicy` | `digitization-fee` | New Digitization Required | **€75.00** |
| `PrintResolutionFeePolicy` | `print-resolution-fee` | Print Quality (≥300 DPI) | **€25.00** |
| `DigitalDisplayFreePolicy` | `digital-display-free` | Web/Digital Display | **Free** |

**Technical Specifications:**
- **Print Resolution**: ≥300 DPI for professional reproduction
- **Digital Display**: Standard web resolution for online access
- **High-Quality Data**: Professional digitization already available

### ⚖️ Rights-Based Policies

**Copyright and IP Management:**

| Policy | UID | Rights Status | Access Level |
|--------|-----|---------------|--------------|
| `PublicDomainFreePolicy` | `public-domain-free` | Public Domain Works | **Free Use & Reproduction** |
| `IPProtectedRestrictedPolicy` | `ip-protected-restricted` | Copyright Protected | **€100.00 + Licensing** |

### 🛡️ Ethical and Content Policies

**Content Standards and Review:**

| Policy | UID | Scope | Requirements |
|--------|-----|-------|--------------|
| `EthicalStandardsProhibitionPolicy` | `ethical-standards-prohibition` | Standards Violations | **Prohibited Use** |
| `ContentReviewPolicy` | `content-review-required` | Sensitive Content | **Special Approval Required** |

**Ethical Standards Coverage:**
- Institutional ethical standards compliance
- Scientific research standards adherence
- Social responsibility requirements
- Content sensitivity review processes

### ⏰ Temporal Policies

**Time-Based Access Control:**

| Policy | UID | Duration | Use Case |
|--------|-----|----------|----------|
| `TimeLimitedUsePolicy` | `time-limited-use` | Until 2025-12-31 | **Project-Based Access** |

## Data Space Integration

### Automated Policy Enforcement
- **Rights validation** during data access requests
- **Fee calculation** based on usage purpose and technical requirements
- **Compliance monitoring** for ethical and content standards
- **Temporal access control** for time-limited permissions

### Target Resources
Policies apply to:
- **`drk:ImageArtwork`** - Digital images of cultural objects
- **`drk:PhysicalArtwork`** - Physical cultural heritage objects
- **`drk:CDFPortal`** - Cultural Data Framework portal access

### ODRL Actions
- **`odrl:use`** - General usage permissions
- **`odrl:reproduce`** - Reproduction rights
- **`odrl:present`** - Display and presentation
- **`drk:digitize`** - Digitization services

## Usage Examples

### Scientific Research Access
```turtle
# Researcher requests access to digital artwork for academic study
# → PrivateScientificFreePolicy applies
# → No fees, attribution required
```

### Commercial Publication
```turtle
# Publisher requests high-resolution image for book
# → CommercialFeePolicy + PrintResolutionFeePolicy apply  
# → €50.00 (commercial) + €25.00 (print resolution) = €75.00 total
```

### Museum Collaboration
```turtle
# Partner museum requests images for joint exhibition
# → InstitutionalBenefitPolicy applies
# → Free access for cooperation projects
```

## Implementation Notes

### Fee Structure
All fees are specified in **Euros (€)** with decimal precision:
- Service fees are mandatory duties (`odrl:duty`)
- Payment amounts use `odrl:payAmount` with Euro currency unit
- Free policies explicitly set `drk:fees` to `drk:NoFees`

### Constraint Logic
Policies use ODRL constraint operators:
- `odrl:eq` - Equals (exact match)
- `odrl:gteq` - Greater than or equal to
- `odrl:lt` - Less than
- `odrl:isAnyOf` - Matches any value in list

### Metadata Standards
Each policy includes:
- **Dublin Core Terms** for title, description, creator, dates
- **SKOS notes** for additional context and explanations
- **Subject tags** for categorization and discovery
- **Creative Commons licensing** for the policy definitions themselves

## Contributing

When adding new cultural heritage policies:

1. **Follow DRK vocabulary** - Use `drk:` namespace for cultural heritage concepts
2. **Include comprehensive metadata** - Add title, description, notes, and subjects
3. **Specify clear constraints** - Define precise conditions for policy application
4. **Test with cultural institutions** - Validate policies with museum stakeholders
5. **Document fee structures** - Clearly specify all monetary obligations

## Legal Considerations

⚠️ **Important Notes:**
- Policies implement **EU intellectual property guidelines** for cultural heritage.
- Based on **European Commission guidance** on artwork reproduction rights.
- Templates require institutional customization for specific legal jurisdictions.
- Consult legal experts for IP and copyright compliance in your region.
- Fee structures should reflect actual institutional costs and legal obligations.
- Ethical standards must align with institutional values and EU cultural heritage law.
- Review policies regularly for legal and technical updates.
- **EU public domain rules** may differ from other jurisdictions.

## Legal Framework

### European Union Guidelines
The policies in this collection are designed to comply with **European Union intellectual property law** regarding cultural heritage materials:

**Key Reference:** [About artworks, pictures of artworks… and the possibility of copying them - European Commission](https://intellectual-property-helpdesk.ec.europa.eu/news-events/news/about-artworks-pictures-artworks-and-possibility-copying-them-2021-12-13_en)

This European Commission guidance covers:
- **Copyright status** of original artworks vs. photographic reproductions.
- **Public domain considerations** for historical cultural objects.
- **Reproduction rights** for museums and cultural institutions.
- **Commercial vs. non-commercial use** distinctions in EU law.

### Policy Compliance
Our ODRL policies implement these EU guidelines through:
- **`PublicDomainFreePolicy`** - Aligns with EU public domain principles.
- **`IPProtectedRestrictedPolicy`** - Enforces EU copyright protection requirements.
- **`CommercialFeePolicy`** - Distinguishes commercial use as defined by EU law.
- **`PrivateScientificFreePolicy`** - Supports EU research and education exceptions.

## Resources

### Legal and Policy Framework
- [EU IP Helpdesk - Artworks and Copying Rights](https://intellectual-property-helpdesk.ec.europa.eu/news-events/news/about-artworks-pictures-artworks-and-possibility-copying-them-2021-12-13_en)
- [European Copyright Directive](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32019L0790)
- [Cultural Heritage Exception (EU)](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32019L0790)

### Technical Standards
- [ODRL Information Model](https://www.w3.org/TR/odrl-model/)
- [Dublin Core Terms](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/)
- [SKOS Simple Knowledge Organization System](https://www.w3.org/2004/02/skos/)
- [Creative Commons Licensing](https://creativecommons.org/licenses/)
- [Cultural Heritage Data Standards](https://www.getty.edu/research/publications/electronic_publications/cdwa/)
