# ---------------------------------------------------
# file:     $XDG_CONFIG_HOME/qutebrowser/config.py
# original author:   jason ryan - http://jasonwryan.com/
# fork author: chewie lin
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=python:
# ---------------------------------------------------
c.qt.args = [
             #'enable-accelerated-video-decode',
             #'use-gl=egl',
             #'ignore-gpu-blocklist',
             #'enable-features=WebRTCPipeWireCapturer',
             #'enable-features=Vulkan',
             #'enable-features=ForceDark',
             'ozone-platform-hint=auto',
             ]

# general settings
# c.url.default_page = 'file:///home/jason/Sync/browser/index.html'
c.url.start_pages = 'http://www.google.com'
c.editor.command = ["urxvt", "-title", "scratchpad", "-geometry", "86x24+40+60", "-e", "nvim", "-f", "{}"]
c.new_instance_open_target = "tab-bg"
c.prompt.filebrowser = False
c.completion.height = "30%"
c.completion.web_history.max_items = 1000
c.input.partial_timeout = 2000
c.tabs.background = True
# c.tabs.favicons.show = "never"
c.tabs.title.format = "{current_title}"
c.tabs.new_position.related = "last"
c.tabs.padding = {"bottom": 9, "left": 10, "right": 10, "top": 10}
c.tabs.title.format="{index} - {current_title}"
c.tabs.max_width=250
c.downloads.location.directory = '~/Downloads'
c.content.cache.size = 52428800
c.content.webgl = False
c.statusbar.position = 'bottom'
c.statusbar.show = 'always'
c.hints.border = "1px solid #CCCCCC"
c.hints.mode = "letter"
#c.hints.chars = "123456789"
c.hints.min_chars = 1
c.keyhint.blacklist = ["*"]
c.content.pdfjs=True
c.content.blocking.method='auto'
#c.content.plugins=False
#c.content.webgl=True

# searches
#c.url.searchengines['DEFAULT'] = 'https://www.qwant.com/?q={}'
#c.url.searchengines['DEFAULT'] = 'https://duckduckgo.com/?q={}'
c.url.searchengines['DEFAULT'] = 'http://www.google.com/search?hl=en&source=hp&ie=ISO-8859-l&q={}'
c.url.searchengines['a'] = 'https://wiki.archlinux.org/?search={}'
c.url.searchengines['g'] = 'http://www.google.com/search?hl=en&source=hp&ie=ISO-8859-l&q={}'
c.url.searchengines['y'] = 'https://www.youtube.com/results?search_query={}'
#c.url.searchengines['w'] = 'https://secure.wikimedia.org/wikipedia/en/w/index.php?title=Special%%3ASearch&search={}'
#c.url.searchengines['gh'] = 'https://github.com/search?q={}&type=Code'
#c.url.searchengines['ap'] = 'https://www.archlinux.org/packages/?sort=&q={}'
c.url.searchengines['de'] = 'https://m.dict.cc/deen/?s={}'
c.url.searchengines['dv'] = 'https://www.verbformen.com/conjugation/?w={}'
c.url.searchengines['dg'] = 'https://yourdailygerman.com/dictionary/?s={}'
c.url.searchengines['fo'] = 'https://forvo.com/search/{}'

# aliases
#c.aliases['gb'] = 'open -t https://bitbucket.org/jasonwryan/'
#c.aliases['ge'] = 'open -t https://wiki.archlinux.org/index.php/Forum_Etiquette'
#c.aliases['gf'] = 'open -t http://flickr.com/jasonwryan '
#c.aliases['gj'] = 'open -t http://jasonwryan.com'
#c.aliases['gp'] = 'open -t http://127.0.0.1:4000'
#c.aliases['gr'] = 'open -t https://feedbin.com/'

