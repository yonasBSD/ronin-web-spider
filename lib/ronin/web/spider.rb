#
#--
# Ronin Web - A Ruby library for Ronin that provides support for web
# scraping and spidering functionality.
#
# Copyright (c) 2006-2009 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#++
#

require 'ronin/web/web'

require 'spidr/agent'

module Ronin
  module Web
    class Spider < Spidr::Agent
      #
      # Creates a new Spider object with the given _options_ and
      # _block_. If a _block_ is given, it will be passed the newly created
      # Spider object.
      #
      # _options_ may contain the following keys:
      # <tt>:proxy</tt>:: The proxy to use while spidering. Defaults to
      #                   Web.proxy.
      # <tt>:user_agent</tt>:: The User-Agent string to send. Defaults to
      #                        Web.user_agent.
      # <tt>:referer</tt>:: The referer URL to send.
      # <tt>:delay</tt>:: Duration in seconds to pause between spidering each
      #                   link. Defaults to 0.
      # <tt>:host</tt>:: The host-name to visit.
      # <tt>:hosts</tt>:: An +Array+ of host patterns to visit.
      # <tt>:ignore_hosts</tt>:: An +Array+ of host patterns to not visit.
      # <tt>:ports</tt>:: An +Array+ of port patterns to visit.
      # <tt>:ignore_ports</tt>:: An +Array+ of port patterns to not visit.
      # <tt>:links</tt>:: An +Array+ of link patterns to visit.
      # <tt>:ignore_links</tt>:: An +Array+ of link patterns to not visit.
      # <tt>:exts</tt>:: An +Array+ of File extension patterns to visit.
      # <tt>:ignore_exts</tt>:: An +Array+ of File extension patterns to not
      #                         visit.
      #
      def self.agent(options={},&block)
        self.new(self.default_options.merge(options),&block)
      end

      #
      # Creates a new Spider object with the given _options_ and will begin
      # spidering the specified host _name_. If a _block_ is given it
      # will be passed the newly created Spider object, before the agent
      # begins spidering.
      #
      def self.host(name,options={},&block)
        super(name,self.default_options.merge(options),&block)
      end

      #
      # Creates a new Spider object with the given _options_ and will begin
      # spidering the host of the specified _url_. If a _block_ is
      # given it will be passed the newly created Spider object, before
      # the agent begins spidering.
      #
      def self.site(url,options={},&block)
        super(url,self.default_options.merge(options),&block)
      end

      protected

      #
      # Returns the default options for Spider.
      #
      def self.default_options
        {:proxy => Web.proxy, :user_agent => Web.user_agent}
      end
    end
  end
end
