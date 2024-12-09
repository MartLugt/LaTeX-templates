%% vu_paper.cls
%% Copyright 2024, M. J. van der Lugt
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is M. J. van der Lugt.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vu_paper}[2024/12/07 vu paper template]

\def\english{english}
\def\dutch{dutch}

\makeatletter


% OPTIONS:
\DeclareOption{toc}{\def\includeTOC{true}}
\DeclareOption{notoc}{\def\includeTOC{false}}
% todo: no title page
% todo: short
\DeclareOption{english}{\def\@lang{english}}
\DeclareOption{dutch}{\def\@lang{dutch}}

% Pass all unknown options to parent (article) class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{toc, english}
\ProcessOptions\relax

\LoadClass[10pt, a4paper]{article}

\makeatother

%%%%%%%%% PACKAGES %%%%%%%%%%%
%% Language and font encodings
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%\RequirePackage{subfig}

%% Sets page size and margins
\RequirePackage[a4paper,top=2.5cm,bottom=2cm,left=2cm,right=2cm,marginparwidth=1.75cm]{geometry}

%% Useful packages
\RequirePackage{amsmath, graphicx, caption, subcaption, csquotes, pdfpages, float, authblk, xfrac, titling, blindtext, xcolor, siunitx, wrapfig}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{booktabs}
\RequirePackage{xparse}

\RequirePackage[medium]{titlesec}

\RequirePackage[format=plain,font={it}]{caption}


\RequirePackage[backend=biber,style=chem-acs,autocite=superscript,maxbibnames=99,articletitle=true]{biblatex}

% Disable numbering in the main document sections
\titleformat{\section}[block]{\normalfont\Large\bfseries}{}{0pt}{}{}

% Keep numbering in the TOC
\setcounter{secnumdepth}{2} % Ensure sections are numbered internally
\setcounter{tocdepth}{2}    % Ensure they appear in the TOC

\makeatletter

\renewcommand{\thefootnote}{\roman{footnote}}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} 							% horizontal line and its thickness

\renewenvironment{abstract}{\vspace{0.5ex}\begin{quote}}{\par\end{quote}\vskip 1ex\hrule\vskip 2ex}

\titleformat{\subsection}{\bfseries}{}{0pt}{}{}

\def\@authname{}
\def\@email{}
\def\@studentnumber{}
\def\@coursestaff{}
\newcounter{coursestaffcount}
\setcounter{coursestaffcount}{0}

% todo: email, affiliation
\newcommand{\addcoursestaff}[1]{%
  \g@addto@macro\@coursestaff{#1 \\[0.1cm]}%
  \stepcounter{coursestaffcount}%
  \setstrings
}

\RenewDocumentCommand{\author}{m o o}{%
  \gdef\@authname{#1}%
  \IfValueTF{#2}{%
    \gdef\@email{#2}%
  }{}%
  \IfValueTF{#3}{%
    \gdef\@studentnumber{#3}%
  }{}%
  \setstrings
}

% Set strings
\newcommand{\setstrings}{%
  \ifx\@lang\@undefined
    \def\authorlabel{Author:}%
    \def\studentnumberlabel{Student number: }%
    \def\coursestafflabel{Course staff:}%
    \def\referenceslabel{References}%
  \else
    \ifx\@lang\english
      \def\authorlabel{Author:}%
      \def\studentnumberlabel{Student number: }%
      \def\coursestafflabel{Course staff:}%
      \def\referenceslabel{References}%
    \fi
    \ifx\@lang\dutch
      \def\authorlabel{Auteur:}%
      \def\studentnumberlabel{Studentnummer: }%
      \ifnum\value{coursestaffcount}<2
        \def\coursestafflabel{Docent:}%
      \else
        \def\coursestafflabel{Docenten:}%
      \fi
      \def\referenceslabel{Referenties}%
    \fi
  \fi
}

\setstrings

\renewcommand{\maketitle}{%
    \begin{titlepage}%

        \center 
     
        % University
        \vspace*{0.5cm}
        \textsc{\LARGE Vrije Universiteit Amsterdam}\\
        \vspace{3.5cm}

        % Document info
        % todo: Course info (opt)
        %\textsc{\Large Molecular Modeling}\\[0.6cm]

        \HRule \\[0.8cm]
        { \huge \bfseries \@title}\\[0.6cm]								% Assignment
        \HRule \\%[2cm]
        \vfill
        \large
        \emph{\authorlabel}\\[0.1cm]
        {\@authname}
        \ifx\@email\@empty
          % No email
        \else
          {\\ \href{mailto:\@email}{\@email}}
        \fi
        \ifx\@studentnumber\@empty
          % No studentnumber
        \else
          {\\ \footnotesize \studentnumberlabel  \@studentnumber}	% Author info
        \fi
        \\[1.4cm]

       \ifx\@coursestaff\@empty
         % No course staff
       \else
          \emph{\coursestafflabel}\\[0.1cm]
          \@coursestaff
          \vspace{1.3cm}
       \fi

        {\large \@date}\\[2.6cm]
        \vfill 
        \includegraphics[width=0.6\textwidth]{figures/VU-logo_druk.pdf}\\[1cm] 	% University logo
    \end{titlepage}
}

\makeatother

\ifx\includeTOC\true
  \AtBeginDocument{%
    \maketitle
    \clearpage
    \tableofcontents
    \newpage
    \twocolumn
  }
\else
  \AtBeginDocument{%
    \maketitle
    \newpage
    \twocolumn
  }
\fi

\newcommand{\startSingleColumn}{%
  \clearpage
  \onecolumn
}

\newcommand{\printSingleColumnBibliography}{%
  \startSingleColumn
  \section{\referenceslabel}
  \printbibliography[heading=none]
}

\newcommand{\printInlineBibliograpy}{%
  \section{\referenceslabel}
  \printbibliograpy[heading=none]
}

\newcommand{\appendices}{%
  \startSingleColumn
  \phantomsection
  \appendix

  \renewcommand{\thesection}{\Alph{section}}
  \renewcommand{\thesubsection}{\thesection.\arabic{subsection}}

  \titleformat{\section}[block]{\normalfont\Large\bfseries}{}{0pt}{\thesection.\ }
  \titleformat{\subsection}[block]{\normalfont\large\bfseries}{}{0pt}{\thesubsection.\ }

  % Set figures and tables to: 'A.1' style
  \renewcommand{\thetable}{\thesection.\arabic{table}}
  \renewcommand{\thefigure}{\thesection.\arabic{figure}}

  % Reset counters for every appendix chapter
  \setcounter{table}{0}
  \setcounter{figure}{0}
}


