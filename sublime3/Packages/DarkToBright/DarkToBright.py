import sublime, sublime_plugin
PREFERENCES = 'Preferences.sublime-settings'

class Dark2brightCommand(sublime_plugin.WindowCommand):
  def run(self):
    self.preferences = sublime.load_settings(PREFERENCES)
    self.preferences.set('color_scheme', 'Packages/User/SublimeLinter/Tomorrow (SL).tmTheme')
    self.preferences.set('theme', 'Spacegray Light.sublime-theme')
    sublime.save_settings(PREFERENCES)

class Bright2darkCommand(sublime_plugin.WindowCommand):
  def run(self):
    self.preferences = sublime.load_settings(PREFERENCES)
    self.preferences.set('color_scheme', 'Packages/User/SublimeLinter/base16-ocean.dark (SL).tmTheme')
    self.preferences.set('theme', 'Spacegray.sublime-theme')
    sublime.save_settings(PREFERENCES)
