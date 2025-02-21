# 北京邮电大学硕士/博士毕业论文 LaTeX 模板

本项目根据 2024 年的北京邮电大学硕士/博士毕业论文 word 模板进行修改，使用论无忧的格式检查工具检查无错误。

:warning: 本项目已经根据2025年学校发布的模板更新做了相应改动！

## 基本使用说明

1. 下载模板文件：`bupt_thesis.zip`
2. 当前该模板只支持[overleaf](https://www.overleaf.com/)进行编译，`Complier`注意选择`XeLaTeX`。直接上传项目压缩包
3. 修改`main.tex`文件，按照模板要求填写相关信息
4. 在`Chapters`下创建正文当中的章节内容，并将其引用加入到`main.tex`当中

## 模板文件说明

- `main.tex`：主文件，包含论文的各个部分
- `bupt_thesis.cls`：模板文件，定义了论文的格式
- `config/buptthesis.cfg`：配置文件，定义了论文的格式变量
- `Bib\thesis.bib`：参考文献
- `Chapter/Chapter_Example.tex`：中间章节的参考文件，每一章单独一个文件，注意在`main.tex`中引用
- `Chapter/Chapter_enabstract.tex`：英文摘要
- `Chapter/Chapter_cnabstract.tex`：中文摘要
- `Chapter/Chapter_acknowledgements.tex`：致谢
- `Chapter/Chapter_publications.tex`：创新成果
- `Chapter/Chapter_experience.tex`: 作者学习经历

## 改动日志

- 2025.02.21: 修正``博士学位''英文封面显示不正确
- 2025.02.13: 更新``算法''模块功能
- 2025.01.16：根据"学校 2025 年 1 月 15 日版本更新内容"进行修改
- 2024.06.20：初始版本，基本符合模板要求

## 致谢

该模板主要基于[buptTemplate](https://github.com/houluy/bupTemplate)项目进行修改。
