gemspec = eval(File.read("grund.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["grund.gemspec"] do
  system "gem build grund.gemspec"
  system "gem install grund-#{Grund::VERSION}.gem"
end