require "./git"

begin

  new_version, err = git_commit_number()
  raise "git_commit_number: #{err}"  unless err.empty?

  err = git_add()
  raise "git_add: #{err}"  unless err.empty?

  err = git_commit(new_version)
  raise "git_commit: #{err}"  unless err.empty?

  err = git_pull()
  raise "git_pull: #{err}"  unless err.empty?

  err = git_push()
  raise "git_push: #{err}" unless err.empty? || err.includes?("To https://")
rescue ex
  STDERR.puts "ERROR: #{ex.message}"
  exit(3)
end

puts "done"
