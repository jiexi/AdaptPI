# AdaptPI
A tool to help npm module developers make API transitions less painful for their users. It works by parsing changes of a module between two different commits and generating a skeleton adapter depending on how the methods have changed from the old to new version.

## Setup
* assuming you have npm and nodejs installed prior

        npm install

## Usage
        coffee app.coffee --repo=[../repo/base/dir/] --target=[relative/to/--repo] --old=[OldApiSHA] --new=[NewApiSHA]  >  adapter.coffee
        # move adapter.coffee to the same directory as the target module. replace any reference to the target module with adapter.coffee
## Example
        # required: regenerate the adapter for v1 to v2
        coffee app.coffee --repo=./ --target=example/example_module.coffee --old=3fbd743d7f7c259a607872ca6ff2acb70de97408 --new=503f4a28728f386a384aae007d3ff334b5345a59 > example/adapterv1-v2.coffee
        cd example
        coffee example_usage.coffee old_example_module.coffee #directly using v1 of module
        coffee example_usage.coffee example_module.coffee #directly using v2 of module
        coffee example_usage.coffee adapterv1-v2.coffee #using generated adapter for usage as if v1, translated to v2 usage

