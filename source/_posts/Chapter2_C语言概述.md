---
title: Chapter2 C语言概述
date: 2023/4/5 23:17:25  # 文章发表时间
tags:
- C_learning
categories: C
#thumbnail: https://xxxxxxxxxx.png # 略缩图
---
## 2.2.1 快速概要

```c
#include <stdio.h>
int main(void)
{
    int num;
    num = 1;

    printf("I am a simple ");
    printf("computer.\n");
    printf("My favorite number is %d because it is first. \n",num);

    return 0;
}
```

Printf() means print format,格式化输出

int 表示main()返回一个整数，integer,变量声明，声明为int整数类型

```c
/*这是注释*/

//这是单行注释

{

	/*左右括号代表函数定义开始和结束*/

}
```

**%d** 是**占位符** 表示打印出整数

;表示结束一条**语句**



## 2.2.2 细节

<stdio.h> header头文件

int >keyword关键字

num>identifier标识符

变量先声明后使用

printf 函数

%d占位符，表示十进制整数打印

```c
return 0;
```



表示int main()当中的主函数返回一个整数

## 2.3 简单程序结构

函数头

int main(void)



函数体

{

​	语句;	

}

# 复习题



1.C语言的基本模块是什么？

是函数，函数是能够实现特定功能的语句块，当用户按照函数的特定格式生成这个基本模块后，可以对函数反复调用，从而减少重复开发的时间成本。

2。什么是语法错误

编译器可以检查出的错误，例如标识符或者变量名称或者使用了未声明的变量，

英语例子:

I am a techer,

C语言例子:

Int mian()

{

​	i=8

}

3.什么是语义错误

编译器无法检查出的错误，得出的结果偏离了程序目标

英语例子:

The earth is plat.

C语言例子:

Int main()

{

​	int a = 3 ;

​	int b = 4 ;

​	int sum;

​	sum = 3 *4;

​	return 0;

}





