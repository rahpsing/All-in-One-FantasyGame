package com.allinone.controllers;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allinone.dao.impl.Base64;
import com.allinone.dao.impl.DuoWebException;
import com.allinone.dao.impl.Util;
import com.allinone.pojos.User;
import com.allinone.service.api.UserRegistrationServiceAPI;

@Controller
public final class DuoWeb {
	
	@Autowired
	UserRegistrationServiceAPI objUserRegistrationService;
	
	private static final String DUO_PREFIX = "TX";
	private static final String APP_PREFIX = "APP";
	private static final String AUTH_PREFIX = "AUTH";

	private static final int DUO_EXPIRE = 300;
	private static final int APP_EXPIRE = 3600;

	private static final int IKEY_LEN = 20;
	private static final int SKEY_LEN = 40;
	private static final int AKEY_LEN = 40;

	public static final String ERR_USER = "ERR|The username passed to sign_request() is invalid.";
	public static final String ERR_IKEY = "ERR|The Duo integration key passed to sign_request() is invalid.";
	public static final String ERR_SKEY = "ERR|The Duo secret key passed to sign_request() is invalid.";
	public static final String ERR_AKEY = "ERR|The application secret key passed to sign_request() must be at least " + AKEY_LEN + " characters.";
	public static final String ERR_UNKNOWN = "ERR|An unknown error has occurred.";
	
	public static final String iKeyP="DIL0DP43CKA5117T4JXI";
	public static final String sKeyP="oMuM2RPd4xWx3Ryxp1gntfAD8n6tCWwFFo0FkiqZ";
	public static final String aKeyP="d2cc728eb7502c72af0fe0e4bc768ea80a4eaac0";

	
	@RequestMapping(value = "/duoSignRequest")
	@ResponseBody
	public String duoSignRequest(HttpServletRequest objRequest) {
		String userName = objRequest.getParameter("username");
		System.out.println("Came here to sign request by prash");
		String returnString=signRequest(iKeyP, sKeyP, aKeyP, userName);
		System.out.println(returnString);
		return returnString;
	}
	public static String signRequest(final String ikey, final String skey, final String akey, final String username) {
		return signRequest(ikey, skey, akey, username, System.currentTimeMillis() / 1000);
	}
	
	@RequestMapping(value="/duoSignResponse")
	
	public String duoSignResponse(HttpServletRequest objRequest,ModelMap model) {
		String signResponse=objRequest.getParameter("sig_response");
		System.out.println("Came here with response to duosign response.Next calling verify Response  " + objRequest.getParameter("sig_response"));
		String returnString;
		try {
			returnString = verifyResponse(iKeyP, sKeyP, aKeyP, signResponse);
			if(!returnString.equalsIgnoreCase("invalid")) {
			User temp = objUserRegistrationService.pullUser(returnString);
			if (temp!= null) {
			model.put("name", temp.getUserName());
			model.put("emailId", temp.getEmailAddress());
			model.put("userId", temp.getUserId());
			//System.out.println(temp.getEmailAddress()+"EmailID of user");
			if(temp.getFirstName() != null)
			{
				
				model.put("firstName",temp.getFirstName());
			}
			else {
				model.put("firstName","First Name");
			}
			
			if(temp.getLastName()  != null)
			{
				model.put("lastName",temp.getLastName());
				
			}
			else {
				model.put("lastName","Last Name");
			}
			if(temp.getPhoneNumber() != null)
			{
				model.put("phoneNumber",temp.getPhoneNumber());
			}
			else {
				
				model.put("phoneNumber","Phone Number");
			}
			
			//model.put("phone", temp.getPhoneNumber());
			return "UserDashboard";
		}
			}
		
			return "redirect:" + "http://localhost:8080/All-In-One-FantasyGame/LandingPage1.jsp";
		}
			catch (InvalidKeyException | NoSuchAlgorithmException | DuoWebException | IOException e) {
			// TODO Auto-generated catch block
				return "Please contact System Administrator";
		}
		
	}

