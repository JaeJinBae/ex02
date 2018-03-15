package com.dgit.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.dgit.controller.HomeController;

@Component
@Aspect
public class SampleAdvice {
	private static final Logger logger=LoggerFactory.getLogger(HomeController.class);
	
	//@Before("execution(* com.dgit.service.MessageServiceImpl.*(..))")
	public void startLog(JoinPoint jp){
		logger.info("=========================================");
		logger.info("=========================================");
		logger.info("=========================================");
		logger.info("=========================================");
		logger.info("=========================================");
		logger.info("[[startLog]]");
		logger.info("arg: "+jp.getArgs());
		logger.info(Arrays.toString(jp.getArgs()));
		logger.info("=========================================");
		logger.info("=========================================");
		logger.info("==================================================================================");
		logger.info("=========================================");
	}
	
	@Around("execution(* com.dgit.service.MessageServiceImpl.*(..))")
	public Object timeLog(ProceedingJoinPoint jp) throws Throwable{
		//시작
		long startTime=System.currentTimeMillis();
		logger.info("==================================================================================");
		logger.info("[timeLog] START - "+startTime);
		logger.info(jp.getSignature().getName());
		logger.info(Arrays.toString(jp.getArgs()));
		logger.info("==================================================================================");
		Object result= jp.proceed(); //proxy 객체를 통해 target 메소드를 실행해준다.
		
		//끝
		long endTime=System.currentTimeMillis();
		logger.info("==================================================================================");
		logger.info("[timeLog] END - "+endTime);
		long time= endTime-startTime;
		logger.info("time: "+time);
		logger.info("==================================================================================");
		
		return result;
	}
	
}
