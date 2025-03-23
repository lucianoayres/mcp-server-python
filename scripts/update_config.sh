#!/bin/bash
# Determine the directory of this script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$SCRIPT_DIR/.."

# Get the absolute path for node and mcp-server.py.
PYTHON_PATH=$(which python)
MCP_SERVER_PATH=$(realpath "$PROJECT_ROOT/mcp-server.py")

# Get the absolute path for the config file (in the .cursor directory).
CONFIG_PATH=$(realpath "$PROJECT_ROOT/.cursor/mcp.json")

# Replace the placeholders with actual paths.
sed -i "s|\"/path/to/python\"|\"$PYTHON_PATH\"|g" "$CONFIG_PATH"
sed -i "s|\"/path/to/mcp-server.py\"|\"$MCP_SERVER_PATH\"|g" "$CONFIG_PATH"

#!/bin/bash
# Define color variables.
GREEN="\033[1;32m"
BLUE="\033[1;34m"
NC="\033[0m"  # No Color

echo -e "✅ ${GREEN}Updated config file at:${NC}\n  ${BLUE}${CONFIG_PATH}${NC}"
echo -e "✅ ${GREEN}with python path:${NC}\n  ${BLUE}${PYTHON_PATH}${NC}"
echo -e "✅ ${GREEN}and mcp-server path:${NC}\n  ${BLUE}${MCP_SERVER_PATH}${NC}"

echo -e "\n📝 ${GREEN}Updated config file content:${NC}"
cat "$CONFIG_PATH"

