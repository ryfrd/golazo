# GOLAZO!

Cute and configurable system info fetch tool made with bash.

![golazo](/golazo.png)

### Getting set up
The script should work on all linux systems though I confess I haven't performed very rigorous testing.
- Clone the repo `git clone https://gitlab.com/robbygozzarder/golazo`
- Make a directory for the config file `mkdir -p ~/.config/golazo/`
- Copy the config file to the new directory `cp golazo/golazo.conf ~/.config/golazo/`
- Make sure the script is executable `sudo chmod +x golazo`
- You're good to go; run the script however you like :)

### Tinkering
Configuration is done via the `golazo.conf` file. Caution: this is just another bash file that the main script sources so don't do anything crazy to it. There are four things you can adjust:
- The colourful text that appears at the start of each line.
- The separator that will be placed between the title and info.
- The info you want fetched, and the order it will appear in.
- The colors you want to be used.

lots of love
