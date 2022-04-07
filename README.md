# Just Demo

## A sample project to demonstrate Just

Using the [just](https://github.com/casey/just) build tool we can build, tag and run a docker image.

    just --list
    Available recipes:
        build   # Builds and tags the docker image
        changes # Generates a list of changes to update CHANGELOG.md
        default # When you run `just` this is the default
        run     # Runs the built docker image
