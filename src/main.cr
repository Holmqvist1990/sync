require "../../git_helpers/src/git"

begin
  commit_number = Git.commit_number!
rescue ex
  STDERR.puts "cm: #{ex.message}"
  exit(3)
end
begin
  Git.add_dot!
rescue ex
  STDERR.puts "ad: #{ex.message}"
  exit(3)
end
begin
  Git.commit!("sync auto-commit: ##{commit_number}")
rescue ex
  STDERR.puts "ct: #{ex.message}"
  exit(3)
end
begin
  Git.pull!(rebase: true)
rescue ex
  STDERR.puts "pl: #{ex.message}"
  exit(3)
end
begin
  Git.push!
rescue ex
  STDERR.puts "ps: #{ex.message}"
  exit(3)
end

puts "done"
