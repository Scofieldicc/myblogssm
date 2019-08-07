package com.qf.myblogssm.temp;

import org.apache.shiro.crypto.hash.Md5Hash;

public class Test {
    public static void main(String[] args) {
        //一个参数表示 简单散列（不安全）  加盐(一般使用当前用户的用户名)       散列次数
        Md5Hash md5Hash = new Md5Hash("123","lonely",1000);
        System.out.println(md5Hash.toString());

    }
}
