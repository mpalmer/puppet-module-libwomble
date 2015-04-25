require 'ipaddr'

module Puppet::Parser::Functions
	newfunction(:int_from_ip, :type => :rvalue, :doc => "Convert an IP address into its integer equivalent") do |args|
		args.length == 1 or raise Puppet::ParseError.new("int_from_ip: expecting 1 argument, got #{args.length}")
		IPAddr.new(args[0]).to_i
	end
end
