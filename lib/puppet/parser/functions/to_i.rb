module Puppet::Parser::Functions
	newfunction(:to_i, :type => :rvalue, :doc => "Converts any scalar to an integer.") do |args|
		args.length == 1 or raise Puppet::ParseError.new("to_i: expecting 1 argument, got #{args.length}")
		s = args[0]

		# Do *NOT* use Puppet::Parser::Scope.number? here... we want to be able to integerize version numbers

		is_scalar = Puppet::Parser::Functions.function(:is_scalar) or raise Puppet::Error.new("to_i: is_scalar could not be loaded")
		send(is_scalar, [s]) or raise Puppet::ParseError.new("to_i: invalid argument: #{s} (expecting scalar, got #{s.class})")

		s.to_i.to_s
	end
end
