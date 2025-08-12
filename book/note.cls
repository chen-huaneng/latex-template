\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{note}[2025-08-11 Template for notes]

% 如果不需要奇偶面不同的话切换下面两行的注释顺序，同样要修改fancyhdr的选项
% \LoadClass[10pt, a4paper, fontset=none, oneside]{ctexbook}
\LoadClass[10pt, a4paper, fontset=none]{ctexbook}

%%%%%%%%%%%%%%%%导入宏包%%%%%%%%%%%%%%%%%%%%
% 参考https://tex.stackexchange.com/questions/59702/suggest-a-nice-font-family-for-my-basic-latex-template-text-and-math


% \RequirePackage{syntonly} % 编译LaTeX文件后不生成DVI或者PDF文档，只排查错误，要生成文档可以注释\syntaxonly命令
% \syntaxonly

% 图片
\RequirePackage{graphicx} % 插入图片
\graphicspath{{images/}{cover/}} % 用于存放图片的目录figures和logo，这样引用图片的时候就不需要指定目录
% 数学公式
\RequirePackage{amsmath} % 用于加载数学公式
\RequirePackage{mathrsfs} % 用于加载花体字母
\RequirePackage{amssymb} % 用于加载数学字符
\RequirePackage{mathtools}
\RequirePackage{geometry} % 设置页面参数
% 参考 https://tex.stackexchange.com/questions/659036/option-selecting-named-colours-provided-by-the-xcolor-package
\RequirePackage[dvipsnames, svgnames, x11names, table]{xcolor} % 用于支持输出颜色
\RequirePackage{titlesec} % 修改Chapter和Section章节标题的格式
\RequirePackage{tocloft} % 自定义目录样式
\RequirePackage{fancyhdr} % 修改页眉页脚的格式
% 引用、索引、超链接和参考文献
\RequirePackage[sort&compress]{gbt7714} % 参考文献样式
\RequirePackage{hyperref} % 超链接
\RequirePackage{makeidx} % 索引
\RequirePackage[noabbrev]{cleveref} % 多公式引用，必须放在hyperref包的后面，参考 https://tex.stackexchange.com/questions/314217/how-i-can-refer-multiple-equation-in-latex
\RequirePackage{bookmark} % 生成PDF书签
% 目录
\RequirePackage[nottoc]{tocbibind} % 为目录、参考文献和索引生成目录项，禁止为目录生成目录项
\RequirePackage{epigraph} % 排版引用
% 字体
% \RequirePackage{unicode-math} % 配置 Unicode 数学字体
\RequirePackage[T1]{fontenc} % 改善文档中西欧语言的显示效果
\RequirePackage{lmodern} % lmodern字体
\RequirePackage{libertine} % Linux Libertine 字体系列(衬线字体)
\RequirePackage{tikz} % 绘图
\RequirePackage{pdfpages} % 导入PDF
% 表格
\RequirePackage{booktabs}
\RequirePackage{tabularx} % 表格自动换行，调整表格宽度 
\RequirePackage{makecell} % 单元格内换行
\RequirePackage{threeparttable} % 给表格添加脚注，参考 https://tex.stackexchange.com/questions/6090/clickable-table-footnote
\RequirePackage{ltablex} % 跨页表格
% 定理盒子
\RequirePackage[most]{tcolorbox}
\tcbuselibrary{theorems, skins, breakable}
% 自定义环境
\RequirePackage{environ}
\RequirePackage{parskip} % 形成段落间的间距
% 代码环境
\RequirePackage{minted} % 代码环境
% 算法、伪代码环境
\RequirePackage[linesnumbered, ruled, longend, lined]{algorithm2e}


%%%%%%%%%%%%%%%%定理盒子%%%%%%%%%%%%%%%%%%%%

% 定理盒子配色
\colorlet{theorem-background-color}{Honeydew}
\colorlet{theorem-front-color}{ForestGreen!60!black}

% 引理盒子配色
\colorlet{lemma-background-color}{LemonChiffon}
\colorlet{lemma-front-color}{Goldenrod!70}

% 定义盒子配色
\colorlet{definition-background-color}{AliceBlue}
\colorlet{definition-front-color}{SteelBlue!70}

