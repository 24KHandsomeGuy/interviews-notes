package com.bibabo.GOF23.proxyWrapper.wrapper;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 16:03
 * @description
 */
public class IOTest {


    public static void main(String[] args) throws IOException {
        Reader reader = new FileReader("E://1.txt");
        System.out.println(reader.read());
        System.out.println(reader.read());
        BufferedReader bufferedReader = new BufferedReader(reader);
        //System.out.println(bufferedReader.readLine());
        //System.out.println(bufferedReader.read());


    }

}
