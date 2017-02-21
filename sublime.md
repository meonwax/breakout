# Help for using Sublime Text 3 in development

## Lua Love
The [Lua Love Package](https://sublime.wbond.net/packages/Lua%20Love) provides syntax highlighting, snippets, autocompletion and build rules.

* Install [Package Control}(https://packagecontrol.io/installation), restart Sublime.
* Press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> to open the *command palette* and use the *Package Control: Install Package* command.
* Wait until another input field appears and install the *Lua Love* package.
* In the *command palette* enable syntax highlighting with *Set Syntax: Lua (Love)*.

## Build system
You can use the simple build system that is provided in the project file `breakout.sublime-workspace`. Choose *Tools -> Build System -> Run with LÖVE*.
Press <kbd>Ctrl</kbd>+<kbd>B</kbd> to run the game.

## Fixing Lua indenting
* Install *PackageResourceViewer* using *Package Control*
* Run *PackageResourceViewer: Open Resource*
* Select *Lua* then *Indent.tmPreferences*

Paste the following snippet into that file:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>name</key>
        <string>Indent</string>
        <key>scope</key>
        <string>source.lua</string>
        <key>settings</key>
        <dict>
            <key>decreaseIndentPattern</key>
            <string>^\s*(else|end|\})\s*$|^\s*elseif\b((?!end).)*$</string>
            <key>increaseIndentPattern</key>
            <string>^\s*(else|elseif|for|(local\s+)?function|if|repeat|until|while)\b((?!end).)*$|.*\{\s*$</string>
        </dict>
        <key>uuid</key>
        <string>411468A8-E0AC-415A-9E71-E2BD091EB571</string>
    </dict>
    </plist>

* Find your Packages directory using *Preferences -> Browse Packages...*. Leave this window open.
* Close all Sublime Text windows
* Back in your file browser window, navigate up one directory then delete the *Cache* directory.
* Start Sublime Text again and have fun.

## References
* https://love2d.org/wiki/Sublime_Text
* http://blog.lotech.org/2013/04/fixing-lua-indenting-in-sublime-text.html