# colors
c.colors.completion.fg = "#899CA1"
c.colors.completion.category.fg = "#F2F2F2"
c.colors.completion.category.bg = "#555555"
c.colors.completion.item.selected.fg = "white"
c.colors.completion.item.selected.bg = "#333333"
c.colors.completion.item.selected.border.top = "#333333"
c.colors.completion.item.selected.border.bottom = "#333333"
c.colors.completion.match.fg = "#66FFFF"
c.colors.completion.item.selected.match.fg = c.colors.completion.match.fg
#c.colors.statusbar.normal.fg = "#899CA1"
#c.colors.statusbar.normal.bg = "#222222"
#c.colors.statusbar.insert.fg = "#899CA1"
#c.colors.statusbar.insert.bg = "green"
#c.colors.statusbar.command.bg = "#555555"
#c.colors.statusbar.command.fg = "#F0F0F0"
#c.colors.statusbar.caret.bg = "#5E468C"
#c.colors.statusbar.caret.selection.fg = "white"
#c.colors.statusbar.progress.bg = "#333333"
#c.colors.statusbar.passthrough.bg = "#4779B3"
#c.colors.statusbar.url.fg = c.colors.statusbar.normal.fg
#c.colors.statusbar.url.success.http.fg = "#899CA1"
#c.colors.statusbar.url.success.https.fg = "#53A6A6"
#c.colors.statusbar.url.error.fg = "#8A2F58"
#c.colors.statusbar.url.warn.fg = "#914E89"
#c.colors.statusbar.url.hover.fg = "white"
c.colors.tabs.bar.bg = "#1C4D8C"
c.colors.tabs.even.fg = "white"
c.colors.tabs.even.bg = c.colors.tabs.bar.bg
c.colors.tabs.odd.fg = c.colors.tabs.even.fg
c.colors.tabs.odd.bg = c.colors.tabs.even.bg
c.colors.tabs.selected.even.bg = "#ffffff"
c.colors.tabs.selected.even.fg = "#222222"
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.selected.odd.fg = c.colors.tabs.selected.even.fg
c.colors.tabs.indicator.start = "#222222"
c.colors.tabs.indicator.stop = "#222222"
c.colors.tabs.indicator.error = "#8A2F58"
c.colors.hints.bg = "#CCCCCC"
c.colors.hints.match.fg = "#000"
c.colors.downloads.start.fg = "black"
c.colors.downloads.start.bg = "#BFBFBF"
c.colors.downloads.stop.fg = "black"
c.colors.downloads.stop.bg = "#F0F0F0"
c.colors.keyhint.fg = "#FFFFFF"
c.colors.keyhint.suffix.fg = "#FFFF00"
c.colors.keyhint.bg = "rgba(0, 0, 0, 80%)"
c.colors.messages.error.bg = "#8A2F58"
c.colors.messages.error.border = "#8A2F58"
c.colors.messages.warning.bg = "#BF85CC"
c.colors.messages.warning.border = c.colors.messages.warning.bg
c.colors.messages.info.bg = "#333333"
c.colors.prompts.fg = "#333333"
c.colors.prompts.bg = "#DDDDDD"
c.colors.prompts.selected.bg = "#4779B3"

# fonts
#c.fonts.monospace = "UbuntuMono Nerd Font", "DejaVu Sans Mono", "Liberation Mono", monospace
c.fonts.tabs.selected = "UbuntuMono Nerd Font"
c.fonts.tabs.unselected = c.fonts.tabs.selected
c.fonts.statusbar = "14pt UbuntuMono Nerd Font"
c.fonts.downloads = c.fonts.statusbar 
c.fonts.prompts = c.fonts.statusbar
c.fonts.hints = "14px UbuntuMono Nerd Font"
c.fonts.messages.info = "12pt UbuntuMono Nerd Font"
c.fonts.keyhint = c.fonts.messages.info
c.fonts.messages.warning = c.fonts.messages.info
c.fonts.messages.error = c.fonts.messages.info
c.fonts.completion.entry = c.fonts.statusbar
c.fonts.completion.category = c.fonts.statusbar

# keybinds
config.unbind('q', mode='normal')
config.bind('<Ctrl-r>', 'reload', mode='normal')

config.unbind('gb', mode='normal')
config.unbind('<Ctrl-B>', mode='normal')
config.unbind('b', mode='normal')
config.bind('b', 'back', mode='normal')

config.unbind('m', mode='normal')
config.bind('m', 'forward', mode='normal')
config.bind('<Ctrl-m>', 'set-cmd-text -s :quickmark-save', mode='normal')
config.bind('<Shift-m>', 'set-cmd-text -s :quickmark-save', mode='normal')

#config.bind('<Ctrl-t>', 'set-cmd-text -s :open -t', mode='normal')
config.bind('<Ctrl-t>', 'open -t google.com', mode='normal')
config.bind('tt', 'open -t google.com', mode='normal')
config.bind('pp', 'open {primary}', mode='normal')
config.bind('<Ctrl-Right>', 'tab-next', mode='normal')
config.bind('<Ctrl-Left>', 'tab-prev', mode='normal')
config.bind('<Ctrl-Shift-Right>', 'tab-move +', mode='normal')
config.bind('<Ctrl-Shift-Left>', 'tab-move -', mode='normal')

config.bind('<Escape>', 'leave-mode', mode='passthrough')

config.bind('j', 'scroll-px 0 200', mode='normal')
config.bind('k', 'scroll-px 0 -200', mode='normal')
config.bind(';v', 'hint links spawn mpv --force-window=immediate --geometry="800x450" --ytdl-format="best[height=360]" {hint-url}', mode='normal')
config.bind('V', 'spawn mpv --force-window=immediate --geometry="800x450" --ytdl-format="best[height=360]" {url}', mode='normal')

#config.bind('gi', 'enter-mode insert ;; jseval --quiet var inputs = document.getElementsByTagName("input"); for(var i = 0; i < inputs.length; i++) { var hidden = false; for(var j = 0; j < inputs[i].attributes.length; j++) { hidden = hidden || inputs[i].attributes[j].value.includes("hidden"); }; if(!hidden) { inputs[i].focus(); break; } }')
#config.bind('<Ctrl-p>', 'jseval document.location=\'https://pinboard.in/add?next=same&url=\'+encodeURIComponent(location.href)+\'&title=\'+encodeURIComponent(document.title)', mode="normal")
config.load_autoconfig()

import os
home = os.getenv('HOME')
config.source(home+'/.config/qutebrowser/qutewal.py')
c.colors.tabs.bar.bg = "orange"
c.colors.tabs.even.bg = c.colors.tabs.bar.bg
c.colors.tabs.odd.bg = c.colors.tabs.bar.bg
