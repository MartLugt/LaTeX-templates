# VU Paper LaTeX Class

`vu_paper` is a LaTeX class for academic papers, assignments, and reports at **Vrije Universiteit Amsterdam**. This is not an official template, and this project is in no way, other than that I am a VU student, affiliated with the University. You are free to use this template according to the LPPL license as shown below.

This template is based on a two-column layout, with a text size of `10pt`. The abstract should be on its own page (unless the `short` style is used), before the table of contents, and the references should precede the appendices.

Currently, two language options are implemented, `english` and `dutch`. These languages switch the labels for the titlepage and references section. 

The template has two main styles, default and `short`. Both styles use a two-column layout for the main body. The default style includes a titlepage with a title and author, and optional course information and coursestaff. Furthermore, the default style includes an abstract on the second page, followed by a table of contents, and places the bibliography in a single column on its own page.
The `short` style is meant for shorter, 1-4 page assignments. This style does not include a titlepage, instead placing the title, author information and abstract at the top of the first page. There is no support for other document metadata (yet). The short style also will not show a titlepage, regardless of the `toc` option. It also switches the bibliography to an inline style, which places it right in the two-column layout. 

You are free to customise this behaviour with the options listed below.

## Class Options

| Option        | Description                            | Default |
| ------------- | -------------------------------------- | ------- |
| `short`       | Switches the class to the default short layout. This enables `notitlepage`, `notoc`, and `inlinebib`. |  | 
| `titlepage`   | Creates a full title page.             | Yes     | 
| `notitlepage` | Uses an inline title at the top.       |         | 
| `toc`         | Includes a table of contents.          | Yes     | 
| `notoc`       | Excludes the table of contents.        |         | 
| `inlinebib`   | Sets the bibliography style to inline. |         |
| `noinlinebib` | Sets the bibliography style to one-column on a new page. | Yes |
| `english`     | Sets the document language to English. | Yes     | 
| `dutch`       | Sets the document language to Dutch.   |         |  

## Custom Commands

### Metadata

- `\title{Title}`: Sets the document title.
- `\author{Name}[Email][Student Number]`: Sets the author name, email, and student number.
- `\coursename{Name}[Code]`: Sets the course name and code.
- `\addcoursestaff{Name}`: Adds course staff members.

### Abstract

- `\abstract{Text}`: Set the paper abstract.

This abstract is printed on a seperate page between the titlepage and the table of contents in the default style, and as part of the title block in `short` style.

### Bibliography

- `\printBibliography`: Prints the bibliography in the selected style.

### Appendices

- `\appendices`: Formats the appendices with alphabetic section numbering and resets counters for figures and tables.

## Usage Example

Download the `vu_paper.cls` file and load it in your `main.tex`.

See also the example in the VU-Paper folder.

```latex
\documentclass{vu_paper}

\title{Sample Document}
\author{Jane Doe}[jane.doe@example.com][12345678]
\coursename{Molecular Modeling}[MM2024]
\addcoursestaff{Dr. Example Staff}
\date{December 2024}

\begin{document}

\section{Introduction}
This is an example document.

\printBibliography

\appendices
\section{Additional Figures}
Appendix content here.

\end{document}
```

## License
This work is distributed under the [LaTeX Project Public License (LPPL), version 1.3](https://www.latex-project.org/lppl/lppl-1-3c.txt) or later.
