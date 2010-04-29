FILES = ['.emacs', '.gitconfig', '.gitexcludes', '.zshenv', '.zshrc']
DIRS = ['.emacs.d', '.zsh.d']
HOME = File.expand_path("~/")

FILES.each { |f| file f }
DIRS.each { |d| directory d }

task :stage_files => FILES do
  FILES.each { |f| cp f, HOME }
end

task :stage_directories => DIRS do
  DIRS.each { |d| cp_r d, HOME }
end

desc "Stages all config files and directories into the current user's home."
task :stage => [:stage_files, :stage_directories]

task :default => :stage