%%
%% This is file `hebtech.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hebtech.dtx  (with options: `hebtech')
%% 
%% This is a generated file.
%% 
%% Copyright 1997-1998 Tzafrir Cohen and any individual authors
%% listed elsewhere in this file. All rights reserved.
%% 
%% For further copyright information, and conditions for modification
%% and distribution, see any other copyright notices in this file.
%% 
%% This file is contributed to the Babel system, release 3.6.
%% ----------------------------------------------------------
%%   This system is distributed in the hope that it will be useful,
%%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%% 
%%   For error reports concerning UNCHANGED versions of this file no
%%   more than one year old, see bugs.txt.
%% 
%%   Please do not request updates from me directly.  Primary
%%   distribution is through the CTAN archives.
%% 
%% 
%% IMPORTANT COPYRIGHT NOTICE:
%% 
%% You are NOT ALLOWED to distribute this file alone.
%% 
%% You are allowed to distribute this file under the condition that it
%% is distributed together with all the files listed in manifest.txt.
%% 
%% If you receive only some of these files from someone, complain!
%% 
%% 
%% Permission is granted to customize the declarations in this file to
%% serve the needs of your installation, provided that you comply with
%% the conditions in the file legal.txt.
%% 
%% However, NO PERMISSION is granted to distribute a modified version
%% of this file under its original name.
%% 
%% 
%% MODIFICATION ADVICE:
%% 
%% If you want to customize this file, it is best to make a copy of
%% the source file(s) from which it was produced.  Use a different
%% name for your copy(ies) and modify the copy(ies); this will ensure
%% that your modifications do not get overwritten when you install a
%% new release of the standard system.
%% 
%% You can then easily distribute your modifications by distributing
%% the modified and renamed copy of the source file, together with a
%% suitable .ins file, taking care to observe the conditions in
%% legal.txt; this will ensure that other users can safely use
%% your modifications.
%% 
%% The names of the source files used are shown above.
%% 
%% 
%% LaTeX2e hebtech class, derived by Boris Lavva from original hebtech
%% macros created for LaTeX 2.09.
%%
%% Copyright 1994 Irina Abramovici, Taub Computer Center, Technion ---
%% Israel Institute of Technology, e-mail ccaiire@tx.technion.ac.il.
%%
%% This package can be used for writing a thesis in the Hebrew/English
%% languages, at the Technion --- Israel Institute of Technology.
%%
%% Bugs reports and suggestions should be addressed to
%% Irina Abramovici, Taub Computer Center, Technion, tel: 04-8293690,
%% e-mail: ccaiire@tx.technion.ac.il
%% OR
%% to Tzafrir Cohen, e-mail: tzafrir@technion.ac.il.
%%
%% This package is an experimental meant to answer to the demands of
%% the Graduate School of the Technion --- Israel Institute of
%% Technology.
%%
\NeedsTeXFormat{LaTeX2e}[1996/06/01]
\ProvidesClass{hebtech}
        [2003/06/01 v.1.1a Technion thesis class]
\ExecuteOptions{a4paper,12pt,oneside,onecolumn,final,openany}
\newif\ifhebtech@hebibm   \hebtech@hebibmfalse
\newif\ifhebtech@eightbit \hebtech@eightbitfalse
\DeclareOption{hebibm}  {\hebtech@hebibmtrue \hebtech@eightbittrue}%
\DeclareOption{nohebibm}{\hebtech@hebibmfalse\hebtech@eightbitfalse}%
\newif\ifhebtech@stdtheo  \hebtech@stdtheofalse
\DeclareOption{stdtheo}  {\hebtech@stdtheotrue}%
\DeclareOption{nostdtheo}{\hebtech@stdtheofalse}%
\newif\ifhebtech@showthanks  \hebtech@showthankstrue
\DeclareOption{thanks}      {\hebtech@showthankstrue}%
\DeclareOption{nothanks}    {\hebtech@showthanksfalse}%
\newif\ifhebtech@setspace  \hebtech@setspacetrue
\DeclareOption{setspace}  {\hebtech@setspacetrue}%
\DeclareOption{nosetspace}{\hebtech@setspacefalse}%
\newif\ifhebtech@hebmain  \hebtech@hebmaintrue
\DeclareOption{hebmain}  {\hebtech@hebmaintrue}%
\DeclareOption{nohebmain}{\hebtech@hebmainfalse}%
\DeclareOption{enccp862}{\providecommand{\class@inputenc}{cp862}}%
\DeclareOption{enc8859-8}{\providecommand{\class@inputenc}{8859-8}}%
\DeclareOption{enccp1255}{\providecommand{\class@inputenc}{cp1255}}%
\DeclareOption{encsi960}{\providecommand{\class@inputenc}{si960}}%
\newif\ifhebtech@twoside  \hebtech@twosidetrue
\DeclareOption{twoside}  {\hebtech@twosidetrue}%
\DeclareOption{ownside}{\hebtech@twosidefalse}%
\DeclareOption{draft}{%
  \PassOptionsToPackage{all,light}{draftcopy}
  \PassOptionsToClass{draft}{report}
  \AtEndOfClass{\RequirePackage{draftcopy}}}
