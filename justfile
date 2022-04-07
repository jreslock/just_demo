
#!/usr/bin/env just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

# Logging config
log := "warn"

export JUST_LOG := log

# When you run `just` this is the default
default:
    just --list

pwd := `basename $(pwd)`
git_sha := `git rev-parse --short HEAD`
tag_name := pwd + "-" + git_sha

# Builds and tags the docker image
build:
    docker build . -t {{tag_name}}

# Runs the built docker image
run:
    docker run --rm {{tag_name}}:latest

# Generates a list of changes to update CHANGELOG.md
changes:
    git log --pretty=format:%s >> CHANGELOG.md

# Local Variables:
# mode: makefile
# End:
# vim: set ft=make :