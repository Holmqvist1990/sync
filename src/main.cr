require "./git"

begin

  new_version, err = git_commit_number()
  raise err unless err.empty?

  err = git_add()
  raise err unless err.empty?

  err = git_commit(new_version)
  raise err unless err.empty?

  err = git_pull()
  raise err unless err.empty?

  err = git_push()
  raise err unless err.empty?
rescue ex
  STDERR.puts "ERROR: #{ex.message}"
end

puts "done"
