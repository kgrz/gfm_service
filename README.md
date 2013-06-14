Note: Under Construction
## Description

A webservice that converts plain-text markdown to HTML and returns a JSON response.
 The app follows the GitHub's V3 Markdown conversion API


## Installation

Add this to your Gemfile:

    gem 'gfm_service', :git => 'git://github.com/kgrz/gfm_service.git'

and run:

    bundle


## Usage

Once the gem is installed, start the service:

    gfm_service -sv -port 9000

Or, if you use a Procfile:

    web: bundle exec gfm_service -sv -port 9000
