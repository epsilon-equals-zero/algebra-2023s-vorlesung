\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecture-notes}[2022/10/04 Custom LaTeX class]

%% PAGE LAYOUT %%
\LoadClass{scrreprt}

\RequirePackage{geometry}

\KOMAoptions{
  fontsize=11pt,
  paper=a4,
  parskip=half-,
  headsepline,
  chapterprefix=true
}
\setkomafont{disposition}{\bfseries}

\geometry{
  a4paper,
  left=2.5cm,
  right=2.5cm,
  top=2.5cm,
  bottom=2.5cm,
  footskip=1.5cm,
  marginparsep=0.3cm,
  marginpar=1.9cm
}

%% HEADINGS AND FOOTER %%
\RequirePackage{scrlayer-scrpage}
\RequirePackage{lastpage}

\newcommand\@shortauthor{}
\newcommand{\shortauthor}[1]{\renewcommand{\@shortauthor}{#1}}

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

\pagestyle{scrheadings}
\clearpairofpagestyles
\ihead{\leftmark}
\chead*{\ifcsname @notedate\endcsname \@notedate\fi}
\ohead*{\@shortauthor}
\ifoot*{104.998 Algebra 2023S}
\ofoot*{Seite \thepage \,\,von \pageref*{LastPage}}


%% PACKAGES %%
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{nameref}
\RequirePackage{cleveref}
\RequirePackage{enumitem}
\RequirePackage{tikz}
\RequirePackage{marginnote}
\RequirePackage{tabto}
\RequirePackage[hypcap=false]{caption}
\RequirePackage{float}

%% MARGINNOTES %%
\def\g@star@or@long#1{% 
  \@ifstar{\let\l@ngrel@x\global#1}{\def\l@ngrel@x{\long\global}#1}}

\newcommand{\notedate}[1]{
  \ifcsname @notedate\endcsname%
    \marginnote{
      \resizebox{\marginparwidth}{!}{
        \begin{tikzpicture}[align=right]
          \draw (0,0) -- (1.8,0);
          \draw (1.8,0) -- node[left] {\footnotesize \@notedate} (1.8,0.6);
          \draw (1.8,0) -- node[left] {\footnotesize #1} (1.8,-0.6);
        \end{tikzpicture}
      }
    }[-1cm]%
    \g@star@or@long\renew@command\@notedate{#1}
  \else%
    \g@star@or@long\new@command\@notedate{#1}
    \marginnote{
      \resizebox{\marginparwidth}{!}{
        \begin{tikzpicture}[align=right]
          \draw (0,0) -- (1.8,0);
          \draw (1.8,0) -- node[left] {\footnotesize \@notedate} (1.8,-0.6);
        \end{tikzpicture}
      }
    }[-0.5cm]
  \fi%
}

%% MATH SETTINGS %%

\newtheorem{thm}{}[section] % theorem counter

\theoremstyle{definition}
\newtheorem{definition}[thm]{Definition}

\theoremstyle{plain}
\newtheorem{theorem}[thm]{Satz}
\newtheorem{lemma}[thm]{Lemma}
\newtheorem{corollary}[thm]{Korollar}
\newtheorem{proposition}[thm]{Proposition}

\theoremstyle{remark}
\newtheorem{example}[thm]{Beispiel}
\newtheorem{remark}[thm]{Bemerkung}


\newcommand{\obda}{o. B. d. A.\ }
\newcommand{\dd}[1]{\frac{\text{d}}{\text{d}#1}}
\newcommand*\diff{\mathop{}\!\mathrm{d}}
\newcommand{\tagline}[1][]{\addtocounter{equation}{1}\tag{\theequation}\ifx\relax#1\relax\else\label{#1}\fi}

\let\vec\mathbf

\DeclareMathOperator{\Sub}{Sub}
\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\id}{id}
\DeclareMathOperator{\lvl}{lvl}
\DeclareMathOperator{\var}{var}