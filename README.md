# Template Bifrost

Template Bifrost is a living template designed to serve as a local Model Context Protocol (MCP) gateway—and optionally an LLM gateway—for developers.

Because environments and requirements differ wildly between platforms, there is only so much that can be configured out of the box. This template provides a starting point that you can configure to suit your specific needs.

## Getting Started

### 1. Clone the repository
```bash
git clone <repository-url>
cd open-bifrost
```

### 2. Configure Bifrost
Edit `config/bifrost.json` directly. For more details on the configuration structure, please refer to the Bifrost documentation.
* [MCP Config](https://docs.getbifrost.ai/mcp/connecting-to-servers)
* [Provider Config](https://docs.getbifrost.ai/quickstart/gateway/provider-configuration)
* [Virtual Keys Config](https://docs.getbifrost.ai/features/governance/virtual-keys)

### 3. Tweak the Config
Modify the Bifrost configuration to your specific needs. This includes:
- Adding AI providers.
- Adding non-OAuth MCP servers.
- Optionally configuring virtual keys.

### 4. Setup Bifrost Environment Variables
Rename `.bifrost.env.template` to `.bifrost.env` and fill in the necessary keys.

You will need to generate a `BIFROST_ENCRYPTION_KEY`. You can easily generate a random, secure key using OpenSSL:
```bash
openssl rand -base64 32
```
Add the generated string to the `BIFROST_ENCRYPTION_KEY` variable in your `.bifrost.env` file.

### 5. Setup Docker MCP Gateway Environment Variables
Rename `.gateway.env.template` to `.gateway.env`.

Adding new servers to the Docker MCP gateway is as simple as:
1. Adding `--servers=` arguments to the Docker Compose setup.
2. Mapping any required secrets in `.gateway.env` or providing configuration in `config/gateway-mcp.yaml`.

*Reference:* [Docker MCP Gateway Secrets Example](https://github.com/docker/mcp-gateway/tree/main/examples/secrets)

**Note:** You should actually only use the Docker gateway when it's an MCP you need to host locally. This is the opposite of public, web-accessible MCPs (like Exa or Context7), which you can connect to directly.

### 6. Proxying Host Machine MCPs
Finally, check out [docs/PROXIES.md](docs/PROXIES.md) for instructions on allowing Bifrost to proxy host machine MCPs.

The main reason to do this is to leverage Bifrost's **Code Mode** for a LOT of token savings. This is especially important and useful when working with bulky MCP servers like JetBrains IDEs.
