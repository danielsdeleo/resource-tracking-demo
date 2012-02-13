WORKSPACE = "/tmp/audit-demo"
FileUtils.rm_rf(WORKSPACE) if File.exist?(WORKSPACE)

FileUtils.mkdir_p(WORKSPACE)

file "#{WORKSPACE}/one.txt" do
  owner "ddeleo"
  mode  "0644"
  group "staff"
end


file "#{WORKSPACE}/two.txt" do
  content(<<-E)
This is some text.
This is line two!
This is the end of the road.

E
  owner "ddeleo"
  mode  "0644"
  group "staff"
end


file "modify two" do
  path "#{WORKSPACE}/two.txt"
  content(<<-E)
This is some text.
This is line two, with a change (#{Time.now})
This is the end of the road.

E
  owner "ddeleo"
  mode  "0644"
  group "staff"
end

template "#{WORKSPACE}/foo.txt" do
  owner "ddeleo"
  mode  "0644"
  group "staff"
  variables :value => "blahblah"
end

template "updates the last one" do
  path "#{WORKSPACE}/foo.txt"
  source "foo.txt.erb"
  owner "ddeleo"
  mode  "0644"
  group "staff"
  variables :value => "RAWR"
end

