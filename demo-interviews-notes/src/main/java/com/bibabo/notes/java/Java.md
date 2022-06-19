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