\newif\ifhebtech@lof    \hebtech@loftrue
\newif\ifhebtech@losym  \hebtech@losymtrue
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\ifhebtech@twoside
  \PassOptionsToClass{twoside,openright}{report}
\else
  \PassOptionsToClass{oneside}{report}
\fi
\LoadClass{report}
\ifhebtech@setspace
  \RequirePackage{setspace}
  \AtBeginDocument{\doublespacing}
\fi
\RequirePackage{ifthen}%

\ifx\hebtech@inputenc\@undefined\else%
  % Do the following if an input encoding option was given
  \RequirePackage[\hebtech@inputenc]{inputenc}%
\fi
\ifhebtech@eightbit
  \def\HeblatexEightBitFont{}
\fi
\ifhebtech@hebmain%
  \RequirePackage[english,hebrew]{babel}%
\else%
  \RequirePackage[hebrew,english]{babel}%
\fi
\RequirePackage{hebcal}
\ifhebtech@hebibm
  \RequirePackage{hebibm}
\fi
\ifhebtech@stdtheo%
  \newtheorem{definition}{\definitionname}[chapter]%
  \newtheorem{theorem}[definition]{\theoremname}%
  \newtheorem{lemma}[definition]{\lemmaname}%
  \newtheorem{claim}[definition]{\claimname}%

  \make@lr\thedefinition
  \make@lr\thetheorem
  \make@lr\thelemma
  \make@lr\theclaim

  % The definition of proof is borowed fom LyX, to have a proper QED.
  \newenvironment{proof}{%
    \par\noindent\textbf{\proofname:}%
  }{%
    \hfill\rule{2mm}{2mm}\par\vspace{2mm}%
  }
