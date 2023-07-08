require "./git"

begin
  log, err = git_log()
  raise err unless err.empty?

  new_version = log.split("\n").size

  err = git_add()
  raise err unless err.empty?

  err = git_commit(new_version)
  raise err unless err.empty?

  err = git_push()
  raise err unless err.empty?
rescue ex
  STDERR.puts ex.message
end

puts "done"
