# the basics
include_recipe "apt::default"

# install our base packages for our ruby install
node['omnibus_ruby']['packages'].each do |p|
  package p
end

# construct package name and url from attributes
package_name = "ruby_#{node['omnibus_ruby']['version']}.deb"
package_url  = "#{node['omnibus_ruby']['download_url']}/#{package_name}"
package_checksum = node['omnibus_ruby']['package_checksum']

# download the ruby package to our download_path attribute
remote_file "#{node['omnibus_ruby']['download_path']}/#{package_name}" do
  action   :create
  checksum package_checksum
  source   package_url
end

# install the ruby package we've downloaded
package "Installing Ruby #{node['omnibus_ruby']['version']}" do
  provider Chef::Provider::Package::Dpkg
  source "#{node['omnibus_ruby']['download_path']}/#{package_name}"
  action :install
end
