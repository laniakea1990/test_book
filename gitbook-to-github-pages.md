## 发布自己的电子书 {#发布自己的电子书}

### 环境 {#环境}

安装gitbook-cli

```
$ npm i -g gitbook-cli
$ npm install -g gitbook
```

新建book项目

```
$ cd book
$ gitbook init
```

然后项目多出两个文件

```
gitbook/
├── README.md
└── SUMMARY.md
```

README.md 和 SUMMARY.md 是两个必须文件，README.md 是对书籍的简单介绍。SUMMARY.md 是书籍的目录结构。  
编辑SUMMARY.md类似如下:

```
* [标题1](README.md)
  * [1.1 标题](md文件路径)
```

然后就可以查看了,监听在本地的4000端口,可以用浏览器打开[http://localhost:4000](http://localhost:4000/)查看书籍的效果

```
$ gitbook serve
```

接下来书本的具体内容就是在本地编辑markdown文档了。

### 发布网页文件和.md源文件

如果要把网页的.md源文件也推送到github的仓库里的一种实现途径为：master分支里放.md文件、然后创建一个gh-pages分支放网页，再推送到github仓库里。

* 第一步在github上新建一个空仓库,比如说book，链接为
  `https://github.com/aaa/book.git`
* 然后在本地进入到源码根目录，假设已经通过gitbook serve命令创建了\_book目录。例如：

  ```
  ├─Append
  ├─chapter1
  ├─chapter2
  └─_book
    ├─Append
    ├─chapter1
    ├─chapter2
    └─gitbook
  ```

  \_book为网页的目录，其他文件夹为.md所在文件夹。

* 源码那个分支需要将\_book屏蔽掉，因此新建一个.gitignore, 内容为\_book,也可以根据个人需要添加需要屏蔽的后缀或者文件夹。然后新建仓库，将源码添加至master分支并推送到github，具体命令如下：

* ```
  git init
  git add .
  git commit -m "master's version"
  git remote add origin https://github.com/aaa/book.git
  git push -u origin master
  ```
* 在书籍\_book录下新建仓库新建gh-pages分支，并将网页添加至该分支，最后推送到github。具体命令如下（\#号后为说明）：

* ```
  cd _book \#进入到_book目录
  git init \#新建仓库
  git -rm .gitignore \#删除.gitignore文件
  git checkout --orphan gh-pages \# 新建分支gh-pages
  git add . \#添加文件到该分支
  git commit -m "html's branch" \# 生成版本
  git remote add origin https://github.com/aaa/book.git \#给远程仓库设置昵称
  git push -u origin gh-pages \#推送gh-pages分支内容到远程
  ```
* 最后在github进入到项目，settings-GitHub Pages-source-选择gh-pages，过一会打开Github pages那里给出的网址就可以看到网页了。

    但是这样来回切换非常麻烦，所以可以写个build脚本，然后就可以一直在master分支上进行编辑了。

