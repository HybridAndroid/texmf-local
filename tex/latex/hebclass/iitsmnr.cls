%latex2e declaration
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
% Options parsing
%

% The options for calling the class seminar (with LoadClass)
\newcommand{\iitsmnr@seminar@options}{article}
% A This macro is used just before every slide
\newcommand{\handouts@pagebreak}{\pagebreak}% For the option 'handouts'
% The following condition will be true only on a slides-only printout
\newif\ifiitsmnrslidesonly \iitsmnrslidesonlyfalse
% The following condition will be true only on a notes-only printout (not used
% currently)
\newif\ifiitsmnrnotesonly  \iitsmnrnotesonlyfalse
% The following is true if we use prosper instead of seminar: 
\newif\ifiitsmnrprosper  \iitsmnrprosperfalse
%
% The different options (and their effects):
%
\DeclareOption{prosper}  {\iitsmnrprospertrue}%
\DeclareOption{noprosper}{\iitsmnrprosperfalse}% (default)

\DeclareOption{notes}{%
  \renewcommand{\iitsmnr@seminar@options}{notesonly,article}%
  \iitsmnrnotesonlytrue%
}
\DeclareOption{handouts}{%
  \renewcommand{\iitsmnr@seminar@options}{article}}%
  \renewcommand{\handouts@pagebreak}{\pagebreak}%
  \iitsmnrslidesonlyfalse%
\DeclareOption{slides}{%
  \renewcommand{\iitsmnr@seminar@options}{slidesonly}%
  \iitsmnrslidesonlytrue%
}
% encoding-related options:
\DeclareOption{enccp862}{\providecommand{\iitcsw@inputenc}{cp862}}%
\DeclareOption{enc8859-8}{\providecommand{\iitcsw@inputenc}{8859-8}}%
\DeclareOption{enccp1255}{\providecommand{\iitcsw@inputenc}{cp1255}}%
\DeclareOption{encsi960}{\providecommand{\iitcsw@inputenc}{si960}}%
\ProcessOptions

\ProvidesClass{iitsmnr}[2003/10/13 Hebrew seminar-based class]

% Are those defaults sane?
\providecommand{\prosperoptions}{pdf,slideColor,total}
\providecommand{\prosperstyle}{heb-prosper}
\ifiitsmnrprosper
  \LoadClass[%
    %\iitsmnr@seminar@options,%
    \prosperoptions,%         % set by the user  
    \prosperstyle,%           % set by the user as well
  ]{prosper}%
\else%
  \LoadClass[%
    \iitsmnr@seminar@options,%
    a4,%                     % note that we force an a4 paper
  ]{seminar}%
\fi

%\RequirePackage[cp862]{inputenc}
\RequirePackage[english,hebrew]{babel}
%\RequirePackage{amsfonts}
%\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{slidesec}
\RequirePackage{calc}
% I add this for hyperlinks in the DVI file. Nothing important.
% It may cause problems with hebrew
\RequirePackage{hyperref}
\HeblatexRedefineL % hyperref has its own definition for \L

\ifiitsmnrprosper\else
  % bug-fixes for the seminar class
  \input{seminar.bug}
  \input{seminar.bg2}
\fi

