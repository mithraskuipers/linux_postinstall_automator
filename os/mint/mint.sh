#!/bin/bash

PASSWORD=$(zenity --password)
bash os/mint/software/software.sh
bash os/mint/settings/settings.sh