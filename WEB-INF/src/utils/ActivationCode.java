package utils;

import java.util.Random;

public class ActivationCode{
	public static long generateActivationCode(){
		Random random = new Random();
		long activationCode = random.nextLong();
		if(activationCode<0)
			activationCode *= -1;
		return activationCode;
	}
}