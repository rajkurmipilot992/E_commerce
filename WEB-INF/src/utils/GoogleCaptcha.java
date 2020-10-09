package utils;
import java.io.*;
import java.net.*;
import javax.json.Json;
import javax.json.JsonReader;
import javax.json.JsonObject;

public class GoogleCaptcha{
	public static boolean checkRecaptcha(String captchaResp) throws IOException{
        
        String reCaptchaURL = "https://www.google.com/recaptcha/api/siteverify";
        String reCaptchaparameters = "secret=6Lea-dMZAAAAAF-aT647x4yL5z2oJI1_QLmMGghV" + "&response="+captchaResp;
        URL url = new URL(reCaptchaURL+"?"+reCaptchaparameters);
        HttpURLConnection con = (HttpURLConnection)url.openConnection(); 
        con.setRequestMethod("POST");
        con.setDoOutput(true);
        DataOutputStream d = new DataOutputStream(con.getOutputStream());
		d.flush();
        d.close();
        
        InputStream inputStream;
		int status = con.getResponseCode();
		if (status != HttpURLConnection.HTTP_OK)  {
			inputStream = con.getErrorStream();
		}
		else  {
			inputStream = con.getInputStream();
        }
        JsonReader jReader = Json.createReader(inputStream);	
		JsonObject jObject = jReader.readObject();
		boolean flag = jObject.getBoolean("success");

		return flag;
    }
}