% TODO: 增加封面
% TODO: 增加定理盒子
% TODO: 修改封面和目录的样式
% TODO: 修改\part的样式

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{note}[2024-12-21 Template for notes]

% 如果不需要奇偶面不同的话切换下面两行的注释顺序，同样要修改fancyhdr的选项
% \LoadClass[10pt, a4paper, fontset=none, oneside]{ctexbook}
\LoadClass[10pt, a4paper, fontset=none]{ctexbook}

%%%%%%%%%%%%%%%%导入宏包%%%%%%%%%%%%%%%%%%%%


\RequirePackage[numbers, sort&compress, square]{natbib} % 优化参考文献引用
\RequirePackage{syntonly} % 编译LaTeX文件后不生成DVI或者PDF文档，只排查错误，要生成文档可以注释\syntaxonly命令
% \syntaxonly
\RequirePackage{graphicx} % 插入图片
\RequirePackage{geometry} % 设置页面参数
\RequirePackage{unicode-math} % 配置 Unicode 数学字体
\RequirePackage{amsmath} % 用于加载数学公式
% \graphicspath{{figures/}{logo/}} % 用于存放图片的目录figures和logo，这样引用图片的时候就不需要指定目录
\RequirePackage[x11names]{xcolor} % 用于支持输出颜色
\RequirePackage{titlesec} % 修改Chapter和Section章节标题的格式
\RequirePackage{tocloft} % 自定义目录样式
\RequirePackage{lipsum} % 生成英文测试文本
\RequirePackage{fancyhdr} % 修改页眉页脚的格式
\RequirePackage{gbt7714} % 参考文献样式
\RequirePackage{hyperref} % 超链接
\RequirePackage{bookmark} % 生成PDF书签
\RequirePackage{tocbibind} % 为目录、参考文献和索引生成目录项


%%%%%%%%%%%%%%%%导入宏包%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%设置字体%%%%%%%%%%%%%%%%%%%%


% 中文字体，具体设置参考ctex宏包
\setCJKmainfont{FZSSJW.TTF}[ % 设置中文主字体为方正书宋 
    Path=./fonts/,
    BoldFont=FZHTJW.TTF, % 设置粗体为方正黑体
    ItalicFont=FZKTJW.TTF, % 设置斜体为方正楷体
]
\setCJKsansfont{FZHTJW.TTF}[Path=./fonts/] % 设置无衬线字体为方正黑体
\setCJKmonofont{FZFSJW.TTF}[Path=./fonts/] % 设置等宽字体为方正仿宋

% 英文字体，具体设置参考fontspec宏包
\setmainfont{CaskaydiaCoveNerdFont}[ % 设置英文主字体为CaskaydiaCove Nerd Font
    Path=./fonts/, % 指定字体文件所在的目录
    Extension=.ttf, % 字体文件后缀
    UprightFont=*-regular, % 正常字体
    BoldFont=*-Bold, % 加粗
    ItalicFont=*-Italic, % 斜体
    BoldItalicFont=*-BoldItalic, % 粗斜体
]
\setsansfont{CaskaydiaCoveNerdFont}[ % 设置英文无衬线字体为CaskaydiaCove Nerd Font
    Path=./fonts/, % 指定字体文件所在的目录
    Extension=.ttf, % 字体文件后缀
    UprightFont=*-regular, % 正常字体
    BoldFont=*-Bold, % 加粗
    ItalicFont=*-Italic, % 斜体
    BoldItalicFont=*-BoldItalic, % 粗斜体
]
\setmonofont{CaskaydiaCoveNerdFontMono}[ % 设置英文等宽字体为CaskaydiaCove Nerd Font Mono
    Path=./fonts/, % 指定字体文件所在的目录
    Extension=.ttf, % 字体文件后缀
    UprightFont=*-regular, % 正常字体
    BoldFont=*-Bold, % 加粗
    ItalicFont=*-Italic, % 斜体
    BoldItalicFont=*-BoldItalic, % 粗斜体
]

% 具体设置参考unicode-math宏包
\setmathfont{TeX Gyre DejaVu Math} % DejaVu风格数学Unicode字体

\linespread{1.25} % 修改行距


%%%%%%%%%%%%%%%%设置字体%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%页面设置%%%%%%%%%%%%%%%%%%%%


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


%%%%%%%%%%%%%%%%页面设置%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%Chapter设计%%%%%%%%%%%%%%%%%
% 参考：https://stackoverflow.com/questions/78868366/chapter-title-style


