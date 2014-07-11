module Puppet::Parser::Functions
	newfunction(:maybe_split, :type => :rvalue, :doc => "Like split(), but returns the first argument if it is already an array.") do |args|
		args.length == 2 or raise Puppet::ParseError.new("maybe_split: expecting 2 arguments, got #{args.length}")
		(s, r) = args

		return [] if s.nil? or s == :undef or s == ""
		return s  if s.is_a? Array

		is_scalar = Puppet::Parser::Functions.function(:is_scalar) or raise Puppet::Error.new("maybe_split: is_scalar could not be loaded")
		send(is_scalar, [s]) or raise Puppet::ParseError.new("maybe_split: invalid first argument: #{s} (expecting scalar or Array, got #{s.class})")
		send(is_scalar, [r]) or raise Puppet::ParseError.new("maybe_split: invalid second argument: #{r} (expecting scalar, got #{r.class})")

		s.to_s.split(Regexp.compile(r.to_s))
	end
end
