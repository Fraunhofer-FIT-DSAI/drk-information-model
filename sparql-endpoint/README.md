# DRK SPARQL Endpoint

This folder contains the configuration for deploying a Blazegraph SPARQL endpoint with the DRK (Culture Dataspace) ontology.

## 🚀 Quick Start

### Local Testing

1. **Download Blazegraph:**
   ```bash
   wget https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_2_1_6_RC/blazegraph.jar
   ```

2. **Start locally:**
   ```bash
   java -server -Xmx2g -jar blazegraph.jar
   ```

3. **Open:** http://localhost:9999/blazegraph/

### Docker Testing

```bash
# Build and run locally
docker build -t drk-sparql .
docker run -p 8080:8080 drk-sparql

# Access at: http://localhost:8080/blazegraph/
```

## 🌐 Live Deployment

This endpoint is automatically deployed to Railway from this repository.

**Live Endpoint**: [Will be updated after deployment]

### API Access
- **SPARQL Endpoint**: `https://your-app.railway.app/blazegraph/namespace/kb/sparql`
- **Web Interface**: `https://your-app.railway.app/blazegraph/`
- **Supported Formats**: JSON, XML, CSV, TSV
- **HTTP Methods**: GET (query in URL) or POST (query in body)

## 📊 Comprehensive Sample Queries

### 🎭 Quick Start Queries

#### Get All Classes
```sparql
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?class ?label ?comment WHERE {
  ?class a owl:Class ;
         rdfs:label ?label .
  OPTIONAL { ?class rdfs:comment ?comment }
} 
ORDER BY ?label
LIMIT 20
```

#### Count All Triples
```sparql
SELECT (COUNT(*) AS ?totalTriples) WHERE {
  ?s ?p ?o
}
```

#### Ontology Metadata
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX schema: <https://schema.org/>

SELECT ?property ?value WHERE {
  drk: ?property ?value .
  FILTER(?property IN (dcterms:title, dcterms:description, owl:versionInfo, 
                       dcterms:created, dcterms:modified, schema:author))
}
```

### 🎬 Theater & Performance Queries

#### Theater-Specific Concepts
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?concept ?label ?comment WHERE {
  ?concept rdfs:label ?label ;
           rdfs:comment ?comment .
  FILTER(STRSTARTS(STR(?concept), "http://w3id.org/drk/ontology/"))
  FILTER(CONTAINS(LCASE(?comment), "theater") || 
         CONTAINS(LCASE(?comment), "play") ||
         CONTAINS(LCASE(?comment), "performance") ||
         CONTAINS(LCASE(?comment), "theatrical"))
}
ORDER BY ?label
```

#### Character and Role Concepts
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?concept ?label ?comment WHERE {
  ?concept rdfs:label ?label ;
           rdfs:comment ?comment .
  FILTER(STRSTARTS(STR(?concept), "http://w3id.org/drk/ontology/"))
  FILTER(CONTAINS(LCASE(?comment), "character") || 
         CONTAINS(LCASE(?comment), "role") ||
         CONTAINS(LCASE(?comment), "performer") ||
         CONTAINS(LCASE(?label), "character") ||
         CONTAINS(LCASE(?label), "role"))
}
ORDER BY ?label
```

#### Production and Event Properties
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?property ?label ?domain ?comment WHERE {
  ?property rdfs:label ?label ;
            rdfs:domain ?domain ;
            rdfs:comment ?comment .
  ?domain rdfs:label ?domainLabel .
  FILTER(CONTAINS(LCASE(?domainLabel), "production") ||
         CONTAINS(LCASE(?domainLabel), "event") ||
         CONTAINS(LCASE(?domainLabel), "theater"))
}
ORDER BY ?domainLabel ?label
```

### ♿ Accessibility Queries

#### All Accessibility Features
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?concept ?label ?comment WHERE {
  ?concept rdfs:label ?label ;
           rdfs:comment ?comment .
  FILTER(CONTAINS(LCASE(?label), "accessibility") || 
         CONTAINS(LCASE(?comment), "accessibility") ||
         CONTAINS(LCASE(?comment), "wheelchair") ||
         CONTAINS(LCASE(?comment), "accessible") ||
         CONTAINS(LCASE(?label), "wheelchair"))
}
ORDER BY ?label
```

#### Animal Policy Properties
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?property ?label ?comment WHERE {
  ?property rdfs:label ?label ;
            rdfs:comment ?comment .
  FILTER(CONTAINS(LCASE(?comment), "dog") || 
         CONTAINS(LCASE(?comment), "animal") ||
         CONTAINS(LCASE(?comment), "service") ||
         CONTAINS(LCASE(?label), "allows"))
}
ORDER BY ?label
```