\fi%
\newcommand\engmonth[1]{%
  \ifcase#1\or January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi}

\providecommand{\Ldir}[1]{\beginL #1\endL} % not yet part of all heblatex-s
\newcount\hebtech@day  \hebtech@day=\day %
\newcount\hebtech@mon  \hebtech@mon=\month %
\newcount\hebtech@year \hebtech@year=\year %
\newcommand{\LGMonth}{}
\newcommand{\HGMonth}{}
\newcommand{\LJMonth}{}
\newcommand{\HJMonth}{}
\renewcommand{\date}[3]{%#1=day,#2=month,#3=year
  \newcount\hebtech@day \hebtech@day=#1 %
  \newcount\hebtech@mon \hebtech@mon=#2 %
  \newcount\hebtech@year \hebtech@year=#3 %
  \newcount\hebtech@hday %
  \newcount\hebtech@hmon %
  \newcount\hebtech@hyear %
  %
  \def\Year{#3}%
  \def\HebGMonth{\hebmonth{#2}}%
  \def\LatGMonth{\engmonth{#2}}%
  \renewcommand{\LGMonth}{\LatGMonth~\Year}%
  \renewcommand{\HGMonth}{\HebGMonth~\Ldir{\Year}}%
  \HebrewFromGregorian%
    {\hebtech@day} {\hebtech@mon} {\hebtech@year}%
    {\hebtech@hday}{\hebtech@hmon}{\hebtech@hyear}%
  \renewcommand{\LJMonth}{%
    \HebrewMonthNameInEnglish{\hebtech@hmon}{\hebtech@hyear}%
    ~\number\hebtech@hyear%
  }%
  \renewcommand{\HJMonth}{%
    \HebrewMonthName{\hebtech@hmon}{\hebtech@hyear}%
    ~\HebrewYearName{\hebtech@hyear}%
  }%
}
\date{\number\day}{\number\month}{\number\year}

\addto\captionsenglish{%
  \def\acknowledgmentname{Acknowledgment}%
  \def\bibname{References}%
  \def\continuedname{Cont'd}%
  \def\definitionname{Definition}%
  \def\theoremname{Theorem}%
  \def\lemmaname{Lemma}%
  \def\claimname{Claim}%
  \def\corollaryname{Corollary}%
  \def\axiomname{Axiom}%
  \def\assumptionname{Assumption}%
  \def\examplename{Example}%
  \def\propertyname{Property}%
  \def\remarkname{Remark}%
  \def\problemname{Problem}%
  \def\algorithmname{Algorithm}%
}
\addto\captionshebrew{%
  \def\acknowledgmentname{\hebhe\hebkaf\hebresh\hebtav\ \hebtav\hebvav\hebdalet\hebhe}%
  \def\bibname{\hebresh\hebshin\hebyod\hebmem\hebtav\ \hebmem\hebqof\hebvav\hebresh\hebvav\hebtav}%
  \def\continuedname{\hebhe\hebmem\hebshin\hebfinalkaf}%
  \def\definitionname{\hebhe\hebgimel\hebdalet\hebresh\hebhe}%
  \def\theoremname{\hebmem\hebshin\hebpe\hebtet}%
  \def\lemmaname{\heblamed\hebmem\hebhe}%
  \def\claimname{\hebtet\hebayin\hebnun\hebhe}%
  \def\corollaryname{\hebmem\hebsamekh\hebqof\hebnun\hebhe}%
  \def\axiomname{\hebalef\hebqof\hebsamekh\hebyod\hebvav\hebmem\hebhe}%
  \def\assumptionname{\hebhe\hebnun\hebhet\hebhe}%
  \def\examplename{\hebdalet\hebvav\hebgimel\hebmem\hebhe}%
  \def\propertyname{\hebtav\hebkaf\hebvav\hebnun\hebhe}%
  \def\remarkname{\hebhe\hebayin\hebresh\hebhe}%
  \def\problemname{\hebbet\hebayin\hebyod\hebhe}%
  \def\algorithmname{\hebalef\heblamed\hebgimel\hebvav\hebresh\hebyod\hebtav\hebfinalmem}%
}
\def\@makeschapterhead#1{%   % Heading for \chapter* command
  \vspace*{50\p@}%           % Space at top of text page.
  {\parindent \z@ \centering % Center the header
    \normalfont
    \interlinepenalty\@M
    \huge \bfseries #1\par   % Title.
    \nobreak                 % TeX penalty to prevent page break.
    \vskip 40\p@             % Space between title and text.
  }}
\renewcommand{\bchapternn}[2]{\chapter*{%
    \protect\if@rl #1\protect\else #2\protect\fi%
    \@mkboth{\protect\if@rl #1\protect\else
                            #2\protect\fi}%
            {\protect\if@rl #1\protect\else
                            #2\protect\fi}}
  \addcontentsline{toc}{chapter}{%
    \protect\hspace{-1.5em}\protect\numberline{}%
    \protect\if@rl #1\protect\else #2\protect\fi}
  \addcontentsline{cot}{chapter}{%
    \protect\hspace{-1.5em}\protect\numberline{}%
    \protect\if@rl #1\protect\else #2\protect\fi}}
\let\@@thebibliography\thebibliography
\def\thebibliography{%
  \addcontentsline{toc}{chapter}{\protect\hspace{-1.5em}\protect{%
      \bfseries\protect\numberline{}\protect\bibname}}
  \addcontentsline{cot}{chapter}{\protect\hspace{-1.5em}\protect{%
      \bfseries\protect\numberline{}\protect\bibname}}
  \@@thebibliography}
\newcommand{\bcaptionf}[2]{%
  \caption[\protect\if@rl \R{#1}\protect\else \L{#2}\protect\fi]{%
    \if@rl\R{#1} \protect\\ \L{Figure~\thefigure: #2}
    \else\L{#2} \protect\\ \R{\hebalef\hebyod\hebvav\hebresh~\thefigure: #1}
    \fi}}
\newcommand{\bcaptionff}[4]{%
  \caption[\protect\if@rl \R{#1}\protect\else \L{#2}\protect\fi]{%
    \if@rl\R{#3}\protect\\ \L{Figure~\thefigure: #4}
    \else\L{#4}\protect\\ \R{\hebalef\hebyod\hebvav\hebresh~\thefigure: #3}
    \fi}}
\newcommand{\bcaptiont}[2]{%
  \caption[\protect\if@rl \R{#1}\protect\else \L{#2}\protect\fi]{%
    \if@rl\R{#1} \protect\\ \L{Table~\thetable: #2}
    \else\L{#2} \protect\\ \R{\hebtet\hebbet\heblamed\hebhe~\thetable: #1}
    \fi}}
\newcommand{\bcaptiontt}[4]{%
  \caption[\protect\if@rl \R{#1}\protect\else \L{#2}\protect\fi]{%
    \if@rl\R{#3} \protect\\ \L{Table~\thetable: #4}
    \else\L{#4} \protect\\ \R{\hebtet\hebbet\heblamed\hebhe~\thetable: #3}
    \fi}}
\newcounter{thestype}
\newcounter{grade}
\def\title#1#2{\gdef\@@titleh{#1}\gdef\@@title{#2}}
\def\author#1#2{\gdef\@@authorh{#1}\gdef\@@author{#2}}
\def\dept#1#2{\gdef\@@depth{#1}\gdef\@@dept{#2}}
\def\dom#1#2{\gdef\@@domh{#1}\gdef\@@dom{#2}}
\def\advisori#1#2{\gdef\@@advisorih{#1}\gdef\@@advisori{#2}}
\def\advisorii#1#2{\gdef\@@advisoriih{#1}\gdef\@@advisorii{#2}}
\def\@@donorih{\hebtet\hebkaf\hebnun\hebyod\hebvav\hebfinalnun}
\def\@@donori{THE TECHNION}
\def\donori#1#2{\gdef\@@donorih{#1}\gdef\@@donori{#2}}
\def\donorii#1#2{\gdef\@@donoriih{#1}\gdef\@@donorii{#2}}
\def\donor#1#2{\gdef\@donorh{#1}\gdef\@donor{#2}}
\def\@@title{}
\def\@@author{}
\def\@@dom{}
\def\@@advisori{}
\def\@@advisorii{}
\def\@@donorii{}
\def\@donor{}
\def\@thestype{%
   \ifcase\value{thestype}%
   \or Research Thesis%
   \or Project Thesis%
   \or Final Paper \else {}\fi}
\def\@linei{%
  Submitted in Partial Fulfillment of the Requirements}
\def\@lineii{%
   \ifcase\value{grade}%
        \or For the Degree of Master of Science%
        \or For the Degree of Master%
        \or For the Degree of Master of Technology%
        \or For the Degree of Doctor of Science%
        \else %
  {}%
   \fi%
}
\def\@lineiii{%
  \if\@@dom\else%
     \ifcase\value{grade}%
        \or in \@@dom%
        \or in \@@dom%
        \or in \@@dom%
        \else{}\fi%
  \fi}
\def\@lineiv{\mbox{\hspace{-.2in}\normalsize%
      Submitted to the Senate of the Technion --- %
      Israel Institute of Technology}}
\def\@linev{\MakeUppercase{\footnotesize{\LJMonth}}%
            \hfill\MakeUppercase{Haifa}\hfill%
            \MakeUppercase{\LGMonth}}
\def\@linevi{The \@thestype\ Was Done Under The Supervision of}
\def\@linevii{in}
\def\@donor{%
  The generous financial help of \@@donori\ %
  \ifx\empty\@@donorii\else\MakeUppercase{and \@@donorii{} }\fi%
  is gratefully acknowledged}
\def\@@titleh{}
\def\@@authorh{}
\def\@@depth{}
\def\@@domh{}
\def\@@advisorih{}
\def\@@advisoriih{}
\def\@@donoriih{}
\def\@donorh{}
\def\@researchtypeh{%
   \ifcase\value{thestype}%
   \or \hebhe\hebmem\hebhet\hebqof\hebresh%
   \or \hebhe\hebpe\hebresh\hebvav\hebyod\hebqof\hebtet%
   \or \hebhe\hebayin\hebbet\hebvav\hebdalet\hebtav\
       \hebhe\hebgimel\hebmem\hebresh
   \else {}
   \fi%
}

\def\@thestypeh{%
   \ifcase\value{thestype}%
   \or \hebhet\hebyod\hebbet\hebvav\hebresh\ \hebayin\heblamed\
       \hebmem\hebhet\hebqof\hebresh%
   \or \hebhet\hebyod\hebbet\hebvav\hebresh\ \hebayin\heblamed\
       \hebpe\hebresh\hebvav\hebyod\hebqof\hebtet%
   \or \hebayin\hebbet\hebvav\hebdalet\hebtav\ \hebgimel\hebmem\hebresh
   \else {}
   \fi%
}
\def\@lineih{%
  \heblamed\hebshin\hebfinalmem\ \hebmem\hebyod\heblamed\hebvav\hebyod\ \hebhet\heblamed\hebqof\hebyod\ %
  \hebshin\heblamed\ \hebhe\hebdalet\hebresh\hebyod\hebshin\hebvav\hebtav\ %
  \heblamed\hebqof\hebbet\heblamed\hebtav\ \hebtav\hebvav\hebalef\hebresh{}}
\def\@lineiih{%
   \ifcase\value{grade}%
        \or \hebmem\hebgimel\hebyod\hebsamekh\hebtet\hebresh\ %
            \heblamed\hebmem\hebdalet\hebayin\hebyod\hebfinalmem%
        \or \hebmem\hebgimel\hebyod\hebsamekh\hebtet\hebresh%
        \or \hebmem\hebgimel\hebyod\hebsamekh\hebtet\hebresh\ %
            \hebbet\hebtet\hebkaf\hebnun\hebvav\heblamed\hebvav\hebgimel\hebyod\hebhe%
        \or \hebdalet\hebqof\hebtet\hebvav\hebresh\ %
            \heblamed\hebmem\hebdalet\hebayin\hebyod\hebfinalmem%
        \else {}\fi}
\def\@lineiiih{%
   \ifcase\value{grade}%
     \or \@@domh%
     \or \@@domh%
     \or \@@domh%
     \else{}\fi}
\def\@lineivh{\hebhe\hebvav\hebgimel\hebshin\ \heblamed\hebsamekh\hebnun\hebtet\ %
             \hebhe\hebtet\hebkaf\hebnun\hebyod\hebvav\hebfinalnun\ \textemdash\ %
             \hebmem\hebkaf\hebvav\hebfinalnun\ %
             \hebtet\hebkaf\hebnun\hebvav\heblamed\hebvav\hebgimel\hebyod\ %
             \heblamed\hebyod\hebshin\hebresh\hebalef\heblamed}
\def\@linevh{\HJMonth%
             \hfill\hebhet\hebyod\hebpe\hebhe\hfill%
             \HGMonth}
\def\@linevih{%
   \ifcase\value{thestype}%
   \or \@researchtypeh{} \hebnun\hebayin\hebshin\hebhe%
   \or \@researchtypeh{} \hebnun\hebayin\hebshin\hebhe%
   \or \@researchtypeh{} \hebnun\hebayin\hebshin\hebtav\hebhe\else{}\fi}
\def\@lineviih{\hebbet\hebhe\hebdalet\hebresh\hebkaf\hebtav{}}
\def\@donorh{\hebalef\hebnun\hebyod\ \hebmem\hebvav\hebdalet\hebhe{}
  \heblamed\@@donorih{}
  \ifx\empty\@@donoriih\else\hebvav\heblamed\@@donoriih{} \fi
  \hebayin\heblamed\ \hebhe\hebtav\hebmem\hebyod\hebkaf\hebhe\ \hebhe\hebkaf\hebsamekh\hebpe\hebyod\hebtav\ %
  \hebhe\hebnun\hebdalet\hebyod\hebbet\hebhe\ \hebbet\hebhe\hebshin\hebtav\heblamed\hebmem\hebvav\hebtav\hebyod}%
\newcommand\frontmatter{%
  \pagestyle{empty}
  \if@openright\cleardoublepage\else\clearpage\fi%
  % Until gim gets fixed
  %\if@rl\pagenumbering{roman}\else\pagenumbering{roman}\fi}
  %\if@rl\pagenumbering{gim}\else\pagenumbering{roman}\fi}
  % alph only works well for numbers <= 10
  \if@rl\pagenumbering{alph}\else\pagenumbering{roman}\fi}
\newcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \pagestyle{thesis}
  \pagenumbering{arabic}}
\let\backmatter\frontmatter
\newcommand{\makecover}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \null\vskip.8truein
    \ifhebtech@setspace\begin{doublespace}\fi
      \begin{center}
        \bfseries\if@rl\Huge\@@titleh
        \else\huge\@@title\fi
        \vskip2.7truein
        \if@rl\huge\@@authorh
        \else\LARGE\@@author\fi
      \end{center}
    \ifhebtech@setspace\end{doublespace}\fi
    \vfill\null
  \end{titlepage}
  \thispagestyle{empty}}
\renewcommand{\maketitle}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \ifhebtech@setspace\begin{doublespace}\fi
    \begin{center}
      % The IBM Narkis fonts seem to be smaller than the standard
      % CMR ones
      \bfseries\huge\if@rl\ifhebtech@hebibm\Huge\fi\@@titleh
      \else\@@title\fi
    \end{center}
    \vfill
    \begin{center}
      \if@rl\Large \@thestypeh\else\large\@thestype \fi
    \end{center}
    \vfill
    \begin{center}
      \if@rl\large
         \@lineih \par
         \@lineiih \par
         \@lineiiih%
      \else\large
         \@linei\par
         \@lineii \par
         \@lineiii%
      \fi
    \end{center}
    \vfill%
    \begin{center}
      \bfseries\if@rl\LARGE\@@authorh
      \else\LARGE\@@author\fi
    \end{center}
    \vfill
    \begin{center}
      \if@rl \large
         \@lineivh \par
         \@linevh
      \else
         \@lineiv \par
         \@linev\fi
    \end{center}
  \ifhebtech@setspace\end{doublespace}\fi
  \newpage\thispagestyle{empty}}
\ifhebtech@showthanks%
\else%
  \RequirePackage{comment}
\fi
\def\hebtech@ackheader{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}%
  \begin{center}
    \if@rl\large
      \@linevih{}
      \@lineviih{}
      \@@advisorih{}
      \ifx\empty\@@advisoriih\else\hebvav\@@advisoriih{} \fi\\
      \@@depth
    \else
      \@linevi{}
      \@@advisori\ %
      \ifx\empty\@@advisorii\else and \@@advisorii{} \fi
      \@linevii{}
      \@@dept
    \fi
  \end{center}
  \vfill
  \ifhebtech@showthanks
    \begin{center}%
      \if@rl\LARGE\acknowledgmentname%
      \else\LARGE\acknowledgmentname\fi
    \end{center}
  \fi
  \vspace{2\baselineskip}
}
\def\hebtech@acktailer{%
  \ifthenelse{\equal{\@donor}{}}{%
    % If the user used \donor{}{}, don't print donor text
  }{% else: print it
  \vfill
  \begin{center}
    \if@rl\large\@donorh\else\@donor\fi
  \end{center}
  }
  \newpage\normalsize\thispagestyle{empty}%
}
\ifhebtech@showthanks%
  \newenvironment{acknowledgment}{%
    \hebtech@ackheader%
    \begingroup\large%
  }{% environment end:
    \endgroup%
    \hebtech@acktailer%
  }%
\else% (of \ifhebtech@showthanks)
  \processcomment{acknowledgment}{% empty processing command
    \def\ThisComment##1{}% print nothing in each line
    \hebtech@ackheader% run this before the environment
  }{%
  }{%
    \hebtech@acktailer% run this after the environment
  }
  %\excludecomment{acknowledgment}% declare it a comment env.
\fi
\ifhebtech@showthanks
  \newenvironment{dedication}{%
    \thispagestyle{empty}%
    \vspace*{2\baselineskip}
    \begin{center}\large%
  }{% At the end of the environment:
    \end{center}
    \newpage\normalsize\thispagestyle{empty}%
  }
\else% (of \ifhebtech@showthanks)
  \excludecomment{dedication}% declare it a comment env.
\fi
\renewenvironment{abstract}{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \if@rl\bchapternn{\abstractname}{Hebrew Abstract}
  \else\bchapternn{\hebtav\hebqof\hebtsadi\hebyod\hebresh\ %
                   \hebbet\hebalef\hebnun\hebgimel\heblamed\hebyod\hebtav}
                  {\abstractname}\fi%
  \begingroup}{%
  \newpage\endgroup}
 % The default Hebrew acknowledgment text:
\gdef\hebtech@acknowledgment@texth{
    % created using transheb.pl
    \hebzayin\hebvav\hebhe\hebyod\ \hebbet\hebresh\hebyod\hebresh\hebtav\
    \hebhe\hebmem\hebhet\hebdalet\heblamed\
    \heblamed\hebtet\hebqof\hebsamekh\hebtet\
    \hebhe\hebtav\hebvav\hebdalet\hebvav\hebtav\ \hebshin\heblamed\
    \hebhe\hebmem\hebhet\heblamed\hebqof\hebhe\ \L{\emph{hebtech}}
    )\hebtav\hebzayin\hebhe\
    \hebtet\hebkaf\hebnun\hebyod\hebvav\hebnun\hebyod\hebtav(.
    \hebalef\hebpe\hebshin\hebresh\
    \heblamed\hebhe\hebhet\heblamed\hebyod\hebpe\hebvav\
    \hebbet\hebtet\hebqof\hebsamekh\hebtet\
    \hebalef\hebhet\hebresh\ \hebayin"\hebyod\
    \hebhe\hebmem\hebqof\hebresh\hebvav
    \L{\emph{$\backslash$acknowledgmenttext}}

    \hebbet\hebresh\hebtsadi\hebvav\hebnun\hebyod\
    \heblamed\hebhe\hebvav\hebdalet\hebvav\hebtav\
    \heblamed\hebkaf\heblamed\ \hebmem\hebyod\
    \hebshin\hebayin\hebzayin\hebresh\
    \hebbet\hebhe\hebkaf\hebnun\hebtav\
    \hebhe\hebtav\hebmem\hebyod\hebkaf\hebhe\
    \hebhe\hebayin\hebbet\hebresh\hebyod\hebtav\ \heblamed-\LaTeX\
    \hebbet\hebmem\hebhe\heblamed\hebfinalkaf\
    \hebhe\hebshin\hebnun\hebyod\hebfinalmem
}
 % The default English acknowledgment text:
\gdef\hebtech@acknowledgment@text{
  This is the default acknowledgment text of the class \emph{hebtech}
  (Technion Thesis). To put your own text, use the command
  \emph{$\backslash$acknowledgmenttext}

  I would like to thank Donald E. Knuth for writing the great \TeX
  text typesetting system. I would also like to thank others who have
  written extentions such as \LaTeX which has enabled mortals to work
  with it.
}
\providecommand{\acknowledgmenttext}[2]{
  \renewcommand{\hebtech@acknowledgment@texth}{#1}
  \renewcommand{\hebtech@acknowledgment@text}{#2}
}
 % The default Hebrew dedication text:
\gdef\hebtech@dedication@texth{
   \hebzayin\hebvav\hebhe\hebyod\
   \hebbet\hebresh\hebyod\hebresh\hebtav\
   \hebhe\hebmem\hebhet\hebdalet\heblamed\
   \heblamed\hebtet\hebqof\hebsamekh\hebtet\
   \hebhe\hebhe\hebqof\hebdalet\hebshin\hebhe\ \hebshin\heblamed\
   \hebhe\hebmem\hebhet\heblamed\hebqof\hebhe\ \L{\emph{hebtech}}
   )\hebtav\hebzayin\hebhe\
   \hebtet\hebkaf\hebnun\hebyod\hebvav\hebnun\hebyod\hebtav(.
   \hebalef\hebpe\hebshin\hebresh\
   \heblamed\hebhe\hebhet\heblamed\hebyod\hebpe\hebvav\
   \hebbet\hebtet\hebqof\hebsamekh\hebtet\
   \hebalef\hebhet\hebresh\ \hebayin"\hebyod\
   \hebhe\hebmem\hebqof\hebresh\hebvav
   \L{\emph{$\backslash$dedicationtext}}

   % something more original anybody?
   \hebalef\hebnun\hebyod\ \hebmem\hebqof\hebdalet\hebyod\hebshin\
   \hebayin\hebbet\hebvav\hebdalet\hebhe\ \hebzayin\hebvav\
   \heblamed\hebhe\hebvav\hebresh\hebyod\hebyod\
   \hebvav\hebmem\hebvav\hebresh\hebyod\hebyod
}
 % The default English dedication text:
\gdef\hebtech@dedication@text{
  This is the default dedication text of the class \emph{hebtech}
  (Technion Thesis). To put your own text, use the command
  \emph{$\backslash$dedicationtext}

  This work is dedicated to the Dedi the cat for its patients and loyalty
}

\providecommand{\dedicationtext}[2]{
  \renewcommand{\hebtech@dedication@texth}{#1}
  \renewcommand{\hebtech@dedication@text}{#2}
}
\gdef\hebtech@abstract@text{
  \if@rl%
    \hebzayin\hebvav\hebhe\hebyod\
    \hebbet\hebresh\hebyod\hebresh\hebtav\
    \hebhe\hebmem\hebhet\hebdalet\heblamed\
    \heblamed\hebtet\hebqof\hebsamekh\hebtet\
    \hebhe\hebtav\hebqof\hebtsadi\hebyod\hebresh\ \hebshin\heblamed\
    \hebhe\hebmem\hebhet\heblamed\hebqof\hebhe\ \L{\emph{hebtech}}
    )\hebtav\hebzayin\hebhe\
    \hebtet\hebkaf\hebnun\hebyod\hebvav\hebnun\hebyod\hebtav(.
    \hebalef\hebpe\hebshin\hebresh\
    \heblamed\hebhe\hebhet\heblamed\hebyod\hebpe\hebvav\
    \hebbet\hebtet\hebqof\hebsamekh\hebtet\
    \hebalef\hebhet\hebresh\ \hebayin"\hebyod\
    \hebhe\hebmem\hebqof\hebresh\hebvav
    \L{\emph{$\backslash$abstracttext}}

    \hebhe\hebtav\hebqof\hebtsadi\hebyod\hebresh\
    \hebtsadi\hebresh\hebyod\hebfinalkaf\
    \heblamed\hebhe\hebyod\hebvav\hebtav\
    \hebyod\hebvav\hebtav\hebresh\ \hebalef\hebresh\hebvav\hebfinalkaf\
    )\hebkaf-\L{200}--\L{500}
    \hebmem\hebyod\heblamed\hebyod\hebfinalmem.(
  \else%
    This is the default abstract text of the class \emph{hebtech}
    (Technion Thesis). To put your own text, use the command
    \emph{$\backslash$abstracttext}

    The abstract should be longer than this (about 200--500 words)
  \fi%
}
\providecommand{\abstracttext}[1]{
  \renewcommand{\hebtech@abstract@text}{#1}
}
\gdef\hebtech@losym@text{
  \if@rl%
    \def\hebtech@losym@text@rl{}% save the fact that we started as rtl
    \hebzayin\hebvav\hebhe\hebyod\
    \hebbet\hebresh\hebyod\hebresh\hebtav\
    \hebhe\hebmem\hebhet\hebdalet\heblamed\
    \heblamed\hebtet\hebqof\hebsamekh\hebtet\
    \hebresh\hebshin\hebyod\hebmem\hebtav\
    \hebsamekh\hebmem\heblamed\hebyod\hebfinalmem\ \hebshin\heblamed\
    \hebhe\hebmem\hebhet\heblamed\hebqof\hebhe\ \L{\emph{hebtech}}
    )\hebtav\hebzayin\hebhe\
    \hebtet\hebkaf\hebnun\hebyod\hebvav\hebnun\hebyod\hebtav(.
    \hebalef\hebpe\hebshin\hebresh\
    \heblamed\hebhe\hebhet\heblamed\hebyod\hebpe\hebvav\
    \hebbet\hebtet\hebqof\hebsamekh\hebtet\
    \hebalef\hebhet\hebresh\ \hebayin"\hebyod\
    \hebhe\hebmem\hebqof\hebresh\hebvav\
    \L{\emph{$\backslash$losymtext}}

    \hebresh\hebshin\hebyod\hebmem\hebhe\
    \heblamed\hebdalet\hebvav\hebgimel\hebmem\hebhe:
    % TODO: write a Hebrew list
    \begin{otherlanguage}{english}
  \else%
    This is the default list-of-symbols text of the class
    \emph{hebtech} (Technion Thesis). To put your own text, use the
    command \emph{$\backslash$losymtext}

    A sample list:
  \fi%

  \begin{tabular}{p{0.8cm}@{}l}
  $A$:      & one term \\
  $B_1$:    & another term \\
  $\gamma$: & Yet Another term \\
  \end{tabular}
  % close the begin above
  \ifx\\hebtech@losym@text@rl\@undefined\else\end{otherlanguage}\fi
}
\providecommand{\losymtext}[1]{
  \renewcommand{\hebtech@losym@text}{#1}
}
\providecommand{\thesis@header}[1]{
  \makecover

  \ifthenelse{\equal{#1}{mainlang}}{%
    \frontmatter
  }{% else
    \backmatter
  }

  \maketitle

  \ifhebtech@showthanks
    % in this case, simply feed the text of the acknowledgment and
    % the dedication to their envs:
    \begin{acknowledgment}
      \if@rl%
        \hebtech@acknowledgment@texth%
      \else%
        \hebtech@acknowledgment@text%
      \fi
    \end{acknowledgment}

    \begin{dedication}
      \if@rl
        \hebtech@dedication@texth
      \else
        \hebtech@dedication@text
      \fi
    \end{dedication}

  \else% of \ifhebtech@showthanks
    % Only this is needed in the "thanks" page in case of "nothanks":
    \hebtech@ackheader%
    \hebtech@acktailer%
  \fi

  % TODO: I'm not sure it's explicitly needed here
  \pagestyle{thesis}

  % Next come the pages for the table of contents and the list of
  % figures
  \tableofcontents

  \ifhebtech@lof
    \listoffigures
  \fi

  % The abstract and list-of-symbols are only needed in the main part,
  % not in the back part of the other language:
  \ifthenelse{\equal{#1}{mainlang}}{%
    \begin{abstract}
      \hebtech@abstract@text
    \end{abstract}

    \ifhebtech@losym
      \bchapternn{%
        \hebresh\hebshin\hebyod\hebmem\hebtav\
        \hebsamekh\hebmem\heblamed\hebyod\hebfinalmem%
      }{List of Symbols}
      \hebtech@losym@text
    \fi

    \mainmatter
  }{}% empty 'else' clause
}

\providecommand{\thesisheader}{\thesis@header{mainlang}}
 % actually, any text can come instead of 'other':
\providecommand{\thesisheaderminor}{\thesis@header{other}}
\def\ps@thesis{%
  \def\headeven{\protect\rule[-4pt]{\textwidth}{.5pt}\kern-\textwidth%
                \protect\if@rl\beginR\thepage\hfil{%
                              \bfseries\rightmark}\endR%
                \protect\else\thepage\hfil{%
                             \bfseries\leftmark}\protect\fi}
  \def\headodd{\protect\rule[-4pt]{\textwidth}{.5pt}\kern-\textwidth%
               \protect\if@rl\beginR{\bfseries\leftmark}%
                             \hfil\thepage\endR%
               \protect\else{\bfseries\rightmark}%
                             \hfil\thepage\protect\fi}
  \ps@headings}
\setlength{\textheight}{8.25in}
\setlength{\textwidth}{6.0in}
\setlength{\topmargin}{0pt}
\setlength{\headsep}{.5in}
\addtolength{\headsep}{-\headheight}
\setlength{\oddsidemargin}{.25in}
\setlength{\evensidemargin}{.25in}
\setlength{\marginparwidth}{40pt}
\setlength{\marginparsep}{10pt}
\brokenpenalty=10000
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\endinput
%%
%% End of file `hebtech.cls'.
