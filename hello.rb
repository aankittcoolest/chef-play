file '/tmp/motd' do
  content 'hello from ankit'
end

package "apache2" do
  action: install
end

service "apache2" do
  action [:enable, :start]
end


