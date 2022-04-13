# monitor-managed-switch
Switches network adapter mode

## Usage

```
./main.sh ADAPTER MODE
Must be run with sudo

Modes:
1: Managed
2: Monitor
```

## Does it work?
Sometimes there is strange output, looking a bit like this:
`./main.sh: 24: [: missing ]`
You can check if the switch worked by using `wavemon`.
Switching sometimes takes a few moments to register, so be a little patient.
If the change still hasn't been made, try running it again once or twice. If it doesn't work even then, please tell me.
