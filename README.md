````markdown
# MCP Server in Python

## Overview

**MCP (Model Context Protocol)** is a framework that allows you to integrate custom tools into AI-assisted development environments—such as Cursor AI. MCP servers expose functionality (like data retrieval or code analysis) so that an LLM-based IDE can call these tools on demand.

This project demonstrates an MCP server built in Python that provides two basic tools. One tool, **add**, accepts two numbers and returns their sum, while the other, **getApiKey**, retrieves the API key from the environment (via the `API_KEY` variable). Learn more about MCP in the [Model Context Protocol Introduction](https://modelcontextprotocol.io/introduction).

## Requirements

- **Python:** A modern version of Python (3.8 or higher is recommended).
- **Virtual Environment:** It is recommended to use a virtual environment for dependency management.

## Features

- **MCP Integration:** Exposes tool functionality to LLM-based IDEs.
- **Addition Tool:** Accepts two numeric parameters and returns their sum.
- **Env Var Retrieval:** Demonstrates how to load an example environment variable from the configuration file.
- **CLI Support:** Provides a command-line interface via `mcp[cli]` for easy local development and testing.
- **Standard I/O Transport:** Integrates with development environments using standard I/O for seamless communication.

## Installation

1. **Clone the Repository**

   ```bash
   git clone <repository_url>
   cd <repository_directory>
   ```
````

2. **Setup Virtual Environment**

   Create and activate a Python virtual environment:

   ```bash
   python -m venv .venv
   ```

   On Linux and macOS:

   ```bash
   source .venv/bin/activate
   ```

   On Windows:

   ```bash
   .venv\Scripts\activate
   ```

3. **Install Dependencies**

   Install the MCP package and its CLI extensions with:

   ```bash
   pip install mcp mcp[cli]
   ```

## Testing the Server Locally

To run the MCP server locally, execute:

```bash
mcp dev mcp-server.py
```

After starting the server, open the provided URL in your browser. Click on **Connect**, then click on **List Templates**, select one and add your name, and finally click **Read Resources** to verify the output. You can also click on **Tools**, choose one, input the required values, and click **Run Tool** to test tool functionality.

## Integrating with Cursor AI

This project includes a `mcp.json` configuration that allows Cursor AI to discover and launch your MCP server automatically. Open or create the `mcp.json` file with the following structure:

```json
{
  "mcpServers": {
    "MCP Server": {
      "command": "/path/to/mcp-server-python/.venv/bin/python3",
      "args": ["/path/to/mcp-server-python/mcp-server.py"],
      "env": {
        "API_KEY": "abc-1234567890"
      }
    }
  }
}
```

- **mcpServers:**  
  An object mapping server names to their configuration.

- **MCP Server:**  
  This is the key for your server configuration. You can name it as you like.

- **command:**  
  Specifies the absolute path to your Python executable from the virtual environment. For example:

  ```
  /home/john/mcp-server-python/.venv/bin/python3
  ```

- **args:**  
  An array containing the absolute path to your MCP server file. For example:

  ```
  ["/home/john/mcp-server-python/mcp-server.py"]
  ```

- **env:** (Optional)  
  Defines environment variables for your MCP server process. In this example, the `API_KEY` is set to `"abc-1234567890"`. Adjust this value as needed for your environment.

You can also move the `mcp.json` file to your global Cursor AI configuration directory located at `~/.cursor` to make the configuration available globally.

## Using the MCP Tool in Cursor Composer (Agent Mode)

With the MCP server integrated into Cursor AI and with Agent mode enabled in Cursor Composer, simply use a natural language prompt like:

```
add 3 and 5
```

or

```
what is my API key?
```

The AI agent will infer the available `add` or `getApiKey` tool from your MCP server and execute it accordingly.

## Code Overview

The project comprises the following key parts:

- **MCP Server Initialization:**  
  The MCP server is instantiated using the MCP library and connected via standard I/O transport.

- **Tool Definitions:**
  - **add:**  
    Defined to accept two numeric inputs and return their sum.
  - **getApiKey:**  
    Retrieves the API key from the environment variable `API_KEY` and returns it.

## What is MCP?

**Model Context Protocol (MCP)** provides a standardized approach to integrate custom tools into AI-assisted development environments. With MCP, you can define tools that perform specific tasks—such as retrieving external data, validating code, or enforcing coding standards—and the AI assistant in your IDE can call these tools automatically based on context. This helps improve developer productivity, ensures consistent quality, and streamlines workflows.

## Reference & Sources

- [How to Build MCP Servers and Clients from Scratch](https://dev.to/composiodev/how-to-build-mcp-servers-and-clients-from-scratch-4o2f)
- [Model Context Protocol Introduction](https://modelcontextprotocol.io/introduction)

## License

This project is licensed under the [MIT License](LICENSE).