#### Wheelchair Accessibility
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?concept ?label ?comment WHERE {
  ?concept rdfs:label ?label ;
           rdfs:comment ?comment .
  FILTER(CONTAINS(LCASE(?comment), "wheelchair") ||
         CONTAINS(LCASE(?label), "wheelchair"))
}
ORDER BY ?label
```

### 🏢 Place & Venue Queries

#### Place Related Concepts
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?concept ?label ?comment WHERE {
  ?concept rdfs:label ?label ;
           rdfs:comment ?comment .
  FILTER(CONTAINS(LCASE(?comment), "place") || 
         CONTAINS(LCASE(?comment), "location") ||
         CONTAINS(LCASE(?comment), "venue") ||
         CONTAINS(LCASE(?label), "place"))
}
ORDER BY ?label
```

#### Navigation and Map Features
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?property ?label ?comment WHERE {
  ?property rdfs:label ?label ;
            rdfs:comment ?comment .
  FILTER(CONTAINS(LCASE(?comment), "map") || 
         CONTAINS(LCASE(?comment), "navigation") ||
         CONTAINS(LCASE(?comment), "location") ||
         CONTAINS(LCASE(?label), "map") ||
         CONTAINS(LCASE(?label), "url"))
}
ORDER BY ?label
```

### 🔗 Structure & Relationships

#### Class Hierarchy
```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX drk: <http://w3id.org/drk/ontology/>

SELECT ?subClass ?subLabel ?superClass ?superLabel WHERE {
  ?subClass rdfs:subClassOf ?superClass ;
            rdfs:label ?subLabel .
  ?superClass rdfs:label ?superLabel .
  FILTER(STRSTARTS(STR(?subClass), "http://w3id.org/drk/ontology/") ||
         STRSTARTS(STR(?superClass), "http://w3id.org/drk/ontology/"))
}
ORDER BY ?superLabel ?subLabel
```

#### Property Domains and Ranges
```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX drk: <http://w3id.org/drk/ontology/>

SELECT ?property ?propertyLabel ?domain ?domainLabel ?range ?rangeLabel WHERE {
  ?property rdfs:label ?propertyLabel ;
            rdfs:domain ?domain ;
            rdfs:range ?range .
  ?domain rdfs:label ?domainLabel .
  ?range rdfs:label ?rangeLabel .
  FILTER(STRSTARTS(STR(?property), "http://w3id.org/drk/ontology/"))
}
ORDER BY ?propertyLabel
```

### 📊 Statistical Queries

#### Count by Property Type
```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX drk: <http://w3id.org/drk/ontology/>

SELECT ?propertyType (COUNT(?property) AS ?count) WHERE {
  ?property a ?propertyType .
  FILTER(?propertyType IN (rdf:Property, owl:ObjectProperty, owl:DatatypeProperty))
  FILTER(STRSTARTS(STR(?property), "http://w3id.org/drk/ontology/"))
}
GROUP BY ?propertyType
ORDER BY DESC(?count)
```

#### External Vocabulary Imports
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>

SELECT DISTINCT ?importedOntology WHERE {
  drk: owl:imports ?importedOntology .
}
ORDER BY ?importedOntology
```

### 💡 **Pro Tips:**
- **Modify LIMIT values** to see more/fewer results
- **Remove FILTER clauses** to see broader results  
- **Add OPTIONAL clauses** to include missing data
- **Use DESCRIBE ?uri** to explore specific resources
- **Try CONSTRUCT queries** to create new RDF graphs

### 🔗 **More Queries Available:**
For the complete collection of 25+ specialized queries, check the [full query documentation](https://github.com/Fraunhofer-FIT-DSAI/drk-information-model/tree/main/sparql-endpoint)

## 🔧 Configuration

- **Memory**: Optimized for 512MB (Railway free tier)
- **Auto-loading**: Ontology loads automatically on startup
- **Health checks**: Built-in health monitoring
- **Security**: Runs as non-root user

## 🛠️ Troubleshooting

### Common Issues

1. **Build failing?**
   - Check that `drk-ontology.ttl` exists in the parent directory
   - Verify Docker syntax in Dockerfile

2. **App crashing?**
   - Check Railway logs for memory issues
   - Reduce memory allocation if needed

3. **Ontology not loading?**
   - Manual upload: Use the web interface UPDATE tab
   - Check startup logs for error messages

4. **Can't access endpoint?**
   - Ensure port 8080 is properly exposed
   - Check Railway deployment status

### Example API Call
```bash
curl -X POST \
  -H "Content-Type: application/sparql-query" \
  -H "Accept: application/sparql-results+json" \
  -d "SELECT ?s ?p ?o WHERE { ?s ?p ?o } LIMIT 10" \
  https://your-app.railway.app/blazegraph/namespace/kb/sparql
```

## 📁 File Structure

```
sparql-endpoint/
├── Dockerfile          # Container configuration
├── RWStore.properties   # Blazegraph settings
├── startup.sh          # Auto-loading script
├── railway.toml         # Railway deployment config
└── README.md           # This file
```

## 📋 Features

- ✅ Auto-loads DRK ontology on startup
- ✅ Web-based SPARQL query interface
- ✅ RESTful API access
- ✅ Multiple output formats (JSON, XML, CSV, TSV)
- ✅ Health monitoring
- ✅ Memory-optimized for cloud deployment
- ✅ Security hardened (non-root user)

---

Need help? Check the main repository documentation or open an issue!
