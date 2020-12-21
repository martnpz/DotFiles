# -*- coding: utf-8 -*-

# Custom Caps lock.
# cp to Qtile libs:
# sudo cp -i ./caps_num_lock_indicator.py /lib/python3.9/site-packages/libqtile/widget/caps_num_lock_indicator.py
# This widget isn't necessary.

import re
import subprocess

from libqtile.widget import base


class CapsNumLockIndicator(base.ThreadPoolText):
    orientations = base.ORIENTATION_HORIZONTAL
    defaults = [('update_interval', 0.0, 'Update Time in seconds.')]

    def __init__(self, **config):
        base.ThreadPoolText.__init__(self, "", **config)
        self.add_defaults(CapsNumLockIndicator.defaults)

    def get_indicators(self):
        """Return a list with the current state of the keys."""
        try:
            output = self.call_process(['xset', 'q'])
        except subprocess.CalledProcessError as err:
            output = err.output.decode()
        if output.startswith("Keyboard"):
            indicators = re.findall(r"Caps\s+Lock:\s*(\w*)", output)
            return indicators

    def poll(self):
        """Poll content for the text box."""
        indicators = self.get_indicators()
        status = "".join(["".join(indicator) for indicator in indicators])
        if status == "on":
            status = "了"
            return status
        else:
            status = ""
            return status
