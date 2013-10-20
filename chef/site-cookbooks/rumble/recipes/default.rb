script "rails_rumble_ssh_key" do
  interpreter "bash"
  user "root"
  code <<-EOH
    mkdir -p ~/.ssh && curl http://railsrumble.com.s3.amazonaws.com/rumblebot.pub >> ~/.ssh/authorized_keys && chmod 0644 ~/.ssh/authorized_keys
  EOH
end
