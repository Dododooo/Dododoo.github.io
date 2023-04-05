# Chapter 3 数据与C

```c
#include <stdio.h>
int main(void)
{
    float weight;
    float value;
    printf("Are you worth your weight in plantium?\n");
    printf("Let's check it out,\n");
    printf("Please enter your weight in pounds:");

    scanf("%f", &weight);
    value = 1700.00 * weight *14.5833;
    printf("Your wieght in plantium is worth $%.2f. \n",value);
    printf("You are easily worth that! If plantium prices drop,\n");
    printf("eat more to maintain your value.\n");
    return 0;
    
}

```

* int 整数类型

* float 用来声明浮点型



```c
scanf("%f", &weight);
```

**scanf** 标准输入函数，用来获取用户输入,运行到此时程序会**阻塞**，等用户输入，

"**&**"表示取weight变量的地址，把前者获得的值放入该地址的内存空间

```c
printf("Your wieght in plantium is worth $%.2f. \n",value);
```

打印的浮点值可以用**%f**来表示，后面的**.2**用来精确控制输出位数，指定输出的浮点数只显示小数点后面两位

%f和%d都是占位符

## 3.2 变量和常量

 Int num;

num=2.321; //<<<是错的

不能把浮点数赋值给常量

## 3.3 数据类型关键字



| 类型名称       | 类型关键字     | 占字节数 | 其他叫法           | 表示的数据范围                           |
| -------------- | -------------- | -------- | ------------------ | ---------------------------------------- |
| 字符型         | char           | 1        | signed char        | -128 ~ 127                               |
| 无符号字符型   | unsigned char  | 1        | none               | 0 ~ 255                                  |
| 整型           | int            | 4        | signed int         | -2,147,483,648 ~ 2,147,483,647           |
| 无符号整型     | unsigned int   | 4        | unsigned           | 0 ~ 4,294,967,295                        |
| 短整型         | short          | 2        | short int          | -32,768 ~ 32,767                         |
| 无符号短整型   | unsigned short | 2        | unsigned short int | 0 ~ 65,535                               |
| 长整型         | long           | 4        | long int           | -2,147,483,648 ~ 2,147,483,647           |
| 无符号长整型   | unsigned long  | 4        | unsigned long      | 0 ~ 4,294,967,295                        |
| 单精度浮点数   | float          | 4        | none               | 3.4E +/- 38 (7 digits)                   |
| 双精度浮点数   | double         | 8        | none               | 1.7E +/- 308 (15 digits)                 |
| 长双精度浮点数 | long double    | 10       | none               | 1.2E +/- 4932 (19 digits)                |
| 长整型         | long long      | 8        | __int64            | -9223372036854775808~9223372036854775808 |



* int表示基本整数类型，(long, short和unsigned)是可以作为前缀 作为int的整数类型变式，
* char用于指定字母和字符，也可以表示较小整数
* Float,double和long double 表示带小数点的数
* _Bool表示布尔值,,true of false
* `_complex`和`_imaginary`表示复数和虚数



#### 位 字节 和字

最小的存储单元是位bit，可以存储0和1

1字节byte=8位bit

1byte存储2^8=256 种组合

字word 长度不固定，多少位的计算机，存储字长就有多少位，8位微型计算机，字长就是八位

### 3.3.1 整数与浮点数



整数

表示7

八位字节

[0 | 0 | 0 | 0 | 0 | 1| 1 | 1 ]

​                               2^2+2^1+2^0

科学计数法

`1.2E4`= 1.2 x 10^4

存储浮点数:

｜+｜ .314159    |1|

符号     小数          指数

浮点运算比整数慢

## 3.4 c语言基本数据类型

16位计算机的字长是16

则int的取值范围-2^15-2^15，即存储一个int值占据一整个字长

变量获得值的方法:

* 可以通过 = 进行赋值
* 可以通过函数，如(scanf())获得值

初始化可以在声明中完成:

`int a = 2;`



### 3.4.1 int类型

%d指明了打印整数的位置，`%d`的个数应和后面的int值数量匹配

#### 八进制和十六进制

C语言默认整型是十进制数

`0x`或者`0X`表示十六进制

无论数字字面表现形式什么样，存储该数的方式相同

#### 显示八进制和十六进制

十进制使用`%d`，

八进制使用`%o` ，显示前缀0,使用`%#o`

十六进制使用`%x`,显示前缀0x或0X,使用`%#x` or `%#X`

### 3.4.2 其他整数类型

`short int`类型 占用空间少，用于较小数值场合以节省空间

`long int `占用较多，用于数值较大的场合

`long long int `占用空间更多,至少占用六十四位

`unsigned`只用于非负的场合，十六位unsigned int取值范围是0~65535，而不是-32768~32767

根据不同使用环境 使用不同的类型，以便移植到更小位数的计算机上



数值大小

