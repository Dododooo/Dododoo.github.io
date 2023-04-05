---
title: Chapter 10 数组和指针
date: 2023/4/5 23:17:25  # 文章发表时间
tags:
- C_learning
categories: C
#thumbnail: https://xxxxxxxxxx.png # 略缩图
---

`float candy[10]`

声明数组，方括号表示是数组类型

只储存单个值的变量被称为标量变量

### 10.1.1 初始化数组

可以使用const float candy[10];

用来声明只读数组，不能把新值写入数组



可以把数组创建成不同的存储类别

本章的数组属于自动存储类别，这些数组在函数内部声明，就是自动存储类别,

未赋值的数组元素，会被编译器赋值为零

可以省略数组方括号的数字`days[]={1,2,3,4,5};`

`sizeof(days)/sizeof(days[0])`即为数组的元素个数

### 10.1.2指定初始化器

designated initializer

```c
int arr[6]={[5]=212}//把第六个元素初始化为212
```

### 10.1.3给数组元素赋值

```c
int counter;
int evens[SIZE];
for(counter=0;counter<SIZE;counter++)
  	evens[counter]=2*counter;

```

C不允许吧数组作为一个单元赋给另一个数组

除了初始化的时候，不可以再次使用花括号列表的形式赋值

### 10.1.5 指定数组的大小

方括号内只能使用整型常量表达式，并且是正数

## 10.2 多维数组

```c
float rain[5][12];
for(i=0;i<5;i++)
  for(j=0;j<12;j++)
  {
    scanf("%d",&rain[i][j]);
  }

for(i=0;i<5;i++)
  {
    for(j=0;j<12;j++)
    {
      printf("%4.2f",rain[i][j]);
    }
  	putchar('\n');
}
```



## 10.3 指针和数组

数组名是数组首元素的**地址**

```c
          short          double
ponters+0:0x16f0a2990 0x16f0a2970
ponters+1:0x16f0a2992 0x16f0a2978
ponters+2:0x16f0a2994 0x16f0a2980
ponters+3:0x16f0a2996 0x16f0a2988
```

指针+1会使其地址加上其sizeof(指针类型)的字节大小

指的是增加一个存储单元

在函数中声明传入的参数类型为数组时， 可以使用以下两种方式

```c
int sum(int ar[],int n);
int sum(in * ar,int n);
```

一元运算符*和++的优先级相同，但结合律是从右向左，因此`*start++`

先进行start++再指向

```c
///*p1++	先算*p1,然后再指向下一个值
//*++p2		先p2++，然后再指向
//(*p3)++ 先返回p3所指向的值，再把这个值加1
```

只有当ar是指针变量时才能使用ar++，ar[]的ar无法直接使用ar++

## 10.5 指针操作

八种指针操作

指针加减法:指针加减整型，指针递增，递减，指针相减，赋值=，*解引用,取址&

## 10.6 保护数组中的数据

```c
int sum(int ar[],int n)//可以写成int sum(const int ar[],int n)
{
  	int i;
  	int total=0;
  for(i-0;i<n;i++)
  {
    total+=ar[i]++//这里误将每个数组中的元素递增
  }
}
```



如果使用了const int ar[]

若是改变了数组的值，编译时则会报错

:/Users/heyushu/Desktop/Codes/C_Primmier_Plus/Chapter_10/arf.c

### 10.6.2 const的其他内容

指向const 的指针不能用于改变值

```c
double rate[5]={1,2,3,4,5};
const double * pd=rate;

*pd=29.89;//不允许
pd[2]=22.2//不允许
 pd++;//可以
```

这里的指针pd不可以改变它所指对象的值

const指针可以被赋值为const或者非const的数据变量的地址

非const指针只能被赋予非const的数据地址

> 普通的指针处理普通的数组
>
> const的指针都能处理
>
> const的数组只能用const指针来处理

创建指针时还可以使用两次const,这种表示指针既不能改变指向对象的值，又不能改变指向的地址

```c
double rate[5]={2,2,2,2};
const double * const pc=rate;
^锁定值					^锁定地址
```

专用只读指针^ ^

## 10.7 指针和多维数组

`int zippo[4][2];`

```c
*zippo[1]等价于zippo[1][0]
*zippo等价于zippo[0]
**zippo等价于zippo[0][0]的值
zippo==&zippo[0]
zippo[0]==&zippo[0][0]
```

zippo为指针的指针 双重间接** double indirection 

```c
int zippo[4][2]=
    {
        {2,4},
        {6,8},
        {1,3},
        {5,7}
    };

>Zippo=0x16d832970,zipp+1=0x16d832978
zippo[0]=0x16d832970,zippo[0]+1=0x16d832974
*zippo=0x16d832970,*zippo+1=0x16d832974
zippo[0][0]=2
*zippo[1]=6
**zippo=2
zippo[2][1]=3
*(*(zippo+2)+1)=3
```

### 10.7.1 指向多维数组的指针

声明一个指针变量pz指向二维数组

int (*pz)[2];

pz指向两个int型的数组

int *pax[2]

指针数组pax[2]是包含两个指针的数组

## 10.7.2 指针的兼容性



```c
int n=5;

double x;

int * pl=&n;

double * pd =&x;
x=n;//隐式类型转换
pd=pl;//报错

```



int **p2;//指向指针的指针

### 10.7.3 函数和多维数组

声明

void somefunction(int (*ar)[4]);

声明一个多维数组指针时，只能省略最左边方括号的值

## 10.8 变长数组

```c
int quarters=4;

int regions=5;

double sales[region][quarters];


```

变长数组必须是自动存储类别，且不能修改已创建的数组长度

```c
int sum2d(int rows,int cols,int ar[rows][cols]);//声明

int sum2d(int rows;int cols,int ar[rows][cols])
{
  int r;
  int c;
  int tot=0;
  
  for(r=0;r<rows;r++)
    	for(c=0;c<cols;c++)
        	tot+=ar[r][c];
  return 0;
}


```



## 10.9 复合字面量

```c
int diva[2]={10,20};//数组声明
(int[2]){10,20};//复合字面量，也可以省略方括号内部
```

因为复合字面量是匿名的，因此必须创建的同时就使用它

可以使用指针来记录它

`int *p1;p1=(int[2]){10,20};`

还可以吧它作为实参传给函数

```c
ubt sum(const int ar[],int n);

sum((int[3]){1,2,3},3)
```

可以应用于二维数组

```c
int (*pt)[4];
pt=(int[2][4]){{1,2,3,4},{5,6,7,8}};
```





















