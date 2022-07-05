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