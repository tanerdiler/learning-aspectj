package com.tanerdiler.aspectj.logging;

import static java.lang.String.format;

import org.aspectj.lang.JoinPoint.StaticPart;
import org.aspectj.lang.Signature;

public aspect MethodExecutionTimeLoggerAspect {
	
	private long criticalTime = 1 * 100;

	pointcut runTrace() : execution(public * *.*(..));

	Object around() : runTrace() {
		long startTime = System.currentTimeMillis();
		
		Object ret = proceed();
		
		long endTime = System.currentTimeMillis();
		long executionTime = endTime - startTime;
		
		logIfCritical(thisJoinPointStaticPart, executionTime);

		return ret;
	}

	private void logIfCritical(StaticPart staticPart, long executionTime) {
		if (executionTime > criticalTime) {
			Signature signature = staticPart.getSignature();
			System.out.println(format("%s.%s took %d ms",
					signature.getDeclaringTypeName(),
					signature.getName(), executionTime));
		}
	}

}