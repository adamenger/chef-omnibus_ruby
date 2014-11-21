# default version of ruby to install
default['omnibus_ruby']['version'] = '2.1.2'

# IMPORTANT! You must override this setting in order for the cookbook to work properly. 
# You can host your package anywhere, but this should be the subdirectory in which the package lives.
# e.g: http://your-site.com/downloads
default['omnibus_ruby']['download_url'] = "https://s3.amazonaws.com/your-bucket"
default['omnibus_ruby']['package_checksum'] = "your-checksum"

# path where we want to download the ruby package to, no trailing slash please!
default['omnibus_ruby']['download_path'] = "/tmp"

# array of packages needed for ruby
default['omnibus_ruby']['packages'] = \
[
  'libxml2-dev',
  'libxslt-dev',
  'libssl-dev',
  'libyaml-dev'
]
