package com.korea.team;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.MyCommon;

@Controller
public class KakaoPayController {
	
	//카카오 페이 임시.
	@RequestMapping("paysuccess")
	public String paysuccess() {
		System.out.println("paytest");
		return MyCommon.VIEW_PATH + "pay/paysuccess.jsp";
	}
	
	@RequestMapping("payfail_cancel")
	public String payfail_cancel() {
		System.out.println("paytest");
		return MyCommon.VIEW_PATH + "pay/payfail_cancel.jsp";
	}
	
	@RequestMapping("kakaopay")
	@ResponseBody
	public String kakaopay() {
		try {
			URL addr = new URL("https://open-api.kakaopay.com/online/v1/payment/ready"); //https://open-api.kakaopay.com/online/v1/payment/ready
			HttpURLConnection con = (HttpURLConnection)addr.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("Authorization", "DEV_SECRET_KEY DEV7C3A1B85BB3D5B24408D682125333D6174128");
			
			con.setDoOutput(true);
			con.setDoInput(true);
			
			
			//String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=호텔 객실&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:9090/team/paysuccess$fail_url=http://localhost:9090/team/payfail_cancel&cancel_url=http://localhost:9090/team/payfail_cancel";
			String parameter = "{\"cid\":\"TC0ONETIME\","
					+ "\"partner_order_id\":\"partner_order_id\","
					+ "\"partner_user_id\":\"partner_user_id\","
					+ "\"item_name\":\"APPLE\","
					+ "\"quantity\":\"1\","
					+ "\"total_amount\":\"80000\","
					+ "\"tax_free_amount\":\"0\","
					+ "\"approval_url\":\"http://localhost:9090/team/paysuccess\","
					+ "\"fail_url\":\"http://localhost:9090/team/payfail_cancel\","
					+ "\"cancel_url\":\"http://localhost:9090/team/payfail_cancel\"}";
			
			OutputStream os = con.getOutputStream();
			os.write(parameter.getBytes());
			os.flush();
			os.close();
			
			int res = con.getResponseCode();
			System.out.println("res : " + res);
			InputStream rec;
			if(res==200) {
				System.out.println("success");
				rec = con.getInputStream();
			} else {
				System.out.println("error");
				rec = con.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(rec);
			BufferedReader change = new BufferedReader(reader);
			//System.out.println(change.readLine()); readLine 한 번 하고난 후 또 하면 null
			return change.readLine(); //위에서 한번 읽으면 여기서 못읽음
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}	catch (IOException e) {
			e.printStackTrace();
		}
		return null;//MyCommon.VIEW_PATH + "business/pay.jsp";
	}
}
