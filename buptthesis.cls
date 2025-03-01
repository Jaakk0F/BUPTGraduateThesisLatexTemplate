%% -----------------------------------------------------------------
%% 
%% Copyright (C) 2016 -- 201X by 
%%
%% Haojun Yang, Lu Hou and Jie Mei
%%
%%
%% Copyright (C) 2024 -- 20XX by
%%
%% Jiajun Fu
%% -----------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{buptthesis}
[2023/12/09 v0.2 Beijing University of Posts and Telecommunications (BUPT) thesis document class]
\typeout{-- See the "README.md" for basic usage information.}

%% -----------------------------------------------------------------

%% Document class options

%% Class option conditionals
\newif\ifBUPT@option@phd             \BUPT@option@phdtrue
\newif\ifBUPT@option@master          \BUPT@option@masterfalse
\newif\ifBUPT@option@electronic      \BUPT@option@electronictrue
\newif\ifBUPT@option@print           \BUPT@option@printfalse
\newif\ifBUPT@option@draftcls        \BUPT@option@draftclsfalse
\newif\ifBUPT@option@cenhdr          \BUPT@option@cenhdrfalse
\newif\ifBUPT@option@normaltoc       \BUPT@option@normaltocfalse
\newif\ifBUPT@option@txmath          \BUPT@option@txmathfalse
\newif\ifBUPT@option@macos           \BUPT@option@macosfalse
\newif\ifBUPT@option@fulltime        \BUPT@option@fulltimetrue
\newif\ifBUPT@option@parttime        \BUPT@option@parttimefalse
\newif\ifBUPT@option@phil            \BUPT@option@philtrue
\newif\ifBUPT@option@eng             \BUPT@option@engfalse

%%blankdblpage

%% Declare class options
\DeclareOption{phd}{%
  \BUPT@option@phdtrue%
  \BUPT@option@masterfalse}
\DeclareOption{master}{%
  \BUPT@option@phdfalse%
  \BUPT@option@mastertrue}

\DeclareOption{phil}{%
  \BUPT@option@philtrue%
  \BUPT@option@engfalse}
\DeclareOption{eng}{%
  \BUPT@option@philfalse%
  \BUPT@option@engtrue}

\DeclareOption{fulltime}{%
  \BUPT@option@fulltimetrue%
  \BUPT@option@parttimefalse}
\DeclareOption{parttime}{%
  \BUPT@option@fulltimefalse%
  \BUPT@option@parttimetrue}

\DeclareOption{electronic}{%
  \BUPT@option@electronictrue%
  \BUPT@option@printfalse%
  \BUPT@option@draftclsfalse}
\DeclareOption{print}{%
  \BUPT@option@electronicfalse%
  \BUPT@option@printtrue%
  \BUPT@option@draftclsfalse}
\DeclareOption{draftcls}{%
  \BUPT@option@electronicfalse%
  \BUPT@option@printfalse%
  \BUPT@option@draftclstrue}

\DeclareOption{cenhdr}{%
  \BUPT@option@cenhdrtrue}

\DeclareOption{normaltoc}{%
  \BUPT@option@normaltoctrue%
  \PassOptionsToPackage{nottoc,notlof,notlot}{tocbibind}}

\DeclareOption{txmath}{%
  \BUPT@option@txmathtrue}

