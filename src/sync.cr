require "./git"

log, err = git_log()
unless err.empty?
  STDERR.puts err
  exit
end

new_version = log.split("\n").size

err = git_add()
unless err.empty?
  STDERR.puts err
end

err = git_commit(new_version)
unless err.empty?
  STDERR.puts err
end

err = git_push()
unless err.empty?
  STDERR.puts err
end

puts "done"

# result = Process.run("git", ["add", "."])
# if result.success?
#   puts "Git add succeeded"
# else
#   puts "Git add failed"
#   puts "Exit code: #{result.exit_code}"
# end
