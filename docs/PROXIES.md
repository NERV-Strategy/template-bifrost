# Proxies

This allows Bifrost to access an MCP server on the host machine at a specific port.

## Configure Host Proxy

### Linux

#### 1. Create Network

##### SystemD

Create external network and configure sysctl on the network.

```shell
./bin/setup_systemd_external_network.sh
```

#### 2. Add Routes for Port Forward

##### Firewalld

> per port e.g. `64342`

```shell
./bin/add_firewalld_route.sh 64342
```

### 3. Update Nginx Upstreams

For each port the nginx config `config/host-proxy.conf` needs an additional upstream or it wont be able to proxy to that port.

```nginx
# ${GATEWAY_IP} is injected at container start via entrypoint
upstream mcp_64342 { server ${GATEWAY_IP}:64342; }
```

### Windows

No special config needed.

## Start

```shell
docker compose -f docker-compose.yml -f docker-compose.external.yml up 
```

## Bifrost Setup

### PHP Storm

MCP Server -> Add new MCP Server:

* Server Name: `PHPStorm`
* Type: `HTTP (Streamable)`
* MCP Server URL: `http://host-proxy/stream`
* Authentication: `Headers`
* Static headers:
  * `X-Target-Port`: `64342`
* Allowed Extra Headers:
  * `IJ_MCP_SERVER_PROJECT_PATH`
* Enabled Tools:
  * `execute_run_configuration`
  * `build_project`
  * `create_new_file`
  * `reformat_file`
  * `replace_text_in_file`
  * `rename_refactoring`
  * `execute_terminal_command`
  * `get_repositories`
  * `*_symfony_*`
  * `*_twig_*`
  * `*_doctrine_*`
  * `permission_prompt`
