# AdaptPI
A tool to help npm module developers make API transitions less painful for their users. It works by parsing changes of a module between two different commits and generating a skeleton adapter depending on how the methods have changed from the old to new version.

## Setup
* assuming you have npm and nodejs installed prior

        npm install

## Usage
        coffee app.coffee --repo=[../repo/base/dir/] --target=[relative/to/--repo] --old=[OldApiSHA] --new=[NewApiSHA]

## Example
        coffee app.coffee --repo=./ --target=example/example_module.coffee --old=3fbd743d7f7c259a607872ca6ff2acb70de97408 --new=503f4a28728f386a384aae007d3ff334b5345a59 > example/adapterv1-v2.coffee


