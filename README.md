# MCP Content Summarizer Server
[![smithery badge](https://smithery.ai/badge/@0xshellming/mcp-summarizer)](https://smithery.ai/server/@0xshellming/mcp-summarizer)

A Model Context Protocol (MCP) server that provides intelligent summarization capabilities for various types of content using Google's Gemini 1.5 Pro model. This server can help you generate concise summaries while maintaining key information from different content formats.

<a href="https://3min.top"><img width="380" height="200" src="/public/imgs/section1_en.jpg" alt="MCP Content Summarizer Server" /></a>

## Powered by 3MinTop

The summarization service is powered by [3MinTop](https://3min.top), an AI-powered reading tool that helps you understand a chapter's content in just three minutes. 3MinTop transforms complex content into clear summaries, making learning efficient and helping build lasting reading habits.

## Features

- Universal content summarization using Google's Gemini 1.5 Pro model
- Support for multiple content types:
  - Plain text
  - Web pages
  - PDF documents
  - EPUB books
  - HTML content
- Customizable summary length
- Multi-language support
- Smart context preservation
- Dynamic greeting resource for testing

## Getting Started

1. Clone this repository
2. Install dependencies:
   ```
   pnpm install
   ```

3. Build the project:
   ```
   pnpm run build
   ```

4. Start the server:
   ```
   pnpm start
   ```

## Development

- Use `pnpm run dev` to start the TypeScript compiler in watch mode
- Modify `src/index.ts` to customize server behavior or add new tools

## Usage with Desktop App

To integrate this server with a desktop app, add the following to your app's server configuration:

```js
{
  "mcpServers": {
    "content-summarizer": {
      "command": "node",
      "args": [
        "{ABSOLUTE PATH TO FILE HERE}/dist/index.js"
      ]
    }
  }
}
```

## Installing via Smithery

To install Content Summarizer Server for Claude Desktop automatically via [Smithery](https://smithery.ai/server/@0xshellming/mcp-summarizer):

```bash
npx -y @smithery/cli install @0xshellming/mcp-summarizer --client claude
```

## Available Tools

### summarize

Summarizes content from various sources using the following parameters:
- `content` (string | object): The input content to summarize. Can be:
  - Text string
  - URL for web pages
  - Base64 encoded PDF
  - EPUB file content
- `type` (string): Content type ("text", "url", "pdf", "epub")
- `maxLength` (number, optional): Maximum length of the summary in characters (default: 200)
- `language` (string, optional): Target language for the summary (default: "en")
- `focus` (string, optional): Specific aspect to focus on in the summary
- `style` (string, optional): Summary style ("concise", "detailed", "bullet-points")

Example usage:

```typescript
// Summarize a webpage
const result = await server.invoke("summarize", {
  content: "https://example.com/article",
  type: "url",
  maxLength: 300,
  style: "bullet-points"
});

// Summarize a PDF document
const result = await server.invoke("summarize", {
  content: pdfBase64Content,
  type: "pdf",
  language: "zh",
  style: "detailed"
});
```

### greeting

A dynamic resource that demonstrates basic MCP resource functionality:
- URI format: `greeting://{name}`
- Returns a greeting message with the provided name

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 
