# Copyright 2015 Matt Palmer <matt@hezmatt.org>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.  You may obtain a
# copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.
#
require 'etc'

module Puppet::Parser::Functions
	newfunction(:homedir, :type => :rvalue, :doc => "Retrieve the home directory for the given user") do |args|
		# Etc is pants
		homedir = nil
		Etc.passwd { |u| homedir = u.dir if u.name == args[0] }
		homedir
	end
end