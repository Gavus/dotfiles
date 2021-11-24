### vimrc:

+ nvim-lsp-installer
I need to modify the curl arguments in  .vim/plugged/nvim-lsp-installer/lua/nvim-lsp-installer/installers/context.lua:31 into:
```
            args = { "-s --interface eth0 -u root:pass --noproxy \"*\" --anyauth", url },
```
