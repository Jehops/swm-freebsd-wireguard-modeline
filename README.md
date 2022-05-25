# `swm-freebsd-wireguard-modeline`

Put %V in your StumpWM mode-line format string (*screen-mode-line-format*) to
get the status of Wireguard.  If Wireguard is running a '!' will be displayed.

In addition to the lisp code, there is a small POSIX shell script,
ml_wireguard.sh.  Make sure this script is executable by the user running StumpWM
and within the user's $PATH.  Have a look at the script to customize certain
settings, such as the interval between updates.

FAQ

Q: What do I need to put in my ~/.stumpwmrc to get this working?

A: First, make sure the source is in your load-path.  To add it, use something
like
```lisp
    (add-to-load-path "/usr/home/jrm/scm/swm-freebsd-wireguard-modeline")
```
Next, load the module with
```lisp
    (load-module "swm-freebsd-wireguard-modeline")
```
Finally create a mode-line format string with %V in it, e.g.,
```lisp
    (setf *screen-mode-line-format* "^[^B^1*%V^]")
```

Q: So, why use a separate script?  Couldn't all the code be contained within the
module?

A: Yes, it could.  I tried doing that with and without threads.  I found StumpWM
became less responsive in both cases.  Don't you prefer a snappy StumpWM?

Q: Will this only run on FreeBSD?

A: By default, yes, but it should be quite simple to modify ml_wireguard.sh to get it
working on your OS.