\DeclareOption{macos}{%
  \BUPT@option@macostrue%
  \typeout{-- Operating system is Mac OS.}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{phd,phil,fulltime,electronic}
\ProcessOptions\relax
%% 注意：如果载入文档类的时候，使用phd选项，则phd选项被载入了2次！

\PassOptionsToPackage{no-math}{fontspec}

%% -----------------------------------------------------------------

%% Load ctexbook.cls document class
%% book.cls default:
%% \ExecuteOptions{letterpaper,10pt,twoside,onecolumn,final,openright}

\ifBUPT@option@macos
  \LoadClass[
    UTF8,
    a4paper,
    zihao = -4,
    fontset = fandol
  ]{ctexbook}
\else
  \LoadClass[
    UTF8,
    a4paper,
    zihao=-4,
    scheme=chinese,
  ]{ctexbook}
\fi

\setcounter{secnumdepth}{5}

%% -----------------------------------------------------------------

%% Fonts setup

%% Chinese text fonts setup
\ifBUPT@option@macos
  \typeout{-- See the "ctex-fontset-macwin.def" for more information about chinese text font.}
\else
  \typeout{-- See the "ctex-fontset-windowsnew.def" for more information about chinese text font.}
\fi

% English text fonts setup
\RequirePackage[T1]{fontenc}
\renewcommand\sfdefault{phv}
\renewcommand\rmdefault{ptm}
\renewcommand\ttdefault{pcr}


%% Math fonts setup
\ifBUPT@option@txmath
  \RequirePackage{newtxmath}
\fi

%% -----------------------------------------------------------------

%% Load packages

\RequirePackage{keyval}
%% In fact, the graphicx package has loaded the keyval package.

%% Math Packages
%\interdisplaylinepenalty=2500
\RequirePackage{unicode-math}
%\RequirePackage{amssymb}
%\RequirePackage{bm}
%\RequirePackage{amsmath}
\RequirePackage{eucal}
\RequirePackage{mdwmath}
\RequirePackage{xfrac}
\RequirePackage{enumitem}
\setlist{nosep}

%% Graphic Related Packages
\ifBUPT@option@draftcls
  \setkeys{Gin}{draft = true}
\else
  \RequirePackage{graphicx}
  %% In fact, the xunicode package has loaded the graphicx package.
\fi
\RequirePackage[font=small,subrefformat=parens]{subfig}

%% Table and Array Packages
\RequirePackage{makecell}
%% The makecell package already loads the array package.
\RequirePackage{multirow}

%% Specialzed List Packages
\RequirePackage{algorithmic}
\RequirePackage{algorithm}

\@addtoreset{algorithm}{chapter} % 使算法编号在每一章重新开始

\RequirePackage{acronym}
\RequirePackage{IEEEtrantools}

\RequirePackage{mathtools}
\RequirePackage[table,usenames,svgnames,dvipsnames]{xcolor}
\RequirePackage{longtable}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\newcolumntype{g}{>{\columncolor{LightSteelBlue}}c}

%% Citation Packages
%\RequirePackage[noadjust]{cite}
\RequirePackage[sort]{gbt7714}
\setlength{\bibsep}{0.5ex}

%% PDF, URL and Hyperlink Packages
\RequirePackage{url}
\ifBUPT@option@electronic
  \RequirePackage{hyperref}
\fi

%% Double page to single page
\ifBUPT@option@electronic
  \let\cleardoublepage\clearpage
\fi

%% Geometry Package
\RequirePackage{geometry}

%% Fancyhdr Package
\RequirePackage{fancyhdr}

%% Units Package
\RequirePackage[binary-units]{siunitx}

%% Caption Package
\setCJKfamilyfont{gbkt}[Path=./resources/]{gbkai-Regular.ttf}
\newcommand{\gbkai}{\CJKfamily{gbkt}} % 国标楷体
\RequirePackage{caption}
\RequirePackage{bicaption}
\DeclareCaptionFont{kaishu}{\kaishu}
\DeclareCaptionFont{gbkai}{\gbkai}
\captionsetup{format=plain,labelformat=simple,labelsep=space,justification=centering,font={small,gbkai}}
\captionsetup[figure][bi-second]{name=Figure}
\captionsetup[table][bi-second]{name=Table}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\thealgorithm}{\thechapter-\arabic{algorithm}}
\renewcommand{\ALG@name}{算法}


%% Tocbibind Package
\RequirePackage{tocbibind}

\AtEndOfClass{%
  \InputIfFileExists{config/buptthesis.cfg}{}{}}

%% -----------------------------------------------------------------

%% Styles setup

%% For EPS and PDF figures:
%\graphicspath{{Figure/PDF/}{Figure/EPS/}}
%% For only PDF figures:
\graphicspath{{Figure/EPS/}{Figure/EPS/Chapter1/}}
%% Page layout
%% twoside:
%\geometry{left=2.5cm, right=3cm, top=3cm, bottom=3cm}
%% oneside:
%\geometry{left=2.75cm, right=2.75cm, top=3cm, bottom=3cm}
% NOTE: 20240112按照官方标准要求
%\geometry{a4paper, left=3.17cm, right=3.17cm, top=2.54cm, bottom=2.54cm} 
%\setlength{\headheight}{0.32cm}
%\setlength{\headsep}{0.72cm}
%\setlength{\footskip}{0.79cm}
% NOTE:  20240112按照官方模板测量结果
\geometry{a4paper, left=3.17cm, right=3.17cm, top=2.54cm, bottom=3.24cm}
\setlength{\headheight}{0.32cm}
\setlength{\headsep}{0.92cm}
\setlength{\footskip}{1.29cm}

