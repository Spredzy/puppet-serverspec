#
# split.rb
#

module Puppet::Parser::Functions
  newfunction(:split, :type => :rvalue, :doc => <<-EOS
This function split a string into an array based on a separator.

*Examples:*

    split('host.domain.com', '.')

Would result in: ['host', 'domain', 'com']
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "join(): Wrong number of arguments " +
      "given (#{arguments.size} for 2)") if arguments.size < 2

    string = arguments[0]

    unless string.is_a?(String)
      raise(Puppet::ParseError, 'join(): Requires string to work with')
    end

    separator = arguments[1]

    unless separator.is_a?(String)
      raise(Puppet::ParseError, 'join(): Requires string to work with')
    end

    result = string.split(separator)

    return result
  end
end

# vim: set ts=2 sw=2 et :
