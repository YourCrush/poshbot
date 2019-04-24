#
# Cookbook:: poshbot
# Recipe:: poshbot
#
# MIT License
# 
# Copyright (c) 2019 Automation Twins (Kyle Levenick & Garrett Yamada)
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

return unless platform?('windows') 

directory node['poshbot']['configurationdirectory'] do
    mode '0755'
end

powershell_package 'poshbot'

template "#{node['poshbot']['configurationdirectory']}\\\\config.psd1" do
    source 'config.psd1.erb'
    mode '0755'
    variables(logdirectory: node['poshbot']['logdirectory'],
        botadmins: node['poshbot']['botadmins'],
        configurationdirectory: node['poshbot']['configurationdirectory'],
        plugindirectory: node['poshbot']['plugindirectory'],
        token: node['poshbot']['token'])
end

template "#{node['poshbot']['configurationdirectory']}\\\\start-poshbot.ps1" do
    source 'start-poshbot.ps1.erb'
    mode '0755'
    variables(configurationdirectory: node['poshbot']['configurationdirectory'])
end

nssm 'poshbot' do
    program 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
    args "-ExecutionPolicy Bypass -NoProfile -File #{node['poshbot']['configurationdirectory']}/start-poshbot.ps1"
    action :install
end

nssm 'poshbot' do
    action :start
end