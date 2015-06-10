# AdaptPI
A tool to help npm module developers make API transitions less painful for their users. It works by parsing changes of a module between two different commits and generating a skeleton adapter depending on how the methods have changed from the old to new version.

## Setup
* assuming you have npm and nodejs installed already

        npm install

## Usage
        coffee app.coffee --repo=[../repo/base/dir/] --target=[relative/to/--repo] --old=[OldApiSHA] --new=[NewApiSHA]  >  adapter.coffee
        # move the generated adapter.coffee to the same directory as the target module. replace any reference to the target module with adapter.coffee
## Example
        # Optional: generate the adapter to go from v1 to v2, or just use the existing one
        # Repo: this one
        # Target: example_module.coffee in the example folder
        # example_module.coffee OLD SHA: 3fbd743d7f7c259a607872ca6ff2acb70de97408
        # the above version of example_module.coffee can be found in old_example_module.coffee without having to checkout the commit
        # example_module.coffee NEW SHA: 73c88d51b33b9a413bc23281c01ddfca76603319
        # Pipe: outputed skeleton to the example folder
        coffee app.coffee --repo=./ --target=example/example_module.coffee --old=3fbd743d7f7c259a607872ca6ff2acb70de97408 --new=73c88d51b33b9a413bc23281c01ddfca76603319 > example/adapterv1-v2.coffee

        # run some examples using different versions of the module
        cd example
        coffee example_usage.coffee old_example_module.coffee      #directly using v1 of module
        coffee example_usage.coffee example_module.coffee          #directly using v2 of module
        coffee example_usage.coffee adapterv1-v2.coffee            #using generated adapter for usage as if v1, translated to v2 usage

