FILES = ['.emacs', '.gitconfig', '.gitconfig-anthemis', '.gitexcludes', '.zshenv', '.zshrc', '.hgrc', '.gemrc']
DIRS = ['.emacs.d', '.zsh.d', '.hg']
HOME = File.expand_path("~/")

desc "Cleans existing files and directories"
task :clean do
  FILES.each { |f| rm_f "#{HOME}/#{f}" }
  DIRS.each { |d| rm_rf "#{HOME}/#{d}" }
end

FILES.each { |f| file f }
DIRS.each { |d| directory d }
LINKS = (FILES + DIRS).collect do |entry|
  file "#{HOME}/#{entry}" => entry do |t|
    target = File.join(File.dirname(__FILE__), entry)
    ln_s target, "#{HOME}/#{entry}"
  end
end

desc "Installs symlinks in the home directory for all config files"
task :install => LINKS

task :default => :install
