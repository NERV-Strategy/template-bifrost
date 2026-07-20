# OpenCode

This file contains specific opencode examples.

## Provider Config

### Standard OpenAI-compatible API connection

By default, the most common way to connect to bifrost would be the OpenAI-compatible connection.

```json5
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "openai": {
      "name": "Bifrost",
      "options": {
        "baseURL": "http://localhost:8080/openai",
        "apiKey": "{file:./.opencode.env}"
      }
    }
  }
}
```

**Note: OpenRouter**
Although you can connect to Bifrost usings its built-in `"openrouter"` provider, it will break.
E.g. The native OpenCode provider for OpenRouter uses native anthropic endpoints and will fail for all anthropic models.
Alternatively you can limit models using the `models` key for each provider, but this becomes an admin burden.

### Native Integrations

Bifrost supports some native API formats, making the providers appear just like they would if you connected directly to them.

For the Gemini API the config would look like this

```json5
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "google": {
      // Note: This is the Gemini API connector
      "name": "Bifrost-Gemini",
      "options": {
        "baseURL": "http://localhost:8080/genai/v1beta",
        "apiKey": "{file:./.opencode.env}"
      }
    },
    "anthropic": {
      "name": "Bifrost-Anthropic",
      "options": {
        "baseURL": "http://localhost:8080/anthropic/v1",
        "apiKey": "{file:./.opencode.env}"
      }
    }
  }
}
```

See [Bifrost OpenCode Setup](https://docs.getbifrost.ai/cli-agents/opencode) for more info.

Other providers are supported.