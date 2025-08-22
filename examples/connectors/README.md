# Connector examples

A list of available connector examples

## Git

### YAML example - connects to the Kvatch cli repo in github
```yaml
connectors:
  - name: kvatch-git-repo
    type: GIT
    connection:
      repo: "https://github.com/kvatch-hub/kvatch-cli.git"
      path: "examples/quickstart/data"
      branch: "main"  
    desc: "the public kvatch-cli repo"
```

### JSON example - connects to the Kvatch cli repo in github

```json
{
  "connectors": [
    {
      "name": "kvatch-git-repo",
      "type": "GIT",
      "connection": {
        "repo": "https://github.com/kvatch-hub/kvatch-cli.git",
        "path": "examples/quickstart/data",
        "branch": "main"
      },
      "desc": "the public kvatch-cli repo"
    }
  ]
}

```