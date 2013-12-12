#
# Cookbook Name:: dotfiles
# Recipe:: default
#

package 'git-core'

# Configure any users listed in data_bags/users/*.json that
# are members of sysadmin group and not being removed
search("users", "groups:sysadmin NOT action:remove") do |u|

  repo = u['dotfiles-repo'] || ''
  next if repo.empty?

  home   = "/home/#{u['id']}"
  dotdir = "#{home}/.dotfiles"
  git dotdir do
    repository repo
    user u['id']
    group u['id']
    action :sync
    only_if { File.directory?(home) }
  end

  script = "#{dotdir}/configure.sh"
  execute script do
    user u['id']
    command script
    only_if { File.exists?(script) }
  end

end
