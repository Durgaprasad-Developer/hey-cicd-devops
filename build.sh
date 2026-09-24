#!/bin/bash
set -e

echo "Starting build process..."

# Create the output directory expected by the workflow
mkdir -p build

# Generate build output files
cat <<EOF > build/output.txt
Build Artifact: session16-build
Timestamp: $(date)
Commit SHA: ${GITHUB_SHA:-local}
Status: Successful
EOF

echo "Build finished successfully!"