Int < unsigned < long < unsigned long <long long <unsigned long long

```c
unsigned long num3 = 33UL;
```

其中**L**表示将num3作为long类型存储

32位int可以表示大概数值为20亿

超出该值将会溢出



打印`unsigned int` 类型 使用`%u`

打印`long` 类型 使用`%ld`

打印十六进制`long ` 类型 使用`%lx`

打印八进制`long` 类型 使用`%lo`

打印`short` 类型 使用`%hd`

打印八进制`short` 类型 使用`%ho`

打印`unsigned long` 类型 使用`%lu`

### 3.4.3 Char类型

char用于存储字符, 它实际上存储的是整数而不是字符

美国常用的编码是**ASCII编码**，例如整数65用来代表大写字母A

ASCII对照表

https://tool.oschina.net/commons?type=4

‘0’ -> 48

’A‘-> 65

'a'-> 97

一个字节定位为char占用的位数 8bit

声明方式：

使用单引号扩起单个字符

`char grade= 'A';`

用 `%c`将char打印出



```c
char ch = 65;
char ch2 = 'A';
printf("ch = %c,ch2 = %d",ch,ch2);
>ch = A,ch2 = 65
```



#### 非打印字符

有一些字符没有办法打印

可以通过三种方式打印

##### 第一种 使用ASCII码

整数7代表蜂鸣器，则可以

`char beep = 7;`

##### 第二种 使用特殊符号序列表示一些特殊的字符，叫做转义序列 escape sequence

当打印一个回车的时候

```c
char ch ='\n';
char ch1 = '\'';//输出单引号
```

| 序列 | 意义              |
| :--- | :---------------- |
| \b   | 一个退格符        |
| \n   | 新行              |
| \r   | 回车              |
| \t   | Tab               |
| \Z   | CTRL+Z (ASCII 26) |
| \”   | 一个双引号字符    |
| \\\  | 一个反斜杠字符    |
| \0   | 一个 ASCII 空字符 |

转义字符的使用:

```c
printf("Gramps sez, \"a \\ is a backslash.\"\n");
>>>Gramps sez, "a \ is a backslash."
```



`\0xx'和'\xhh'是ASCII码的特殊表示，要用ASCII码表示一个字符，可以在编码值前面加反斜杠

`beep='007';`

### 3.4.4 _Bool类型

Bool类型只占用一位

### 3.4.6 float,double, long double

浮点类型

322.56 >> 3.2256e2

float必须至少能表示6位有效数字,即精确到小数点后六位有效数字，float类型占用32位 ，8位用于表示指数的值和符号，剩下24位表示非指数部分及其符号

Double 是双精度，至少表示10位有效数字，占用64位，double的值至少超过13位有效数字

`-1.56e+12`正数的加号可以省略

默认情况下，浮点型常量是double类型的精度，可以在常量后加上F使其成为float类型，加L变成Longdouble类型

### 网络整理占位符

```c
%d		//以十进制整型格式
%i		//以十进制整型格式
%ld		//以十进制长整型(long int)格式
%lld    //以十进制长长整型(long long int)格式
%u		//以无符号十进制整型格式
%c		//以字符格式
%f		//以float型格式输出
%lf     //以double型格式输出
%e		//以指数格式
%le     //以指数格式
%E		//以指数格式
%lE     //以指数格式
%g		//%e或%f的缩短版
%G		//%E的缩短版
%s		//以字符串格式
%o		//以无符号八进制整型格式
%ho     //以八进制短整型格式输出
%p		//以地址格式
%x		//以无符号十六进制整型格式(小x输出的十六进制为小写的)
%X		//以无符号十六进制整型格式(大X输出的十六进制为大写的)
%hd		//以短整型格式
%hu		//以无符号短整型格式
%lu		//以无符号长整型格式
%zd		//表示sizeof()的整数格式
 
```



特殊的浮点值 NaN(not a number)

## 3.5 使用数据类型

类型和赋值要匹配

`int cost = 12.99`🙅

## 3.6参数和陷阱

一个字符串`"asdijwio"`就是一个参数

转换说明的数量类型，要与后面参数的数量类型相匹配

## 3.7 转移序列实例

```c
#include<stdio.h>
int main(void)
{
    float salary;
    printf("\aEnter you desired monthly salary");
    printf("$_____\b\b\b\b\b\b\b\b");
    scanf("%f",&salary);
    printf("\n\t$%.2f amonth is $%.2f a year",salary,salary*12);
    printf("\rGee!\n");
    return 0;
}


>>>Enter you desired monthly sala98988___

Gee!    $98988.00 amonth is $1187856.00 a year
```

printf把输出发送到buffer缓存区

当**缓冲区满**或者**遇到换行字符**或**需要输入**的时候，缓冲区的内容会被发送到屏幕

## 3.8 关键概念

* 两大类数据类型:整数类型和浮点数类型
* 最小的整数类型是char
