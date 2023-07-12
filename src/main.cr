require "../../git_helpers/src/git"

begin
  commit_number = Git.commit_number!
  Git.add_dot!
  Git.commit!("sync auto-commit: ##{commit_number}")
  Git.pull!(rebase: true)
  Git.push!
rescue ex
  message = ex.message
  if message && message == "Everything up-to-date"
    puts message
    exit(0)
  else
    STDERR.puts "ERROR: #{ex.message}"
    exit(3)
  end
end

puts "OK."
