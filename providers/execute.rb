require 'chef/mixin/shell_out'

include Chef::Mixin::ShellOut

def load_current_resource
  # the path of the ruby install assumes omnibus was built with ruby_<version>
  @path                         = ["/opt/ruby_#{new_resource.ruby_version}/embedded/bin"] + new_resource.path + system_path
  @environment                  = new_resource.environment
  @environment["PATH"]          = @path.join(":")

  new_resource.environment(@environment)
end

action :run do

  execute new_resource.name do
    command     new_resource.command
    creates     new_resource.creates
    cwd         new_resource.cwd
    environment new_resource.environment
    group       new_resource.group
    returns     new_resource.returns
    timeout     new_resource.timeout
    user        new_resource.user
    umask       new_resource.umask
  end

  new_resource.updated_by_last_action(true)
end

private

def system_path
  shell_out!("echo $PATH").stdout.chomp.split(':')
end
