# config: utf-8
require 'fileutils'
File.open("data/sample.txt", "w") do |file|
  file.puts("one")
  file.puts("two")
end

FileUtils.touch("data/test.txt")
