# 计量经济学课后习题参考 | Econometrics Coursework

## 

本仓库整理了本科计量经济学课程的部分课后习题作答、Stata 代码及 Word 作业报告，供师弟师妹学习交流和参考。这里不是教材的完整习题解答，也不是官方答案；如有错误，欢迎指正。

### 教材与参考资料

- **教材：** Jeffrey M. Wooldridge, *Introductory Econometrics: A Modern Approach*, 7th Edition（伍德里奇《计量经济学》）。
- **答案参考：** 部分习题作答参考了[这个 YouTube 视频及播放列表](https://www.youtube.com/watch?v=ye6sD0q1cbE&list=PLVnZllyvIMyRA-F5k-kb0RbNXd_i8oXfT)。

### 仓库内容

- [Stata 代码](stata/)：按章节整理的 `.do` 文件，以及 Cobb–Douglas 生产函数和期末作业代码。
- [Word 作业报告](reports/)：部分习题的书面作答。
- [数据说明](data/README.md)：数据来源及本地运行说明。

### 数据说明与使用方法

本课程使用的 **Stata 数据集由任课老师提供**。考虑到数据的版权及再分发权限，**本仓库不上传或分享原始数据集**。

如需运行代码，请通过课程老师或其他合法授权渠道获取相应数据，将 `.dta` 文件保存在本地仓库的 `data/` 文件夹中，并保持与脚本一致的文件名。将 Stata 工作目录设置为项目根目录后，可运行：

```stata
do "stata/chapter-02.do"
```

作业代码仅供学习参考，未经逐一重新运行验证。建议结合教材独立思考、核对计算结果。

---

## 

This repository contains selected end-of-chapter exercise solutions, Stata scripts, and Word coursework reports from my undergraduate econometrics course. It is intended as a reference for fellow students, especially those taking the same course. These are **not official solutions** or a complete answer key, and some answers may contain errors.

### Textbook and references

- **Textbook:** Jeffrey M. Wooldridge, *Introductory Econometrics: A Modern Approach*, 7th Edition.
- **Solution reference:** Some solutions were prepared with reference to this [YouTube video and playlist](https://www.youtube.com/watch?v=ye6sD0q1cbE&list=PLVnZllyvIMyRA-F5k-kb0RbNXd_i8oXfT).

### Repository contents

- [Stata scripts](stata/): Chapter exercises, a Cobb–Douglas production function exercise, and final coursework.
- [Coursework reports](reports/): Written responses to selected exercises.
- [Data notes](data/README.md): Dataset information and local setup instructions.

### Dataset availability and usage

The **Stata datasets used in this course were provided by the course instructor**. Due to copyright and redistribution considerations, **the original datasets are not included in this repository**.

To run the scripts, obtain the necessary datasets from the instructor or another authorized source. Place the corresponding `.dta` files in a local `data/` directory, preserving the exact filenames referenced in the scripts. Set Stata's working directory to the repository root and run, for example:

```stata
do "stata/chapter-02.do"
```

These scripts are shared for educational reference and have not all been independently rerun or validated. Please consult the textbook and verify the results.

---

*The textbook and third-party reference videos belong to their respective copyright holders.*
