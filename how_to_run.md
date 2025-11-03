
# Prerequisites

- git
- docker or podman
- docker compose v2 or podman compose

> Install containerization software according to the official maintainer documentation. Avoid package managers when not recommended, as they frequently cause compatibility issues.

# Clone this repo

```bash
git clone https://github.com/frappe/frappe_docker
cd frappe_docker
```

# Define custom apps

If you dont want to install specific apps to the image skip this section.

To include custom apps in your image, create an `apps.json` file in the repository root:

```json
[

  {
    "url": "https://github.com/inxeoz/mahakaal_darshan",
    "branch": "develop"
  }

]
```

Then generate a base64-encoded string from this file:

```bash
export APPS_JSON_BASE64=$(base64 -w 0 apps.json)
```
### windows

```
$env:APPS_JSON_BASE64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes((Join-Path $PWD "apps.json")))
```

# Build the image
`Docker`:

```bash
docker compose -f pwd.yml build
```

`Podman`:

```bash
podman build \
 --build-arg=FRAPPE_PATH=https://github.com/frappe/frappe \
 --build-arg=FRAPPE_BRANCH=version-15 \
 --build-arg=APPS_JSON_BASE64=$APPS_JSON_BASE64 \
 --tag=custom:15 \
 --file=images/layered/Containerfile .
```
# Run container 

```bash
docker compose -f pwd.yml up -d
```

```bash
 FRONTEND_PORT=8890 docker compose -f pwd.yml up -d
```
or
```bash
 FRONTEND_PORT=8890 docker compose  --project-name mahakaal -f pwd.yml up -d
```

### windows

```bash
$env:FRONTEND_PORT = "8080"
docker compose  -f pwd.yml up -d
```

# CACHE_BUSH

```bash
CACHE_BUST=$(date +%s) docker compose -f pwd.yml build backend

```
### in windows
```bash
$env:CACHE_BUST = [int](Get-Date -UFormat %s)
docker compose -f pwd.yml build --build-arg CACHE_BUST=$env:CACHE_BUST

```


#TOPCIS

> --no-cache
