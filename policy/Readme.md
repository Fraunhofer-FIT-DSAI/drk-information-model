# Cultural Data Exchange Policies 🔒

## Policy Implementation Options 🔄

The policies in this repository can be implemented in two ways:

### Option 1: Comprehensive Single File 📄
All scenarios and their implementations are available in a single file for unified access:
- File: [cultural-data-exchange-policies.ttl](https://github.com/Daham-Mustaf/drk-information-model/blob/uc4-policy-update/policy/cultural-data-exchange-policies.ttl)
- Contains all five scenarios:
 - Scenario 1: Cultural API Access Management (Augsburg Theater API) 🎭
 - Scenario 2: Educational Archive Access 🎓
 - Scenario 3: Open Data Access 🌐
 - Scenario 4: Time-Limited Access ⏱️
 - Scenario 5: Connector Reference Access 🔗

### Option 2: Separated Policy Templates and Examples 📑
Alternatively, the same policies are available as separate templates and implementations:

#### Policy Templates
1. **Temporal and Spatial Access Policy** 🌍
  - File: `policies/tempo-spatial-access-policy.ttl`
  - Purpose: Geographic and time-based access control
  - Maps to: Scenario 1 in comprehensive file

2. **No Fee Research Policy** 📚
  - File: `policies/no-fee-policy.ttl`
  - Purpose: Research and educational access management
  - Maps to: Scenario 2 in comprehensive file

3. **Open Access Policy** 🔓
  - File: `policies/open-access-policy.ttl`
  - Purpose: Perpetual open access with attribution
  - Maps to: Scenario 3 in comprehensive file

4. **Time Window Policy** ⌛
  - File: `policies/time-window-policy.ttl`
  - Purpose: Time-based access control
  - Maps to: Scenario 4 in comprehensive file

5. **Connector Reference Policy** 🔌
  - File: `policies/connector-reference-policy.ttl`
  - Purpose: Connector ID validation
  - Maps to: Scenario 5 in comprehensive file

Both implementation approaches are valid and serve different use cases:
- Use the comprehensive file for quick reference and understanding the complete policy framework 📋
- Use separated templates for modular implementation and easier maintenance 🔧

The content and functionality remain identical in both approaches, allowing users to choose the most suitable format for their needs. ✨



# Creative Commons Licenses, ODRL Translation, and Dataspaces

## 📜 Creative Commons Licenses

Creative Commons (CC) licenses are a set of copyright licenses that allow creators to specify how others can use their work. To apply a CC license to your work, you need:

1. **Original work**: You must be the creator or copyright holder of the work you want to license.

2. **Understanding of license types**: You should know which CC license best suits your needs. There are several types:

   - CC BY (Attribution)
   - CC BY-SA (Attribution-ShareAlike)
   - CC BY-NC (Attribution-NonCommercial)
   - CC BY-ND (Attribution-NoDerivs)
   - CC BY-NC-SA (Attribution-NonCommercial-ShareAlike)
   - CC BY-NC-ND (Attribution-NonCommercial-NoDerivs)

3. **Decision on usage**: Each license type allows different uses of your work.

### 🔍 How to Apply a CC License

1. Choose the appropriate license on the Creative Commons website.
2. Get the license code or text.
3. Add this information to your work, whether it's online or offline.

## 🔄 Translating Creative Commons Licenses to ODRL

ODRL (Open Digital Rights Language) is more expressive than CC licenses. We can represent CC licenses in ODRL, but not always vice versa. Here's a general approach to translate CC licenses to ODRL:

1. **Identify the CC License**: Determine which CC license you're working with.

2. **Map CC terms to ODRL concepts**:
   - CC "Attribution" → ODRL "attribute" action
   - CC "ShareAlike" → ODRL "shareAlike" duty
   - CC "NonCommercial" → ODRL "commercialize" action (prohibited)
   - CC "NoDerivatives" → ODRL "derive" action (prohibited)

3. **Create ODRL Policy**: Structure an ODRL policy that represents the CC license terms.

4. **Example translations**:

   CC BY 4.0 in ODRL:
   ```json
   {
     "@context": "http://www.w3.org/ns/odrl.jsonld",
     "@type": "Set",
     "uid": "http://example.com/policy:cc-by-4.0",
     "permission": [{
       "action": "use",
       "duty": [{
         "action": "attribute"
       }]
     }]
   }
   ```

   CC BY-NC 4.0 in ODRL:
   ```json
   {
     "@context": "http://www.w3.org/ns/odrl.jsonld",
     "@type": "Set",
     "uid": "http://example.com/policy:cc-by-nc-4.0",
     "permission": [{
       "action": "use",
       "duty": [{
         "action": "attribute"
       }],
       "constraint": [{
         "leftOperand": "purpose",
         "operator": "neq",
         "rightOperand": "commercialize"
       }]
     }]
   }
   ```

5. **Validate**: Ensure the ODRL representation accurately captures the CC license terms.

## 🌐 ODRL in Dataspaces

ODRL serves as a crucial policy language within the context of Dataspaces. Dataspaces are an emerging approach to data management that aim to provide a unified view of data across multiple heterogeneous sources.

### Key Points:

1. **Policy Expression**: ODRL allows for the expression of fine-grained policies that govern data usage, access, and sharing within Dataspaces.

2. **Interoperability**: By using ODRL, Dataspaces can maintain consistent policy interpretation across different systems and organizations.

3. **Rights Management**: ODRL enables the clear articulation of rights and obligations associated with data assets in a Dataspace ecosystem.

4. **Open Source Requirement**: In many Dataspace implementations, there's a growing emphasis on open-source data publication. ODRL can be used to express these open-source requirements formally.


## 🔓 Open Source Data Publication

In the context of Dataspaces and modern data management practices, there's often a requirement for data to be published as open source. This aligns with principles of transparency, reproducibility, and collaborative innovation.

### Using ODRL for Open Source Data:

ODRL can be used to express open source requirements for data. Here's a simple example of how an ODRL policy might look for open source data:

```json
{
  "@context": "http://www.w3.org/ns/odrl.jsonld",
  "@type": "Set",
  "uid": "http://example.com/policy:open-source-data",
  "permission": [{
    "action": "use",
    "constraint": [{
      "leftOperand": "purpose",
      "operator": "isAnyOf",
      "rightOperand": ["research", "commercial", "non-commercial"]
    }],
    "duty": [{
      "action": "attribute"
    }, {
      "action": "shareAlike"
    }]
  }]
}
```

This policy allows the use of data for any purpose (research, commercial, or non-commercial) with the duties of attribution and sharing derivative works under the same terms.

## ⚠️ Important Considerations

- The examples provided are for illustrative purposes only.
- Always consult with legal experts when dealing with licensing issues.
- Keep up to date with the latest versions of both CC licenses and ODRL specifications.
- When implementing ODRL in Dataspaces, consider the specific requirements and constraints of your Dataspace ecosystem.

## 📚 Further Reading

- [Creative Commons Official Website](https://creativecommons.org/)
- [ODRL Information Model](https://www.w3.org/TR/odrl-model/)
- [W3C ODRL Community Group](https://www.w3.org/community/odrl/)
- [International Data Spaces Association](https://internationaldataspaces.org/)
- 
