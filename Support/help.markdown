# Setup

You will need a TextMate Project (a Scratch Project will do) to make this work.

## Structure

The following files & folders are needed:

* `pages`

    This is where all your markdown files go. You need to make a new file for each chapter. It should have one first level heading which will be used for the name of the chapter (in the Table of Contents, for the Navigational Links & in the HTML title).
    The files in the `pages` directory are converted to HTML (using Markdown and SmartyPants) with the _Generate_ Command. They have to be in the right order, so they have to be named beginning with numbers followed by a space or an underscore (as seen in the included example). This prefix will be stripped by the Generate Script.

* `html`

    The generated files will go here.
    
    * `index.html`: Table of Contents from which you can navigate to all chapter.
    * `all_pages.html`: A single files with all chapters. This is mainly for printing and it uses the `print.css` Stylesheet.
    * `*.html`: Every chapter has it's own file.
    
    Also this folder holds two links to the css and images folder. When "deploying" your compiled book, just replace these by the actual folders.


* `templates`

    This folder contains three html templates. Adapt them to your needs.
    
    * `all.rhtml`: template for the `all_pages.html` file which contains all your chapters.
    * `chapter.html`: template for each chapter
    * `toc.html`: template for the `index.html` file containing the Table of Contents

* `css`

    This folder contains the stylesheets (`stylesheet.css` and `print.css`). Adapt those as you like. The default style resembles the [TextMate Manual](http://macromates.com/textmate/manual/).

* `images`

    This folder should hold all your images. When the book is generated `height` and `width` HTML attributes are added to the images. The source path could be changed, too, to make it absolute.



## References

You can use reference style links (`[link description][link id]`) in your text. There is a command _Update References_ that will collect them from all `.markdown` files in the `pages` folder and write them to a file `markdown.references` in the project root. It notifies you of missing or duplicate entries via a Tooltip. You can then edit this file and insert the link targets within your text. The _Generate_ Script will add `id` attributes to your headings, so you can reference them directly. Is converts some characters (`- \/_`) to underscores and strips non-alphanumeric characters afterwards.

I wrote a command _Show References_ that brings up a dialog with all the references from the `markdown.references` file and inserts a reference snippet.

## Generation process

The _Generate_ Command is a Ruby Script, which does some transformation, constructs the Table of Contents and runs all your Markdown files through [Markdown](http://daringfireball.net/projects/markdown/), [SmartyPants](http://daringfireball.net/projects/smartypants/) (for good Typography) and the Image-Script.

<hr />

> Credits to Allan for writing the initial version of all this. I, Soryu, bundled it up in a TextMate bundle and added/polished some stuff.
