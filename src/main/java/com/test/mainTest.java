package com.test;

import java.util.ArrayList;
import java.util.List;

public class mainTest {
    public static void main(String[] args) {
//        List<String> myList = new ArrayList<>();
//        myList.add("A");
//        myList.add("B");
//        myList.add("C");
//
//        List<String> elementsToAdd = new ArrayList<>();
//        elementsToAdd.add("D");
//        elementsToAdd.add("E");
//        elementsToAdd.add("F");
//
//        for (String element : elementsToAdd) {
//            if (!myList.contains(element)) {
//                myList.add(element);
//            }
//        }

        int a = 6;
        int b = 1;
        int c = 5;

        System.out.println((b|a)==1);
        System.out.println(b==(1|6));
        System.out.println(c==(1|6));
    }
}
