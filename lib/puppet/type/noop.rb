require 'puppet'
require 'puppet/type'

Puppet::Type.newtype(:noop) do
	@doc = <<-EOF
		A useful synchronisation primitive.  You can drop a noop in somewhere,
      and have other resources base their own actions around it.
	EOF

	newparam :name do
		desc 'The resource name'
		isnamevar
	end

	# Needed so we can be notified, subscribed, etc
	def refresh
	end
end
