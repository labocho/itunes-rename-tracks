#!/usr/bin/env ruby

require "shellwords"
require "open3"
require "json"

def osascript(script)
  out, err, status = Open3.capture3("osascript", "-l", "JavaScript", "-e", script)
  unless status.success?
    raise err
  end
  [out, err, status]
end

def get_names
  script = <<-JS
  var itunes = Application("iTunes");
  var selection = itunes.browserWindows[0].selection();

  for (var i in selection) {
    console.log(selection[i].name());
  }
  JS

  out, err, status = osascript(script)
  err.chomp.split("\n")
end

def set_names(names)
  script = <<-JS
  var itunes = Application("iTunes");
  var selection = itunes.browserWindows[0].selection();
  var names = #{names.to_json};

  for (var i in selection) {
    selection[i].name = names[i];
  }
  JS

  out, err, status = osascript(script)
  err.chomp.split("\n")
end
