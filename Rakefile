FILES = ['.emacs', '.gitconfig', '.gitexcludes', '.zshenv', '.zshrc']
DIRS = ['.emacs.d', '.zsh.d', '.hg']
HOME = File.expand_path("~/")

FILES.each { |f| file "#{HOME}/#{f}" }
FILES.each { |f| file f => "#{HOME}/#{f}" }
DIRS.each { |d| directory d }

task :stage_files => FILES do
  FILES.each do |f|
    rm_f "#{HOME}/#{f}"
    cp f, HOME
  end
end

task :stage_directories => DIRS do
  DIRS.each do |d|
    rm_rf "#{HOME}/#{d}"
    cp_r d, HOME
  end
end

desc "Stages all config files and directories into the current user's home."
task :stage => [:stage_files, :stage_directories]

task :default => :stage
