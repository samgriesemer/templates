To fix problems with italics on local Mac installation and integration with iTerm2, we need to create a file named `xterm-256color-italic.terminfo` with the following contents:

        # A xterm-256color based TERMINFO that adds the escape sequences for italic.
        xterm-256color-italic|xterm with 256 colors and italic,
          sitm=\E[3m, ritm=\E[23m,
          use=xterm-256color,

    This file can be placed anywhere, and once it's created, run `tic xterm-256color-italic.terminfo` for the file to be processed properly (not exactly sure what this does but I don't really care). You can then go to iTerm2 and change the Report Terminal Type: `xterm-256color-italic.terminfo`. This solved all of my issues, enabling in-file comment italics and Markdown italics to show properly. If you face problems like this in the future, consider referencing [this article](https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/), or this [SO post](https://apple.stackexchange.com/questions/266333/how-to-show-italic-in-vim-in-iterm2).

    Also: the above article is awesome. It helped me fix the following issue. I figured the local terminal configuration would apply even after SSHing into my cloud server. Turns out this is not true; iTerm2 (or some lower level process) is referencing those settings processed by `tic` on the *current machine*; that is, if I'm opening Vim on my Mac it's expected a registry entry on the Mac, if I'm sshed into my server it's expected a local registry on that machine. Repeating the above procedure for creating the `xterm-256color-italic` file on the server allows me to reproduce everything I saw locally.
