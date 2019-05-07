package com.husky.shopapp;

import com.husky.shopapp.util.OrderUtil;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.stream.IntStream;

/**
 * @author husky
 * @date 2019/5/7 17:26
 */
public class OrderIdTest {
    private static int  count = 0;
    private static final Object monitor = new Object();

    public static void main(String[] args) {
        Set<String> set = new HashSet<>();
        List<Thread> threadList = new LinkedList<>();
        long start = System.nanoTime();
        IntStream.rangeClosed(1,100).forEach(i->{
            Thread t = new Thread(String.valueOf(i)){
                @Override
                public void run() {
                    for(int n=0;n<100;n++){
                        synchronized (monitor) {
                            if (!set.add(OrderUtil.getOrderId())) {
                                System.out.println("重复");
                            } else {
                                System.out.println("成功");

                                count++;

                            }
                        }

                    }
                }
            };
            threadList.add(t);
            t.start();
        });
        threadList.forEach(t-> {
            try {
                t.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
        long last = System.nanoTime();
        System.out.println("持续时长: "+(last-start)/(1000*1000)+"ms");
        System.out.println("生成:"+set.size());

    }
}
