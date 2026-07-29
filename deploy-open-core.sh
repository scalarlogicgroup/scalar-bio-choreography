#!/usr/bin/env bash
# ==============================================================================
# BIO-STOCHASTIC CONTINUUM (BSC) ENGINE - DEPLOYMENT PIPELINE
# Script: deploy-open-core.sh
# Purpose: Safe isolation scan and pristine deployment of open-source core
#          scalar-bio-choreography to GitHub organization 'scalarlogicgroup'.
# ==============================================================================

set -euo pipefail

# ANSI color codes for boardroom-ready terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}[*] Initializing BSC Engine Public Deployment Pipeline...${NC}"
echo -e "${BLUE}[*] Target Repository: scalarlogicgroup/scalar-bio-choreography${NC}"
echo "----------------------------------------------------------------------"

# ==============================================================================
# PHASE 1: INTELLECTUAL PROPERTY ISOLATION AUDIT
# ==============================================================================
echo -e "${YELLOW}[*] Phase 1: Conducting Intellectual Property Isolation Audit...${NC}"

# Define blocklisted enterprise terms that must NEVER leak to public GitHub
BLOCKLIST_TERMS=(
    "Clinical-to-Lab OS"
    "Bayesian Throttling Gate"
    "Non-Parametric Bayesian Throttling Gate"
    "sub-45ms"
    "self-correcting execution loop"
    "Clinician Proxy Agent"
    "Biochemist Proxy Agent"
)

LEAK_DETECTED=0

# Scan staged and unstaged files in the folder (excluding .git and the script itself)
for term in "${BLOCKLIST_TERMS[@]}"; do
    # Search for terms using grep (case-insensitive)
    if grep -rni --exclude-dir=".git" --exclude="deploy-open-core.sh" "$term" . > /dev/null; then
        echo -e "${RED}[!] CRITICAL SECURITY RISK: Proprietary term '$term' detected in codebase!${NC}"
        grep -rni --exclude-dir=".git" --exclude="deploy-open-core.sh" "$term" .
        LEAK_DETECTED=1
    fi
done

# Check for uncommitted raw data or configuration files
if [ -f ".env" ] || [ -f "telemetry_secrets.json" ]; then
    echo -e "${RED}[!] SECURITY RISK: Sensitive configuration files (.env/secrets) found in root!${NC}"
    LEAK_DETECTED=1
fi

if [ "$LEAK_DETECTED" -ne 0 ]; then
    echo -e "----------------------------------------------------------------------"
    echo -e "${RED}[-] DEPLOYMENT ABORTED: Intellectual Property Isolation Audit Failed.${NC}"
    echo -e "${RED}[-] Please remove proprietary Clinical-to-Lab OS files or secrets before deploying.${NC}"
    exit 1
else
    echo -e "${GREEN}[+] SUCCESS: Intellectual Property Isolation Audit Passed. No IP leaks detected.${NC}"
fi

echo "----------------------------------------------------------------------"

# ==============================================================================
# PHASE 2: LOCAL REPOSITORY INITIALIZATION
# ==============================================================================
echo -e "${YELLOW}[*] Phase 2: Preparing local Git repository...${NC}"

if [ ! -d ".git" ]; then
    echo -e "${BLUE}[*] Initializing fresh Git repository...${NC}"
    git init -b main
else
    echo -e "${BLUE}[*] Git repository already initialized. Aligning branch to 'main'...${NC}"
    git checkout -B main
fi

# Stage files (the local .gitignore confirmed by the Director will guard IP)
git add .

# Check if there are changes staged for commit
if ! git diff-index --quiet HEAD -- 2>/dev/null; then
    echo -e "${BLUE}[*] Committing open-source files...${NC}"
    git commit -m "Initial commit: scalar-bio-choreography open-source foundation"
else
    echo -e "${BLUE}[*] Codebase unchanged. Staged commit is up-to-date.${NC}"
fi

echo "----------------------------------------------------------------------"

# ==============================================================================
# PHASE 3: REMOTE SYNCHRONIZATION (FORCE OVERWRITE PROTOCOL)
# ==============================================================================
echo -e "${YELLOW}[*] Phase 3: Synchronizing with remote GitHub organization...${NC}"

# Re-link remote 'origin' to prevent namespace confusion
git remote remove origin 2>/dev/null || true
git remote add origin git@github.com:scalarlogicgroup/scalar-bio-choreography.git

echo -e "${BLUE}[*] Executing GitHub Force Overwrite Protocol to establish pristine commit history...${NC}"
if git push -u origin main --force; then
    echo -e "${GREEN}[+] SUCCESS: Pristine codebase pushed to scalarlogicgroup/scalar-bio-choreography.${NC}"
else
    echo -e "${RED}[!] ERROR: Git push failed. Verify that your SSH keys are correctly associated with the scalarlogicgroup organization.${NC}"
    exit 1
fi

echo "----------------------------------------------------------------------"

# ==============================================================================
# PHASE 4: PROGRAMMATIC METADATA INJECTION
# ==============================================================================
echo -e "${YELLOW}[*] Phase 4: Syncing repository metadata via GitHub CLI...${NC}"

if command -v gh &> /dev/null; then
    echo -e "${BLUE}[*] Authenticating and updating repository description...${NC}"
    if gh repo edit scalarlogicgroup/scalar-bio-choreography --description "Multi-agent orchestration routing protocol for volatile, multi-scale clinical and biological datasets."; then
        echo -e "${GREEN}[+] SUCCESS: Repository description programmatically updated.${NC}"
    else
        echo -e "${YELLOW}[!] WARNING: GitHub CLI command failed. Please verify 'gh auth login' status.${NC}"
    fi
else
    echo -e "${YELLOW}[!] WARNING: GitHub CLI ('gh') not found. Please install gh to automate description updates.${NC}"
fi

echo "----------------------------------------------------------------------"
echo -e "${GREEN}[+] DEPLOYMENT COMPLETE: scalar-bio-choreography is officially live!${NC}"
echo -e "${GREEN}[+] Sync Hugging Face ('scalar-clinical-metadata-tokenizer') and BioRxiv to complete launch.${NC}"
How to Install and Execute This Script on Your SLG Laptop
Save the file locally: Open your text editor of choice inside your "Scalar Project" folder and save the script block above as deploy-open-core.sh.
Make the script executable: Open your terminal, navigate to the folder, and run:
Run the deployment: Execute the script to trigger the automated IP audit and deploy the codebase
: