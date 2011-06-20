##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FreePBX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-12
version "0.1"
description "FreePBX is an easy to use web based GUI (graphical user interface) that controls and manages Asterisk - Homepage: http://www.freepbx.org/"

# ShodanHQ results as at 2011-06-12 #
# 10 for FreePBX http

# Examples #
examples %w|
80.190.158.133
67.23.28.142
200.27.117.19
|

# Passive #
def passive
	m=[]

	# WWW-Authenticate realm
	if @meta["www-authenticate"] =~ /FreePBX/
		m << { :name=>"WWW-Authenticate" } if @meta["www-authenticate"] =~ /^Basic realm="FreePBX( Admin| Administration)?"/
		m << { :name=>"WWW-Authenticate" } if @meta["www-authenticate"] =~ /^Digest realm="FreePBX"/
	end

	# Return passive matches
	m
end

end
