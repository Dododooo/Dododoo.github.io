---
title: Chapter 11字符串和字符串函数
date: 2023/4/5 23:17:25  # 文章发表时间
tags:
- C_learning
categories: C
#thumbnail: https://xxxxxxxxxx.png # 略缩图
---
字符串是以空字符(\n)结尾的char类型数组

puts()只显示字符串，且自动在显示的字符串末尾加上换行符

字符串字面量(字符串常量)就是被双引号扩起来的内容，双引号的字符和编译器自动在后面加上\0

```c
char greeting[50]="Hello,and"" how are " " you";
//等价于
char greeting[50]="Hello,and how are you";
```

字符串内使用双引号，必须在双引号前面加上一个\

`printf("\"Run,Spot,run!\"exclainmed DIck.\n")`

字符串常量属于静态存储类别static storage class,这说明如果在函数中使用字符串常量，该字符串只会被存储一次，在整个程序的生命期内存在，用双引号扩起来的内容被视为指向该字符串储存位置的指针，

```c
#include <stdio.h>
int main(void)
{
    printf("%s,%p,%c\n","We","are",*"space farers");
    return 0;
}
```

%p打印出"are"首字母'a'的地址

*"space farers"表示取字符串第一位的值

如果一个字符串中没有空字符，这就是一个字符数组而不是字符串

在指定数组大小时，要确保数组的元素个数至少比字符串长度多1，所有未被使用的元素都被初始化为\0

也可以省略指定字符串长度:

`char m2[]="hehehea ahah ,";`

```c
char car[10]="Tata";
car==&car[0];
*car='T';
*car+1='a'=car[1];
|T|a|t|a|\0|\0|\0|\0|\0|\0| | | |
```

```c
数组形式:
const char ar1[]="abcd";
指针形式:
const char *pt="abcd";
```

**数组形式:**在初始化字符串时，字符串会储存在静态存储区static memory，而程序开始运行之后，字符串会被拷贝到准备好的ar1[]数组当中，ar和数组名称一样为首字符的地址，常量不能改变

**指针形式**:初始化也会让编译器为字符串预留空间，另外，开始运行程序时，也会为指针变量pt留出一个储存位置，然后把字符串首字母的地址存在指针中，但是指针的位置可以改变。

字符串字面量是const数据，所以pt声明时也应该为const char*pt，因此不能用它来改变其中的值，除非把该字面量赋值给一个非const数组

数组名是常量，指针名是变量

如果需要显示字符串，可以使用指针字符串，如果需要改变字符串当中的值，可以使用数组字符串。

## 11.2 字符串输入

```c
char *name;
scanf("%s",name);//有可能会擦除其他程序的数据或代码，

char name[81];
scanf("%s",name);
gets(name);
fgets(name);
```

scanf()只能读取一个单词，碰到空白符便会停止

gets()就可以读取整行输入，直到遇到换行符，丢弃换行符，储存其他字符，并在这些字符的末尾添加一个空字符使其成为一个C字符串

get()只知道字符串的首地址，但不知道何时结束，有可能输入超出数组范围而导致数据溢出到意料外的内存空间，导致其他程序崩溃

### 11.2.3 gets()的替代品

fgets()和fputs()

gets_s()

fgets()有三个参数，用第二个参数限制读入的字符数，专门设计用来处理文件输入

* 如果fgets()的第二个参数是n,则将读入n-1个字符
* fgets()的第一个参数是字符串，表示将会把输入的值写进该字符串
* 如果fgets()读到了换行符，会把它存储在字符串中
* 第三个参数指明读入的文件，如果读入从键盘输入的数据则fgets(*,n,stdin)

`fgets(words,STLEN,stdin);`

fgets()函数返回指向char的指针，该地址即是第一个参数，即第一个字符的地址，如果函数读到文件结尾，将返回空指针

处理掉换行符:

```c
while(word[i]='\n')
{
  i++;
  word[i]='\0';
}
```

如果还有剩余的字符串留在输入行，丢弃掉剩余的字符

while(getcahr()!='\n')

​	continue;

空指针NULL不会与任何数据的有效地址对应

### gets_s()

和fgets()类似

gets_s(word,STLEN)

区别：

1gets_s()只从标准输入中读取数据

2 如果gets_s()读到换行符，会丢弃它

3 如果gets读到最大字符数都没有读到换行符，首先把目标数组中的首字符设置为空字符，读取并丢弃随后的输入直至读到换行符



### scanf()函数

scanf()更像是获取单词的函数，而非获取字符串函数，

`scanf("%5s",name)`读入五个字符并存入字符串，剩下的存入缓冲区，如果遇到空白符，则截止到空白符处



## 11.3 字符串输出

#### puts()

puts()只需要字符串的地址作为参数,而且在结尾自动加上\n

#### fputs()

针对文件的版本

fputs(name,stdout);

它不会在结尾加上换行符

puts()和gets()

fputs()和fget()要混合使用

#### printf()

## 11.4 自定义I/O函数

```c
void put1(const char * st)
{
    while(*st!='\0')
    {
        putchar(*st++);
    }
}
```

## 11.5 字符串函数

#### <string.h>

#### strlen()

可以定义如下自定义函数用来截断字符串

```c
void fit(char * st,int size)
{
  if(strlen(st)>size)
  {
    strlen[size]='\0';
  }
}
```



#### strcat()

strcat(st1,st2);

拼合两个字符串，并返回拼合字符串的首地址,第一个数组的空间必须能容纳第二个数组

#### strncat()

strncat(bug,addon,13)

第三个参数指定了**最大添加字符数**

只添加addon的前13个字符

#### strcmp()

strcmp(st1,st2);

比较字符串是否相等

如果相同则返回0值

如果st1在st2前面，则返回一个负数，反之返回正数

#### strncmp()

strncmp(st1,st2,n);

strncmp()会比较两个字符串直到第n个字符

#### strcpy()

strcpy(st1,st2);

strcpy()的返回值是char *类型的地址，是st1第一个字符的地址

#### strncpy()



strncpy(st1,st2,n)

只拷贝st2的前n个字符到st1,使用时若发生超出N个字符时，应注意此时拷贝过去的没有空字符

#### sprintf()

把数据写入字符串

sprintf(st1,"%s",st2);

把st2以格式化的形式写入st1

## 11.8 命令行参数

fuss.exe

> $fuss -r Ginger

C程序可以通过main()的参数读取这些附加项

./repeat Resistance is futile

main()有两个参数时，第一个参数是命令行中的字符串数量，argc(argument count),因此减去repeat本身，就是参数的个数

,把命令行输入的每一个字符串的地址储存在指针数组中

## 11.9 把字符串转换为数字

#### atoi()		//<stdlib.h>

alphabet to integer

吧字符数字转换成整数

#### strtol()

string to long

strtol(str1,&end,10);

把str1转换为long格式，输入为10进制，返回给end识别数字之后的那一位的地址









