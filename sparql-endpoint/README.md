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

## 📊 Sample Queries

### Get All Classes
```sparql
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?class ?label WHERE {
  ?class a owl:Class ;
         rdfs:label ?label .
} 
ORDER BY ?label
LIMIT 20
```

### Theater-Specific Concepts
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?concept ?label ?comment WHERE {
  ?concept rdfs:label ?label ;
           rdfs:comment ?comment .
  FILTER(STRSTARTS(STR(?concept), "http://w3id.org/drk/ontology/"))
  FILTER(CONTAINS(LCASE(?comment), "theater") || 
         CONTAINS(LCASE(?comment), "play") ||
         CONTAINS(LCASE(?comment), "performance"))
}
LIMIT 10
```

### Accessibility Features
```sparql
PREFIX drk: <http://w3id.org/drk/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?property ?label ?comment WHERE {
  ?property rdfs:label ?label ;
            rdfs:comment ?comment .
  FILTER(CONTAINS(LCASE(?label), "accessibility") || 
         CONTAINS(LCASE(?comment), "accessibility") ||
         CONTAINS(LCASE(?comment), "wheelchair"))
}
```

### Count All Triples
```sparql
SELECT (COUNT(*) AS ?totalTriples) WHERE {
  ?s ?p ?o
}
```

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