% 模型盒子配色
\colorlet{model-background-color}{Lavender!8!white}
\colorlet{model-front-color}{RoyalPurple!70!black}

% 代码盒子配色
\colorlet{code-background-color}{LavenderBlush}
\colorlet{code-front-color}{DeepPink!50!black}


% 配好颜色未使用的浅色系方案
% \colorlet{name-background-color}{SkyBlue!8!white}
% \colorlet{name-front-color}{DodgerBlue!70}
% \colorlet{name-background-color}{Coral!10!white}
% \colorlet{name-front-color}{Coral!70}

% 定理环境通用设置
\tcbset{
    breakablestyle/.style={
        breakable, % 允许分页
        enhanced jigsaw, % 启用增强型分页效果
        before upper={\allowdisplaybreaks[4]},
        pad at break=1mm, % 分页处间距
        title after break=\thetcbcounter\text{ (continued)}, % 分页后的标题
    }
}

% 定义定理环境
\newtcbtheorem[number within=chapter]{theorem}{Theorem}{
    colback=theorem-background-color,    % 背景色
    colframe=theorem-front-color,  % 边框色
    fonttitle=\bfseries,     % 标题字体
    title={Theorem \thetcbcounter}, % 标题格式
    enhanced,                % 启用增强样式
    rounded corners,           % 圆角
    drop fuzzy shadow,        % 阴影效果
    arc=1mm, % 圆角弧度大小
    boxrule=0pt, % 边框线宽度
    title after break=\text{Theorem }\thetcbcounter\text{ (continued)}, % 分页后的标题
}{thm} % 定义交叉引用的前缀，如\ref{thm:label}

% 定义引理环境
\newtcbtheorem[use counter from=theorem]{lemma}{Lemma}{
    colback=lemma-background-color,
    colframe=lemma-front-color,
    fonttitle=\bfseries,
    title={Lemma \thetcbcounter},
    enhanced,
    rounded corners,
    drop fuzzy shadow,
    arc=1mm, % 圆角弧度大小
    boxrule=0pt, % 边框线宽度
    title after break=\text{Lemma }\thetcbcounter\text{ (continued)}, % 分页后的标题
}{lem}

% 定义定义环境
\newtcbtheorem[use counter from=theorem]{definition}{Definition}{
    colback=definition-background-color,
    colframe=definition-front-color,
    fonttitle=\bfseries,
    title={Definition \thetcbcounter},
    enhanced,
    rounded corners,
    drop fuzzy shadow,
    arc=1mm, % 圆角弧度大小
    boxrule=0pt, % 边框线宽度
    title after break=\text{Definition }\thetcbcounter\text{ (continued)}, % 分页后的标题
}{def}

% 定义模型环境
\newtcbtheorem[number within=chapter]{model}{Model}{
    breakablestyle,
    colback=model-background-color,
    colframe=model-front-color,
    fonttitle=\bfseries,
    title={Model \thetcbcounter},
    enhanced,
    rounded corners,
    drop fuzzy shadow,
    arc=1mm, % 圆角弧度大小
    boxrule=0pt, % 边框线宽度
    title after break=\text{Model }\thetcbcounter\text{ (continued)}, % 分页后的标题
}{model}

% 定义代码环境
\newtcbtheorem[number within=chapter]{code}{Code}{
    breakablestyle,
    colback=code-background-color,
    colframe=code-front-color,
    fonttitle=\bfseries,
    title={Code \thetcbcounter},
    enhanced,
    rounded corners,
    drop fuzzy shadow,
    arc=1mm, % 圆角弧度大小
    boxrule=0pt, % 边框线宽度
    title after break=\text{Code }\thetcbcounter\text{ (continued)}, % 分页后的标题
}{code}


%%%%%%%%%%%%%%%%自定义环境%%%%%%%%%%%%%%%%%%%%

% 配色选择
\definecolor{shallow-purple}{rgb}{0.9,0.9,1} % 浅紫色
\definecolor{shallow-blue}{RGB}{170, 204, 255} % 浅蓝色
\colorlet{shallow-yellow}{yellow!30} % 浅黄色
\colorlet{shallow-green}{green!20} % 浅绿色
\colorlet{shallow-red}{red!20} % 浅红色

