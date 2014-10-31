# WeasyPrint in ubuntu container

This is WIP.

How to build an image:

```sh
  docker build -t="weasyprint" .
```

Test if pdf generation works in the contrainer:

```sh
  (docker run -t weasyprint /bin/echo '<h1>fooobar</h1>' | weasyprint -f pdf - -) > foo.pdf
  open foo.pdf
```

SSH to the an image:

```sh
  docker run -i -t weasyprint /bin/bash
```

Run container in the background with the running app

```sh
  docker run -p 49160:5000 -d -t weasyprint
```

## TODOs

- [ ] Figure out how to add fonts.
- [ ] Weasyprint webserver.
- [ ] Add bash functions that would mimic WeasPrint CLI's functions.
