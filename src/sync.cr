require "process"

def git_log
  result_out, result_in = IO.pipe
  err_out, err_in = IO.pipe

  Process.run("git", ["log", "--oneline"], output: result_in, error: err_in)
  result_in.close
  err_in.close

  log = result_out.try(&.gets_to_end)
  err = err_out.try(&.gets_to_end)

  return log, err
end

def git_add
  err_out, err_in = IO.pipe

  Process.run("git", ["add", "."], error: err_in)
  err_in.close

  err = err_out.try(&.gets_to_end)

  return err
end

def git_commit(commit_number)
  err_out, err_in = IO.pipe

  Process.run("git", ["commit", "-m", commit_number.to_s], error: err_in)
  err_in.close

  err = err_out.try(&.gets_to_end)

  return err
end

def git_push
  err_out, err_in = IO.pipe

  Process.run("git", ["push"], error: err_in)
  err_in.close

  err = err_out.try(&.gets_to_end)

  return err
end

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
