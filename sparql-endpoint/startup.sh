#!/bin/bash
# DRK SPARQL Endpoint Startup Script
# Auto-loads the ontology when container starts

echo "🚀 Starting DRK SPARQL Endpoint..."

# Start Blazegraph in background
java -server -Xmx512m -XX:+UseG1GC \
    -Djetty.port=${PORT:-8080} \
    -Dcom.bigdata.rdf.sail.webapp.ConfigParams.propertyFile=conf/RWStore.properties \
    -jar blazegraph.jar &

BLAZEGRAPH_PID=$!

# Wait for Blazegraph to be ready
echo "⏳ Waiting for Blazegraph to start..."
timeout=60
counter=0
PORT=${PORT:-8080}

while [ $counter -lt $timeout ]; do
    if curl -s http://localhost:${PORT}/blazegraph/ > /dev/null 2>&1; then
        echo "✅ Blazegraph is ready!"
        break
    fi
    sleep 2
    counter=$((counter + 2))
    echo "   ... still starting ($counter/${timeout}s)"
done

if [ $counter -ge $timeout ]; then
    echo "❌ Timeout waiting for Blazegraph to start"
    exit 1
fi

# Auto-load DRK ontology
if [ -f "data/drk-ontology.ttl" ]; then
    echo "📚 Loading DRK ontology..."
    
    # Check if data already exists (for restarts)
    TRIPLE_COUNT=$(curl -s -X POST \
        -H "Content-Type: application/sparql-query" \
        -H "Accept: application/sparql-results+json" \
        -d "SELECT (COUNT(*) AS ?count) WHERE { ?s ?p ?o }" \
        "http://localhost:${PORT}/blazegraph/namespace/kb/sparql" 2>/dev/null | \
        grep -o '"value":"[0-9]*"' | head -1 | grep -o '[0-9]*')
    
    if [ "$TRIPLE_COUNT" = "0" ] || [ -z "$TRIPLE_COUNT" ]; then
        # Load the ontology
        curl -X POST \
             -H "Content-Type: application/x-turtle" \
             -T data/drk-ontology.ttl \
             "http://localhost:${PORT}/blazegraph/namespace/kb/sparql"
        
        if [ $? -eq 0 ]; then
            echo "✅ DRK ontology loaded successfully!"
            echo "🔍 Access the SPARQL endpoint at: http://localhost:${PORT}/blazegraph/"
        else
            echo "⚠️  Warning: Failed to auto-load ontology (you can load it manually)"
        fi
    else
        echo "📊 Ontology already loaded ($TRIPLE_COUNT triples found)"
    fi
else
    echo "⚠️  Warning: drk-ontology.ttl not found in data/ directory"
fi

echo "🎯 DRK SPARQL Endpoint is ready!"
echo "   Web Interface: http://localhost:${PORT}/blazegraph/"
echo "   API Endpoint:  http://localhost:${PORT}/blazegraph/namespace/kb/sparql"

# Keep container running
wait $BLAZEGRAPH_PID