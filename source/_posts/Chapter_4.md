---
title: Chapter 4 字符串和格式化输入输出
date: 2023/4/5 23:17:25  # 文章发表时间
tags:
- C_learning
categories: C
#thumbnail: https://xxxxxxxxxx.png # 略缩图
---
## 4.1 前导程序

```c
#include <stdio.h>
#include<string.h>
#define DENSITY 62.4 //人体密度
int main(void)
{
    float weight,volume;
    int size,letters;
    char name[40];

    printf("Hi ,what is your first name?\n");
    scanf("%s",name);

    printf("%s, what is your weight in pounds?\n",name);
    scanf("%f",&weight);

    size = sizeof(name);
    letters = strlen(name);
    volume = weight / DENSITY;

    printf("Well ,%s , your volume is %2.2f cubic feet.\n",name,volume);
    printf("Also, your first name has %d letters,\n",letters);
    printf("and we have %d bytes to store it.\n",size);

    printf("done\n");
    return 0;
}

```

用数组array 存储字符串character string ,

## 4.2 字符串简介

字符串是一个或多个字符的序列

C语言**没有**专门用于储存字符串的变量类型

数组由连续的存储单元组成，编译器会分配连续的内存单元存储字符串，字符串结尾有一个`\0`空字符null character,用它标记字符串的结束，创建字符串时应预留一个位置给空字符

字符串存储**同一种类型**的

`int age[20];`

`Scanf()`在遇到第一个**空白**(空格，制表符或者换行符)时就不再读取

字符'x'与字符串常量"x"不同,'x'是基本类型char,而"x"是派生类型char数组，且"x"由两个字符构成，一个x一个'\0'

### 4.2.3 strlen()

用来统计字符串的字符长度

Strlen()包含在<string.h>中

strlen()表示实际存储字符的数目长度包括空格和符号

Sizeof()则计算多少空间，包括末尾的空字符。

## 4.3常量和预处理器

Define是预处理器，可以用来创建符号常量

`#define TAXRATE 1.15`

用大写表示，可以视为是一个常量而非变量

**编译时替换**

`Printf("%1.2f",radius);` 其中`%1.2f`表明结果被四舍五入为两位小数输出

define还可以定义字符和字符串常量



### 4.3.1 const限定符

const 声明的变量是只读变量

`const int MONTH = 12// MONTH在程序中不可更改`

### 4.3.1明示常量

<limit.h>中存在一些常量的最大最小值的预处理

`/Users/heyushu/Desktop/Codes/C_Primmier_Plus/Chapter_4/defines.c`

## 4.4 printf(),scanf()

简称I/O函数

printf(格式字符串，待打印项，待打印项....)；

`%%`即可打印出百分号%

### 4.4.3 printf()的转换说明修饰符

在%和转换字符之间插入修饰符

`%-10d`标记(-，+，空格#和0)

`%4d`数字(最小字段宽度)

`%.2f`.数字(表示小数点右边数字的位数)

按照以上顺序书写

 

![img](https://images2018.cnblogs.com/blog/1026930/201805/1026930-20180505152433212-254355502.png)



![img](https://images2018.cnblogs.com/blog/1026930/201805/1026930-20180505152521356-475047738.png)

当一个short int值要以%c显示时被进行了截断，只显示255，一字节，以内得到的值，相当于被255整除只取余数

#### printf的返回值

返回打印字符的个数

### 4.4.5 使用scanf()

scanf()把输入的文本生成文本字符，如果输入数字，则把字符转换成数值

如果用scanf()读取基本变量类型的值，在变量名前加上&

如果用scanf()把字符串读入字符数组中，不用使用&

printf()的参数列表中使用变量 常量和表达式

而scanf()使用指向变量的指针

scanf() 使用空白把输入分成多个字段，匹配时跳过空白

#### scanf()和pinrtf()的转换说明区别

scanf()和printf()的转换说明几乎相同，区别在于，对于float和double类型，pinrtf()都使用%f,%e,%E,%g，而scanf()只把他们用于float类型，对于double类型要使用l修饰符

![img](https://images2018.cnblogs.com/blog/1026930/201805/1026930-20180505175002139-1132578643.png)

![img](https://images2018.cnblogs.com/blog/1026930/201805/1026930-20180505175125161-917772408.png)

scanf()每次读取一个字符，读取除空白以外的所有字符

scanf()允许把普通字符放入格式化字符串

`scanf("%d,dwalji%d",num,num1);`

但是要按照格式输入

只有%c输入字符的情况下，输入不会跳过前面的空白，而是输入空白符

#### scanf()的返回值

scanf()返回成功读取的项数、如果没有读取任何项，当需要读取一个数字而用户输入一个非数值，则返回0，当其检测到文件结尾时，scanf()返回EOF

#### *修饰符

如果不想预先指定字符宽度，希望程序来指定，可以用*代替字符宽度，但还是要用一个参数告诉函数，字符宽度应该是多少

scanf()中使用*修饰符，会使得输入时跳过赋值该参数

printf()使用*修饰符，参数列表中应有相应的字符宽度在要赋的值之前，

`printf("%*d\n",width,num);`

这样，width的值就相当于字符宽度被赋予给*

#### printf()的用法提示

`printf("%6d %6d %6d\n",val1,val2,val3);`

> 13421    321      4

为了输出排列整齐，可以使用字符宽度



> 要输入带空格的字符串，要用到一个格式字符：%[] --> 一个字符集。
>
>     “%[]”的作用是扫描字符集合：
>     
>     例如：scanf(“%[^\n]”,str);
>     
>     ‘\n’就是一个具体的字符常量，表示：将’\n’作为字符串的结束符号。这与默认状况下，空格可以作为结束符一样，加上”%[^\n]”之后表示由编程者自己定义一个结束符。
>