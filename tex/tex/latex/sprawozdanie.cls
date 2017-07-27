\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sprawozdanie}

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\newif\if@toc
\newif\if@handed
\@titlepagefalse
\@tocfalse
\@handedfalse

\setlength\paperheight{297mm}
\setlength\paperwidth{210mm}

\DeclareOption{oneside}{\@twosidefalse\@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{toc}{\@toctrue}
\DeclareOption{handed}{\@handedtrue}

\ExecuteOptions{oneside,onecolumn}
\ProcessOptions

\input{cruft.clo}
\input{metadata.clo}

\newcommand\titlepage{%
	\thispagestyle{empty}
	\begin{flushright}
		\if@twodates
			{\bfseries Wykonano:}\\ \@realised\\[1ex]
			{\bfseries Oddano:}\\ \@date
		\else
			\if@handed
				{\bfseries Oddano:}\, \@date\\
			\else
				{\bfseries Wykonano:}\, \@date\\
			\fi
		\fi
	\end{flushright}
	\if@toc\else
		\vspace{-.2\paperheight}
		\par\vspace*{\fill}
	\fi
	\begin{center}\begin{minipage}{.75\textwidth}
		\hfill\\[3ex]
		\begin{center}
			{\LARGE\bfseries\@subject}\\[3ex]
			{\small\@faculty\\
			Politechnika Rzeszowska}\\[2ex]
			\par
			\large{\bfseries Temat:}\, \@title
		\end{center}
	\end{minipage}\end{center}
	\if@toc\tableofcontents\else\fi
	\par\vspace*{\fill}
	\begin{minipage}[b]{1\textwidth}%
		\flushright
		\@author\\
		\@class\ \@subclass
	\end{minipage}
	\clearpage
	\thispagestyle{empty}
	\null
	\clearpage
	\addtocounter{page}{-2}
}

\if@twoside\else
	\RequirePackage[total={6in,8in}]{geometry}
\fi
\input{utility.clo}

\endinput