%% Typeset LaTeX commands as text
\RequirePackage{listings}
\newcommand{\latextext}[1]{\lstinline[language={[LaTeX]TeX}, basicstyle=\ttfamily] {#1}}

%% Degree
\ifBUPT@option@phd
  \def\BUPT@value@degree{\BUPT@label@phddegree}
  \def\BUPT@value@degreeEN{\BUPT@label@phddegreeEN}
  \def\BUPT@value@thesisEN{\BUPT@label@phdthesisEN}
\else
  \def\BUPT@value@degree{\BUPT@label@masterdegree}
  \def\BUPT@value@degreeEN{\BUPT@label@masterdegreeEN}
  \def\BUPT@value@thesisEN{\BUPT@label@masterthesisEN}
\fi

%% Degree mode
\ifBUPT@option@phil
  \def\BUPT@value@degreemode{\BUPT@label@philmode}
  \def\BUPT@value@degreetype{\BUPT@label@philtype}
  \def\BUPT@value@degreemodeEN{\BUPT@label@philmodeEN}
\else
  \def\BUPT@value@degreemode{\BUPT@label@engmode}
  \def\BUPT@value@degreetype{\BUPT@label@engtype}
  \def\BUPT@value@degreemodeEN{\BUPT@label@engmodeEN}
\fi

%% Training mode
\ifBUPT@option@fulltime
  \def\BUPT@value@trainingmode{\BUPT@label@fulltime}
  \def\BUPT@value@trainingmodeEN{\BUPT@label@fulltimeEN}
\else
  \def\BUPT@value@trainingmode{\BUPT@label@parttime}
  \def\BUPT@value@trainingmodeEN{\BUPT@label@parttimeEN}
\fi

%% Page style
\ifBUPT@option@draftcls
  \ctexset{today = old}
  \let\oldtoday\today
  \ctexset{today = small}
  \fancypagestyle{BUPThdrstyle}{%
    \fancyhf{}%
    \fancyhead[OR]{\zihao{-5} \leftmark}%
    \fancyhead[OL,ER]{\zihao{-5} DRAFT}%
    \fancyhead[EL]{\zihao{-5} \BUPT@label@university\BUPT@value@degree\BUPT@label@thesis}%
    \fancyhead[EC]{\zihao{-5} \oldtoday}%
    \fancyfoot[C]{\zihao{5} \thepage}%
    \renewcommand\headrulewidth{0.4\p@}%
    \renewcommand\footrulewidth{0\p@}}
\else
  \ifBUPT@option@cenhdr
    \fancypagestyle{BUPThdrstyle}{%
      \fancyhf{}%
      \fancyhead[OC]{\zihao{-5} \nouppercase{\leftmark}}% 奇数页页眉章节标题 英文字母全大写 ---> 修正为大小写正常显示
      \fancyhead[EC]{\zihao{-5} \BUPT@label@university\BUPT@value@degree\BUPT@label@thesis}%
      \fancyfoot[C]{\zihao{5} \thepage}%
      \renewcommand\headrulewidth{0.4\p@}%
      \renewcommand\footrulewidth{0\p@}}
  \else
    \fancypagestyle{BUPThdrstyle}{%
      \fancyhf{}%
      \fancyhead[OR]{\zihao{-5} \leftmark}%
      \fancyhead[EL]{\zihao{-5} \BUPT@label@university\BUPT@value@degreetype\BUPT@value@degree\BUPT@label@thesis}%
      %\BUPT@label@university\BUPT@value@degreetype\BUPT@value@degree\BUPT@label@thesis}%
      \fancyfoot[C]{\zihao{5} \thepage}%
      \renewcommand\headrulewidth{0.4\p@}%
      \renewcommand\footrulewidth{0\p@}}
  \fi
\fi
\let\BUPT@frontmatter\frontmatter
\def\frontmatter{%
  \BUPT@frontmatter\pagenumbering{Roman}
  \pagestyle{BUPThdrstyle}}
%% Page style before \frontmatter
\AtBeginDocument{%
  \pagenumbering{alpha}%
  \pagestyle{empty}}

%% Headings
\ctexset{
  chapter = {
    format = \heiti\zihao{3}\centering,
    beforeskip = -1.5 em,
    afterskip = 2 em,
    pagestyle = BUPThdrstyle,
    aftername = \hspace{1 em},
   },
  section = {
    format = \heiti\zihao{4}\raggedright,
    beforeskip = 0.5 em,
    afterskip = 0.5 em,
    aftername = \hspace{1 em},
   },
  subsection = {
      format = \heiti\zihao{-4}\raggedright,
      beforeskip = 0 em,
      afterskip = 0 em,
      aftername = \hspace{1 em},
    },
  subsubsection = {
      format = \songti\zihao{-4}\raggedright,
      beforeskip = 0 em,
      afterskip = 0 em,
      aftername = \hspace{1 em},
      name = {\qquad },
    },
}

%% Names
\ctexset{
  contentsname = {目\quad 录},
  listfigurename = {图目录},
  listtablename = {表目录}
}

%% linespread行间距
\setlength\parskip{\p@}%0\p@ \@plus 0.1\p@}
\linespread{1.4} % 1.5倍行距，要求为20磅，小四号字体情况下差2磅
%\setlength{\baselineskip}{2000pt}

