![PoshBot logo](https://avatars1.githubusercontent.com/u/26032430?s=200&v=4)

# PoshBot Cookbook

This cookbook installs and configures a PoshBot instance on a Windows machine.

## Requirements

- Chef 12.9+

### Platforms

- Windows

### Dependencies

- [Non Sucking Service Manager (NSSM)](https://nssm.cc/) (included in the recipe)

## Usage

Add `recipe[poshbot::default]` to your run list.

### Attributes

These attributes control the deployment of the PoshBot instance. 

All attributes below are pre-pended with `node['poshbot']`

| Attribute       | Description                                                                                         | Type   | Default            |
|-----------------|-----------------------------------------------------------------------------------------------------|--------|--------------------|
| logdirectory    | Directory that PoshBot will store logs                                                              | String | C:\poshbot         |
| botadmins       | Slack usernames of PoshBot admins                                                                   | String | name1, name2       |
| plugindirectory | Directory that PoshBot will store plugins, and where it will look for new ones to install           | String | C:\poshbot\plugins |
| token           | Slack bot token. See [here](https://api.slack.com/bot-users#creating-bot-user) for more information | String | your-bot-token     |

## Testing

Testing was performed on Windows 10 v1803, Windows 10 v1803, and Windows Server 2019.

## License & Maintainer

Maintainer: Kyle Levenick (kyle@levenick.io)

Shout out to [Garrett Yamada](https://garrettyamada.com/) for the assistance in testing and helping me understand Chef attributes and templates.

License: MIT
