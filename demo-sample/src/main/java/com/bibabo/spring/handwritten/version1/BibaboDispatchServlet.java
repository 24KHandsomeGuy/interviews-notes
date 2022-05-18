package com.bibabo.spring.handwritten.version1;

import com.bibabo.spring.handwritten.annotation.BibaboComponent;
import org.springframework.util.StringUtils;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 20:54
 * @Description:
 */
public class BibaboDispatchServlet extends HttpServlet {

    private Properties properties = new Properties();

    private List<String> classNameList = new ArrayList<>();

    private Map<String, Object> iocMap = new HashMap<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 映射
        doDispatch();
    }

    private void doDispatch() {

    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        // 1.加载配置文件
        doLoadConfig(servletConfig.getInitParameter("contextConfigLocation"));

        // 2.扫描包
        doScanner((String) properties.get("scanPackage"));

        // 3.初始化IOC容器。将扫描到的类进行实例化，缓存到IOC容器中
        doInitializeContainer();

        // 4.依赖注入
        doAutowired();

        // 5.初始化MVC映射
        doInitializeHandlerMapping();

        System.out.println("Bibabo container initialization complete");
    }

    private void doInitializeHandlerMapping() {


    }

    private void doAutowired() {
    }

    private void doInitializeContainer() {
        // 初始化IOC容器
        if (classNameList.isEmpty()) {
            return;
        }
        classNameList.forEach(className -> {
            try {
                Class<?> clazz = Class.forName(className);
                Object obj = clazz.newInstance();
                String beanName = toFirstLetterlowerCase(clazz.getSimpleName());
                iocMap.put(beanName, obj);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });

    }

    private void doScanner(String scanPackage) {
        // 扫描包
        URL url = this.getClass().getClassLoader().getResource("/" + scanPackage.replaceAll("\\.", "/"));
        Optional.ofNullable(url).ifPresent(url1 -> {
            Optional.ofNullable(url.getFile()).ifPresent(filePath -> {
                File classPathFile = new File(filePath);
                Optional.ofNullable(classPathFile.listFiles()).ifPresent(files -> {
                    for (File file : files) {
                        // 如果是文件夹需要递归
                        if (file.isDirectory()) {
                            doScanner(scanPackage + "." + file.getName());
                            return;
                        }
                        if (!file.getName().endsWith(".class")) {
                            continue;
                        }
                        // 包名.类名
                        String className = scanPackage + "." + file.getName().replace(".class", "");
                        // 后续需要根据类全路径名反射创建对象实例Class.forName(className)，此处先缓存起来
                        classNameList.add(className);
                    }
                });

            });
        });


    }

    private void doLoadConfig(String contextConfigLocation) {
        // 找到classpath下的application.properties文件
        InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream(contextConfigLocation);
        Optional<InputStream> inputStreamOptional = Optional.ofNullable(inputStream);
        inputStreamOptional.ifPresent(is -> {
            try {
                properties.load(is);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    System.out.println("inputStream:" + inputStream + "close failed");
                }
            }
        });
    }

    private String toFirstLetterlowerCase(String simpleName) {
        char[] chars = simpleName.toCharArray();
        chars[0] += 32;
        return String.valueOf(chars);
    }
}
