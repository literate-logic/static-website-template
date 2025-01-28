# Static Website Template

To generate the pages, simply run:

```sh
make
```

[`pandoc`](https://pandoc.org/installing.html) needs to be installed.

Each generated html page is located in the same directory as its markdown source file.
The main page (`index.html`) is placed at the root of the directory, but all other pages can be found in the `pages/` directory.

To customize, don't forget to change:
- the logo image: `assets/images/logo.png`
- the website name in the `<header>` of `template.html`
- the copyright in `template.html`
- your name in the `author` field of each markdown file.
