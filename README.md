# Dotfiles chef-recipe

This Chef recipe configures your Linux "dotfiles" from a git repository so that they can be identical across multiple computers. It is designed to play nicely with the Opscode "users" Chef recipe; it works for configuring users in the sysadmins group (only). Unlike some other recipes, this one leaves the heavy lifting to a configuration script included with the dotfiles.

## Configuration
    
    knife data bag create admins <username>
    knife data bag edit admins <username>

Syntax:

  <pre> {
    "id": "USERNAME",
    "groups": [ "sysadmin" ],
    "dotfiles-repo": "GIT REPOSITORY URL"
  }</pre>

Example:

  <pre> {
    "id": "pat",
    "groups": [ "sysadmin" ],
    "dotfiles-repo": "git@github.com:webcoyote/dotfiles.git"
  }</pre>

## Dotfiles repository structure

The dotfiles repository MUST include the file ./configure.sh which will be called after the repository has been cloned. For an example see https://github.com/webcoyote/dotfiles which has this structure:

<pre>
.
├── configure.sh
├── home
│   ├── bin
│   │   ├── ff
│   │   ├── logoff
│   │   ├── ... lots more ...
│   │   └── zsh-theme
│   ├── .vimrc
│   ├── .... lots more ...
│   └── .zshrc
└── README.md
</pre>

