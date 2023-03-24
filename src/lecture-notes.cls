\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecture-notes}[2022/10/04 Custom LaTeX class]

\LoadClass[11pt,a4paper]{report}

\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage[
  a4paper,%
  left=3cm,%
  right=3cm,%
  top=20mm,%
  bottom=1.5in,%
  footskip=0.8in
]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{lastpage}
\RequirePackage{hyperref}
\RequirePackage{xstring}
\RequirePackage{tcolorbox}
\RequirePackage{enumitem}
\RequirePackage{amsthm}
\RequirePackage{nameref}

\setlength{\headheight}{34pt}
\setlength{\parindent}{0pt}
\newlength{\docparskip}
\setlength{\docparskip}{8pt}
\setlength{\parskip}{\docparskip}

\let\oldtoc\tableofcontents

\def\tableofcontents{
  \setlength{\docparskip}{\parskip}
  \setlength{\parskip}{0pt}
  \oldtoc
  \setlength{\parskip}{\docparskip}
}

\newtheorem{theorem}{Satz}[section]
\newtheorem{definition}[theorem]{Definition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Korollar}
\newtheorem{example}[theorem]{Beispiel}
\newtheorem{proposition}[theorem]{Proposition}
% \newtheorem{example}{Beispiel}

\tcbuselibrary{skins}
\definecolor{tublue}{HTML}{006699}

\newenvironment{specification}
  {
    \begin{tcolorbox}[
      enhanced,
      colback=gray!20!white,
      colframe=tublue,
      arc=0mm,
      toprule=0mm,
      leftrule=0mm,
      rightrule=0mm,
      bottomrule=1mm,
    ]
  }
  {
    \end{tcolorbox}
  }
\newenvironment{lemmabox}
  {
    \begin{tcolorbox}[
      enhanced,
      colback=white,
      colframe=tublue,
      arc=0mm,
      toprule=.4mm,
      leftrule=.4mm,
      rightrule=.4mm,
      bottomrule=.4mm,
    ]
  }
  {
    \end{tcolorbox}
  }

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

\fancypagestyle{plain}{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\lhead{\leftmark}
% \lhead{\raisebox{-0.3cm}{\includegraphics[height=1cm]{TU_Logo_transparent_72dpi_RGB}}}
\chead{\ifcsname thenotedate\endcsname \thenotedate\fi}
\rhead{Hornik, Mayr, Zach}
\lfoot{104.998 Algebra 2023S}
\rfoot{Seite \thepage \,\,von \pageref{LastPage}}

%\newcommand\thenotedate{1.1.1970}
\newcommand{\notedate}[1]{
  \ifcsname thenotedate\endcsname%
      \marginnote{
          \resizebox{\marginparwidth}{!}{
              \begin{tikzpicture}[align=right]
                  \draw (0,0) -- (1.8,0);
                  \draw (1.8,0) -- node[left] {\footnotesize \thenotedate} (1.8,0.6);
                  \draw (1.8,0) -- node[left] {\footnotesize #1} (1.8,-0.6);
              \end{tikzpicture}
          }
      }[-0.5cm]
  \renewcommand{\thenotedate}{#1}
  \else%
      \newcommand{\thenotedate}{#1}
      \marginnote{
          \resizebox{\marginparwidth}{!}{
              \begin{tikzpicture}[align=right]
                  \draw (0,0) -- (1.8,0);
                  \draw (1.8,0) -- node[left] {\footnotesize \thenotedate} (1.8,-0.6);
              \end{tikzpicture}
          }
      }
  \fi%
}

\newcommand{\obda}{o. B. d. A.\ }
\newcommand{\dd}[1]{\frac{\text{d}}{\text{d}#1}}
\newcommand*\diff{\mathop{}\!\mathrm{d}}
\newcommand{\tagline}[1][]{\addtocounter{equation}{1}\tag{\theequation}\ifx\relax#1\relax\else\label{#1}\fi}
