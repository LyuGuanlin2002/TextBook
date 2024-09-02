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
\NewDocumentCommand{\FontSize}{O{1.0} m}{\fontsize{#2}{#1\baselineskip}\selectfont}
\newcommand{\numberfont}{\rmfamily}
\newcommand{\titlefont}{\dbsong}
\newcommand{\contentfont}{\xbsong}
%%字号设置%%
\newcommand{\PartLabelFont}{\titlefont\bfseries\FontSize[1.5]{34pt}}%部分标签字体
\newcommand{\PartNameFont}{\titlefont\bfseries\FontSize[1.5]{32pt}}%部分名称字体
\newcommand{\ChapterLabelFont}{\titlefont\bfseries\FontSize[1.2]{27pt}}%章标签字体
\newcommand{\ChapterNameFont}{\titlefont\bfseries\FontSize[1.2]{25pt}}%章名称字体
\newcommand{\ChapterSayingFont}{\itshape\kaishu\FontSize[0.75]{13pt}}%章谚语字体
\newcommand{\SectionLabelFont}{\titlefont\bfseries\FontSize{18pt}}%节标签字体
\newcommand{\SectionNameFont}{\titlefont\bfseries\FontSize{18pt}}%节名称字体
\newcommand{\SubsectionLabelFont}{\titlefont\bfseries\FontSize{15pt}}%小节标签字体
\newcommand{\SubsectionNameFont}{\titlefont\bfseries\FontSize{15pt}}%小节名称字体
\newcommand{\SubsectionSubTFont}{\titlefont\bfseries\FontSize{14pt}}%小节副标题字体
\newcommand{\SubsubsectionLabelFont}{\titlefont\bfseries\FontSize{25pt}}%小小节标签字体
\newcommand{\SubsubsectionNameFont}{\titlefont\bfseries\FontSize{14.5pt}}%小小节名称字体
\newcommand{\ParagraphNameFont}{\titlefont\bfseries\FontSize{14pt}}%段落名称字体
\newcommand{\HeaderFont}{\titlefont\bfseries\FontSize[1.5]{13pt}}%页眉字体
\newcommand{\FooterFont}{\titlefont\bfseries\FontSize{13pt}}%页脚字体
\newcommand{\PageNumberFont}{\numberfont\bfseries\FontSize{16pt}}%页码字体
\newcommand{\ThumbFont}{\titlefont\bfseries\FontSize[1.5]{14pt}}%侧标字体
\newcommand{\CaptionFont}{\contentfont\bfseries\FontSize[1.5]{12pt}}%图表标签字体
\newcommand{\TocPartFont}{\titlefont\bfseries\FontSize{14.5pt}}%目录部分字体
\newcommand{\TocChapterFont}{\titlefont\bfseries\FontSize{14pt}}%目录章字体
\newcommand{\TocSectionFont}{\contentfont\FontSize{14pt}}%目录节字体
\newcommand{\TocSubsectionFont}{\contentfont\FontSize{14pt}}%目录节字体
\newcommand{\LofFont}{\contentfont\FontSize{14pt}}%图列表字体
\newcommand{\LotFont}{\contentfont\FontSize{14pt}}%表列表字体
\newcommand{\LTocTitleFont}{\titlefont\bfseries\FontSize{14pt}}%小目录标题
\newcommand{\TocLChapterFont}{\titlefont\bfseries\FontSize{14pt}}%小目录章字体
\newcommand{\TocLSectionFont}{\contentfont\FontSize{14pt}}%小目录节字体
\newcommand{\TocLSubsectionFont}{\contentfont\FontSize{14pt}}%小目录节字体
\newcommand{\ContentPageNumFont}{\numberfont\FontSize{14pt}}%目录页码字体
\newcommand{\CiteNumFont}{\numberfont}%引用字体
\newcommand{\LineNumFont}{\numberfont\bfseries\FontSize{10pt}}%行号字体
\newcommand{\ListNumFont}{\numberfont\bfseries\FontSize{12pt}}%列表序号字体
\newcommand{\ExerciseTitleFont}{\titlefont\bfseries\FontSize{13pt}}%练习标题字体
\newcommand{\EgLabelFont}{\titlefont\bfseries\FontSize{13pt}}%例题标签字体
\newcommand{\BoxTitleFont}{\titlefont\bfseries\FontSize{13pt}}%盒子标题字体
\newcommand{\BoxSubtitleFont}{\titlefont\bfseries\FontSize{13pt}}%盒子副标题字体
\newcommand{\BoxLogoFont}{\titlefont\bfseries\FontSize{16pt}}%盒子logo字体
\newcommand{\BoxSublogoFont}{\titlefont\bfseries\FontSize{14pt}}%盒子小logo字体
\newcommand{\MarginFont}{\itshape\kaishu\FontSize{13pt}}%边注字体
\newcommand{\FootNoteFont}{\itshape\kaishu\FontSize{13pt}}%脚注字体
\newcommand{\MainFont}{\FontSize{14.5pt}}%正文字体


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
\gdef\footnotesize{\FootNoteFont}

%%%%%%%%%%%%%%%%%%%% 图表插入宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}%插入图片路径
\RequirePackage[labelsep=colon]{caption}%图表标签
\RequirePackage[labelsep=colon,labelformat=simple]{subcaption}%图表标签
%%设置图片和表格格式%%
\captionsetup[figure]{name={{\color{ColorA!50}\CaptionFont\faSquare}~图}}
\captionsetup[table]{name={{\color{ColorA!50}\CaptionFont\faSquare}~表}}
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
%%目录计数器%%
\setcounter{secnumdepth}{3}
%\setcounter{tocdepth}{2}
\makeatletter
%%重定义\tableofcontents%%
\RenewDocumentCommand{\tableofcontents}{s m O{}}{
\begingroup%确保计数器值只在局部生效
\chapter*{\contentsname}
\c@tocdepth=#2%预设目录深度为2
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{toc}
\switchcolumn
#3
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
\RenewDocumentCommand{\shorttableofcontents}{s m O{}}{
\begingroup%确保计数器值只在局部生效
\chapter*{\shorttocname}
\c@tocdepth=#2%预设目录深度为0
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@startshorttoc{toc}
\switchcolumn
#3
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
\usetikzlibrary{fit,calc,math,scopes,backgrounds,positioning,intersections,decorations,shadows,
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
%%测量节点node尺寸%%
%%
\def\pgfgetnodeheight(#1)#2{
\begin{pgfinterruptboundingbox}
\path($(#1.south)-(#1.north)$);
\end{pgfinterruptboundingbox}
\pgfmathsetmacro#2{veclen(\pgf@x,\pgf@y)}
\edef#2{#2pt}}
%%
\def\pgfgetnodewidth(#1)#2{
\begin{pgfinterruptboundingbox}
\path($(#1.east)-(#1.west)$);
\end{pgfinterruptboundingbox}
\pgfmathsetmacro#2{veclen(\pgf@x,\pgf@y)}
\edef#2{#2pt}}
%%测量任意两点的距离%%
\def\pgfgetdistance(#1)(#2)#3{
\begin{pgfinterruptboundingbox}
\path($(#1)-(#2)$);
\end{pgfinterruptboundingbox}
\pgfmathsetmacro#3{veclen(\pgf@x,\pgf@y)}
\edef#3{#3pt}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 超链接宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{url}%超链接
\RequirePackage{xr}%文件之间的交叉引用
\RequirePackage[hidelinks,pagebackref]{hyperref}%超链接设置
\RequirePackage{cleveref}%带前缀名称引用，必须放在hyperref之后

%%%%%%%%%%%%%%%%%%%% 计数器宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{zhnumber,totcount}%中文计数器%获取计数器的最大值
%%定义计数器%%
\makeatletter
\newcounter{@Thumb@Number}%记录侧标数
\regtotcounter{@Thumb@Number}%获取侧标数最大值，需要编译两次才能正确获取
\newcounter{@Current@TotalPartNumber}%记录所有部分的总数
\newcounter{@egnum}[section]
\newcounter{@varnum}[section]
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
\renewcommand{\thesubsection}{\arabic{subsection}}

%%%%%%%%%%%%%%%%%%%% 列表环境 %%%%%%%%%%%%%%%%%%%%%%
%%设置题号%%
\newcommand*\cir[1]{\tikz[baseline]{\node[circle,fill=ListColor,draw=ListColor,anchor=base,minimum size=5.0mm,align=center,inner sep=0mm,outer sep=0mm,font=\ListNumFont,text=white]{\maxsizebox{4.5mm}{!}{#1}};}}
%%设置概念序号%%
\newcommand*\preconcept{\tikz[baseline]{\node[circle,draw=ListColor,fill=white,line width=2.5pt,anchor=south,minimum size=3.0mm,inner sep=0pt,outer sep=0mm]{};}}
%%概念列表环境%%
\newenvironment{Concept}{\begin{multicols}{2}\itshape\begin{itemize}[label=\protect\preconcept]}{\end{itemize}\end{multicols}\global\colorlet{ListColor}{ColorA}}
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
\ifthenelse{\totvalue{@Thumb@Number}=0\or\totvalue{@Thumb@Number}=1}
{\setlength{\SepH}{0cm}
\setlength{\MarkY}{-\paperheight/2}}
{\setlength{\SepH}{\dimexpr(\paperheight-2\DeltaH)/\totvalue{@Thumb@Number}}%设置侧标每次移动的距离
\setlength{\MarkY}{-\DeltaH}%设置侧标上下两侧锚点坐标的初值
\pagestyle{MainPage}
\DefaultMark
\makeatother}}

%%%%
\makeatletter
%%绘制页面框架%%
\newlength{\@ThumbHeight}
\newlength{\@ThumbXSep}
\newlength{\@ThumbBaseXSep}
\setlength{\@ThumbBaseXSep}{3.5mm}
\newlength{\@ThumbCriticHeight}
\setlength{\@ThumbCriticHeight}{5.0mm}
\newlength{\@ThumbMinimumHeight}
\setlength{\@ThumbMinimumHeight}{1.2cm}
\newlength{\@FrameWidth}
\setlength{\@FrameWidth}{1.0cm}
\newlength{\@PageNumWidth}
\setlength{\@PageNumWidth}{\@toplen-\@handseplen+1.0mm}
%%%%
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{
\if@mainmatter
\markboth{第~\thechapter~章\quad#1}{第~\thechapter~章\quad#1}
\else
\markboth{#1}{#1}
\fi}
\renewcommand{\sectionmark}[1]{\markright{第~\thesection~节\quad#1}}
%%%%
%%绘制主页面样式%%
\newcommand{\@Main@PageStyle}{
\begin{tikzpicture}[remember picture,overlay]
%%根据页数的奇偶生成%%
\ifodd\value{page}
\settototalheight{\@ThumbHeight}{\pgfinterruptpicture\ThumbFont\lastxmark\endpgfinterruptpicture}
\ifdim\@ThumbHeight>\@ThumbCriticHeight
\setlength{\@ThumbXSep}{\@ThumbBaseXSep}
\else
\setlength{\@ThumbXSep}{\@ThumbCriticHeight/2-\@ThumbHeight/2+\@ThumbBaseXSep}
\fi
%%
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=\@FrameWidth]current page.south west);
\coordinate(F)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]current page.south east);
\coordinate(G)at([xshift=-\@FrameWidth,yshift=-\@FrameWidth]current page.north east);
\coordinate(H)at([yshift=-\@FrameWidth]current page.north west);
%%绘制页面框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)--cycle;
%%绘制页码%%
\draw[ColorA,fill=ColorA,line width=1.0pt]
([xshift=-\@outerlen+0.25cm]B)[rounded corners=1.5mm]--
([xshift=-\@outerlen+0.25cm,yshift=-\@PageNumWidth]B)[rounded corners=1.5mm]--
([xshift=-\@FrameWidth+0.15cm,yshift=-\@PageNumWidth]B)[sharp corners]--
([xshift=-\@FrameWidth+0.15cm]B)--cycle;
\node[font=\PageNumberFont,text=white,anchor=south,align=center,inner ysep=2.0mm](P)at([xshift=-\@outerlen/2-0.3cm,yshift=-\@PageNumWidth]B){\maxsizebox{0.8cm}{!}{\thepage}};
%%绘制侧标%%
\draw[draw=ColorA,fill=ColorA,sharp corners,line width=1.0pt]node[append after command={(T.north west)--(T.north east)--(T.south east)[rounded corners=1.75mm]--(T.south west)[rounded corners=1.75mm]--cycle},font=\ThumbFont,text=white,align=center,outer sep=0mm,inner xsep=\@ThumbXSep,inner ysep=3.5mm,minimum width=\@ThumbMinimumHeight,anchor=east](T)at([yshift=\MarkY]B){\rotatebox[origin=c]{90}{\begin{varwidth}{\DeltaH}\lastxmark\end{varwidth}}};
%%%%
\else
\settototalheight{\@ThumbHeight}{\pgfinterruptpicture\ThumbFont\firstxmark\endpgfinterruptpicture}
\ifdim\@ThumbHeight>\@ThumbCriticHeight
\setlength{\@ThumbXSep}{\@ThumbBaseXSep}
\else
\setlength{\@ThumbXSep}{\@ThumbCriticHeight/2-\@ThumbHeight/2+\@ThumbBaseXSep}
\fi
%%
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=\@FrameWidth]current page.south east);
\coordinate(F)at([xshift=\@FrameWidth,yshift=\@FrameWidth]current page.south west);
\coordinate(G)at([xshift=\@FrameWidth,yshift=-\@FrameWidth]current page.north west);
\coordinate(H)at([yshift=-\@FrameWidth]current page.north east);
%%绘制页面框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)--cycle;
%%绘制页码%%
\draw[ColorA,fill=ColorA,line width=1.0pt]
([xshift=\@outerlen-0.25cm]B)[rounded corners=1.5mm]--
([xshift=\@outerlen-0.25cm,yshift=-\@PageNumWidth]B)[rounded corners=1.5mm]--
([xshift=\@FrameWidth-0.15cm,yshift=-\@PageNumWidth]B)[sharp corners]--
([xshift=\@FrameWidth-0.15cm]B)--cycle;
\node[font=\PageNumberFont,text=white,anchor=south,align=center,inner ysep=2.0mm](P)at([xshift=\@outerlen/2+0.3cm,yshift=-\@PageNumWidth]B){\maxsizebox{0.8cm}{!}{\thepage}};
%%绘制侧标%%
\draw[draw=ColorA,fill=ColorA,sharp corners,line width=1.0pt]node[append after command={(T.north west)[rounded corners=1.75mm]--(T.north east)[rounded corners=1.75mm]--(T.south east)[sharp corners]--(T.south west)--cycle},font=\ThumbFont,text=white,align=center,outer sep=0mm,inner xsep=\@ThumbXSep,inner ysep=3.5mm,minimum width=\@ThumbMinimumHeight,anchor=west](T)at([yshift=\MarkY]B){\rotatebox[origin=c]{270}{\begin{varwidth}{\DeltaH}\firstxmark\end{varwidth}}};
\fi
\end{tikzpicture}}
%%
%%定义主页面样式%%
\fancypagestyle{MainPage}{
\fancyhead{}
\fancyfoot{}
\fancyfoot[C]{\@Main@PageStyle}
\fancyhead[RO]{\HeaderFont\color{ColorA}\rightmark}
\fancyhead[LE]{\HeaderFont\color{ColorA}\leftmark}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 书籍层次样式 %%%%%%%%%%%%%%%%%%%%%%
%%部分页样式%%
%%编号部分页样式%%
\makeatletter
\newlength{\@Part@StripeWidth}
\newlength{\@Part@BlockWidth}
\newlength{\@Part@TopOuterBlockLength}
\newlength{\@Part@MiddleOuterBlockLength}
\setlength{\@Part@StripeWidth}{0.35cm}
\setlength{\@Part@BlockWidth}{1.75cm}
\setlength{\@Part@TopOuterBlockLength}{7.0cm}
\setlength{\@Part@MiddleOuterBlockLength}{4.0cm}
%%
%%部分介绍%%
\newcommand*{\partintro}[1]{\def\@partintro{\hspace*{2.0em}#1}}
\partintro{}
\newcommand*{\partimage}[1]{\def\@partimage{#1}}
%%
%%奇数页布局%%
\newcommand{\@Part@OddPage@Style}[2]{
\begin{pgfonlayer}{@Part@Top}
%%右上角色块坐标%%
\coordinate(A)at(current page.north east);
\coordinate(B)at([xshift=-\@Part@BlockWidth]current page.north east);
\coordinate(C)at([xshift=-\@Part@BlockWidth,yshift=-\@Part@TopOuterBlockLength]current page.north east);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength]current page.north east);
%%右上角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=-\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=-\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=-\@Part@BlockWidth]E);
\coordinate(H)at(current page.south east);
\coordinate(G)at([xshift=-\@Part@BlockWidth]H);
%%右下角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%%%
%%左上角色块坐标%%
\coordinate(I)at([xshift=-\@Part@StripeWidth]B);
\coordinate(J)at(current page.north west);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength]J);
\coordinate(L)at([xshift=-\@Part@StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=-\@Part@StripeWidth]F);
\coordinate(N)at([xshift=-\paperwidth]E);
\coordinate(O)at(current page.south west);
\coordinate(P)at([xshift=-\@Part@StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%%%
%%章节图片%%
\node[anchor=north east,outer sep=0mm,inner sep=0mm](Pic)at(A){\ifdefvoid{\@partimage}{}{\includegraphics[width=\paperwidth,height=\paperheight]{\@partimage}}};
%%%%
\begin{pgfonlayer}{@Part@Top}
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=-\@Part@StripeWidth]R);
\coordinate(X)at([xshift=-\@Part@StripeWidth]S);
%%部分编号%%
\node[align=flush right,anchor=south east,font=\PartLabelFont,text=ColorA,inner xsep=0mm](NL)at([yshift=\@Part@StripeWidth+0.25cm]U){\begin{varwidth}{\textwidth-5.0cm}#1\end{varwidth}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(NL)\NLWidth
\coordinate(V)at([xshift=-\NLWidth]U);
\coordinate(W)at([xshift=-\NLWidth]X);
%%
%%页面中部色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=-\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=-\@Part@StripeWidth]W);
%%左侧色块%%
\filldraw[ColorB,fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%部分名%%
\node[align=flush right,anchor=north east,font=\PartNameFont,text=ColorA,inner xsep=0mm](PT)at([yshift=-\@Part@StripeWidth-0.25cm]X){\begin{varwidth}{\textwidth-2.45cm}#2\end{varwidth}};
%%部分简介%%
\node[align=flush right,inner xsep=3.0mm,anchor=north east,font=\itshape\kaishu,text=ColorA](IT)at([yshift=-0.5cm]PT.south east){
\begin{varwidth}{\textwidth-2.75cm}
\@partintro
\end{varwidth}};
%%部分目录%%
\node[anchor=south west](SC)at([xshift=\@innerlen+0.25in,yshift=\@botlen]current page.south west){
\begin{varwidth}{\textwidth/2}
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};
\end{pgfonlayer}}
%%
%%偶数页布局%%
\newcommand{\@Part@EvenPage@Style}[2]{
\begin{pgfonlayer}{@Part@Top}
%%右上角色块坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at([xshift=\@Part@BlockWidth]current page.north west);
\coordinate(C)at([xshift=\@Part@BlockWidth,yshift=-\@Part@TopOuterBlockLength]current page.north west);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength]current page.north west);
%%右上角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=\@Part@BlockWidth]E);
\coordinate(H)at(current page.south west);
\coordinate(G)at([xshift=\@Part@BlockWidth]H);
%%右下角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%%%
%%左上角色块坐标%%
\coordinate(I)at([xshift=\@Part@StripeWidth]B);
\coordinate(J)at(current page.north east);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength]J);
\coordinate(L)at([xshift=\@Part@StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=\@Part@StripeWidth]F);
\coordinate(N)at([xshift=\paperwidth]E);
\coordinate(O)at(current page.south east);
\coordinate(P)at([xshift=\@Part@StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%%%
%%章节图片%%
\node[anchor=north west,outer sep=0mm,inner sep=0mm](Pic)at(A){\ifdefvoid{\@partimage}{}{\includegraphics[width=\paperwidth,height=\paperheight]{\@partimage}}};
%%%%
\begin{pgfonlayer}{@Part@Top}
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=\@Part@StripeWidth]R);
\coordinate(X)at([xshift=\@Part@StripeWidth]S);
%%部分编号%%
\node[align=flush left,anchor=south west,font=\PartLabelFont,text=ColorA,inner xsep=0mm](NL)at([yshift=\@Part@StripeWidth+0.25cm]U){\begin{varwidth}{\textwidth-5.0cm}#1\end{varwidth}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(NL)\NLWidth
\coordinate(V)at([xshift=\NLWidth]U);
\coordinate(W)at([xshift=\NLWidth]X);
%%
%%页面中部色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=\@Part@StripeWidth]W);
%%左侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分名%%
\node[align=flush left,anchor=north west,font=\PartNameFont,text=ColorA,inner xsep=0mm](PT)at([yshift=-\@Part@StripeWidth-0.25cm]X){\begin{varwidth}{\textwidth-2.45cm}#2\end{varwidth}};
%%部分简介%%
\node[align=flush left,inner xsep=3.0mm,anchor=north west,font=\itshape\kaishu,text=ColorA](IT)at([yshift=-0.5cm]PT.south west){
\begin{varwidth}{\textwidth-2.75cm}
\@partintro
\end{varwidth}};
%%部分目录%%
\node[minimum width=4.0cm,anchor=south east](SC)at([xshift=-\@innerlen-0.25in,yshift=\@botlen]current page.south east){
\begin{varwidth}{\textwidth/2}
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};
\end{pgfonlayer}}
%%
\newcommand{\@PartStyle}[2]{
\begingroup
\pgfdeclarelayer{@Part@Top}
\pgfdeclarelayer{@Part@Bottom}
\pgfsetlayers{@Part@Bottom,main,@Part@Top}
\begin{tikzpicture}[remember picture,overlay]
%%白色背景%%
\draw[white,fill=white](current page.south west)rectangle(current page.north east);
\ifodd\value{page}%判断奇偶页
\@Part@OddPage@Style{#1}{#2}
\else
\@Part@EvenPage@Style{#1}{#2}
\fi
\end{tikzpicture}
\endgroup}
%%
%%定义小半圆%%
\newcommand{\@HalfCircle@Label}[2]{
\tikz{\draw[#1,fill=#1,sharp corners](0,0)arc(90:-90:#2)--cycle;}}
%%
%%奇数页布局%%
\newcommand{\@Part@Star@OddPage@Style}[1]{
\begin{pgfonlayer}{@Part@Star@Top}
%%右上角色块坐标%%
\coordinate(A)at(current page.north east);
\coordinate(B)at([xshift=-\@Part@BlockWidth]current page.north east);
\coordinate(C)at([xshift=-\@Part@BlockWidth,yshift=-\@Part@TopOuterBlockLength]current page.north east);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength]current page.north east);
%%右上角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=-\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=-\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=-\@Part@BlockWidth]E);
\coordinate(H)at(current page.south east);
\coordinate(G)at([xshift=-\@Part@BlockWidth]H);
%%右下角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%左上角色块坐标%%
\coordinate(I)at([xshift=-\@Part@StripeWidth]B);
\coordinate(J)at(current page.north west);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength]J);
\coordinate(L)at([xshift=-\@Part@StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=-\@Part@StripeWidth]F);
\coordinate(N)at([xshift=-\paperwidth]E);
\coordinate(O)at(current page.south west);
\coordinate(P)at([xshift=-\@Part@StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%%%
%%章节图片%%
\node[anchor=north east,outer sep=0mm,inner sep=0mm](Pic)at(A){\ifdefvoid{\@partimage}{}{\includegraphics[width=\paperwidth,height=\paperheight]{\@partimage}}};
%%%%
\begin{pgfonlayer}{@Part@Star@Top}
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=-\@Part@StripeWidth]R);
\coordinate(X)at([xshift=-\@Part@StripeWidth]S);
%%标题%%
\node[inner sep=0mm,anchor=south east](ZZ)at([yshift=\@Part@StripeWidth+5.0mm]U){
\tikz{
\node[inner sep=0mm,outer sep=0mm,anchor=south west](HC1){\@HalfCircle@Label{ColorA}{\@Part@Star@LabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC2)at(HC1.east){\@HalfCircle@Label{ColorA!80}{\@Part@Star@LabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC3)at(HC2.east){\@HalfCircle@Label{ColorA!60}{\@Part@Star@LabelHeight/2}};
\node[align=flush left,inner sep=0mm,outer sep=0mm,anchor=north west,font=\PartNameFont,text=ColorA](PST)at([xshift=0.5cm,yshift=\@Part@Star@NameHeight/2-\@Part@Star@LabelHeight/2]HC3.north east){\begin{varwidth}{\textwidth-5.0cm}#1\end{varwidth}};}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(ZZ)\ZZWidth
\coordinate(V)at([xshift=-\ZZWidth]U);
\coordinate(W)at([xshift=-\ZZWidth]X);
%%
%%页面中部色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=-\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=-\@Part@StripeWidth]W);
%%左侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%部分简介%%
\node[align=flush right,inner xsep=2.0mm,anchor=north east,font=\itshape\kaishu,text=ColorA](IT)at([yshift=-1.25cm]X){\begin{varwidth}{\textwidth-2.75cm}
\@partintro
\end{varwidth}};
%%部分目录%%
\node[anchor=south west](SC)at([xshift=\@innerlen+0.25in,yshift=\@botlen]current page.south west){
\begin{varwidth}{\textwidth/2}
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};
\end{pgfonlayer}}
%%
%%偶数页布局%%
\newcommand{\@Part@Star@EvenPage@Style}[1]{
\begin{pgfonlayer}{@Part@Star@Top}
%%右上角色块坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at([xshift=\@Part@BlockWidth]current page.north west);
\coordinate(C)at([xshift=\@Part@BlockWidth,yshift=-\@Part@TopOuterBlockLength]current page.north west);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength]current page.north west);
%%右上角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=\@Part@BlockWidth]E);
\coordinate(H)at(current page.south west);
\coordinate(G)at([xshift=\@Part@BlockWidth]H);
%%右下角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%左上角色块坐标%%
\coordinate(I)at([xshift=\@Part@StripeWidth]B);
\coordinate(J)at(current page.north east);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength]J);
\coordinate(L)at([xshift=\@Part@StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=\@Part@StripeWidth]F);
\coordinate(N)at([xshift=\paperwidth]E);
\coordinate(O)at(current page.south east);
\coordinate(P)at([xshift=\@Part@StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%%%
%%章节图片%%
\node[anchor=north west,outer sep=0mm,inner sep=0mm](Pic)at(A){\ifdefvoid{\@partimage}{}{\includegraphics[width=\paperwidth,height=\paperheight]{\@partimage}}};
%%%%
\begin{pgfonlayer}{@Part@Star@Top}
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=\@Part@StripeWidth]R);
\coordinate(X)at([xshift=\@Part@StripeWidth]S);
%%标题%%
\node[inner sep=0mm,anchor=south west](ZZ)at([yshift=\@Part@StripeWidth+5.0mm]U){
\tikz{
\node[inner sep=0mm,outer sep=0mm,anchor=south west](HC1){\@HalfCircle@Label{ColorA}{\@Part@Star@LabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC2)at(HC1.east){\@HalfCircle@Label{ColorA!80}{\@Part@Star@LabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC3)at(HC2.east){\@HalfCircle@Label{ColorA!60}{\@Part@Star@LabelHeight/2}};
\node[align=flush left,inner sep=0mm,outer sep=0mm,anchor=north west,font=\PartNameFont,text=ColorA](PST)at([xshift=0.5cm,yshift=\@Part@Star@NameHeight/2-\@Part@Star@LabelHeight/2]HC3.north east){\begin{varwidth}{\textwidth-5.0cm}#1\end{varwidth}};}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(ZZ)\ZZWidth
\coordinate(V)at([xshift=\ZZWidth]U);
\coordinate(W)at([xshift=\ZZWidth]X);
%%
%%页面中部色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=\@Part@StripeWidth]W);
%%左侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分简介%%
\node[align=flush left,inner xsep=2.0mm,anchor=north west,font=\itshape\kaishu,text=ColorA](IT)at([yshift=-1.25cm]X){
\begin{varwidth}{\textwidth-2.75cm}
\@partintro
\end{varwidth}};
%%部分目录%%
\node[minimum width=4.0cm,anchor=south east](SC)at([xshift=-\@innerlen-0.25in,yshift=\@botlen]current page.south east){
\begin{varwidth}{\textwidth/2}
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};
\end{pgfonlayer}}
%%
%%不编号部分页样式%%
\newlength{\@Part@Star@LabelHeight}
\newlength{\@Part@Star@NameHeight}
\newlength{\@Part@Star@CriticLabelHeight}
\setlength{\@Part@Star@CriticLabelHeight}{1.25cm}
\newcommand{\@PartStarStyle}[1]{
\begingroup
\pgfdeclarelayer{@Part@Star@Top}
\pgfdeclarelayer{@Part@Star@Bottom}
\pgfsetlayers{@Part@Star@Bottom,main,@Part@Star@Top}
\settototalheight{\@Part@Star@LabelHeight}{\PartNameFont#1}
\ifdim\@Part@Star@LabelHeight<\@Part@Star@CriticLabelHeight
\setlength{\@Part@Star@LabelHeight}{\@Part@Star@CriticLabelHeight}
\fi
\settototalheight{\@Part@Star@NameHeight}{\PartNameFont#1}
\begin{tikzpicture}[remember picture,overlay]
%%白色背景%%
\draw[white,fill=white](current page.south west)rectangle(current page.north east);
\ifodd\value{page}%判断奇偶页
\@Part@Star@OddPage@Style{#1}
\else
\@Part@Star@EvenPage@Style{#1}
\fi
\end{tikzpicture}
\endgroup}
%%
%%编号部分页%%
\titleformat{\part}
{}{}{0em}
{\stepcounter{@Current@TotalPartNumber}%部分数计数
\stepcounter{@Thumb@Number}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\startcontents[part]%开启小目录
\@PartStyle{第~\thepart~部分}{#1}%部分样式
\thispagestyle{empty}}
[\global\partintro{}%清空\partintro
\global\partimage{}]%清空\partimage
%%不编号部分页%%
\titleformat{name=\part,numberless}
{}{}{0em}
{\stepcounter{@Current@TotalPartNumber}%部分数计数
\stepcounter{@Thumb@Number}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\startcontents[part]%开启小目录
\@PartStarStyle{#1}%部分样式
\thispagestyle{empty}}
[\global\partintro{}%清空\partintro
\global\partimage{}]%清空\partimage
%%间距设置%%
\titlespacing*{\part}{0pt}{0pt}{0pt}

%%为\part*添加短页眉%%
\NewCommandCopy{\OriginPart}{\part}
\RenewDocumentCommand{\part}{s O{#3} m}{
\IfBooleanTF{#1}
{\OriginPart*{#3\@mkboth{#2}{#2}}
\extramarks{#2}{#2}}
{\if@mainmatter
\OriginPart[#2]{#3\@mkboth{第~\thepart~部分\quad#2}{第~\thepart~部分\quad#2}}
\extramarks{第~\thepart~部分\quad#2}{第~\thepart~部分\quad#2}
\else
\OriginPart*{#3\@mkboth{#2}{#2}\addcontentsline{toc}{part}{#2}}
\extramarks{#2}{#2}
\fi}}
%%部分结束命令%%
\newcommand{\PartEnd}{\stopcontents[part]}

%%章节页样式%%
\newlength{\@Chapter@BlockHeight}
\newlength{\@Chapter@VSpace}
\newlength{\@Chapter@StripeWidth}
\newlength{\@Chapter@LabelSep}
\newlength{\@Chapter@LabelYShift@Down}
\newlength{\@Chapter@PageSize}
\newlength{\@Chapter@SayingBlockWidth}
\newlength{\@Chapter@LabelYShift@Up}
\setlength{\@Chapter@StripeWidth}{0.3cm}
\setlength{\@Chapter@LabelSep}{0.5cm}
\setlength{\@Chapter@LabelYShift@Down}{0.65cm}
\setlength{\@Chapter@LabelYShift@Up}{0.5cm}
\setlength{\@Chapter@PageSize}{1.1cm}
\setlength{\@Chapter@SayingBlockWidth}{\@FrameWidth+1.0cm}
%%%%
\newcommand*{\chaptersaying}[1]{\def\@chaptersaying{#1}}
\newcommand*{\chaptersubtitle}[1]{\def\@chaptersubtitle{#1}}
\newcommand*{\chapterimage}[1]{\def\@chapterimage{#1}}
\chaptersaying{}
\chaptersubtitle{}
\chapterimage{}
%%编号章节页样式%%
\newcommand{\@ChapterStyle}[2]{
\begingroup
\pgfdeclarelayer{@Chapter@Top}
\pgfdeclarelayer{@Chapter@Bottom}
\pgfsetlayers{@Chapter@Bottom,main,@Chapter@Top}
\begin{tikzpicture}[remember picture,overlay]
\ifodd\value{page}%判断奇偶页
%%坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=\@Chapter@SayingBlockWidth]D);
\coordinate(F)at([xshift=-5.0cm,yshift=\@Chapter@SayingBlockWidth]C);
\coordinate(G)at([xshift=-3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@LabelYShift@Up]current page text area.north east);
\coordinate(Q1)at([xshift=-1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{@Chapter@Top}
%%编号%%
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=\@toplen-2\@Chapter@LabelSep-\@Chapter@LabelYShift@Up]T.north east)--([yshift=\@toplen-2\@Chapter@LabelSep-\@Chapter@LabelYShift@Up]T.north west)[rounded corners=2.5mm]--cycle},anchor=north east,font=\ChapterLabelFont,text=white,inner sep=\@Chapter@LabelSep,outer sep=0mm](T)at([yshift=\@Chapter@LabelSep+\@Chapter@LabelYShift@Up]N){
\begin{varwidth}{\textwidth/3}
#1
\end{varwidth}};
%%渐变带%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.4]([xshift=\@outerlen,yshift=-2\@Chapter@LabelYShift@Down/3]T.south east)rectangle([xshift=-\@innerlen-\textwidth,yshift=-2\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south east);
%%标题%%
\node[inner sep=0mm,anchor=north east,font=\ChapterNameFont,text=ColorA](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south east){\begin{varwidth}{\textwidth}#2\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=\@outerlen-\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
\coordinate(J)at([xshift=-\@innerlen-\textwidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.5cm}
\begin{pgfonlayer}{@Chapter@Bottom}
%%框架1%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](A)rectangle(C);
%%章节图片%%
\node[anchor=north west,outer sep=0mm,inner sep=0mm](U)at(A){\ifdefvoid{\@chapterimage}{}{\includegraphics[width=\paperwidth,height=\paperheight]{\@chapterimage}}};
%%框架2%%
\draw[white,fill=white](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=0,out=180]to(F)[sharp corners]--(E)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{@Chapter@Top}
%%底部文字%%
\node[anchor=west,font=\ChapterSayingFont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm,inner sep=0mm,outer sep=0mm](S)at([xshift=\@innerlen,yshift=\@FrameWidth/2+0.5cm]D){\@chaptersaying};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
\else
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=\@Chapter@SayingBlockWidth]D);
\coordinate(F)at([xshift=5.0cm,yshift=\@Chapter@SayingBlockWidth]C);
\coordinate(G)at([xshift=3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@LabelYShift@Up]current page text area.north west);
\coordinate(Q1)at([xshift=1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=-\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{@Chapter@Top}
%%编号%%
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=\@toplen-2\@Chapter@LabelSep-\@Chapter@LabelYShift@Up]T.north east)--([yshift=\@toplen-2\@Chapter@LabelSep-\@Chapter@LabelYShift@Up]T.north west)[rounded corners=2.5mm]--cycle},anchor=north west,font=\ChapterLabelFont,text=white,inner sep=\@Chapter@LabelSep,outer sep=0mm](T)at([yshift=\@Chapter@LabelSep+\@Chapter@LabelYShift@Up]N){
\begin{varwidth}{\textwidth/3}
#1
\end{varwidth}};
%%渐变带%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.4]([xshift=-\@outerlen,yshift=-2\@Chapter@LabelYShift@Down/3]T.south west)rectangle([xshift=\@innerlen+\textwidth,yshift=-2\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south west);
%%标题%%
\node[inner sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south west){\begin{varwidth}{\textwidth}#2\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=-\@outerlen+\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
\coordinate(J)at([xshift=\@innerlen+\textwidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.5cm}
\begin{pgfonlayer}{@Chapter@Bottom}
%%框架1%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](A)rectangle(C);
%%章节图片%%
\node[anchor=north east,outer sep=0mm,inner sep=0mm](U)at(A){\ifdefvoid{\@chapterimage}{}{\includegraphics[width=\paperwidth,height=\paperheight]{\@chapterimage}}};
%%框架2%%
\draw[white,fill=white](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=180,out=0]to(F)[sharp corners]--(E)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{@Chapter@Top}
%%底部文字%%
\node[anchor=east,font=\ChapterSayingFont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm,inner sep=0mm,outer sep=0mm](S)at([xshift=-\@innerlen,yshift=\@FrameWidth/2+0.5cm]D){\@chaptersaying};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
\fi
\end{tikzpicture}
\endgroup}
%%
%%不编号章节样式%%
\newlength{\@Chapter@Star@LabelHeight}
\newlength{\@Chapter@Star@NameHeight}
\newlength{\@Chapter@Star@LabelNameXSep}
\newlength{\@Chapter@Star@LabelYShift@Up}
\setlength{\@Chapter@Star@LabelNameXSep}{4.0mm}
\newlength{\@Chapter@Star@CriticLabelHeight}
\setlength{\@Chapter@Star@CriticLabelHeight}{9.0mm}
\setlength{\@Chapter@Star@LabelYShift@Up}{5.0mm}
\newcommand{\@ChapterStarStyle}[2]{
\settototalheight{\@Chapter@Star@LabelHeight}{\ChapterNameFont#1}
%%设置标签最小尺寸
\ifdim\@Chapter@Star@LabelHeight<\@Chapter@Star@CriticLabelHeight
\setlength{\@Chapter@Star@LabelHeight}{\@Chapter@Star@CriticLabelHeight}
\fi
\settototalheight{\@Chapter@Star@NameHeight}{\ChapterNameFont#1}
\begingroup
\pgfdeclarelayer{@Chapter@Star@Top}
\pgfdeclarelayer{@Chapter@Star@Bottom}
\pgfsetlayers{@Chapter@Star@Bottom,main,@Chapter@Star@Top}
\begin{tikzpicture}[remember picture,overlay]
\ifodd\value{page}%判断奇偶页
%%坐标点%%
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=\@FrameWidth]D);
\coordinate(H)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@Star@LabelYShift@Up]current page text area.north west);
\coordinate(Q1)at([xshift=-1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
%%
\begin{pgfonlayer}{@Chapter@Star@Top}
%%标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text width=\textwidth,align=flush left](TT)at(N){\tikz{
\node[inner sep=0mm,outer sep=0mm,anchor=north west](P1){\@HalfCircle@Label{ColorA}{\@Chapter@Star@LabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](P2)at(P1.east){\@HalfCircle@Label{ColorA!80}{\@Chapter@Star@LabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA](P3)at([xshift=\@Chapter@Star@LabelNameXSep,yshift=\@Chapter@Star@NameHeight/2-\@Chapter@Star@LabelHeight/2]P2.north east){
\begin{varwidth}{\textwidth-\@Chapter@Star@LabelHeight-\@Chapter@Star@LabelNameXSep}
#1
\end{varwidth}};}};
%%
%%渐变带%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.4]([xshift=-\@innerlen,yshift=-2\@Chapter@LabelYShift@Down/3]TT.south west)rectangle([xshift=\@outerlen,yshift=-2\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]TT.south east);
%%
%%副标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north east,font=\ChapterNameFont,text=ColorA,align=flush right,minimum height=\@Chapter@Star@LabelHeight](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth,minimum height=\@Chapter@Star@LabelHeight]TT.south east){
\begin{varwidth}{2\textwidth/3}
#2
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=\@outerlen-\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
\coordinate(J)at([xshift=-\textwidth-\@innerlen,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.5cm}
\begin{pgfonlayer}{@Chapter@Star@Bottom}
%%框架1%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](A)rectangle(C);
%%章节图片%%
\node[anchor=north west,outer sep=0mm,inner sep=0mm](U)at(A){\ifdefvoid{\@chapterimage}{}{\includegraphics[height=\paperheight,width=\paperwidth]{\@chapterimage}}};
%%框架2%%
\draw[white,fill=white](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[sharp corners]--(E)[sharp corners]--cycle;
\end{pgfonlayer}
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q)circle(\@Chapter@PageSize/2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\else
%%坐标点%%
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=\@FrameWidth]D);
\coordinate(H)at([xshift=\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@Star@LabelYShift@Up]current page text area.north east);
\coordinate(Q1)at([xshift=1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=-\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
%%
\begin{pgfonlayer}{@Chapter@Star@Top}
%%标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north east,text width=\textwidth,align=flush right](TT)at(N){\tikz{
\node[inner sep=0mm,outer sep=0mm,anchor=north west](P1){\@HalfCircle@Label{ColorA}{\@Chapter@Star@LabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](P2)at(P1.east){\@HalfCircle@Label{ColorA!80}{\@Chapter@Star@LabelHeight/2}};
\node[inner sep=0mm,outer sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA](P3)at([xshift=\@Chapter@Star@LabelNameXSep,yshift=\@Chapter@Star@NameHeight/2-\@Chapter@Star@LabelHeight/2]P2.north east){
\begin{varwidth}{\textwidth-\@Chapter@Star@LabelHeight-\@Chapter@Star@LabelNameXSep}
#1
\end{varwidth}};
}};
%%
%%渐变带%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.4]([xshift=\@innerlen,yshift=-2\@Chapter@LabelYShift@Down/3]TT.south east)rectangle([xshift=-\@outerlen,yshift=-2\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]TT.south west);
%%
%%副标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA,align=flush left,minimum height=\@Chapter@Star@LabelHeight](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth,minimum height=\@Chapter@Star@LabelHeight]TT.south west){
\begin{varwidth}{2\textwidth/3}
#2
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=-\@outerlen+\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
\coordinate(J)at([xshift=\textwidth+\@innerlen,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.5cm}
\begin{pgfonlayer}{@Chapter@Star@Bottom}
%%框架1%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](A)rectangle(C);
%%章节图片%%
\node[anchor=north east,outer sep=0mm,inner sep=0mm](U)at(A){\ifdefvoid{\@chapterimage}{}{\includegraphics[height=\paperheight,width=\paperwidth]{\@chapterimage}}};
%%框架2%%
\draw[white,fill=white](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[sharp corners]--(E)[sharp corners]--cycle;
\end{pgfonlayer}
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q)circle(\@Chapter@PageSize/2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\fi
\end{tikzpicture}
\endgroup}
%%制定章节页的侧标更新规则%%
\newcommand{\@Thumb@Step@Rule}{
\ifnum\value{@Current@TotalPartNumber}=0%若文档中到当前章时还没有部分层次
\if@mainmatter%如果在mainmatter中
\stepcounter{@Thumb@Number}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\fi\fi}
%%编号章节页%%
\titleformat{\chapter}
{}{}{0em}
{\@Thumb@Step@Rule
\@ChapterStyle{第~\thechapter~章}{#1}%章样式
\enlargethispage{-0.75cm}%修改页面大小
\thispagestyle{empty}}
[\global\chapterimage{}%清空\chapterimage
\global\chaptersaying{}]%清空\chaptersaying
%%不编号章节页%%
\titleformat{name=\chapter,numberless}
{}{}{0em}
{\@Thumb@Step@Rule
\@ChapterStarStyle{#1}{\@chaptersubtitle}%章样式
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%%间距设置%%
\titlespacing*{\chapter}{0pt}{0pt}{0pt}
%%为\chapter*添加短页眉%%
\NewCommandCopy{\OriginChapter}{\chapter}
\RenewDocumentCommand{\chapter}{s O{#3} m}{
\IfBooleanTF{#1}
{\OriginChapter*{#3\@mkboth{#2}{#2}}}
{\OriginChapter[#2]{#3}}
\vspace*{\@Chapter@VSpace}}

%%节样式%%
%%编号节样式%%
\newlength{\@Section@CircleRadius}
\newlength{\@Section@LabelHeight}
\newlength{\@Section@LabelDepth}
\newlength{\@Section@NameHeight}
\newlength{\@Section@NameDepth}
\newlength{\@Section@LabelNameXSep}
\newlength{\@Section@CriticLabelHeight}
\newlength{\@Section@Yshift}
\newlength{\@Section@LabelHeight@Front}
\newlength{\@Section@LabelHeight@Back}
\newlength{\@Section@NameWidth}
\newlength{\@Section@CriticLabelWidth}
\newlength{\@Section@LabelXSep}
\setlength{\@Section@LabelXSep}{2.5mm}
\setlength{\@Section@CriticLabelWidth}{3.0cm}
\setlength{\@Section@LabelNameXSep}{7.5mm}
\setlength{\@Section@CriticLabelHeight}{6.8mm}
%%%%
\newcommand{\@SectionStyle}[4]{
\settototalheight{\@Section@LabelHeight@Front}{\SectionLabelFont#1}
\settototalheight{\@Section@LabelHeight@Back}{\SectionLabelFont#2}
\settototalheight{\@Section@NameHeight}{\SectionNameFont#3}
\setlength{\@Section@LabelHeight}{\@Section@LabelHeight@Front/2+\@Section@LabelHeight@Back/2}
%%%%
\ifdim\@Section@LabelHeight<\@Section@CriticLabelHeight
\setlength{\@Section@LabelHeight}{\@Section@CriticLabelHeight}
\fi
%%%%
\setlength{\@Section@CircleRadius}{2\@Section@LabelHeight/3}
\setlength{\@Section@NameWidth}{\linewidth-2\@Section@CircleRadius}
\begin{flushleft}
\begin{tikzpicture}
\ifblank{#1}{
\coordinate(C)at(\@Section@CircleRadius,0);
\addtolength{\@Section@NameWidth}{-\@Section@LabelXSep}
}{\node[outer sep=0mm,inner sep=0mm,font=\SectionLabelFont](L1){\begin{varwidth}{\@Section@CriticLabelWidth}#1\end{varwidth}};
\pgfgetnodewidth(L1)\LFrontWidth
\coordinate(C)at([xshift=\@Section@LabelXSep+\@Section@CircleRadius,yshift=-\@Section@LabelHeight@Front/2]L1.north east);
\addtolength{\@Section@NameWidth}{-\LFrontWidth-\@Section@LabelXSep}}
%%%%
\draw[ColorA,fill=ColorA](C)circle(\@Section@CircleRadius);
\node[circle,outer sep=0mm,inner sep=0mm,font=\SectionLabelFont,text=white](Num)at(C){\maxsizebox{2\@Section@CircleRadius-1.0mm}{2\@Section@CircleRadius-1.0mm}{#4}};
\coordinate(L2Start)at([xshift=\@Section@LabelXSep+\@Section@CircleRadius,yshift=\@Section@LabelHeight@Back/2]C);
%%%%
\ifblank{#2}{
\ifblank{#1}{
\addtolength{\@Section@NameWidth}{-\@Section@LabelXSep}
\coordinate(NameStart)at([xshift=\@Section@LabelXSep+\@Section@CircleRadius,yshift=\@Section@NameHeight/2]C);
}{
\coordinate(NameStart)at([xshift=\@Section@LabelNameXSep+\@Section@CircleRadius,yshift=\@Section@NameHeight/2]C);
\addtolength{\@Section@NameWidth}{-\@Section@LabelNameXSep}
}
}{\node[outer sep=0mm,inner sep=0mm,font=\SectionLabelFont,anchor=north west](L2)at(L2Start){\begin{varwidth}{\@Section@CriticLabelWidth}#2\end{varwidth}};
\pgfgetnodewidth(L2)\LBackWidth
\coordinate(NameStart)at([xshift=\@Section@LabelNameXSep,yshift=-\@Section@LabelHeight@Back/2+\@Section@NameHeight/2]L2.north east);
\addtolength{\@Section@NameWidth}{-\LBackWidth-\@Section@LabelXSep-\@Section@LabelNameXSep}}
%%%%
\node[outer sep=0mm,inner sep=0mm,font=\SectionNameFont,anchor=north west](N)at(NameStart){\begin{varwidth}{\@Section@NameWidth}#3\end{varwidth}};
\end{tikzpicture}
\end{flushleft}}
%%%%
\newlength{\@Section@Star@CircleRadius}
\newlength{\@Section@Star@LabelHeight}
\newlength{\@Section@Star@LabelDepth}
\newlength{\@Section@Star@NameHeight}
\newlength{\@Section@Star@NameDepth}
\newlength{\@Section@Star@Yshift}
\newlength{\@Section@Star@LabelXSep}
\newlength{\@Section@Star@LabelNameXSep}
\newlength{\@Section@Star@CriticLabelHeight}
\newlength{\@Section@Star@NameWidth}
\setlength{\@Section@Star@LabelXSep}{2.5mm}
\setlength{\@Section@Star@LabelNameXSep}{7.5mm}
\setlength{\@Section@Star@CriticLabelHeight}{6.8mm}
%%不编号节样式%%
\newcommand{\@SectionStarStyle}[2]{
\settototalheight{\@Section@Star@LabelHeight}{\SectionLabelFont#1}
\settototalheight{\@Section@Star@NameHeight}{\SectionNameFont#2}
\ifdim\@Section@Star@LabelHeight<\@Section@Star@CriticLabelHeight
\setlength{\@Section@Star@CircleRadius}{3\@Section@Star@CriticLabelHeight/4}
\else
\setlength{\@Section@Star@CircleRadius}{3\@Section@Star@LabelHeight/4}
\fi
\setlength{\@Section@Star@NameWidth}{\linewidth-2\@Section@Star@CircleRadius}
\begin{flushleft}
\begin{tikzpicture}
\draw[ColorA!50,fill=ColorA!50](0,0)circle(\@Section@Star@CircleRadius);
\draw[white,fill=ColorA,line width=2.75pt](0,0)circle(7\@Section@Star@CircleRadius/12);
\ifblank{#1}{
\coordinate(NameStart)at(\@Section@Star@LabelXSep+\@Section@Star@CircleRadius,\@Section@Star@NameHeight/2);
\addtolength{\@Section@Star@NameWidth}{-\@Section@Star@LabelXSep}
}{
\node[outer sep=0mm,inner sep=0mm,font=\SectionLabelFont,text=ColorA,anchor=north west](L)at(\@Section@Star@LabelXSep+\@Section@Star@CircleRadius,\@Section@Star@LabelHeight/2){\begin{varwidth}{\linewidth/3}#1\end{varwidth}};
\pgfgetnodewidth(L)\LWidth
\coordinate(NameStart)at([xshift=\@Section@Star@LabelNameXSep,yshift=-\@Section@Star@LabelHeight/2+\@Section@Star@NameHeight/2]L.north east);
\addtolength{\@Section@Star@NameWidth}{-\LWidth-\@Section@Star@LabelXSep-\@Section@Star@LabelNameXSep}}
\node[outer sep=0mm,inner sep=0mm,font=\SectionNameFont,text=ColorA,anchor=north west](N)at(NameStart){\begin{varwidth}{\@Section@Star@NameWidth}#2\end{varwidth}};
\end{tikzpicture}
\end{flushleft}}
%%
%%编号节样式%%
\titleformat{\section}
{}{}{0em}{\@SectionStyle{第}{节}{#1}{\thesection}}
%%不编号节样式%%
\titleformat{name=\section,numberless}
{}{}{0em}{\@SectionStarStyle{}{#1}}
%%间距设置%%
\titlespacing*{\section}{0pt}{0pt}{0pt}
%%修改章节断页方式，使\section另起一页，而\section*不换页，并且为\section*添加短页眉%%
\NewCommandCopy{\OriginSection}{\section}
\RenewDocumentCommand{\section}{s O{#3} m}{
\IfBooleanTF{#1}
{\OriginSection*{#3\markright{#2}}}
{\if@mainmatter
\clearpage\OriginSection[#2]{#3}
\else
\OriginSection*{#3\markright{#2}\addcontentsline{toc}{section}{#2}}
\fi}}

%%小节标题样式%%
%%编号小节标题样式%%
%%设置\subsection的标题%%
\newlength{\@Subsec@Radius}
\newlength{\@Subsec@BaseYSep}
\newlength{\@Subsec@BaseXSep}
\newlength{\@Subsec@LabelTotalHeight}
\newlength{\@Subsec@NameTotalHeight}
\newlength{\@Subsec@LabelWidth}
\newlength{\@Subsec@NameWidth}
\newlength{\@Subsec@LabelYSep}
\newlength{\@Subsec@NameYSep}
\newlength{\@Subsec@LabelFrontHSkip}
\newlength{\@Subsec@LabelBackHSkip}
\newlength{\@Subsec@NameHSkip}
\newlength{\@Subsec@CriticHeight}
\newlength{\@Subsec@NameTotalWidth}
\newlength{\@Subsec@CriticWidth}
\newlength{\@Subsec@NameXShift}
%%%%
\setlength{\@Subsec@BaseYSep}{1.5mm}
\setlength{\@Subsec@LabelWidth}{\linewidth/4}
\setlength{\@Subsec@LabelFrontHSkip}{0mm}
\setlength{\@Subsec@LabelBackHSkip}{5.0mm}
\setlength{\@Subsec@NameHSkip}{5.0mm}
\setlength{\@Subsec@CriticHeight}{5.7mm}
\setlength{\@Subsec@CriticWidth}{\linewidth}
\setlength{\@Subsec@NameXShift}{0mm}
%%%%
\newcommand{\@SubsectionStyle}[3]{
\begingroup
%测量输入文字高度
\settototalheight{\@Subsec@LabelTotalHeight}{\SubsectionLabelFont#1}
\settototalheight{\@Subsec@NameTotalHeight}{\SubsectionNameFont#2}
%如果标签总高度大于标题总高度
\ifdim\@Subsec@LabelTotalHeight>\@Subsec@NameTotalHeight
\setlength{\@Subsec@LabelYSep}{\@Subsec@BaseYSep}%标签上下间隙
\setlength{\@Subsec@NameYSep}{\@Subsec@BaseYSep+\@Subsec@LabelTotalHeight/2-\@Subsec@NameTotalHeight/2}%标题上下间隙
\setlength{\@Subsec@Radius}{\@Subsec@LabelTotalHeight/2+\@Subsec@LabelYSep}%圆角半径
\else
\setlength{\@Subsec@LabelYSep}{\@Subsec@BaseYSep+\@Subsec@NameTotalHeight/2-\@Subsec@LabelTotalHeight/2}%标签上下间隙
\setlength{\@Subsec@NameYSep}{\@Subsec@BaseYSep}%标题上下间隙
\setlength{\@Subsec@Radius}{\@Subsec@NameTotalHeight/2+\@Subsec@NameYSep}%圆角半径
\fi
\setlength{\@Subsec@BaseXSep}{\@Subsec@Radius}
%%%
%如果标题和标签的高度均过小
\ifdim\@Subsec@LabelTotalHeight<\@Subsec@CriticHeight
\ifdim\@Subsec@NameTotalHeight<\@Subsec@CriticHeight
\setlength{\@Subsec@LabelYSep}{\@Subsec@BaseYSep+\@Subsec@CriticHeight/2-\@Subsec@LabelTotalHeight/2}%标签上下间隙
\setlength{\@Subsec@NameYSep}{\@Subsec@BaseYSep+\@Subsec@CriticHeight/2-\@Subsec@NameTotalHeight/2}%标题上下间隙
\setlength{\@Subsec@Radius}{\@Subsec@CriticHeight/2+\@Subsec@BaseYSep}%圆角半径
\fi\fi
%%%
\pgfdeclarelayer{@Subsec@Top}
\pgfdeclarelayer{@Subsec@Bottom}
\pgfsetlayers{@Subsec@Bottom,main,@Subsec@Top}
\begin{flushleft}
\begin{tikzpicture}
%标签绘制
\ifblank{#1}{
%若参数#1为空%%
\node[inner sep=0mm,outer sep=0mm,minimum height=2\@Subsec@Radius,minimum width=4\@Subsec@Radius](L){\hspace*{\@Subsec@LabelFrontHSkip}\hspace*{\@Subsec@LabelBackHSkip}};}{
%若参数#1不为空%%
\node[inner xsep=\@Subsec@BaseXSep,inner ysep=\@Subsec@LabelYSep,outer sep=0mm,font=\SubsectionLabelFont,text=white](L){\hspace*{\@Subsec@LabelFrontHSkip}\begin{varwidth}{\@Subsec@LabelWidth}#1\end{varwidth}\hspace*{\@Subsec@LabelBackHSkip}};}
%%%
%测量标签总宽度和总高度
\pgfgetnodewidth(L)\@Subsec@LWidth
\pgfgetnodeheight(L)\@Subsec@LHeight
\setlength{\@Subsec@NameWidth}{\linewidth-\@Subsec@LWidth-2\@Subsec@BaseXSep-\@Subsec@NameHSkip}
\setlength{\@Subsec@NameTotalWidth}{\linewidth-\@Subsec@LWidth}
%标题绘制
\ifblank{#2}{
%若参数#2为空%%
\node[inner sep=0mm,outer sep=0mm,minimum height=2\@Subsec@Radius,minimum width=\@Subsec@NameTotalWidth,anchor=north west](N)at([xshift=-\@Subsec@NameXShift]L.north east){\hspace*{\@Subsec@NameHSkip}};}{
%若参数#2不为空%%
\node[inner xsep=\@Subsec@Radius,inner ysep=\@Subsec@NameYSep,outer sep=0mm,minimum width=\@Subsec@NameTotalWidth,font=\SubsectionNameFont,text=ColorA,anchor=north west](N)at([xshift=-\@Subsec@NameXShift]L.north east){\hspace*{\@Subsec@NameHSkip}\parbox{\@Subsec@NameWidth}{#2}};}
%%%
%测量标题总宽度和总高度
\pgfgetnodewidth(N)\@Subsec@NWidth
\pgfgetnodeheight(N)\@Subsec@NHeight
\begin{pgfonlayer}{@Subsec@Bottom}
\draw[ColorA,fill=ColorA,rounded corners=\@Subsec@Radius](L.north west)rectangle(L.south east);
%%%%
\ifdim\@Subsec@LHeight>2\@Subsec@Radius
\ifdim\@Subsec@NHeight>2\@Subsec@Radius
%%标签和标题都过高的情况
%%标题底色
\draw[ColorB!7.5,fill=ColorB!7.5,rounded corners=\@Subsec@Radius](N.north west)rectangle(N.south east);
%%序号圆1
\draw[white,fill=white,line width=10.0pt]([yshift=-\@Subsec@Radius]L.north east)circle(\@Subsec@Radius);
\else
%%标签过高而标题正常的情况
%%序号圆1
\draw[white,fill=white,line width=10.0pt]([yshift=-\@Subsec@Radius]L.north east)circle(\@Subsec@Radius);
%%标题底色
\draw[ColorB!7.5,fill=ColorB!7.5](N.north west)[rounded corners=\@Subsec@Radius]--(N.north east)[rounded corners=\@Subsec@Radius]--(N.south east)[sharp corners]--(N.south west)[sharp corners]--cycle;
\fi
\else
%%序号圆1
\draw[white,fill=white,line width=10.0pt]([yshift=-\@Subsec@Radius]L.north east)circle(\@Subsec@Radius);
%%%%
\ifdim\@Subsec@NHeight>2\@Subsec@Radius
%%标签正常而标题过高的情况
\draw[ColorB!7.5,fill=ColorB!7.5](N.north west)[rounded corners=\@Subsec@Radius]--(N.north east)[rounded corners=\@Subsec@Radius]--(N.south east)[rounded corners=\@Subsec@Radius]--(N.south west)[sharp corners]--cycle;
\else
%%标签和标题都正常的情况
\draw[ColorB!7.5,fill=ColorB!7.5](N.north west)[rounded corners=\@Subsec@Radius]--(N.north east)[rounded corners=\@Subsec@Radius]--(N.south east)[sharp corners]--(N.south west)[sharp corners]--cycle;
\fi\fi
%%
%%序号圆2
\draw[ColorA,fill=white,line width=2.75pt]([yshift=-\@Subsec@Radius]L.north east)circle(\@Subsec@Radius);
\end{pgfonlayer}
%%%%
\begin{pgfonlayer}{@Subsec@Top}
%%序号
\node[font=\SubsectionLabelFont,text=ColorA,anchor=center,inner sep=0mm](Num)at([yshift=-\@Subsec@Radius]L.north east){\maxsizebox{2\@Subsec@Radius}{!}{#3}};
\end{pgfonlayer}
\end{tikzpicture}
\end{flushleft}
\endgroup}

%%%%
%%不编号小节标题样式%%
%%不编号小节副标题%%
\newcommand*{\subsectionsubtitle}[1]{\def\@subsectionsubtitle{#1}}
\subsectionsubtitle{}
%%%%
\newlength{\@Subsec@Star@Radius}
\newlength{\@Subsec@Star@BaseYSep}
\newlength{\@Subsec@Star@BaseXSep}
\newlength{\@Subsec@Star@LabelTotalHeight}
\newlength{\@Subsec@Star@NameTotalHeight}
\newlength{\@Subsec@Star@LabelWidth}
\newlength{\@Subsec@Star@NameWidth}
\newlength{\@Subsec@Star@LabelYSep}
\newlength{\@Subsec@Star@NameYSep}
\newlength{\@Subsec@Star@LabelFrontHSkip}
\newlength{\@Subsec@Star@LabelBackHSkip}
\newlength{\@Subsec@Star@NameHSkip}
\newlength{\@Subsec@Star@CriticHeight}
\newlength{\@Subsec@Star@NameTotalWidth}
\newlength{\@Subsec@Star@CriticWidth}
\newlength{\@Subsec@Star@NameXShift}
%%%%
\setlength{\@Subsec@Star@BaseYSep}{1.5mm}
\setlength{\@Subsec@Star@LabelWidth}{\linewidth/2}
\setlength{\@Subsec@Star@LabelFrontHSkip}{1.0cm}
\setlength{\@Subsec@Star@LabelBackHSkip}{0mm}
\setlength{\@Subsec@Star@NameHSkip}{0mm}
\setlength{\@Subsec@Star@CriticHeight}{5.7mm}
\setlength{\@Subsec@Star@CriticWidth}{\linewidth}
\setlength{\@Subsec@Star@NameXShift}{0mm}
%%%%
\newcommand{\@SubsectionStarStyle}[2]{
\begingroup
\pgfdeclarelayer{@Subsec@Star@Top}
\pgfdeclarelayer{@Subsec@Star@Bottom}
\pgfsetlayers{@Subsec@Star@Bottom,main,@Subsec@Star@Top}
\begin{flushleft}
\begin{tikzpicture}
%%测量输入文字高度
\settototalheight{\@Subsec@Star@LabelTotalHeight}{\pgfinterruptpicture\SubsectionLabelFont#1\endpgfinterruptpicture}
\settototalheight{\@Subsec@Star@NameTotalHeight}{\pgfinterruptpicture\SubsectionNameFont#2\endpgfinterruptpicture}
%%%%
%%如果标签总高度大于标题总高度
\ifdim\@Subsec@Star@LabelTotalHeight>\@Subsec@Star@NameTotalHeight
\setlength{\@Subsec@Star@LabelYSep}{\@Subsec@Star@BaseYSep}%标签上下间隙
\setlength{\@Subsec@Star@NameYSep}{\@Subsec@Star@BaseYSep+\@Subsec@Star@LabelTotalHeight/2-\@Subsec@Star@NameTotalHeight/2}%标题上下间隙
\setlength{\@Subsec@Star@Radius}{\@Subsec@Star@LabelTotalHeight/2+\@Subsec@Star@LabelYSep}%圆角半径
\else
\setlength{\@Subsec@Star@LabelYSep}{\@Subsec@Star@BaseYSep+\@Subsec@Star@NameTotalHeight/2-\@Subsec@Star@LabelTotalHeight/2}%标签上下间隙
\setlength{\@Subsec@Star@NameYSep}{\@Subsec@Star@BaseYSep}%标题上下间隙
\setlength{\@Subsec@Star@Radius}{\@Subsec@Star@NameTotalHeight/2+\@Subsec@Star@NameYSep}%圆角半径
\fi
\setlength{\@Subsec@Star@BaseXSep}{\@Subsec@Star@Radius}
%%%%
%%如果标题和标签的高度均过小
\ifdim\@Subsec@Star@LabelTotalHeight<\@Subsec@Star@CriticHeight
\ifdim\@Subsec@Star@NameTotalHeight<\@Subsec@Star@CriticHeight
\setlength{\@Subsec@Star@LabelYSep}{\@Subsec@Star@BaseYSep+\@Subsec@Star@CriticHeight/2-\@Subsec@Star@LabelTotalHeight/2}%标签上下间隙
\setlength{\@Subsec@Star@NameYSep}{\@Subsec@Star@BaseYSep+\@Subsec@Star@CriticHeight/2-\@Subsec@Star@NameTotalHeight/2}%标题上下间隙
\setlength{\@Subsec@Star@Radius}{\@Subsec@Star@CriticHeight/2+\@Subsec@Star@BaseYSep}%圆角半径
\fi\fi
%%inner xsep的值为序号圆1和序号圆2边宽度差值的一半
\node[inner xsep=-3.625pt,inner ysep=0mm,outer sep=0mm]{\tikz{
%%标签绘制
\ifblank{#1}{
%%若参数#1为空%%
\node[inner sep=0mm,outer sep=0mm,minimum height=2\@Subsec@Star@Radius,minimum width=4\@Subsec@Star@Radius](L){\hspace*{\@Subsec@Star@LabelFrontHSkip}\hspace*{\@Subsec@Star@LabelBackHSkip}};}{
%%若参数#1不为空%%
\node[inner xsep=\@Subsec@Star@BaseXSep,inner ysep=\@Subsec@Star@LabelYSep,outer sep=0mm,font=\SubsectionLabelFont,text=white](L){\hspace*{\@Subsec@Star@LabelFrontHSkip}\begin{varwidth}{\@Subsec@Star@LabelWidth}#1\end{varwidth}\hspace*{\@Subsec@Star@LabelBackHSkip}};}
%%%%
%%测量标签总宽度和总高度
\pgfgetnodewidth(L)\@Subsec@Star@LWidth
\pgfgetnodeheight(L)\@Subsec@Star@LHeight
\setlength{\@Subsec@Star@NameWidth}{\linewidth-\@Subsec@Star@LWidth-2\@Subsec@Star@BaseXSep-\@Subsec@Star@NameHSkip}
\setlength{\@Subsec@Star@NameTotalWidth}{\linewidth-\@Subsec@Star@LWidth}
%%标题绘制
\ifblank{#2}{
%%若参数#2为空%%
\node[inner sep=0mm,outer sep=0mm,minimum height=2\@Subsec@Star@Radius,minimum width=\@Subsec@Star@NameTotalWidth,anchor=north west](N)at([xshift=-\@Subsec@Star@NameXShift]L.north east){\hspace*{\@Subsec@Star@NameHSkip}};}{
%%若参数#2不为空%%
\node[inner xsep=\@Subsec@Star@Radius,inner ysep=\@Subsec@Star@NameYSep,outer sep=0mm,minimum width=\@Subsec@Star@NameTotalWidth,font=\SubsectionNameFont,text=ColorA,anchor=north west](N)at([xshift=-\@Subsec@Star@NameXShift]L.north east){\hspace*{\@Subsec@Star@NameHSkip}\parbox{\@Subsec@Star@NameWidth}{#2}};}
%%%%
%%测量标题总宽度和总高度
\pgfgetnodewidth(N)\@Subsec@Star@NWidth
\pgfgetnodeheight(N)\@Subsec@Star@NHeight
\begin{pgfonlayer}{@Subsec@Star@Bottom}
\ifdim\@Subsec@Star@LHeight>\@Subsec@Star@NHeight
%%标签底色
\draw[ColorB!7.5,fill=ColorB!7.5,rounded corners=\@Subsec@Star@Radius](L.south west)rectangle(N.north east);
%%标题底色
\draw[ColorA,fill=ColorA,rounded corners=\@Subsec@Star@Radius](L.south west)rectangle(L.north east);
\else
%%标签底色
\draw[ColorB!7.5,fill=ColorB!7.5,rounded corners=\@Subsec@Star@Radius](L.north west)rectangle(N.south east);
%%标题底色
\draw[ColorA,fill=ColorA,rounded corners=\@Subsec@Star@Radius](L.north west)rectangle(N.south west);
\fi
\end{pgfonlayer}
%%%%
\begin{pgfonlayer}{@Subsec@Star@Top}
%%序号圆1
\draw[white,fill=white,line width=10.0pt]([xshift=\@Subsec@Star@Radius,yshift=-\@Subsec@Star@Radius]L.north west)circle(\@Subsec@Star@Radius);
%%序号圆2
\draw[ColorA,fill=white,line width=2.75pt]([xshift=\@Subsec@Star@Radius,yshift=-\@Subsec@Star@Radius]L.north west)circle(\@Subsec@Star@Radius);
%%序号圆3
\draw[ColorA,fill=ColorA]([xshift=\@Subsec@Star@Radius,yshift=-\@Subsec@Star@Radius]L.north west)circle(\@Subsec@Star@Radius/2);
\end{pgfonlayer}}};
\end{tikzpicture}
\end{flushleft}
\endgroup}
%%%%
%%编号小节样式%%
\titleformat{\subsection}
{}{}{0em}
{\@SubsectionStyle{课时}{#1}{\thesubsection}}
%%不编号小节样式%%
\titleformat{name=\subsection,numberless}
{}{}{0em}
{\@SubsectionStarStyle{#1}{}}
[\global\subsectionsubtitle{}]%清空\subsectionsubtitle
%%间距设置%%
\titlespacing*{\subsection}{0pt}{-20pt}{-20pt}
%%%%
\NewCommandCopy{\OriginSubsection}{\subsection}
\RenewDocumentCommand{\subsection}{s O{#3} m}{
\IfBooleanTF{#1}
{\OriginSubsection*{#3}}
{\if@mainmatter
\OriginSubsection[#2]{#3}
\else
\OriginSubsection*{#3\addcontentsline{toc}{subsection}{#2}}
\fi}}
%%%%
%%点样式%%
\newlength{\SubsubSec@NameHeight}
\newlength{\SubsubSec@NameDepth}
\newlength{\SubsubSec@LabelNameXSep}
\setlength{\SubsubSec@LabelNameXSep}{0.25cm}
\newcommand{\@SubsubsectionStyle}[2]{\settototalheight{\SubsubSec@NameHeight}{\SubsubsectionNameFont#2}\settodepth{\SubsubSec@NameDepth}{\SubsubsectionNameFont#2}\tikz[baseline=-\SubsubSec@NameHeight/2+\SubsubSec@NameDepth]{\node[outer sep=0mm,inner sep=0mm,font=\SubsubsectionLabelFont,text=ColorB]{\@HalfCircle@Label{ColorB}{\SubsubSec@NameHeight/2+0.75mm}};}\ifblank{#1}{#1}{\hspace*{\SubsubSec@LabelNameXSep}\SubsubsectionNameFont#1}}
%%
\titleformat{\subsubsection}
{}{\@SubsubsectionStyle{}{#1}}{\SubsubSec@LabelNameXSep}{\SubsubsectionNameFont\color{ColorB}#1}
%%
\titleformat{name=\subsubsection,numberless}
{}{\@SubsubsectionStyle{}{#1}}{\SubsubSec@LabelNameXSep}{\SubsubsectionNameFont\color{ColorB}#1}
%%间距设置%%
\titlespacing*{\subsubsection}{0pt}{5pt}{5pt}
%%修改段落样式%%
\renewcommand{\paragraph}{
\@startsection{paragraph}{4}{\z@}
{3.25ex \@plus1.0ex \@minus0.2ex}{-1em}
{\ParagraphNameFont\color{ColorA}}}
%%%%
%%练习题面板标题%%
\newlength{\@ExerciseTitle@Height}
\newlength{\@ExerciseTitle@YSep}
\newlength{\@ExerciseTitle@BaseYSep}
\setlength{\@ExerciseTitle@BaseYSep}{1.25mm}
\newlength{\@ExerciseTitle@CriticHeight}
\setlength{\@ExerciseTitle@CriticHeight}{4.7mm}
\newlength{\@ExerciseTitle@Radius}
%%
\newcommand{\ExerciseTitle}[1]{
\settototalheight{\@ExerciseTitle@Height}{\ExerciseTitleFont#1}
\ifdim\@ExerciseTitle@Height>\@ExerciseTitle@CriticHeight
\setlength{\@ExerciseTitle@YSep}{\@ExerciseTitle@BaseYSep}
\else
\setlength{\@ExerciseTitle@YSep}{\@ExerciseTitle@CriticHeight/2-\@ExerciseTitle@Height/2+\@ExerciseTitle@BaseYSep}
\fi
\setlength{\@ExerciseTitle@Radius}{\@ExerciseTitle@Height/2+\@ExerciseTitle@YSep}
%%
\begingroup
\pgfdeclarelayer{Exercise@Top}
\pgfdeclarelayer{Exercise@Bottom}
\pgfsetlayers{Exercise@Bottom,main,Exercise@Top}
\begin{center}
\begin{tikzpicture}
\node[draw=ColorB,fill=ColorB,ultra thick,rounded corners=1.0mm,font=\ExerciseTitleFont,text=white,outer sep=0mm,inner xsep=4.0mm,inner ysep=\@ExerciseTitle@YSep,align=center](E){
\begin{varwidth}{\linewidth/2}
#1
\end{varwidth}};
\begin{pgfonlayer}{Exercise@Bottom}
\draw[draw=ColorB!50,fill=ColorB!50,ultra thick,rounded corners={\@ExerciseTitle@Radius+\@ExerciseTitle@BaseYSep}]([xshift=-6.0mm,yshift=\@ExerciseTitle@BaseYSep]E.north west)rectangle([xshift=6.0mm,yshift=-\@ExerciseTitle@BaseYSep]E.south east);
\end{pgfonlayer}
\end{tikzpicture}
\end{center}
\endgroup}
\makeatother

%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%%%
%%目录页码右侧空格%%
\contentsmargin{4.0mm}
\makeatletter
%%标签绘制%%
\newlength{\@Ptc@Radius}
\newlength{\@Ptc@BaseYSep}
\newlength{\@Ptc@BaseXSep}
\newlength{\@Ptc@LabelTotalHeight}
\newlength{\@Ptc@NameTotalHeight}
\newlength{\@Ptc@LabelWidth}
\newlength{\@Ptc@NameWidth}
\newlength{\@Ptc@LabelYSep}
\newlength{\@Ptc@NameYSep}
\newlength{\@Ptc@LabelFrontHSkip}
\newlength{\@Ptc@LabelBackHSkip}
\newlength{\@Ptc@NameHSkip}
\newlength{\@Ptc@CriticHeight}
\newlength{\@Ptc@NameTotalWidth}
\newlength{\@Ptc@CriticWidth}
\newlength{\@Ptc@NameXShift}
%%%%
\setlength{\@Ptc@BaseYSep}{1.5mm}
\setlength{\@Ptc@LabelWidth}{\linewidth/4}
\setlength{\@Ptc@LabelFrontHSkip}{0mm}
\setlength{\@Ptc@LabelBackHSkip}{0mm}
\setlength{\@Ptc@NameHSkip}{0mm}
\setlength{\@Ptc@CriticHeight}{5.7mm}
\setlength{\@Ptc@CriticWidth}{\linewidth}
\setlength{\@Ptc@NameXShift}{0mm}
%%%%
\newcommand{\@Ptc@DoubleTextBox}[2]{\begingroup\pgfdeclarelayer{@Ptc@Top}\pgfdeclarelayer{@Ptc@Bottom}\pgfsetlayers{@Ptc@Bottom,main,@Ptc@Top}\tikz{\settototalheight{\@Ptc@LabelTotalHeight}{\pgfinterruptpicture\TocPartFont#1\endpgfinterruptpicture}\settototalheight{\@Ptc@NameTotalHeight}{\pgfinterruptpicture\TocPartFont#2\endpgfinterruptpicture}
%如果标签总高度大于标题总高度
\ifdim\@Ptc@LabelTotalHeight>\@Ptc@NameTotalHeight
\setlength{\@Ptc@LabelYSep}{\@Ptc@BaseYSep}%标签上下间隙
\setlength{\@Ptc@NameYSep}{\@Ptc@BaseYSep+\@Ptc@LabelTotalHeight/2-\@Ptc@NameTotalHeight/2}%标题上下间隙
\setlength{\@Ptc@Radius}{\@Ptc@LabelTotalHeight/2+\@Ptc@LabelYSep}%圆角半径
\else
\setlength{\@Ptc@LabelYSep}{\@Ptc@BaseYSep+\@Ptc@NameTotalHeight/2-\@Ptc@LabelTotalHeight/2}%标签上下间隙
\setlength{\@Ptc@NameYSep}{\@Ptc@BaseYSep}%标题上下间隙
\setlength{\@Ptc@Radius}{\@Ptc@NameTotalHeight/2+\@Ptc@NameYSep}%圆角半径
\fi
\setlength{\@Ptc@BaseXSep}{\@Ptc@Radius}
%%%
%如果标题和标签的高度均过小
\ifdim\@Ptc@LabelTotalHeight<\@Ptc@CriticHeight
\ifdim\@Ptc@NameTotalHeight<\@Ptc@CriticHeight
\setlength{\@Ptc@LabelYSep}{\@Ptc@BaseYSep+\@Ptc@CriticHeight/2-\@Ptc@LabelTotalHeight/2}%标签上下间隙
\setlength{\@Ptc@NameYSep}{\@Ptc@BaseYSep+\@Ptc@CriticHeight/2-\@Ptc@NameTotalHeight/2}%标题上下间隙
\setlength{\@Ptc@Radius}{\@Ptc@CriticHeight/2+\@Ptc@BaseYSep}%圆角半径
\fi\fi
\ifblank{#1}{
\node[inner sep=0mm,outer sep=0mm,minimum height=2\@Ptc@Radius,minimum width=4\@Ptc@Radius](L){\hspace*{\@Ptc@LabelFrontHSkip}\hspace*{\@Ptc@LabelBackHSkip}};}{
%若参数#1不为空%%
\node[inner xsep=\@Ptc@BaseXSep,inner ysep=\@Ptc@LabelYSep,outer sep=0mm,font=\TocPartFont,text=white](L){\hspace*{\@Ptc@LabelFrontHSkip}\begin{varwidth}{\@Ptc@LabelWidth}#1\end{varwidth}\hspace*{\@Ptc@LabelBackHSkip}};}
%测量标签总宽度和总高度
\pgfgetnodewidth(L)\@Ptc@LWidth
\pgfgetnodeheight(L)\@Ptc@LHeight
\setlength{\@Ptc@NameWidth}{\linewidth-\@Ptc@LWidth-2\@Ptc@BaseXSep-\@Ptc@NameHSkip}
\setlength{\@Ptc@NameTotalWidth}{\linewidth-\@Ptc@LWidth}
%标题绘制
\ifblank{#2}{\node[inner sep=0mm,outer sep=0mm,minimum height=2\@Ptc@Radius,minimum width=\@Ptc@NameTotalWidth,anchor=north west](N)at([xshift=-\@Ptc@NameXShift]L.north east){\hspace*{\@Ptc@NameHSkip}};}{
%若参数#2不为空%%
\node[inner xsep=\@Ptc@Radius,inner ysep=\@Ptc@NameYSep,outer sep=0mm,minimum width=\@Ptc@NameTotalWidth,font=\TocPartFont,text=ColorA,anchor=north west](N)at([xshift=-\@Ptc@NameXShift]L.north east){\hspace*{\@Ptc@NameHSkip}\parbox{\@Ptc@NameWidth}{#2}};}
%%%
%测量标题总宽度和总高度
\pgfgetnodewidth(N)\@Ptc@NWidth
\pgfgetnodeheight(N)\@Ptc@NHeight
\begin{pgfonlayer}{@Ptc@Bottom}
\ifdim\@Ptc@LHeight>\@Ptc@NHeight
%%标签底色
\draw[ColorA,fill=ColorA](L.north east)--(L.south east)[rounded corners=\@Ptc@Radius]--(L.south west)[rounded corners=\@Ptc@Radius]--(L.north west)[sharp corners]--cycle;
%%标题底色
\draw[ColorB!7.5,fill=ColorB!7.5](N.north west)[rounded corners=\@Ptc@Radius]--(N.north east)[rounded corners=\@Ptc@Radius]--([yshift=-\@Ptc@LHeight]N.north east)[sharp corners]--(L.south east)[sharp corners]--cycle;
\else
%%标签底色
\draw[ColorA,fill=ColorA](L.north west)[sharp corners]--(L.north east)--(N.south west)[rounded corners=\@Ptc@Radius]--([xshift=-\@Ptc@LWidth]N.south west)[rounded corners=\@Ptc@Radius]--cycle;
%%标题底色
\draw[ColorB!7.5,fill=ColorB!7.5](N.north west)[sharp corners]--(N.south west)[rounded corners=\@Ptc@Radius]--(N.south east)[rounded corners=\@Ptc@Radius]--(N.north east)[sharp corners]--cycle;
\fi
\end{pgfonlayer}}
\endgroup}
%%
%%编号部分目录样式%%
\newcommand{\@Toc@Part@Numbered}[1]{\contentslabel[\@Ptc@DoubleTextBox{第~\thecontentslabel~部分}{#1\hfill\thecontentspage}]{1.25cm}}
%%
%%不编号部分目录样式%%
\newcommand{\@Toc@Part@Unnumbered}[1]{\contentslabel[\@Ptc@DoubleTextBox{#1}{\hfill\thecontentspage}]{1.25cm}}
%%
%%部分目录样式%%
\titlecontents{part}[1.25cm]
{\addvspace{20pt}\hypersetup{linkcolor=white}}
{\@Toc@Part@Numbered}
{\@Toc@Part@Unnumbered}{}
%%章目录样式%%
\gdef\@Chapter@Toc@Label{
\if@appendix%如果章在相应环境里，则修改目录前缀
附录~\thecontentslabel~
\else
\if@test
试题~\thecontentslabel~
\else
第~\thecontentslabel~章
\fi\fi}
%%%%
\newlength{\@Toc@ChapterContents@XSep}
\setlength{\@Toc@ChapterContents@XSep}{2.45cm}
\newlength{\@Toc@ChapterLabelName@XSep}
\setlength{\@Toc@ChapterLabelName@XSep}{2.0cm}
%%
\titlecontents{chapter}[\@Toc@ChapterContents@XSep]
{\addvspace{0pt}\TocChapterFont\color{ColorA}\hypersetup{linkcolor=ColorA}}
{\color{ColorA}\contentslabel[\@Chapter@Toc@Label]{\@Toc@ChapterLabelName@XSep}}
{\color{ColorA}\hspace*{-\@Toc@ChapterLabelName@XSep}}%不编号章节
{\titlerule*[6pt]{ }\color{ColorA}\ContentPageNumFont\thecontentspage}
%%%%
\gdef\@Section@Toc@Label{
\if@appendix
列表~\thecontentslabel~
\else
\if@test
题类~\thecontentslabel~
\else
\if@topic%如果节在相应环境里，则修改目录前缀
专题~\thecontentslabel~
\else
\if@project
课题~\thecontentslabel~
\else
\if@quiz
测试~\thecontentslabel~
\else
第~\thecontentslabel~节
\fi\fi\fi\fi\fi}
%%%%
\newlength{\@Toc@SectionContents@XSep}
\setlength{\@Toc@SectionContents@XSep}{2.45cm}
\newlength{\@Toc@SectionLabelName@XSep}
\setlength{\@Toc@SectionLabelName@XSep}{2.0cm}
%%
%%节目录样式%%
\titlecontents{section}[\@Toc@SectionContents@XSep]
{\addvspace{-5.0pt}\TocSectionFont}
{\contentslabel[\@Section@Toc@Label]{\@Toc@SectionLabelName@XSep}}
{\hspace*{-\@Toc@SectionLabelName@XSep}}%不编号章节
{\titlerule*[6pt]{ }\ContentPageNumFont\thecontentspage}
%%%%
\gdef\@Subsection@Toc@Label{
\if@appendix
条目~\thecontentslabel~
\else
\if@test
题目~\thecontentslabel~
\else
\if@topic%如果节在相应环境里，则修改目录前缀
考点~\thecontentslabel~
\else
\if@project
项目~\thecontentslabel~
\else
\if@quiz
题组~\thecontentslabel~
\else
课时~\thecontentslabel~
\fi\fi\fi\fi\fi}
%%%%
\newlength{\@Toc@SubsecContents@XSep}
\setlength{\@Toc@SubsecContents@XSep}{4.3cm}
\newlength{\@Toc@SubsecLabelName@XSep}
\setlength{\@Toc@SubsecLabelName@XSep}{2.0cm}
%%
%%小节目录样式%%
\titlecontents{subsection}[\@Toc@SubsecContents@XSep]
{\addvspace{-5.0pt}\TocSubsectionFont\color{ColorC}}
{\contentslabel[\@Subsection@Toc@Label]{\@Toc@SubsecLabelName@XSep}}
{\hspace*{-\@Toc@SubsecLabelName@XSep}}%不编号章节
{\titlerule*[6pt]{ }\ContentPageNumFont\color{ColorC}\thecontentspage}
%%图片目录样式%%
\titlecontents{figure}[2.5cm]
{\addvspace{-5.0pt}\LofFont}
{\contentslabel[图~\thecontentslabel~]{1.9cm}}
{\hspace*{-1.9cm}}%不编号图表
{\titlerule*[6pt]{ }\ContentPageNumFont\thecontentspage}
%%表格目录样式%%
\titlecontents{table}[2.5cm]
{\addvspace{-5.0pt}\LotFont}
{\contentslabel[表~\thecontentslabel~]{1.9cm}}
{\hspace*{-1.9cm}}%不编号图表
{\titlerule*[6pt]{ }\ContentPageNumFont\thecontentspage}
%%部分页上的小目录章样式%%
\titlecontents{lchapter}[0.75cm]
{\addvspace{-5.0pt}\TocLChapterFont\hypersetup{linkcolor=ColorB}}
{\color{ColorB}\contentslabel[\bfseries\faGenderless]{0.6cm}}
{\color{ColorB}\contentslabel[\bfseries\faGenderless]{0.6cm}}%不编号章节
{}
%%部分页上的小目录节样式%%
\titlecontents{lsection}[0.9cm]
{\addvspace{-5.0pt}\TocLSectionFont}
{\contentslabel[\faGenderless]{0.5cm}}
{\contentslabel[\faGenderless]{0.5cm}}%不编号章节
{}
%%部分页上的小目录小节样式%%
\titlecontents{lsubsection}[0.9cm]
{\addvspace{-5.0pt}\TocLSubsectionFont}
{\contentslabel[\faGenderless]{0.5cm}}
{\contentslabel[\faGenderless]{0.5cm}}%不编号章节
{}
\makeatother

%%%%%%%%%%%%%%%%%% 环境定义和命令定义 %%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\newlength{\@Eg@ContentHeight}
\newlength{\@Eg@ContentDepth}
\newcommand{\@basenode}[2]{
\settototalheight{\@Eg@ContentHeight}{#2}
\settodepth{\@Eg@ContentDepth}{#2}
\tikz[baseline=-\@Eg@ContentHeight/2+\@Eg@ContentDepth]{\node[inner sep=0mm,outer sep=0mm](E){#1};}\vspace*{0.5em}\hspace*{1.0em}#2}
%%设置例题命令%%
\newlength{\@Eg@Radius}
\newlength{\@Eg@BaseYSep}
\newlength{\@Eg@BaseXSep}
\newlength{\@Eg@LabelTotalHeight}
\newlength{\@Eg@NameTotalHeight}
\newlength{\@Eg@LabelWidth}
\newlength{\@Eg@NameWidth}
\newlength{\@Eg@LabelYSep}
\newlength{\@Eg@NameYSep}
\newlength{\@Eg@LabelFrontHSkip}
\newlength{\@Eg@LabelBackHSkip}
\newlength{\@Eg@NameHSkip}
\newlength{\@Eg@CriticHeight}
\newlength{\@Eg@NameTotalWidth}
\newlength{\@Eg@CriticWidth}
\newlength{\@Eg@NameXShift}
%%%%
\setlength{\@Eg@BaseYSep}{1.0mm}
\setlength{\@Eg@LabelWidth}{\linewidth/4}
\setlength{\@Eg@LabelFrontHSkip}{0mm}
\setlength{\@Eg@LabelBackHSkip}{0mm}
\setlength{\@Eg@NameHSkip}{0mm}
\setlength{\@Eg@CriticHeight}{4.7mm}
\setlength{\@Eg@CriticWidth}{\linewidth/2}
\setlength{\@Eg@NameXShift}{0mm}
%%%%
\newcommand{\@Eg@Title}[3]{\begingroup\pgfdeclarelayer{@Eg@Top}\pgfdeclarelayer{@Eg@Bottom}\pgfsetlayers{@Eg@Bottom,main,@Eg@Top}\tikz{\settototalheight{\@Eg@LabelTotalHeight}{\pgfinterruptpicture\EgLabelFont#1\endpgfinterruptpicture}\settototalheight{\@Eg@NameTotalHeight}{\pgfinterruptpicture\EgLabelFont#2\endpgfinterruptpicture}
%如果标签总高度大于标题总高度
\ifdim\@Eg@LabelTotalHeight>\@Eg@NameTotalHeight
\setlength{\@Eg@LabelYSep}{\@Eg@BaseYSep}%标签上下间隙
\setlength{\@Eg@NameYSep}{\@Eg@BaseYSep+\@Eg@LabelTotalHeight/2-\@Eg@NameTotalHeight/2}%标题上下间隙
\setlength{\@Eg@Radius}{\@Eg@LabelTotalHeight/2+\@Eg@LabelYSep}%圆角半径
\else
\setlength{\@Eg@LabelYSep}{\@Eg@BaseYSep+\@Eg@NameTotalHeight/2-\@Eg@LabelTotalHeight/2}%标签上下间隙
\setlength{\@Eg@NameYSep}{\@Eg@BaseYSep}%标题上下间隙
\setlength{\@Eg@Radius}{\@Eg@NameTotalHeight/2+\@Eg@NameYSep}%圆角半径
\fi
\setlength{\@Eg@BaseXSep}{\@Eg@Radius}
%%%
%如果标题和标签的高度均过小
\ifdim\@Eg@LabelTotalHeight<\@Eg@CriticHeight
\ifdim\@Eg@NameTotalHeight<\@Eg@CriticHeight
\setlength{\@Eg@LabelYSep}{\@Eg@BaseYSep+\@Eg@CriticHeight/2-\@Eg@LabelTotalHeight/2}%标签上下间隙
\setlength{\@Eg@NameYSep}{\@Eg@BaseYSep+\@Eg@CriticHeight/2-\@Eg@NameTotalHeight/2}%标题上下间隙
\setlength{\@Eg@Radius}{\@Eg@CriticHeight/2+\@Eg@BaseYSep}%圆角半径
\fi\fi
%标签绘制
\ifblank{#1}{
%若参数#1为空%%
\node[inner sep=0mm,outer sep=0mm,minimum height=2\@Eg@Radius,minimum width=4\@Eg@Radius](L){\hspace*{\@Eg@LabelFrontHSkip}\hspace*{\@Eg@LabelBackHSkip}};}{
%若参数#1不为空%%
\node[inner xsep=\@Eg@BaseXSep,inner ysep=\@Eg@LabelYSep,outer sep=0mm,font=\EgLabelFont,text=white](L){\hspace*{\@Eg@LabelFrontHSkip}\begin{varwidth}{\@Eg@LabelWidth}#1\end{varwidth}\hspace*{\@Eg@LabelBackHSkip}};}
%%%
%测量标签总宽度和总高度
\pgfgetnodewidth(L)\@Eg@LWidth
\pgfgetnodeheight(L)\@Eg@LHeight
\setlength{\@Eg@NameWidth}{\@Eg@CriticWidth-\@Eg@LWidth-2\@Eg@BaseXSep-\@Eg@NameHSkip}
\setlength{\@Eg@NameTotalWidth}{\@Eg@CriticWidth-\@Eg@LWidth}
%标题绘制
\ifblank{#2}{
%若参数#2为空%%
\node[inner sep=0mm,outer sep=0mm,minimum height=2\@Eg@Radius,minimum width=4\@Eg@Radius,anchor=north west](N)at([xshift=-\@Eg@NameXShift]L.north east){\hspace*{\@Eg@NameHSkip}};}{
%若参数#2不为空%%
\node[inner xsep=\@Eg@Radius,inner ysep=\@Eg@NameYSep,outer sep=0mm,font=\EgLabelFont,text=#3,anchor=north west](N)at([xshift=-\@Eg@NameXShift]L.north east){\hspace*{\@Eg@NameHSkip}\begin{varwidth}{\@Eg@NameWidth}#2\end{varwidth}};}
%%%
%测量标题总宽度和总高度
\pgfgetnodewidth(N)\@Eg@NWidth
\pgfgetnodeheight(N)\@Eg@NHeight
\begin{pgfonlayer}{@Eg@Bottom}
\ifdim\@Eg@LHeight>\@Eg@NHeight
\draw[#3,fill=#3,ultra thick,rounded corners=\@Eg@Radius](L.north east)rectangle(L.south west);
\draw[#3,fill=white,ultra thick,rounded corners=\@Eg@Radius](N.north east)rectangle([xshift=-2\@Eg@Radius]L.south east);
\else
\draw[#3,fill=#3,ultra thick,rounded corners=\@Eg@Radius](L.north west)rectangle([xshift=2\@Eg@Radius]N.south west);
\draw[#3,fill=white,ultra thick,rounded corners=\@Eg@Radius](N.north west)rectangle(N.south east);
\fi
\end{pgfonlayer}}
\endgroup}
%%%%
\newlength{\@Ans@Radius}
\newlength{\@Ans@TotalHeight}
\newlength{\@Ans@CriticHeight}
\newlength{\@Ans@BaseYSep}
\newlength{\@Ans@YSep}
\newlength{\@Ans@BaseXSep}
\newlength{\@Ans@XSep}
%%%%
\setlength{\@Ans@CriticHeight}{5.0mm}
\setlength{\@Ans@BaseYSep}{1.0mm}
%%%%
%%设置解答命令%%
\newcommand{\@Ans@Title}[2]{\begingroup\pgfdeclarelayer{@Ans@Top}\pgfdeclarelayer{@Ans@Bottom}\pgfsetlayers{@Ans@Bottom,main,@Ans@Top}\tikz{\settototalheight{\@Ans@TotalHeight}{\pgfinterruptpicture\EgLabelFont#1\endpgfinterruptpicture}
\ifdim\@Ans@TotalHeight<\@Ans@CriticHeight
\setlength{\@Ans@YSep}{\@Ans@BaseYSep+\@Ans@CriticHeight/2-\@Ans@TotalHeight/2}%标签上下间隙
\else
\setlength{\@Ans@YSep}{\@Ans@BaseYSep}%标签上下间隙
\fi
\setlength{\@Ans@Radius}{\@Ans@TotalHeight/2+\@Ans@YSep}%圆角半径
\setlength{\@Ans@XSep}{\@Ans@Radius}%圆角半径
%%%%
%%标签绘制
\ifblank{#1}{
\node[inner sep=0mm,outer sep=0mm,minimum height=2\@Ans@Radius,minimum width=4\@Ans@Radius](L){#1};
}{\node[inner xsep=\@Ans@XSep,inner ysep=\@Ans@YSep,outer sep=0mm,font=\EgLabelFont,text=white](L){
\begin{varwidth}{\linewidth/4}
#1
\end{varwidth}};}
%%%%
\begin{pgfonlayer}{@Ans@Bottom}
%%标签底色
\draw[#2,fill=#2,ultra thick,rounded corners=\@Ans@Radius](L.north east)rectangle(L.south west);
\end{pgfonlayer}}
\endgroup}
%%%%
%%解答%%
\NewExpandableDocumentCommand{\Answer}{sm}{
\begin{FlushLeft}
\justifying
\IfBooleanTF{#1}
{\@basenode{\@Ans@Title{解析}{ColorF}}{#2}}%带星号*
{\@basenode{\@Ans@Title{解答}{ColorG}}{#2}}
\end{FlushLeft}}
%%%%
%%例题%%
\def\@Eg@Name{例题}
\def\@Eg@Label{\thechapter.\thesection.\the@egnum}
\NewDocumentCommand{\Example}{sm}{
\begin{FlushLeft}
\justifying
\if@mainmatter
\IfBooleanTF{#1}
{\@basenode{\@Ans@Title{\@Eg@Name}{ColorA}}{#2}}%带星号*
{\stepcounter{@egnum}\@basenode{\@Eg@Title{\@Eg@Name}{\@Eg@Label}{ColorA}}{#2}}
\else
\@basenode{\@Ans@Title{\@Eg@Name}{ColorA}}{#2}
\fi
\end{FlushLeft}}
%%变式%%
\def\@Var@Name{变式}
\def\@Var@Label{\thechapter.\thesection.\the@varnum}
\NewDocumentCommand{\Variant}{sm}{
\begin{FlushLeft}
\justifying
\if@mainmatter
\IfBooleanTF{#1}
{\@basenode{\@Ans@Title{\@Var@Name}{ColorB}}{#2}}%带星号*
{\stepcounter{@varnum}\@basenode{\@Eg@Title{\@Var@Name}{\@Var@Label}{ColorB}}{#2}}
\else
\@basenode{\@Ans@Title{\@Var@Name}{ColorB}}{#2}
\fi
\end{FlushLeft}}
%%%%
%%以下为本文档类内置栏目，请谨慎修改%%
%设置环境布尔变量
\newif\if@appendix
\newif\if@quiz
\newif\if@test
\newif\if@project
\newif\if@topic
%%设置附录环境%%
\newcounter{@Outer@Appendix@Counter}%储存环境前的章计数器数值
\newcounter{@Inner@Appendix@Counter}%储存环境中的章计数器数值
\setcounter{@Inner@Appendix@Counter}{0}%将环境中的章计数器值置零
\newenvironment{Appendix}{
\@appendixtrue
%在toc文件中写入\@appendixtrue，确保目录正确生成
\addtocontents{toc}{\protect\@appendixtrue}
%修改章计数器样式为大写字母
\renewcommand{\thechapter}{\Alph{chapter}}
%修改节计数器样式为小写字母
\renewcommand{\thesection}{\alph{section}}
%修改页眉页脚章标签
\renewcommand{\chaptermark}[1]{
\if@mainmatter
\markboth{附录~\thechapter~\quad##1}{附录~\thechapter~\quad##1}
\else
\markboth{##1}{##1}
\fi}
%修改页眉页脚节标签
\renewcommand{\sectionmark}[1]{
\if@mainmatter
\markright{列表~\thesection~\quad##1}
\else
\markright{##1}
\fi}
%修改有编号章样式
\titleformat{\chapter}
{}{}{0em}
{\@Thumb@Step@Rule
\@ChapterStarStyle{附录~\thechapter~}{##1}%章样式
\enlargethispage{-0.25cm}%修改页面大小
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%%%%
%修改有编号节样式
\titleformat{\section}
{}{}{0em}{\@SectionStarStyle{列表~\thesection~}{##1}}
%%%%
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@SubsectionStarStyle{条目~\thesubsection}{##1}}
%%%%
\def\@Eg@Name{例题（附录）}
\def\@Eg@Label{\thechapter.\thesection.\the@egnum}
\def\@Var@Name{变式（附录）}
\def\@Var@Label{\thechapter.\thesection.\the@varnum}
%%%%
\def\@Exercise@Label@Numbered{拓展练习~\the@prenumber}
\def\@Exercise@Label@Unnumbered{拓展练习}
\def\@Thinking@Label@Numbered{深入思考~\the@prenumber}
\def\@Thinking@Label@Unnumbered{深入思考}
%%%%
\def\@Definiton@Title{定义（附录）\the@prenumber.\the@def}
\def\@Definiton@Label{Def(Appendix).\the@prenumber.\the@def}
%%%%
\def\@Theorem@Title{定理（附录）~\the@prenumber.\the@thm}
\def\@Theorem@Label{Thm(Appendix).\the@prenumber.\the@thm}
%%%%
\def\@Axiom@Title{公理（附录）~\the@prenumber.\the@axm}
\def\@Axiom@Label{Axm(Appendix).\the@prenumber.\the@axm}
%%%%
\def\@Lemma@Title{引理（附录）~\the@prenumber.\the@lem}
\def\@Lemma@Label{Lem(Appendix).\the@prenumber.\the@lem}
%%%%
\def\@Corollary@Title{推论（附录）~\the@prenumber.\the@colry}
\def\@Corollary@Label{Colry(Appendix).\the@prenumber.\the@colry}
%%%%
\def\@Propostion@Title{命题（附录）~\the@prenumber.\the@prop}
\def\@Proposition@Label{Prop(Appendix).\the@prenumber.\the@prop}
%%%%
%将环境前的章计数器值储存在beforecounter中
\setcounter{@Outer@Appendix@Counter}{\value{chapter}}
%将章计数器置为环境中章计数器值
\setcounter{chapter}{\value{@Inner@Appendix@Counter}}
}{\@appendixfalse
\addtocontents{toc}{\protect\@appendixfalse}
%将环境中的章计数器值储存在innercounter中
\setcounter{@Inner@Appendix@Counter}{\value{chapter}}
%将章计数器值恢复为环境前的值
\setcounter{chapter}{\value{@Outer@Appendix@Counter}}
}
%%
%%设置试题环境%%
\newcounter{@Outer@Test@Counter}%储存环境前的章计数器数值
\newcounter{@Inner@Test@Counter}%储存环境中的章计数器数值
\setcounter{@Inner@Test@Counter}{0}%将环境中的章计数器值置零
\newenvironment{Test}{
\@testtrue
%在toc文件中写入\@testtrue，确保目录正确生成
\addtocontents{toc}{\protect\@testtrue}
%修改章计数器样式为大写字母
\renewcommand{\thechapter}{\Alph{chapter}}
%修改节计数器样式为大写罗马数字
\renewcommand{\thesection}{\Roman{section}}
%修改页眉页脚章标签
\renewcommand{\chaptermark}[1]{
\if@mainmatter
\markboth{试题~\thechapter~\quad##1}{试题~\thechapter~\quad##1}
\else
\markboth{##1}{##1}
\fi}
%修改页眉页脚节标签
\renewcommand{\sectionmark}[1]{
\if@mainmatter
\markright{题类~\thesection~\quad##1}
\else
\markright{##1}
\fi}
%修改有编号章样式
\titleformat{\chapter}
{}{}{0em}
{\@Thumb@Step@Rule
\@ChapterStarStyle{试题~\thechapter~}{##1}%章样式
\enlargethispage{-0.25cm}%修改页面大小
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%%%%
%修改有编号节样式
\titleformat{\section}
{}{}{0em}{\@SectionStarStyle{题类~\thesection~}{##1}}
%%%%
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@SubsectionStarStyle{题目~\thesubsection}{##1}}
%%%%
\def\@Eg@Name{例题（试题）}
\def\@Eg@Label{\thechapter.\thesection.\the@egnum}
\def\@Var@Name{变式（试题）}
\def\@Var@Label{\thechapter.\thesection.\the@varnum}
%%%%
\def\@Exercise@Label@Numbered{补充习题~\the@prenumber}
\def\@Exercise@Label@Unnumbered{补充习题}
\def\@Thinking@Label@Numbered{错题总结~\the@prenumber}
\def\@Thinking@Label@Unnumbered{错题总结}
%%%%
\def\@Definiton@Title{定义（试题）\the@prenumber.\the@def}
\def\@Definiton@Label{Def(Test).\the@prenumber.\the@def}
%%%%
\def\@Theorem@Title{定理（试题）~\the@prenumber.\the@thm}
\def\@Theorem@Label{Thm(Test).\the@prenumber.\the@thm}
%%%%
\def\@Axiom@Title{公理（试题）~\the@prenumber.\the@axm}
\def\@Axiom@Label{Axm(Test).\the@prenumber.\the@axm}
%%%%
\def\@Lemma@Title{引理（试题）~\the@prenumber.\the@lem}
\def\@Lemma@Label{Lem(Test).\the@prenumber.\the@lem}
%%%%
\def\@Corollary@Title{推论（试题）~\the@prenumber.\the@colry}
\def\@Corollary@Label{Colry(Test).\the@prenumber.\the@colry}
%%%%
\def\@Propostion@Title{命题（试题）~\the@prenumber.\the@prop}
\def\@Proposition@Label{Prop(Test).\the@prenumber.\the@prop}
%%%%
%将环境前的章计数器值储存在beforecounter中
\setcounter{@Outer@Test@Counter}{\value{chapter}}
%将章计数器置为环境中章计数器值
\setcounter{chapter}{\value{@Inner@Test@Counter}}
}{\@testfalse
\addtocontents{toc}{\protect\@testfalse}
%将环境中的章计数器值储存在innercounter中
\setcounter{@Inner@Test@Counter}{\value{chapter}}
%将章计数器值恢复为环境前的值
\setcounter{chapter}{\value{@Outer@Test@Counter}}
}
%%
%%设置测试环境%%
\newcounter{@Outer@Quiz@Counter}%储存环境前的节计数器数值
\newcounter{@Inner@Quiz@Counter}%储存环境中的节计数器数值
\setcounter{@Inner@Quiz@Counter}{0}%将环境中的节计数器值置零
\newcounter{@Outer@Quiz@Eg@Counter}%储存环境前的例题计数器数值
\newcounter{@Inner@Quiz@Eg@Counter}%储存环境中的例题计数器数值
\setcounter{@Inner@Quiz@Eg@Counter}{0}%将环境中例题计数器值置零
\newcounter{@Outer@Quiz@Var@Counter}%储存环境前的变式计数器数值
\newcounter{@Inner@Quiz@Var@Counter}%储存环境中的变式计数器数值
\setcounter{@Inner@Quiz@Var@Counter}{0}%将环境中变式计数器值置零
\newenvironment{Quiz}{
\clearpage
\@quiztrue
%在toc文件中写入\@quiztrue，确保目录正确生成
\addtocontents{toc}{\protect\@quiztrue}
%修改页眉页脚标签
\renewcommand{\sectionmark}[1]{\markright{测试~\thesection~\quad##1}}
%环境中禁用part
\renewcommand{\part}{
\ClassError{textbook-cn}{Forbidden Part in Quiz Environment!}}
%环境中禁用chapter
\renewcommand{\chapter}{
\ClassError{textbook-cn}{Forbidden Chapter in Quiz Environment!}}
%%废弃的环境内chapter命令%%
%\RenewDocumentCommand{\chapter}{s O{##3} m}{
%\IfBooleanTF{##1}
%{\OriginChapter*{##3\@mkboth{##2}{##2}}}
%{\setcounter{@Inner@Quiz@Counter}{\value{section}}%将当前环境中的节计数器值赋给innerquizcounter
%\OriginChapter[##2]{##3}
%\setcounter{section}{\value{@Inner@Quiz@Counter}}}
%\vspace*{\@Chapter@VSpace}}
%修改有编号节样式
\titleformat{\section}
{}{}{0em}{\@SectionStyle{测试}{}{##1}{\thesection}}
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@SubsectionStyle{题组}{##1}{\thesubsection}}
%%%%
\def\@Definiton@Title{定义（测试）\thesection.\the@def}
\def\@Definiton@Label{Def(Quiz).\thesection.\the@def}
%%%%
\def\@Theorem@Title{定理（测试）~\thesection.\the@thm}
\def\@Theorem@Label{Thm(Quiz).\thesection.\the@thm}
%%%%
\def\@Axiom@Title{公理（测试）~\thesection.\the@axm}
\def\@Axiom@Label{Axm(Quiz).\thesection.\the@axm}
%%%%
\def\@Lemma@Title{引理（测试）~\thesection.\the@lem}
\def\@Lemma@Label{Lem(Quiz).\thesection.\the@lem}
%%%%
\def\@Corollary@Title{推论（测试）~\thesection.\the@colry}
\def\@Corollary@Label{Colry(Quiz).\thesection.\the@colry}
%%%%
\def\@Propostion@Title{命题（测试）~\thesection.\the@prop}
\def\@Proposition@Label{Prop(Quiz).\thesection.\the@prop}
%%%%
\def\@Eg@Name{范例}
\def\@Eg@Label{\thesection.\the@egnum}
\def\@Var@Name{变例}
\def\@Var@Label{\thesection.\the@varnum}
%%%%
\def\@Exercise@Label@Numbered{补充习题~\thesection}
\def\@Exercise@Label@Unnumbered{补充习题}
\def\@Thinking@Label@Numbered{错题总结~\thesection}
\def\@Thinking@Label@Unnumbered{错题总结}
%%%%
%将环境前的节计数器值储存在beforecounter中
\setcounter{@Outer@Quiz@Counter}{\value{section}}
%将节计数器置为环境中节计数器值
\setcounter{section}{\value{@Inner@Quiz@Counter}}
%%
%将环境前的例题计数器值储存在beforecounter中
\setcounter{@Outer@Quiz@Eg@Counter}{\value{@egnum}}
%将例题计数器置为环境中节计数器值
\setcounter{@egnum}{\value{@Inner@Quiz@Eg@Counter}}
%%
%将环境前的变式计数器值储存在beforecounter中
\setcounter{@Outer@Quiz@Var@Counter}{\value{@varnum}}
%将变式计数器置为环境中节计数器值
\setcounter{@varnum}{\value{@Inner@Quiz@Var@Counter}}
%%%%
}{\@quizfalse
\addtocontents{toc}{\protect\@quizfalse}
%将环境中的节计数器值储存在innercounter中
\setcounter{@Inner@Quiz@Counter}{\value{section}}
%将节计数器值恢复为环境前的值
\setcounter{section}{\value{@Outer@Quiz@Counter}}
%%
%将环境中的例题计数器值储存在innercounter中
\setcounter{@Inner@Quiz@Eg@Counter}{\value{@egnum}}
%将例题计数器值恢复为环境前的值
\setcounter{@egnum}{\value{@Outer@Quiz@Eg@Counter}}
%%
%将环境中的变式计数器值储存在innercounter中
\setcounter{@Inner@Quiz@Var@Counter}{\value{@varnum}}
%将变式计数器值恢复为环境前的值
\setcounter{@varnum}{\value{@Outer@Quiz@Var@Counter}}
}
%%%%

%%设置专题环境%%
\newcounter{@Outer@Topic@counter}%储存环境前的节计数器数值
\newcounter{@Inner@Topic@counter}%储存环境中的节计数器数值
\setcounter{@Inner@Topic@counter}{0}%将环境中计数器值置零
\newcounter{@Outer@Topic@Eg@Counter}%储存环境前的例题计数器数值
\newcounter{@Inner@Topic@Eg@Counter}%储存环境中的例题计数器数值
\setcounter{@Inner@Topic@Eg@Counter}{0}%将环境中例题计数器值置零
\newcounter{@Outer@Topic@Var@Counter}%储存环境前的变式计数器数值
\newcounter{@Inner@Topic@Var@Counter}%储存环境中的变式计数器数值
\setcounter{@Inner@Topic@Var@Counter}{0}%将环境中变式计数器值置零
\newenvironment{Topic}{
\clearpage
\@topictrue
%在toc文件中写入\@topictrue，确保目录正确生成
\addtocontents{toc}{\protect\@topictrue}
%修改页眉页脚标签
\renewcommand{\sectionmark}[1]{\markright{专题~\thesection~\quad##1}}
%环境中禁用part
\renewcommand{\part}{
\ClassError{textbook-cn}{Forbidden Part in Topic Environment!}}
%环境中禁用chapter
\renewcommand{\chapter}{
\ClassError{textbook-cn}{Forbidden Chapter in Topic Environment!}}
%%废弃的环境内chapter命令%%
%\RenewDocumentCommand{\chapter}{s O{##3} m}{
%\IfBooleanTF{##1}
%{\OriginChapter*{##3\@mkboth{##2}{##2}}}
%{\setcounter{@Inner@Topic@counter}{\value{section}}%将当前环境中的节计数器值赋给innertopiccounter
%\OriginChapter[##2]{##3}
%\setcounter{section}{\value{@Inner@Topic@counter}}}
%\vspace*{\@Chapter@VSpace}}
%修改有编号节样式
\titleformat{\section}
{}{}{0em}{\@SectionStyle{专题}{}{##1}{\thesection}}
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@SubsectionStyle{考点}{##1}{\thesubsection}}
%%%%
\def\@Definiton@Title{定义（专题）\thesection.\the@def}
\def\@Definiton@Label{Def(Topic).\thesection.\the@def}
%%%%
\def\@Theorem@Title{定理（专题）~\thesection.\the@thm}
\def\@Theorem@Label{Thm(Topic).\thesection.\the@thm}
%%%%
\def\@Axiom@Title{公理（专题）~\thesection.\the@axm}
\def\@Axiom@Label{Axm(Topic).\thesection.\the@axm}
%%%%
\def\@Lemma@Title{引理（专题）~\thesection.\the@lem}
\def\@Lemma@Label{Lem(Topic).\thesection.\the@lem}
%%%%
\def\@Corollary@Title{推论（专题）~\thesection.\the@colry}
\def\@Corollary@Label{Colry(Topic).\thesection.\the@colry}
%%%%
\def\@Propostion@Title{命题（专题）~\thesection.\the@prop}
\def\@Proposition@Label{Prop(Topic).\thesection.\the@prop}
%%%%
\def\@Eg@Name{典例}
\def\@Eg@Label{\thesection.\the@egnum}
\def\@Var@Name{延拓}
\def\@Var@Label{\thesection.\the@varnum}
%%%%
\def\@Exercise@Label@Numbered{针对练习~\thesection}
\def\@Exercise@Label@Unnumbered{针对练习}
\def\@Thinking@Label@Numbered{方法提炼~\thesection}
\def\@Thinking@Label@Unnumbered{方法提炼}
%%%%
%将环境前的节计数器值储存在beforecounter中
\setcounter{@Outer@Topic@counter}{\value{section}}
%将节计数器置为环境中节计数器值
\setcounter{section}{\value{@Inner@Topic@counter}}
%%
%将环境前的例题计数器值储存在beforecounter中
\setcounter{@Outer@Topic@Eg@Counter}{\value{@egnum}}
%将例题计数器置为环境中节计数器值
\setcounter{@egnum}{\value{@Inner@Topic@Eg@Counter}}
%%
%将环境前的变式计数器值储存在beforecounter中
\setcounter{@Outer@Topic@Var@Counter}{\value{@varnum}}
%将变式计数器置为环境中节计数器值
\setcounter{@varnum}{\value{@Inner@Topic@Var@Counter}}
%%%%
}{\@topicfalse
\addtocontents{toc}{\protect\@topicfalse}
%将环境中的节计数器值储存在innercounter中
\setcounter{@Inner@Topic@counter}{\value{section}}
%将节计数器值恢复为环境前的值
\setcounter{section}{\value{@Outer@Topic@counter}}
%%
%将环境中的例题计数器值储存在innercounter中
\setcounter{@Inner@Topic@Eg@Counter}{\value{@egnum}}
%将例题计数器值恢复为环境前的值
\setcounter{@egnum}{\value{@Outer@Topic@Eg@Counter}}
%%
%将环境中的变式计数器值储存在innercounter中
\setcounter{@Inner@Topic@Var@Counter}{\value{@varnum}}
%将变式计数器值恢复为环境前的值
\setcounter{@varnum}{\value{@Outer@Topic@Var@Counter}}
}
%%%%
%%设置实验环境%%
\newcounter{@Outer@Project@Counter}%储存环境前的节计数器数值
\newcounter{@Inner@Project@Counter}%储存环境中的节计数器数值
\setcounter{@Inner@Project@Counter}{0}%将环境中计数器值置零
\newcounter{@Outer@Project@Eg@Counter}%储存环境前的例题计数器数值
\newcounter{@Inner@Project@Eg@Counter}%储存环境中的例题计数器数值
\setcounter{@Inner@Project@Eg@Counter}{0}%将环境中例题计数器值置零
\newcounter{@Outer@Project@Var@Counter}%储存环境前的变式计数器数值
\newcounter{@Inner@Project@Var@Counter}%储存环境中的变式计数器数值
\setcounter{@Inner@Project@Var@Counter}{0}%将环境中变式计数器值置零
\newenvironment{Project}{
\clearpage
\@projecttrue
%在toc文件中写入\@experimenttrue，确保目录正确生成
\addtocontents{toc}{\protect\@projecttrue}
%修改页眉页脚标签
\renewcommand{\sectionmark}[1]{\markright{课题~\thesection~\quad##1}}
%环境中禁用part
\renewcommand{\part}{
\ClassError{textbook-cn}{Forbidden Part in Project Environment!}}
%环境中禁用chapter
\renewcommand{\chapter}{
\ClassError{textbook-cn}{Forbidden Chapter in Project Environment!}}
%%废弃的环境内chapter命令%%
%\RenewDocumentCommand{\chapter}{s O{##3} m}{
%\IfBooleanTF{##1}
%{\OriginChapter*{##3\@mkboth{##2}{##2}}}
%{\setcounter{@Inner@Project@Counter}{\value{section}}%将当前环境中的节计数器值赋给innerprojectcounter
%\OriginChapter[##2]{##3}
%\setcounter{section}{\value{@Inner@Project@Counter}}}
%\vspace*{\@Chapter@VSpace}}
%修改有编号节样式
\titleformat{\section}
{}{}{0em}{\@SectionStyle{课题}{}{##1}{\thesection}}
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@SubsectionStyle{项目}{##1}{\thesubsection}}
%%%%
\def\@Definiton@Title{定义（课题）\thesection.\the@def}
\def\@Definiton@Label{Def(Project).\thesection.\the@def}
%%%%
\def\@Theorem@Title{定理（课题）~\thesection.\the@thm}
\def\@Theorem@Label{Thm(Project).\thesection.\the@thm}
%%%%
\def\@Axiom@Title{公理（课题）~\thesection.\the@axm}
\def\@Axiom@Label{Axm(Project).\thesection.\the@axm}
%%%%
\def\@Lemma@Title{引理（课题）~\thesection.\the@lem}
\def\@Lemma@Label{Lem(Project).\thesection.\the@lem}
%%%%
\def\@Corollary@Title{推论（课题）~\thesection.\the@colry}
\def\@Corollary@Label{Colry(Project).\thesection.\the@colry}
%%%%
\def\@Propostion@Title{命题（课题）~\thesection.\the@prop}
\def\@Proposition@Label{Prop(Project).\thesection.\the@prop}
%%%%
\def\@Eg@Name{示例}
\def\@Eg@Label{\thesection.\the@egnum}
\def\@Var@Name{改进}
\def\@Var@Label{\thesection.\the@varnum}
%%%%
\def\@Exercise@Label@Numbered{实践~\thesection}
\def\@Exercise@Label@Unnumbered{实践}
\def\@Thinking@Label@Numbered{思考~\thesection}
\def\@Thinking@Label@Unnumbered{思考}
%%%%
%将环境前的节计数器值储存在beforecounter中
\setcounter{@Outer@Project@Counter}{\value{section}}
%将节计数器置为环境中节计数器值
\setcounter{section}{\value{@Inner@Project@Counter}}
%%
%将环境前的例题计数器值储存在beforecounter中
\setcounter{@Outer@Project@Eg@Counter}{\value{@egnum}}
%将例题计数器置为环境中节计数器值
\setcounter{@egnum}{\value{@Inner@Project@Eg@Counter}}
%%
%将环境前的变式计数器值储存在beforecounter中
\setcounter{@Outer@Project@Var@Counter}{\value{@varnum}}
%将变式计数器置为环境中节计数器值
\setcounter{@varnum}{\value{@Inner@Project@Var@Counter}}
%%%%
}{\@projectfalse
\addtocontents{toc}{\protect\@projectfalse}
%将环境中的节计数器值储存在innercounter中
\setcounter{@Inner@Project@Counter}{\value{section}}
%将节计数器值恢复为环境前的值
\setcounter{section}{\value{@Outer@Project@Counter}}
%%
%将环境中的例题计数器值储存在innercounter中
\setcounter{@Inner@Project@Eg@Counter}{\value{@egnum}}
%将例题计数器值恢复为环境前的值
\setcounter{@egnum}{\value{@Outer@Project@Eg@Counter}}
%%
%将环境中的变式计数器值储存在innercounter中
\setcounter{@Inner@Project@Var@Counter}{\value{@varnum}}
%将变式计数器值恢复为环境前的值
\setcounter{@varnum}{\value{@Outer@Project@Var@Counter}}
}

%%重定义\frontmatter%%
\renewcommand{\frontmatter}[1][roman]{
\cleardoublepage
\@mainmatterfalse
\pagenumbering{#1}}
%%重定义\mainmatter%%
\renewcommand{\mainmatter}{
\cleardoublepage
\@mainmattertrue
\pagenumbering{arabic}}
%%重定义\backmatter%%
\renewcommand{\backmatter}[1][Roman]{
\cleardoublepage
\@mainmatterfalse
\pagenumbering{#1}}
\makeatother

%%%%%%%%%%%%%%%%%% 盒子定义 %%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter

%%判断标题长度并决定其放置位置%%
\def\@BoxTitle{}
\newlength{\@Box@TitleHeight}
\newlength{\@Box@CriticTitleWidth}
\setlength{\@Box@CriticTitleWidth}{2\linewidth/3}
\newlength{\@Box@CriticTitleHeight}
\setlength{\@Box@CriticTitleHeight}{4.7mm}
\newlength{\@Box@BaseTitleYSep}
\setlength{\@Box@BaseTitleYSep}{1.5mm}
\newlength{\@Box@TitleYSep}
\newlength{\@Box@TitleRadius}
%%%%
\newcommand{\@Box@Title@Set}[2]{
\settototalheight{\@Box@TitleHeight}{\BoxTitleFont#1#2}
\ifdim\@Box@TitleHeight>\@Box@CriticTitleHeight
\setlength{\@Box@TitleYSep}{\@Box@BaseTitleYSep}
\else
\setlength{\@Box@TitleYSep}{\@Box@CriticTitleHeight/2-\@Box@TitleHeight/2+\@Box@BaseTitleYSep}
\fi
%%%%
\ifblank{#1}{
\ifblank{#2}{\def\@BoxTitle{#1#2}}{\def\@BoxTitle{#2}}
}{\ifblank{#2}{\def\@BoxTitle{#1}}{\def\@BoxTitle{#1:~#2}}
}
%%%%
\ifblank{#1#2}{
\setlength{\@Box@TitleRadius}{\@Box@CriticTitleHeight/2+\@Box@BaseTitleYSep}
}{\setlength{\@Box@TitleRadius}{\@Box@TitleHeight/2+\@Box@TitleYSep}}
}
%%%%

%%设置彩色盒子样式%%
\tcbset{Box/.style={
enhanced standard,breakable,
pad before break=3.0mm,pad after break=4.5mm,
rounded corners,arc=5.0pt,boxrule=2.25pt,
colback=white,colframe=white,
top=3.0mm,bottom=2.5mm,
before=\par\noindent\medskip,after=\par\medskip,
parbox=false,before upper=\par,before lower=\par,
fonttitle=\BoxTitleFont,coltitle=white}}

%%设置习题盒子样式%%
\tcbset{Question/.style={
enhanced standard,breakable,empty,
pad before break=3.0mm,pad after break=5.0mm,
top=3.0mm,bottom=3.0mm,
right=0mm,left=0mm,boxsep=0mm,
after=\par\medskip,
parbox=false,before upper=\par,before lower=\par,
fonttitle=\BoxTitleFont,coltitle=white,
lowerbox=ignored,
code={\colorlet{ListColor}{ColorA}},
subtitle style={empty,fontupper=\BoxSubtitleFont\centering,colupper=ColorA}
}}

%%设置节前盒子%%
\DeclareTColorBox{box0}{O{} m O{} O{ColorB} O{}}{
enhanced standard,breakable,empty,
pad before break=3.0mm,pad after break=5.0mm,
top=5.0mm,bottom=3.0mm,
right=0mm,boxsep=0mm,
parbox=false,before upper=\noindent,before lower=\noindent,
before=\par\bigskip\noindent,after=\par,
varwidth boxed title=\@Box@CriticTitleWidth,
fonttitle=\BoxTitleFont,coltitle=white,
code={\colorlet{ListColor}{#4}
\@Box@Title@Set{#2}{#3}
#5},
title={\hspace*{\@Box@TitleHeight+3\@Box@TitleYSep}\@BoxTitle},
attach boxed title to top left={yshift*=-\tcboxedtitleheight},
%%%%
IfBlankTF={#2#3}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,height=2\@Box@TitleRadius}
}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,top=\@Box@TitleYSep,bottom=\@Box@TitleYSep}
},
underlay boxed title={
\draw[#4,fill=#4,ultra thick,rounded corners=\@Box@TitleRadius](title.north west)rectangle(title.south east);
\draw[white,fill=white,line width=10.0pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle(\@Box@TitleRadius);
\draw[#4,fill=white,line width=2.75pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle(\@Box@TitleRadius);
\draw[#4,fill=#4]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle({\@Box@TitleRadius/2});
%%%%
\draw[#4,fill=#4,ultra thin]([xshift=-\@Box@TitleRadius,yshift=-\@Box@TitleRadius]frame.north east)circle({2\@Box@TitleRadius/3});
\draw[#4!90,fill=#4!90,ultra thin]([xshift=-3\@Box@TitleRadius,yshift=-\@Box@TitleRadius]frame.north east)circle({2\@Box@TitleRadius/3});
\draw[#4!80,fill=#4!80,ultra thin]([xshift=-5\@Box@TitleRadius,yshift=-\@Box@TitleRadius]frame.north east)circle({2\@Box@TitleRadius/3});},
subtitle style={empty,before upper=\par,fontupper=\BoxTitleFont\centering,colupper=#4},
#1}

\newenvironment{Point}{\begin{box0}[left=0mm]{本章要点}[][ColorA]}{\end{box0}}
\newenvironment{Point*}{\begin{box0}[left=0mm]{本节导言}[][ColorA]}{\end{box0}}

\newenvironment{Case}{\begin{box0}{基础概念、公式和定理}[][ColorB]\begin{Concept}}{\end{Concept}\end{box0}}
\newenvironment{Case*}{\begin{box0}{本节提要}[][ColorB]\begin{Concept}}{\end{Concept}\end{box0}}
%%%%

%%设置易错点盒子%%
\DeclareTColorBox{box1}{O{} m O{} O{ColorA} O{\faQuestion} O{}}{
Box,
varwidth boxed title=\@Box@CriticTitleWidth,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\@Box@Title@Set{#2}{#3}
#6},
title={\hspace*{\@Box@TitleHeight+3\@Box@TitleYSep}\@BoxTitle},
attach boxed title to top left={yshift*=-\tcboxedtitleheight+\@Box@BaseTitleYSep},
%%%%
IfBlankTF={#2#3}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,height=2\@Box@TitleRadius}
}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,top=\@Box@TitleYSep,bottom=\@Box@TitleYSep}
},
%%%%
underlay boxed title={
\draw[white,fill=white,rounded corners=\@Box@TitleRadius,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#4,fill=#4,ultra thick,rounded corners=\@Box@TitleRadius](title.north west)rectangle(title.south east);
%%%%
\draw[white,fill=white,line width=10.0pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle(\@Box@TitleRadius);
\draw[#4,fill=#4,line width=2.75pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle(\@Box@TitleRadius);
%%%%
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=white](P)at([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west){#5};
},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4},
#1}
%%%%
\DeclareDocumentEnvironment{Warning}{ O{} }{\begin{box1}{易错点警示}[#1][ColorF][\faExclamation]}{\end{box1}}
\DeclareDocumentEnvironment{Discussion}{ O{} }{\begin{box1}{思考与讨论}[#1][ColorC][\faQuestion]}
{\end{box1}}
\DeclareDocumentEnvironment{Practice}{ O{} }{\begin{box1}{随堂练习}[#1][ColorI][\faCheck]}
{\end{box1}}

%%设置演示盒子%%
\DeclareTColorBox{box2}{O{} m O{} O{ColorA} O{\faLayerGroup} O{}}{
Box,
varwidth boxed title=\@Box@CriticTitleWidth,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\@Box@Title@Set{#2}{#3}
#6},
title={\hspace*{\@Box@TitleHeight+3\@Box@TitleYSep}\@BoxTitle},
attach boxed title to top left={yshift*=-\tcboxedtitleheight+\@Box@BaseTitleYSep},
%%%%
IfBlankTF={#2#3}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,height=2\@Box@TitleRadius}
}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,top=\@Box@TitleYSep,bottom=\@Box@TitleYSep}
},
%%%%
underlay boxed title={
\draw[white,fill=white,line width=10.0pt,rounded corners=\@Box@TitleRadius](title.north east)rectangle(title.south west);
\draw[#4!90,fill=#4!90,line width=2.0pt,rounded corners=\@Box@TitleRadius](title.north east)rectangle(title.south west);
%%%%
\fill[white,draw=white]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle({5*\@Box@TitleRadius/3});
\draw[#4,fill=#4!90,line width=2.0pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle({8*\@Box@TitleRadius/7});
%%%%
\pgfgetnodeheight(title)\TitleHeight
\ifdim\TitleHeight>2\@Box@TitleRadius
\draw[#4,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@Box@TitleRadius/3}]title.north west)arc(asin(3/5):{-asin(3/5)-90}:{5*\@Box@TitleRadius/3})[rounded corners=\@Box@TitleRadius]--
(title.south west)[rounded corners=\@Box@TitleRadius]--
(title.south east)[rounded corners=\@Box@TitleRadius]--cycle;
\else
%%%%
\draw[#4,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@Box@TitleRadius/3}]title.north west)arc(asin(3/5):-asin(3/5):{5*\@Box@TitleRadius/3})[rounded corners=\@Box@TitleRadius]--
(title.south east)[rounded corners=\@Box@TitleRadius]--cycle;
\fi
%%%%
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=white](T)at([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west){#5};},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4},
#1}
%%%%
\DeclareDocumentEnvironment{Display}{ O{} }{\begin{box2}{演示与实验}[#1][ColorB][\faLayerGroup]}{\end{box2}}
\DeclareDocumentEnvironment{Method}{ O{} }{\begin{box2}{方法与技巧}[#1][ColorD][\faPodcast]}{\end{box2}}
\DeclareDocumentEnvironment{Mind}{ O{} }{\begin{box2}{科学思维}[#1][ColorC][\faAtom]}{\end{box2}}

%%设置定义定理盒子%%
\DeclareTColorBox{box3}{O{} m O{} O{ColorA} O{\faCodepen} O{}}{
Box,
varwidth boxed title=\@Box@CriticTitleWidth,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\@Box@Title@Set{#2}{#3}
#6},
title={\hspace*{\@Box@TitleHeight+\@Box@TitleYSep}\@BoxTitle},
attach boxed title to top left={yshift*=-\tcboxedtitleheight+\@Box@BaseTitleYSep},
%%%%
IfBlankTF={#2#3}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,height=2\@Box@TitleRadius}
}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,top=\@Box@TitleYSep,bottom=\@Box@TitleYSep}
},
%%%%
underlay boxed title={
\pgfgetnodeheight(title)\TitleHeight
\ifdim\TitleHeight>2\@Box@TitleRadius
\draw[white,fill=white,line width=10.0pt](title.north east)--([xshift={sqrt(15)*\@Box@TitleRadius/7+\@Box@TitleRadius}]title.north west)arc(asin(7/8):{270-asin(7/8)}:{8*\@Box@TitleRadius/7})[rounded corners=\@Box@TitleRadius]--(title.south west)--(title.south east)--cycle;
\draw[#4,fill=#4!90,line width=2.0pt](title.north east)--([xshift={sqrt(15)*\@Box@TitleRadius/7+\@Box@TitleRadius}]title.north west)arc(asin(7/8):{270-asin(7/8)}:{8*\@Box@TitleRadius/7})[rounded corners=\@Box@TitleRadius]--(title.south west)--(title.south east)--cycle;
\else
\draw[white,fill=white,line width=10.0pt](title.north east)--([xshift={sqrt(15)*\@Box@TitleRadius/7+\@Box@TitleRadius}]title.north west)arc(asin(7/8):{360-asin(7/8)}:{8*\@Box@TitleRadius/7})[rounded corners=\@Box@TitleRadius]--(title.south east)--cycle;
\draw[#4,fill=#4!90,line width=2.0pt](title.north east)--([xshift={sqrt(15)*\@Box@TitleRadius/7+\@Box@TitleRadius}]title.north west)arc(asin(7/8):{360-asin(7/8)}:{8*\@Box@TitleRadius/7})[rounded corners=\@Box@TitleRadius]--(title.south east)--cycle;
\fi
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=white](P)at([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west){#5};},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4},
#1}
%%%%
\def\@Definiton@Title{定义~\the@prenumber.\the@def}
\def\@Definiton@Label{Def.\the@prenumber.\the@def}
%%%%
\def\@Theorem@Title{定理~\the@prenumber.\the@thm}
\def\@Theorem@Label{Thm.\the@prenumber.\the@thm}
%%%%
\def\@Axiom@Title{公理~\the@prenumber.\the@axm}
\def\@Axiom@Label{Axm.\the@prenumber.\the@axm}

%%编号定义盒子%%
\DeclareDocumentEnvironment{Definition}{ O{} }{\begin{box3}{
\if@mainmatter
\@Definiton@Title
\else
定义
\fi}
[#1][ColorA][\faCrosshairs][
\if@mainmatter
\stepcounter{@def}
\label{\@Definiton@Label}
\fi]}{\end{box3}}
%%%%
\DeclareDocumentEnvironment{Theorem}{ O{} }{\begin{box3}{
\if@mainmatter
\@Theorem@Title
\else
定理
\fi}
[#1][ColorB][\faCrosshairs][
\if@mainnmatter
\stepcounter{@thm}
\label{\@Theorem@Label}
\fi]}{\end{box3}}
%%%%
\DeclareDocumentEnvironment{Axiom}{ O{} }{\begin{box3}{
\if@mainmatter
\@Axiom@Title
\else
公理
\fi}
[#1][ColorI][\faCompactDisc][
\if@mainnmatter
\stepcounter{@axm}
\label{\@Axiom@Label}
\fi]}{\end{box3}}
%%%%

%%不编号定义盒子%%
\DeclareDocumentEnvironment{Definition*}{ O{} }{\begin{box3}{定义}[#1][ColorA][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Theorem*}{ O{} }{\begin{box3}{定理}[#1][ColorB][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Axiom*}{ O{} }{\begin{box3}{公理}[#1][ColorI][\faCompactDisc]}{\end{box3}}
%%%%
%%设置引理盒子%%
\DeclareTColorBox{box4}{O{} m O{} O{ColorA} O{\faDiceD20} O{}}{
Box,
varwidth boxed title=\@Box@CriticTitleWidth,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\@Box@Title@Set{#2}{#3}
#6},
title={\hspace*{\@Box@TitleHeight+2\@Box@TitleYSep}\@BoxTitle},
attach boxed title to top left={yshift*=-\tcboxedtitleheight+\@Box@BaseTitleYSep},
%%%%
IfBlankTF={#2#3}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,height=2\@Box@TitleRadius}
}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,top=\@Box@TitleYSep,bottom=\@Box@TitleYSep}
},
%%%%
underlay boxed title={
\draw[white,fill=white,line width=10.0pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle({8*\@Box@TitleRadius/7});
\draw[white,fill=white,rounded corners=\@Box@TitleRadius,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#4,fill=#4,rounded corners=\@Box@TitleRadius,ultra thick](title.north west)rectangle(title.south east);
\draw[#4,fill=white,line width=2.75pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle({8*\@Box@TitleRadius/7});
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=#4](P)at([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west){#5};},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4},
#1}
%%%%
\def\@Lemma@Title{引理~\the@prenumber.\the@lem}
\def\@Lemma@Label{Lem.\the@prenumber.\the@lem}
%%%%
\def\@Corollary@Title{推论~\the@prenumber.\the@colry}
\def\@Corollary@Label{Colry.\the@prenumber.\the@colry}
%%%%
\def\@Propostion@Title{命题~\the@prenumber.\the@prop}
\def\@Proposition@Label{Prop.\the@prenumber.\the@prop}

%%编号引理盒子%%
\DeclareDocumentEnvironment{Lemma}{ O{} }{\begin{box4}{
\if@mainmatter
\@Lemma@Title
\else
引理
\fi}
[#1][ColorE][\faGlobe][
\if@mainmatter
\stepcounter{@lem}
\label{\@Lemma@Label}
\fi]}{\end{box4}}
%%%%
\DeclareDocumentEnvironment{Corollary}{ O{} }{\begin{box4}{
\if@mainmatter
\@Corollary@Title
\else
推论
\fi}
[#1][ColorG][\faCompactDisc][
\if@mainmatter
\stepcounter{@colry}
\label{\@Corollary@Label}
\fi]}{\end{box4}}
%%%%
\DeclareDocumentEnvironment{Proposition}{ O{} }{\begin{box4}{
\if@mainmatter
\@Propostion@Title
\else
命题
\fi}
[#1][ColorH][\faGlobe][
\if@mainmatter
\stepcounter{@prop}
\label{\@Proposition@Label}
\fi]}{\end{box4}}
%%%%
%%不编号引理盒子%%
\DeclareDocumentEnvironment{Lemma*}{ O{} }{\begin{box4}{引理}[#1][ColorE][\faGlobe]}{\end{box4}}
\DeclareDocumentEnvironment{Corollary*}{ O{} }{\begin{box4}{推论}[#1][ColorG][\faCompactDisc]}{\end{box4}}
\DeclareDocumentEnvironment{Proposition*}{ O{} }{\begin{box4}{命题}[#1][ColorH][\faGlobe]}{\end{box4}}
%%%%
%%设置拓展盒子%%
\DeclareTColorBox{box5}{O{} m O{} O{ColorA} O{\faLink}}{
Box,
varwidth boxed title=\@Box@CriticTitleWidth,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\@Box@Title@Set{#2}{#3}},
title={\hspace*{\@Box@TitleHeight+3\@Box@TitleYSep}\@BoxTitle},
attach boxed title to top left={yshift*=-\tcboxedtitleheight+\@Box@BaseTitleYSep},
%%%%
IfBlankTF={#2#3}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,height=2\@Box@TitleRadius}
}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,top=\@Box@TitleYSep,bottom=\@Box@TitleYSep}
},
%%%%
underlay boxed title={
\draw[white,fill=white,rounded corners=\@Box@TitleRadius,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#4,fill=#4,rounded corners=\@Box@TitleRadius,ultra thick](title.north west)rectangle(title.south east);
\fill[white,draw=white,line width=10.0pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle({8*\@Box@TitleRadius/7});
\fill[white,draw=#4,line width=2.75pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle({8*\@Box@TitleRadius/7});
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=#4] at([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west){#5};},
subtitle style={empty,fontupper=\BoxSubtitleFont\centering,colupper=#4},
#1}

\DeclareDocumentEnvironment{Link}{ O{} }{\begin{box5}{拓展链接}[#1][ColorE][\faLink]}{\end{box5}}
\DeclareDocumentEnvironment{History}{ O{} }{\begin{box5}{科学发展史}[#1][ColorC][\faCalendar*]}
{\end{box5}}
\DeclareDocumentEnvironment{STS}{ O{} }{\begin{box5}{科学·技术·社会}[#1][ColorH][\faCog]}
{\end{box5}}

%%设置案例盒子%%
\DeclareTColorBox{box6}{O{} m O{} O{ColorA} O{\faFile*} O{}}{
Box,
varwidth boxed title=\@Box@CriticTitleWidth,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\@Box@Title@Set{#2}{#3}
#6},
title={\hspace*{\@Box@TitleHeight+3\@Box@TitleYSep}\@BoxTitle},
attach boxed title to top left={yshift*=-\tcboxedtitleheight+\@Box@BaseTitleYSep},
%%%%
IfBlankTF={#2#3}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,height=2\@Box@TitleRadius}
}{
boxed title style={size=minimal,empty,left=\@Box@TitleRadius,right=\@Box@TitleRadius,top=\@Box@TitleYSep,bottom=\@Box@TitleYSep}
},
%%%%
underlay boxed title={
\draw[white,fill=white,line width=10.0pt,rounded corners=\@Box@TitleRadius](title.north east)rectangle(title.south west);
\draw[#4!90,fill=#4!90,line width=2.0pt,rounded corners=\@Box@TitleRadius](title.north east)rectangle(title.south west);
%%%%
\fill[white,draw=white,line width=2.0pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle({5*\@Box@TitleRadius/3});
\draw[#4,fill=white,line width=2.75pt]([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west)circle({8*\@Box@TitleRadius/7});
%%%%
\pgfgetnodeheight(title)\TitleHeight
\ifdim\TitleHeight>2\@Box@TitleRadius
\draw[#4,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@Box@TitleRadius/3}]title.north west)arc(asin(3/5):{-asin(3/5)-90}:{5*\@Box@TitleRadius/3})[rounded corners=\@Box@TitleRadius]--
(title.south west)[rounded corners=\@Box@TitleRadius]--
(title.south east)[rounded corners=\@Box@TitleRadius]--cycle;
\else
%%%%
\draw[#4,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@Box@TitleRadius/3}]title.north west)arc(asin(3/5):-asin(3/5):{5*\@Box@TitleRadius/3})[rounded corners=\@Box@TitleRadius]--
(title.south east)[rounded corners=\@Box@TitleRadius]--cycle;
\fi
%%%%
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=#4](T)at([xshift=\@Box@TitleRadius,yshift=-\@Box@TitleRadius]title.north west){#5};
},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4},
#1}

\DeclareDocumentEnvironment{Information}{ O{} }{\begin{box6}{资料卡片}[#1][ColorI][\faFile*]}{\end{box6}}
\DeclareDocumentEnvironment{Application}{ O{} }{\begin{box6}{案例分析}[#1][ColorA][\faTools]}{\end{box6}}
\DeclareDocumentEnvironment{Review}{ O{} }{\begin{box6}{知识回顾}[#1][ColorC][\faFan]}{\end{box6}}

%%%%
%%设置边注盒子%%
\DeclareTColorBox{box7}{mmm}{
enhanced standard,breakable,size=minimal,empty,
varwidth boxed title=\@Box@CriticTitleWidth,
parbox=false,before upper=\par,before lower=\par,before=\par\noindent\medskip,after=\par\medskip,
top=4.0mm,
fonttitle=\BoxSubtitleFont,
coltitle=#2,fontupper=\MarginFont,
colupper=ColorA,
attach boxed title to top left={xshift=5.0mm},
boxed title style={empty,size=minimal,left=2.5mm},
underlay boxed title={
\node[anchor=east,align=center,font=\BoxSublogoFont,text=#2,inner sep=0mm,outer sep=0mm](T)at(title.west){#3};},
title={#1}
}

\DeclareDocumentCommand{\RelaInfo}{sm}
{\IfBooleanTF{#1}
{\marginpar{\begin{box7}{相关信息}{ColorH}{\faCommentDots}
#2
\end{box7}}}
{\begin{box7}{相关信息}{ColorH}{\faCommentDots}
#2
\end{box7}}}
\DeclareDocumentCommand{\DeepThink}{sm}
{\IfBooleanTF{#1}
{\marginpar{\begin{box7}{深入思考}{ColorB!90!black}{\faTh}
#2
\end{box7}}}
{\begin{box7}{深入思考}{ColorB!90!black}{\faTh}
#2
\end{box7}}}
\DeclareDocumentCommand{\Remark}{sm}
{\IfBooleanTF{#1}
{\marginpar{\begin{box7}{重点注释}{ColorF}{\faChrome}
#2
\end{box7}}}
{\begin{box7}{重点注释}{ColorF}{\faChrome}
#2
\end{box7}}}

%%%%
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


\newenvironment{Proof}{\begin{box8}[\faBars~~证明]
[colframe=ColorB!7.5,colback=ColorB!7.5,colbacktitle=ColorB!7.5]}{\end{box8}}
%%
\newenvironment{Solution}{\begin{box8}[\faBars~~参考答案]
[colframe=ColorB!7.5,colback=ColorB!7.5,colbacktitle=ColorB!7.5]}{\end{box8}}
%%
\DeclareDocumentEnvironment{Block}{O{}}{\begin{box8}[#1][colframe=ColorB!7.5,colback=ColorB!7.5,colbacktitle=ColorB!7.5]}{\end{box8}}
\DeclareDocumentEnvironment{Block*}{O{}}{\begin{box8}[#1]
[empty,overlay={
\ifodd\value{page}
\draw[ColorB!7.5,fill=ColorB!7.5](frame.north east)[rounded corners=7.5pt]--(frame.south east)[sharp corners]--([xshift=-\@innerlen]frame.south west)[sharp corners]--([xshift=-\@innerlen]frame.north west)[rounded corners=7.5pt]--cycle;
\else
\draw[ColorB!7.5,fill=ColorB!7.5](frame.north west)[rounded corners=7.5pt]--(frame.south west)[sharp corners]--([xshift=\@innerlen]frame.south east)[sharp corners]--([xshift=\@innerlen]frame.north east)[rounded corners=7.5pt]--cycle;
\fi}]}{\end{box8}}


\DeclareTColorBox{box9}{O{} m O{} O{ColorA} O{}}{
Box,
varwidth boxed title=\@Box@CriticTitleWidth,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\colorlet{ListColor}{#4}
\settototalheight{\@Box@TitleHeight}{\BoxTitleFont#1#2}
\ifdim\@Box@TitleHeight>\@Box@CriticTitleHeight
\setlength{\@Box@TitleYSep}{\@Box@BaseTitleYSep}
\else
\setlength{\@Box@TitleYSep}{\@Box@CriticTitleHeight/2-\@Box@TitleHeight/2+\@Box@BaseTitleYSep}
\fi
\ifblank{#2}{
\setlength{\@Box@TitleRadius}{\@Box@CriticTitleHeight/2+\@Box@BaseTitleYSep}
}{\setlength{\@Box@TitleRadius}{\@Box@TitleHeight/2+\@Box@TitleYSep}}
},
left=5\@Box@TitleRadius/2,
attach boxed title to top left={yshift*=-\tcboxedtitleheight},
%%%%
IfBlankTF={#2}{
boxed title style={size=minimal,empty,left=3\@Box@TitleRadius/2,right=3\@Box@TitleRadius/2,height=2\@Box@TitleRadius}
}{boxed title style={size=minimal,empty,left=3\@Box@TitleRadius/2,right=3\@Box@TitleRadius/2,top=2\@Box@TitleYSep,bottom=4\@Box@TitleYSep/3}},
%%%%
IfEmptyTF={#3}{
before upper={\par}
}{before upper={{\BoxTitleFont\color{#4}#3}\par}},
underlay boxed title={
\begin{tcbclipinterior}
\fill[#4!7.5,draw=#4!7.5](frame.south west)rectangle([xshift=2\@Box@TitleRadius]frame.north west);
\draw[#4!7.5,fill=#4!7.5](frame.north east)rectangle(title.south west);
\draw[#4,fill=#4](title.north west)--(title.north east)[rounded corners=5.0pt]--(title.south east)[sharp corners]--(title.south west)--cycle;
\end{tcbclipinterior}
\node[font=\BoxTitleFont,text=#4,anchor=east,outer sep=0mm,inner xsep=5.0mm](ST)at([yshift={-\tcboxedtitleheight/2}]interior.north east){
\begin{varwidth}{\linewidth-\@Box@CriticTitleWidth}
#5
\end{varwidth}};},
overlay middle and last={
\begin{tcbclipinterior}
\fill[#4!7.5,draw=#4!7.5](frame.south west)rectangle([xshift=2\@Box@TitleRadius]frame.north west);
\end{tcbclipinterior}},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4},
title={#2},#1}

\NewDocumentEnvironment{Reading}{O{}mm}{\begin{box9}{阅读理解}[#1][ColorB][\score{#2}{#3}[ColorB]]}{\end{box9}}
\NewDocumentEnvironment{Cloze}{O{}mm}{\begin{box9}{完形填空}[#1][ColorA][\score{#2}{#3}[ColorA]]}{\end{box9}}
\NewDocumentEnvironment{Article}{O{}mm}{\begin{box9}{文本解读}[#1][ColorC][\score{#2}{#3}[ColorC]]}{\end{box9}}
\NewDocumentEnvironment{Vocabulary}{O{}}{\begin{box9}{词汇解析}[#1][ColorE]}{\end{box9}}

\def\@Exercise@Label@Numbered{课后习题~\the@prenumber}
\def\@Exercise@Label@Unnumbered{课后习题}
\def\@Thinking@Label@Numbered{思考题~\the@prenumber}
\def\@Thinking@Label@Unnumbered{思考题}
\def\@Improve@Label@Numbered{复习与提高~\thechapter}
\def\@Improve@Label@Unnumbered{复习与提高}
%%简化序号命令%%
\newcommand{\the@prenumber}{\thechapter.\thesection}
\DeclareTColorBox{box11}{ O{} O{} }{Question,code={#2},#1}
%%%%
\newenvironment{Exercise}{\begin{box11}[][
\if@mainmatter
\subsection*{\@Exercise@Label@Numbered}
\else
\subsection*{\@Exercise@Label@Unnumbered}
\fi]}{\end{box11}}
%%
\newenvironment{Exercise*}{\begin{box11}[][\subsection*{\@Exercise@Label@Unnumbered}]}{\end{box11}}
%%%%
\newenvironment{Thinking}{\begin{box11}[][
\if@mainmatter
\subsection*{\@Thinking@Label@Numbered}
\else
\subsection*{\@Thinking@Label@Unnumbered}
\fi]}{\end{box11}}
%%
\newenvironment{Thinking*}{\begin{box11}[][\subsection*{\@Thinking@Label@Unnumbered}]}{\end{box11}}
%%%%
\newenvironment{Improve}{\begin{box11}[][
\if@mainmatter
\subsection*{\@Improve@Label@Numbered}
\else
\subsection*{\@Improve@Label@Unnumbered}
\fi]}{\end{box11}}
%%
\newenvironment{Improve*}{\begin{box11}[][\subsection*{\@Improve@Label@Unnumbered}]}{\end{box11}}

%%修改代码盒子左侧行数样式%%
\renewcommand{\theFancyVerbLine}{\LineNumFont\color{ColorA}{\arabic{FancyVerbLine}}}
%%定义代码盒子基本样式%%
\tcbset{CodeBox/.style={
Box,
varwidth boxed title=\@Box@CriticTitleWidth,
frame style={left color=ColorA!50,right color=ColorA!50,middle color=ColorA},
code={\@Box@Title@Set{代码示例}{#1}},
left=5\@Box@TitleRadius/2,
attach boxed title to top left={yshift*=-\tcboxedtitleheight},
%%%%
IfBlankTF={代码示例#1}{
boxed title style={size=minimal,empty,left=3\@Box@TitleRadius/2,right=3\@Box@TitleRadius/2,height=2\@Box@TitleRadius}
}{boxed title style={size=minimal,empty,left=3\@Box@TitleRadius/2,right=3\@Box@TitleRadius/2,top=2\@Box@TitleYSep,bottom=4\@Box@TitleYSep/3}},
%%%%
underlay boxed title={
\begin{tcbclipinterior}
\fill[ColorB!7.5,draw=ColorB!7.5](frame.south west)rectangle([xshift=2\@Box@TitleRadius]frame.north west);
\draw[ColorB!7.5,fill=ColorB!7.5](frame.north east)rectangle(title.south west);
\draw[ColorA,fill=ColorA](title.north west)--(title.north east)[rounded corners=5.0pt]--(title.south east)[sharp corners]--(title.south west)--cycle;
\end{tcbclipinterior}},
overlay middle and last={
\begin{tcbclipinterior}
\fill[ColorB!7.5,draw=ColorB!7.5](frame.south west)rectangle([xshift=2\@Box@TitleRadius]frame.north west);
\end{tcbclipinterior}},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=ColorA},
title={\@BoxTitle},
minted options={breaklines,autogobble,linenos,numbersep=5.5mm},
listing only,listing engine=minted}}
%%%%
\newcommand{\CodeSubtitle}[1]{
\node[font=\BoxTitleFont,text=ColorA,anchor=east,outer sep=0mm,inner sep=0mm](ST)at([xshift=-\@Box@TitleRadius,yshift={-\tcboxedtitleheight/2}]interior.north east){\begin{varwidth}{\linewidth-\@Box@CriticTitleWidth}#1\end{varwidth}};}

%%%%
\newtcblisting{PythonBox}[1]{
CodeBox={#1},minted language=python,
overlay unbroken and first={\CodeSubtitle{Python}}
}

\newtcblisting{CppBox}[1]{
CodeBox={#1},minted language=cpp,
overlay unbroken and first={\CodeSubtitle{Cpp}}}

\newtcblisting{JavaBox}[1]{
CodeBox={#1},minted language=java,
overlay unbroken and first={\CodeSubtitle{Java}}}

\newtcblisting{CodeBox}[2]{
CodeBox={#1},minted language={#2},
overlay unbroken and first={\CodeSubtitle{\uppercase{#2}}}}

%%数学公式小盒子%%
\newtcbox{\Formula}[1][]{nobeforeafter,math upper,tcbox raise base,
enhanced standard,breakable,colframe=ColorB!7.5,colback=ColorB!7.5,
rounded corners,arc=5.0pt,#1}


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


