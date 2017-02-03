%latex2e declaration
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iitcsw}[2002/01/29 homework class]
\newif\ifiitcsweightbit
\iitcsweightbitfalse
\newif\ifiitcswfancy
\iitcswfancyfalse
\newif\ifiitcswdraft
\iitcswdraftfalse
\newif\ifiitcswremarks
\iitcswremarksfalse
\newif\ifiitcswanswers
\iitcswanswersfalse
% wide margins
\newif\ifiitcswwide
\iitcswwidetrue
\newif\ifiitcswrecpt
\iitcswrecpttrue
\newif\ifiitcswpairs
\iitcswpairstrue
\newif\ifiitcsw@fontload % Whether or not we need to load hebfont
\iitcsw@fontloadfalse
\newcommand{\iitcsw@quesPageBreak}{}
\newcommand{\iitcsw@articledraft}{}
\DeclareOption{enccp862}{\providecommand{\iitcsw@inputenc}{cp862}}%
\DeclareOption{enc8859-8}{\providecommand{\iitcsw@inputenc}{8859-8}}%
\DeclareOption{enccp1255}{\providecommand{\iitcsw@inputenc}{cp1255}}%
\DeclareOption{encsi960}{\providecommand{\iitcsw@inputenc}{si960}}%
\DeclareOption{eightbit}{\iitcsweightbittrue}
\DeclareOption{fancy}{\iitcswfancytrue}
\DeclareOption{nofancy}{\iitcswfancyfalse}
\DeclareOption{wide}{\iitcswwidetrue}
\DeclareOption{nowide}{\iitcswwidefalse}
\DeclareOption{draft}{%
  \iitcswdrafttrue%
  \renewcommand{\iitcsw@articledraft}{draft}%
}
\DeclareOption{final}{\iitcswdraftfalse}
\DeclareOption{remarks}{\iitcswremarkstrue}
\DeclareOption{noremarks}{\iitcswremarksfalse}
% Should I leave both "answers" and "remarks"?
\DeclareOption{answers}{\iitcswanswerstrue}
\DeclareOption{noanswers}{\iitcswanswersfalse}
\DeclareOption{recpt}{\iitcswrecptstrue}
\DeclareOption{norecpt}{\iitcswrecptfalse}
\DeclareOption{pairs}{\iitcswpairsstrue}
\DeclareOption{nopairs}{\iitcswpairsfalse}
\DeclareOption{pagebreak}{\renewcommand{\iitcsw@quesPageBreak}{\pagebreak}}
\DeclareOption{nopagebreak}{\renewcommand{\iitcsw@quesPageBreak}{}}
\ProcessOptions

% set the option "answers" if LatexMake set it
\ifx\LatexMakeAnswerSwitch\@undefined\else\iitcswanswerstrue\fi

\LoadClass[11pt,\iitcsw@articledraft]{article}

% I don't feel like leaving wide margins. I would use wider margins for what
% I submit, though. 'wide' is currently on by default. (Tzafrir)
\ifiitcswwide%
  \RequirePackage{a4wide}% has to come before ''onehalfspacing', if that one is
                         %        used
  %\RequirePackage[top=3cm,bottom=4cm,left=3cm,right=3cm]{geometry}%
\fi

\ifiitcswanswers%
  % If this form is typeset with answers
  \iitcsw@fontloadtrue%
\fi

\ifiitcsweightbit%
  \newcommand{\HeblatexEightBitFont}{}%
\else% the current 7bit fonts need more spacing
  \RequirePackage{setspace}
  \onehalfspacing
\fi

\ifx\iitcsw@inputenc\@undefined\else% 
  % Do the following if an input encoding option was given
  \RequirePackage[\iitcsw@inputenc]{inputenc}%
\fi

