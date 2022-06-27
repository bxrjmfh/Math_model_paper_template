\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_paper}[2021/08/17 My custom CV class] 
\LoadClass[12pt]{article}

\newcommand{\lunwenbiaoti}{\fontsize{15.75pt}{0}\heiti 基于元胞自动机的矿料仓库系统}
\newcommand{\zhaiyao}{\fontsize{14pt}{0}\heiti 摘要}

\RequirePackage{titlesec}

\titleformat{\section}
  {\fontsize{14pt}{0}\heiti\centering}    %定义字体heiti黑体
  {}{0em}
  {}
  []

\titleformat{\subsection}
  {\heiti}    %定义字体heiti黑体
  {\bfseries\arabic{section}.\bfseries\arabic{subsection}}{1em}
  {}
  []
  
\titleformat{\subsubsection}
  {\heiti}    %定义字体heiti黑体
  {\bfseries\arabic{section}.\bfseries\arabic{subsection}.\bfseries\arabic{subsubsection}}{1em}
  {}
  []

\newenvironment{guanjianci}
  {\vspace{2ex}\noindent{\heiti 关键词:}}
  {} 
  
  \usepackage{listings}

  \lstset{language=python,                    %Python语法高亮
      linewidth=0.9\linewidth,            %列表list宽度
      %basicstyle=\ttfamily,              %tt无法显示空格
      commentstyle=\color{commentcolor},  %注释颜色
      keywordstyle=\color{keywordcolor},  %关键词颜色
      stringstyle=\color{stringcolor},    %字符串颜色
      %showspaces=true,                   %显示空格
      numbers=left,                       %行数显示在左侧
      numberstyle=\tiny\emptyaccsupp,     %行数数字格式
      numbersep=5pt,                      %数字间隔
      frame=single,                       %加框
      framerule=0pt,                      %不划线
      escapeinside=@@,                    %逃逸标志
      emptylines=1,                       %
      xleftmargin=0em,                    %list左边距
      % backgroundcolor=\color{backcolor},  %列表背景色
      tabsize=4,                          %制表符长度为4个字符
      gobble=4                            %忽略每行代码前4个字符
      }
  
  \usepackage{color} %red, green, blue, yellow, cyan, magenta, black, white
  \definecolor{mygreen}{RGB}{28,172,0} % color values Red, Green, Blue
  \definecolor{mylilas}{RGB}{170,55,241}
  \lstset{language=Matlab,%
      %basicstyle=\color{red},
      breaklines=true,%
      morekeywords={matlab2tikz},
      keywordstyle=\color{blue},%
      morekeywords=[2]{1}, keywordstyle=[2]{\color{black}},
      identifierstyle=\color{black},%
      stringstyle=\color{mylilas},
      commentstyle=\color{mygreen},%
      showstringspaces=false,%without this there will be a symbol in the places where there is a space
      numbers=left,%
      numberstyle={\tiny \color{black}},% size of the numbers
      numbersep=9pt, % this defines how far the numbers are from the text
      emph=[1]{for,end,break},emphstyle=[1]\color{red}, %some words to emphasise
      %emph=[2]{word1,word2}, emphstyle=[2]{style},    
  }