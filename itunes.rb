#!/usr/bin/env ruby

require "shellwords"
require "open3"
require "json"

def osascript(script, *args)
  out, err, status = Open3.capture3("osascript", "-l", "JavaScript", "-e", script, *args)
  unless status.success?
    raise err
  end
  [out, err, status]
end

def get_names
  script = <<-JS
  function run(argv) {
    var itunes = Application("iTunes");
    var selection = itunes.browserWindows[0].selection();
    var names = [];

    for (var i in selection) {
      names.push(selection[i].name());
    }

    return JSON.stringify(names);
  }
  JS

  out, err, status = osascript(script)
  JSON.parse(out)
end

def set_names(names)
  script = <<-JS
  function run(argv) {
    var itunes = Application("iTunes");
    var selection = itunes.browserWindows[0].selection();
    var names = JSON.parse(argv[0]);

    for (var i in selection) {
      selection[i].name = names[i];
    }
  }
  JS

  out, err, status = osascript(script, names.to_json)
end