% 设置章节编号的字体样式
\newcommand{\chapnumfont}{%     % define font for chapter number
    \usefont{T1}{pnc}{b}{n}%      % choose New Chancery, bold, normal shape
    \fontsize{100}{25}%          % font size 100pt, baselineskip 25pt
    \selectfont%                  % activate font
}
\colorlet{chapnumcol}{red!75!black}  % color for chapter number

% 定义带编号的章节标题样式，具体设置参考titlesec宏包
\titleformat{name=\chapter}[display]
{\filleft\bfseries}
{\filleft\chapnumfont\textcolor{chapnumcol}{\thechapter}}
{0pt}
{\Huge}

% 定义不带编号的章节标题样式，具体设置参考titlesec宏包
\titleformat{name=\chapter,numberless}[display]
{\filright\bfseries}
{\filright}
{0pt}
{\Huge}

% 定义章节和正文等位置的距离，具体设置参考titlesec宏包
\titlespacing{\chapter}{0pt}{0pt}{\baselineskip}


%%%%%%%%%%%%%%%%Chapter设计%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%Section设计%%%%%%%%%%%%%%%%%
% 如果要在部分标题修改横线的长度可以参考：https://tex.stackexchange.com/questions/299546/length-of-titlerule
% 有关颜色的部分参考xcolor宏包


% 定义带编号的Section样式，具体设置参考titlesec宏包
\titleformat{name=\section}
    {\Large\bfseries}
    {\thesection}
    {1em}
    {}
    % [{\color{DeepPink4}\titlerule[1pt]}]

% 定义带不编号的Section样式，具体设置参考titlesec宏包
\titleformat{name=\section, numberless}
    {\Large\bfseries}
    {}
    {1em}
    {}
    % [{\color{DeepPink4}\titlerule[1pt]}]

% 定义带编号的Subsection样式，具体设置参考titlesec宏包
\titleformat{name=\subsection}
    {\Large\bfseries}
    {\thesubsection}
    {1em}
    {}
    % [{\color{HotPink4}\titlerule[0.8pt]}]

% 定义不带编号的Subsection样式，具体设置参考titlesec宏包
\titleformat{name=\subsection, numberless}
    {\Large\bfseries}
    {}
    {1em}
    {}
    % [{\color{HotPink4}\titlerule[0.8pt]}]


%%%%%%%%%%%%%%%%Section设计%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%页脚页眉设计%%%%%%%%%%%%%%%%%
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


%%%%%%%%%%%%%%%页脚页眉设计%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%参考文献设计%%%%%%%%%%%%%%%%%


\bibliographystyle{gbt7714-numerical} % 顺序编码制


%%%%%%%%%%%%%%%参考文献设计%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%超链接设计%%%%%%%%%%%%%%%%%%


\hypersetup{
    bookmarksopen=true, % 启用书签
    colorlinks=true, % 启用颜色
    linkcolor=red, % 内部链接的颜色
    citecolor=orange, % 引用链接的颜色
    urlcolor=cyan, % 外部链接的颜色
}


%%%%%%%%%%%%%%%%超链接设计%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%目录设计%%%%%%%%%%%%%%%%%%%
% 参考https://coffeelize.top/posts/LaTeX-Catalog-Study-Notes.html
% 参考https://tex.stackexchange.com/questions/461216/remove-indentation-in-table-of-contents


\CTEXsetup[name={,},number={\arabic{chapter}}]{chapter} % 修改中文章节标识为数字标识
\CTEXsetup[name={,},number={\Roman{part}}]{part} % 修改中文部分标识为大写罗马字母标识
\renewcommand{\cftdot}{$\cdot$} % 设置导引符为垂直居中的小圆点
\renewcommand{\cftdotsep}{1.5} % 设置点间距
\renewcommand\cftpartdotsep{2} % 设置部分与页码间的导引符
\renewcommand\cftchapdotsep{2} % 设置章节标题与页码间的导引符
\setlength{\cftbeforesecskip}{0pt} % 二级标题间隔
\setcounter{secnumdepth}{3} % 设置目录深度至三级标题
% \setlength{\cftbeforechapskip}{5pt} % 一级标题（章节标题）前间隔
\renewcommand{\cftchapafterpnum}{\vspace{5pt}} % 一级标题（章节标题）后间隔
\setlength{\cftchapindent}{0pt} % Remove indent for \section
\setlength{\cftsecindent}{15pt} % Indent for \section
\setlength{\cftsubsecindent}{15pt} % Indent for \subsection
% \setlength{\cftsubsubsecindent}{0pt} % Remove indent for \subsubsection


%%%%%%%%%%%%%%%%%目录设计%%%%%%%%%%%%%%%%%%%