\ifiitsmnrprosper\else%
  % We provide \institution and \email, similar to \title and \author
  % for compatibility with prosper
  \gdef\iitsmnr@institution{}%
  \providecommand{\institution}[1]{\renewcommand\iitsmnr@institution{#1}}%
  \gdef\iitsmnr@email{}%
  \providecommand{\email}[1]{\renewcommand{\iitsmnr@email}{#1}}%
\fi

% unfortunetly prosper has no way of ignoring text outside slides
% Initial hack: define a macro for text. Ignore this text in prosper:
\newcommand{\notes}[1]{%
  \ifiitsmnrprosper%
  \else#1%
  \fi
}

%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
%
% The following code should eventually be added to rlbabel:
% TODO: this code is problematic. Get the slightly better code from my thesis
% seminar

% Override the definition of seminar'a table-of-contents line
% because the way hyperref overrides it creates problems in the
% table-of-contents
%
% Original macro:
% \def\contentsline#1#2#3#4{%
%   \ifx\\#4\\%
%     \csname l@#1\endcsname{#2}{#3}%
%   \else
%     \ifHy@linktocpage
%       \csname l@#1\endcsname{{#2}}{%
%         \hyper@linkstart{link}{#4}{#3}\hyper@linkend
%       }%
%     \else
%       \csname l@#1\endcsname{%
%         \hyper@linkstart{link}{#4}{#2}\hyper@linkend
%       }{#3}%
%     \fi
%   \fi
% }
\ifiitsmnrprosper\else
  \def\contentsline#1#2#3#4{%
    \ifx\\#4\\%
      \csname l@#1\endcsname{#2}{#3}%
    \else
      \ifHy@linktocpage
        \csname l@#1\endcsname{{#2}}{%
          % change: wrap link itself with \L and link text with \R
          % This should generally work
          \L{\hyper@linkstart{link}{#4}{\R{#3}}\hyper@linkend}
        }%
      \else
        \csname l@#1\endcsname{%
          % the same fix as above:
          \L{\hyper@linkstart{link}{#4}{\R{#2}}\hyper@linkend}
        }{#3}%
      \fi
    \fi
  }
\fi


%%%%%%%%%%%%%%%
%
% The following define:
%
%   \printtime{counter}: counter is number in seconds. 
%                        Prints it as minutes:seconds
%
% calc operations can be used with '\setcounter', but not with '\arabic'
\newcounter{printtime@minutes}
\newcounter{printtime@seconds}
\newcommand{\printtime}[1]{%
  \setcounter{printtime@minutes}{\value{#1}/60}%
  \setcounter{printtime@seconds}{\value{#1}-\value{printtime@minutes}*60}
  \theprinttime@minutes:\theprinttime@seconds%
}
% The progress timer
%
% \timerReset
% \timerSet{time-in-seconds}
% \timerAdvance{time-in-seconds}
\newcommand{\timerCurrenttimename}{זמן נוכחי}
\newcommand{\timerThisslidename}{השקף הזה}
\newcounter{@progresstime}
\newcommand{\timerSet}[1]{\setcounter{@progresstime}{#1}}
\newcommand{\timerReset}{\timerSet{0}}
\timerReset
\newcommand{\timerAdvance}[1]{\addtocounter{@progresstime}{#1}}
\newcommand{\timerPrint}{\printtime{@progresstime}}
\newcommand{\timerPrintStatusAdvance}[1]{%
  \begin{center}
    \framebox{\parbox{0.5\textwidth}{%
        \timerCurrenttimename: \L{\timerPrint}\hfill%
        \timerThisslidename: \L{\printtime{#1}}%
        \timerAdvance{\value{#1}}%
    %    \addtocounter{@progresstime}{\value{#1}}%
      }%
    }%
  \end{center}
}
%%%%%%%%%%%%%%%

\newcounter{Slide@time}
\newcommand{\iitsmnr@headskip}{10ex}
\newcommand{\iitsmnr@footskip}{10ex}

% Slide:
%
% The slide environment has two mandatory arguments
%  #1: the slide title
%  #2: the slide time (in seconds)
\ifiitsmnrprosper%
  \newenvironment{Slide}[2]{%
    \begin{slide}{\R{#1}}% ignore the second argment, the time
  }{%
    \end{slide}%
  }%
\else
\newenvironment{Slide}[2]{%
  \typeout{In Slide. Title: #1}%
  \ifiitsmnrnotesonly\else\handouts@pagebreak\fi%
  \ifiitsmnrslidesonly\else\vspace*{-\iitsmnr@headskip}\fi

  \begin{slide}
  \slideheading{#1}
  \setcounter{Slide@time}{#2}
}{%
  \end{slide} 
  \ifiitsmnrslidesonly\else\vspace{-\iitsmnr@footskip}\fi
  
  \ifiitsmnrslidesonly%
    \timerAdvance{\value{Slide@time}}%
  \else%
    \ifiitsmnrnotesonly%
      \timerAdvance{\value{Slide@time}}%
    \else%
      %\vspace*{-4ex}\\
      \timerPrintStatusAdvance{Slide@time}%\\
    \fi%
  \fi%
}
\fi% \ifiitsmnrprosper

% Declare that the 'Slide' environment is also to be considered as "not slide"
\def\slide@list{slide,slide*,allversions,allversions*,Slide}


% This prints a double arrow in the current direction:
% [if A is a result of B]:
% A \hence B works both in LTR and in RTL
\newcommand{\hence}{%
  \if@rl%
    \ensuremath{\Leftarrow}%
  \else%
    \ensuremath{\Rightarrow}%
  \fi%
}

\newcommand{\theenumi@prefixsav}{}
\newcommand{\enumprefix}[1]{%
  \let\theenumi@sav{\theenumi}%
  \renewcommand{\theenumi}{#1\theenumi@prefixsav}%
}
\newcommand{\restoreenum}{\let\theenumi{\theenumi@prefixsav}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The \maketitleslide macro: The contents of a title slide.
% TODO: this needs improvememtns
%

% Some extra text in the title slide:
\newcommand{\iitsmnrTitleExtra}{}

\newcommand{\titleextra}[1]{% 
  \ifiitsmnrprosper%
    \subtitle{#1}%
  \else%
    \renewcommand{\iitsmnrTitleExtra}{#1}%
  \fi%
}

% The macro itself:
% \@author is defined in the command \author. \@title is defined in \title
\newcommand{\maketitleslide}{%
    \slidepagestyle{empty}

    \begin{center}
      {\huge\sc \@title}

      \vspace{4ex}

      {%
        \Large \@author\ >%
	% use \email, if it was given
        \ifx\iitsmnr@email\@undefined\else%
	  \L{%
	    \href{%
	      mailto:\iitsmnr@email%
	    }{%
	      \iitsmnr@email%
	    }%
	  }%
	\fi%
	<
      }

      \ifx\iitsmnr@institution\@undefined\else
        \vspace{2ex}
        
        % if \institution was used, print it:
        {\sc \iitsmnr@institution}
      \fi
    \end{center}
    
    \vspace{6ex}
    
    \iitsmnrTitleExtra
}
