directory 'C:\poshbot' do
    mode '0755'
end

powershell_package 'poshbot'

template 'C:\poshbot\config.psd1' do
    source 'config.psd1.erb'
    mode '0755'
    variables(logdirectory: node['poshbot']['logdirectory'],
        botadmins: node['poshbot']['botadmins'],
        configurationdirectory: node['poshbot']['configurationdirectory'],
        plugindirectory: node['poshbot']['plugindirectory'],
        token: node['poshbot']['token'])
end

cookbook_file 'C:\poshbot\start-poshbot.ps1' do
    source 'start-poshbot.ps1'
    mode '0755'
end

nssm 'poshbot' do
    program 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
    args '-ExecutionPolicy Bypass -NoProfile -File C:/poshbot/start-poshbot.ps1'
    action :install
end

nssm 'poshbot' do
    action :start
end