# Set DB directory
 Edit your `.bashrc` or `.zshrc` and set the `TIMEWARRIORDB` environment variable:

 ```
 TIMEWARRIORDB=/path/to/other/timew/location
 ```

 I set this to my Nextcloud directory in order to sync my timew records across devices.

# Taskwarrior Hook
It can be useful to start time tracking in Timewarrior when a task is started in Taskwarrior. This hook can be set as follows:

```
$ cp ext/on-modify.timewarrior ~/.task/hooks/
$ chmod +x ~/.task/hooks/on-modify.timewarrior
```

Run `task diagnostics` to ensure eveyrthing's recognized by Taskwarrior.
