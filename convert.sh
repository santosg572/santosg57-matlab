#!/bin/bash

#ffmpeg -i $1".avi" -c:v libx264 -c:a aac $1".mp4"

ffmpeg -i $1".avi" -c copy $1".mp4"




