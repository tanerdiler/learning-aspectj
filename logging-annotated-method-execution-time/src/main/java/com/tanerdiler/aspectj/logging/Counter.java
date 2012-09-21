package com.tanerdiler.aspectj.logging;

public class Counter {
	
	@Critical(time="5")
	public void count () {
		for (int i=0; i<1000; i++) {
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
