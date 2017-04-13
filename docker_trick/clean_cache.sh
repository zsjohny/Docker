#!/usr/bin/env bash
#######################
#The first one cleans all dangling images. This is useful for removing intermediate images left over from multiple builds. The second one is for removing stopped containers. These are aliases I use for routine maintenance
#If you want to remove ALL of your cache, you first have to make sure all containers are stopped and removed, since you cannot remove an image in use by a container. So something similar
#######################

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

#######################
#This would kill and remove all images in your cache. Less recommended, you could wipe the /var/lib/docker dir and start docker over, but that's hardly necessary just to clear the cache
#######################

docker kill $(docker ps -q)
docker_clean_ps
docker rmi $(docker images -a -q)