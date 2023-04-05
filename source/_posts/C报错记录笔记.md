# 报错记录笔记

## 1./Users/heyushu/Desktop/Codes/C_Primmier_Plus/Chapter_3/transform_asc.c

```c
#include <stdio.h>
int main(void)
{
    int ch;
    char ch2;
    printf("please enter the num you want to transform to charactor:\n");
    scanf("%d",&ch);

    printf("please enter the charctor you want to transform to num:\n");
    scanf("%c",&ch2);
    printf("ch = %c, ch2 = %o \n",ch,ch2);
    return 0;
   
}
➜  Chapter_3 cd "/Users/heyushu/Desktop/Codes/C_Primmier_Plus/Chap
ter_3/" && gcc transform_asc.c -o transform_asc && "/Users/heyushu
/Desktop/Codes/C_Primmier_Plus/Chapter_3/"transform_asc
please enter the num you want to transform to charactor:


83
please enter the charctor you want to transform to num:
ch = S, ch2 = 12 
➜  Chapter_3 
```



### 网上找到的解析

问题如下: 
先上程序 
一: 

```c
#include <stdio.h> 
int main (void) 
{ 
 int a, b; 
 puts ("请输入一个整数"); 
 scanf ("%d", &a); 
 puts ("再输入一个整数"); 
 scanf ("%d", &b); 
 printf ("a = %d b = %d\n", a, b); 
return 0; 
} 
```

二: 
```c
#include <stdio.h> 
int main (void) 
{ 
char c1, c2; 
 puts ("请输入一个字符"); 
 scanf ("%c", &c1); 
 puts ("再输入一个字符"); 
 scanf ("%c", &c2); 
 printf ("c1 = %c c2 = %c\n", c1, c2); 
 return 0; 
} 
```



现在我说说问题出在哪里,要说明的是程序一是没问题,有问题的是程序二 
在程序二中,比如你输入一个字符j, 它会打印 c1 = j c2 = ,也就是说执行第二scanf的时候它没提示你输入一个字符,原因是这样的:在C语言中，如果使用字符型变量（就是char型）时在有连续输入的情况下，很容易因为出现垃圾字符而导致程序的流程非法。也就是c2存储了c1中没有存储的一个回车符号.c1没有接受回车符,这个符号存储在输入缓存中,当执行到第二个scanf的时候这个回车符就赋给了c2.所有程序没有提示你输入字符. 
问题和原因说完了,现在说说解决的方法,方法有三个,可能有更多,而我不知道的,你可以自己思考一下 
**方法一:** 
把第一个scanf 改成 scanf ("%c\n", &c1);  //亲测无效
**方法二:** 
在第一个scanf 后添加下面的语句 
fflush (stdin); //有效，清除了上一个变量输入留下的缓存
**方法三:** 
 在puts ("再输入一个字符");语句下面添加下面的语句 
while (getchar () != '\n'); //有效，当上一步的enter没清除完全时不能进入下一次输入



### Chapter 3 复习题错误

3.使用哪些可移植的数据类型可以获得32位有符号整数?

​	#include<stdint.h>

​	#include<inttypes.h>

Int32_t

4.指出下列常量的类型和含义

c.99.44   |错误的:float|>>double，因为C默认浮点型常量为双精度

d.0xAA   |错误的:int,16进制整型|>> unsigned int，C默认十六进制或八进制常量为无符号整型

5.注意程序中应有输出，并且int类型的main函数应返回0

6.写出常量对应的类型和转义字符

0x3. |int  %x|>>unsigned int , %#x

2.34e07 |float %f|double %e

2.0 |float| double

6L |long double %lf|long int %ld

012 |int %o| %unsigned int %#o

### Chapter 4 复习题错误

2.输出比当前字符串宽度宽3位的字段打印

```c
#include <stdio.h>
#include <string.h>
int main(void)
{
    char f_name[20];
    char l_name[20];
    int f_width;
    int l_width;

    printf("Please enter your first name and lst name\n");
    scanf("%s %s",f_name,l_name);
    printf("\"%s,%s\"\n",f_name,l_name);
    printf("\"%20s,%20s\"\n",f_name,l_name);
    printf("\"%-20s,%-20s\"\n",f_name,l_name);
    f_width = strlen(f_name)+3;
    l_width = strlen(l_name)+3;
>>  printf("\"%*s,%*s\"\n",f_width,f_name,l_width,l_name);
    
    

    return 0;
}
```

在标记行中使用了*输出，一开始使用的是strlen(f_name)+3,但是不行

声明了变量后加入到printf的参数列表，就可以输出了

### Chapter 10

```.c
#include<stdio.h>
#define MONTHS 12
#define YEARS 5

int main(void)
{
    
    const float rain[YEARS][MONTHS]=
    {
        {4.3,4.3,4.3,3.0,2.0,1.2,0.2,0.2,0.4,2.4,3.5,6.6},
        {4.3,3.0,2.0,1.2,0.2,0.2,3.0,2.0,1.2,0.2,0.2,6.4},
        {0.2,0.4,2.4,3.5,6.6,4.3,4.3,4.3,3.0,2.0,1.2,9.2},
        {4.3,3.0,2.0,1.2,0.2,0.2,3.0,2.0,1.2,0.2,0.2,6.4},
        {4.3,4.3,4.3,3.0,2.0,1.2,0.2,0.2,0.4,2.4,3.5,6.6}
    };

    int year;
    int month;
    const float (*ptr)[12];
    ptr=rain;
    float subtot;
    float total;

    printf("    YEAR    RAINFALL    (inches)\n");
    for(year=0;year<YEARS;year++)
    {
        for(month=0,subtot=0,ptr=rain;month<12;month++)
        {
            subtot+=*(*(ptr+year)+month);
            
        }
        printf("%5d %12.1lf\n",year+1,subtot);
        total+=subtot;
    }
    printf("\nThe yearly average is %.1f inches.\n",total/YEARS);
    printf("MONTHLY AVERAGES:\n\n");
    printf("JAN FEB MAR APR MAY JUN JUL AUG SEP OCT");
    printf(" NOV DEC\n");
    for(month=0;month<MONTHS;month++)
    {
        // for(year=0,ptr=rain,subtot=0;year<YEARS;year++,ptr=(*(rain+year)+month))
        // {
        //     subtot+=**ptr;   此处移动指针输出数据错误是因为ptr=(*(rain+year)+month)不应放在后面执行
        // }
     
        // for(year=0,subtot=0;year<YEARS;year++)//改成如下模式就可以
        // {
        //     ptr=(*(rain+year)+month);
        //     subtot+=**ptr;
        // }
        for(year=0,subtot=0;year<YEARS;year++)
        {
            subtot+=*(*(ptr+year)+month);
        }
        printf("%7.1f",subtot);
    }
    putchar('\n');

    return 0;

}
```

此处我使用了移动指针的方式，但发生了错误输出，由于在呢内循环结束后才移动指针，因此后面的数据发生错误，而且对于const 数组，应该使用const 指针，不移动指针，而是以指针为基准，向右向下索值
