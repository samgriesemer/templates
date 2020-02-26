# Set DB directory
 Edit your `.basrc` or `.zshrc` and set the `TIMEWARRIORDB` environment variable:

 ```
 TASKWARRIORDB=/path/to/other/location`
 ```

 I set this to my Nextcloud directory to sync across devices.

# Taskwarrior Hook
It can be useful to start time tracking in Timewarrior when a task is started in Taskwarrior. This hook can be set as follows:

```
$ cp ext/on-modify.timewarrior ~/.task/hooks/
$ chmod +x ~/.task/hooks/on-modify.timewarrior
```

Run `task diagnostics` to ensure eveyrthing's recognized by Taskwarrior.
