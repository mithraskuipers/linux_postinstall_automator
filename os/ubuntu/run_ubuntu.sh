#!/bin/bash

PASSWORD=$(zenity --password)

bash os/ubuntu/software/software.sh
bash os/ubuntu/settings/settings.sh