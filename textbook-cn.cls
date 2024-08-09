% !TEX program = xelatex
% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{textbook-cn}[By Lyu Guanlin]

%%%%%%%%%%%%%%%%%%%% 自定义命令宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{xkeyval,kvoptions,etoolbox,ifthen,xifthen,xparse}%设置键和键值%自定义命令
\SetupKeyvalOptions{family=TextBook,prefix=TextBook@,setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{TextBook}{#1}}
%%声明颜色键及默认值%%
\DeclareStringOption[blue]{color}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{red}{\ekv{color=red}}
\DeclareVoidOption{purple}{\ekv{color=purple}}
\DeclareVoidOption{gray}{\ekv{color=gray}}
\DeclareVoidOption{orange}{\ekv{color=orange}}
\DeclareVoidOption{yellow}{\ekv{color=yellow}}
\DeclareVoidOption{colorful}{\ekv{color=colorful}}
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

\makeatletter
%%定义书籍信息%%
\newcommand*{\coverimage}[1]{\def\@coverimage{#1}}
\newcommand*{\backimage}[1]{\def\@backimage{#1}}
\newcommand*{\series}[1]{\def\@series{#1}}
\newcommand*{\version}[1]{\def\@version{#1}}
\newcommand*{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand*{\englishtitle}[1]{\def\@englishtitle{\MakeUppercase{#1}}}
\newcommand*{\englishsubtitle}[1]{\def\@englishsubtitle{\MakeUppercase{#1}}}
\newcommand*{\presslogo}[1]{\def\@presslogo{#1}}
\newcommand*{\pressname}[1]{\def\@pressname{#1}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 字体设置 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[fontset=none]{ctex}%中文文本
\RequirePackage[T1]{fontenc}%字体设置宏包
%\RequirePackage{fontspec}%字体设置宏包
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
\newcommand{\numberfont}{\rmfamily}
\NewDocumentCommand{\FontSize}{O{1.0} m}{\fontsize{#2}{#1\baselineskip}\selectfont}
\newcommand{\titlefont}{\dbsong}
\newcommand{\contentfont}{\xbsong}
%%字号设置%%
\newcommand{\PartLabelFont}{\titlefont\bfseries\FontSize[1.5]{34pt}}%部分标签字体
\newcommand{\PartNameFont}{\titlefont\bfseries\FontSize[1.5]{32pt}}%部分名称字体
\newcommand{\ChapterLabelFont}{\titlefont\bfseries\FontSize[1.2]{27pt}}%章标签字体
\newcommand{\ChapterNameFont}{\titlefont\bfseries\FontSize[1.2]{25pt}}%章名称字体
\newcommand{\SectionLabelFont}{\titlefont\bfseries\FontSize{18pt}}%节标签字体
\newcommand{\SectionNameFont}{\titlefont\bfseries\FontSize{18pt}}%节名称字体
\newcommand{\SubsectionLabelFont}{\titlefont\bfseries\FontSize{16pt}}%小节标签字体
\newcommand{\SubsectionNameFont}{\titlefont\bfseries\FontSize{16pt}}%小节名称字体
\newcommand{\SubsectionSubTFont}{\titlefont\bfseries\FontSize{14pt}}
\newcommand{\SubsubsectionLabelFont}{\titlefont\bfseries\FontSize{25pt}}%小小节标签字体
\newcommand{\SubsubsectionNameFont}{\titlefont\bfseries\FontSize{14.5pt}}%小小节名称字体
\newcommand{\ParagraphNameFont}{\titlefont\bfseries\FontSize{14pt}}%段落名称字体
\newcommand{\HeaderFont}{\titlefont\bfseries\FontSize{13pt}}%页眉字体
\newcommand{\FooterFont}{\titlefont\bfseries\FontSize{13pt}}%页脚字体
\newcommand{\PageNumberFont}{\numberfont\bfseries\FontSize{16pt}}%页码字体
\newcommand{\PageSideFont}{\titlefont\bfseries\FontSize{15pt}}%侧标字体
\newcommand{\CaptionFont}{\contentfont\bfseries\FontSize[1.5]{12pt}}%图表标签字体
\newcommand{\TocPartFont}{\titlefont\bfseries\FontSize{15pt}}%目录部分字体
\newcommand{\TocChapterFont}{\titlefont\bfseries\FontSize{14pt}}%目录章字体
\newcommand{\TocSectionFont}{\contentfont\FontSize{14pt}}%目录节字体
\newcommand{\LofFont}{\contentfont\FontSize{14pt}}%图列表字体
\newcommand{\LotFont}{\contentfont\FontSize{14pt}}%表列表字体
\newcommand{\LTocTitleFont}{\titlefont\bfseries\FontSize{14pt}}%小目录标题
\newcommand{\TocLChapterFont}{\titlefont\bfseries\FontSize{14pt}}%小目录章字体
\newcommand{\TocLSectionFont}{\contentfont\FontSize{14pt}}%小目录节字体
\newcommand{\ContentPageNumFont}{\numberfont\bfseries\FontSize{14pt}}%目录页码字体
\newcommand{\CiteNumFont}{\numberfont}%引用字体
\newcommand{\LineNumFont}{\numberfont\bfseries\FontSize{12pt}}%行号字体
\newcommand{\ListNumFont}{\numberfont\bfseries\FontSize{12pt}}%列表序号字体
\newcommand{\ExerciseTitleFont}{\titlefont\bfseries\FontSize{15pt}}%练习标题字体
\newcommand{\EgLabelFont}{\titlefont\bfseries\FontSize{14pt}}%例题标签字体
\newcommand{\BoxTitleFont}{\titlefont\bfseries\FontSize{14.5pt}}%盒子标题字体
\newcommand{\BoxSubtitleFont}{\titlefont\bfseries\FontSize{14pt}}%盒子副标题字体

%%设置字体%%
\AtBeginDocument{\setmainfont{Times New Roman}}

%%%%%%%%%%%%%%%%%%%% 页面布局设定宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{ragged2e}%对齐设置
%%页面布局设置%%0.75em
\makeatletter
\newlength{\@innerlen}
\newlength{\@outerlen}
\newlength{\@toplen}
\newlength{\@botlen}
\newlength{\@marginparwidthlen}
\newlength{\@marginparseplen}
\newlength{\@handseplen}
\newlength{\@footskiplen}
\setlength{\@innerlen}{2.5cm}
\setlength{\@outerlen}{2.25cm}
\setlength{\@toplen}{2.5cm}
\setlength{\@botlen}{2.5cm}
\setlength{\@marginparwidthlen}{0.25\textwidth+2.0em}
\setlength{\@marginparseplen}{-\@marginparwidthlen+0.75em}
\setlength{\@handseplen}{0.875cm}
\setlength{\@footskiplen}{0.95cm}
\RequirePackage[letterpaper,
inner=\@innerlen,outer=\@outerlen,top=\@toplen,bottom=\@botlen,
headsep=\@handseplen,footskip=\@footskiplen,
marginparsep=\@marginparseplen,marginparwidth=\@marginparwidthlen,reversemarginpar]{geometry}
\makeatother
\RequirePackage{emptypage,setspace,fancyhdr,lscape}%清除空页%行距%页眉页脚%旋转页面
\RequirePackage{extramarks}%创建额外的标记，使用方法类似于\markboth和\markright
\RequirePackage[strict]{changepage}%换页
\RequirePackage[noadjust]{marginnote}%边注
\RequirePackage{multicol,paracol}%双栏%分栏、边注、中英对照
\columnratio{0.75}
\footnotelayout{c}
\twosided[pcm]
%%设置栏间距和分割线颜色%%
\setlength{\columnsep}{2.0em}
\setlength{\columnseprule}{0em}
\renewcommand{\columnseprulecolor}{\color{ColorA}}
%%设置默认正文分栏环境%%
\newenvironment{Paracol}[1][2]{
\begin{paracol}{#1}
}{\end{paracol}}
%%脚注格式%%
\gdef\footnoterule{}
\gdef\footnotesize{\FontSize[0.8]{12pt}\itshape}

%%%%%%%%%%%%%%%%%%%% 图表插入宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}%插入图片路径
\RequirePackage[labelsep=colon]{caption}%图表标签
\RequirePackage[labelsep=colon,labelformat=simple]{subcaption}%图表标签
%%设置图片和表格格式%%
\captionsetup[figure]{name={{\color{ColorA!50}\FontSize{11pt}\faSquare}~图}}
\captionsetup[table]{name={{\color{ColorA!50}\FontSize{11pt}\faSquare}~表}}
\renewcommand{\subfigurename}{图}
\renewcommand{\subtablename}{表}
\renewcommand{\captionfont}{\color{ColorA}\CaptionFont}

%%定义非浮动体标签%%
\newcommand{\figcaption}{\setcaptiontype{figure}\caption} 
\newcommand{\tabcaption}{\setcaptiontype{table}\caption}
%%设置边注中的图片和表格%%
\makeatletter
\newcommand{\marginpic}[2]{
\marginpar{
\centering\includegraphics[width=\@marginparwidthlen-0.5em]{#1}
\centering\figcaption{#2}}}
\newcommand{\margintab}[2]{
\marginpar{
\centering{#1}
\centering\tabcaption{#2}}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 目录宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[explicit,newparttoc,notocpart*]{titlesec}%设置标题格式
\RequirePackage{titletoc}%目录格式设置
\RequirePackage{shorttoc}%简洁目录设置
\def\shorttocname#1{#1}%定义简洁目录标题宏
\renewcommand{\contentsname}{目录}%更改目录标题
\renewcommand{\listfigurename}{插图目录}%更改图片目录标题
\renewcommand{\listtablename}{表格目录}%更改表格目录标题
\renewcommand{\shorttocname}{内容概览}%更改简洁目录标题

\makeatletter
%%重定义\tableofcontents%%
\RenewDocumentCommand{\tableofcontents}{s O{}}{
\begingroup%确保计数器值只在局部生效
\chapter*{\contentsname}
\c@tocdepth=1%预设目录深度为1
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{toc}
\switchcolumn
#2
\end{paracol}}
{\@starttoc{toc}}
\endgroup}
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
\chapter*{\shorttocname}
\c@tocdepth=0%预设目录深度为0
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
\renewcommand{\citenumfont}[1]{\color{ColorA}\CiteNumFont#1}%修改引用样式
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
\RequirePackage[splitindex]{imakeidx}%索引设置，splitindex参数自动分割索引\\Large
%%索引风格文件indexstyle.ist%%
\begin{filecontents}[overwrite]{indexstyle.ist}
headings_flag 1
heading_prefix "\n\\centering\\bfseries\\color{ColorA}"
heading_suffix "\\normalfont\\color{black}\\nopagebreak\n"
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
\RequirePackage{amsmath,amsfonts,amssymb,mathrsfs,array,bm,upgreek}%数学宏包

%%%%%%%%%%%%%%%%%%%% 盒子和列表宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[most]{tcolorbox}%彩色盒子
\tcbuselibrary{xparse}
\tcbuselibrary{minted}
\RequirePackage{empheq}%数学公式盒子
\RequirePackage{adjustbox,varwidth}%自动调整字体大小的盒子%固定可变长度盒子
\RequirePackage{enumitem,hlist}%控制列表环境格式%对齐列表环境
%%设置列表参数%%
\setlength{\itemsep}{0pt}
\setlength{\parsep}{0pt}
\setlength{\parskip}{0pt}
\RequirePackage{listings,minted}%伪代码环境
\usemintedstyle{xcode}
%为了使宏包minted正常工作，需要在xelatex编译器参数中添加-shell-escape
\RequirePackage{lineno}%行号宏包
\renewcommand{\linenumberfont}{\color{ColorA}\LineNumFont}%修改行号字体
\setlength{\linenumbersep}{5.5mm}%修改行号与正文的间距

%%%%%%%%%%%%%%%%%%%% 绘图与表格宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{pifont,fontawesome5}%图标
\RequirePackage{anyfontsize}%自由调整字体大小
\RequirePackage{tabularx,colortbl,array,tabularray,booktabs,multirow}%表格
\RequirePackage{pgfplots,tikzpagenodes,tikz,eso-pic}%绘图
\usetikzlibrary{fit,calc,scopes,backgrounds,positioning,intersections,decorations,shadows,
shadings,fadings,arrows,arrows.meta,patterns.meta,patterns,shapes.geometric,decorations.footprints}
\RequirePackage{calc}%优化长度计算和设置
\makeatletter
%%修改addtolength的作用域%%
\newcommand{\gaddtolength}[1]{\calc@assign@skip{\global\advance#1}}
%%修改setlength的作用域%%
\gdef\gsetlength#1#2{%
\begingroup
\setlength\skip@{#2}
\global#1=\skip@
\endgroup}
%%测量节点尺寸%%
%%
\def\pgfgetnodeheight(#1)#2{
\path($(#1.south)-(#1.north)$);
\pgfmathsetmacro#2{veclen(\pgf@x, \pgf@y)}
\edef#2{#2pt}}
%%
\def\pgfgetnodewidth(#1)#2{
\path($(#1.east)-(#1.west)$);
\pgfmathsetmacro#2{veclen(\pgf@x, \pgf@y)}
\edef#2{#2pt}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 超链接宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{url}%超链接
\RequirePackage{xr}%文件之间的交叉引用
\RequirePackage[hidelinks,pagebackref]{hyperref}%超链接设置
\RequirePackage{cleveref}%带前缀名称引用，必须放在hyperref之后

%%%%%%%%%%%%%%%%%%%% 计数器宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{zhnumber,totcount}%中文计数器%获取计数器的最大值
%%定义计数器%%
\setcounter{secnumdepth}{3}
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
\renewcommand{\thesubfigure}{\thefigure.\Alph{subfigure}}
\renewcommand{\thesubtable}{\thetable.\Alph{subtable}}
\renewcommand{\thepart}{\arabic{part}}
\renewcommand{\thesection}{\arabic{section}}

%%%%%%%%%%%%%%%%%%%% 列表环境 %%%%%%%%%%%%%%%%%%%%%%
%%设置题号%%
\newcommand*\cir[1]{\tikz[baseline=($0.3*(current bounding box.west)+0.7*(current bounding box.south west)$)]{\node[shape=circle,fill=ListColor,draw=ListColor,
minimum size=5.0mm,align=center,inner sep=0pt,
font=\ListNumFont,text=white]{\maxsizebox{4.5mm}{!}{#1}};}}
%%设置概念序号%%
\newcommand*\preconcept{\raisebox{-0.05em}{\tikz{\draw[ListColor,fill=white,line width=2.5pt](0,0)circle(1.5mm);}}}
%%概念列表环境%%
\newenvironment{Concept}{\begin{multicols}{2}\itshape\begin{itemize}[label=\protect\preconcept,itemindent=-0.5em]}{\end{itemize}\end{multicols}\global\colorlet{ListColor}{ColorA}}
%%题目列表环境%%
\newenvironment{QsNum}{\begin{enumerate}[label=\protect\cir{\arabic*}]}
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
{\begin{hlist}[pre skip=0pt,item skip=0pt,item offset={1.5em},label={\textbf{\color{ListColor}{\Alpha{hlisti}.}}},pre label={}]1
\hitem #1
\hitem #2
\hitem #3
\hitem #4
\end{hlist}}
{\ifthenelse{\lengthtest{\lmax>\lquarter}}
{\begin{hlist}[pre skip=0pt,item skip=0pt,item offset={1.5em},label={\textbf{\color{ListColor}{\Alpha{hlisti}.}}},pre label={}]2
\hitem #1
\hitem #2
\hitem #3
\hitem #4
\end{hlist}}
{\begin{hlist}[\parskip=0pt,pre skip=0pt,item skip=0pt,item offset={1.5em}, label={\textbf{\color{ListColor}{\Alpha{hlisti}.}}},pre label={}]4
\hitem #1
\hitem #2
\hitem #3
\hitem #4
\end{hlist}}
}}

%%%%%%%%%%%%%%%%%% 页面样式 %%%%%%%%%%%%%%%%%%%%%%%%
%%定义部分总数（序言、前言视作一个部分，目录、插图目录、表格目录视作一个部分，绪论、有编号部分、无编号部分以及后记）,编译两次可以得到正确的页面框架%%
%%页眉和侧标的默认值%%
\makeatletter
\newcommand{\DefaultMark}{
\markboth{\protect\@title}{\protect\@title}
\extramarks{\protect\@title}{\protect\@title}}
\makeatother
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
{\setlength{\SepH}{\dimexpr(\paperheight-2\DeltaH)/\totvalue{@pagesidenumber}}%设置侧标每次移动的距离
\setlength{\MarkY}{-\DeltaH}%设置侧标上下两侧锚点坐标的初值
\DefaultMark
\makeatother}}
%%绘制页面框架%%
\makeatletter
\newlength{\FrameWidth}
\setlength{\FrameWidth}{1.0cm}
\newlength{\PageNumLen}
\setlength{\PageNumLen}{\@toplen-\@handseplen+0.1cm}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{
\if@mainmatter
\markboth{第~\thechapter~章\quad#1}{第~\thechapter~章\quad#1}
\else
\markboth{#1}{#1}
\fi}
\renewcommand{\sectionmark}[1]{\markright{第~\thesection~节\quad#1}}

%%绘制主页面样式%%
\newcommand{\@mainpageframe}{
\begin{tikzpicture}[remember picture,overlay]
%%根据页数的奇偶生成%%
\ifodd\value{page}
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=\FrameWidth]current page.south west);
\coordinate(F)at([xshift=-\FrameWidth,yshift=\FrameWidth]current page.south east);
\coordinate(G)at([xshift=-\FrameWidth,yshift=-\FrameWidth]current page.north east);
\coordinate(H)at([yshift=-\FrameWidth]current page.north west);
%%绘制页面框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)--cycle;
%%绘制页码%%
\draw[ColorA,fill=ColorA,line width=1.0pt]
([xshift=-\@outerlen+0.25cm]B)[rounded corners=1.5mm]--
([xshift=-\@outerlen+0.25cm,yshift=-\PageNumLen]B)[rounded corners=1.5mm]--
([xshift=-\FrameWidth+0.15cm,yshift=-\PageNumLen]B)[sharp corners]--
([xshift=-\FrameWidth+0.15cm]B)--cycle;
\node[font=\PageNumberFont,text=white,anchor=south,align=center,inner ysep=2.0mm](P)at([xshift=-\@outerlen/2-0.3cm,yshift=-\PageNumLen]B){\maxsizebox{0.8cm}{!}{\thepage}};
%%绘制侧标%%
\draw[draw=ColorA,fill=ColorA,sharp corners,line width=1.0pt]node[append after command={(T.north west)--(T.north east)--(T.south east)[rounded corners=1.75mm]--(T.south west)[rounded corners=1.75mm]--cycle},font=\PageSideFont,text=white,text width=\FrameWidth-2.0mm,align=center,inner xsep=1.5mm,inner ysep=3.5mm,anchor=east](T)at([yshift=\MarkY]B){\rotatebox[origin=c]{90}{\maxsizebox{\DeltaH}{!}{\lastxmark}}};
\else
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=\FrameWidth]current page.south east);
\coordinate(F)at([xshift=\FrameWidth,yshift=\FrameWidth]current page.south west);
\coordinate(G)at([xshift=\FrameWidth,yshift=-\FrameWidth]current page.north west);
\coordinate(H)at([yshift=-\FrameWidth]current page.north east);
%%绘制页面框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)--cycle;
%%绘制页码%%
\draw[ColorA,fill=ColorA,line width=1.0pt]
([xshift=\@outerlen-0.25cm]B)[rounded corners=1.5mm]--
([xshift=\@outerlen-0.25cm,yshift=-\PageNumLen]B)[rounded corners=1.5mm]--
([xshift=\FrameWidth-0.15cm,yshift=-\PageNumLen]B)[sharp corners]--
([xshift=\FrameWidth-0.15cm]B)--cycle;
\node[font=\PageNumberFont,text=white,anchor=south,align=center,inner ysep=2.0mm](P)at([xshift=\@outerlen/2+0.3cm,yshift=-\PageNumLen]B){\maxsizebox{0.8cm}{!}{\thepage}};
%%绘制侧标%%
\draw[draw=ColorA,fill=ColorA,sharp corners,line width=1.0pt]node[append after command={(T.north west)[rounded corners=1.75mm]--(T.north east)[rounded corners=1.75mm]--(T.south east)[sharp corners]--(T.south west)--cycle},font=\PageSideFont,text=white,text width=\FrameWidth-2.0mm,align=center,inner xsep=1.5mm,inner ysep=3.5mm,anchor=west](T)at([yshift=\MarkY]B){\rotatebox[origin=c]{270}{\maxsizebox{\DeltaH}{!}{\firstxmark}}};
\fi
\end{tikzpicture}}

%%定义主页面样式%%
\fancypagestyle{MainPage}{
\fancyhead{}
\fancyfoot{}
\fancyfoot[C]{\@mainpageframe}
\fancyhead[RO]{\HeaderFont\color{ColorA}\rightmark}
\fancyhead[LE]{\HeaderFont\color{ColorA}\leftmark}
}
%%绘制其他页面样式%%
\newcommand{\@subpageframe}{
\begin{tikzpicture}[remember picture,overlay]
%%绘制页面框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,sharp corners]
(current page.north west)rectangle([yshift=-1.0cm]current page.north east);
\draw[fill=ColorB!7.5,ColorB!7.5,sharp corners]
(current page.south west)rectangle([yshift=1.0cm]current page.south east);
%%根据页数的奇偶生成%%
\ifodd\value{page}
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
%%绘制页眉%%
\node[draw=ColorA,fill=ColorA,font=\HeaderFont,text=white,
inner xsep=3.75mm,minimum height=7.5mm,rounded corners=3.75mm,
anchor=east,align=right](H)at([xshift=-\@outerlen+1.0mm,yshift=-1.0cm]B){\maxsizebox{\textwidth-7.5mm}{!}{\rightmark}};
%%绘制页码%%
\node[draw=ColorA,fill=ColorA,font=\PageNumberFont,text=white,
inner xsep=3.75mm,minimum height=7.5mm,rounded corners=3.75mm,
anchor=east,align=right](P)at([xshift=-\@outerlen+1.0mm,yshift=1.0cm]C){\maxsizebox{0.8cm}{!}{\thepage}};
\if@mainmatter
%%绘制侧标%%
\draw[draw=ColorA,fill=ColorA,sharp corners,line width=1.0pt]node[append after command={(T.east)--([yshift=1.2cm]T.east) arc (90:270:1.2cm)--cycle},font=\PageSideFont,text=white,align=center,text width=6.0mm,
inner xsep=1.5mm,inner ysep=3.5mm,anchor=east](T)at([yshift=\MarkY]B){\rotatebox[origin=c]{90}{\maxsizebox{1.7cm}{!}{\lastxmark}}};
\fi\else
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
%%绘制页眉%%
\node[draw=ColorA,fill=ColorA,font=\HeaderFont,text=white,
inner xsep=3.75mm,minimum height=7.5mm,rounded corners=3.75mm,
anchor=west,align=left](H)at([xshift=\@outerlen-1.0mm,yshift=-1.0cm]B){\maxsizebox{\textwidth-7.5mm}{!}{\leftmark}};
%%绘制页码%%
\node[draw=ColorA,fill=ColorA,font=\PageNumberFont,text=white,
inner xsep=3.75mm,minimum height=7.5mm,rounded corners=3.75mm,
anchor=west,align=left](P)at([xshift=\@outerlen-1.0mm,yshift=1.0cm]C){\maxsizebox{0.8cm}{!}{\thepage}};
\if@mainmatter
%%绘制侧标%%
\draw[draw=ColorA,fill=ColorA,sharp corners,line width=1.0pt]node[append after command={(T.west)--([yshift=1.2cm]T.west) arc (90:-90:1.2cm)--cycle},font=\PageSideFont,text=white,align=center,text width=6.0mm,
inner xsep=1.5mm,inner ysep=3.5mm,anchor=west](T)at([yshift=\MarkY]B){\rotatebox[origin=c]{270}{\maxsizebox{1.7cm}{!}{\firstxmark}}};
\fi\fi
\end{tikzpicture}}
%%定义其他页面样式%%
\fancypagestyle{SubPage}{
\fancyhead{}
\fancyfoot{}
\fancyfoot[C]{\@subpageframe}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 书籍层次样式 %%%%%%%%%%%%%%%%%%%%%%
%%部分页样式%%
%%编号部分页样式%%
\makeatletter
\newlength{\StripeWidth}
\newlength{\BlockWidth}
\newlength{\NBlockHeight}
\newlength{\MBlockLength}
\newlength{\MDarkBlockLen}
\setlength{\StripeWidth}{0.35cm}
\setlength{\BlockWidth}{1.75cm}
\setlength{\NBlockHeight}{7.0cm}
\setlength{\MBlockLength}{4.0cm}
\setlength{\MDarkBlockLen}{5.6cm}
%%
%%部分介绍%%
\newcommand*{\partintro}[1]{\def\@partintro{\hspace*{2.0em}#1}}
%%
%%奇数页布局%%
\newcommand{\OddPartPageBlock}[2]{
%%右上角色块坐标%%
\coordinate(A)at(current page.north east);
\coordinate(B)at([xshift=-\BlockWidth]current page.north east);
\coordinate(C)at([xshift=-\BlockWidth,yshift=-\NBlockHeight]current page.north east);
\coordinate(D)at([yshift=-\NBlockHeight]current page.north east);
%%右上角色块%%
\draw[ColorA,fill=ColorA](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\StripeWidth]D);
\coordinate(R)at([xshift=-\MBlockLength]Q);
\coordinate(T)at([yshift=-\BlockWidth]Q);
\coordinate(S)at([xshift=-\MBlockLength]T);
%%右侧色块%%
\draw[ColorB!20,fill=ColorB!20](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\StripeWidth]T);
\coordinate(F)at([xshift=-\BlockWidth]E);
\coordinate(H)at(current page.south east);
\coordinate(G)at([xshift=-\BlockWidth]H);
%%右下角色块%%
\draw[ColorA,fill=ColorA](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
%%左上角色块坐标%%
\coordinate(I)at([xshift=-\StripeWidth]B);
\coordinate(J)at(current page.north west);
\coordinate(K)at([yshift=-\NBlockHeight]J);
\coordinate(L)at([xshift=-\StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=-\StripeWidth]F);
\coordinate(N)at([xshift=-\paperwidth]E);
\coordinate(O)at(current page.south west);
\coordinate(P)at([xshift=-\StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=-\StripeWidth]R);
\coordinate(X)at([xshift=-\StripeWidth]S);
%%部分编号%%
\node[align=right,anchor=south east,font=\PartLabelFont,text=ColorA,inner xsep=0mm](NL)at([yshift=\StripeWidth+0.25cm]U){\begin{varwidth}{\textwidth-5.0cm}#1\end{varwidth}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(NL)\NLWidth
\coordinate(V)at([xshift=-\NLWidth]U);
\coordinate(W)at([xshift=-\NLWidth]X);
%%
%%页面中部色块%%
\draw[ColorB!50,fill=ColorB!50,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=-\StripeWidth]V);
\coordinate(Z)at([yshift=-\StripeWidth]K);
\coordinate(YY)at([yshift=\StripeWidth]N);
\coordinate(ZZ)at([xshift=-\StripeWidth]W);
%%左侧色块%%
\draw[ColorB!20,fill=ColorB!20](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%部分名%%
\node[align=right,anchor=north east,font=\PartNameFont,text=ColorA,inner xsep=0mm](PT)at([yshift=-\StripeWidth-0.25cm]X){\begin{varwidth}{\textwidth-2.45cm}#2\end{varwidth}};
%%部分简介%%
\node[align=right,inner xsep=3.0mm,anchor=north east,font=\itshape\kaishu,text=ColorA](IT)at([yshift=-0.5cm]PT.south east){
\begin{varwidth}{\textwidth-2.75cm}
\ifdefvoid{\@partintro}{}{\@partintro}
\end{varwidth}};
%%部分目录%%
\node[anchor=south west](SC)at([xshift=\@innerlen+0.25in,yshift=\@botlen]current page.south west){
\begin{varwidth}{\textwidth/2}
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};}
%%
%%偶数页布局%%
\newcommand{\EvenPartPageBlock}[2]{
%%右上角色块坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at([xshift=\BlockWidth]current page.north west);
\coordinate(C)at([xshift=\BlockWidth,yshift=-\NBlockHeight]current page.north west);
\coordinate(D)at([yshift=-\NBlockHeight]current page.north west);
%%右上角色块%%
\draw[ColorA,fill=ColorA](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\StripeWidth]D);
\coordinate(R)at([xshift=\MBlockLength]Q);
\coordinate(T)at([yshift=-\BlockWidth]Q);
\coordinate(S)at([xshift=\MBlockLength]T);
%%右侧色块%%
\draw[ColorB!20,fill=ColorB!20](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\StripeWidth]T);
\coordinate(F)at([xshift=\BlockWidth]E);
\coordinate(H)at(current page.south west);
\coordinate(G)at([xshift=\BlockWidth]H);
%%右下角色块%%
\draw[ColorA,fill=ColorA](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
%%左上角色块坐标%%
\coordinate(I)at([xshift=\StripeWidth]B);
\coordinate(J)at(current page.north east);
\coordinate(K)at([yshift=-\NBlockHeight]J);
\coordinate(L)at([xshift=\StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=\StripeWidth]F);
\coordinate(N)at([xshift=\paperwidth]E);
\coordinate(O)at(current page.south east);
\coordinate(P)at([xshift=\StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=\StripeWidth]R);
\coordinate(X)at([xshift=\StripeWidth]S);
%%部分编号%%
\node[align=left,anchor=south west,font=\PartLabelFont,text=ColorA,inner xsep=0mm](NL)at([yshift=\StripeWidth+0.25cm]U){\begin{varwidth}{\textwidth-5.0cm}#1\end{varwidth}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(NL)\NLWidth
\coordinate(V)at([xshift=\NLWidth]U);
\coordinate(W)at([xshift=\NLWidth]X);
%%
%%页面中部色块%%
\draw[ColorB!50,fill=ColorB!50,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=\StripeWidth]V);
\coordinate(Z)at([yshift=-\StripeWidth]K);
\coordinate(YY)at([yshift=\StripeWidth]N);
\coordinate(ZZ)at([xshift=\StripeWidth]W);
%%左侧色块%%
\draw[ColorB!20,fill=ColorB!20](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分名%%
\node[align=left,anchor=north west,font=\PartNameFont,text=ColorA,inner xsep=0mm](PT)at([yshift=-\StripeWidth-0.25cm]X){\begin{varwidth}{\textwidth-2.45cm}#2\end{varwidth}};
%%部分简介%%
\node[align=left,inner xsep=3.0mm,anchor=north west,font=\itshape\kaishu,text=ColorA](IT)at([yshift=-0.5cm]PT.south west){
\begin{varwidth}{\textwidth-2.75cm}
\ifdefvoid{\@partintro}{}{\@partintro}
\end{varwidth}};
%%部分目录%%
\node[minimum width=4.0cm,anchor=south east](SC)at([xshift=-\@innerlen-0.25in,yshift=\@botlen]current page.south east){
\begin{varwidth}{\textwidth/2}
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};}
%%
\newcommand{\@partstyle}[2]{
\begin{tikzpicture}[remember picture,overlay]
%%白色背景%%
\draw[white,fill=white](current page.south west)rectangle(current page.north east);
\ifodd\value{page}%判断奇偶页
\OddPartPageBlock{#1}{#2}
\else
\EvenPartPageBlock{#1}{#2}
\fi
\end{tikzpicture}}
%%
\newlength{\HeightOfLTOC}
%%定义小半圆%%
\newcommand{\halfcircle}[2]{
\tikz{\draw[#1,fill=#1,sharp corners](0,0)arc(90:-90:#2)--cycle;}}
%%
%%奇数页布局%%
\newcommand{\SOddPartPageBlock}[1]{
%%右上角色块坐标%%
\coordinate(A)at(current page.north east);
\coordinate(B)at([xshift=-\BlockWidth]current page.north east);
\coordinate(C)at([xshift=-\BlockWidth,yshift=-\NBlockHeight]current page.north east);
\coordinate(D)at([yshift=-\NBlockHeight]current page.north east);
%%右上角色块%%
\draw[ColorA,fill=ColorA](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\StripeWidth]D);
\coordinate(R)at([xshift=-\MBlockLength]Q);
\coordinate(T)at([yshift=-\BlockWidth]Q);
\coordinate(S)at([xshift=-\MBlockLength]T);
%%右侧色块%%
\draw[ColorB!20,fill=ColorB!20](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\StripeWidth]T);
\coordinate(F)at([xshift=-\BlockWidth]E);
\coordinate(H)at(current page.south east);
\coordinate(G)at([xshift=-\BlockWidth]H);
%%右下角色块%%
\draw[ColorA,fill=ColorA](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
%%左上角色块坐标%%
\coordinate(I)at([xshift=-\StripeWidth]B);
\coordinate(J)at(current page.north west);
\coordinate(K)at([yshift=-\NBlockHeight]J);
\coordinate(L)at([xshift=-\StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=-\StripeWidth]F);
\coordinate(N)at([xshift=-\paperwidth]E);
\coordinate(O)at(current page.south west);
\coordinate(P)at([xshift=-\StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=-\StripeWidth]R);
\coordinate(X)at([xshift=-\StripeWidth]S);
%%标题%%
\node[inner sep=0mm,anchor=south east](ZZ)at([yshift=\StripeWidth+5.0mm]U){
\tikz{
\node[inner sep=0mm,outer sep=0mm,anchor=south west](HC1){\halfcircle{ColorA}{\PartLabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC2)at(HC1.east){\halfcircle{ColorA!80}{\PartLabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC3)at(HC2.east){\halfcircle{ColorA!60}{\PartLabelHeight/2}};
\node[align=left,inner sep=0mm,outer sep=0mm,anchor=north west,font=\PartNameFont,text=ColorA](PST)at([xshift=0.5cm,yshift=\PartNameHeight/2-\PartLabelHeight/2]HC3.north east){\begin{varwidth}{\textwidth-5.0cm}#1\end{varwidth}};}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(ZZ)\ZZWidth
\coordinate(V)at([xshift=-\ZZWidth]U);
\coordinate(W)at([xshift=-\ZZWidth]X);
%%
%%页面中部色块%%
\draw[ColorB!50,fill=ColorB!50,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=-\StripeWidth]V);
\coordinate(Z)at([yshift=-\StripeWidth]K);
\coordinate(YY)at([yshift=\StripeWidth]N);
\coordinate(ZZ)at([xshift=-\StripeWidth]W);
%%左侧色块%%
\draw[ColorB!20,fill=ColorB!20](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%部分简介%%
\node[align=right,inner xsep=2.0mm,anchor=north east,font=\itshape\kaishu,text=ColorA](IT)at([yshift=-1.25cm]X){\begin{varwidth}{\textwidth-2.75cm}
\ifdefvoid{\@partintro}{}{\@partintro}
\end{varwidth}};
%%部分目录%%
\node[anchor=south west](SC)at([xshift=\@innerlen+0.25in,yshift=\@botlen]current page.south west){
\begin{varwidth}{\textwidth/2}
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};}
%%
%%偶数页布局%%
\newcommand{\SEvenPartPageBlock}[1]{
%%右上角色块坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at([xshift=\BlockWidth]current page.north west);
\coordinate(C)at([xshift=\BlockWidth,yshift=-\NBlockHeight]current page.north west);
\coordinate(D)at([yshift=-\NBlockHeight]current page.north west);
%%右上角色块%%
\draw[ColorA,fill=ColorA](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\StripeWidth]D);
\coordinate(R)at([xshift=\MBlockLength]Q);
\coordinate(T)at([yshift=-\BlockWidth]Q);
\coordinate(S)at([xshift=\MBlockLength]T);
%%右侧色块%%
\draw[ColorB!20,fill=ColorB!20](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\StripeWidth]T);
\coordinate(F)at([xshift=\BlockWidth]E);
\coordinate(H)at(current page.south west);
\coordinate(G)at([xshift=\BlockWidth]H);
%%右下角色块%%
\draw[ColorA,fill=ColorA](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
%%左上角色块坐标%%
\coordinate(I)at([xshift=\StripeWidth]B);
\coordinate(J)at(current page.north east);
\coordinate(K)at([yshift=-\NBlockHeight]J);
\coordinate(L)at([xshift=\StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=\StripeWidth]F);
\coordinate(N)at([xshift=\paperwidth]E);
\coordinate(O)at(current page.south east);
\coordinate(P)at([xshift=\StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=\StripeWidth]R);
\coordinate(X)at([xshift=\StripeWidth]S);
%%标题%%
\node[inner sep=0mm,anchor=south west](ZZ)at([yshift=\StripeWidth+5.0mm]U){
\tikz{
\node[inner sep=0mm,outer sep=0mm,anchor=south west](HC1){\halfcircle{ColorA}{\PartLabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC2)at(HC1.east){\halfcircle{ColorA!80}{\PartLabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC3)at(HC2.east){\halfcircle{ColorA!60}{\PartLabelHeight/2}};
\node[align=left,inner sep=0mm,outer sep=0mm,anchor=north west,font=\PartNameFont,text=ColorA](PST)at([xshift=0.5cm,yshift=\PartNameHeight/2-\PartLabelHeight/2]HC3.north east){\begin{varwidth}{\textwidth-5.0cm}#1\end{varwidth}};}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(ZZ)\ZZWidth
\coordinate(V)at([xshift=\ZZWidth]U);
\coordinate(W)at([xshift=\ZZWidth]X);
%%
%%页面中部色块%%
\draw[ColorB!50,fill=ColorB!50,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=\StripeWidth]V);
\coordinate(Z)at([yshift=-\StripeWidth]K);
\coordinate(YY)at([yshift=\StripeWidth]N);
\coordinate(ZZ)at([xshift=\StripeWidth]W);
%%左侧色块%%
\draw[ColorB!20,fill=ColorB!20](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分简介%%
\node[align=left,inner xsep=2.0mm,anchor=north west,font=\itshape\kaishu,text=ColorA](IT)at([yshift=-1.25cm]X){
\begin{varwidth}{\textwidth-2.75cm}
\ifdefvoid{\@partintro}{}{\@partintro}
\end{varwidth}};
%%部分目录%%
\node[minimum width=4.0cm,anchor=south east](SC)at([xshift=-\@innerlen-0.25in,yshift=\@botlen]current page.south east){
\begin{varwidth}{\textwidth/2}
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};}
%%
%%不编号部分页样式%%
\newlength{\PartLabelHeight}
\newlength{\PartNameHeight}
\newcommand{\@partstarstyle}[1]{
\settototalheight{\PartLabelHeight}{\PartNameFont#1}
\ifdim\PartLabelHeight<1.25cm
\setlength{\PartLabelHeight}{1.25cm}
\fi
\settototalheight{\PartNameHeight}{\PartNameFont#1}
\begin{tikzpicture}[remember picture,overlay]
%%白色背景%%
\draw[white,fill=white](current page.south west)rectangle(current page.north east);
\ifodd\value{page}%判断奇偶页
\SOddPartPageBlock{#1}
\else
\SEvenPartPageBlock{#1}
\fi
\end{tikzpicture}}
%%
%%编号部分页%%
\titleformat{\part}
{}{}{0em}
{\stepcounter{@currenttotalpart}%部分数计数
\stepcounter{@pagesidenumber}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\startcontents[part]%开启小目录
\if@mainmatter
\@partstyle{第~{\numberfont\thepart}~部分}{#1}%部分样式
\addtocontents{toc}{\protect\@mainmattertrue}
\else
\addtocounter{part}{-1}%保持部分计数器的数值不变
\@partstarstyle{#1}%部分样式
\addtocontents{toc}{\protect\@mainmatterfalse}
\fi
\thispagestyle{empty}}
[\global\partintro{}]%清空\partintro
%%不编号部分页%%
\titleformat{name=\part,numberless}
{}{}{0em}
{\stepcounter{@currenttotalpart}%部分数计数
\stepcounter{@pagesidenumber}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\startcontents[part]%开启小目录
\@partstarstyle{#1}%部分样式
\thispagestyle{empty}}
[\global\partintro{}]%清空\partintro
%%间距设置%%
\titlespacing*{\part}{0pt}{0pt}{0pt}

%%为\part*添加短页眉%%
\NewCommandCopy{\origpart}{\part}
\RenewDocumentCommand{\part}{s O{#3} m}{
\IfBooleanTF{#1}
{\origpart*{#3}
\markboth{#2}{#2}
\extramarks{#2}{#2}}
{\origpart[#2]{#3}
\if@mainmatter
\markboth{第~{\numberfont\thepart}~部分\quad#2}{第~{\numberfont\thepart}~部分\quad#2}
\extramarks{第~{\numberfont\thepart}~部分\quad#2}{第~{\numberfont\thepart}~部分\quad#2}
\else
\markboth{#2}{#2}
\extramarks{#2}{#2}
\fi}}
%%部分结束命令%%
\newcommand{\PartEnd}{
\stopcontents[part]}

%%章节页样式%%
\newlength{\ChapterBlockHeight}
\newlength{\ChapterVSpace}
\newlength{\ChapterStripeWidth}
\newlength{\ChapterNumXSep}
\newlength{\ChapterNumYSep}
\newlength{\ChapterPageLen}
\setlength{\ChapterStripeWidth}{0.3cm}
\setlength{\ChapterNumXSep}{0.5cm}
\setlength{\ChapterNumYSep}{0.65cm}
\setlength{\ChapterPageLen}{1.1cm}
\newcommand*{\chaptersubtitle}[1]{\def\@chaptersubtitle{#1}}
\newcommand*{\chapterimage}[1]{\def\@chapterimage{#1}}
%%编号章节页样式%%
\newcommand{\@chapterstyle}[2]{
\begingroup
\pgfdeclarelayer{chaptertop}
\pgfdeclarelayer{chapterbottom}
\pgfsetlayers{chapterbottom,main,chaptertop}
\begin{tikzpicture}[remember picture,overlay]
\ifodd\value{page}%判断奇偶页
%%坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=\FrameWidth+1.0cm]D);
\coordinate(F)at([xshift=-5.0cm,yshift=\FrameWidth+1.0cm]C);
\coordinate(G)at([xshift=-3.0cm,yshift=\FrameWidth]C);
\coordinate(H)at([xshift=-\FrameWidth,yshift=\FrameWidth]C);
\coordinate(N)at([yshift=0.5cm]current page text area.north east);
\coordinate(Q1)at([xshift=-1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=\ChapterPageLen,yshift=-\ChapterPageLen]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{chaptertop}
%%编号%%
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=\@toplen]T.north east)--([yshift=\@toplen]T.north west)[rounded corners=2.5mm]--cycle},anchor=north east,font=\ChapterLabelFont,text=white,inner sep=4.0mm,outer sep=0mm](T)at([yshift=5.0mm]N){
\begin{varwidth}{\textwidth/3}
#1
\end{varwidth}};
%%渐变带%%
\draw[ColorB!40,fill=ColorB!40,line width=0pt]([xshift=\@outerlen,yshift=-2\ChapterNumYSep/3]T.south east)rectangle([xshift=-\@innerlen-\textwidth,yshift=-2\ChapterNumYSep/3-\ChapterStripeWidth]T.south east);
%%标题%%
\node[inner sep=0mm,anchor=north east,font=\ChapterNameFont,text=ColorA](P)at([yshift=-4\ChapterNumYSep/3-\ChapterStripeWidth]T.south east){\begin{varwidth}{\textwidth}#2\end{varwidth}};
\end{pgfonlayer}
%%
\begin{pgfonlayer}{chapterbottom}
%%框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--(E)--(F)[in=180,out=0]to(G)[rounded corners=2.5mm]--(H)[rounded corners=5.0mm]--([xshift=\@outerlen-\FrameWidth,yshift=-2\ChapterNumYSep/3]P.south east)[sharp corners]--([xshift=-\@innerlen-\textwidth,yshift=-2\ChapterNumYSep/3]P.south east)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{chaptertop}
%%底部文字%%
\node[anchor=west,font=\itshape\kaishu,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm](S)at([xshift=\@innerlen,yshift=0.85cm]D){
\begin{spacing}{1.2}%段落行距设置
\ifdefvoid{\@chaptersaying}{}{\FontSize{13pt}\@chaptersaying}
\end{spacing}};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\ChapterPageLen-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
%%获取标题和副标题的高度%%
\pgfgetnodeheight(T)\THeight
\pgfgetnodeheight(P)\PHeight
\setlength{\ChapterBlockHeight}{\THeight+\PHeight+4\ChapterNumYSep/3+\ChapterStripeWidth+\@toplen-8.0mm}
\gsetlength{\ChapterVSpace}{\ChapterBlockHeight-\@toplen}
%%章节图片%%
\node[anchor=north west,inner sep=0mm](U)at(A){\ifdefvoid{\@chapterimage}{}{\includegraphics[height=\ChapterBlockHeight]{\@chapterimage}}};
\else
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=\FrameWidth+1.0cm]D);
\coordinate(F)at([xshift=5.0cm,yshift=\FrameWidth+1.0cm]C);
\coordinate(G)at([xshift=3.0cm,yshift=\FrameWidth]C);
\coordinate(H)at([xshift=\FrameWidth,yshift=\FrameWidth]C);
\coordinate(N)at([yshift=0.5cm]current page text area.north west);
\coordinate(Q1)at([xshift=1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=-\ChapterPageLen,yshift=-\ChapterPageLen]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{chaptertop}
%%编号%%
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=\@toplen]T.north east)--([yshift=\@toplen]T.north west)[rounded corners=2.5mm]--cycle},anchor=north west,font=\ChapterLabelFont,text=white,inner sep=0.4cm,outer sep=0mm](T)at([yshift=5.0mm]N){
\begin{varwidth}{\textwidth/3}
#1
\end{varwidth}};
%%渐变带%%
\draw[ColorB!40,fill=ColorB!40,line width=0pt]([xshift=-\@outerlen,yshift=-2\ChapterNumYSep/3]T.south west)rectangle([xshift=\@innerlen+\textwidth,yshift=-2\ChapterNumYSep/3-\ChapterStripeWidth]T.south west);
%%标题%%
\node[inner sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA](P)at([yshift=-4\ChapterNumYSep/3-\ChapterStripeWidth]T.south west){\begin{varwidth}{\textwidth}#2\end{varwidth}};
\end{pgfonlayer}
%%
\begin{pgfonlayer}{chapterbottom}
%%框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--(E)--(F)[in=0,out=180]to(G)[rounded corners=2.5mm]--(H)[rounded corners=5.0mm]--([xshift=-\@outerlen+\FrameWidth,yshift=-2\ChapterNumYSep/3]P.south west)[sharp corners]--([xshift=\@innerlen+\textwidth,yshift=-2\ChapterNumYSep/3]P.south west)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{chaptertop}
%%底部文字%%
\node[anchor=east,font=\itshape\kaishu,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm](S)at([xshift=-\@innerlen,yshift=0.85cm]D){
\begin{spacing}{1.2}%段落行距设置
\ifdefvoid{\@chaptersaying}{}{\FontSize{13pt}\@chaptersaying}
\end{spacing}};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\ChapterPageLen-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
%%获取标题和副标题的高度%%
\pgfgetnodeheight(T)\THeight
\pgfgetnodeheight(P)\PHeight
\setlength{\ChapterBlockHeight}{\THeight+\PHeight+4\ChapterNumYSep/3+\ChapterStripeWidth+\@toplen-8.0mm}
\gsetlength{\ChapterVSpace}{\ChapterBlockHeight-\@toplen}
%%章节图片%%
\node[anchor=north east,inner sep=0mm](U)at(A){\ifdefvoid{\@chapterimage}{}{\includegraphics[height=\ChapterBlockHeight]{\@chapterimage}}};
\fi
\end{tikzpicture}
\endgroup}
%%
%%不编号章节样式%%
\newlength{\ChapterLabelHeight}
\newlength{\ChapterNameHeight}
\newcommand{\@chapterstarstyle}[2]{
\settototalheight{\ChapterLabelHeight}{\ChapterNameFont#1}
%%设置标签最小尺寸
\ifdim\ChapterLabelHeight<0.9cm
\setlength{\ChapterLabelHeight}{0.9cm}
\fi
\settototalheight{\ChapterNameHeight}{\ChapterNameFont#1}
\begingroup
\pgfdeclarelayer{chaptertop}
\pgfdeclarelayer{chapterbottom}
\pgfsetlayers{chapterbottom,main,chaptertop}
\begin{tikzpicture}[remember picture,overlay]
\ifodd\value{page}%判断奇偶页
%%坐标点%%
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=\FrameWidth]D);
\coordinate(H)at([xshift=-\FrameWidth,yshift=\FrameWidth]C);
\coordinate(N)at([yshift=0.5cm]current page text area.north west);
\coordinate(Q1)at([xshift=-1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=\ChapterPageLen,yshift=-\ChapterPageLen]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
%%
\begin{pgfonlayer}{chaptertop}
%%标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text width=\textwidth,align=left](TT)at(N){\tikz{
\node[inner sep=0mm,outer sep=0mm,anchor=north west](P1){\halfcircle{ColorA}{\ChapterLabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](P2)at(P1.east){\halfcircle{ColorA!80}{\ChapterLabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA](P3)at([xshift=4.0mm,yshift=\ChapterNameHeight/2-\ChapterLabelHeight/2]P2.north east){
\begin{varwidth}{\textwidth-\ChapterLabelHeight-4.0mm}
#1
\end{varwidth}};}};
%%
%%渐变带%%
\draw[ColorB!40,fill=ColorB!40,line width=0pt]([xshift=-\@innerlen,yshift=-2\ChapterNumYSep/3]TT.south west)rectangle([xshift=\@outerlen,yshift=-2\ChapterNumYSep/3-\ChapterStripeWidth]TT.south east);
%%
%%副标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north east,font=\ChapterNameFont,text=ColorA,align=right,minimum height=\ChapterLabelHeight](P)at([yshift=-4\ChapterNumYSep/3-\ChapterStripeWidth,minimum height=\ChapterLabelHeight]TT.south east){
\begin{varwidth}{2\textwidth/3}
#2
\end{varwidth}};
\end{pgfonlayer}
%%
\begin{pgfonlayer}{chapterbottom}
%%框架%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(H)[rounded corners=5.0mm]--([xshift=\@outerlen-\FrameWidth,yshift=-2\ChapterNumYSep/3]P.south east)[sharp corners]--([xshift=-\textwidth-\@innerlen,yshift=-2\ChapterNumYSep/3]P.south east)--cycle;
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q)circle(\ChapterPageLen/2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\ChapterPageLen-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
%%获取标题和副标题的高度%%
\pgfgetnodeheight(TT)\TTHeight
\pgfgetnodeheight(P)\PHeight
\gsetlength{\ChapterBlockHeight}{\TTHeight+\PHeight+4\ChapterNumYSep/3+\ChapterStripeWidth+\@toplen-5.0mm}
\gsetlength{\ChapterVSpace}{\ChapterBlockHeight-\@toplen}
%%章节图片%%
\node[anchor=north west,inner sep=0mm](U)at(A){\ifdefvoid{\@chapterimage}{}{\includegraphics[height=\ChapterBlockHeight]{\@chapterimage}}};
\else
%%坐标点%%
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=\FrameWidth]D);
\coordinate(H)at([xshift=\FrameWidth,yshift=\FrameWidth]C);
\coordinate(N)at([yshift=0.5cm]current page text area.north east);
\coordinate(Q1)at([xshift=1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=-\ChapterPageLen,yshift=-\ChapterPageLen]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
%%
\begin{pgfonlayer}{chaptertop}
%%标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north east,text width=\textwidth,align=right](TT)at(N){\tikz{
\node[inner sep=0mm,outer sep=0mm,anchor=north west](P1){\halfcircle{ColorA}{\ChapterLabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](P2)at(P1.east){\halfcircle{ColorA!80}{\ChapterLabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA](P3)at([xshift=4.0mm,yshift=\ChapterNameHeight/2-\ChapterLabelHeight/2]P2.north east){
\begin{varwidth}{\textwidth-\ChapterLabelHeight-4.0mm}
#1
\end{varwidth}};}};
%%
%%渐变带%%
\draw[ColorB!40,fill=ColorB!40,line width=0pt]([xshift=\@innerlen,yshift=-2\ChapterNumYSep/3]TT.south east)rectangle([xshift=-\@outerlen,yshift=-2\ChapterNumYSep/3-\ChapterStripeWidth]TT.south west);
%%
%%副标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA,align=left,minimum height=\ChapterLabelHeight](P)at([yshift=-4\ChapterNumYSep/3-\ChapterStripeWidth,minimum height=\ChapterLabelHeight]TT.south west){
\begin{varwidth}{2\textwidth/3}
#2
\end{varwidth}};
\end{pgfonlayer}
%%
\begin{pgfonlayer}{chapterbottom}
%%框架%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(H)[rounded corners=5.0mm]--([xshift=-\@outerlen+\FrameWidth,yshift=-2\ChapterNumYSep/3]P.south west)[sharp corners]--([xshift=\textwidth+\@innerlen,yshift=-2\ChapterNumYSep/3]P.south west)--cycle;
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q)circle(\ChapterPageLen/2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\ChapterPageLen-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
%%获取标题和副标题的高度%%
\pgfgetnodeheight(TT)\TTHeight
\pgfgetnodeheight(P)\PHeight
\gsetlength{\ChapterBlockHeight}{\TTHeight+\PHeight+4\ChapterNumYSep/3+\ChapterStripeWidth+\@toplen-5.0mm}
\gsetlength{\ChapterVSpace}{\ChapterBlockHeight-\@toplen}
%%章节图片%%
\node[anchor=north east,inner sep=0mm](U)at(A){\ifdefvoid{\@chapterimage}{}{\includegraphics[height=\ChapterBlockHeight]{\@chapterimage}}};
\fi
\end{tikzpicture}
\endgroup}
%%制定章节页的侧标更新规则%%
\newcommand{\@pagesiderule}{
\ifnum\value{@currenttotalpart}=0%若文档中到当前章时还没有部分层次
\if@mainmatter%如果在mainmatter中
\stepcounter{@pagesidenumber}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\fi\fi}
%%编号章节页%%
\titleformat{\chapter}
{}{}{0em}
{\@pagesiderule
\@chapterstyle{第~{\numberfont\thechapter}~章}{#1}%章样式
\enlargethispage{-0.75cm}%修改页面大小
\thispagestyle{empty}}
[\global\chapterimage{}]%清空\chapterimage
%%不编号章节页%%
\titleformat{name=\chapter,numberless}
{}{}{0em}
{\@pagesiderule
\@chapterstarstyle{#1}{\ifdefvoid{\@chaptersubtitle}{}{\@chaptersubtitle}}%章样式
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%%间距设置%%
\titlespacing*{\chapter}{0pt}{0pt}{0pt}
%%为\chapter*添加短页眉%%
\NewCommandCopy{\origchapter}{\chapter}
\RenewDocumentCommand{\chapter}{s O{#3} m}{
\IfBooleanTF{#1}
{\origchapter*{#3}\markboth{#2}{#2}}
{\origchapter[#2]{#3}}
\vspace*{\ChapterVSpace}}

%%节样式%%
%%编号节样式%%
\newlength{\SectionCircleR}
\newlength{\SecNameTHeight}
\newlength{\SecNameDepth}
\newcommand{\@sectionlabelstyle}[3]{
\settototalheight{\SecNameTHeight}{\SectionNameFont#1}
\settodepth{\SecNameDepth}{\SectionNameFont#1}
\pgfmathsetlength{\global\SectionCircleR}{\SecNameTHeight/2+0.75mm}
\SectionLabelFont#1
\tikz[baseline=-\SecNameTHeight/2+\SecNameDepth]{
\node[inner sep=0mm](N){\tikz{
\draw[ColorA,fill=ColorA](0,0)circle(\SectionCircleR);
\node[inner sep=0mm,font=\SectionLabelFont,text=white](0,0){\maxsizebox{\SecNameTHeight-1.0mm}{\SecNameTHeight-1.0mm}{#3}};}};}
#2}
%%
\newlength{\SectionLabelNameSep}
\setlength{\SectionLabelNameSep}{0.75cm}
%%不编号节样式%%
\newcommand{\@sectionstarlabelstyle}[1]{
\settototalheight{\SecNameTHeight}{\SectionLabelFont#1}
\settodepth{\SecNameDepth}{\SectionLabelFont#1}
\pgfmathsetlength{\global\SectionCircleR}{\SecNameTHeight/2+0.75mm}
\tikz[baseline=-\SecNameTHeight/2+\SecNameDepth]{
\node[inner sep=0mm](N){\tikz{
\draw[ColorA!50,fill=ColorA!50](0,0)circle(\SectionCircleR);
\draw[white,fill=ColorA,line width=2.5pt](0,0)circle(\SectionCircleR-1.5mm);}};}
}
%%
\newlength{\SectionStarLabelNameSep}
\setlength{\SectionStarLabelNameSep}{0.25cm}
%%编号节样式%%
\titleformat{\section}
{\vspace*{20pt}}{\hskip-0.5em\@sectionlabelstyle{第}{节}{\thesection}}{\SectionLabelNameSep}{\SectionNameFont#1}
%%不编号节样式%%
\titleformat{name=\section,numberless}
{\vspace*{20pt}\vspace{-10pt}}{\hskip-0.5em\@sectionstarlabelstyle{#1}}{\SectionStarLabelNameSep}{\SectionNameFont\color{ColorA}#1}
%%间距设置%%
\titlespacing*{\section}{0pt}{0pt}{25pt}
%%修改章节断页方式，使\section另起一页，而\section*不换页，并且为\section*添加短页眉%%
\NewCommandCopy{\OriginSection}{\section}
\RenewDocumentCommand{\section}{s O{#3} m}{
\IfBooleanTF{#1}
{\OriginSection*{#3}\markright{#2}}
{\clearpage\OriginSection[#2]{#3}}}

%%小节标题样式%%
%%编号小节标题样式%%
%%设置\subsection的标题%%
\newlength{\SubsecLabelHeight}
\newlength{\SubsecNameHeight}
\newlength{\SubsecLabelWidth}
\newlength{\SubsecNameWidth}
\newlength{\SubsecLabelSep}
\setlength{\SubsecLabelSep}{1.5mm}
\newlength{\SubsecNameSep}
\newlength{\SubsecHskip}
\setlength{\SubsecHskip}{0.6cm}
\newlength{\SubsecLabelR}
\newlength{\SubsecNameR}
\newlength{\SubsecBlockLen}
\newcommand{\@subsectiontitle}[3]{\tikz{
%为了使长度定义命令在tikz中生效而插入\pgfinterruptpicture\endpgfinterruptpicture%%
\settototalheight{\SubsecLabelHeight}{\pgfinterruptpicture\SubsectionLabelFont#1\endpgfinterruptpicture}
\settototalheight{\SubsecNameHeight}{\pgfinterruptpicture\SubsectionLabelFont#3\endpgfinterruptpicture}
%%设置标签最小高度
\ifdim\SubsecLabelHeight<5.3mm
\setlength{\SubsecLabelHeight}{5.3mm}
\fi
%%根据标题文字高度设置上下间距Sep
\ifdim\SubsecLabelHeight>\SubsecNameHeight
\setlength{\SubsecNameSep}{\SubsecLabelSep+\SubsecLabelHeight/2-\SubsecNameHeight/2}
\else
\setlength{\SubsecNameSep}{\SubsecLabelSep}
\fi
%%
\settowidth{\SubsecLabelWidth}{\pgfinterruptpicture\SubsectionLabelFont#1\endpgfinterruptpicture}
\settowidth{\SubsecNameWidth}{\pgfinterruptpicture\SubsectionLabelFont#3\endpgfinterruptpicture}
\setlength{\SubsecLabelR}{\SubsecLabelHeight/2+\SubsecLabelSep}
\setlength{\SubsecNameR}{\SubsecNameHeight/2+\SubsecNameSep}
\setlength{\SubsecBlockLen}{\linewidth-\SubsecNameR-\SubsecLabelWidth-\SubsecHskip}
\draw[ColorA,fill=ColorA,ultra thick](0,0)arc(90:270:\SubsecLabelR)--(\SubsecLabelWidth+\SubsecHskip,-2\SubsecLabelR) arc (-90:90:\SubsecLabelR)--cycle;
\node[font=\SubsectionLabelFont,text=white,anchor=west,inner sep=0mm](L)at(0,-\SubsecLabelR){#1};
\coordinate(A)at([xshift=\SubsecHskip+\SubsecLabelR]L.east);
\draw[white,fill=white,line width=10.0pt](A)circle(\SubsecLabelR);
\ifdim\SubsecNameWidth<\SubsecBlockLen
\draw[draw=ColorB!7.5,fill=ColorB!7.5,sharp corners,ultra thick]node[append after command={(T.north west)[rounded corners=\SubsecNameR]--(T.north east)[rounded corners=\SubsecNameR]--(T.south east)[sharp corners]--(T.south west)[sharp corners]--cycle},font=\SubsectionNameFont,text=ColorA,anchor=north west,outer sep=0mm,inner ysep=\SubsecNameSep,inner xsep=\SubsecNameR](T)at([yshift=\SubsecNameHeight/2+\SubsecNameSep]A){\parbox{\SubsecBlockLen-3\SubsecNameR}{\hspace*{\SubsecNameR}#3}};
\else
\draw[draw=ColorB!7.5,fill=ColorB!7.5,sharp corners,ultra thick]node[append after command={(T.north west)[rounded corners=\SubsecNameR]--(T.north east)[rounded corners=\SubsecNameR]--(T.south east)[rounded corners=\SubsecNameR]--(T.south west)[sharp corners]--cycle},font=\SubsectionNameFont,text=ColorA,anchor=north west,outer sep=0mm,inner ysep=\SubsecNameSep,inner xsep=\SubsecNameR](T)at([yshift=\SubsecNameHeight/2+\SubsecNameSep]A){\parbox{\SubsecBlockLen-3\SubsecNameR}{\hspace*{\SubsecNameR}#3}};
\fi
\draw[ColorA,fill=white,line width=3.0pt](A)circle(\SubsecLabelR);
\node[font=\SubsectionLabelFont,text=ColorA,anchor=center,inner sep=0mm](N)at(A){#2};}}
%%
\newcommand{\@subsectionstyle}[3]{
\begin{flushleft}
\tikz{\node[inner ysep=0mm,inner xsep=0mm](G){\@subsectiontitle{#1}{#2}{#3}};}
\end{flushleft}}
%%
%%不编号小节标题样式%%
\newcommand*\subsectionsubtitle[1]{\def\@subsectionsubtitle{#1}}
%%设置\subsection*的标题%%
\newcommand{\@subsectionstartitle}[1]{\begingroup\pgfdeclarelayer{subsectop}\pgfdeclarelayer{subsecbottom}\pgfsetlayers{subsecbottom,main,subsectop}\tikz{%为了使长度定义命令在tikz中生效而插入\pgfinterruptpicture\endpgfinterruptpicture%%
\settototalheight{\SubsecNameHeight}{\pgfinterruptpicture\SubsectionLabelFont#1\endpgfinterruptpicture}
\setlength{\SubsecLabelHeight}{5.3mm}
%%根据标题文字高度设置上下间距Sep
\ifdim\SubsecNameHeight<\SubsecLabelHeight
\setlength{\SubsecNameSep}{\SubsecLabelSep+\SubsecLabelHeight/2-\SubsecNameHeight/2}
\else
\setlength{\SubsecNameSep}{\SubsecLabelSep}
\fi
\setlength{\SubsecNameR}{\SubsecNameHeight/2+\SubsecNameSep}
\node[draw=ColorA,fill=ColorA,ultra thick,rounded corners=\SubsecNameR,font=\SubsectionNameFont,text=white,anchor=north west,outer sep=0mm,inner xsep=\SubsecNameR,inner ysep=\SubsecNameSep](T)at(-\SubsecNameR,0){
\begin{varwidth}{\linewidth/2}
\hspace*{3\SubsecNameR/2}#1
\end{varwidth}};
\pgfgetnodeheight(T)\THeight
\begin{pgfonlayer}{subsecbottom}
\draw[ColorB!7.5,fill=ColorB!7.5,rounded corners=\SubsecNameR,ultra thick](\linewidth-2\SubsecNameR,0)rectangle(T.south west);
\end{pgfonlayer}
\draw[white,fill=white,line width=10.0pt](-\SubsecNameR,-\SubsecNameR)circle(\SubsecNameR);
\draw[ColorA,fill=white,line width=3.0pt](-\SubsecNameR,-\SubsecNameR)circle(\SubsecNameR);
\draw[ColorA,fill=ColorA](-\SubsecNameR,-\SubsecNameR)circle(\SubsecNameR/2);
\begin{pgfonlayer}{subsectop}
\node[font=\SubsectionSubTFont,text=ColorA,anchor=east,inner sep=0mm,inner ysep=\SubsecNameSep](S)at(\linewidth-3\SubsecNameR,-\THeight/2){
\maxsizebox{\linewidth/2-3\SubsecNameR}{!}{
\ifdefvoid{\@subsectionsubtitle}{}{\@subsectionsubtitle}
}};
\end{pgfonlayer}}
\endgroup}
%%
\newcommand{\@subsectionstarstyle}[1]{
\begin{flushleft}
\tikz{\node[inner ysep=0mm,inner xsep=-3.5pt](G){\@subsectionstartitle{#1}};}
\end{flushleft}}

%%编号小节样式%%
\titleformat{\subsection}
{}{}{0em}
{\@subsectionstyle{课时}{\arabic{subsection}}{#1}}
%%不编号小节样式%%
\titleformat{name=\subsection,numberless}
{}{}{0em}
{\@subsectionstarstyle{#1}}
[\global\subsectionsubtitle{}]%清空\subsectionsubtitle
%%间距设置%%
\titlespacing*{\subsection}{0pt}{-20pt}{-20pt}
%%点样式%%
\newlength{\SubsubSecNameTHeight}
\newlength{\SubsubSecNameDepth}
\newcommand{\@subsubsectionstyle}[1]{	\settototalheight{\SubsubSecNameTHeight}{\SubsubsectionNameFont#1}
\settodepth{\SubsubSecNameDepth}{\SubsubsectionNameFont#1}
\tikz[baseline=-\SubsubSecNameTHeight/2+\SubsubSecNameDepth]{\node[inner sep=0mm,font=\SubsubsectionLabelFont,text=ColorB]{\halfcircle{ColorB}{\SubsubSecNameTHeight/2+0.75mm}};}}
%%
\newlength{\SubsubSecLabelNameSep}
\setlength{\SubsubSecLabelNameSep}{0.25cm}
\titleformat{\subsubsection}
{}{\hskip-0.5em\@subsubsectionstyle{#1}}{\SubsubSecLabelNameSep}{\SubsubsectionNameFont\color{ColorB}#1}
%%间距设置%%
\titlespacing*{\subsubsection}{0pt}{5pt}{5pt}
%%修改段落样式%%
\renewcommand{\paragraph}{
\@startsection{paragraph}{4}{\z@}
{3.25ex \@plus1.0ex \@minus0.2ex}{-1em}
{\ParagraphNameFont\color{ColorA}}}
\makeatother

%%练习题面板标题%%
\newlength{\ExerciseTitleHeight}
\newcommand{\ExerciseTitle}[1]{
\settototalheight{\ExerciseTitleHeight}{\ExerciseTitleFont#1}
\begingroup
\pgfdeclarelayer{top}
\pgfdeclarelayer{middle}
\pgfdeclarelayer{bottom}
\pgfsetlayers{bottom,middle,top}
\begin{center}
\begin{tikzpicture}
\begin{pgfonlayer}{top}
\node[font=\ExerciseTitleFont,text=white,inner sep=0mm](E){\maxsizebox{\linewidth-3.0cm}{!}{#1}};
\end{pgfonlayer}
\begin{pgfonlayer}{middle}
\draw[ColorB,fill=ColorB,ultra thick,rounded corners=1.0mm]([xshift=-4.0mm,yshift=1.0mm]E.north west)rectangle([xshift=4.0mm,yshift=-1.0mm]E.south east);
\end{pgfonlayer}
\begin{pgfonlayer}{bottom}
\draw[draw=ColorB!50,fill=ColorB!50,ultra thick,rounded corners={\ExerciseTitleHeight/2+2.25mm}]([xshift=-9.0mm,yshift=2.0mm]E.north west)rectangle([xshift=9.0mm,yshift=-2.0mm]E.south east);
\end{pgfonlayer}
\end{tikzpicture}
\end{center}
\endgroup}

%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%%%
%%目录页码右侧空格%%
\contentsmargin{4.0mm}
\makeatletter
%%标签绘制%%
\newlength{\TocPartH}
\newlength{\TocPartW}
\newlength{\TocPartR}
\newlength{\TocPartTempW}
\newlength{\TocPartCriticL}
\newlength{\TocPartSep}
\setlength{\TocPartSep}{1.5mm}
%%
\newcommand{\@PartContents}[3]{\tikz{%为了使长度定义命令在tikz中生效而插入\pgfinterruptpicture\endpgfinterruptpicture%%
\settototalheight{\TocPartH}{\pgfinterruptpicture\TocPartFont#1\endpgfinterruptpicture}
\ifdim\TocPartH<5.1mm
\setlength{\TocPartH}{5.1mm}
\fi
\settowidth{\TocPartTempW}{\pgfinterruptpicture\TocPartFont#1\endpgfinterruptpicture}
\setlength{\TocPartR}{\TocPartH/2+\TocPartSep}
\setlength{\TocPartCriticL}{3\linewidth/4-4\TocPartR}
\ifdim\TocPartTempW>\TocPartCriticL
\setlength{\TocPartW}{\TocPartCriticL}
\else
\settowidth{\TocPartW}{\pgfinterruptpicture\TocPartFont#1\endpgfinterruptpicture}
\fi
\draw[ColorB!7.5,fill=ColorB!7.5,rounded corners=\TocPartR](0,0)rectangle(\linewidth-\TocPartR,-2\TocPartR);
\draw[ColorA,fill=ColorA](0,0)arc(90:270:\TocPartR)--(\TocPartW+\TocPartR,-2\TocPartR)--(\TocPartW+\TocPartR,0)--cycle;
\node[font=\TocPartFont,text=white,anchor=west,inner sep=0mm](PL)at(0,-\TocPartR){\maxsizebox{\TocPartCriticL}{!}{#1}};
\node[font=\TocPartFont,text=ColorA,anchor=west,inner sep=0mm](PT)at([xshift=\TocPartR+5.0mm]PL.east){\maxsizebox{\TocPartCriticL}{!}{#2}};
\node[font=\ContentPageNumFont,text=ColorA,anchor=east,inner xsep=0mm](PP)at(\linewidth-2\TocPartR,-\TocPartR){#3};}}
%%
%%编号部分目录样式%%
\newcommand{\@tocentrypartnumbered}[1]{\contentslabel[\if@mainmatter\@PartContents{第~{\numberfont\thecontentslabel}~部分}{#1}{\thecontentspage}\else\@PartContents{#1}{}{\thecontentspage}
\fi]{1.25cm}}
%%
%%不编号部分目录样式%%
\newcommand{\@tocentrypartunnumbered}[1]{\contentslabel[\@PartContents{#1}{}{\thecontentspage}]{1.25cm}}
%%
%%部分目录样式%%
\titlecontents{part}[1.25cm]
{\addvspace{20pt}\hypersetup{linkcolor=white}}
{\@tocentrypartnumbered}
{\@tocentrypartunnumbered}{}
%%章目录样式%%
\titlecontents{chapter}[2.45cm]
{\addvspace{0pt}\TocChapterFont\color{ColorA}\hypersetup{linkcolor=ColorA}}
{\color{ColorA}\contentslabel[\if@appendix%如果章在相应环境里，则修改目录前缀
附录~{\numberfont\thecontentslabel}~
\else
\if@test
试题~{\numberfont\thecontentslabel}~
\else
第~{\numberfont\thecontentslabel}~章
\fi\fi]{2.0cm}}
{\color{ColorA}\hspace*{-2.0cm}}%不编号章节
{\titlerule*[6pt]{ }\color{ColorA}\FontSize{14pt}\numberfont\thecontentspage}
%%节目录样式%%
\titlecontents{section}[2.45cm]
{\addvspace{-5.0pt}\TocSectionFont}
{\contentslabel[\if@topic%如果节在相应环境里，则修改目录前缀
专题~{\numberfont\thecontentslabel}~
\else
\if@project
课题~{\numberfont\thecontentslabel}~
\else
\if@quiz
测试~{\numberfont\thecontentslabel}~
\else
第~{\numberfont\thecontentslabel}~节
\fi\fi\fi]{2.0cm}}
{\hspace*{-2.0cm}}%不编号章节
{\titlerule*[6pt]{ }\FontSize{14pt}\numberfont\thecontentspage}
%%图片目录样式%%
\titlecontents{figure}[2.5cm]
{\addvspace{-5.0pt}\LofFont}
{\contentslabel[图~{\numberfont\thecontentslabel}~]{1.9cm}}
{\hspace*{-1.9cm}}%不编号图表
{\titlerule*[6pt]{ }\FontSize{14pt}\numberfont\thecontentspage}
%%表格目录样式%%
\titlecontents{table}[2.5cm]
{\addvspace{-5.0pt}\LotFont}
{\contentslabel[表~{\numberfont\thecontentslabel}~]{1.9cm}}
{\hspace*{-1.9cm}}%不编号图表
{\titlerule*[6pt]{ }\FontSize{14pt}\numberfont\thecontentspage}
%%部分页上的小目录章样式%%
\titlecontents{lchapter}[0.75cm]
{\addvspace{-5.0pt}\TocLChapterFont\hypersetup{linkcolor=ColorB}}
{\color{ColorB}\contentslabel[\raisebox{-0.25mm}{\FontSize{15.5pt}\bfseries\faGenderless}]{0.6cm}}
{\color{ColorB}\contentslabel[\raisebox{-0.25mm}{\FontSize{15.5pt}\bfseries\faGenderless}]{0.6cm}}%不编号章节
{}
%%部分页上的小目录节样式%%
\titlecontents{lsection}[0.9cm]
{\addvspace{-5.0pt}\TocLSectionFont}
{\contentslabel[\faGenderless]{0.5cm}}
{\contentslabel[\faGenderless]{0.5cm}}%不编号章节
{}
\makeatother

%%%%%%%%%%%%%%%%%% 环境定义和命令定义 %%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\newlength{\EgTHeight}
\newlength{\EgDepth}
\newlength{\EgWidth}
\newlength{\EgSep}
\setlength{\EgSep}{1.5mm}
\newlength{\EgHskip}
\setlength{\EgHskip}{0.6cm}
\newlength{\NumWidth}
\newcommand{\@basenode}[1]{
\tikz[baseline]{\node[inner xsep=0mm,inner ysep=-\EgSep-1.0mm,anchor=south](E){#1};}}
%%设置例题命令%%
\newcommand{\@egextitle}[3]{
\begin{tikzpicture}
%%为了使长度定义命令在tikz中生效而插入%%
\settototalheight{\EgTHeight}{\pgfinterruptpicture\EgLabelFont#1\endpgfinterruptpicture}
\settodepth{\EgDepth}{\pgfinterruptpicture\EgLabelFont#1\endpgfinterruptpicture}
\settowidth{\EgWidth}{\pgfinterruptpicture\EgLabelFont#1\endpgfinterruptpicture}
\settowidth{\NumWidth}{\pgfinterruptpicture\EgLabelFont#3\endpgfinterruptpicture}
\draw[#2,fill=#2,ultra thick]
(0,0) arc(90:270:{\EgTHeight/2+\EgSep})--(\EgWidth+\EgHskip,-\EgTHeight-2\EgSep) arc(-90:90:{\EgTHeight/2+\EgSep})--cycle;
\node[font=\EgLabelFont,text=white,anchor=west,inner sep=0mm](L)at(0,-\EgTHeight/2-\EgSep){#1};
\draw[#2,fill=white,ultra thick]
(\EgWidth+\EgTHeight+\EgSep,0) arc(90:270:{\EgTHeight/2+\EgSep})--(\EgWidth+\NumWidth+\EgTHeight+\EgSep,-\EgTHeight-2\EgSep) arc(-90:90:{\EgTHeight/2+\EgSep})--cycle;
\node[font=\EgLabelFont,text=#2,anchor=west,inner sep=0mm](N)at([xshift=\EgTHeight+\EgSep]L.east){#3};
\end{tikzpicture}}
%%设置解答命令%%
\newlength{\SvHeight}
\newlength{\SvWidth}
\newlength{\SvSep}
\setlength{\SvSep}{1.5mm}
\newcommand{\@ansanatitle}[2]{
\begin{tikzpicture}
%%为了使长度定义命令在tikz中生效而插入\pgfinterruptpicture\endpgfinterruptpicture%%
\settototalheight{\SvHeight}{\pgfinterruptpicture\EgLabelFont#1\endpgfinterruptpicture}
\settowidth{\SvWidth}{\pgfinterruptpicture\EgLabelFont#1\endpgfinterruptpicture}
\draw[#2,fill=#2,ultra thick]
(0,0) arc(90:270:{\SvHeight/2+\SvSep})--(\SvWidth,-\SvHeight-2\SvSep) arc(-90:90:{\SvHeight/2+\SvSep})--cycle;
\node[font=\EgLabelFont,text=white,anchor=west,inner sep=0mm](L)at(0,-\SvHeight/2-\SvSep){#1};
\end{tikzpicture}}
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

%%以下为本文档类内置栏目，请谨慎修改%%
%设置环境布尔变量
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
\renewcommand{\chaptermark}[1]{
\if@mainmatter
\markboth{附录~\thechapter~\quad##1}{附录~\thechapter~\quad##1}
\else
\markboth{##1}{##1}
\fi}
%修改有编号章样式
\titleformat{\chapter}
{}{}{0em}
{\@pagesiderule
\@chapterstarstyle{附录~{\numberfont\thechapter}~}{##1}%章样式
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
%%
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
\renewcommand{\chaptermark}[1]{
\if@mainmatter
\markboth{试题~\thechapter~\quad##1}{试题~\thechapter~\quad##1}
\else
\markboth{##1}{##1}
\fi}
%修改有编号章样式
\titleformat{\chapter}
{}{}{0em}
{\@pagesiderule
\@chapterstarstyle{试题~{\numberfont\thechapter}~}{##1}%章样式
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
%%
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
%修改有编号章样式
\RenewDocumentCommand{\chapter}{s O{##3} m}{
\IfBooleanTF{##1}
{\origchapter*{##3}\markboth{##2}{##2}}
{\setcounter{@innerquizcounter}{\value{section}}%将当前环境中的节计数器值赋给innerquizcounter
\origchapter[##2]{##3}
\setcounter{section}{\value{@innerquizcounter}}
}
\vspace*{\ChapterVSpace}}
%修改有编号节样式
\titleformat{\section}
{\vspace*{20pt}}{\hskip-0.5em\@sectionlabelstyle{测试}{}{\thesection}}{\SectionLabelNameSep}{\SectionNameFont##1}
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@subsectionstyle{题目}{\arabic{subsection}}{##1}}
%修改定理盒子样式
\RenewDocumentEnvironment{Definition}{ O{} }{\begin{box3}{定义}[##1][ColorA][\faCrosshairs]}{\end{box3}}
\RenewDocumentEnvironment{Theorem}{ O{} }{\begin{box3}{定理}[##1][ColorB][\faCrosshairs]}{\end{box3}}
\RenewDocumentEnvironment{Axiom}{ O{} }{\begin{box3}{公理}[##1][ColorI][\faCompactDisc]}{\end{box3}}
\RenewDocumentEnvironment{Lemma}{ O{} }{\begin{box4}{引理}[##1][ColorE][\faGlobe]}{\end{box4}}
\RenewDocumentEnvironment{Corollary}{ O{} }{\begin{box4}{推论}[##1][ColorG][\faCompactDisc]}{\end{box4}}
\RenewDocumentEnvironment{Proposition}{ O{} }{\begin{box4}{命题}[##1][ColorH][\faGlobe]}{\end{box4}}
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
%%
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
%修改有编号章样式
\RenewDocumentCommand{\chapter}{s O{##3} m}{
\IfBooleanTF{##1}
{\origchapter*{##3}\markboth{##2}{##2}}
{\setcounter{@innertopiccounter}{\value{section}}%将当前环境中的节计数器值赋给innertopiccounter
\origchapter[##2]{##3}
\setcounter{section}{\value{@innertopiccounter}}
}
\vspace*{\ChapterVSpace}}
%修改有编号节样式
\titleformat{\section}
{\vspace*{20pt}}{\hskip-0.5em\@sectionlabelstyle{专题}{}{\thesection}}{\SectionLabelNameSep}{\SectionNameFont##1}
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@subsectionstyle{重难点}{\arabic{subsection}}{##1}}
%修改定理盒子样式
\RenewDocumentEnvironment{Definition}{ O{} }{\begin{box3}{定义}[##1][ColorA][\faCrosshairs]}{\end{box3}}
\RenewDocumentEnvironment{Theorem}{ O{} }{\begin{box3}{定理}[##1][ColorB][\faCrosshairs]}{\end{box3}}
\RenewDocumentEnvironment{Axiom}{ O{} }{\begin{box3}{公理}[##1][ColorI][\faCompactDisc]}{\end{box3}}
\RenewDocumentEnvironment{Lemma}{ O{} }{\begin{box4}{引理}[##1][ColorE][\faGlobe]}{\end{box4}}
\RenewDocumentEnvironment{Corollary}{ O{} }{\begin{box4}{推论}[##1][ColorG][\faCompactDisc]}{\end{box4}}
\RenewDocumentEnvironment{Proposition}{ O{} }{\begin{box4}{命题}[##1][ColorH][\faGlobe]}{\end{box4}}
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
%%
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
%修改有编号章样式
\RenewDocumentCommand{\chapter}{s O{##3} m}{
\IfBooleanTF{##1}
{\origchapter*{##3}\markboth{##2}{##2}}
{\setcounter{@innerprojectcounter}{\value{section}}%将当前环境中的节计数器值赋给innerprojectcounter
\origchapter[##2]{##3}
\setcounter{section}{\value{@innerprojectcounter}}
}
\vspace*{\ChapterVSpace}}
%修改有编号节样式
\titleformat{\section}
{\vspace*{20pt}}{\hskip-0.5em\@sectionlabelstyle{课题}{}{\thesection}}{\SectionLabelNameSep}{\SectionNameFont##1}
%修改定理盒子样式
\RenewDocumentEnvironment{Definition}{ O{} }{\begin{box3}{定义}[##1][ColorA][\faCrosshairs]}{\end{box3}}
\RenewDocumentEnvironment{Theorem}{ O{} }{\begin{box3}{定理}[##1][ColorB][\faCrosshairs]}{\end{box3}}
\RenewDocumentEnvironment{Axiom}{ O{} }{\begin{box3}{公理}[##1][ColorI][\faCompactDisc]}{\end{box3}}
\RenewDocumentEnvironment{Lemma}{ O{} }{\begin{box4}{引理}[##1][ColorE][\faGlobe]}{\end{box4}}
\RenewDocumentEnvironment{Corollary}{ O{} }{\begin{box4}{推论}[##1][ColorG][\faCompactDisc]}{\end{box4}}
\RenewDocumentEnvironment{Proposition}{ O{} }{\begin{box4}{命题}[##1][ColorH][\faGlobe]}{\end{box4}}
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

%%重定义\frontmatter%%
\renewcommand{\frontmatter}[1][roman]{
\cleardoublepage
\@mainmatterfalse
\pagenumbering{#1}
\pagestyle{MainPage}
\DefaultMark}
%%重定义\mainmatter%%
\renewcommand{\mainmatter}{
\cleardoublepage
\@mainmattertrue
\pagenumbering{arabic}
\DefaultMark}
%%重定义\backmatter%%
\renewcommand{\backmatter}[1][Roman]{
\cleardoublepage
\@mainmatterfalse
\pagenumbering{#1}
\DefaultMark}
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
fonttitle=\bfseries\titlefont\color{white}\FontSize{13pt},
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
subtitle style={empty,before upper=\par,fontupper=\centering\FontSize{14pt}\bfseries\titlefont\color{#3}},
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
fonttitle=\BoxTitleFont,coltitle=white,
boxed title style={empty,left=3.5mm,right=8.5mm,top=0mm,bottom=0mm},
lowerbox=ignored,
code={\colorlet{ListColor}{ColorA}},
subtitle style={empty,fontupper=\BoxSubtitleFont\centering,colupper=ColorA}
}}

\makeatletter
%%简化序号命令%%
\newcommand{\the@prenumber}{\thechapter.\thesection}
%%课后习题盒子%%
\newtcolorbox{Exercise}{
Question,code={
\subsectionsubtitle{答案见第~{\numberfont\pageref{solution@Exercise.\the@prenumber}}~页}
\subsection*{课后习题~{\numberfont\the@prenumber}}
\vspace*{-10pt}},
label={question@Exercise.\the@prenumber},%标签
savelowerto=solutions/Exercise.\the@prenumber.tex,%将答案保存为一个tex文件，并放在一个名为solutions的文件夹里
record={\string\solution{Exercise.\the@prenumber}{solutions/Exercise.\the@prenumber.tex}}
}
%%思考题盒子%%
\newtcolorbox{Thinking}{
Question,code={
\subsectionsubtitle{答案见第~{\numberfont\pageref{solution@Thinking.\the@prenumber}}~页}
\subsection*{思考题~{\numberfont\the@prenumber}}
\vspace*{-10pt}},
label={question@Thinking.\the@prenumber},
savelowerto=solutions/Thinking.\the@prenumber.tex,%将答案保存为一个tex文件，并放在一个名为solutions的文件夹里
record={\string\solution{Thinking.\the@prenumber}{solutions/Thinking.\the@prenumber.tex}}
}
%%复习与提高盒子%%
\newtcolorbox{Improve}{
Question,code={
\subsectionsubtitle{答案见第~{\numberfont\pageref{solution@Improve.\thechapter}}~页}
\subsection*{复习与提高~{\numberfont\thechapter}}
\vspace*{-10pt}},
label={question@Improve.\thechapter},
savelowerto=solutions/Improve.\thechapter.tex,
record={\string\solution{Improve.\thechapter}{solutions/Improve.\thechapter.tex}}
}
%%针对练习盒子%%
\newtcolorbox{Specific}{
Question,code={
\subsectionsubtitle{答案见第~{\numberfont\pageref{solution@Specific.\thesection}}~页}
\subsection*{针对练习~{\numberfont\thesection}}
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
fonttitle=\BoxTitleFont,coltitle=ColorA,
title={原题见第~{\numberfont\pageref{question@#1}}~页},
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
fonttitle=\BoxTitleFont,coltitle=white
}}

%%判断标题长度并决定其放置位置%%
\makeatletter
\def\@BoxLabel{}
\def\@BoxName{}
\def\@BoxTitle{}
\def\@BoxBeforeUpper{}
\newlength{\@BoxLabelWidth}
\newlength{\@BoxNameWidth}
\newlength{\@BoxTitleWidth}
\newlength{\@BoxTitleHeight}
\newlength{\@BoxCriticLen}
\setlength{\@BoxCriticLen}{\linewidth-4.5cm}
\newcommand{\JudgeTitle}[3]{
\def\@BoxLabel{#1}
\def\@BoxName{#2}
\def\@BoxTitle{#1:~#2}
\settowidth{\@BoxLabelWidth}{\BoxTitleFont\@BoxLabel}
\settowidth{\@BoxNameWidth}{\BoxTitleFont\@BoxName}
\settowidth{\@BoxTitleWidth}{\BoxTitleFont\@BoxTitle}
\settototalheight{\@BoxTitleHeight}{\BoxTitleFont\@BoxTitle}
\ifthenelse{\isempty{#2}}{%若无标题名称
\def\@BoxBeforeUpper{\par}
\def\@BoxTitle{\maxsizebox{\@BoxCriticLen}{!}{\BoxTitleFont#1}}%无标题名称前分隔符
}{%若有标题名称
\ifdim\@BoxTitleWidth>\@BoxCriticLen%判断标题名称长度
\def\@BoxBeforeUpper{{\color{#3}\BoxTitleFont#2\quad}}
\def\@BoxTitle{{\maxsizebox{\@BoxCriticLen}{!}{\BoxTitleFont#1}}}%无标题名称前分隔符
\else
\def\@BoxBeforeUpper{\par}
\def\@BoxTitle{\maxsizebox{\@BoxCriticLen}{!}{\BoxTitleFont#1:~#2}}%有标题名称前分隔符
\fi}}
\makeatother

%%设置易错点盒子%%
\DeclareTColorBox{box1}{O{} m O{ColorA} O{\faExclamationCircle}}{
Box,before upper=\par,
frame style={left color=#3!50,right color=#3!50,middle color=#3},
code={},
title={\maxsizebox{\linewidth-2.0cm}{!}{#2}},
attach boxed title to top left={xshift=4.0mm,yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={empty,left=8.5mm,right=3.5mm,height=0.7cm,valign=center},
underlay boxed title={
\draw[white,fill=white,rounded corners=\tcboxedtitleheight/2,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#3,fill=#3,line width=2.0pt,rounded corners=\tcboxedtitleheight/2](title.north west)rectangle(title.south east);
\draw[white,fill=white,line width=12.5pt](title.west)circle({2*\tcboxedtitleheight/3});
\draw[#3,fill=#3](title.west)circle({2*\tcboxedtitleheight/3});
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries\titlefont,text=white](P)at(title.west){#4};
},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#3},
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
title={\@BoxTitle},
before upper={\@BoxBeforeUpper},
attach boxed title to top left={xshift=4.25mm,yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={empty,left=8.5mm,right=3.5mm,height=\@BoxTitleHeight+3.0mm,valign=center},
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
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries\titlefont,text=white](T)at(title.west){#5};},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4},
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
title={\@BoxTitle},
before upper={\@BoxBeforeUpper},
attach boxed title to top left={xshift=4.25mm,yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={empty,left=5.5mm,right=3.5mm,height=\@BoxTitleHeight+3.0mm,valign=center},
underlay boxed title={
\draw[white,fill=white,line width=15.0pt](title.west)circle({2*\tcboxedtitleheight/3});
\draw[white,fill=white,rounded corners=\tcboxedtitleheight/2,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#4,fill=#4!90,line width=2.25pt]
([xshift={sqrt(7)*\tcboxedtitleheight/6}]title.north west) arc ({asin(0.75)}:{360-asin(0.75)}:{2*\tcboxedtitleheight/3})[rounded corners=\tcboxedtitleheight/2]--
(title.south east)[rounded corners=\tcboxedtitleheight/2]--
(title.north east)[sharp corners]--
cycle;
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries\titlefont,text=white](P)at(title.west){#5};},
#1}
%%编号定义盒子%%
\DeclareDocumentEnvironment{Definition}{ O{} }{\begin{box3}[step and label={@def}{Def.\the@prenumber.\the@def}]{
\ifnum\value{chapter}=0
定义
\else
\ifnum\value{section}=0
定义
\else
\if@mainmatter
定义~{\numberfont\the@prenumber.\the@def}
\else
定义
\fi\fi\fi}
[#1][ColorA][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Theorem}{ O{} }{\begin{box3}[step and label={@thm}{Thm.\the@prenumber.\the@thm}]{
\ifnum\value{chapter}=0
定理
\else
\ifnum\value{section}=0
定理
\else
\if@mainmatter
定理~{\numberfont\the@prenumber.\the@thm}
\else
定理
\fi\fi\fi}
[#1][ColorB][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Axiom}{ O{} }{\begin{box3}[step and label={@axm}{Axm.\the@prenumber.\the@axm}]{
\ifnum\value{chapter}=0
公理
\else
\ifnum\value{section}=0
公理
\else
\if@mainmatter
公理~{\numberfont\the@prenumber.\the@axm}
\else
公理
\fi\fi\fi}
[#1][ColorI][\faCompactDisc]}{\end{box3}}
%%不编号定义盒子%%
\DeclareDocumentEnvironment{Definition*}{ O{} }{\begin{box3}{定义}[#1][ColorA][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Theorem*}{ O{} }{\begin{box3}{定理}[#1][ColorB][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Axiom*}{ O{} }{\begin{box3}{公理}[#1][ColorI][\faCompactDisc]}{\end{box3}}


%%设置引理盒子%%
\DeclareTColorBox{box4}{O{} m O{} O{ColorA} O{\faDiceD20}}{
Box,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\JudgeTitle{#2}{#3}{#4}},
title={\@BoxTitle},
before upper={\@BoxBeforeUpper},
attach boxed title to top left={xshift=4.5mm,yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={empty,left=5.5mm,right=3.5mm,height=\@BoxTitleHeight+3.0mm,valign=center},
underlay boxed title={
\draw[white,fill=white,line width=15.0pt](title.west)circle({2*\tcboxedtitleheight/3});
\draw[white,fill=white,rounded corners=\tcboxedtitleheight/2,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#4,fill=#4,rounded corners=\tcboxedtitleheight/2,line width=3.0pt](title.north west)rectangle(title.south east);
\draw[#4,fill=white,line width=2.75pt](title.west)circle({2*\tcboxedtitleheight/3});
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries\titlefont,text=#4](P)at(title.west){#5};},
#1}
%%编号引理盒子%%
\DeclareDocumentEnvironment{Lemma}{ O{} }{\begin{box4}[step and label={@lem}{Lem.\the@prenumber.\the@lem}]{
\ifnum\value{chapter}=0
引理
\else
\ifnum\value{section}=0
引理
\else
\if@mainmatter
引理~{\numberfont\the@prenumber.\the@lem}
\else
引理
\fi\fi\fi}
[#1][ColorE][\faGlobe]}{\end{box4}}
\DeclareDocumentEnvironment{Corollary}{ O{} }{\begin{box4}[step and label={@colry}{Colry.\the@prenumber.\the@colry}]{
\ifnum\value{chapter}=0
推论
\else
\ifnum\value{section}=0
推论
\else
\if@mainmatter
推论~{\numberfont\the@prenumber.\the@colry}
\else
推论
\fi\fi\fi}
[#1][ColorG][\faCompactDisc]}{\end{box4}}
\DeclareDocumentEnvironment{Proposition}{ O{} }{\begin{box4}[step and label={@prop}{Prop.\the@prenumber.\the@prop}]{
\ifnum\value{chapter}=0
命题
\else
\ifnum\value{section}=0
命题
\else
\if@mainmatter
命题~{\numberfont\the@prenumber.\the@prop}
\else
命题
\fi\fi\fi}
[#1][ColorH][\faGlobe]}{\end{box4}}
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
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries\titlefont,text=#3] at (title.west){#4};},
subtitle style={empty,top=-3.5mm,fontupper=\BoxSubtitleFont\centering,coltitle=#3},
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
\node[circle,align=center,inner sep=0mm,font=\FontSize{16pt}\bfseries\titlefont,text=#3] at (title.west){#4};},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#3},
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
fonttitle=\bfseries\titlefont\FontSize{11pt}\color{#3},
fontupper=\itshape\FontSize[0.8]{11pt},
boxed title style={empty,top=2.0mm,bottom=2.0mm,left=0mm},
underlay boxed title={
\node[anchor=east,align=center,font=\bfseries\titlefont\FontSize{12pt},text=#3,
inner sep=0mm](T)at([xshift=-0.75mm]title.west){#4};},
if odd page={grow to left by=2.5mm,grow to right by=2.5mm}
{grow to left by=2.5mm,grow to right by=2.5mm}
}{breakable,
top=2.0mm,bottom=0mm,left=0mm,right=0mm,boxsep=0mm,
fonttitle=\FontSize{12pt}\bfseries\titlefont\color{#3},
fontupper=\itshape,
boxed title style={empty,top=2.0mm,bottom=2.0mm,left=1.0mm},
underlay boxed title={
\node[anchor=east,align=center,font=\bfseries\titlefont\FontSize{15pt},text=#3,inner sep=0mm](T)at(title.west){#4};},
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
fonttitle=\BoxTitleFont,coltitle=ColorA,
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=ColorA},
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

\DeclareTColorBox{box9}{O{} m O{} O{ColorA} O{}}{
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
\node[font=\BoxTitleFont,text=#4,anchor=west,inner xsep=3.5mm](T)at([yshift=-0.5mm]title.east){\maxsizebox{\linewidth-2.5cm}{!}{#3}};
\node[font=\BoxTitleFont,text=#4,anchor=east,inner xsep=5.0mm](ST)at([yshift={-\tcboxedtitleheight/2+0.5mm}]interior.north east){\maxsizebox{\linewidth/2-1.5cm}{!}{#5}};},
overlay middle and last={
\begin{tcbclipinterior}
\fill[#4!7.5,draw=#4!7.5](frame.south west)rectangle([xshift=\tcboxedtitleheight]frame.north west);
\end{tcbclipinterior}},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4},
title={#2},#1}

\NewDocumentEnvironment{Reading}{O{}mm}{\begin{box9}{阅读理解}[#1][ColorB][\score{#2}{#3}[ColorB]]}{\end{box9}}
\NewDocumentEnvironment{Cloze}{O{}mm}{\begin{box9}{完形填空}[#1][ColorA][\score{#2}{#3}[ColorA]]}{\end{box9}}
\NewDocumentEnvironment{Article}{O{}mm}{\begin{box9}{文本解读}[#1][ColorC][\score{#2}{#3}[ColorC]]}{\end{box9}}

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
\node[font=\BoxTitleFont,text=#4,anchor=west,inner xsep=3.5mm](T)at([yshift=-0.5mm]title.east){\maxsizebox{\linewidth-2.5cm}{!}{#3}};},
subtitle style={frame hidden,colback=#4!7.5,
valign=center,height=\tcboxedtitleheight+0.75pt,
fontupper=\BoxSubtitleFont,colupper=#4},
title={#2},#1}

\newenvironment{Vocabulary}[1]{\begin{box10}{词汇解析}{#1}[ColorE]}{\end{box10}}



%%修改代码盒子左侧行数样式%%
\renewcommand{\theFancyVerbLine}{\bfseries\numberfont\FontSize{10pt}\color{ColorA}{\arabic{FancyVerbLine}}}
%%定义代码盒子基本样式%%
\tcbset{Code/.style={
enhanced standard,breakable,
pad before break=3.0mm,pad after break=4.5mm,
rounded corners,arc=5.0pt,boxrule=2.25pt,
colback=ColorB!2.5,colframe=white,
top=3.0mm,bottom=2.5mm,left=10.0mm,
before=\par\noindent\medskip,after=\par\medskip,
parbox=false,before upper=\par,before lower=\par,
fonttitle=\BoxTitleFont,coltitle=white,
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
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=ColorA},
title={代码示例},
minted options={breaklines,autogobble,linenos,numbersep=5.5mm},
listing only,
listing engine=minted}}

\newcommand{\CodeSubtitle}[2]{
\node[font=\BoxTitleFont,text=ColorA,anchor=west,inner xsep=3.5mm](T)at([yshift=-0.5mm]title.east){\maxsizebox{\linewidth-2.5cm}{!}{#1}};
\node[font=\BoxTitleFont,text=ColorA,anchor=east,inner xsep=5.0mm](ST)at([yshift={-\tcboxedtitleheight/2}]interior.north east){\maxsizebox{\linewidth/2-1.5cm}{!}{#2}};}

\newtcblisting{PythonBox}[1]{
Code,minted language=python,
overlay unbroken and first={\CodeSubtitle{#1}{Python}}}

\newtcblisting{CppBox}[1]{
Code,minted language=cpp,
overlay unbroken and first={\CodeSubtitle{#1}{Cpp}}}

\newtcblisting{JavaBox}[1]{
Code,minted language=java,
overlay unbroken and first={\CodeSubtitle{#1}{Java}}}

\newtcblisting{CodeBox}[2]{
Code,minted language={#1},
overlay unbroken and first={\CodeSubtitle{#2}{\uppercase{#1}}}}

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
\coordinate(E)at([yshift=-1.0cm]current page.north west);
\coordinate(F)at([xshift=-1.0cm,yshift=-1.0cm]current page.north east);
\coordinate(G)at([xshift=-1.0cm,yshift=1.0cm]current page.south east);
\coordinate(H)at([yshift=1.0cm]current page.south west);
%%背景%%
\draw[ColorB!5,fill=ColorB!5,sharp corners](D)rectangle(B);
\draw[ColorA!25,fill=ColorA!25](A)--(B)--(C)--(D)--(H)[rounded corners=5.0mm]--(G)[rounded corners=5.0mm]--(F)[sharp corners]--(E)--cycle;
\end{tikzpicture}
\begin{center}
\color{ColorA}\bfseries\titlefont
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
{\FontSize{17.5pt}\@englishsubtitle\par}}
%%版本号%%
\ifdefvoid{\@version}{}{
\vskip0.75cm
{\FontSize{15pt}第{\@version}版\par}}
\vskip0.75cm
%%作者%%
{\FontSize{15pt}主编\quad\@author\par}
\vfill
%%出版社%%
{\FontSize{15pt}\ifdefvoid{\@presslogo}{}{\raisebox{-0.2cm}{\mbox{\includegraphics[width=0.75cm]{\@presslogo}}}}\hskip0.25cm\@pressname\par}
\end{center}
\end{titlepage}}
\makeatother


