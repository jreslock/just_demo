
#!/usr/bin/env just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

# Logging config
log := "warn"

export JUST_LOG := log

# Recipes
default:
    just --list

pwd:
    basename $(pwd)

git_sha:
    git rev-parse --short HEAD

generate_tag:
    just pwd+"-"+just git_sha

build:
    docker build . -t 

run:
    docker run --rm 

changes:
    git log --pretty=format:%s >> CHANGELOG.md

# Local Variables:
# mode: makefile
# End:
# vim: set ft=make :