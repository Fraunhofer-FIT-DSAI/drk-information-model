# Creative Commons Policies for Data Spaces

This directory contains ODRL (Open Digital Rights Language) translations of Creative Commons licenses for use in data space contracts and policy-based negotiation systems.

## Overview

Data spaces require machine-readable policies for automated contract negotiation and rights management. Since ODRL is the standard policy language for data spaces, Creative Commons licenses must be translated from their human-readable form into ODRL format to enable:

- **Policy-based negotiation** between data space participants.
- **Automated contract generation** for open data sharing agreements.
- **Rights validation** during data access and usage.
- **Compliance monitoring** in federated data ecosystems.

These files provide ODRL representations of Creative Commons licenses specifically for applying CC licenses to open data assets within data space infrastructures.

## Available License Files

| File | License Type | Permissions | Duties | Prohibitions |
|------|-------------|-------------|---------|-------------|
| `cc-by-4.0-sharing.jsonld` | CC BY 4.0 | Sharing | Attribution | None |
| `cc-by-nc-4.0.jsonld` | CC BY-NC 4.0 | Sharing, DerivativeWorks | Attribution | CommercialUse |
| `cc-by-nc-nd-4.0.jsonld` | CC BY-NC-ND 4.0 | Sharing | Attribution | CommercialUse, DerivativeWorks |
| `cc-by-nc-sa-4.0.jsonld` | CC BY-NC-SA 4.0 | Sharing, DerivativeWorks | Attribution, ShareAlike | CommercialUse |
| `cc-by-nd-4.0.jsonld` | CC BY-ND 4.0 | Sharing, CommercialUse | Attribution | DerivativeWorks |
| `cc-by-sa-4.0.jsonld` | CC BY-SA 4.0 | Sharing, DerivativeWorks, CommercialUse | Attribution, ShareAlike | None |

## License Components

### Key Elements
- **BY (Attribution)**: Credit must be given to creator.
- **NC (NonCommercial)**: Only non-commercial use allowed.
- **ND (NoDerivatives)**: No adaptations or modifications allowed.
- **SA (ShareAlike)**: Adaptations must use same license.

## Usage in Data Spaces

### Policy-Based Negotiation
These ODRL policies enable automated negotiation between data providers and consumers:
- Data providers can attach CC-based policies to their open data assets.
- Data space connectors can automatically evaluate policy compatibility.
- Contract negotiation can proceed without human intervention for standard CC terms.

### Data Space Contracts
The ODRL format allows integration with data space contract frameworks:
- Policies become enforceable contract terms.
- Usage tracking and compliance monitoring can be automated.
- Rights violations can trigger automated responses.

### Open Data Publishing
For publishing open data in data spaces:
1. Select appropriate Creative Commons license for your data
2. Use corresponding ODRL policy file as data asset policy
3. Data space infrastructure handles automated access based on policy terms
4. Consumers receive clear, machine-readable usage rights

### Target Resource Configuration
Replace `"target": "https://example.org/resource123"` with the actual URI of your data asset or dataset in the data space catalog.

### Creative Commons Actions in ODRL Context

- `cc:Sharing` - Distribute, publicly display, and publicly perform the data asset
- `cc:DerivativeWorks` - Create adaptations and modifications of the data
- `cc:CommercialUse` - Use data for commercial purposes in data space transactions
- `cc:Attribution` - Credit the data provider (mandatory duty)
- `cc:ShareAlike` - License derivative datasets under same terms (mandatory duty)

## Data Space Integration Examples

### Data Provider Scenario
```json
// Attach CC-BY-4.0 policy to dataset
{
  "dataAsset": "https://dataspace.org/datasets/traffic-data-2024",
  "policy": "cc-by-4.0-sharing.jsonld",
  "accessEndpoint": "https://connector.provider.org/api/data"
}
```

### Consumer Access Request
```json
// Automated policy evaluation and contract generation
{
  "requestedAsset": "https://dataspace.org/datasets/traffic-data-2024", 
  "consumerPolicy": "accepts-attribution-duty",
  "negotiationResult": "compatible - auto-approve"
}
```

## Why ODRL for Data Spaces?

**ODRL is the standard policy language for data spaces** because it provides:
- Machine-readable policy expressions for automated processing.
- Standardized vocabulary for rights, duties, and prohibitions.
- Interoperability between different data space implementations.
- Support for complex policy negotiation and contract automation.

**Creative Commons licenses must be translated to ODRL** to:
- Enable policy-based automated negotiation in data space ecosystems
- Allow data space connectors to process and enforce CC license terms
- Integrate open data governance with federated data sharing infrastructure
- Support scalable rights management across distributed data networks

## Contributing

When adding new license files:
1. Follow the existing JSON-LD structure
2. Ensure compliance with Creative Commons specifications
3. Test JSON-LD validity
4. Update this README with new entries

## Resources

- [Creative Commons Licenses](https://creativecommons.org/licenses/)
- [ODRL Vocabulary](https://www.w3.org/TR/odrl-vocab/)
- [JSON-LD Specification](https://json-ld.org/)

## License

This repository and its contents are made available under the terms specified in each individual license file.
