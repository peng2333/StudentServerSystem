package com.sss.bean;

import java.util.Arrays;

public class Result {
    private int[] localArray;
    private int prob;

    @Override
    public String toString() {
        return "Result{" +
                "localArray=" + Arrays.toString(localArray) +
                ", prob=" + prob +
                '}';
    }

    public Result() {
    }

    public Result(int[] localArray, int prob) {

        this.localArray = localArray;
        this.prob = prob;
    }

    public int[] getLocalArray() {

        return localArray;
    }

    public void setLocalArray(int[] localArray) {
        this.localArray = localArray;
    }

    public int getProb() {
        return prob;
    }

    public void setProb(int prob) {
        this.prob = prob;
    }
}
