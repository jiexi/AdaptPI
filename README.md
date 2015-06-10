# AdaptPI
A tool to help npm module developers make API transitions less painful for their users. It works by parsing changes of a module between two different commits and generating a skeleton adapter depending on how the methods have changed from the old to new version.

## Setup
* assuming you have npm and nodejs installed prior

        npm install

## Usage
        coffee app.coffee --repo=[../repo/base/dir/] --target=[relative/to/--repo] --old=[OldApiSHA] --new=[NewApiSHA]

