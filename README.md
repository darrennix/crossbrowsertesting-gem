# CrossBrowserTesting Screenshots

A ruby gem for [CrossBrowserTesting](http://crossbrowsertesting.com)'s screenshots API.

## Installation

Add this line to your application's Gemfile:

    gem 'crossbrowsertesting-gem'

And then execute:

    bundle

Or install it yourself as:

    gem install crossbrowsertesting-gem

## Example of Use

If you are not using Rails, you'll need to require hte gem:

``` ruby
require 'CBT'
```

### Creating Client
Creates a new client instance.

``` ruby
client = CBT.new('username', 'password')
```

###API

####Getting available os and browsers
Fetches all available browsers.

``` ruby
puts client.browsers 	#returns a hash

:response=>{
    :error=>0, 
    :message=>"", 
    :oss=>[
        {
            :name=>"Android 4.0 Simulator", 
            :api_name=>"Android4.0", 
            :type=>"Android", 
            :version=>"4.0", 
            :device=>"mobile", 
            :icon=>"http://crossbrowsertesting.com/images/software_logos/android15.png", 
            :browsers=>[
                {
                    :name=>"Android Browser 4.0", 
                    :api_name=>"Android4.0", 
                    :type=>"Android Browser", 
                    :version=>"4.0", 
                    :device=>"mobile", 
                    :major_browser=>1, 
                    :icon=>"http://crossbrowsertesting.com/images/software_logos/android-browser15.png",
                    :default_config=>"Android4.0"
                }
            ], 
            :other_software=>[
                {
                    :name=>"Base install - no additional software added", 
                    :type=>"None", 
                    :version=>"", 
                    :icon=>"http://crossbrowsertesting.com/images/software_logos/15.png"
                }
            ], 
            :resolutions=>[
                {
                    :name=>"480x800", 
                    :width=>480, 
                    :height=>800, 
                    :default=>1
                }
            ]
        },
        ...
    ]
}
```