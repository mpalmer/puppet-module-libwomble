require 'ipaddr'

module Puppet::Parser::Functions
	newfunction(:network_from_cidr, :type => :rvalue, :doc => "Given a CIDR address, return the network address") do |args|
		args.length == 1 or raise Puppet::ParseError.new("network_from_cidr: expecting 1 argument, got #{args.length}")
		IPAddr.new(args[0]).to_s
	end
end
