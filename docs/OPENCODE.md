# OpenCode

This file contains specific opencode examples.

## Provider Config

### Standard OpenAI-compatible API connection

By default, the most common way to connect to bifrost would be the OpenAI-compatible connection.

```json5
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "openrouter": {
      // OpenRouter is OpenAI-compatible by default, so nothing special needed here.
      "options": {
        "baseURL": "http://localhost:8080/v1",
        // we override the url
        "apiKey": "{file:./.opencode.env}"
      }
    },
    "bifrost": {
      // This is the Custom OpenAI-compatible API connector
      "npm": "@ai-sdk/openai-compatible",
      "name": "Bifrost LLM Gateway",
      "options": {
        "baseURL": "http://localhost:8080/v1",
        // we override the url
        "apiKey": "{file:./.opencode.env}"
      }
    }
  }
}
```

### Native Integrations

Bifrost supports some native API formats, making the providers appear just like they would if you connected directly to them.

For the Gemini API the config would look like this

```json5
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "google": {
      // Note: This is the Gemini API connector
      "options": {
        "baseURL": "http://localhost:8080/genai/v1beta",
        // we override the url
        "apiKey": "{file:./.opencode.env}"
      }
    }
  }
}
```

See `https://docs.getbifrost.ai/api-reference/genai-integration/generate-content-gemini-format` for more info.

Other providers (like Anthropic) are supported.