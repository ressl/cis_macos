title 'update section'

control 'update-1.1' do
  impact 1.0
  title 'CIS: Install Updates, Patches and Additional Security Software'
  desc '1.1 Verify all Apple provided software is current'
  describe command('softwareupdate -l') do
    its('stderr') { should include 'No new software available' }
  end
  lastsuccessfuldate = Time.parse(command('defaults read /Library/Preferences/com.apple.SoftwareUpdate LastSuccessfulDate').stdout)
  diffdays = Time.new - lastsuccessfuldate
  describe diffdays do
    it { should be <= 2.592e+6 }
  end
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

control 'update-1.4' do
  impact 1.0
  title 'CIS: Install Updates, Patches and Additional Security Software'
  desc '1.4 Enable system data files and security update installs'
  describe command('defaults read /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall') do
    its('stdout.to_i') { should be 1 }
  end
  describe command('defaults read /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall') do
    its('stdout.to_i') { should be 1 }
  end
end

control 'update-1.5' do
  impact 1.0
  title 'CIS: Install Updates, Patches and Additional Security Software'
  desc '1.5 Enable macOS update installs'
  describe command('defaults read /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired') do
    its('stdout.to_i') { should be 1 }
  end
end
