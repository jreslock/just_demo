
#!/usr/bin/env just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

# Logging config
log := "warn"

export JUST_LOG := log

# Recipes
default:
    just --list

pwd := `basename $(pwd)`
git_sha := `git rev-parse --short HEAD`
tag_name := pwd + "-" + git_sha

build:
    docker build . -t {{tag_name}}

run:
    docker run --rm {{tag_name}}:latest

changes:
    git log --pretty=format:%s >> CHANGELOG.md

# Local Variables:
# mode: makefile
# End:
# vim: set ft=make :