	public static String signRequest(final String ikey, final String skey, final String akey, final String username, final long time) {
		final String duo_sig;
		final String app_sig;

		if (username.equals("")) {
			return ERR_USER;
		}
		if (username.indexOf('|') != -1) {
			return ERR_USER;
		}
		if (ikey.equals("") || ikey.length() != IKEY_LEN) {
			return ERR_IKEY;
		}
		if (skey.equals("") || skey.length() != SKEY_LEN) {
			return ERR_SKEY;
		}
		if (akey.equals("") || akey.length() < AKEY_LEN) {
			return ERR_AKEY;
		}

		try {
			duo_sig = signVals(skey, username, ikey, DUO_PREFIX, DUO_EXPIRE, time);
			app_sig = signVals(akey, username, ikey, APP_PREFIX, APP_EXPIRE, time);
		} catch (Exception e) {
			return ERR_UNKNOWN;
		}

		return duo_sig + ":" + app_sig;
	}

	public static String verifyResponse(final String ikey, final String skey, final String akey, final String sig_response)
		throws DuoWebException, NoSuchAlgorithmException, InvalidKeyException, IOException {
		return verifyResponse(ikey, skey, akey, sig_response, System.currentTimeMillis() / 1000);
	}

	public static String verifyResponse(final String ikey, final String skey, final String akey, final String sig_response, final long time)
		throws DuoWebException, NoSuchAlgorithmException, InvalidKeyException, IOException {
		String auth_user = null;
		String app_user = null;

		final String[] sigs = sig_response.split(":");
		final String auth_sig = sigs[0];
		final String app_sig = sigs[1];
		System.out.println(app_sig);
		System.out.println("jiji");
		auth_user = parseVals(skey, auth_sig, AUTH_PREFIX, ikey, time);
		app_user = parseVals(akey, app_sig, APP_PREFIX, ikey, time);

		if (!auth_user.equals(app_user)) {
			throw new DuoWebException("Authentication failed.");
		}

		return auth_user;
	}

	private static String signVals(final String key, final String username, final String ikey, final String prefix, final int expire, final long time) 
		throws InvalidKeyException, NoSuchAlgorithmException {
		final long expire_ts = time + expire;
		final String exp = Long.toString(expire_ts);

		final String val = username + "|" + ikey + "|" + exp;
		final String cookie = prefix + "|" + Base64.encodeBytes(val.getBytes());
		final String sig = Util.hmacSign(key, cookie);

		return cookie + "|" + sig;
	}

	private static String parseVals(final String key, final String val, final String prefix, final String ikey, final long time)
		throws InvalidKeyException, NoSuchAlgorithmException, IOException, DuoWebException {

		final String[] parts = val.split("\\|");
		if (parts.length != 3) {
			throw new DuoWebException("Invalid response");
		}

		final String u_prefix = parts[0];
		final String u_b64 = parts[1];
		final String u_sig = parts[2];

		final String sig = Util.hmacSign(key, u_prefix + "|" + u_b64);
		if (!Util.hmacSign(key, sig).equals(Util.hmacSign(key, u_sig))) {
			throw new DuoWebException("Invalid response");
		}

		if (!u_prefix.equals(prefix)) {
			throw new DuoWebException("Invalid response");
		}

		final byte[] decoded = Base64.decode(u_b64);
		final String cookie = new String(decoded);

		final String[] cookie_parts = cookie.split("\\|");
		if (cookie_parts.length != 3) {
			throw new DuoWebException("Invalid response");
		}
		final String username = cookie_parts[0];
		final String u_ikey = cookie_parts[1];
		final String expire = cookie_parts[2];

		if (!u_ikey.equals(ikey)) {
			throw new DuoWebException("Invalid response");
		}

		final long expire_ts = Long.parseLong(expire);
		if (time >= expire_ts) {
			throw new DuoWebException("Transaction has expired. Please check that the system time is correct.");
		}

		return username;
	}
}
