require "http/client"
require "json"
require "./ceruversion/*"

module Ceruversion #MixFlame was here and we love you. https://mixflame.com
  puts "ceruversion version calculator"
  if ARGV.size == 0
    app_name = %x{basename `git rev-parse --show-toplevel`}.strip
    version = `git rev-list master --count`.to_f / 100.to_f
    puts "your version: #{app_name} v#{version}"
  else
    github_repo = ARGV.first
    response = HTTP::Client.get "https://api.github.com/repos/#{github_repo}/contributors"
    if response.status_code == 200
      commit_count = 0
      contributors = JSON.parse(response.body)
      contributors.each do |contributor|
        commit_count += contributor["contributions"].as_i
      end
      app_name = github_repo.split('/').last
      version = commit_count.to_f / 100.to_f
      puts "your version: #{app_name} v#{version}"
    end
  end
end