\ifiitcswfancy%
  \RequirePackage{amssymb}%
  \RequirePackage{fancybox}%
  \newcommand{\iitcsw@goodluckbox}[1]{%
    {\LARGE $\looparrowright$ \shadowbox{#1} $\looparrowleft$}%
  }%
\else
  \newcommand{\iitcsw@goodluckbox}[1]{\LAARGE #1}
\fi

%\newcommand{\draftremarkname}{drxz hiehd} %7bit for "הערת טיוטה"
\newcommand{\draftremarkname}{%
  \hebhe\hebayin\hebresh\hebtav\ \hebtet\hebyod\hebvav\hebtet\hebhe%
}
% define \remark:
\ifiitcswremarks%
  \newcommand{\remark}[2][\draftremarkname]{\footnote{\R{#1: #2}}}%
\else%
  \newcommand{\remark}[2][]{}%
\fi

%\newcommand{\answer}[1]{\remark[\hebhe\hebtav\hebshin\hebvav\hebbet\hebhe]{#1}}
\newcommand{\answer}[1]{\remark[dzyead]{#1}}

\RequirePackage[english,hebrew]{babel}
%\RequirePackage{amsfonts}
\RequirePackage{amssymb}
%\usepackage{hebfont}
\RequirePackage{hebcal}
\RequirePackage{fancyhdr}
%\RequirePackage{amsmath}
%\RequirePackage{amssymbpatch}
%\RequirePackage{dsfont}
%\RequirePackage{usefull1}

% If any option requires hebfont load it
\ifiitcsw@fontload%
  \RequirePackage{hebfont}
\fi




\pagestyle{fancy}

% The following have to be explicitly defined:

% \providecommand\CourseName{תכן לוגי}
% \providecommand\CourseFullName{\CourseName \ \L{234262}} 
% %(or simply \CourseName)
% \providecommand\Semester{חורף תשס"ב}
% \providecommand\AssignmentSubject{מעבד ה-\L{MIPS}}
% \providecommand\HWNum{2}
% \providecommand{\SubmitionTime}{יום ח' \L{35.5.2005} בשעה \L{12:30} 

\providecommand{\FinalText}{%
  \vfill
  \center{\iitcsw@goodluckbox{\goodluckname!}}
  \vfill
  \vfill
}

\lhead{\R{\CourseName}}
\chead{\R{\Semester}}
\rhead{\R{\homeworkname \HWNum}}
\cfoot{\L{\arabic{page}}}

\newcommand{\ExtraInstructions}{}

\def\submittersname{%
  \hebhe\hebmem\hebgimel\hebyod\hebshin\hebyod\hebfinalmem%
}
\def\addressname{\hebkaf\hebtav\hebvav\hebbet\hebtav}
\def\semestername{\hebsamekh\hebmem\hebsamekh\hebtet\hebresh}
\def\homeworkname{%
  \hebtav\hebresh\hebgimel\hebyod\heblamed\ \hebbet\hebyod\hebtav%
}
\def\withanswersname{%
  \hebayin\hebfinalmem\ \hebtav\hebshin\hebvav\hebbet\hebvav\hebtav%
}
\def\answersprintedname{%
  \hebhe\hebtav\hebshin\hebvav\hebbet\hebvav\hebtav\ %
  \hebmem\hebvav\hebdalet\hebpe\hebsamekh\hebvav\hebtav !!!%
}
\def\tainchargename{%
  \hebmem\hebtav\hebresh\hebgimel\heblamed\ %
  \hebalef\hebhet\hebresh\hebalef\hebyod%
}
\def\rechoursname{
  \hebshin\hebayin\hebvav\hebtav\ \hebqof\hebbet\heblamed\hebhe%
}
\def\subdatename{
  \hebtav\hebalef\hebresh\hebyod\hebfinalkaf\ %
  \hebhe\hebgimel\hebshin\hebhe%
}
\def\subinpairsname{%
  \hebhe\hebhe\hebgimel\hebshin\hebhe\ %
  \hebbet\hebzayin\hebvav\hebgimel\hebvav\hebtav\ %
  \hebbet\heblamed\hebbet\hebdalet!%
}
\def\namename{\hebshin\hebfinalmem}
\def\studnumname{\hebmem.\hebsamekh.}
\def\gradename{\hebtsadi\hebyod\hebvav\hebfinalnun}
\def\retboxname{
  \hebtav\hebalef\ \heblamed\hebhe\hebhet\hebzayin\hebresh\hebhe%
}
\def\questionname{\hebshin\hebalef\heblamed\hebhe}
\def\AnswerExplainname{\hebhe\hebsamekh\hebbet\hebresh: }
\def\goodluckname{\hebbet\hebhe\hebtsadi\heblamed\hebhet\hebhe}

\renewcommand{\maketitle}{
  \noindent
  \FacultyName\ 	\hfill \semestername{} \Semester \\
  \CourseFullName\ 			\hfill \today
  
  \vskip 3em
  
  \begin{center}
  {\LARGE \homeworkname{} \HWNum} \par 
  {\large \AssignmentSubject}
  \ifiitcswanswers
    \\ {\large )\withanswersname(}
  \fi
  \end{center}
  
  %\vskip 1em
  
  \thispagestyle{empty}
  
  \zeroparskip
  \remark{\LARGE \answersprintedname}
  \noindent{\bf \tainchargename}: \TaInCharge \L{(\TaInChargeEmail)}
  
  \ifiitcswrecpt%
    \noindent{\bf \rechoursname}: \RecHours
  \fi
  
  \noindent{\bf \subdatename}: \SubmitionTime
  
  \ifiitcswpairs
    \vskip 1ex
  
    \noindent{\bf  \subinpairsname}
  \fi
  
  \vskip 1ex

  \Instructions

  \restoreparskip
  
  \vfill
  
  \begin{center} \Large
  {\normalsize \submittersname:}
  
  \namename: \underline{\makebox[7em]{}} \quad 
  \studnumname: \underline{\makebox[7em]{}}
  
  \bigskip
  
  %\Large 
  \namename: \underline{\makebox[7em]{}} \quad 
  \studnumname: \underline{\makebox[7em]{}}
  
  \bigskip
  
  %\Large 
  \addressname: \underline{{\makebox[13em]{}}@\makebox[8em]{}}
  
  \medskip
  
  \vfill
  
  \gradename: \underline{\makebox[2em]{}} \hfill 
  \retboxname: \underline{\makebox[2em]{}} 
  
  \end{center}
  
  \vfill
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \setcounter{page}{0} % we start at page 1

  \pagebreak
}

%%
%% \Answer{} Print text in "answer" font if answers are to be printed
%%
%\newcommand{\Answer}[1]{\ifiitcswanswers\textshscr{#1}\fi}
\newcommand{\Answer}[1]{\ifiitcswanswers\textyad{#1}\fi}

%%
%% \AnswerLines: Produce 5 (by default) horizental lines, for filling in the 
%%               answer
%% \NaswerPlace: Produce some underlined space
%%
%% The non-optional (though possibly empty) argument of them is the 
%% answer, that will be typeset if the option 'answers' is used 
%% 
\newcounter{iitcsw@ansline}
%\setcounter{\iitcsw@ansline}{5}
\newcommand\AnswerLines[2][5]{%
  \ifiitcswanswers%
    \Answer{#2}% This is non-optimal: doing this if twice...
  \else%
  %   \begin{tabular*}{0.95\textwidth}{c}% without factor of 0.95 I get a latex
  %                                      % warning about the width
  %   \\ \hline \\ \hline \\\hline \\ \hline \\ \hline %
  %   \end{tabular*}%
    \setcounter{iitcsw@ansline}{#1}
    \whiledo{\value{iitcsw@ansline} > 0}{
      \noindent \rule{0em}{1ex} \hrulefill \\ %
      \addtocounter{iitcsw@ansline}{-1}%
    }
  \fi
}
\newlength{\AnswerPlacelen}
\setlength{\AnswerPlacelen}{3em}
% \AnswerPlace[width]: create an underlined space of the specified width.
% \AnswerPlace (with no parameter): The width is \AnswerPlacelen (3em, by
%                                   default)
\newcommand\AnswerPlace[2][\AnswerPlacelen]{
  \underline{\makebox[#1]{\Answer{#2}}}
}

% explanations are answers that are given as footnotes, for further
% clarification
\newcommand{\AnswerExplain}[1]{%
  \ifiitcswanswers%
    \footnote{\Answer{\AnswerExplainname #1}}
  \fi%
}

\newlength{\saveparskip}
% don't use two \zeroparskip without a \restoreparskip in the middle!
\newcommand\zeroparskip{\setlength{\saveparskip}{\parskip}\setlength{\parskip}{0em}}
\newcommand\restoreparskip{\setlength{\parskip}{\saveparskip}}

%%%
%%% Some helper macros:
%%%

\providecommand{\BeforeQuestion}{}
%\setlength{\parindent}{0pt}
%\renewcommand{\thesection}{\hebshin\hebalef\heblamed\hebhe \arabic{section}}
\renewcommand\section{\BeforeQuestion %
                      \@startsection {section}{1}{\z@}%
                        {-3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus.2ex}%
                        {%
			  \normalfont\Large\bfseries\centering%
			  \questionname\ %
			}%
		      }

\def\thesubsection{\gim{subsection}}
%\def\thesubsection{\alph{subsection}}
% \newcommand\question[1]{%
%   \begin{center}%
%   \section{\hebshin\hebalef\heblamed\hebhe \hebmem\hebsamekh' \arabic{section} - #1}%
%   \end{center}%
% }
% 
% \newcommand{\ques}[1][]{\section{#1}}
\providecommand{\question}[1]{\iitcsw@quesPageBreak \section{#1}}
\providecommand{\courseSlogan}[1]{
  {\footnotesize
    \noindent
    \begin{flushleft}
      \hfill
       #1
    \end{flushleft}
  }
}

\endinput
