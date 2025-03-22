from mcp.server.fastmcp import FastMCP
import os

mcp = FastMCP("MCP Server")


@mcp.tool()
def add(a: int, b: int) -> int:
    """Add two numbers"""
    return a + b


@mcp.tool()
def getApiKey() -> str:
    """Get the API key"""
    return os.getenv("API_KEY")


@mcp.resource("greeting://{name}")
def greeting(name: str) -> str:
    """Ger a personalized greeting"""
    return f"Hello, {name}!"


if __name__ == "__main__":
    mcp.run(transport="stdio")
