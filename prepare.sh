#!/bin/bash

rm -rf ~/piracy
mkdir -p ~/piracy/Show" "1/Season" "1
mkdir -p ~/piracy/Show" "1/Season" "2
mkdir -p ~/piracy/Show" "2

for i in 1 2; do
    for j in 1 2 3; do
	touch ~/piracy/Show" "1/Season" "$i/episode" "$j.mkv
    done
done

for i in 1 2; do
    touch ~/piracy/Show" "2/episode" "$i.mkv
done
