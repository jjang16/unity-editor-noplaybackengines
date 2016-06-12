FROM ubuntu:14.04
MAINTAINER Jae Won Jang <jjang16@illinois.edu>

# apt-get dependencies for installing & running unity editor
RUN apt-get update && apt-get install -y --force-yes \
	gdebi \
	wget \
	xvfb \
	pulseaudio && \

	# cleanup
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# unity-editor-5.1.0f3 with no playback engines.

	# downloading unity-editor
RUN apt-get update && \
	wget https://www.dropbox.com/s/hjq621xehfna9cg/unity-editor-noplaybackengines_5.1.0f3_amd64.deb?dl=0 -P /tmp/ && \

	# unity-editor install
	gdebi --option=APT::Get::force-yes=1,APT::Get::Assume-Yes=1 -n /tmp/unity*.deb* && \
	# cleanup
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
