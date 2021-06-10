require 'erb'
require 'kernel'

def read_template(name)
  erb_path = "erb_templates_autocomplete/#{name}.erb"
  File.read(File.join(__dir__, erb_path))
end

def buildcompletion(org)
  case_command = ""
  command_join = ""
  org.keys.each do |command|
    case_command += "#{command}) \t _kernel_#{command};;\n"
  end
  org.keys.each do |command|
    subcommand_join = ""
    org[command].keys.each do |subcommand|
      subcommand_join += ERB.new(read_template('subcommand')).result(binding)
    end
    command_join += ERB.new(read_template('command')).result(binding)
  end
  complete_generation = ERB.new(read_template('complete')).result(binding)
  File.write("kernel.plugin.zsh", complete_generation, mode: "w")
end

org = {}
commands = KernelCLI::Commands.constants.map { |c| KernelCLI::Commands.const_get(c) }
commands.each do |command|
  if command.is_a? Class
    h = command.all_commands
    # help returns nil as ancestor_name
    if h[h.keys[0]].ancestor_name
      org[h[h.keys[0]].ancestor_name] = h
    end
  end
end
# org has all commands, subcommands and options in JSON format here
# p org.keys.join(" ")
# p org['alpha']
buildcompletion(org)
