package com.tanerdiler.aspectj.deneme;

public class Counter {
	public void count () {
		for (int i=0; i<100; i++) {
			try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main (String[] args) {
		new Counter().count();
	}
}
