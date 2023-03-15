#IO
### Linux strace指令
把Windows下写好的java文件rz到linux系统中，javac编译一下（package要删掉，否则无法运行）
用户空间触发内核指令的跟踪查看（系统调用、信号传递）
```bash
strace -ff -o out java BioServerSocekt
```
执行上述命令运行后，当前目录下会多出很多out.线程id的文件，vim查看
```text
......
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554700457}) = 0
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554720912}) = 0
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554742665}) = 0
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554763107}) = 0
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554783551}) = 0
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554862165}) = 0
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554883374}) = 0
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554905186}) = 0
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554925791}) = 0
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554954656}) = 0
clock_gettime(CLOCK_MONOTONIC, {tv_sec=277182, tv_nsec=554975789}) = 0
poll([{fd=6, events=POLLIN|POLLERR}], 1, -1
将6的文件描述符放到等待队列中

accept(6, {sa_family=AF_INET6, sin6_port=htons(1394), inet_pton(AF_INET6, "::ffff:120.244.62.207", &sin6_addr), sin6_flowinfo=htonl(0), sin6_scope_id=0}, [28]) = 7
接收ip120.244.62.207 port1394连接
IO阻塞
recvfrom(7, "a", 8192, 0, NULL, NULL)   = 1
ioctl(7, FIONREAD, [0])                 = 0
recvfrom(7, "s", 8192, 0, NULL, NULL)   = 1
ioctl(7, FIONREAD, [0])                 = 0
recvfrom(7, "d", 8192, 0, NULL, NULL)   = 1
ioctl(7, FIONREAD, [0])                 = 0
recvfrom(7, "\r\n", 8192, 0, NULL, NULL) = 2
ioctl(7, FIONREAD, [0])                 = 0
write(1, "\346\216\245\346\224\266\345\256\242\346\210\267\347\253\257\350\257\267\346\261\202\346\266\210\346\201\257\357\274\232as"..., 44) = 44
write(1, "\n", 1)                       = 1
sendto(7, "server has receive your request:"..., 48, 0, NULL, 0) = 48
dup2(5, 7)                              = 7
close(7)                                = 0
用户端的输出
poll([{fd=6, events=POLLIN|POLLERR}], 1, -1
又回到连接阻塞
```
poll表示采用poll模型阻塞。因为是BIO模式

查看内核指令
```bash
man 2 poll

显示
No manual entry for poll in section 2

yum install -y man-pages
```
```text
POLL(2)                                                                  Linux Programmer's Manual                                                                 POLL(2)

NAME
       poll, ppoll - wait for some event on a file descriptor
......

等待一个文件描述符，linux系统下一个文件描述符代表着一个连接       
```

rece() 模型一个进程只能监听一个 **BIO单线程处理**
select() 模型默认最多可以监听1024个socket（可以修改），但是每次唤醒进程都需要把等待文件描述符列表遍历一遍 **BIO接收连接后多线程IO阻塞**
poll() 模型在select模型上做了优化，socket连接数没有限制
epoll() event poll模型，事件拉取模型 **NIO多路复用**
man epoll




# IO

**总而言之，一切都是字节流，其实没有字符流这个东西。字符只是根据编码集对字节流翻译之后的产物。**

Java IO库有两个支系

- 面向字节流的**InputStream**和**OutputStream**
- 面向字符的**Reader**和**Writer**

字节流的InputStream和OutputStream是一切的基础。实际总线中流动的只有字节流。需要对字节流做特殊解码才能得到字符流。Java中负责从字节流向字符流解码的桥梁是：

```java
InputStreamReader
OutputStreamWriter
```

从图中可以猜到，实际负责编码和解码的是**StreamDecoder**类和**StreamEncoder**类。过程中必须指定使用的字符编码集**Charset**。所以InputStreamReader和OutputStreamWriter的构造器都带有Charset类型的参数。

```java
InputStreamReader(InputStream in, Charset cs)
OutputStreamWriter(OutputStream out, Charset cs)
```

如果没有指定编码集，将使用系统默认[编码集](https://www.zhihu.com/search?q=编码集&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A127103286})。而我们经常使用的FileInputReader和FileOutputWriter就是InputStreamReader和OutputStreamWriter的派生类。

**内存String编码**

另外一个要使用到Charset编码集的地方，是String的构造器和getBytes()方法。也可以通过参数控制具体使用的编码集。

```java
String s = "这是一段中文字符串"; 
byte[] b = s.getBytes("UTF-8"); 
String n = new String(b,"UTF-8");
```

**nio的字符编码**

另外nio包里的ByteBuffer的asCharBuffer()方法也可以实现字节流和字符流之间的转换。

```java
FileChannel fc=new FileInputStream(f).getChannel();
ByteBuffer bf=ByteBuffer.allocate(1024);
fc.read(bf);
bf.flip();
CharBuffer cf=bf.asCharBuffer();
```

但这里有个坑需要注意，asCharBuffer()方法，默认以**UTF-16BE**来解码byteBuffer里的字节。每个字符2字节。而String # getBytes()使用系统默认编码方式，大多数情况都不是UTF-16BE。所以经常CharBuffer里读取出来的会是乱码。