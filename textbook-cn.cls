% !TEX program = xelatex
% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{textbook-cn}[By Lyu Guanlin]

%%%%%%%%%%%%%%%%%%%% 自定义命令宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{xkeyval,kvoptions,etoolbox,ifthen,xifthen,xparse}%设置键和键值%自定义命令
\SetupKeyvalOptions{family=TextBook,prefix=TextBook@,setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{TextBook}{#1}}
%%声明颜色键及默认值%%
\DeclareStringOption[BLUE]{color}
\DeclareVoidOption{BLUE}{\ekv{color=BLUE}}
\DeclareVoidOption{GREEN}{\ekv{color=GREEN}}
\DeclareVoidOption{RED}{\ekv{color=RED}}
\DeclareVoidOption{PURPLE}{\ekv{color=PURPLE}}
\DeclareVoidOption{GRAY}{\ekv{color=GRAY}}
\DeclareVoidOption{ORANGE}{\ekv{color=ORANGE}}
\DeclareVoidOption{YELLOW}{\ekv{color=YELLOW}}
\DeclareVoidOption{COLORFUL}{\ekv{color=COLORFUL}}
%%声明参考文献生成方式布尔键%%
\DeclareBoolOption[false]{splitbib}
%%加载book作为基础文档类%%
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[12pt]{book}

%%%%%%%%%%%%%%%%%%%% 文本内容风格宏包 %%%%%%%%%%%%%%%%%%%%
%%浮动环境设置%%
\renewcommand*{\textfraction}{0.05}
%%设置顶端和底端的浮动环境的最大比例%%
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
%%设置浮动环境占页比例阈值%%
\renewcommand*{\floatpagefraction}{0.85}%\floatpagefraction的数值必须小于\topfraction
\RequirePackage[table,dvipsnames,svgnames,x11names]{xcolor}%颜色宏包，必须放在tikz之前
%%蓝色主题%%
\ifdefstring{\TextBook@color}{blue}{
\definecolor{ColorA}{RGB}{68,114,210}
\definecolor{ColorB}{rgb}{0.3,0.52,1.0}
\colorlet{ColorC}{RoyalBlue}
\colorlet{ColorD}{RoyalBlue}
\colorlet{ColorE}{RoyalBlue3}
\colorlet{ColorF}{DodgerBlue2}
\colorlet{ColorG}{SteelBlue2}
\colorlet{ColorH}{DodgerBlue1}
\colorlet{ColorI}{CornflowerBlue}
}{\relax}
%%红色主题%%
\ifdefstring{\TextBook@color}{red}{
\colorlet{ColorA}{Firebrick2}
\colorlet{ColorB}{Brown2}
\colorlet{ColorC}{Crimson}
\colorlet{ColorD}{Tomato3}
\colorlet{ColorE}{Red}
\colorlet{ColorF}{Brown3}
\colorlet{ColorG}{Firebrick3}
\colorlet{ColorH}{Red2}
\colorlet{ColorI}{Red3}
}{\relax}
%%绿色主题%%
\ifdefstring{\TextBook@color}{green}{
\definecolor{ColorA}{rgb}{0.3,0.6,0.3}
\definecolor{ColorB}{rgb}{0.4,0.7,0.4}
\colorlet{ColorC}{ForestGreen}
\colorlet{ColorD}{PaleGreen4}
\colorlet{ColorE}{SeaGreen4}
\colorlet{ColorF}{SpringGreen4}
\colorlet{ColorG}{Green4}
\colorlet{ColorH}{Chartreuse4}
\colorlet{ColorI}{Chartreuse3}
}{\relax}
%%紫色主题%%
\ifdefstring{\TextBook@color}{purple}{
\definecolor{ColorA}{RGB}{147,75,201}
\definecolor{ColorB}{RGB}{192,113,217}
\colorlet{ColorC}{BlueViolet}
\colorlet{ColorD}{Violet}
\colorlet{ColorE}{MediumOrchid3}
\colorlet{ColorF}{SlateBlue3}
\colorlet{ColorG}{DarkOrchid3}
\colorlet{ColorH}{MediumPurple}
\colorlet{ColorI}{MediumOrchid}
}{\relax}
%%橙色主题%%
\ifdefstring{\TextBook@color}{orange}{
\colorlet{ColorA}{Firebrick2}
\colorlet{ColorB}{Dandelion}
\colorlet{ColorC}{DarkOrange}
\colorlet{ColorD}{BurntOrange}
\colorlet{ColorE}{Chocolate2}
\colorlet{ColorF}{Tomato2}
\colorlet{ColorG}{Sienna1}
\colorlet{ColorH}{DarkOrange1}
\colorlet{ColorI}{OrangeRed}
}{\relax}
%%黄色主题%%
\ifdefstring{\TextBook@color}{yellow}{
\colorlet{ColorA}{Dandelion}
\colorlet{ColorB}{Goldenrod1}
\colorlet{ColorC}{Gold}
\colorlet{ColorD}{Gold1}
\colorlet{ColorE}{YellowOrange}
\colorlet{ColorF}{Goldenrod}
\colorlet{ColorG}{DarkGoldenrod}
\colorlet{ColorH}{Goldenrod2}
\colorlet{ColorI}{DarkGoldenrod2}
}{\relax}
%%彩色主题%%
\ifdefstring{\TextBook@color}{colorful}{
\colorlet{ColorA}{Firebrick2}
\colorlet{ColorB}{Dandelion}
\colorlet{ColorC}{DodgerBlue1}
\colorlet{ColorD}{ForestGreen}
\colorlet{ColorE}{SlateBlue2}
\colorlet{ColorF}{Red1}
\colorlet{ColorG}{RedOrange}
\colorlet{ColorH}{DarkGoldenrod1}
\colorlet{ColorI}{HotPink1}
}{\relax}
%%设计Logo%%
\makeatletter
\DeclareRobustCommand{\TextBook}{
\@ifstar
{T\kern-0.25em\lower0.215ex\hbox{\footnotesize E}\kern-0.075em{\small X}\kern-0.1875em\lower0.125ex\hbox{\footnotesize T}\kern-0.125emB\kern-0.075em\lower-0.025ex\hbox{\footnotesize O}\kern-0.275em\lower-0.025ex\hbox{\footnotesize O}\kern-0.125emK}
{\color{ColorA}
T\kern-0.25em\lower0.215ex\hbox{\footnotesize E}\kern-0.075em{\small X}\kern-0.1875em\lower0.125ex\hbox{\footnotesize T}\kern-0.125emB\kern-0.075em\lower-0.025ex\hbox{\footnotesize O}\kern-0.275em\lower-0.025ex\hbox{\footnotesize O}\kern-0.125emK
}}
%%定义书籍信息%%
\newcommand*\coverimage[1]{\def\@coverimage{#1}}
\newcommand*\backimage[1]{\def\@backimage{#1}}
\newcommand*\series[1]{\def\@series{#1}}
\newcommand*\version[1]{\def\@version{#1}}
\newcommand*\subtitle[1]{\def\@subtitle{#1}}
\newcommand*\englishtitle[1]{\def\@englishtitle{#1}}
\newcommand*\englishsubtitle[1]{\def\@englishsubtitle{#1}}
\newcommand*\presslogo[1]{\def\@presslogo{#1}}
\newcommand*\pressname[1]{\def\@pressname{#1}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 字体设置 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[fontset=none]{ctex}%中文文本
\RequirePackage[T1]{fontenc}%字体设置宏包
\RequirePackage{fontspec}%字体设置宏包
%%中文默认字体：方正书宋_GBK，粗体为思源宋体半粗体，斜体为方正楷体_GBK%%
\setCJKmainfont{FZShuSong-Z01}[BoldFont={Source Han Sans SC Heavy},ItalicFont=FZKai-Z03]
%%中文无衬线字体：方正黑体_GBK，粗体为思源黑体中粗体%%
\setCJKsansfont{FZHei-B01}[BoldFont={Source Han Sans SC Heavy}]
%%中文等宽字体：方正仿宋_GBK%%
\setCJKmonofont{FZFangSong-Z02}
\newCJKfontfamily\songti{FZShuSong-Z01}[BoldFont={Source Han Sans SC Heavy}]
\newCJKfontfamily\xbsong{Source Han Serif SC SemiBold}%小标宋
\newCJKfontfamily\dbsong{Source Han Serif SC Bold}%大标宋
\newCJKfontfamily\cusong{Source Han Serif SC Heavy}%粗宋
\newCJKfontfamily\heiti{FZHei-B01}[BoldFont={Source Han Sans SC Heavy}]
\newCJKfontfamily\dahei{Source Han Sans SC Medium}%大黑
\newCJKfontfamily\cuhei{Source Han Sans SC Bold.otf}%粗黑
\newCJKfontfamily\fangsong{FZFangSong-Z02}
\newCJKfontfamily\kaishu{FZKai-Z03}
%%简化字体命令%%
\newcommand{\numberfont}{\bfseries\sffamily}
\newcommand{\FontSize}[1]{\fontsize{#1}{\baselineskip}\selectfont}

%%%%%%%%%%%%%%%%%%%% 页面布局设定宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{ragged2e}%对齐设置
%%页面布局设置%%
\makeatletter
\newlength{\@innerlen}
\newlength{\@outerlen}
\newlength{\@toplen}
\newlength{\@botlen}
\newlength{\@marginlen}
\setlength{\@innerlen}{2.0cm}
\setlength{\@outerlen}{2.0cm}
\setlength{\@toplen}{2.25cm}
\setlength{\@botlen}{2.25cm}
\setlength{\@marginlen}{\textwidth-0.8\textwidth+2.0em}
\RequirePackage[letterpaper,
inner=\@innerlen,outer=\@outerlen,top=\@toplen,bottom=\@botlen,
headsep=0.925cm,footskip=1.3cm,
marginparsep=-\@marginlen,marginparwidth=\@marginlen,reversemarginpar]{geometry}
\makeatother
\RequirePackage{emptypage,setspace,fancyhdr,lscape}%清除空页%行距%页眉页脚%旋转页面
\RequirePackage{extramarks}%创建额外的标记，使用方法类似于\markboth和\markright
\RequirePackage[strict]{changepage}%换页
\RequirePackage[noadjust]{marginnote}%边注
\renewcommand*{\raggedleftmarginnote}{}
\renewcommand*{\raggedrightmarginnote}{}
\RequirePackage{multicol,paracol}%双栏%分栏、边注、中英对照
\columnratio{0.8}
\footnotelayout{m}
\twosided[pcm]
%%设置栏间距和分割线颜色%%
\setlength{\columnsep}{2.0em}
\setlength{\columnseprule}{0em}
\renewcommand{\columnseprulecolor}{\color{ColorA}}
%%设置默认正文分栏环境%%
\NewDocumentEnvironment{Paracol}{O{2}}{\begin{paracol}{#1}}{\end{paracol}}

%%%%%%%%%%%%%%%%%%%% 图表插入宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}%插入图片路径
\RequirePackage[font={large,bf,color=ColorA},labelsep=colon]{caption}%图表标签
\RequirePackage[font={large,bf,color=ColorA},labelsep=colon]{subcaption}%图表标签
%%设置图片和表格格式%%
\captionsetup[figure]{name={图}}
\captionsetup[subfigure]{name={图}}
\captionsetup[table]{name={表}}
\captionsetup[subtable]{name={表}}
%%定义非浮动体标签%%
\newcommand\figcaption{\setcaptiontype{figure}\caption} 
\newcommand\tabcaption{\setcaptiontype{table}\caption}
%%设置边注中的图片和表格%%
\makeatletter
\newcommand{\marginpic}[2]{
\marginpar{
\centering\includegraphics[width=\@marginlen-0.5em]{#1}
\centering\figcaption{#2}}}
\newcommand{\margintab}[2]{
\marginpar{
\centering{#1}
\centering\tabcaption{#2}}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 目录宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[explicit,newparttoc]{titlesec}%设置标题格式
\RequirePackage{titletoc}%目录格式设置
\RequirePackage{shorttoc}%简洁目录设置
\def\shorttocname#1{#1}%定义简洁目录标题宏
\renewcommand{\contentsname}{目录}%更改目录标题
\renewcommand{\listfigurename}{插图目录}%更改图片目录标题
\renewcommand{\listtablename}{表格目录}%更改表格目录标题
\renewcommand{\shorttocname}{简洁目录}%更改简洁目录标题

\makeatletter
%%重定义\tableofcontents%%
\RenewDocumentCommand{\tableofcontents}{s O{}}{
\chapter*{\contentsname}
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{toc}
\switchcolumn
#2
\end{paracol}}
{\@starttoc{toc}}
}
%%重定义\listoffigures%%
\RenewDocumentCommand{\listoffigures}{s O{}}{
\chapter*{\listfigurename}
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{lof}
\switchcolumn
#2
\end{paracol}}
{\@starttoc{lof}}
}
%%重定义\listoftables%%
\RenewDocumentCommand{\listoftables}{s O{}}{
\chapter*{\listtablename}
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{lot}
\switchcolumn
#2
\end{paracol}}
{\@starttoc{lot}}
}
%%重定义\shorttableofcontents%%
\RenewDocumentCommand{\shorttableofcontents}{s O{}}{
\begingroup%确保计数器值只在局部生效
\c@tocdepth=0
\chapter*{\shorttocname}
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@startshorttoc{toc}
\switchcolumn
#2
\end{paracol}}
{\@startshorttoc{toc}}
\endgroup}
\makeatother

%%%%%%%%%%%%%%%%%%%% 参考文献宏包 %%%%%%%%%%%%%%%%%%%%
%%参考文献编译方式：先用XeLaTeX编译主文件.tex一次；再用BibTeX编译主文件（或各子文件）.tex一次；然后用XeLaTeX编译主文件.tex两次%%
\RequirePackage[numbers,sectionbib]{natbib}%参考文献格式
\renewcommand{\bibnumfmt}[1]{\hskip1.0mm\protect\cir{#1}}%修改参考文献序号样式
\renewcommand{\citenumfont}[1]{\textbf{\color{ColorA}{\FontSize{12pt}#1}}}%修改引用样式
\bibpunct{\color{ColorA}{[}}{\color{ColorA}{]}}{,}{n}{}{;}%修改方括号颜色
\renewcommand{\bibname}{参考文献}%修改参考文献标题
%%根据类布尔参数splitbib的存在与否来判断是否加载宏包chapterbib%%
\makeatletter
\ifTextBook@splitbib
\RequirePackage{chapterbib}%分章节显示参考文献，且参考文献编号各自独立
\fi
%%设置参考文献输出命令键%%
\define@boolkey{printbib}{intoc}[true]{}
\def\prtbib@envbiblevel{\@ifundefined{chapter}{\section}{\chapter}*}
\define@key{printbib}{envlevel}{\def\prtbib@envbiblevel{#1}}
\def\prtbib@biblevel{\@ifundefined{chapter}{\section}{\chapter}*}
\define@key{printbib}{level}{\def\prtbib@biblevel{#1}}
\def\prtbib@toclevel{\@ifundefined{chapter}{section}{chapter}}
\define@key{printbib}{toclevel}{\def\prtbib@toclevel{#1}}
\def\prtbib@envtoclevel{\@ifundefined{chapter}{section}{chapter}}
\define@key{printbib}{envtoclevel}{\def\prtbib@envtoclevel{#1}}
%%设置默认键值%%
\setkeys{printbib}{level=\chapter*,envlevel=\chapter,toclevel=chapter,envtoclevel=chapter}
%%参考文献样式设置命令%%
\newcommand{\bibsetup}[1]{\setkeys{printbib}{#1}}
%%参考文献输出设置%%
\newcommand{\printbib}[1]{
\colorlet{ListColor}{ColorA}
\if@appendix
\renewcommand{\bibsection}{
\prtbib@envbiblevel{\bibname}
\ifKV@printbib@intoc\phantomsection
\addcontentsline{toc}{\prtbib@envtoclevel}{\bibname}\fi}
\else
\renewcommand{\bibsection}{
\prtbib@biblevel{\bibname}
\ifKV@printbib@intoc\phantomsection
\addcontentsline{toc}{\prtbib@toclevel}{\bibname}\fi}
\fi
\bibliographystyle{plain}
\bibliography{#1}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 索引宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{filecontents}%在tex内编写数据文件
\RequirePackage[splitindex]{imakeidx}%索引设置，splitindex参数自动分割索引
%%索引风格文件indexstyle.ist%%
\begin{filecontents}[overwrite]{indexstyle.ist}
headings_flag 1
heading_prefix "\n\\centering\\Large\\bfseries\\color{ColorA}"
heading_suffix "\\large\\normalfont\\color{black}\\nopagebreak\n"
delim_0 " \\hfill " 
delim_1 " \\hfill "
delim_2 " \\hfill "
\end{filecontents}

\makeatletter
%%添加新关键字envlevel（环境中索引层次）%%
\def\imki@envindexlevel{\@ifundefined{chapter}{\section}{\chapter}*}
\define@key{imkiindex}{envlevel}{\def\imki@envindexlevel{#1}}
%%添加新关键字envtoclevel（环境中索引的目录层次）%%
\def\imki@envtoclevel{\@ifundefined{chapter}{section}{chapter}}
\define@key{imkiindex}{envtoclevel}{\def\imki@envtoclevel{#1}}
%%设置默认键值（不要引入noclearpage选项，否则会出现目录页码错误）%%
\setkeys{imkiindex}{level=\chapter*,envlevel=\chapter,toclevel=chapter,envtoclevel=chapter}
%%修改索引环境%%
\ifimki@original
\expandafter\def\expandafter\theindex\expandafter{\expandafter
\imki@maybeaddtotoc\theindex}
\else
\global\let\imki@idxprologue\relax
\renewenvironment{theindex}{
%%%%%%%%%% 修改部分开始 %%%%%%%%%%
\if@appendix%判断索引所在环境
\imki@envindexlevel{\indexname}
\else
\imki@indexlevel{\indexname}
\fi
\imki@maybeaddtotoc%添加目录
%\imki@indexheaders%注释掉页眉设置
%\thispagestyle{\imki@firstpagestyle}%注释掉首页页面样式
%%%%%%%%%% 修改部分结束 %%%%%%%%%%
\ifnum\imki@columns>\@ne
\columnsep\imki@columnsep
\ifx\imki@idxprologue\relax
\begin{multicols}{\imki@columns}
\else
\begin{multicols}{\imki@columns}[\imki@idxprologue]
\fi
\else
\imki@idxprologue
\fi
\global\let\imki@idxprologue\relax
\parindent\z@
\parskip\z@\@plus0.3\p@\relax
\columnseprule
\ifKV@imki@columnseprule0.4\p@\else\z@\fi
\raggedright
\let\item\@idxitem
\imki@othercode}{
\ifnum\imki@columns>\@ne
\end{multicols}
\fi}
\fi

%%修改目录添加%%
\def\imki@putindexsplit#1{
\ifimki@nonewpage\else
\imki@clearpage
\ifimki@disableautomatic\else
\immediate\closeout\csname #1@idxfile\endcsname
\fi\fi
\let\imki@indexname\indexname
\@nameuse{imki@set@#1}\imki@decide
\if@tempswa
\imki@exec{\imki@program\imki@options#1.idx}
\else
\imki@finalmessage{#1}
\fi
%%%%%%%%%% 修改部分开始 %%%%%%%%%%
\ifKV@imki@intoc
\if@appendix
\def\imki@maybeaddtotoc{\@nameuse{phantomsection}
\addcontentsline{toc}{\imki@envtoclevel}{\imki@title}}
\else
\def\imki@maybeaddtotoc{\@nameuse{phantomsection}
\addcontentsline{toc}{\imki@toclevel}{\imki@title}}
\fi
\else
\def\imki@maybeaddtotoc{}
\fi
%%%%%%%%%% 修改部分结束 %%%%%%%%%%
\ifx\imki@title\imki@check@indexname\else
\def\indexname{\imki@title}
\fi
\@input@{#1.ind}
\let\indexname\imki@indexname}
%%%%
\def\imki@putindexunique#1{
\ifimki@nonewpage\else
\imki@clearpage
\fi
\let\imki@indexname\indexname
\@nameuse{imki@set@#1}\imki@decide
\if@tempswa
\ifimki@splitdone\else
\ifimki@disableautomatic\else
\immediate\closeout\@indexfile
\fi
\imki@exec{splitindex \imki@splitindexoptions\space\imki@jobname.idx}
\global\imki@splitdonetrue
\fi
\else
\ifimki@splitdone\else
\imki@splitindexmessage\global\imki@splitdonetrue
\fi\fi
\if@tempswa
\imki@exec{\imki@program\imki@options\imki@jobname-#1.idx}
\fi
%%%%%%%%%% 修改部分开始 %%%%%%%%%%
\ifKV@imki@intoc
\if@appendix
\def\imki@maybeaddtotoc{\@nameuse{phantomsection}
\addcontentsline{toc}{\imki@envtoclevel}{\imki@title}}
\else
\def\imki@maybeaddtotoc{\@nameuse{phantomsection}
\addcontentsline{toc}{\imki@toclevel}{\imki@title}}
\fi
\else
\def\imki@maybeaddtotoc{}
\fi
%%%%%%%%%% 修改部分结束 %%%%%%%%%%
\ifx\imki@title\imki@check@indexname\else
\def\indexname{\imki@title}
\fi
\@input@{\imki@jobname-#1.ind}
\let\indexname\imki@indexname}

\makeatother

%%定义中文索引命令，#2是中文，#3是全拼（首字母）%%
\NewDocumentCommand{\zhindex}{omm}{\IfValueTF{#1}{\index[#1]{#3@#2}}{\index{#3@#2}}}

%%%%%%%%%%%%%%%%%%%% 术语表宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{nomencl}%引入术语表
%%生成主要符号表的方法：主文件先用XeLaTeX编译一次，然后建立一个.bat文件，内容为：makeindex <filename>.nlo -s nomencl.ist -o <filename>.nls -t <filename>.nlg，运行，再用XeLaTeX编译主文件两次即可生成%%
\renewcommand{\nomname}{主要符号表}%更改符号表标题

\makeatletter
%%以下命令会令nomencl宏包选项失效，符号表的具体设置需要在主文件中进行%%
%%设置符号表输出命令键%%
\newif\if@nomencl@columnseprule
\define@key{nomen}{columns}{\def\@nomencl@columns{#1}}
\define@key{nomen}{columnsep}{\def\@nomencl@columnsep{#1}}
%%添加新关键字level%%
\def\@nomencl@level{\@ifundefined{chapter}{\section}{\chapter}*}
\define@key{nomen}{level}{\def\@nomencl@level{#1}}
%%添加新关键字envlevel%%
\def\@nomencl@envlevel{\@ifundefined{chapter}{\section}{\chapter}*}
\define@key{nomen}{envlevel}{\def\@nomencl@envlevel{#1}}
%%添加新关键字toclevel%%
\def\@nomencl@toclevel{\@ifundefined{chapter}{section}{chapter}}
\define@key{nomen}{toclevel}{\def\@nomencl@toclevel{#1}}
%%添加新关键字envtoclevel%%
\def\@nomencl@envtoclevel{\@ifundefined{chapter}{section}{chapter}}
\define@key{nomen}{envtoclevel}{\def\@nomencl@envtoclevel{#1}}
%%定义产生一对布尔键的命令%%
\newcommand{\@nomen@define@pairboolkeys}[4]{
\define@boolkey{nomen}{#1}[true]{#2}
\define@boolkey{nomen}{#3}[true]{#4}}
%%
\@nomen@define@pairboolkeys{columnseprule}{\@nomencl@columnsepruletrue}{nocolumnseprule}{\@nomencl@columnseprulefalse}
\@nomen@define@pairboolkeys{intoc}{\@intoctrue}{notintoc}{\@intocfalse}
\@nomen@define@pairboolkeys{tocbasic}{\@nomencl@tocbasictrue}{notocbasic}{\@nomencl@tocbasicfalse}
%%设置默认键值%%
\setkeys{nomen}{level=\chapter*,envlevel=\chapter,toclevel=chapter,envtoclevel=chapter,
columns=2,columnsep=2.0em,notintoc,notocbasic,nocolumnseprule}
%%定义符号表设置命令%%
\newcommand{\nomensetup}[1]{\setkeys{nomen}{#1}}
%%修改符号表环境%%
\renewcommand{\thenomenclature}{
%%%%%%%%%% 修改部分开始 %%%%%%%%%%
\clearpage
\providecommand*{\listofnlsname}{\nomname}
\if@nomencl@tocbasic
\let\list@fname\listofnlsname
\def\@currext{nls}
\tocbasic@listhead{\list@fname}
\else
\if@appendix%判断索引所在环境
\@nomencl@envlevel{\nomname}
\if@intoc%判断是否存在intoc参数
\phantomsection
\addcontentsline{toc}{\@nomencl@envtoclevel}{\nomname}
\fi
\else
\@nomencl@level{\nomname}
\if@intoc%判断是否存在intoc参数
\phantomsection
\addcontentsline{toc}{\@nomencl@toclevel}{\nomname}
\fi\fi
\fi
\nompreamble
\ifnum\@nomencl@columns>\@ne%多列符号表设置
\begin{multicols}{\@nomencl@columns}
\columnsep\@nomencl@columnsep
\columnseprule
\if@nomencl@columnseprule0.4\p@\else\z@\fi
\fi
%%%%%%%%%% 修改部分结束 %%%%%%%%%%
\if@nomentbl
\let\itemOrig=\item
\def\item{\gdef\item{\\}}
\expandafter\longtable\expandafter{\@nomtableformat}
\else
\list{}{
\labelwidth\nom@tempdim
\leftmargin\labelwidth
\advance\leftmargin\labelsep
\itemsep\nomitemsep
\let\makelabel\nomlabel}
\fi}
%%
\def\endthenomenclature{
\if@nomentbl
\item\endlongtable
\global\let\item=\itemOrig
\else
\endlist
\fi
%%%%%%%%%% 修改部分开始 %%%%%%%%%%
\nompostamble
\ifnum\@nomencl@columns>\@ne
\end{multicols}
\fi
%%%%%%%%%% 修改部分结束 %%%%%%%%%%
}
\makeatother

%%%%%%%%%%%%%%%%%%%% 数学符号宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amssymb,mathrsfs,mathpazo,array,bm,upgreek}%数学宏包

%%%%%%%%%%%%%%%%%%%% 盒子和列表宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[most]{tcolorbox}%彩色盒子
\tcbuselibrary{xparse}
\tcbuselibrary{minted}
\RequirePackage{empheq}%数学公式盒子
\RequirePackage{adjustbox}%根据内容多少自动调整字体大小的盒子
\RequirePackage{varwidth}%固定可变长度盒子
\RequirePackage{enumitem,hlist}%控制列表环境格式%对齐列表环境
%%设置列表参数%%
\setlength{\itemsep}{0pt}
\setlength{\parsep}{0pt}
\setlength{\parskip}{0pt}
\RequirePackage{listings,minted}%伪代码环境
\usemintedstyle{xcode}
%为了使宏包minted正常工作，需要在xelatex编译器参数中添加-shell-escape
\RequirePackage{lineno}%行号宏包
\renewcommand{\linenumberfont}{\FontSize{11.5pt}\numberfont\color{ColorA}}%修改行号字体
\setlength{\linenumbersep}{5.5mm}%修改行号与正文的间距

%%%%%%%%%%%%%%%%%%%% 绘图与表格宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{pifont,fontawesome5}%图标
\RequirePackage{anyfontsize}%自由调整字体大小
\RequirePackage{tabularx,colortbl,array,tabularray,booktabs,multirow}%表格
\RequirePackage{pgfplots,tikzpagenodes,tikz,eso-pic}%绘图
\usetikzlibrary{calc,scopes,backgrounds,positioning,intersections,decorations,shadows,
shadings,fadings,arrows,arrows.meta,patterns.meta,patterns,shapes.geometric,decorations.footprints}
\RequirePackage{calc}%优化长度计算和设置
%%修改addtolength的作用域%%
\makeatletter
\newcommand{\gaddtolength}[1]{\calc@assign@skip{\global\advance#1}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 超链接宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{url}%超链接
\RequirePackage{xr}%文件之间的交叉引用
\RequirePackage[hidelinks,pagebackref]{hyperref}%超链接设置
\RequirePackage{cleveref}%带前缀名称引用，必须放在hyperref之后

%%%%%%%%%%%%%%%%%%%% 计数器宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{zhnumber,totcount}%中文计数器%获取计数器的最大值
%%定义计数器%%
\setcounter{tocdepth}{1}
\makeatletter
\newcounter{@pagesidenumber}%记录侧标数
\regtotcounter{@pagesidenumber}%获取侧标数最大值，需要编译两次才能正确获取
\newcounter{@currenttotalpart}%记录所有部分的总数
\newcounter{@egnum}[chapter]
\newcounter{@varnum}[chapter]
\newcounter{@classic}[section]
\newcounter{@def}[section]
\newcounter{@thm}[section]
\newcounter{@axm}[section]
\newcounter{@lem}[section]
\newcounter{@colry}[section]
\newcounter{@prop}[section]
\makeatother
\renewcommand{\thesubfigure}{\alpha{subfigure}}
\renewcommand{\thepart}{\arabic{part}}
\renewcommand{\thesection}{\arabic{section}}

%%%%%%%%%%%%%%%%%%%% 列表环境 %%%%%%%%%%%%%%%%%%%%%%
%%设置题号%%
\newcommand*\cir[1]{\tikz[baseline=($0.3*(current bounding box.west)+0.7*(current bounding box.south west)$)]{
\node[shape=circle,fill=ListColor,draw=ListColor,minimum size=5.0mm,align=center,inner sep=0pt,font=\FontSize{11pt}\bfseries,text=white]{\maxsizebox{4.5mm}{!}{#1}};}}
%%设置概念序号%%
\newcommand*\preconcept{\raisebox{-0.05em}{\tikz{\draw[ListColor,fill=white,line width=2.5pt](0,0)circle(1.5mm);}}}
%%概念列表环境%%
\newenvironment{Concept}{\begin{multicols}{2}\itshape\begin{itemize}[label=\protect\preconcept,itemindent=-0.5em]}{\end{itemize}\end{multicols}\global\colorlet{ListColor}{ColorA}}
%%题目列表环境%%
\newenvironment{QsNum}{\begin{enumerate}[label=\protect\cir{\arabic*},itemindent=-0.5em]}
{\end{enumerate}\global\colorlet{ListColor}{ColorA}}

%%设置星级%%
\NewDocumentCommand{\score}{mm O{ColorB}}{
\begin{tikzpicture}[baseline]
\foreach \i in {1,...,#1}{
\pgfmathparse{\i<=#2 ? "#3" : "white"}
\edef\circlecolor{\pgfmathresult}
\draw(\i*1.25em,0)node[name=circle\i,circle,inner sep=0mm,minimum size=0.35cm,draw=#3,very thick,fill=\circlecolor]{};}
\end{tikzpicture}}

%%选择题的4个选项，根据选项内容长度自动排版%%
\colorlet{ListColor}{ColorA}
\newlength{\la}\newlength{\lb}\newlength{\lc}\newlength{\ld}
\newlength{\lhalf}\newlength{\lquarter}\newlength{\lmax}
\newcommand{\choice}[4]{
\settowidth{\la}{A.~#1~~~}\settowidth{\lb}{B.~#2~~~}
\settowidth{\lc}{C.~#3~~~}\settowidth{\ld}{D.~#4~~~}
\ifthenelse{\lengthtest{\la>\lb}}
{\setlength{\lmax}{\la}}{\setlength{\lmax}{\lb}}
\ifthenelse{\lengthtest{\lmax<\lc}}
{\setlength{\lmax}{\lc}}{\relax}
\ifthenelse{\lengthtest{\lmax<\ld}}
{\setlength{\lmax}{\ld}}{\relax}
\setlength{\lhalf}{0.5\linewidth}
\setlength{\lquarter}{0.25\linewidth}
\ifthenelse{\lengthtest{\lmax>\lhalf}}
{\begin{hlist}[pre skip=0pt,item skip=0pt,item offset={1.5em},label={\textbf{\color{ListColor}{\FontSize{13pt}{\Alpha{hlisti}.}}}},pre label={}]1
\hitem #1
\hitem #2
\hitem #3
\hitem #4
\end{hlist}}
{\ifthenelse{\lengthtest{\lmax>\lquarter}}
{\begin{hlist}[pre skip=0pt,item skip=0pt,item offset={1.5em},label={\textbf{\color{ListColor}{\FontSize{13pt}{\Alpha{hlisti}.}}}},pre label={}]2
\hitem #1
\hitem #2
\hitem #3
\hitem #4
\end{hlist}}
{\begin{hlist}[\parskip=0pt,pre skip=0pt,item skip=0pt,item offset={1.5em}, label={\textbf{\color{ListColor}{\FontSize{13pt}{\Alpha{hlisti}.}}}},pre label={}]4
\hitem #1
\hitem #2
\hitem #3
\hitem #4
\end{hlist}}
}}

%%%%%%%%%%%%%%%%%% 页面样式 %%%%%%%%%%%%%%%%%%%%%%%%
%%定义部分总数（序言、前言视作一个部分，目录、插图目录、表格目录视作一个部分，绪论、有编号部分、无编号部分以及后记）,编译两次可以得到正确的页面框架%%
%%设置新长度%%
\newlength{\DeltaH}%第一个侧标与最后一个侧标的中心点到页面最上端和最下端的垂直距离
\newlength{\SepH}%相邻两个侧标中心点之间的距离
\newlength{\MarkY}%侧标中心点距页面最上端的垂直距离
\setlength{\DeltaH}{6.0cm}
\AtBeginDocument{
\makeatletter
\ifthenelse{\totvalue{@pagesidenumber}=0\or\totvalue{@pagesidenumber}=1}
{\setlength{\SepH}{0cm}
\setlength{\MarkY}{-\paperheight/2}}
{\setlength{\SepH}{\dimexpr(\paperheight-2\DeltaH)/\totvalue{@pagesidenumber}\relax}%设置侧标每次移动的距离
\setlength{\MarkY}{-\DeltaH}%设置侧标上下两侧锚点坐标的初值
\makeatother}}
%%绘制页面框架%%
\makeatletter
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{\markboth{第~\thechapter~章\quad#1}{第~\thechapter~章\quad#1}}
\renewcommand{\sectionmark}[1]{\markright{第~\thesection~节\quad#1}}
\extramarks{\protect\@title}{\protect\@title}
\newcommand{\@pageframe}{
\makebox[0pt][l]{
\begin{tikzpicture}[remember picture,overlay]
%%根据页数的奇偶生成%%
\ifodd\value{page}
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=0.75cm]current page.south west);
\coordinate(F)at([xshift=-0.75cm,yshift=0.75cm]current page.south east);
\coordinate(G)at([xshift=-0.75cm,yshift=-0.75cm]current page.north east);
\coordinate(H)at([yshift=-0.75cm]current page.north west);
%%绘制页面框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,line width=0.1pt,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)--cycle;
\draw[ColorA,fill=ColorA,line width=1.0pt]
([xshift=-\@outerlen+0.25cm]B)[rounded corners=1.0mm]--
([xshift=-\@outerlen+0.25cm,yshift=-1.35cm]B)[rounded corners=1.0mm]--
([xshift=-0.75cm,yshift=-1.35cm]B)[sharp corners]--
([xshift=-0.75cm]B)--
cycle;
\node[font=\numberfont\FontSize{14pt},text=white,anchor=south,align=center](P)at([xshift=-\@outerlen/2-0.25cm,yshift=-1.3cm]B){\maxsizebox{\@outerlen-1.1cm}{!}{\thepage}};
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.north west)--(T.north east)--(T.south east)[rounded corners]--(T.south west)[rounded corners]--cycle},font=\FontSize{13pt}\bfseries,text=white,text width=6.5mm,align=center,inner xsep=1.5mm,inner ysep=3.5mm,anchor=east](T)at([yshift=\MarkY]B){\rotatebox[origin=c]{90}{\maxsizebox{\SepH+\DeltaH-2.5cm}{!}{\lastxmark}}};
\else
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=0.75cm]current page.south east);
\coordinate(F)at([xshift=0.75cm,yshift=0.75cm]current page.south west);
\coordinate(G)at([xshift=0.75cm,yshift=-0.75cm]current page.north west);
\coordinate(H)at([yshift=-0.75cm]current page.north east);
%%绘制页面框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,line width=0.1pt,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)--cycle;
\draw[ColorA,fill=ColorA,line width=1.0pt]
([xshift=\@outerlen-0.25cm]B)[rounded corners=1.0mm]--
([xshift=\@outerlen-0.25cm,yshift=-1.35cm]B)[rounded corners=1.0mm]--
([xshift=0.75cm,yshift=-1.35cm]B)[sharp corners]--
([xshift=0.75cm]B)--
cycle;
\node[font=\numberfont\FontSize{14},text=white,anchor=south,align=center](P)at([xshift=\@outerlen/2+0.25cm,yshift=-1.3cm]B){\maxsizebox{\@outerlen-1.1cm}{!}{\thepage}};
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.north west)[rounded corners]--(T.north east)[rounded corners]--(T.south east)[sharp corners]--(T.south west)--cycle},font=\FontSize{13pt}\bfseries,text=white,text width=6.5mm,align=center,inner xsep=1.5mm,inner ysep=3.5mm,anchor=west](T)at([yshift=\MarkY]B){\rotatebox[origin=c]{270}{\maxsizebox{\SepH+\DeltaH-2.5cm}{!}{\firstxmark}}};
\fi
\end{tikzpicture}}}

%%定义主页面样式%%
\fancypagestyle{MainPage}{
\fancyhead{}
\fancyfoot{}
\fancyfoot[C]{\@pageframe}
\fancyhead[RO]{\textbf{\color{ColorA}{\FontSize{12.5pt}{\rightmark}}}}
\fancyhead[LE]{\textbf{\color{ColorA}{\FontSize{12.5pt}{\leftmark}}}}
}
\makeatother

%%%%%%%%%%%%%%%%%%%% 书籍层次样式 %%%%%%%%%%%%%%%%%%%%%%
%%部分页样式%%
%%编号部分页样式%%
\makeatletter
\newcommand*{\partintro}[1]{\def\@partintro{\hspace*{2.0em}#1}}
\newcommand{\@partstyle}[2]{
\makebox[0pt][l]{
\begin{tikzpicture}[remember picture,overlay]
\draw[ColorB!7.5,fill=ColorB!7.5](current page.north west)rectangle(current page.south east);
\ifodd\value{page}%判断奇偶页
%%坐标%%
\coordinate(A)at(current page.north east);
\coordinate(B)at([xshift=-2.1cm]current page.north east);
\coordinate(C)at([xshift=-2.1cm,yshift=6.1cm]current page.east);
\coordinate(D)at([yshift=6.1cm]current page.west);
\coordinate(E)at([yshift=4.0cm]current page.west);
\coordinate(F)at([xshift=-2.1cm,yshift=4.0cm]current page.east);
\coordinate(G)at([xshift=-2.1cm]current page.south east);
\coordinate(H)at(current page.south east);
%%背景%%
\draw[white,fill=white](A)--(B)[rounded corners=5.0mm]--(C)[sharp corners]--(D)--(E)[rounded corners=5.0mm]--(F)[sharp corners]--(G)--(H)--cycle;
\draw[ColorA,fill=ColorA](A)--([xshift=0.35cm]B)[rounded corners=2.5mm]--([xshift=0.35cm]C)[sharp corners]--([xshift=2.1cm]C)--cycle;
\draw[ColorA,fill=ColorA](H)--([xshift=0.35cm]G)[rounded corners=2.5mm]--([xshift=0.35cm]F)[sharp corners]--([xshift=2.1cm]F)--cycle;
\draw[ColorB!20,fill=ColorB!20]([yshift=-0.35cm]D)--([yshift=0.35cm]E)[rounded corners=2.5mm]--([xshift=\paperwidth/2+1.45cm,yshift=0.35cm]E)--([xshift=\paperwidth/2+1.45cm,yshift=-0.35cm]D)[sharp corners]--cycle;
\draw[ColorB!20,fill=ColorB!20]([xshift=2.1cm,yshift=-0.35cm]C)--([xshift=2.1cm,yshift=0.35cm]F)[rounded corners=2.5mm]--([xshift=-1.0cm,yshift=0.35cm]F)--([xshift=-1.0cm,yshift=-0.35cm]C)[sharp corners]--cycle;
\draw[ColorB!50,fill=ColorB!50,rounded corners=2.5mm]([xshift=\paperwidth/2+1.8cm,yshift=0.35cm]E)rectangle([xshift=-1.35cm,yshift=-0.35cm]C);
%%编号%%
\node[align=left,anchor=south east,font=\bfseries\FontSize{37.5pt},text=ColorA,minimum height=2.0cm](T)at([xshift=-1.4cm,yshift=0.25cm]C){\maxsizebox{\textwidth-2.45cm}{!}{#1}};
%%标题%%
\node[align=left,anchor=north east,font=\bfseries\FontSize{37.5pt},text=ColorA,minimum height=2.0cm](P)at([yshift=-2.6cm]T.south east){\maxsizebox{\textwidth-2.45cm}{!}{#2}};
%%介绍%%
\node[align=right,inner xsep=3.0mm,anchor=north east,font=\FontSize{12pt}\itshape,text=ColorA](W)at([yshift=-0.75cm]P.south east){\begin{varwidth}{\textwidth-2.75cm}\ifdefvoid{\@partintro}{}{\@partintro}\end{varwidth}};
%%小目录%%
\node[anchor=south west](C)at([xshift=\@innerlen+0.25in,yshift=\@botlen]current page.south west){\begin{varwidth}{\textwidth}\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}\end{varwidth}};
\node[font=\FontSize{13pt}\bfseries,text=ColorB!95!black,anchor=south west](R)at(C.north west){部分概要};
\else
%%坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at([xshift=2.1cm]current page.north west);
\coordinate(C)at([xshift=2.1cm,yshift=6.1cm]current page.west);
\coordinate(D)at([yshift=6.1cm]current page.east);
\coordinate(E)at([yshift=4.0cm]current page.east);
\coordinate(F)at([xshift=2.1cm,yshift=4.0cm]current page.west);
\coordinate(G)at([xshift=2.1cm]current page.south west);
\coordinate(H)at(current page.south west);
%%背景%%
\draw[white,fill=white](A)--(B)[rounded corners=5.0mm]--(C)[sharp corners]--(D)--(E)[rounded corners=5.0mm]--(F)[sharp corners]--(G)--(H)--cycle;
\draw[ColorA,fill=ColorA](A)--([xshift=-0.35cm]B)[rounded corners=2.5mm]--([xshift=-0.35cm]C)[sharp corners]--([xshift=-2.1cm]C)--cycle;
\draw[ColorA,fill=ColorA](H)--([xshift=-0.35cm]G)[rounded corners=2.5mm]--([xshift=-0.35cm]F)[sharp corners]--([xshift=-2.1cm]F)--cycle;
\draw[ColorB!20,fill=ColorB!20]([yshift=-0.35cm]D)--([yshift=0.35cm]E)[rounded corners=2.5mm]--([xshift=-\paperwidth/2-1.45cm,yshift=0.35cm]E)--([xshift=-\paperwidth/2-1.45cm,yshift=-0.35cm]D)[sharp corners]--cycle;
\draw[ColorB!20,fill=ColorB!20]([xshift=-2.1cm,yshift=-0.35cm]C)--([xshift=-2.1cm,yshift=0.35cm]F)[rounded corners=2.5mm]--([xshift=1.0cm,yshift=0.35cm]F)--([xshift=1.0cm,yshift=-0.35cm]C)[sharp corners]--cycle;
\draw[ColorB!50,fill=ColorB!50,rounded corners=2.5mm]([xshift=-\paperwidth/2-1.8cm,yshift=0.35cm]E)rectangle([xshift=1.35cm,yshift=-0.35cm]C);
%%编号%%
\node[align=left,anchor=south west,font=\bfseries\FontSize{37.5pt},text=ColorA,minimum height=2.0cm](T)at([xshift=1.4cm,yshift=0.25cm]C){\maxsizebox{\textwidth-2.45cm}{!}{#1}};
%%标题%%
\node[align=left,anchor=north west,font=\bfseries\FontSize{37.5pt},text=ColorA,minimum height=2.0cm](P)at([yshift=-2.6cm]T.south west){\maxsizebox{\textwidth-2.45cm}{!}{#2}};
%%介绍%%
\node[align=left,inner xsep=3.0mm,anchor=north west,font=\FontSize{12pt}\itshape,text=ColorA](W)at([yshift=-0.75cm]P.south west){\begin{varwidth}{\textwidth-2.75cm}\ifdefvoid{\@partintro}{}{\@partintro}\end{varwidth}};
%%小目录%%
\node[anchor=south east](C)at([xshift=-\@innerlen-0.25in,yshift=\@botlen]current page.south east){\begin{varwidth}{\textwidth}\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}\end{varwidth}};
\node[font=\FontSize{13pt}\bfseries,text=ColorB!95!black,anchor=south west](R)at(C.north west){部分概要};
\fi
\end{tikzpicture}}}

%%定义小半圆%%
\newcommand{\halfcircle}[2]{
\tikz{\draw[#1,fill=#1,sharp corners](0,0)arc(90:-90:#2)--cycle;}}
%%定义标题文字长度%%
\newlength{\partstarlen}
%%设置背景绘制临界长度%%
\newlength{\criticstarlen}
\setlength{\criticstarlen}{\textwidth-5.0cm}
%%不编号部分页样式%%
\newcommand{\@partstarstyle}[1]{
\settowidth{\partstarlen}{\bfseries{\FontSize{40pt}{#1}}}
\makebox[0pt][l]{
\begin{tikzpicture}[remember picture,overlay]
\draw[ColorB!7.5,fill=ColorB!7.5](current page.north west)rectangle(current page.south east);
\ifodd\value{page}%判断奇偶页
%%坐标%%
\coordinate(A)at(current page.north east);
\coordinate(B)at([xshift=-2.1cm]current page.north east);
\coordinate(C)at([xshift=-2.1cm,yshift=6.1cm]current page.east);
\coordinate(D)at([yshift=6.1cm]current page.west);
\coordinate(E)at([yshift=4.0cm]current page.west);
\coordinate(F)at([xshift=-2.1cm,yshift=4.0cm]current page.east);
\coordinate(G)at([xshift=-2.1cm]current page.south east);
\coordinate(H)at(current page.south east);
%%背景%%
\draw[white,fill=white](A)--(B)[rounded corners=5.0mm]--(C)[sharp corners]--(D)--(E)[rounded corners=5.0mm]--(F)[sharp corners]--(G)--(H)--cycle;
\draw[ColorA,fill=ColorA](A)--([xshift=0.35cm]B)[rounded corners=2.5mm]--([xshift=0.35cm]C)[sharp corners]--([xshift=2.1cm]C)--cycle;
\draw[ColorA,fill=ColorA](H)--([xshift=0.35cm]G)[rounded corners=2.5mm]--([xshift=0.35cm]F)[sharp corners]--([xshift=2.1cm]F)--cycle;
\draw[ColorB!50,fill=ColorB!50]([xshift=2.1cm,yshift=-0.35cm]C)--([xshift=2.1cm,yshift=0.35cm]F)[rounded corners=2.5mm]--([xshift=-1.0cm,yshift=0.35cm]F)--([xshift=-1.0cm,yshift=-0.35cm]C)[sharp corners]--cycle;
%判断标题文字长度与临界长度的关系
\ifdim\partstarlen>\criticstarlen
%如果标题长度大于临界长度则绘制固定长度矩形
\draw[ColorB!30,fill=ColorB!30,rounded corners=2.5mm]
([xshift=-\criticstarlen-4.15cm,yshift=0.35cm]F)rectangle
([xshift=-1.35cm,yshift=-0.35cm]C);
\draw[ColorB!20,fill=ColorB!20]([yshift=-0.35cm]D)--([yshift=0.35cm]E)[rounded corners=2.5mm]--([xshift=-\criticstarlen-4.5cm,yshift=0.35cm]F)--([xshift=-\criticstarlen-4.5cm,yshift=1.75cm]F)[sharp corners]--cycle;
%如果标题长度小于临界长度则绘制变长度矩形
\else
\draw[ColorB!30,fill=ColorB!30,rounded corners=2.5mm]
([xshift=-\partstarlen-4.15cm,yshift=0.35cm]F)rectangle
([xshift=-1.35cm,yshift=-0.35cm]C);
\draw[ColorB!20,fill=ColorB!20]([yshift=-0.35cm]D)--([yshift=0.35cm]E)[rounded corners=2.5mm]--([xshift=-\partstarlen-4.5cm,yshift=0.35cm]F)--([xshift=-\partstarlen-4.5cm,yshift=1.75cm]F)[sharp corners]--cycle;
\fi
%%标题%%
\node[align=left,inner xsep=0mm,minimum height=2.0cm,anchor=south east,
font=\bfseries\FontSize{40pt},text=ColorA](P)at([xshift=-1.4cm,yshift=0.25cm]C){\maxsizebox{\textwidth-5.0cm}{!}{#1}};
\node[inner xsep=0mm,minimum height=2.0cm,anchor=east](S)at([xshift=-0.5cm]P.west){\halfcircle{ColorA!60}{0.7cm}};
\node[inner xsep=0mm,minimum height=2.0cm,anchor=east](Q)at(S.west){\halfcircle{ColorA!80}{0.7cm}};
\node[inner xsep=0mm,minimum height=2.0cm,anchor=east](R)at(Q.west){\halfcircle{ColorA}{0.7cm}};
%%介绍%%
\node[align=right,inner xsep=2.0mm,anchor=north east,font=\FontSize{12pt}\itshape,text=ColorA](W)at([yshift=-3.5cm]P.south east){\begin{varwidth}{\textwidth-2.75cm}\ifdefvoid{\@partintro}{}{\@partintro}\end{varwidth}};
%%小目录%%
\node[anchor=south west](C)at([xshift=\@innerlen+0.25in,yshift=\@botlen]current page.south west){\begin{varwidth}{\textwidth}\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}\end{varwidth}};
\node[font=\FontSize{13pt}\bfseries,text=ColorB!95!black,anchor=south west](W)at(C.north west){部分概要};
\else
%%坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at([xshift=2.1cm]current page.north west);
\coordinate(C)at([xshift=2.1cm,yshift=6.1cm]current page.west);
\coordinate(D)at([yshift=6.1cm]current page.east);
\coordinate(E)at([yshift=4.0cm]current page.east);
\coordinate(F)at([xshift=2.1cm,yshift=4.0cm]current page.west);
\coordinate(G)at([xshift=2.1cm]current page.south west);
\coordinate(H)at(current page.south west);
%%背景%%
\draw[white,fill=white](A)--(B)[rounded corners=5.0mm]--(C)[sharp corners]--(D)--(E)[rounded corners=5.0mm]--(F)[sharp corners]--(G)--(H)--cycle;
\draw[ColorA,fill=ColorA](A)--([xshift=-0.35cm]B)[rounded corners=2.5mm]--([xshift=-0.35cm]C)[sharp corners]--([xshift=-2.1cm]C)--cycle;
\draw[ColorA,fill=ColorA](H)--([xshift=-0.35cm]G)[rounded corners=2.5mm]--([xshift=-0.35cm]F)[sharp corners]--([xshift=-2.1cm]F)--cycle;
\draw[ColorB!50,fill=ColorB!50]([xshift=-2.1cm,yshift=-0.35cm]C)--([xshift=-2.1cm,yshift=0.35cm]F)[rounded corners=2.5mm]--([xshift=1.0cm,yshift=0.35cm]F)--([xshift=1.0cm,yshift=-0.35cm]C)[sharp corners]--cycle;
%判断标题文字长度与临界长度的关系
\ifdim\partstarlen>\criticstarlen
%如果标题长度大于临界长度则绘制固定长度矩形
\draw[ColorB!30,fill=ColorB!30,rounded corners=2.5mm]
([xshift=\criticstarlen+4.15cm,yshift=0.35cm]F)rectangle
([xshift=1.35cm,yshift=-0.35cm]C);
\draw[ColorB!20,fill=ColorB!20]([yshift=-0.35cm]D)--([yshift=0.35cm]E)[rounded corners=2.5mm]--([xshift=\criticstarlen+4.5cm,yshift=0.35cm]F)--([xshift=\criticstarlen+4.5cm,yshift=1.75cm]F)[sharp corners]--cycle;
\else
%如果标题长度小于临界长度则绘制变长度矩形
\draw[ColorB!30,fill=ColorB!30,rounded corners=2.5mm]
([xshift=\partstarlen+4.15cm,yshift=0.35cm]F)rectangle
([xshift=1.35cm,yshift=-0.35cm]C);
\draw[ColorB!20,fill=ColorB!20]([yshift=-0.35cm]D)--([yshift=0.35cm]E)[rounded corners=2.5mm]--([xshift=\partstarlen+4.5cm,yshift=0.35cm]F)--([xshift=\partstarlen+4.5cm,yshift=1.75cm]F)[sharp corners]--cycle;
\fi
%%标题%%
\node[inner xsep=0mm,minimum height=2.0cm,anchor=south west](S)at([xshift=1.4cm,yshift=0.25cm]C){\halfcircle{ColorA}{0.7cm}};
\node[inner xsep=0mm,minimum height=2.0cm,anchor=west](Q)at(S.east){\halfcircle{ColorA!80}{0.7cm}};
\node[inner xsep=0mm,minimum height=2.0cm,anchor=west](R)at(Q.east){\halfcircle{ColorA!60}{0.7cm}};
\node[align=left,inner xsep=0mm,minimum height=2.0cm,anchor=west,
font=\bfseries\FontSize{40pt},text=ColorA](P)at([xshift=0.5cm]R.east){\maxsizebox{\textwidth-5.0cm}{!}{#1}};
%%介绍%%
\node[align=left,inner xsep=2.0mm,anchor=north west,font=\FontSize{12pt}\itshape,text=ColorA](W)at([yshift=-3.5cm]S.south west){\begin{varwidth}{\textwidth-2.75cm}\ifdefvoid{\@partintro}{}{\@partintro}\end{varwidth}};
%%小目录%%
\node[anchor=south east](C)at([xshift=-\@innerlen-0.25in,yshift=\@botlen]current page.south east){\begin{varwidth}{\textwidth}\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}\end{varwidth}};
\node[font=\FontSize{13pt}\bfseries,text=ColorB!95!black,anchor=south west](W)at(C.north west){部分概要};
\fi
\end{tikzpicture}}}
%%编号部分页%%
\titleformat{\part}
{}{}{0em}
{\stepcounter{@currenttotalpart}%部分数计数
\stepcounter{@pagesidenumber}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\extramarks{第~\thepart~部分\quad#1}{第~\thepart~部分\quad#1}%修改侧标内容
\startcontents[part]%开启小目录
\@partstyle{第~\thepart~部分}{#1}%部分样式
\thispagestyle{empty}}
[\global\partintro{}]%清空\partintro
%%不编号部分页%%
\titleformat{name=\part,numberless}
{}{}{0em}
{\stepcounter{@currenttotalpart}%部分数计数
\stepcounter{@pagesidenumber}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\extramarks{#1}{#1}%修改侧标内容
\startcontents[part]%开启小目录
\@partstarstyle{#1}%部分样式
\thispagestyle{empty}}
[\global\partintro{}]%清空\partintro
%%间距设置%%
\titlespacing*{\part}{0pt}{0pt}{0pt}

%%章节页样式%%
\newcommand*\chaptersaying[1]{\def\@chaptersaying{\hspace*{2.0em}#1}}
\newcommand*\chaptersubtitle[1]{\def\@chaptersubtitle{#1}}
\newcommand*\chapterimage[1]{\def\@chapterimage{#1}}
%%编号章节页样式%%
\newcommand{\@chapterstyle}[2]{
\makebox[0pt][l]{
\begin{tikzpicture}[remember picture,overlay]
\ifodd\value{page}%判断奇偶页
%%坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=2.0cm]current page.south west);
\coordinate(F)at([xshift=-5.0cm,yshift=2.0cm]current page.south east);
\coordinate(G)at([xshift=-3.0cm,yshift=1.0cm]current page.south east);
\coordinate(H)at([xshift=-1.0cm,yshift=1.0cm]current page.south east);
\coordinate(I)at([xshift=-1.0cm,yshift=-5.022cm]current page.north east);
\coordinate(J)at([yshift=-5.022cm]current page.north west);
%%框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,line width=0.1pt,sharp corners]
(A)--(B)--(C)--(D)--(E)--(F)[in=180,out=0]to(G)[rounded corners=2.5mm]--(H)[rounded corners=5.0mm]--(I)[sharp corners]--(J)--cycle;
%%编号%%
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=0.65cm]T.north east)--([yshift=0.65cm]T.north west)[rounded corners=2.5mm]--cycle},anchor=north east,font=\bfseries\FontSize{25pt},text=white,inner sep=0.4cm](T)at([xshift=-\@outerlen-0.25in,yshift=-0.65cm]B){#1};
%%渐变带%%
\draw[ColorB!40,fill=ColorB!40,line width=0pt]
([yshift=-2.79cm]A)rectangle([yshift=-3.09cm]B);
%%标题%%
\node[anchor=east,font=\bfseries\FontSize{27.5pt},text=ColorA](P)at([xshift=-\@outerlen-0.25in+0.25cm,yshift=-3.95cm]B){\maxsizebox{\textwidth-0.5in}{!}{#2}};
%%副标题%%
\node[anchor=west,font=\itshape\fontsize{12}{0.75\baselineskip}\selectfont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm](S)at([xshift=\@innerlen,yshift=1.0cm]D){\ifdefvoid{\@chaptersaying}{}{\@chaptersaying}};
%%章节图片%%
\node[anchor=north west,inner sep=0mm](I)at(A){\ifdefvoid{\@chapterimage}{}{\includegraphics[height=5.022cm]{\@chapterimage}}};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=1.5mm]
([xshift=-1.6cm,yshift=1.6cm]current page.south east)rectangle([xshift=-0.6cm,yshift=0.6cm]C);
\node[font=\numberfont\FontSize{14pt},text=white,anchor=center,align=center](P)at([xshift=-1.1cm,yshift=1.0cm]C){\maxsizebox{0.9cm}{!}{\thepage}};
\else
%%坐标%%
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=2.0cm]current page.south east);
\coordinate(F)at([xshift=5.0cm,yshift=2.0cm]current page.south west);
\coordinate(G)at([xshift=3.0cm,yshift=1.0cm]current page.south west);
\coordinate(H)at([xshift=1.0cm,yshift=1.0cm]current page.south west);
\coordinate(I)at([xshift=1.0cm,yshift=-5.022cm]current page.north west);
\coordinate(J)at([yshift=-5.022cm]current page.north east);
%%框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,line width=0.1pt,sharp corners]
(A)--(B)--(C)--(D)--(E)--(F)[in=0,out=180]to(G)[rounded corners=2.5mm]--(H)[rounded corners=5.0mm]--(I)[sharp corners]--(J)--cycle;
%%编号%%
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=0.65cm]T.north east)--([yshift=0.65cm]T.north west)[rounded corners=2.5mm]--cycle},anchor=north west,font=\bfseries\FontSize{25pt},text=white,inner sep=0.4cm](T)at([xshift=\@outerlen+0.25in,yshift=-0.65cm]B){#1};
%%渐变带%%
\draw[ColorB!40,fill=ColorB!40,line width=0pt]
([yshift=-2.79cm]A)rectangle([yshift=-3.09cm]B);
%%标题%%
\node[anchor=west,font=\bfseries\FontSize{27.5pt},text=ColorA](P)at([xshift=\@outerlen+0.25in-0.25cm,yshift=-3.95cm]B){\maxsizebox{\textwidth-0.5in}{!}{#2}};
%%副标题%%
\node[anchor=west,font=\itshape\fontsize{12}{0.75\baselineskip}\selectfont,text=ColorA,text width=\paperwidth-\@innerlen-4.0cm](S)at([xshift=4.0cm,yshift=1.0cm]C){\ifdefvoid{\@chaptersaying}{}{\@chaptersaying}};
%%章节图片%%
\node[anchor=north east,inner sep=0mm](I)at(A){\ifdefvoid{\@chapterimage}{}{\includegraphics[height=5.022cm]{\@chapterimage}}};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=1.5mm]
([xshift=1.6cm,yshift=1.6cm]current page.south west)rectangle([xshift=0.6cm,yshift=0.6cm]C);
\node[font=\numberfont\FontSize{14pt},text=white,anchor=center,align=center](P)at([xshift=1.1cm,yshift=1.0cm]C){\maxsizebox{0.9cm}{!}{\thepage}};
\fi
\end{tikzpicture}}}

%%不编号章节样式%%
\newcommand{\@chapterstarstyle}[2]{
\makebox[0pt][l]{
\begin{tikzpicture}[remember picture,overlay]
\ifodd\value{page}%判断奇偶页
%%坐标点%%
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=1.0cm]current page.south west);
\coordinate(F)at([xshift=-1.0cm,yshift=1.0cm]current page.south east);
\coordinate(G)at([xshift=-1.0cm,yshift=-5.022cm]current page.north east);
\coordinate(H)at([yshift=-5.022cm]current page.north west);
%%框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,line width=0.1pt,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)--cycle;
%%标题%%
\node[inner sep=0mm,anchor=west](T)at([xshift=\@innerlen+0.25in,yshift=-1.79cm]current page.north west){\halfcircle{ColorA}{0.5cm}};
\node[inner sep=0mm,anchor=west](P)at(T.east){\halfcircle{ColorA!90}{0.5cm}};
\node[anchor=west,font=\bfseries\FontSize{30pt},text=ColorA,minimum height=1.45cm](Q)at([xshift=0.25cm]P.east){\maxsizebox{\textwidth-0.5in-1.5cm}{!}{#1}};
%%渐变带%%
\draw[ColorB!40,fill=ColorB!40,line width=0pt]
([yshift=-2.79cm]current page.north west)rectangle([yshift=-3.09cm]current page.north east);
%%副标题%%
\node[anchor=east,font=\bfseries\FontSize{27.5pt},text=ColorA,minimum height=1.45cm](R)at([xshift=-\@outerlen-0.25in,yshift=-4.0cm]current page.north east){\maxsizebox{\textwidth-0.5in-1.5cm}{!}{#2}};
%%章节图片%%
\node[anchor=north east,inner sep=0mm](I)at(current page.north east){\ifdefvoid{\@chapterimage}{}{\includegraphics[height=5.022cm]{\@chapterimage}}};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=1.5mm]
([xshift=-1.6cm,yshift=1.6cm]current page.south east)rectangle([xshift=-0.6cm,yshift=0.6cm]current page.south east);
\node[font=\numberfont\FontSize{14pt},text=white,anchor=center,align=center](P)at([xshift=-1.1cm,yshift=1.0cm]current page.south east){\maxsizebox{0.9cm}{!}{\thepage}};
\else
%%坐标点%%
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=1.0cm]current page.south east);
\coordinate(F)at([xshift=1.0cm,yshift=1.0cm]current page.south west);
\coordinate(G)at([xshift=1.0cm,yshift=-5.022cm]current page.north west);
\coordinate(H)at([yshift=-5.022cm]current page.north east);
%%框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,line width=0.1pt,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)--cycle;
%%标题%%
\node[anchor=east,font=\bfseries\FontSize{30pt},text=ColorA,minimum height=1.45cm](T)at([xshift=-\@innerlen-0.25in,yshift=-1.79cm]current page.north east){\maxsizebox{\textwidth-0.5in-1.5cm}{!}{#1}};
\node[inner sep=0mm,anchor=east](P)at([xshift=-0.25cm]T.west){\halfcircle{ColorA!90}{0.5cm}};
\node[inner sep=0mm,anchor=east](Q)at(P.west){\halfcircle{ColorA}{0.5cm}};
%%渐变带%%
\draw[ColorB!40,fill=ColorB!40,line width=0pt]
([yshift=-2.79cm]current page.north east)rectangle([yshift=-3.09cm]current page.north west);
%%副标题%%
\node[anchor=west,font=\bfseries\FontSize{27.5pt},text=ColorA,minimum height=1.45cm](R)at([xshift=\@outerlen+0.25in,yshift=-4.0cm]current page.north west){\maxsizebox{\textwidth-0.5in-1.5cm}{!}{#2}};
%%章节图片%%
\node[anchor=north west,inner sep=0mm](I)at(current page.north west){\ifdefvoid{\@chapterimage}{}{\includegraphics[height=5.022cm]{\@chapterimage}}};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=1.5mm]
([xshift=1.6cm,yshift=1.6cm]current page.south west)rectangle([xshift=0.6cm,yshift=0.6cm]current page.south west);
\node[font=\numberfont\FontSize{14pt},text=white,anchor=center,align=center](P)at([xshift=1.1cm,yshift=1.0cm]current page.south west){\maxsizebox{0.9cm}{!}{\thepage}};
\fi
\end{tikzpicture}}}
%%制定章节页的侧标更新规则%%
\newcommand{\@pagesiderule}{
\ifnum\value{@currenttotalpart}=0%若文档中到当前章时还没有部分层次
\extramarks{\protect\@title}{\protect\@title}%侧标内容为书名
\if@mainmatter%如果在mainmatter中
\stepcounter{@pagesidenumber}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\fi\else
\if@mainmatter%如果在mainmatter中
{}
\else
\extramarks{\protect\@title}{\protect\@title}%侧标内容为书名
\fi\fi}
%%编号章节页%%
\titleformat{\chapter}
{}{}{0em}
{\@pagesiderule
\@chapterstyle{第~\thechapter~章}{#1}%章样式
\enlargethispage{-1.25cm}%修改页面大小
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%%不编号章节页%%
\titleformat{name=\chapter,numberless}
{}{}{0em}
{\@pagesiderule
\markboth{#1\ifdefvoid{\@chaptersubtitle}{}{\quad\@chaptersubtitle}}{#1\ifdefvoid{\@chaptersubtitle}{}{\quad\@chaptersubtitle}}%修改页眉内容
\@chapterstarstyle{#1}{\ifdefvoid{\@chaptersubtitle}{}{\@chaptersubtitle}}%章样式
\enlargethispage{-0.25cm}%修改页面大小
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%%间距设置%%
\titlespacing*{\chapter}{0pt}{40pt}{40pt}
%%节样式%%
%%编号节样式%%
\newcommand{\@sectionlabel}[1]{
\tikz{\node[inner sep=0mm,anchor=west,font=\FontSize{17pt}\bfseries](P){第};
\node[inner sep=0mm,anchor=west,font=\FontSize{17pt}\bfseries](S)at([xshift=1.2cm]P.east){节};
\coordinate(R)at($0.5*(P.east)+0.5*(S.west)$);
\draw[ColorA,fill=ColorA](R)circle(0.375cm);
\node[inner sep=0mm,anchor=center,font=\FontSize{17pt}\bfseries,text=white](N)at(R){\maxsizebox{0.45cm}{0.45cm}{#1}};}}
%%
\newcommand{\@sectionstyle}[2]{
\begin{flushleft}
\tikz{\node[inner sep=-1.0mm,inner ysep=0mm](L){\@sectionlabel{#1}};
\node[anchor=north west,font=\FontSize{17pt}\bfseries,inner ysep=0.96mm](Q)at([xshift=0.75cm]L.north east){\begin{varwidth}{\linewidth-3.0cm}#2\end{varwidth}};}
\end{flushleft}}
%%不编号节样式%%
\newcommand{\@sectionstarlabel}{
\tikz{\draw[ColorA!50,fill=ColorA!50,line width=3.0pt](0,0)circle(0.375cm);
\draw[white,fill=ColorA,line width=2.5pt](0,0)circle(0.25cm);}}
%%
\newcommand{\@sectionstarstyle}[1]{
\begin{flushleft}
\tikz{\node[inner xsep=-1.0mm,inner ysep=0mm](C){\@sectionstarlabel};
\node[anchor=north west,font=\FontSize{17pt}\bfseries,text=ColorA,inner ysep=1.425mm](P)at([xshift=0.25cm]C.north east){\begin{varwidth}{\linewidth-1.0cm}#1\end{varwidth}};}
\end{flushleft}}
%%环境内节样式%%
\newcommand{\@envsectionlabel}[2]{
\tikz{\node[inner sep=0mm,anchor=west,font=\FontSize{17pt}\bfseries](P){#1};
\coordinate(R)at([xshift=0.65cm]P.east);
\draw[ColorA,fill=ColorA](R)circle(0.375cm);
\node[inner sep=0mm,anchor=center,font=\FontSize{17pt}\bfseries,text=white](N)at(R){\maxsizebox{0.45cm}{0.45cm}{#2}};}}
%%
\newlength{\sectionlabelwidth}
\newcommand{\@envsectionstyle}[3]{
\settowidth{\sectionlabelwidth}{\FontSize{17pt}{\textbf{#1}}}
\begin{flushleft}
\tikz{\node[inner xsep=-1.0mm,inner ysep=0mm](L){\@envsectionlabel{#1}{#2}};
\node[anchor=north west,font=\FontSize{17pt}\bfseries,inner ysep=0.96mm](Q)at([xshift=0.75cm]L.north east){\begin{varwidth}{\linewidth-\sectionlabelwidth-1.5cm}#3\end{varwidth}};}
\end{flushleft}}
%%编号节样式%%
\titleformat{\section}
{}{}{0em}
{\@sectionstyle{\thesection}{#1}}
%%不编号节样式%%
\titleformat{name=\section,numberless}
{}{}{0em}
{\markright{#1}
\@sectionstarstyle{#1}}
%%间距设置%%
\titlespacing*{\section}{0pt}{0pt}{0pt}
%%修改章节断页方式，使\section另起一页，而\section*不换页%%
\let\origsection\section
\renewcommand{\section}{
\@ifstar
{\origsection*}
{\clearpage\origsection}}

%%小节标题样式%%
\newlength{\subsectionlabelwidth}
%%编号小节标题样式%%
%%设置\subsection的标题%%
\newcommand{\@subsectiontitle}[3]{\tikz{
\node[anchor=west,draw=ColorA,fill=ColorA,line width=3.0pt,minimum height=0.7cm,rounded corners=0.35cm,font=\bfseries\FontSize{13.5pt},text=white,inner xsep=4.0mm](N){#1\hspace*{0.5cm}};
\draw[draw=white,fill=white,line width=7.5pt](N.east)circle(0.45cm);
\draw[ColorB!7.5,fill=ColorB!7.5,rounded corners=0.4cm]([xshift=-0.4cm,yshift=0.4cm]N.east)rectangle(\linewidth+1.0mm,-0.4cm);
\draw[draw=ColorA,fill=white,line width=3.0pt](N.east)circle(0.375cm);
\node[anchor=center,font=\bfseries\FontSize{16pt},text=ColorA](S)at(N.east){\maxsizebox{0.5cm}{!}{#2}};
\node[anchor=west,font=\bfseries\FontSize{13.75pt},text=ColorA,inner ysep=0mm,inner xsep=2.5mm](T)at([xshift=4.0mm]S.east){\maxsizebox{\linewidth-\subsectionlabelwidth-3.0cm}{!}{#3}};}}
%%
\newcommand{\@subsectionstyle}[3]{
\settowidth{\subsectionlabelwidth}{\FontSize{13.5pt}{\textbf{#1}}}
\begin{flushleft}
\tikz{\node[inner ysep=0mm,inner xsep=-0.95mm](G){\@subsectiontitle{#1}{#2}{#3}};}
\end{flushleft}}

%%不编号小节标题样式%%
\newcommand*\subsectionsubtitle[1]{\def\@subsectionsubtitle{#1}}
%%设置\subsection*的标题%%
\newcommand{\@subsectionstartitle}[1]{\tikz{
\draw[ColorB!7.5,fill=ColorB!7.5,rounded corners=0.4cm](0,0.4cm)rectangle(\linewidth+1.0mm,-0.4cm);
\node[anchor=west,draw=ColorA,fill=ColorA,line width=3.0pt,minimum height=0.7cm,rounded corners=0.35cm,font=\bfseries\FontSize{13.5pt},text=white,inner xsep=4.0mm](N)at(0,0){\maxsizebox{\linewidth-1.5cm}{!}{\hspace*{0.875cm+1.5pt}#1}};
\draw[draw=white,fill=white,line width=7.5pt]([xshift=0.375cm+1.5pt]N.west)circle(0.45cm);
\draw[draw=ColorA,fill=white,line width=3.0pt]([xshift=0.375cm+1.5pt]N.west)circle(0.375cm);
\draw[draw=ColorA,fill=ColorA]([xshift=0.375cm+1.5pt]N.west)circle(0.2cm);
\node[font=\bfseries\FontSize{12pt},text=ColorA,anchor=east,inner xsep=5.0mm,inner ysep=0mm](S)at(\linewidth+2.0mm,0){\ifdefvoid{\@subsectionsubtitle}{}{\@subsectionsubtitle}};}}
%%
\newcommand{\@subsectionstarstyle}[1]{
\begin{flushleft}
\tikz{\node[inner ysep=0mm,inner xsep=-1.7mm-2.25pt](G){\@subsectionstartitle{#1}};}
\end{flushleft}}

%%编号小节样式%%
\titleformat{\subsection}
{}{}{0em}
{\@subsectionstyle{课时}{\arabic{subsection}}{#1}}
%%不编号小节样式%%
\titleformat{name=\subsection,numberless}
{}{}{0em}
{\@subsectionstarstyle{#1}}
%%间距设置%%
\titlespacing*{\subsection}{0pt}{-20pt}{-20pt}
%%点样式%%
\titleformat{\subsubsection}
{}{}{0em}
{\begin{flushleft}
\tikz{\node[inner sep=0mm,anchor=west,font=\FontSize{24pt}\bfseries,text=ColorB](T){\ding{119}};
\node[inner ysep=0.815mm,anchor=north west,font=\FontSize{13pt}\bfseries,text=ColorB](Q)at([xshift=2.0mm]T.north east){\begin{varwidth}{\linewidth-0.5cm}#1\end{varwidth}};}
\end{flushleft}}
%%间距设置%%
\titlespacing*{\subsubsection}{0pt}{15pt}{-15pt}
%%修改段落样式%%
\renewcommand\paragraph{
\@startsection{paragraph}{4}{\z@}
{3.25ex \@plus1.0ex \@minus0.2ex}{-1em}
{\FontSize{12pt}\bfseries\color{ColorA}}}
\makeatother

%%练习题面板标题%%
\NewDocumentCommand{\ExerciseTitle}{O{ColorA} m}{
\colorlet{ListColor}{#1}
\begin{center}
\begin{tikzpicture}
\node[draw=#1,fill=#1,ultra thick,minimum height=0.7cm,rounded corners=0.35cm,font=\bfseries\FontSize{13pt},text=white,inner xsep=0.5cm](E){\maxsizebox{\linewidth-6.0cm}{!}{#2}};
\draw[#1,fill=#1]([xshift=0.5cm]E.east)circle(0.26cm);
\draw[#1!85,fill=#1!85]([xshift=1.2cm]E.east)circle(0.235cm);
\draw[#1!70,fill=#1!70]([xshift=1.85cm]E.east)circle(0.21cm);
\draw[#1,fill=#1]([xshift=-0.5cm]E.west)circle(0.26cm);
\draw[#1!85,fill=#1!85]([xshift=-1.2cm]E.west)circle(0.235cm);
\draw[#1!70,fill=#1!70]([xshift=-1.85cm]E.west)circle(0.21cm);
\end{tikzpicture}
\end{center}}

%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%%%
%%目录页码右侧空格%%
\contentsmargin{2.25mm}
\makeatletter
%%标签绘制%%
\newcommand{\@PartContents}[1]{
\draw[ColorB!7.5,fill=ColorB!7.5,line width=0.1pt,rounded corners=0.38cm]
(0,0.38cm)rectangle(\linewidth,-0.38cm);
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.north west)--(T.north east)[sharp corners]--(T.south east)[rounded corners=0.38cm]--(T.south west)[rounded corners=0.38cm]--cycle},font=\FontSize{13pt}\bfseries,text=white,align=center,inner xsep=4.5mm,minimum height=0.76cm,anchor=west](T)at(0,0){\maxsizebox{\linewidth/2-1.0cm}{!}{#1}};}
%%编号部分目录样式%%
\newcommand{\@tocentrypartnumbered}[1]{
\contentslabel[\tikz{
\@PartContents{\maxsizebox{2.8cm}{!}{第~\thecontentslabel~部分}}
\node[font=\FontSize{13pt}\bfseries,text=ColorA,anchor=west,inner xsep=0mm](S)at([xshift=3.5mm]T.east){\maxsizebox{\linewidth-4.0cm}{!}{#1}};
\node[font=\FontSize{14pt}\bfseries,text=ColorA,anchor=east,inner xsep=0mm](P)at(\linewidth-0.35cm,0){\thecontentspage};}]{1.25cm}}
%%不编号部分目录样式%%
\newcommand{\@tocentrypartunnumbered}[1]{
\contentslabel[\tikz{
\@PartContents{#1}
\node[font=\FontSize{14pt}\bfseries,text=ColorA,anchor=east,inner xsep=0mm](P)at(\linewidth-0.35cm,0){\thecontentspage};}]{1.25cm}}
%%部分目录样式%%
\titlecontents{part}[1.25cm]
{\addvspace{20pt}\bfseries\hypersetup{linkcolor=white}}
{\@tocentrypartnumbered}
{\@tocentrypartunnumbered}{}
%%章目录样式%%
\titlecontents{chapter}[2.55cm]
{\addvspace{5pt}\FontSize{13pt}\bfseries\color{ColorB}\hypersetup{linkcolor=ColorB}}
{\color{ColorB}\contentslabel[\if@appendix%如果章在相应环境里，则修改目录前缀
附录~\thecontentslabel~
\else
\if@test
试题~\thecontentslabel~
\else
第~\thecontentslabel~章
\fi\fi]{2.0cm}}
{\color{ColorB}\hspace*{-2.0cm}}%不编号章节
{\titlerule*[6pt]{ }\color{ColorB}\FontSize{13pt}\thecontentspage}
%%节目录样式%%
\titlecontents{section}[2.55cm]
{\addvspace{-0.5pt}\FontSize{12pt}\xbsong}
{\contentslabel[\if@topic%如果节在相应环境里，则修改目录前缀
专题~\thecontentslabel~
\else
\if@project
课题~\thecontentslabel~
\else
\if@quiz
测试~\thecontentslabel~
\else
第~\thecontentslabel~节
\fi\fi\fi]{1.9cm}}
{\hspace*{-1.9cm}}%不编号章节
{\titlerule*[6pt]{.}\FontSize{12pt}\xbsong\thecontentspage}
%%图片目录样式%%
\titlecontents{figure}[2.5cm]
{\addvspace{-0.5pt}\FontSize{12pt}\xbsong}
{\contentslabel[图~\thecontentslabel~]{1.9cm}}
{\hspace*{-1.9cm}}%不编号图表
{\titlerule*[6pt]{.}\FontSize{12pt}\xbsong\thecontentspage}
%%表格目录样式%%
\titlecontents{table}[2.5cm]
{\addvspace{-0.5pt}\FontSize{12pt}\xbsong}
{\contentslabel[表~\thecontentslabel~]{1.9cm}}
{\hspace*{-1.9cm}}%不编号图表
{\titlerule*[6pt]{.}\FontSize{12pt}\xbsong\thecontentspage}
%%部分页上的小目录章样式%%
\titlecontents{lchapter}[0.75cm]
{\addvspace{5pt}\FontSize{12.5pt}\bfseries\hypersetup{linkcolor=ColorB}}
{\color{ColorB}\contentslabel[\raisebox{-0.25mm}{\FontSize{15.5pt}\bfseries\faGenderless}]{0.6cm}}
{\color{ColorB}\contentslabel[\raisebox{-0.25mm}{\FontSize{15.5pt}\bfseries\faGenderless}]{0.6cm}}%不编号章节
{}
%%部分页上的小目录节样式%%
\titlecontents{lsection}[0.9cm]
{\addvspace{-0.5pt}\FontSize{11pt}\xbsong}
{\contentslabel[\faGenderless]{0.5cm}}
{\contentslabel[\faGenderless]{0.5cm}}%不编号章节
{}
\makeatother

%%%%%%%%%%%%%%%%%% 环境定义和命令定义 %%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\newcommand{\@basenode}[1]{
\tikz[baseline=($0.7*(current bounding box.west)+0.3*(current bounding box.south west)$)]{\node[inner xsep=-0.95mm](E){#1};}}
%%设置例题命令%%
\newcommand{\@egextitle}[3]{
\tikz{\node[font=\FontSize{11pt}\bfseries,text=white,draw=#2!90!ColorD,fill=#2!90!ColorD,rounded corners=0.8em,inner xsep=3.5mm,ultra thick,minimum height=1.6em](T){#1\hspace*{0.55cm}};
\node[anchor=west,font=\FontSize{11.5pt}\bfseries,text=#2!90!ColorD,draw=#2!90!ColorD,fill=white,rounded corners=0.8em,inner xsep=2.5mm,ultra thick,minimum height=1.6em](N)at([xshift=-1.7em]T.east){#3};}}
%%设置解答命令%%
\newcommand{\@ansanatitle}[2]{
\tikz{\node[font=\FontSize{11pt}\bfseries,text=white,draw=#2!90!ColorD,fill=#2!90!ColorD,rounded corners=0.8em,inner xsep=3.5mm,ultra thick,minimum height=1.6em](T){#1};}}
%%解答%%
\NewExpandableDocumentCommand{\Answer}{sm}{
\begin{FlushLeft}
\justifying
\IfBooleanTF{#1}
{\@basenode{\@ansanatitle{延展}{ColorF}}\hspace{1.0em}\vspace{0.25em}#2}%带星号*
{\@basenode{\@ansanatitle{解答}{ColorG}}\hspace{1.0em}\vspace{0.25em}#2}
\end{FlushLeft}}
%%例题%%
\newcommand{\Example}[1]{
\stepcounter{@egnum}
\begin{FlushLeft}
\justifying
\@basenode{\@egextitle{例题}{ColorA}{\thechapter.\the@egnum}}\hspace{1.0em}\vspace{0.25em}#1
\end{FlushLeft}}
%%变式%%
\newcommand{\Variety}[1]{
\stepcounter{@varnum}
\begin{FlushLeft}
\justifying
\@basenode{\@egextitle{变式}{ColorB}{\thechapter.\the@varnum}}\hspace{1.0em}\vspace{0.25em}#1
\end{FlushLeft}}
\makeatother

%%以下为本文档类内置栏目，请谨慎修改%%
%设置环境布尔变量
\makeatletter
\newif\if@appendix
\newif\if@quiz
\newif\if@test
\newif\if@project
\newif\if@topic

%%设置附录环境%%
\newcounter{@beforeappendixcounter}%储存环境前的章计数器数值
\newcounter{@innerappendixcounter}%储存环境中的章计数器数值
\setcounter{@innerappendixcounter}{0}%将环境中的章计数器值置零
\newenvironment{Appendix}{
\@appendixtrue
%在toc文件中写入\@appendixtrue，确保目录正确生成
\addtocontents{toc}{\protect\@appendixtrue}
%修改章计数器样式为大写字母
\renewcommand{\thechapter}{\Alph{chapter}}
%修改页眉页脚标签
\renewcommand{\chaptermark}[1]{\markboth{附录~\thechapter~\quad##1}{附录~\thechapter~\quad##1}}
%修改有编号章样式
\titleformat{\chapter}
{}{}{0em}
{\@pagesiderule
\@chapterstarstyle{附录~\thechapter~}{##1}%章样式
\enlargethispage{-0.25cm}%修改页面大小
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%将环境前的章计数器值储存在beforecounter中
\setcounter{@beforeappendixcounter}{\value{chapter}}
%将章计数器置为环境中章计数器值
\setcounter{chapter}{\value{@innerappendixcounter}}
}{\@appendixfalse
\addtocontents{toc}{\protect\@appendixfalse}
%将环境中的章计数器值储存在innercounter中
\setcounter{@innerappendixcounter}{\value{chapter}}
%将章计数器值恢复为环境前的值
\setcounter{chapter}{\value{@beforeappendixcounter}}
}
%%设置试题环境%%
\newcounter{@beforetestcounter}%储存环境前的章计数器数值
\newcounter{@innertestcounter}%储存环境中的章计数器数值
\setcounter{@innertestcounter}{0}%将环境中的章计数器值置零
\newenvironment{Test}{
\@testtrue
%在toc文件中写入\@testtrue，确保目录正确生成
\addtocontents{toc}{\protect\@testtrue}
%修改章计数器样式为大写字母
\renewcommand{\thechapter}{\Alph{chapter}}
%修改页眉页脚标签
\renewcommand{\chaptermark}[1]{\markboth{试题~\thechapter~\quad##1}{试题~\thechapter~\quad##1}}
%修改有编号章样式
\titleformat{\chapter}
{}{}{0em}
{\@pagesiderule
\@chapterstarstyle{试题~\thechapter~}{##1}%章样式
\enlargethispage{-0.25cm}%修改页面大小
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@subsectionstyle{题目}{\arabic{subsection}}{##1}}
%将环境前的章计数器值储存在beforecounter中
\setcounter{@beforetestcounter}{\value{chapter}}
%将章计数器置为环境中章计数器值
\setcounter{chapter}{\value{@innertestcounter}}
}{\@testfalse
\addtocontents{toc}{\protect\@testfalse}
%将环境中的章计数器值储存在innercounter中
\setcounter{@innertestcounter}{\value{chapter}}
%将章计数器值恢复为环境前的值
\setcounter{chapter}{\value{@beforetestcounter}}
}
%%设置测试环境%%
\newcounter{@beforequizcounter}%储存环境前的节计数器数值
\newcounter{@innerquizcounter}%储存环境中的节计数器数值
\setcounter{@innerquizcounter}{0}%将环境中的节计数器值置零
\newenvironment{Quiz}{
\clearpage
\@quiztrue
%在toc文件中写入\@quiztrue，确保目录正确生成
\addtocontents{toc}{\protect\@quiztrue}
%修改页眉页脚标签
\renewcommand{\sectionmark}[1]{\markright{测试~\thesection~\quad##1}}
%修改有编号节样式
\titleformat{\section}
{}{}{0em}
{\@envsectionstyle{测试}{\thesection}{##1}}
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@subsectionstyle{题目}{\arabic{subsection}}{##1}}
%将环境前的节计数器值储存在beforecounter中
\setcounter{@beforequizcounter}{\value{section}}
%将节计数器置为环境中节计数器值
\setcounter{section}{\value{@innerquizcounter}}
}{\@quizfalse
\addtocontents{toc}{\protect\@quizfalse}
%将环境中的节计数器值储存在innercounter中
\setcounter{@innerquizcounter}{\value{section}}
%将节计数器值恢复为环境前的值
\setcounter{section}{\value{@beforequizcounter}}
}
%%设置专题环境%%
\newcounter{@beforetopiccounter}%储存环境前的节计数器数值
\newcounter{@innertopiccounter}%储存环境中的节计数器数值
\setcounter{@innertopiccounter}{0}%将环境中计数器值置零
\newenvironment{Topic}{
\clearpage
\@topictrue
%在toc文件中写入\@topictrue，确保目录正确生成
\addtocontents{toc}{\protect\@topictrue}
%修改页眉页脚标签
\renewcommand{\sectionmark}[1]{\markright{专题~\thesection~\quad##1}}
%修改有编号节样式
\titleformat{\section}
{}{}{0em}
{\@envsectionstyle{专题}{\thesection}{##1}}
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@subsectionstyle{重难点}{\arabic{subsection}}{##1}}
%修改例题样式
\renewcommand{\Example}[1]{
\stepcounter{@classic}
\begin{flushleft}
\begin{varwidth}{\linewidth}
\@basenode{\@egextitle{典例}{ColorA}{\thesection.\the@classic}}\hspace{1.0em}\vspace{0.25em}##1
\end{varwidth}
\end{flushleft}}
%将环境前的节计数器值储存在beforecounter中
\setcounter{@beforetopiccounter}{\value{section}}
%将节计数器置为环境中节计数器值
\setcounter{section}{\value{@innertopiccounter}}
}{\@topicfalse
\addtocontents{toc}{\protect\@topicfalse}
%将环境中的节计数器值储存在innercounter中
\setcounter{@innertopiccounter}{\value{section}}
%将节计数器值恢复为环境前的值
\setcounter{section}{\value{@beforetopiccounter}}
}
%%设置实验环境%%
\newcounter{@beforeprojectcounter}%储存环境前的节计数器数值
\newcounter{@innerprojectcounter}%储存环境中的节计数器数值
\setcounter{@innerprojectcounter}{0}%将环境中计数器值置零
\newenvironment{Project}{
\clearpage
\@projecttrue
%在toc文件中写入\@experimenttrue，确保目录正确生成
\addtocontents{toc}{\protect\@projecttrue}
%修改页眉页脚标签
\renewcommand{\sectionmark}[1]{\markright{课题~\thesection~\quad##1}}
%修改有编号节样式
\titleformat{\section}
{}{}{0em}
{\@envsectionstyle{课题}{\thesection}{##1}}
%将环境前的节计数器值储存在beforecounter中
\setcounter{@beforeprojectcounter}{\value{section}}
%将节计数器置为环境中节计数器值
\setcounter{section}{\value{@innerprojectcounter}}
}{\@projectfalse
\addtocontents{toc}{\protect\@projectfalse}
%将环境中的节计数器值储存在innercounter中
\setcounter{@innerprojectcounter}{\value{section}}
%将节计数器值恢复为环境前的值
\setcounter{section}{\value{@beforeprojectcounter}}
}
\makeatother

\makeatletter
%%重定义\frontmatter%%
\renewcommand{\frontmatter}{
\cleardoublepage
\@mainmatterfalse
\pagenumbering{roman}
\pagestyle{MainPage}}
%%重定义\backmatter%%
\renewcommand{\backmatter}{
\cleardoublepage
\@mainmatterfalse
\pagenumbering{Roman}}
\makeatother

%%%%%%%%%%%%%%%%%% 盒子定义 %%%%%%%%%%%%%%%%%%%%%%%%
%%设置节前盒子%%
\DeclareTColorBox{box0}{O{} m O{ColorB}}{
enhanced standard,breakable,empty,
pad before break=3.0mm,pad after break=5.0mm,
top=5.0mm,bottom=3.0mm,
right=0mm,boxsep=0mm,
parbox=false,before upper=\par,before lower=\par,
before=\par\bigskip\noindent,after=\par,
fonttitle=\bfseries\color{white}\FontSize{12pt},
attach boxed title to top left={xshift=3.0mm,yshift*=-\tcboxedtitleheight},
code={\colorlet{ListColor}{#3}},
boxed title style={empty,left=8.35mm,right=3.5mm,height=0.7cm,valign=center},
underlay boxed title={
\draw[#3,fill=#3,line width=1.0pt](title.north west)--([xshift=-\tcboxedtitleheight/2]title.north east) arc (90:-90:{\tcboxedtitleheight/2})--(title.south west)--cycle;
\draw[white,fill=white,line width=12.5pt](title.west)circle({\tcboxedtitleheight/2});
\draw[#3,fill=white,line width=3.0pt](title.west)circle({\tcboxedtitleheight/2});
\draw[#3,fill=#3](title.west)circle({\tcboxedtitleheight/2-1.75mm});
\draw[#3,fill=#3,ultra thin]([xshift=-15.5mm,yshift=-\tcboxedtitleheight/2]frame.north east)circle({\tcboxedtitleheight/2-1.15mm});
\draw[#3!90,fill=#3!90,ultra thin]([xshift=-9.0mm,yshift=-\tcboxedtitleheight/2]frame.north east)circle({\tcboxedtitleheight/2-1.15mm});
\draw[#3!80,fill=#3!80,ultra thin]([xshift=-2.5mm,yshift=-\tcboxedtitleheight/2]frame.north east)circle({\tcboxedtitleheight/2-1.15mm});},
subtitle style={empty,before upper=\par,fontupper=\centering\FontSize{13pt}\bfseries\color{#3}},
title={\maxsizebox{\linewidth-2.0cm}{!}{#2}},#1}

\newenvironment{Point}{\begin{box0}[left=0mm]{本章要点}[ColorA]}{\end{box0}}
\newenvironment{Point*}{\begin{box0}[left=0mm]{本节导言}[ColorA]}{\end{box0}}

\newenvironment{Case}{\begin{box0}[left=-3.8mm+0.5em]{基础概念、公式和定理}[ColorB]\begin{Concept}}{\end{Concept}\end{box0}}
\newenvironment{Case*}{\begin{box0}[left=-3.8mm+0.5em]{本节提要}[ColorB]\begin{Concept}}{\end{Concept}\end{box0}}


%%设置习题盒子样式%%
\tcbset{Question/.style={
enhanced standard,breakable,empty,
pad before break=3.0mm,pad after break=5.0mm,
top=3.0mm,bottom=3.0mm,
right=0mm,left=-2.775mm+0.5em,boxsep=0mm,
attach boxed title to top left={xshift=0.5mm},
after=\par\medskip,
parbox=false,before upper=\par,before lower=\par,
fonttitle=\FontSize{12.5pt}\bfseries\color{white},
boxed title style={empty,left=3.5mm,right=8.5mm,top=0mm,bottom=0mm},
lowerbox=ignored,
code={\colorlet{ListColor}{ColorA}},
subtitle style={empty,fontupper=\FontSize{13pt}\centering\bfseries\color{ColorA}}
}}

\makeatletter
%%简化序号命令%%
\newcommand{\the@prenumber}{\thechapter.\thesection}
%%课后习题盒子%%
\newtcolorbox{Exercise}{
Question,code={
\subsectionsubtitle{答案见第~\pageref{solution@Exercise.\the@prenumber}~页}
\subsection*{课后习题~\the@prenumber}
\vspace*{-10pt}},
label={question@Exercise.\the@prenumber},%标签
savelowerto=solutions/Exercise.\the@prenumber.tex,%将答案保存为一个tex文件，并放在一个名为solutions的文件夹里
record={\string\solution{Exercise.\the@prenumber}{solutions/Exercise.\the@prenumber.tex}}
}
%%思考题盒子%%
\newtcolorbox{Thinking}{
Question,code={
\subsectionsubtitle{答案见第~\pageref{solution@Thinking.\the@prenumber}~页}
\subsection*{思考题~\the@prenumber}
\vspace*{-10pt}},
label={question@Thinking.\the@prenumber},
savelowerto=solutions/Thinking.\the@prenumber.tex,%将答案保存为一个tex文件，并放在一个名为solutions的文件夹里
record={\string\solution{Thinking.\the@prenumber}{solutions/Thinking.\the@prenumber.tex}}
}
%%复习与提高盒子%%
\newtcolorbox{Improve}{
Question,code={
\subsectionsubtitle{答案见第~\pageref{solution@Improve.\thechapter}~页}
\subsection*{复习与提高~\thechapter}
\vspace*{-10pt}},
label={question@Improve.\thechapter},
savelowerto=solutions/Improve.\thechapter.tex,
record={\string\solution{Improve.\thechapter}{solutions/Improve.\thechapter.tex}}
}
%%针对练习盒子%%
\newtcolorbox{Specific}{
Question,code={
\subsectionsubtitle{答案见第~\pageref{solution@Specific.\thesection}~页}
\subsection*{针对练习~\thesection}
\vspace*{-10pt}},
label={question@Specific.\thesection},
savelowerto=solutions/Specific.\thesection.tex,%将答案保存为一个tex文件，并放在一个名为solutions的文件夹里
record={\string\solution{Specific.\thesection}{solutions/Specific.\thesection.tex}}
}

%%设置书末参考答案盒子%%
\NewTotalTColorBox{\solution}{mm}{
enhanced standard,breakable,empty,
top=3.0mm,bottom=0mm,toptitle=3.0mm,
left=0mm,right=0mm,boxsep=0mm,
rounded corners,arc=5.0pt,
before=\par\noindent,after=\par,
parbox=false,before upper=\par,before lower=\par,
fonttitle=\FontSize{12pt}\bfseries\color{ColorA},
title={原题见第~\pageref{question@#1}~页},
phantomlabel={solution@#1}
}{\input{#2}}
\makeatother


%%设置彩色盒子样式%%
\tcbset{Box/.style={
enhanced standard,breakable,
pad before break=3.0mm,pad after break=4.5mm,
rounded corners,arc=5.0pt,boxrule=2.25pt,
colback=white,colframe=white,
top=3.0mm,bottom=2.5mm,
before=\par\noindent\medskip,after=\par\medskip,
parbox=false,before lower=\par,
fonttitle=\FontSize{12pt}\bfseries\color{white}
}}

%%判断标题长度并决定其放置位置%%
\makeatletter
\def\@BoxedTitleText{}
\def\@BoxedBeforeUpperText{}
\def\@BoxedBeforeTitleText{}
\newlength{\@BoxedTitleWidth}
\newcommand{\JudgeTitle}[3]{
\settowidth{\@BoxedTitleWidth}{\textbf{\FontSize{12pt}{#2}}}
\ifthenelse{\isempty{#2}}{%若无标题名称
\def\@BoxedTitleText{}%标题置空
\def\@BoxedBeforeUpperText{\par}
\def\@BoxedBeforeTitleText{\textbf{\color{white}{\FontSize{12pt}{#1}}}}%无标题名称前分隔符
}{%若有标题名称
\ifthenelse{\lengthtest{\@BoxedTitleWidth>0.4\linewidth}}{%判断标题名称长度
\def\@BoxedTitleText{}%若过长，则标题置空
\def\@BoxedBeforeUpperText{{\textbf{\color{#3}{\FontSize{12pt}{#2}}}\quad}}
\def\@BoxedBeforeTitleText{\textbf{\color{white}{#1}}}%无标题名称前分隔符
}{
\def\@BoxedTitleText{#2}%若较短，则将名称放置在标题盒子中
\def\@BoxedBeforeUpperText{\par}
\def\@BoxedBeforeTitleText{\textbf{\color{white}{\FontSize{12pt}{#1:~}}}}%有标题名称前分隔符
}}
}
\makeatother

%%设置易错点盒子%%
\DeclareTColorBox{box1}{O{} m O{ColorA} O{\faExclamationCircle}}{
Box,before upper=\par,
frame style={left color=#3!50,right color=#3!50,middle color=#3},
title={\maxsizebox{\linewidth-2.0cm}{!}{#2}},
attach boxed title to top left={xshift=4.0mm,yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={empty,left=8.5mm,right=3.5mm,height=0.7cm,valign=center},
underlay boxed title={
\draw[white,fill=white,rounded corners=\tcboxedtitleheight/2,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#3,fill=#3,line width=2.0pt,rounded corners=\tcboxedtitleheight/2](title.north west)rectangle(title.south east);
\draw[white,fill=white,line width=12.5pt](title.west)circle({2*\tcboxedtitleheight/3});
\draw[#3,fill=#3](title.west)circle({2*\tcboxedtitleheight/3});
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries,text=white](P)at(title.west){#4};
},
subtitle style={empty,fontupper=\FontSize{12pt}\bfseries\color{#3}},
#1}

\newenvironment{Warning}{\begin{box1}{易错点警示}[ColorF][\faExclamation]}{\end{box1}}
\newenvironment{Discussion}{\begin{box1}{思考与讨论}[ColorC][\faQuestion]}
{\end{box1}}
\newenvironment{Practice}{\begin{box1}{随堂练习}[ColorI][\faCheck]}
{\end{box1}}

%%设置演示盒子%%
\makeatletter
\DeclareTColorBox{box2}{O{} m m O{ColorA} O{\faLayerGroup}}{
Box,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\JudgeTitle{#2}{#3}{#4}},
before title={\@BoxedBeforeTitleText},
title={\@BoxedTitleText},
before upper={\@BoxedBeforeUpperText},
attach boxed title to top left={xshift=4.25mm,yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={empty,left=8.5mm,right=3.5mm,height=0.7cm,valign=center},
underlay boxed title={
\draw[white,fill=white,line width=10.0pt,rounded corners=\tcboxedtitleheight/2](title.north east)rectangle(title.south west);
\draw[#4!90,fill=#4!90,line width=2.0pt,rounded corners=\tcboxedtitleheight/2](title.north east)rectangle(title.south west);
\fill[white,draw=white,line width=12.5pt](title.west)circle({2*\tcboxedtitleheight/3});
\draw[#4,fill=#4!90,line width=2.0pt](title.west)circle({2*\tcboxedtitleheight/3});
\draw[#4,line width=2.0pt]
([xshift={sqrt(3)*\tcboxedtitleheight/2}]title.north west)[rounded corners=\tcboxedtitleheight/2]--
(title.north east)[rounded corners=\tcboxedtitleheight/2]--
(title.south east)[sharp corners]--
([xshift={sqrt(3)*\tcboxedtitleheight/2}]title.south west) arc (-30:30:{\tcboxedtitleheight})--
cycle;
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries,text=white](T)at(title.west){#5};},
subtitle style={empty,fontupper=\FontSize{12pt}\bfseries\color{#4}},
#1}
\makeatother

\DeclareDocumentEnvironment{Display}{ O{} }{\begin{box2}{演示与实验}{#1}[ColorB][\faLayerGroup]}{\end{box2}}
\DeclareDocumentEnvironment{Method}{ O{} }{\begin{box2}{方法与技巧}{#1}[ColorD][\faPodcast]}{\end{box2}}
\DeclareDocumentEnvironment{Mind}{ O{} }{\begin{box2}{科学思维}{#1}[ColorC][\faAtom]}{\end{box2}}


\makeatletter
%%设置定义定理盒子%%
\DeclareTColorBox{box3}{O{} m O{} O{ColorA} O{\faCodepen}}{
Box,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\JudgeTitle{#2}{#3}{#4}},
before title={\@BoxedBeforeTitleText},
title={\@BoxedTitleText},
before upper={\@BoxedBeforeUpperText},
attach boxed title to top left={xshift=4.25mm,yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={empty,left=5.5mm,right=3.5mm,height=0.7cm,valign=center},
underlay boxed title={
\draw[white,fill=white,line width=15.0pt](title.west)circle({2*\tcboxedtitleheight/3});
\draw[white,fill=white,rounded corners=\tcboxedtitleheight/2,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#4,fill=#4!90,line width=2.25pt]
([xshift={sqrt(7)*\tcboxedtitleheight/6}]title.north west) arc ({asin(0.75)}:{360-asin(0.75)}:{2*\tcboxedtitleheight/3})[rounded corners=\tcboxedtitleheight/2]--
(title.south east)[rounded corners=\tcboxedtitleheight/2]--
(title.north east)[sharp corners]--
cycle;
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries,text=white](P)at(title.west){#5};},
#1}
%%编号定义盒子%%
\DeclareDocumentEnvironment{Definition}{ O{} }{\begin{box3}[step and label={@def}{Def.\the@prenumber.\the@def}]{定义~\the@prenumber.\the@def}[#1][ColorA][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Theorem}{ O{} }{\begin{box3}[step and label={@thm}{Thm.\the@prenumber.\the@thm}]{定理~\the@prenumber.\the@thm}[#1][ColorB][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Axiom}{ O{} }{\begin{box3}[step and label={@axm}{Axm.\the@prenumber.\the@axm}]{公理~\the@prenumber.\the@axm}[#1][ColorI][\faCompactDisc]}{\end{box3}}
%%不编号定义盒子%%
\DeclareDocumentEnvironment{Definition*}{ O{} }{\begin{box3}{定义}[#1][ColorA][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Theorem*}{ O{} }{\begin{box3}{定理}[#1][ColorB][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Axiom*}{ O{} }{\begin{box3}{公理}[#1][ColorI][\faCompactDisc]}{\end{box3}}


%%设置引理盒子%%
\DeclareTColorBox{box4}{O{} m O{} O{ColorA} O{\faDiceD20}}{
Box,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\JudgeTitle{#2}{#3}{#4}},
before title={\@BoxedBeforeTitleText},
title={\@BoxedTitleText},
before upper={\@BoxedBeforeUpperText},
attach boxed title to top left={xshift=4.5mm,yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={empty,left=5.5mm,right=3.5mm,height=0.7cm,valign=center},
underlay boxed title={
\draw[white,fill=white,line width=15.0pt](title.west)circle({2*\tcboxedtitleheight/3});
\draw[white,fill=white,rounded corners=\tcboxedtitleheight/2,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#4,fill=#4,rounded corners=\tcboxedtitleheight/2,line width=3.0pt](title.north west)rectangle(title.south east);
\draw[#4,fill=white,line width=2.75pt](title.west)circle({2*\tcboxedtitleheight/3});
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries,text=#4](P)at(title.west){#5};},
#1}
%%编号引理盒子%%
\DeclareDocumentEnvironment{Lemma}{ O{} }{\begin{box4}[step and label={@lem}{Lem.\the@prenumber.\the@lem}]{引理~\the@prenumber.\the@lem}[#1][ColorE][\faGlobe]}{\end{box4}}
\DeclareDocumentEnvironment{Corollary}{ O{} }{\begin{box4}[step and label={@colry}{Colry.\the@prenumber.\the@colry}]{推论~\the@prenumber.\the@colry}[#1][ColorG][\faCompactDisc]}{\end{box4}}
\DeclareDocumentEnvironment{Proposition}{ O{} }{\begin{box4}[step and label={@prop}{Prop.\the@prenumber.\the@prop}]{命题~\the@prenumber.\the@prop}[#1][ColorH][\faGlobe]}{\end{box4}}
%%不编号引理盒子%%
\DeclareDocumentEnvironment{Lemma*}{ O{} }{\begin{box4}{引理}[#1][ColorE][\faGlobe]}{\end{box4}}
\DeclareDocumentEnvironment{Corollary*}{ O{} }{\begin{box4}{推论}[#1][ColorG][\faCompactDisc]}{\end{box4}}
\DeclareDocumentEnvironment{Proposition*}{ O{} }{\begin{box4}{命题}[#1][ColorH][\faGlobe]}{\end{box4}}

\makeatother

%%设置拓展盒子%%
\DeclareTColorBox{box5}{O{} m O{ColorA} O{\faLink}}{
Box,before upper=\par,
frame style={left color=#3!50,right color=#3!50,middle color=#3},
title={\maxsizebox{\linewidth-2.0cm}{!}{#2}},
attach boxed title to top left={xshift=4.5mm,yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={empty,left=8.5mm,right=3.5mm,height=0.7cm,valign=center},
underlay boxed title={
\draw[white,fill=white,rounded corners=\tcboxedtitleheight/2,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#3,fill=#3,rounded corners=\tcboxedtitleheight/2,ultra thick](title.north west)rectangle(title.south east);
\fill[white,draw=white,line width=12.5pt](title.west)circle({2*\tcboxedtitleheight/3});
\fill[white,draw=#3,line width=2.75pt](title.west)circle({2*\tcboxedtitleheight/3});
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries,text=#3] at (title.west){#4};},
subtitle style={empty,top=-3.5mm,fontupper=\FontSize{12pt}\bfseries\centering\color{#3}},
#1}

\newenvironment{Link}{\begin{box5}{拓展链接}[ColorE][\faLink]}{\end{box5}}
\newenvironment{History}{\begin{box5}{科学发展史}[ColorC][\faCalendar*]}
{\end{box5}}
\newenvironment{STS}{\begin{box5}{科学·技术·社会}[ColorH][\faCog]}
{\end{box5}}

%%设置案例盒子%%
\DeclareTColorBox{box6}{O{} m O{ColorA} O{\faFile*}}{
Box,before upper=\par,
frame style={left color=#3!50,right color=#3!50,middle color=#3},
title={\maxsizebox{\linewidth-2.0cm}{!}{#2}},
attach boxed title to top left={xshift=4.5mm,yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={empty,left=8.5mm,right=3.5mm,height=0.7cm,valign=center},
underlay boxed title={
\draw[white,fill=white,rounded corners=\tcboxedtitleheight/2,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#3!90,fill=#3!90,rounded corners=\tcboxedtitleheight/2,ultra thick](title.north west)rectangle(title.south east);
\fill[white,draw=white,line width=12.5pt](title.west)circle({2*\tcboxedtitleheight/3});
\fill[white,draw=#3,line width=2.75pt](title.west)circle({2*\tcboxedtitleheight/3});
\draw[#3,line width=2.0pt]
([xshift={sqrt(3)*\tcboxedtitleheight/2}]title.north west)[rounded corners=\tcboxedtitleheight/2]--
(title.north east)[rounded corners=\tcboxedtitleheight/2]--
(title.south east)[sharp corners]--
([xshift={sqrt(3)*\tcboxedtitleheight/2}]title.south west) arc (-30:30:{\tcboxedtitleheight})--
cycle;
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries,text=#3] at (title.west){#4};},
subtitle style={empty,fontupper=\FontSize{12pt}\bfseries\color{#3}},
#1}

\newenvironment{Information}{\begin{box6}{资料卡片}[ColorI][\faFile*]}{\end{box6}}
\newenvironment{Application}{\begin{box6}{案例分析}[ColorA][\faTools]}{\end{box6}}
\newenvironment{Review}{\begin{box6}{知识回顾}[ColorC][\faFan]}{\end{box6}}

%%设置边注盒子%%
\DeclareTColorBox{box7}{smmm}{
enhanced standard,empty,
attach boxed title to top left={yshift=-0.25mm-\tcboxedtitleheight/2,yshifttext=2.0mm-\tcboxedtitleheight/2,xshift=5.0mm},
IfBooleanTF={#1}{
top=1.0mm,boxsep=0.25mm,left=0mm,right=0mm,boxsep=0mm,
fonttitle=\bfseries\FontSize{11pt}\color{#3},
fontupper=\itshape\fontsize{11pt}{0.75\baselineskip}\selectfont,
boxed title style={empty,top=2.0mm,bottom=2.0mm,left=0mm},
underlay boxed title={
\node[anchor=east,align=center,font=\bfseries\FontSize{12pt},text=#3,
inner sep=0mm](T)at([xshift=-0.75mm]title.west){#4};},
if odd page={grow to left by=0mm,grow to right by=5.0mm}
{grow to left by=5.0mm,grow to right by=0mm}
}{breakable,
top=2.0mm,bottom=0mm,left=0mm,right=0mm,boxsep=0mm,
fonttitle=\FontSize{12pt}\bfseries\color{#3},
fontupper=\itshape,
boxed title style={empty,top=2.0mm,bottom=2.0mm,left=1.0mm},
underlay boxed title={
\node[anchor=east,align=center,font=\bfseries\FontSize{15pt},text=#3,inner sep=0mm](T)at(title.west){#4};},
before=\par\noindent,after=\par},
title={\maxsizebox{\linewidth-1.0cm}{!}{#2}},
parbox=false,before upper=\par,before lower=\par}

\DeclareDocumentCommand{\RelaInfo}{sm}
{\IfBooleanTF{#1}
{\marginpar{\begin{box7}*{相关信息}{ColorH}{\faCommentDots}
#2
\end{box7}}}
{\begin{box7}{相关信息}{ColorH}{\faCommentDots}
#2
\end{box7}}}
\DeclareDocumentCommand{\DeepThink}{sm}
{\IfBooleanTF{#1}
{\marginpar{\begin{box7}*{深入思考}{ColorB!90!black}{\faTh}
#2
\end{box7}}}
{\begin{box7}{深入思考}{ColorB!90!black}{\faTh}
#2
\end{box7}}}
\DeclareDocumentCommand{\Remark}{sm}
{\IfBooleanTF{#1}
{\marginpar{\begin{box7}*{重点注释}{ColorF}{\faChrome}
#2
\end{box7}}}
{\begin{box7}{重点注释}{ColorF}{\faChrome}
#2
\end{box7}}}


\DeclareTColorBox{box8}{O{}O{}}{
enhanced standard,breakable,
pad before break=3.0mm,pad after break=5.0mm,
top=3.5mm,bottom=3.0mm,toptitle=4.0mm,bottomtitle=-2.5mm,
rounded corners,arc=7.5pt,
before=\par\noindent\medskip,after=\par\medskip,
parbox=false,before upper=\par,before lower=\par,
fonttitle=\FontSize{12pt}\bfseries\color{ColorA},
subtitle style={empty,fontupper=\FontSize{12pt}\bfseries\color{ColorA}},
title={#1},#2}

\makeatletter
\newenvironment{Proof}{\begin{box8}[\faBars~~证明]
[colframe=ColorB!7.5,colback=ColorB!7.5,colbacktitle=ColorB!7.5]}{\end{box8}}
\DeclareDocumentEnvironment{Block}{O{}}{\begin{box8}[#1][colframe=ColorB!7.5,colback=ColorB!7.5,colbacktitle=ColorB!7.5]}{\end{box8}}
\DeclareDocumentEnvironment{Block*}{O{}}{\begin{box8}[#1]
[empty,overlay={
\ifodd\value{page}
\draw[ColorB!7.5,fill=ColorB!7.5](frame.north east)[rounded corners=7.5pt]--(frame.south east)[sharp corners]--([xshift=-\@innerlen]frame.south west)[sharp corners]--([xshift=-\@innerlen]frame.north west)[rounded corners=7.5pt]--cycle;
\else
\draw[ColorB!7.5,fill=ColorB!7.5](frame.north west)[rounded corners=7.5pt]--(frame.south west)[sharp corners]--([xshift=\@innerlen]frame.south east)[sharp corners]--([xshift=\@innerlen]frame.north east)[rounded corners=7.5pt]--cycle;
\fi}]}{\end{box8}}
\makeatother


\DeclareTColorBox{box9}{O{} m m O{ColorA} O{}}{
Box,before upper=\par,left=10.0mm,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
attach boxed title to top left={yshift*=-\tcboxedtitleheight},
boxed title style={empty,top=1.25mm,left=3.5mm,right=3.5mm},
code={\colorlet{ListColor}{#4}},
underlay boxed title={
\begin{tcbclipinterior}
\fill[#4!7.5,draw=#4!7.5](frame.south west)rectangle([xshift=\tcboxedtitleheight]frame.north west);
\draw[#4!7.5,fill=#4!7.5](frame.north east)rectangle(title.south west);
\draw[#4,fill=#4](title.north west)--(title.north east)[rounded corners=5.0pt]--(title.south east)[sharp corners]--(title.south west)--cycle;
\end{tcbclipinterior}
\node[font=\bfseries,text=#4,anchor=west,inner xsep=3.5mm](T)at([yshift=-0.5mm]title.east){\maxsizebox{\linewidth-2.5cm}{!}{#3}};
\node[font=\bfseries,text=#4,anchor=east,inner xsep=5.0mm](ST)at([yshift={-\tcboxedtitleheight/2+0.5mm}]interior.north east){\maxsizebox{\linewidth/2-1.5cm}{!}{#5}};},
overlay middle and last={
\begin{tcbclipinterior}
\fill[#4!7.5,draw=#4!7.5](frame.south west)rectangle([xshift=\tcboxedtitleheight]frame.north west);
\end{tcbclipinterior}},
subtitle style={empty,fontupper=\FontSize{12pt}\bfseries\color{#4}},
title={#2},#1}

\newenvironment{Reading}[3]{\begin{box9}{阅读理解}{#1}[ColorB][\score{#2}{#3}[ColorB]]}{\end{box9}}
\newenvironment{Cloze}[3]{\begin{box9}{完形填空}{#1}[ColorA][\score{#2}{#3}[ColorA]]}{\end{box9}}
\newenvironment{Article}[3]{\begin{box9}{文本解读}{#1}[ColorC][\score{#2}{#3}[ColorC]]}{\end{box9}}


\DeclareTColorBox{box10}{O{} m m O{ColorA}}{
Box,before upper=\par,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
attach boxed title to top left={yshift*=-\tcboxedtitleheight},
boxed title style={empty,top=1.25mm,left=3.5mm,right=3.5mm},
underlay boxed title={
\begin{tcbclipinterior}
\draw[#4!7.5,fill=#4!7.5](frame.north east)rectangle(title.south west);
\draw[#4,fill=#4](title.north west)--(title.north east)[rounded corners=5.0pt]--(title.south east)[sharp corners]--(title.south west)--cycle;
\end{tcbclipinterior}
\node[font=\bfseries,text=#4,anchor=west,inner xsep=3.5mm](T)at([yshift=-0.5mm]title.east){\maxsizebox{\linewidth-2.5cm}{!}{#3}};},
subtitle style={frame hidden,colback=#4!7.5,
valign=center,height=\tcboxedtitleheight+0.75pt,
fontupper=\FontSize{12pt}\bfseries\color{#4}},
title={#2},#1}

\newenvironment{Vocabulary}[1]{\begin{box10}{词汇解析}{#1}[ColorE]}{\end{box10}}



%%修改代码盒子左侧行数样式%%
\renewcommand{\theFancyVerbLine}{\numberfont\FontSize{10pt}\color{ColorA}{\oldstylenums{\arabic{FancyVerbLine}}}}
%%定义代码盒子基本样式%%
\tcbset{Code/.style={
enhanced standard,breakable,
pad before break=3.0mm,pad after break=4.5mm,
rounded corners,arc=5.0pt,boxrule=2.25pt,
colback=ColorB!2.5,colframe=white,
top=3.0mm,bottom=2.5mm,left=10.0mm,
before=\par\noindent\medskip,after=\par\medskip,
parbox=false,before upper=\par,before lower=\par,
fonttitle=\FontSize{12pt}\bfseries\color{white},
frame style={left color=ColorA!50,right color=ColorA!50,middle color=ColorA},
attach boxed title to top left={yshift*=-\tcboxedtitleheight},
boxed title style={empty,top=1.25mm,left=3.5mm,right=3.5mm},
underlay boxed title={
\begin{tcbclipinterior}
\fill[ColorA!7.5,draw=ColorA!7.5](frame.south west)rectangle([xshift=\tcboxedtitleheight]frame.north west);
\draw[ColorA!7.5,fill=ColorA!7.5](frame.north east)rectangle(title.south west);
\draw[ColorA,fill=ColorA](title.north west)--(title.north east)[rounded corners=5.0pt]--(title.south east)[sharp corners]--(title.south west)--cycle;
\end{tcbclipinterior}},
overlay middle and last={
\begin{tcbclipinterior}
\fill[ColorA!7.5,draw=ColorA!7.5](frame.south west)rectangle([xshift=\tcboxedtitleheight]frame.north west);
\end{tcbclipinterior}},
subtitle style={empty,fontupper=\FontSize{12pt}\bfseries\color{ColorA}},
title={代码示例},
minted options={breaklines,autogobble,linenos,numbersep=5.5mm},
listing only,
listing engine=minted}}

\newcommand{\CodeSubtitle}[2]{
\node[font=\bfseries,text=ColorA,anchor=west,inner xsep=3.5mm](T)at([yshift=-0.5mm]title.east){\maxsizebox{\linewidth-2.5cm}{!}{#1}};
\node[font=\bfseries,text=ColorA,anchor=east,inner xsep=5.0mm](ST)at([yshift={-\tcboxedtitleheight/2}]interior.north east){\maxsizebox{\linewidth/2-1.5cm}{!}{#2}};}

\newtcblisting{PythonBox}[1]{
Code,minted language=python,
overlay unbroken and first={\CodeSubtitle{#1}{Python}}}

\newtcblisting{CppBox}[1]{
Code,minted language=cpp,
overlay unbroken and first={\CodeSubtitle{#1}{Cpp}}}

\newtcblisting{JavaBox}[1]{
Code,minted language=java,
overlay unbroken and first={\CodeSubtitle{#1}{Java}}}

%%盒子代码与实际效果对比%%
\newtcblisting{TCBCODE}{enhanced standard,breakable,
before=\par\noindent\medskip,after=\par\medskip,
colback=white,colbacklower=white,colframe=ColorH,
before lower=\bigskip,rounded corners,arc=5.0pt,boxrule=2.0pt}

%%数学公式小盒子%%
\newtcbox{\Formula}[1][]{nobeforeafter,math upper,tcbox raise base,
enhanced standard,breakable,colframe=ColorB!7.5,colback=ColorB!7.5,
rounded corners,arc=5.0pt,#1}


\makeatletter
%%重定义标题页%%
\renewcommand{\maketitle}{
\begin{titlepage}
\begin{tikzpicture}[remember picture,overlay]
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=-0.85cm]current page.north west);
\coordinate(F)at([xshift=-0.85cm,yshift=-0.85cm]current page.north east);
\coordinate(G)at([xshift=-0.85cm,yshift=0.85cm]current page.south east);
\coordinate(H)at([yshift=0.85cm]current page.south west);
%%背景%%
\draw[ColorB!5,fill=ColorB!5,sharp corners](D)rectangle(B);
\draw[ColorA!80,fill=ColorA!80](A)--(B)--(C)--(D)--(H)[rounded corners=5.0mm]--(G)[rounded corners=5.0mm]--(F)[sharp corners]--(E)--cycle;
\end{tikzpicture}
\begin{center}
\color{ColorA}\bfseries
%%书籍系列%%
\ifdefvoid{\@series}{}{
{\FontSize{15pt}\@series\par}}
\vskip1.75cm
%%标题%%
{\FontSize{55pt}\@title\par}
%%英文标题%%
\ifdefvoid{\@englishtitle}{}{
\vskip0.75cm
{\FontSize{20pt}\@englishtitle\par}}
%%副标题%%
\ifdefvoid{\@subtitle}{}{
\vskip1.0cm
{\FontSize{30pt}\@subtitle\par}}
%%英文副标题%%
\ifdefvoid{\@englishsubtitle}{}{
\vskip0.25cm
{\FontSize{15pt}\@englishsubtitle\par}}
%%版本号%%
\ifdefvoid{\@version}{}{
\vskip0.75cm
{\FontSize{20pt}第{\@version}版\par}}
\vskip0.75cm
%%作者%%
{\FontSize{15pt}主编\quad\@author\par}
\vfill
%%出版社%%
{\FontSize{15pt}\ifdefvoid{\@presslogo}{}{\raisebox{-0.2cm}{\mbox{\includegraphics[width=0.75cm]{\@presslogo}}}}\hskip0.25cm\@pressname\par}
\end{center}
\end{titlepage}}

%%设计封面%%
\newcommand{\ifetdef}{
\maxsizebox{\paperwidth}{!}{\ifdefvoid{\@englishtitle}{}{\@englishtitle}}
}
\newcommand{\makecover}{
\tikzset{coverup node/.style={text=ColorA,anchor=north west,inner sep=0mm},
coverdown node/.style={text=white,anchor=west,inner sep=0mm},
opacity node/.style={anchor=north west,font=\FontSize{100pt}\bfseries,text=ColorB!25}
}
\begin{titlepage}
\begin{tikzpicture}[remember picture,overlay]
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=5.25cm]current page.west);
\coordinate(F)at([yshift=5.25cm]current page.east);
\coordinate(G)at($0.5*(E)+0.5*(C)$);
%%背景1%%
\draw[ColorB!5,fill=ColorB!5,sharp corners](D)rectangle(B);
%%半透明文字%%
\node[opacity node,text opacity=1.0](O_1)at(A){\ifetdef};
\foreach \x[evaluate=\x as \botpoint using int(\x-1),
evaluate=\x as \opa using 1.2-0.2*\x] in {2,...,10}{
\node[opacity node,text opacity=\opa](O_\x)at(O_\botpoint.south west){\ifetdef};}
%%背景2%%
\draw[ColorA!80,fill=ColorA!80](E)rectangle(C);
%%封面图%%
\node[inner sep=0mm,anchor=center](CI)at(G){\ifdefvoid{\@coverimage}{}{\includegraphics[width=\paperwidth,height=\paperheight/2+5.25cm]{\@coverimage}}};
%%标题%%
\node[font=\FontSize{55pt}\bfseries,coverup node](T)at(current page text area.north west){\@title};
%%英文标题%%
\node[font=\FontSize{20pt}\bfseries,coverup node](ET)at([yshift=-0.5cm]T.south west){\ifdefvoid{\@englishtitle}{}{\@englishtitle}};
%%副标题%%
\node[font=\FontSize{30pt}\bfseries,coverup node](ST)at([yshift=-0.5cm]ET.south west){\ifdefvoid{\@subtitle}{}{\@subtitle}};
%%英文副标题%%
\node[font=\FontSize{15pt}\bfseries,coverup node](EST)at([yshift=-0.5cm]ST.south west){\ifdefvoid{\@englishsubtitle}{}{\@englishsubtitle}};
%%作者%%
\node[font=\FontSize{15pt}\bfseries,coverdown node](A)at([yshift=4.0cm]current page text area.west){主编\quad\@author};
%%出版社%%
\node[coverdown node](PL)at(current page text area.south west){\ifdefvoid{\@presslogo}{}{\includegraphics[width=0.75cm]{\@presslogo}}};
\node[font=\FontSize{15pt}\bfseries,coverdown node](PN)at([xshift=0.25cm]PL.east){\ifdefvoid{\@pressname}{}{\@pressname}};
\end{tikzpicture}
\end{titlepage}}

%%设计封底%%
\newcommand{\ifestdef}{
\maxsizebox{\paperwidth}{!}{\ifdefvoid{\@englishsubtitle}{}{\@englishsubtitle}}
}
\NewDocumentCommand{\makeback}{oo}{
\tikzset{backup node/.style={text=ColorA,anchor=north east,inner sep=0mm,text width=\textwidth},
backdown node/.style={text=white,anchor=west,inner sep=0mm},
opacity node/.style={anchor=north east,font=\FontSize{100pt}\bfseries,text=ColorB!25}}
\begin{titlepage}
\begin{tikzpicture}[remember picture,overlay]
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=5.25cm]current page.west);
\coordinate(F)at([yshift=5.25cm]current page.east);
\coordinate(G)at($0.5*(E)+0.5*(C)$);
%%背景1%%
\draw[ColorB!5,fill=ColorB!5,sharp corners](D)rectangle(B);
%%半透明文字%%
\node[opacity node,text opacity=1.0](O_1)at(B){\ifestdef};
\foreach \x[evaluate=\x as \botpoint using int(\x-1),
evaluate=\x as \opa using 1.2-0.2*\x] in {2,...,10}{
\node[opacity node,text opacity=\opa](O_\x)at(O_\botpoint.south east){\ifestdef};}
%%背景2%%
\draw[ColorA!80,fill=ColorA!80](E)rectangle(C);
%%封底图%%
\node[inner sep=0mm,anchor=center](BI)at(G){\ifdefvoid{\@backimage}{}{\scalebox{-1}[1]{\includegraphics[width=\paperwidth,height=\paperheight/2+5.25cm]{\@backimage}}}};
%%条形码%%
\IfValueTF{#2}{
\node[draw=white,fill=white,inner xsep=0mm,anchor=south east](BC)at([yshift=-0.5cm]current page text area.south east){\includegraphics[width=5.0cm]{#2}};}{\relax}
%%说明文字%%
\node[font=\FontSize{12pt}\bfseries,backup node](BT)at(current page text area.north east){\hspace*{2.0em}#1};
%%书籍系列%%
\node[font=\FontSize{15pt}\bfseries,backdown node](S)at([yshift=4.0cm]current page text area.west){\ifdefvoid{\@series}{}{\@series}};
%%书籍系列%%
\node[font=\FontSize{15pt}\bfseries,backdown node](V)at([yshift=-0.5cm]S.south west){\ifdefvoid{\@version}{}{第{\@version}版}};
\end{tikzpicture}
\end{titlepage}}

%%设计书脊%%
\NewDocumentCommand{\makespine}{O{1.0cm}}{
\newlength{\SpineWidth}
\setlength{\SpineWidth}{#1}
\tikzset{spine title/.style={font=\FontSize{20pt}\bfseries,text=white,text width=1.0cm,align=center},
spine subtitle/.style={font=\FontSize{15pt}\bfseries,text=white,text width=1.0cm,align=center},
spine englishtitle/.style={font=\FontSize{20pt}\bfseries,text=ColorA,inner sep=0mm}}
\begin{titlepage}
\begin{tikzpicture}[remember picture,overlay]
\coordinate(A)at(current page.north);
\coordinate(B)at(current page.south);
\coordinate(C)at([yshift=5.25cm]current page.center);
%%背景%%
\draw[ColorB!5,fill=ColorB!5]
([xshift=-\SpineWidth/2]A)rectangle([xshift=\SpineWidth/2]B);
\draw[ColorA!80,fill=ColorA!80]
([xshift=-\SpineWidth/2]C)rectangle([xshift=\SpineWidth/2]B);
%%书脊英文标题%%
\node[spine englishtitle,anchor=north](ET)at([yshift=-0.5cm]A){\ifdefvoid{\@englishtitle}{}{\rotatebox[origin=c]{-90}{\maxsizebox{\paperheight/2-5.25cm}{\SpineWidth}{\@englishtitle}}}};
%%书脊标题%%
\node[spine title,anchor=north](T)at([yshift=-0.5cm]C){\@title};
%%书脊副标题%%
\node[spine subtitle,anchor=north](ST)at([yshift=-0.5cm]T.south){\ifdefvoid{\@subtitle}{}{\@subtitle}};
%%书脊出版社名称%%
\node[spine subtitle,anchor=south](PN)at([yshift=0.5cm]B){\ifdefvoid{\@pressname}{}{\@pressname}};
%%书脊出版社logo%%
\node[spine subtitle,anchor=south](PL)at([yshift=0.25cm]PN.north){\ifdefvoid{\@presslogo}{}{\includegraphics[width=0.8cm]{\@presslogo}}};
\end{tikzpicture}
\end{titlepage}}

\makeatother


