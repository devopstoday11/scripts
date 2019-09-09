#!/bin/python

# A script to concatenate MP4 files without re-compressing them.
# Input files have to be encoded using the same codec (H.264 or HEVC) with the same resolution.
# Metadata (like rotation) are copied from the first stream of the first input.
#
# Created by K3A.me
# License: MIT

import sys, subprocess, os

if len(sys.argv) < 3:
  print("Usage: {} [-hevc] src1.mp4 [src2.mp4, ...] final.mp4".format(sys.argv[0]))
  print("       -hevc   Files are using HEVC encoding instead of H264")
  print("       -nosmeta Do not copy stream metadata")
  sys.exit(1)

bsfilter = "h264_mp4toannexb"

infiles = []
nosmeta = False
for arg in sys.argv[1:-1]:
  if arg == "-hevc":
    bsfilter = "hevc_mp4toannexb"
  elif arg == "-nosmeta":
    nosmeta = True
  else:
    infiles.append(arg)

outfile = sys.argv[-1]

# export metadata of the first one
if not nosmeta:
  subprocess.run(["ffmpeg", "-i", infiles[0], "-map_metadata", "0:s:0", "-f", "ffmetadata", "-y", "meta.ini"])

# convert to TS
tsfiles = []
for infile in infiles:
  tsfile = infile + ".ts"
  tsfiles.append(tsfile)

  subprocess.run(["ffmpeg", "-y", "-i", infile, "-c", "copy", "-bsf:v", bsfilter, "-f", "mpegts", tsfile])

# concat!
exargs = []
if not nosmeta:
  exargs.extend(["-i", "meta.ini", "-map_metadata:s:0", "1"])
subprocess.run(["ffmpeg", "-i", "concat:"+"|".join(tsfiles), *exargs, "-c", "copy", "-bsf:a", "aac_adtstoasc", outfile])
# "-metadata:s:v", "rotate=-90"

# clean
for ts in tsfiles:
  os.remove(ts)
os.remove("meta.ini")
