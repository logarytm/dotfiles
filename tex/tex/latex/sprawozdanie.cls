\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sprawozdanie}

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage\@titlepagefalse
\newif\if@toc\@tocfalse
\newif\if@handed\@handedfalse
\newif\if@blankpage\@blankpagetrue
\newif\if@sectionbreak\@sectionbreaktrue

\setlength\paperheight{297mm}
\setlength\paperwidth{210mm}

\newcommand\@titlepage{\@titlepage@plain}

\DeclareOption{oneside}{\@twosidefalse\@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{toc}{\@toctrue}
\DeclareOption{handed}{\@handedtrue}
\DeclareOption{blankpage}{\@blankpagetrue}
\DeclareOption{noblankpage}{\@blankpagefalse}
\DeclareOption{sectionbreak}{\@sectionbreaktrue}
\DeclareOption{nosectionbreak}{\@sectionbreakfalse}

\ExecuteOptions{oneside,onecolumn}
\ProcessOptions

\input{cruft.clo}
\input{metadata.clo}
\input{utility.clo}

\newcommand\@titlepage@plain{%
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
	\par\vspace*{\fill}
	\begin{center}\begin{minipage}{.75\textwidth}
		\hfill\\[3ex]
		\begin{center}
			{\LARGE\bfseries\@subject}\\[3ex]
			{\@faculty\\
			Politechnika Rzeszowska}\\[2ex]
			\par
			{\bfseries Temat:}\, \@title
		\end{center}
	\end{minipage}\end{center}
	\par\vspace*{\fill}
	\begin{minipage}[b]{1\textwidth}%
		\flushright
		\@author\\
		\@class\ \@subclass
	\end{minipage}
}

\newcommand\titlepage{%
	\clearpage
	\thispagestyle{empty}
	\@titlepage
	\if@blankpage
		\clearpage
		\thispagestyle{empty}
		\null
		\clearpage
		\addtocounter{page}{-1}
	\fi
	\clearpage
	\addtocounter{page}{-1}
	\if@toc
		\thispagestyle{empty}
		\tableofcontents
		\if@blankpage
			\clearpage
			\thispagestyle{empty}
			\null
		\fi
		\clearpage
		\addtocounter{page}{-1}
	\fi
}

\if@twoside\else
	\RequirePackage[total={6in,8in}]{geometry}
\fi
\if@sectionbreak
	\RequirePackage{titlesec}
	\AtBeginDocument{\newcommand\sectionbreak{\clearpage}}
\fi

\endinput