% 定义一个通用的带颜色背景的公式环境
\newcommand{\defineColoredEq}[2]{%
  \NewEnviron{coloredeq-#1}[1][]{%
    \colorbox{shallow-#1}{%
      $\displaystyle % 确保公式为显示样式
      \BODY % 环境内容
      $%
    }%
    \if\relax\detokenize{##1}\relax\else\label{##1}\fi % 可选标签
  }%
}

% 使用通用命令定义具体的环境
\defineColoredEq{purple}{}
\defineColoredEq{blue}{}
\defineColoredEq{yellow}{}
\defineColoredEq{green}{}
\defineColoredEq{red}{}


%----------------------------------------------------%
%           设置公式、表格、图片编号                 %
%----------------------------------------------------%

% 公式编号
\numberwithin{equation}{chapter} % 公式编号绑定章节
\renewcommand{\theequation}{\thechapter-\arabic{equation}} % 修改编号格式

% 表格编号
\numberwithin{table}{chapter} 
\renewcommand{\thetable}{\thechapter-\arabic{table}}

% 图片编号
\numberwithin{figure}{chapter}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}


%----------------------------------------------------%
%                  设置字体                          %
%----------------------------------------------------%

% 中文字体，具体设置参考ctex宏包
\setCJKmainfont{FZSSJW.TTF}[ % 设置中文主字体为方正书宋 
    Path=./fonts/,
    BoldFont=FZHTJW.TTF, % 设置粗体为方正黑体
    ItalicFont=FZKTJW.TTF, % 设置斜体为方正楷体
]
\setCJKsansfont{FZHTJW.TTF}[ % 设置无衬线字体为方正黑体
    Path=./fonts/,
    AutoFakeSlant=0.2, % 生成斜体效果
    AutoFakeBold=1.5,  % 生成粗体效果
]
\setCJKmonofont{FZFSJW.TTF}[ % 设置等宽字体为方正仿宋
    Path=./fonts/,
    AutoFakeSlant=0.2, % 生成斜体效果
    AutoFakeBold=1.5,  % 生成粗体效果
] 
% 英文字体，具体设置参考fontspec宏包
% \setmainfont{CaskaydiaCoveNerdFont}[ % 设置英文主字体为CaskaydiaCove Nerd Font
%     Path=./fonts/, % 指定字体文件所在的目录
%     Extension=.ttf, % 字体文件后缀
%     UprightFont=*-regular, % 正常字体
%     BoldFont=*-Bold, % 加粗
%     ItalicFont=*-Italic, % 斜体
%     BoldItalicFont=*-BoldItalic, % 粗斜体
% ]
% \setsansfont{CaskaydiaCoveNerdFont}[ % 设置英文无衬线字体为CaskaydiaCove Nerd Font
%     Path=./fonts/, % 指定字体文件所在的目录
%     Extension=.ttf, % 字体文件后缀
%     UprightFont=*-regular, % 正常字体
%     BoldFont=*-Bold, % 加粗
%     ItalicFont=*-Italic, % 斜体
%     BoldItalicFont=*-BoldItalic, % 粗斜体
% ]
\setmonofont{CaskaydiaCoveNerdFontMono}[ % 设置英文等宽字体为CaskaydiaCove Nerd Font Mono
    Path=./fonts/, % 指定字体文件所在的目录
    Extension=.ttf, % 字体文件后缀
    UprightFont=*-regular, % 正常字体
    BoldFont=*-Bold, % 加粗
    ItalicFont=*-Italic, % 斜体
    BoldItalicFont=*-BoldItalic, % 粗斜体
]

% 具体设置参考unicode-math宏包
% \setmathfont{TeX Gyre DejaVu Math} % DejaVu风格数学Unicode字体

\linespread{1.25} % 修改行距


%----------------------------------------------------%
%                  页面设置                          %
%----------------------------------------------------%

% 具体设置参考geometry宏包
\geometry{
    a4paper,
    inner=1in, % 靠近书脊一侧的边距
    outer=1.25in, % 远离书脊一侧的边距
    top=72pt, % 上边距
    marginparsep=7pt, % 正文区域和边注区域的间距
    marginparwidth=72pt, % 边注区域的宽度
    textheight=700pt, % 正文区域的高度
    footskip=25pt, % 页脚区域和正文区域的间距
}


