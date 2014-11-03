# WeasyPrint in Ubuntu container

This is WIP.

How to build an image:

```sh
  docker build -t="weasyprint" .
```

Test if PDF generation works in the container:

```sh
  (docker run -t weasyprint /bin/echo '<h1>fooobar</h1>' | weasyprint -f pdf - -) > foo.pdf
  open foo.pdf
```

SSH to the image:

```sh
  docker run -i -t weasyprint /bin/bash
```

Run container in the background with the running app

```sh
  docker run -p 49160:5000 -d -t weasyprint
```

Run a command in the existing container

```sh
  docker exec -i -t container_id /bin/bash
```

## TESTS

```sh
  # run container
  cd app/tests
  WEASYRPINT_HOST='http://192.168.59.103:49160' ruby test.rb

  ./performance.sh
```

## TODOs

- [ ] Figure out how to add fonts.
