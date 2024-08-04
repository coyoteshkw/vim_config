# my vim config

I use [vim-plug](https://github.com/junegunn/vim-plug) to config my plugin.

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Reload the file or restart Vim, then you can,

- :PlugInstall to install the plugins
- :PlugUpdate to install or update the plugins
- :PlugDiff to review the changes from the last update
- :PlugClean to remove plugins no longer in the list

```vimrc
Plug 'junegunn/vim-plug' " 加载文档
Plug 'tpope/vim-vinegar' " 给newtr目录管理添加- 键等小功能，如果安装Nerdtree会默认使用那个
Plug 'ctrlpvim/ctrlp.vim' " 搜索当前目录的文件、最近修改的文件、buffer
Plug 'mileszs/ack.vim' " 在vim中使用ack命令，将结果用quickfix窗口打开
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround' " 添加、修改各种括号中的内容
Plug 'tpope/vim-unimpaired' " 为[ ] y 键添加一些实用映射
Plug 'rhysd/clever-f.vim' " 重复f/F键来执行原先;,的操作
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify' " 美化启动界面
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 语法补全
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary' " 注释 gcc
```

