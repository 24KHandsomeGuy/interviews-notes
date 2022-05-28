package com.bibabo.spring.handwritten.version1;

import com.bibabo.spring.handwritten.annotation.BibaboAutowired;
import com.bibabo.spring.handwritten.annotation.BibaboComponent;
import com.bibabo.spring.handwritten.annotation.BibaboController;
import com.bibabo.spring.handwritten.annotation.BibaboRequestMapping;
import org.springframework.util.StringUtils;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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

    // 配置文件Map
    private Properties properties = new Properties();

    // 扫描的包路径下的类全路径名
    private List<String> classNameList = new ArrayList<>();

    // Bean的容器
    private Map<String, Object> iocMap = new HashMap<>();

    private Map<String, Method> handlerMappingMap = new HashMap<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 映射
        doDispatch(req, resp);
    }

    private void doDispatch(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String url = req.getRequestURI();
        String contextPath = req.getContextPath();
        url = url.replaceAll(contextPath, "").replaceAll("/+", "/");

        if (!this.handlerMappingMap.containsKey(url)) {
            resp.getWriter().write("404 Not Found");
            return;
        }

        Method method = handlerMappingMap.get(url);
        // method.invoke();
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
        if (iocMap.isEmpty()) {
            return;
        }
        for (Map.Entry<String, Object> entry : iocMap.entrySet()) {
            Object bean = entry.getValue();
            if (!bean.getClass().isAnnotationPresent(BibaboController.class)) {
                continue;
            }

            String rootPath = "";
            if (bean.getClass().isAnnotationPresent(BibaboRequestMapping.class)) {
                BibaboRequestMapping requestMapping = bean.getClass().getAnnotation(BibaboRequestMapping.class);
                rootPath = requestMapping.value();
            }

            for (Method method : bean.getClass().getMethods()) {
                if (method.isAnnotationPresent(BibaboRequestMapping.class)) {
                    BibaboRequestMapping requestMapping = method.getAnnotation(BibaboRequestMapping.class);
                    String path = ("/" + rootPath + "/" + requestMapping.value()).replaceAll("/+", "/");
                    handlerMappingMap.put(path, method);
                }
            }
        }
    }

    private void doAutowired() {
        if (iocMap.isEmpty()) {
            return;
        }
        for (Iterator<Map.Entry<String, Object>> iterator = iocMap.entrySet().iterator(); iterator.hasNext(); ) {
            Map.Entry<String, Object> entry = iterator.next();
            Object bean = entry.getValue();
            for (Field field : bean.getClass().getDeclaredFields()) {
                if (!field.isAnnotationPresent(BibaboAutowired.class)) {
                    continue;
                }
                BibaboAutowired autowired = field.getAnnotation(BibaboAutowired.class);
                String beanName = autowired.value().trim();
                if ("".equals(beanName)) {
                    beanName = field.getType().getName();
                }
                Object setValue = iocMap.get(beanName);
                Optional.of(setValue).ifPresent(o -> {
                    field.setAccessible(true);
                    try {
                        field.set(bean, setValue);
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    }
                });
            }
        }
    }

    private void doInitializeContainer() {
        // 初始化IOC容器
        if (classNameList.isEmpty()) {
            return;
        }
        classNameList.forEach(className -> {
            try {
                Class<?> clazz = Class.forName(className);
                if (clazz.isInterface()) {
                    return;
                }
                Object obj = clazz.newInstance();
                String beanName = toFirstLetterlowerCase(clazz.getSimpleName());
                iocMap.put(beanName, obj);

                for (Class<?> c : clazz.getInterfaces()) {
                    if (iocMap.containsKey(c.getName())) {
                        throw new RuntimeException("interface：" + c.getName() + "has already exists bean");
                    }
                    iocMap.put(c.getName(), obj);
                }
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