\setlength{\abovecaptionskip}{3pt} % 20240110修改图表和文本间距
\setlength{\belowcaptionskip}{3pt}
\setlength{\abovedisplayskip}{0mm} % 20240111修改公式和正文间距
\setlength{\belowdisplayskip}{0mm}
\setlength{\intextsep}{3pt}

%% Set ToC information
\setcounter{tocdepth}{2}		%增加目录深度
\RequirePackage{titletoc}
\titlecontents{chapter}[4em]{\heiti \zihao{-4}}{\contentslabel{4em}}{\hspace*{-4em}}{\titlerule*[0.2pc]{$.$}\contentspage}
\titlecontents{section}[4em]{\songti \zihao{-4}}{\contentslabel{2em}}{\hspace*{-2em}}{\titlerule*[0.2pc]{$.$}\contentspage}
\titlecontents{subsection}[7em]{\songti \zihao{-4}}{\contentslabel{3em}}{\hspace*{-3em}}{\titlerule*[0.2pc]{$.$}\contentspage}

% Time options
\def\BUPTdateOptions#1{\setkeys{entitle}{#1}}
\define@key{entitle}{pageYear}{\def\BUPT@value@pageYear{#1}}
\define@key{entitle}{pageMonth}{\def\BUPT@value@pageMonth{#1}}
\define@key{entitle}{pageDay}{\def\BUPT@value@pageDay{#1}}
\define@key{entitle}{dissertationYear}{\def\BUPT@value@dissertationYear{#1}}
\define@key{entitle}{dissertationMonth}{\def\BUPT@value@dissertationMonth{#1}}
\define@key{entitle}{dissertationDay}{\def\BUPT@value@dissertationDay{#1}}

%% Titlepage options
\def\BUPTthesiscntitlepage#1{\setkeys{cntitle}{#1}}
\define@key{cntitle}{confidential}{\def\BUPT@value@confidential{#1}}
\define@key{cntitle}{title}{\long\def\BUPT@value@title{#1}}
\define@key{cntitle}{studentid}{\def\BUPT@value@studentid{#1}}
\define@key{cntitle}{name}{\def\BUPT@value@name{#1}}
\define@key{cntitle}{major}{\def\BUPT@value@major{#1}}
\define@key{cntitle}{supervisor}{\def\BUPT@value@supervisor{#1}}
\define@key{cntitle}{institute}{\def\BUPT@value@institute{#1}}

\def\BUPTthesisentitlepage#1{\setkeys{entitle}{#1}}
\define@key{entitle}{confidentialEN}{\def\BUPT@value@confidentialEN{#1}}
\define@key{entitle}{titleEN}{\long\def\BUPT@value@titleEN{#1}}
\define@key{entitle}{nameEN}{\def\BUPT@value@nameEN{#1}}
\define@key{entitle}{majorEN}{\def\BUPT@value@majorEN{#1}}
\define@key{entitle}{supervisorEN}{\def\BUPT@value@supervisorEN{#1}}
\define@key{entitle}{instituteEN}{\def\BUPT@value@instituteEN{#1}}

%% Titlepage
%% The \hss glue is equivalent to \hskip 0pt plus 1fil minus 1fil.
%% Solution from https://github.com/CTeX-org/forum/issues/36
\ExplSyntaxOn
\seq_new:N \l_@@_title_seq
\cs_new_protected:Npn \BUPT@setstr #1
{ \exp_args:NNno \seq_set_split:Nnn \l_@@_title_seq { \\ } {#1} }
%% o means expansion once.

\dim_new:N \l_@@_title_width_dim
\cs_new_protected:Npn \BUPT@printcovertitle
{
  \group_begin:
  \@@_title_name_format:
  \tl_use:N \c_@@_title_name_tl
  \group_end:
  \group_begin:
  \@@_title_format:
  \@@_get_max_width:NN \l_@@_title_width_dim \l_@@_title_seq
  \dim_add:Nn \l_@@_title_width_dim { 20\p@ }
  \dim_log:N \l_@@_title_width_dim
  \parbox [t] { \l_@@_title_width_dim }
  {
    \seq_map_inline:Nn \l_@@_title_seq
    { \@@_underline:Nn \l_@@_title_width_dim {##1} \\ }
  }
  \group_end:
}

\cs_new_protected:Npn \BUPT@printcovertitleEN
{
  \group_begin:
  \@@_title_name_format_en:
  \tl_use:N \c_@@_title_name_tl_en
  \group_end:
  \group_begin:
  \@@_title_format_en:
  \@@_get_max_width:NN \l_@@_title_width_dim \l_@@_title_seq
  \dim_add:Nn \l_@@_title_width_dim { 20\p@ }
  \dim_log:N \l_@@_title_width_dim
  \parbox [t] { \l_@@_title_width_dim }
  {
    \seq_map_inline:Nn \l_@@_title_seq
    { \@@_underline:Nn \l_@@_title_width_dim {##1} \\ }
  }
  \group_end:
}

\cs_new_protected:Npn \BUPT@infomaxwidth #1
{
  \group_begin:
  \@@_info_format:
  \@@_get_max_width:NN #1 \l_@@_title_seq
  \group_end:
}

%% 获取最大宽度，存入 #1
\cs_new_protected:Npn \@@_get_max_width:NN #1#2
{
  \group_begin:
  \dim_zero:N #1
  \bool_until_do:nn { \seq_if_empty_p:N #2 }
  {
    \seq_pop:NN #2 \l_tmpa_tl
    \exp_args:NNV \@@_get_width:Nn \l_tmpa_dim \l_tmpa_tl
    \dim_gset:Nn #1 { \dim_max:nn { \dim_use:N #1 } { \l_tmpa_dim } }
  }
  \group_end:
}
\cs_new_protected:Npn \@@_get_width:Nn #1#2
{
  \hbox_set:Nn \l_tmpa_box {#2}
  \dim_set:Nn #1 { \box_wd:N \l_tmpa_box }
}

\cs_new_protected:Npn \@@_underline:Nn #1#2
{ \underline { \hbox_to_wd:nn { \dim_use:N #1 } { \hss #2 \hss } } }

\tl_const:Nn \c_@@_title_name_tl    { \BUPT@label@title }
\cs_new:Npn  \@@_title_name_format: { \zihao{-2} \bfseries }
\cs_new:Npn  \@@_title_format:      { \zihao{-2} \bfseries }
\cs_new:Npn  \@@_info_format:      { \zihao{4} \bfseries }

\tl_const:Nn \c_@@_title_name_tl_en    { \BUPT@label@titleEN }
\cs_new:Npn  \@@_title_name_format_en: { \zihao{-2} \bfseries }
\cs_new:Npn  \@@_title_format_en:      { \zihao{-2} \bfseries }
\cs_new:Npn  \@@_info_format_en:      { \zihao{4} \bfseries }
\ExplSyntaxOff

\def\BUPTunderline#1#2{\underline{\hbox to #1{\hss #2\hss}}}
\def\makechinesetitle{%
  \begin{flushright}
    %\zihao{4}\bfseries \BUPT@label@confidential\BUPT@value@confidential~~~~\BUPT@label@confidentialtime\BUPT@value@confidentialtime~~~~
    \zihao{4}\bfseries \BUPT@label@confidential\BUPT@value@confidential~~~~
  \end{flushright}
  \begin{center}
    \includegraphics[width=12.67cm]{\BUPT@value@schoolname}
    \vskip \stretch{0.5}
    {\heiti\fontsize{32}{\p@}\bfseries \BUPT@value@degree\BUPT@label@thesis （\BUPT@value@degreemode）}
    \vskip \stretch{0.5}
    \includegraphics[width=3.43cm]{\BUPT@value@schoollogo}
  \end{center}
  \vskip \stretch{0.5}
  \BUPT@setstr{\BUPT@value@title}
  \begin{center}
    \BUPT@printcovertitle
  \end{center}
  \newlength{\BUPT@value@infomaxwidth}
  \BUPT@setstr{\BUPT@value@studentid \\ \BUPT@value@name \\ \BUPT@value@major \\ \BUPT@value@supervisor \\ \BUPT@value@institute}
  \BUPT@infomaxwidth{\BUPT@value@infomaxwidth}
  \addtolength{\BUPT@value@infomaxwidth}{40\p@}
  \begin{center}
    {\zihao{4}\bfseries
      \renewcommand\arraystretch{1.3}
      \setlength\extrarowheight{1\p@}
      \begin{tabular}{rc}
        \BUPT@label@studentid    & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@studentid}    \\
        \BUPT@label@name         & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@name}         \\
        \BUPT@label@major        & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@major}        \\
        \BUPT@label@trainingmode & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@trainingmode} \\
        \BUPT@label@supervisor   & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@supervisor}   \\
        \BUPT@label@institute    & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@institute}
      \end{tabular}}
    \vskip \stretch{0.5}
    {\zihao{4}\bfseries \BUPT@value@pageYear 年 \BUPT@value@pageMonth 月 \BUPT@value@pageDay 日}
  \end{center}
  \cleardoublepage
}%

\def\makeenglishtitle{%
  \begin{flushright}
    %\zihao{4}\bfseries \BUPT@label@confidential\BUPT@value@confidential~~~~\BUPT@label@confidentialtime\BUPT@value@confidentialtime~~~~
    \zihao{4}\bfseries \BUPT@label@confidentialEN\BUPT@value@confidentialEN~~~~
  \end{flushright}
  \begin{center}
    %{\fontsize{28}{\p@}\bfseries \BUPT@label@schoolnameEN} % NOTE: 20240103旧版本英文封面
    \includegraphics[width=15cm]{\BUPT@value@schoolen} % NOTE: 20240103新版官方英文封面
    \vskip \stretch{0.2}
    %{\heiti\fontsize{24}{\p@}\bfseries \BUPT@value@degreeEN~\BUPT@label@thesisEN} % NOTE: 20240103旧版本英文封面
    {\zihao{-1} \BUPT@value@degreeEN~\BUPT@value@thesisEN}% NOTE: 20240103新版官方英文封面
    %\vskip \stretch{0.5} % NOTE: 20240103旧版本英文封面
    %\includegraphics[width=3.43cm]{\BUPT@value@schoollogo} % NOTE: 20240103旧版本英文封面
  \end{center}
  \vskip \stretch{0.2}  % NOTE: 20240103新版官方英文封面
  \BUPT@setstr{\BUPT@value@titleEN}
  \begin{center}
    \BUPT@printcovertitleEN
  \end{center}
  \vskip \stretch{0.2}  % NOTE: 20240103新版官方英文封面
  \BUPT@setstr{\BUPT@value@studentidEN \\ \BUPT@value@nameEN \\ \BUPT@value@majorEN \\ \BUPT@value@trainingmodeEN \\ \BUPT@value@supervisorEN \\ \BUPT@value@instituteEN}
  \BUPT@infomaxwidth{\BUPT@value@infomaxwidth}
  \addtolength{\BUPT@value@infomaxwidth}{40\p@}
  \begin{center}
    {\zihao{4}\bfseries
      \renewcommand\arraystretch{1.3}
      \setlength\extrarowheight{1\p@}
      \begin{tabular}{rc}
        \BUPT@label@studentidEN  & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@studentid}    \\
        \BUPT@label@nameEN       & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@nameEN}       \\
        \BUPT@label@majorEN      & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@majorEN}      \\
        \BUPT@label@supervisorEN & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@supervisorEN} \\
        \BUPT@label@instituteEN  & \BUPTunderline{\BUPT@value@infomaxwidth}{\BUPT@value@instituteEN}
      \end{tabular}}
    \vskip \stretch{0.5}
    {\zihao{4}\bfseries Date~\BUPT@value@pageDay~~Month~\BUPT@value@pageMonth~~Year~\BUPT@value@pageYear}
  \end{center}
  \cleardoublepage
}%

%% Dissertation Committee
\def\BUPTdissertationcommitteepage#1{\setkeys{cntitle}{#1}}
\define@key{cntitle}{committeeChairName}{\def\BUPT@value@committeeChairName{#1}}
\define@key{cntitle}{committeeChairTitle}{\def\BUPT@value@committeeChairTitle{#1}}
\define@key{cntitle}{committeeChairOrgan}{\def\BUPT@value@committeeChairOrgan{#1}}
\define@key{cntitle}{committeeMemberFirstName}{\def\BUPT@value@committeeMemberFirstName{#1}}
\define@key{cntitle}{committeeMemberFirstTitle}{\def\BUPT@value@committeeMemberFirstTitle{#1}}
\define@key{cntitle}{committeeMemberFirstOrgan}{\def\BUPT@value@committeeMemberFirstOrgan{#1}}
\define@key{cntitle}{committeeMemberSecondName}{\def\BUPT@value@committeeMemberSecondName{#1}}
\define@key{cntitle}{committeeMemberSecondTitle}{\def\BUPT@value@committeeMemberSecondTitle{#1}}
\define@key{cntitle}{committeeMemberSecondOrgan}{\def\BUPT@value@committeeMemberSecondOrgan{#1}}
\define@key{cntitle}{committeeMemberThirdName}{\def\BUPT@value@committeeMemberThirdName{#1}}
\define@key{cntitle}{committeeMemberThirdTitle}{\def\BUPT@value@committeeMemberThirdTitle{#1}}
\define@key{cntitle}{committeeMemberThirdOrgan}{\def\BUPT@value@committeeMemberThirdOrgan{#1}}
\define@key{cntitle}{committeeMemberFourthName}{\def\BUPT@value@committeeMemberFourthName{#1}}
\define@key{cntitle}{committeeMemberFourthTitle}{\def\BUPT@value@committeeMemberFourthTitle{#1}}
\define@key{cntitle}{committeeMemberFourthOrgan}{\def\BUPT@value@committeeMemberFourthOrgan{#1}}
\define@key{cntitle}{committeeSecretaryName}{\def\BUPT@value@committeeSecretaryName{#1}}
\define@key{cntitle}{committeeSecretaryTitle}{\def\BUPT@value@committeeSecretaryTitle{#1}}
\define@key{cntitle}{committeeSecretaryOrgan}{\def\BUPT@value@committeeSecretaryOrgan{#1}}


\def\makecommitteelist{%
  \begin{center}
    {\heiti \zihao{3} \BUPT@label@committeelist} \par
  \end{center}

  \begin{table*}[htbp]
    \centering
    \renewcommand\arraystretch{1.5}
    \begin{tabular}{|>{\centering\arraybackslash}m{2cm} | >{\centering\arraybackslash}m{2cm} | >{\centering\arraybackslash}m{2cm} | >{\centering\arraybackslash}m{6.5cm}|}
      \hline
      职务   & 姓\quad 名                                                                                                          & 职\quad  称                              & 工\quad  作\quad  单\quad  位              \\
      \hline
      主席   & \BUPT@value@committeeChairName                                                                                    & \BUPT@value@committeeChairTitle        & \BUPT@value@committeeChairOrgan        \\
      \hline
      委员   & \BUPT@value@committeeMemberFirstName                                                                              & \BUPT@value@committeeMemberFirstTitle  & \BUPT@value@committeeMemberFirstOrgan  \\
      \hline
      委员   & \BUPT@value@committeeMemberSecondName                                                                             & \BUPT@value@committeeMemberSecondTitle & \BUPT@value@committeeMemberSecondOrgan \\
      \hline
      委员   & \BUPT@value@committeeMemberThirdName                                                                              & \BUPT@value@committeeMemberThirdTitle  & \BUPT@value@committeeMemberThirdOrgan  \\
      \hline
      委员   & \BUPT@value@committeeMemberFourthName                                                                             & \BUPT@value@committeeMemberFourthTitle & \BUPT@value@committeeMemberFourthOrgan \\
      \hline
      秘书   & \BUPT@value@committeeSecretaryName                                                                                & \BUPT@value@committeeSecretaryTitle    & \BUPT@value@committeeSecretaryOrgan    \\
      \hline
      答辩日期 & \multicolumn{3}{c|}{\BUPT@value@dissertationYear 年 \BUPT@value@dissertationMonth 月 \BUPT@value@dissertationDay 日}                                                                                   \\
      \hline
    \end{tabular}
  \end{table*}
  \cleardoublepage
}%

%% Statement
\ifx\BUPT@value@confidential\@empty
  \def\BUPT@label@authorizationcomment{本学位论文不属于保密范围，适用本授权书。}
\else
  \def\BUPT@label@authorizationcomment{~}
\fi
%\BUPTunderline{40\p@}{\BUPT@value@confidentialtime}
\def\makestatement{%
  \begin{center}
    {\heiti \zihao{3} \BUPT@label@innovationtitle}
  \end{center}\par
  \vskip 5\p@
  {\zihao{-4} \BUPT@label@innovationparagraph}
  \vskip 15\p@
  \BUPT@label@authorsignature\BUPTunderline{100\p@}{}\hfil\BUPT@label@issuedate\BUPTunderline{100\p@}{}
  \vskip 55\p@
  \begin{center}
    {\heiti \zihao{3} \BUPT@label@authorizationtitle}
  \end{center}\par
  \vskip 5\p@
  {\zihao{-4} \BUPT@label@authorizationparagraph}\par
  {\zihao{-4} \BUPT@label@authorizationcomment}
  \vskip 15\p@
  \BUPT@label@authorsignature\BUPTunderline{100\p@}{}\hfil\BUPT@label@issuedate\BUPTunderline{100\p@}{}
  \vskip 15\p@
  \BUPT@label@supervisorsignature\BUPTunderline{100\p@}{}\hfil\BUPT@label@issuedate\BUPTunderline{100\p@}{}
  \cleardoublepage
}%

%% Abstract
\newenvironment{cnabstract}{%
  %\chapter[\BUPT@label@abstract]{\BUPT@value@title}
  \chapter[\BUPT@label@abstract]{}
  \begin{center}
    {\zihao{3}\heiti\centering\BUPT@label@abstract}
  \end{center}\par
  \zihao{4}
  \vspace{1ex}
}%
{}
\def\cnkeywords#1{%
  \vspace{2ex}{\bfseries\BUPT@label@keywords}#1}

\newenvironment{enabstract}{%
  %\chapter[\BUPT@label@abstractEN]{\zihao{3}\bfseries \BUPT@value@titleEN}
  \chapter[\BUPT@label@abstractEN]{}
  \begin{center}
    {\zihao{3}\bfseries\centering\BUPT@label@abstractEN}
  \end{center}\par
  \zihao{4}
  \vspace{2ex}
}%
{}
\def\enkeywords#1{%
  \vspace{4ex}{\textbf{\BUPT@label@keywordsEN}} #1}

%% Nomenclature
\newenvironment{nomenclature}{%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-10}} % NOTE: 20230103: add to remove abstract in the toc
  \chapter[\BUPT@label@nomenclature]{\zihao{3}\BUPT@label@nomenclature}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}  % NOTE: 20230103: add to remove abstract in the toc
}

%% Abbreviation
\def\BUPT@value@longestabbreviation{BUPTBUPTBUPT}
\define@key{longestlength}{abbreviation}{\def\BUPT@value@longestabbreviation{#1}}
\newenvironment{abbreviation}[1][\BUPT@label@abbreviation]{%
  \chapter{#1}
  \begin{IEEEdescription}[\IEEEsetlabelwidth{\BUPT@value@longestabbreviation}]}%
    {\end{IEEEdescription}}
\newlength\defaultlongestabbreviationlen
\settowidth\defaultlongestabbreviationlen{BUPTBUPTBUPT}
\typeout{-- Default longest abbreviation length is \defaultlongestabbreviationlen.}

%% Appendix
%\newenvironment{appendix}[1][\BUPT@label@appendix]{\chapter{#1}}{}

%% Acknowledgement
\newenvironment{acknowledgement}[1][\BUPT@label@acknowledgement]{\chapter{#1}}{}

%% Publication
\newenvironment{publication}[1][\BUPT@label@publications]{\chapter{#1}}{}

%% Experience
\newenvironment{experience}[1][\BUPT@label@experience]{\chapter{#1}}{}
%% Hyperref package setup
%\ifBUPT@option@electronic
%  \hypersetup{%
%    bookmarksopen=true,%
%    bookmarksnumbered=true,%
%    pdfpagemode={UseOutlines},%default
%    pdfstartview={FitH},%
%    colorlinks=true,%
%    citecolor={cyan},%
%    pdftitle={English Title of Thesis},%
%    pdfsubject={Beijing University of Posts and Telecommunications (BUPT) Thesis},%
%    pdfauthor={Author Name},%
%    pdfkeywords={BUPT, Thesis, LaTeX, Template}}
%\fi

\ifBUPT@option@electronic
  \hypersetup{%
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    filecolor=black,
    urlcolor=black }
\fi


%% Extra definitions
\def\cemph#1{\textcolor{RubineRed}{#1}}  % Emphasize with color RubineRed
\DeclareSIUnit{\belmilliwatt}{Bm}
\DeclareSIUnit{\belwatt}{BW}
\DeclareSIUnit{\dBm}{\deci\belmilliwatt}
\DeclareSIUnit{\dBW}{\deci\belwatt}
\DeclareSIUnit{\bitabbr}{b}
\DeclareSIUnit{\bits}{bits}
\DeclareSIUnit{\bytefull}{byte}
\DeclareSIUnit{\bytes}{bytes}
\DeclareSIUnit{\bps}{\bitabbr\per\second}
\DeclareSIUnit{\Bps}{\byte\per\second}

%% -----------------------------------------------------------------

%% Define user commands
\def\upperroman#1{\uppercase\expandafter{\romannumeral#1}}
\def\lowerroman#1{\romannumeral#1}
\def\myvec#1{\bm{\mathrm{#1}}}
\newcommand{\cmathcomma}{\text{，}} % 改变颜色
\newcommand{\cmathstop}{\text{。}}

%% -----------------------------------------------------------------

\endinput
%% End of file `buptthesis.cls'.
