# brimdata-container

Dockerized Brim Data CLI tools. Defaults to `zq` executable. Not at all fit for human consumption... yet.

```Bash

zq () { docker run --rm -i arichtman/brim-data-tools:v0.0.2 $@ ; }

echo "{ 0, 3 }" | zq -z

```

## Dev notes

Handling zed/zq switching is a bit awkward, we have to use aliases or functions client-side to amend the entrypoint. Same with having to put the indicator for stdin _after_ our query/transformation string. I'm thinking this may require an entrypoint script. There's also some OCI issue with the distroless but it might be a difference in build chain since we use Podman and GitHub actions is using buildx. I've also noted that Dependabot apparently can't be configured to look for anything other than 'dockerfile' (case insensitive). Further to that there's no dependabot support for GitHub releases, so we'd have to craft our own action to read that and update the Dockerfile.
