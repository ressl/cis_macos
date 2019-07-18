title "update"

time = Time.new

control 'update-1.1' do
  impact 1.0
  title 'CIS: Install Updates, Patches and Additional Security Software'
  desc '1.1 Verify all Apple provided software is current'
  describe command('softwareupdate -l') do
    its('stderr') { should include "No new software available" }
  end
  #describe command('defaults read /Library/Preferences/com.apple.SoftwareUpdate LastSuccessfulDate') do
  #  its('::Time.parse(stdout) - ::Time.new') { should be < 3 }
  #end
end

control 'update-1.2' do
  impact 1.0
  title 'CIS: Install Updates, Patches and Additional Security Software'
  desc '1.2 Enable Auto Update'
  describe command('defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled') do
    its('stdout.to_i') { should be 1 }
  end
end

control 'update-1.3' do
  impact 1.0
  title 'CIS: Install Updates, Patches and Additional Security Software'
  desc '1.3 Enable app update installs'
  describe command('defaults read /Library/Preferences/com.apple.commerce AutoUpdate') do
    its('stdout.to_i') { should be 1 }
  end
end