%----------------------------------------------------%
%                  封面设计                          %
%----------------------------------------------------%
% 参考https://tex.stackexchange.com/questions/85904/showcase-of-beautiful-title-page-done-in-tex

\definecolor{titlepagetextcolor}{RGB}{3, 83, 40} % 标题页文字颜色

% title page
\usetikzlibrary{calc}
\tikzset{3D/.cd,
  x/.store in=\xx, x=0,
  y/.store in=\yy, y=0,
  z/.store in=\zz, z=0
}

\tikzdeclarecoordinatesystem{3D}{%
  \tikzset{3D/.cd,#1}%
  \pgfpoint{sin(\yy)*(\xx)}{-((\xx)/75)^2+(\zz)/100*(\xx)}%
}
\renewcommand\epigraphflush{flushright}
\renewcommand\epigraphsize{\normalsize}
\setlength\epigraphwidth{0.7\textwidth}
\definecolor{titlepagecolor}{cmyk}{1,.60,0,.40}
\DeclareFixedFont{\titlefont}{T1}{ppl}{b}{it}{0.5in}
\makeatletter                       
\def\printauthor{%                  
    {\large \@author}}              
\makeatother
\author{%
    \href{chen-huaneng.github.io}{\bfseries\textcolor{titlepagetextcolor}{Chen Huaneng (Abel)}} \\  %%%% Your Name
    Xiamen University \\    %%%% Department Name
    \texttt{huanengchen@foxmail.com}\vspace{5pt} \\ %%% Your Email Address
    }
\newcommand\titlepagedecoration{%
    \begin{tikzpicture}[line join=round, very thin]
    \def\e{1260}
    \foreach \x [evaluate={\i=mod(\x+90,360); \j=int((\i<180)*2-1); \t=3;
        \sc=\x/\e; \n=int((\e-\x)/15+5); \X=\x/\e;}] in {10,25,...,\e} {

        \path [shift={(3D cs:x=\x-\t,y={3*sin(\x-\t)})}, yslant=cos(\x)/5]
        (-\X/2, 0)   coordinate (A')  ( \X/2, 0)   coordinate (B')
        ( \X/2,2*\X) coordinate (C')  (-\X/2,2*\X) coordinate (D');

        \path [shift={(3D cs:x=\x,y=3*sin \x)}, yslant=cos(\x)/5]
        (-\X/2, 0)   coordinate (A) ( \X/2, 0)   coordinate (B)
        ( \X/2,2*\X) coordinate (C) (-\X/2,2*\X) coordinate (D);

        \filldraw [black!90] (B) -- (B') -- (C') -- (C)  -- cycle;
        \filldraw [black!80] (A) -- (A') -- (D') -- (D)  -- cycle;
        \filldraw [black!70] (C) -- (D)  -- (D') -- (C') -- cycle;
        \filldraw [black]    (A) -- (B)  -- (C)  -- (D)  -- cycle;

        \node [text=white, shift={($(C)!0.5!(D)$)}, anchor=north,
        yslant=cos(\x)/5, font=\sf, scale=\sc*1.5] at (0,-.33*\X) {\n};
    }
    %
    \foreach \i [evaluate={\x=\i*30-10; \X=1; \n=int(5-\i); \xsl=\x/180}]
        in {1,...,4} {

        \path [shift={(3D cs:x=\x+\e,y=-3*\x/90)}, yslant=cos \e/5, xslant=\xsl]
        (-\X/2, 0)           coordinate (A) ( \X/2, 0)           coordinate (B)
        ( \X/2, \X*2-\x/360) coordinate (C) (-\X/2, \X*2-\x/360) coordinate (D);

        \path [shift={(3D cs:x=\x+\e,y=-3*\x/90)}, shift={(5/50,5/50-\i*2/50)},
        yslant=cos \e/5, xslant=\xsl]
        (-\X/2, 0)           coordinate (A') ( \X/2, 0)           coordinate (B')
        ( \X/2, \X*2-\x/330) coordinate (C') (-\X/2, \X*2-\x/330) coordinate (D');

        \filldraw [black!70] (C) -- (D)  -- (D') -- (C') -- cycle;
        \filldraw [black!70] (A) -- (B)  -- (B') -- (A') -- cycle;
        \filldraw [black!90] (B) -- (B') -- (C') -- (C)  -- cycle;
        \filldraw [black]    (A) -- (B)  -- (C)  -- (D)  -- cycle;

        \node [text=white, shift={($(C)!0.5!(D)$)}, anchor=north, xslant=\xsl,
        yslant=cos \e/5, font=\sf, scale=1.5] at (0,-.33*\X) {\n};
    }
    \end{tikzpicture}
}


%----------------------------------------------------%
%                  Part 设计                         %
%----------------------------------------------------%
% 参考https://tex.stackexchange.com/questions/192838/part-heading-style

% \definecolor{partcolor}{red!65!black} % 设置part标题颜色
\definecolor{partcolor}{RGB}{3, 83, 40} % 设置part标题颜色
\definecolor{parttextcolor}{RGB}{0, 0, 0} % 设置part标题文字颜色
\makeatletter
\renewcommand\thepart{\arabic{part}}
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
  \reset@font
  \parindent \z@ 
  \vspace*{10\p@}%
  \sloppy % 松散排版要求
  \hbox{%
    \vbox{%
      \hsize=7mm%
      \begin{tabular}{@{}p{7mm}@{}}
        \makebox[7mm]{\strut\large\textcolor{partcolor}{\partname}}\\
        \makebox[7mm]{\cellcolor{partcolor}\Huge\color{white}\bfseries\strut\thepart\rule[-4cm]{0pt}{4cm}}%
      \end{tabular}%
      \makebox(0,0){\color{partcolor}\setlength{\fboxrule}{2pt}\put(-10,-100){\fbox{\phantom{\rule[-4cm]{7mm}{4cm}}}}}
      }%
    \kern-2pt
    \vbox to 0pt{%
       \tabular[t]{@{}p{1cm}p{\dimexpr\hsize-2.1cm}@{}}\hlineforpart
          & \Huge\itshape\bfseries\rule{0pt}{1.5\ht\strutbox}\textcolor{parttextcolor}{#1}\endtabular}%
    }%
  \fussy % 恢复排版要求
  \cleardoublepage
 \vskip 100\p@
}
% Define a new command for the hline with specific color and thickness
\newcommand{\hlineforpart}{\noalign {\ifnum 0=`}\fi \color{partcolor}\hrule height 1pt depth 0pt \ifnum 0=`{\fi}}
\makeatother


%----------------------------------------------------%
%                  Chapter 设计                      %
%----------------------------------------------------%
% 参考：https://stackoverflow.com/questions/78868366/chapter-title-style

% 定义颜色
\definecolor{chaptercolor}{RGB}{171, 217, 179} % 设置章节标题颜色
\definecolor{chaptertextcolor}{RGB}{3, 83, 40} % 设置章节标题文字颜色

% 设置章节编号的字体样式
\newcommand{\chapnumfont}{%     % define font for chapter number
    \usefont{T1}{pnc}{b}{n}%      % choose New Chancery, bold, normal shape
    \fontsize{100}{25}%          % font size 100pt, baselineskip 25pt
    \selectfont%                  % activate font
}
\colorlet{chapnumcol}{chaptercolor}  % color for chapter number

% 定义带编号的章节标题样式，具体设置参考titlesec宏包
\titleformat{name=\chapter}[display]
{\filleft\bfseries}
{\filleft\chapnumfont\textcolor{chapnumcol}{\thechapter}}
{0pt}
{\Huge\textcolor{chaptertextcolor}} % 设置章节标题文字颜色
[{\color{chaptertextcolor}\titlerule[1pt]}]

% 定义不带编号的章节标题样式，具体设置参考titlesec宏包
\titleformat{name=\chapter,numberless}[display]
{\filright\bfseries}
{\filright}
{0pt}
{\Huge\textcolor{chaptertextcolor}} % 设置章节标题文字颜色
[{\color{chaptertextcolor}\titlerule[1pt]}]

% 定义章节和正文等位置的距离，具体设置参考titlesec宏包
\titlespacing{\chapter}{0pt}{0pt}{\baselineskip}


%----------------------------------------------------%
%                  Section 设计                      %
%----------------------------------------------------%
% 如果要在部分标题修改横线的长度可以参考：https://tex.stackexchange.com/questions/299546/length-of-titlerule
% 有关颜色的部分参考xcolor宏包

% 定义颜色
\definecolor{sectioncolor}{RGB}{3, 83, 40} % 设置Section标题颜色

% 定义带编号的Section样式，具体设置参考titlesec宏包
\titleformat{name=\section}
    {\Large\bfseries}
    {\textcolor{sectioncolor}\thesection}
    {1em}
    {\textcolor{sectioncolor}}
    % [{\color{DeepPink4}\titlerule[1pt]}]

% 定义带不编号的Section样式，具体设置参考titlesec宏包
\titleformat{name=\section, numberless}
    {\Large\bfseries}
    {}
    {1em}
    {\textcolor{sectioncolor}}
    % [{\color{DeepPink4}\titlerule[1pt]}]

% 定义带编号的Subsection样式，具体设置参考titlesec宏包
\titleformat{name=\subsection}
    {\large\bfseries}
    {\itshape\textcolor{sectioncolor}\thesubsection}
    {1em}
    % {\itshape}
    {\itshape\textcolor{sectioncolor}}
    % [{\color{HotPink4}\titlerule[0.8pt]}]

% 定义不带编号的Subsection样式，具体设置参考titlesec宏包
\titleformat{name=\subsection, numberless}
    {\large\bfseries}
    {}
    {1em}
    % {\itshape}
    {\itshape\textcolor{sectioncolor}}
    % [{\color{HotPink4}\titlerule[0.8pt]}]


%----------------------------------------------------%
%                  页脚和页眉                        %
%----------------------------------------------------%
% 参考：https://tex.stackexchange.com/questions/732462/chapter-number-in-the-header-with-chapter/732464?noredirect=1#comment1824660_732464 

% 详细参数参考fancyhdr宏包
\renewcommand{\chaptermark}[1]{\markboth{\bfseries\uppercase{#1}}{}} % 在双面打印时将章节标题（#1）标记在偶数页的页眉（左边），而奇数页的页眉保持为空。
\renewcommand{\sectionmark}[1]{\markright{\bfseries#1}} % 在单面或双面打印时都将标题（#1）标记在奇数页的页脚（右边）。
\AddToHook {cmd/mainmatter/before} {% 在mainmatter之前重新定义chapter和section的编号格式
    \renewcommand{\chaptermark}[1]{\markboth{\bfseries\uppercase{#1}}{}}%
    \renewcommand{\sectionmark}[1]{\markright{\S \thesection\ \bfseries#1}}%
}
\AddToHook {cmd/backmatter/before} {% 在backmatter之前重新定义chapter和section的编号格式并修改section和chapter的编号
    \renewcommand{\chaptermark}[1]{\markboth{\bfseries\uppercase{#1}}{}}
    \renewcommand{\sectionmark}[1]{\markright{\thesection\ \bfseries#1}}%
    \renewcommand{\thesection}{\Roman{section}}%
}
\pagestyle{fancy} % 设置文档的页面样式为fancy，这意味着页眉和页脚将使用fancyhdr宏包提供的自定义格式。
\fancyhf{} % 清空原本的页脚页眉样式
\fancyhead[RO]{\thepage} % 设置奇数页（[RO]，即Right, Odd）的页眉右侧（内边）显示的内容为页码（\thepage）。
\fancyhead[LO]{\rightmark}
\fancyhead[LE]{\thepage}
\fancyhead[RE]{\leftmark}
\renewcommand{\headrulewidth}{0.4pt} % 注意不用 \setlength
\renewcommand{\footrulewidth}{0pt} % 去掉页脚的横线


%----------------------------------------------------%
%                  参考文献                          %
%----------------------------------------------------%

\renewcommand{\bibname}{\bfseries References} % 修改参考文献标题
\bibliographystyle{gbt7714-numerical} % 顺序编码制


%----------------------------------------------------%
%                  超链接                            %
%----------------------------------------------------%

\hypersetup{
    bookmarksopen=true, % 启用书签
    colorlinks=true, % 启用颜色
    linkcolor=red, % 内部链接的颜色
    linktoc=all, % 设置目录中的页码和标题都能够跳转
    citecolor=orange, % 引用链接的颜色
    urlcolor=cyan, % 外部链接的颜色
}


%----------------------------------------------------%
%                  目录                              %
%----------------------------------------------------%
% 参考 https://coffeelize.top/posts/LaTeX-Catalog-Study-Notes.html
% 参考 https://tex.stackexchange.com/questions/461216/remove-indentation-in-table-of-contents
% 参考 https://tex.stackexchange.com/questions/3177/how-to-change-the-numbering-of-part-chapter-section-to-alphabetical-r

\definecolor{TOCCOLOR}{RGB}{3, 83, 40} % 设置目录标题颜色
\renewcommand{\contentsname}{\bfseries\textcolor{TOCCOLOR}{Contents}} % 修改目录标题
\CTEXsetup[name={,},number={\arabic{chapter}}]{chapter} % 修改中文章节标识为数字标识
\CTEXsetup[name={,},number={\Roman{part}}]{part} % 修改中文部分标识为大写罗马字母标识
\renewcommand{\cftdot}{$\cdot$} % 设置导引符为垂直居中的小圆点
\renewcommand{\cftdotsep}{1.5} % 设置点间距
\renewcommand\cftpartdotsep{2} % 设置部分与页码间的导引符
\renewcommand\cftchapdotsep{2} % 设置章节标题与页码间的导引符
\renewcommand\thepart{\Roman{part}} % 设置\part编号格式为大写罗马字母
\setlength{\cftbeforesecskip}{0pt} % 二级标题间隔
\setcounter{secnumdepth}{3} % 设置目录深度至三级标题
% \setlength{\cftbeforechapskip}{5pt} % 一级标题（章节标题）前间隔
\renewcommand{\cftchapafterpnum}{\vspace{5pt}} % 一级标题（章节标题）后间隔
\setlength{\cftchapindent}{0pt} % Indent for \chapter
\setlength{\cftsecindent}{15pt} % Indent for \section
\setlength{\cftsubsecindent}{20pt} % Indent for \subsection
% \setlength{\cftsubsubsecindent}{0pt} % Remove indent for \subsubsection

\renewcommand{\appendixname}{Appendix} % 修改附录标题


%----------------------------------------------------%
%                  代码环境                          %
%----------------------------------------------------%
% 参考 minted 宏包文档

% 重新设置代码行号样式
\renewcommand{\theFancyVerbLine}{
\sffamily
\textcolor{gray}{
\footnotesize\oldstylenums{
\arabic{FancyVerbLine}}}}

\renewcommand{\listoflistingscaption}{\bfseries\textcolor{TOCCOLOR}{List of Code}} % 修改代码列表标题
\renewcommand{\listingscaption}{Code} % 修改代码标题

% 设置代码环境
\setminted{
    % style=default, % 设置代码风格，可选的代码风格参考： https://pygments.org/styles/
    numbers=left, % 显示行号
    numbersep=2pt, % 行号与代码的距离
    mathescape, % 允许在代码注释中使用数学公式
    % bgcolor=Beige, % 设置背景颜色
    % breakanywhere, % 允许代码在任意位置断行，似乎会导致inline代码不显示内容
    breaklines, % 允许代码自动断行 
    fontsize=\footnotesize, % 设置代码字体大小
    frame=leftline, % 设置代码框
    framerule=0.5pt, % 设置代码框线宽
    highlightcolor=Beige, % 设置代码行高亮颜色
    resetmargins, % 重置代码边距
}

% 设置行内代码环境
\setmintedinline{
    fontsize=\footnotesize, % 设置代码字体大小
    bgcolor=Beige, % 设置背景颜色
    bgcolorpadding=0.2em, % 设置背景颜色的内边距
    breakanywhereinlinestretch=0.01em, % 允许行内代码在任意位置断行
    breaklines, % 允许行内代码自动断行
}


%----------------------------------------------------%
%                 算法和伪代码环境                   %
%----------------------------------------------------%
% 参考 algorithm2e 宏包文档

\DontPrintSemicolon % 不打印分号
\setlength{\algomargin}{2em} % 设置算法缩进使得行号在线框内


%----------------------------------------------------%
%                         边注环境                   %
%----------------------------------------------------%

% 设置边注的字体大小
\let\oldmarginpar\marginpar
\renewcommand{\marginpar}[1]{\oldmarginpar{\footnotesize #1}}
