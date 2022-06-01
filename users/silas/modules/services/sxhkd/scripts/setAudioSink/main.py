#!/usr/bin/env python3

from rofi import Rofi
import pulsectl, sys

SINK_ALIASES = {
  'Family 17h (Models 10h-1fh) HD Audio Controller Speaker + Headphones': "Builtin laptop audio",
  'PCM2900B Audio CODEC Analog Stereo': "Audio interface",
  'Renoir Radeon High Definition Audio Controller HDMI / DisplayPort 1 Output': 'Monitor 1',
  'Renoir Radeon High Definition Audio Controller HDMI / DisplayPort 2 Output': "Monitor 2"
}

def main():
  pulse = pulsectl.Pulse()
  rofi = Rofi()

  sinks = pulse.sink_list()
  current_default_name = pulse.server_info().default_sink_name
  for i, s in enumerate(sinks):
    if s.name == current_default_name:
      current_default = i

  if current_default == None:
    print("Couldn't find the default sink?")
    return

  sink_index, _ = rofi.select("Select default sink", [s.description if s.description not in SINK_ALIASES else SINK_ALIASES[s.description] for s in sinks], select=current_default)
  if sink_index == -1:
    return

  pulse.default_set(sinks[sink_index[0]])
  pulse.close()


if __name__ == '__main__':
  main()
