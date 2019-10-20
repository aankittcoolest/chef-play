#
# Cookbook:: oh_my_zsh
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe "zsh"
include_recipe "git"

node['zsh']['users'].each do |user|
  home = Dir.home(user['username'])

  #Pull oh-my-zsh repository from git
  git "#{home}/.oh-my-zsh" do
    repository "git://github.com/robbyrussell/oh-my-zsh.git"
    reference "master"
    action :sync
  end

  execute "Pull zshrc from oh-my-zsh template" do
    command "cp #{home}/.oh-my-zsh/templates/zshrc.zsh-template #{home}/.zshrc"
  end

  execute "set zsh as default shell" do
    command "chsh -s $(which zsh) #{user['username']}"
  end

end
