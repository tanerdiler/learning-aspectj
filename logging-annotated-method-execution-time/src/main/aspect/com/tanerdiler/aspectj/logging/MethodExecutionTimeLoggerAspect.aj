package com.tanerdiler.aspectj.logging;

import static java.lang.String.format;

import org.aspectj.lang.JoinPoint.StaticPart;
import org.aspectj.lang.Signature;

public aspect MethodExecutionTimeLoggerAspect {
	
	// Annotation value must be an enum or string, If u want to get directly
	// you must send annotation value to proceed
	pointcut runTrace(String time) : execution(@Critical * * (..)) && @annotation(Critical(time));

	Object around(String time) : runTrace(time) {
		
		long startTime = System.currentTimeMillis();

		Object ret = proceed(time);

		long endTime = System.currentTimeMillis();
		long executionTime = endTime - startTime;

		logIfCritical(thisJoinPointStaticPart, executionTime, time);

		return ret;
	}

	@SuppressWarnings("unused")
	private void logIfCritical(StaticPart staticPart, long executionTime,
			String criticalTime) {
		
		if (executionTime > Integer.parseInt(criticalTime)) {
			
			Signature signature = staticPart.getSignature();
			System.out.println(format("%s.%s took %d ms",
					signature.getDeclaringTypeName(), signature.getName(),
					executionTime));
		}
	}

}