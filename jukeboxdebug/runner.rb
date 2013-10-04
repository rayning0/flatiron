require_relative './jukebox.rb'
 
def run
  puts "Welcome to Ruby Console Jukebox!"
  while true do
    puts "Enter a command to continue. Type 'help' for a list of commands."
    command = get_command
    exit if command.downcase == "exit"
    run_command(command)
  end
end

def get_command
  gets.strip
end
 
def run_command(command)
  case command
  when "help"
    show_help
  else
    jukebox(command)
  end
end
 
def show_help
  help = "Never worked a jukebox, eh? Pretty standard. Available commands are:\n"
  help += "'help' - shows this menu\n"
  help += "'list' - lists the whole song library\n"
  help += "or you can enter an artist's name to show that artist's songs\n"
  puts help
end
 
run