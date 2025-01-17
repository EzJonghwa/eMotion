package com.eMotion.team.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.eMotion.team.member.dao.IMemberDAO;
import com.eMotion.team.member.vo.MemberVO;
import com.eMotion.team.preperCar.vo.PreperCarVO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	IMemberDAO dao;

	@Override
	public int registMember(MemberVO vo) throws Exception {

		int result = dao.registMember(vo);

		if (result == 0) {
			throw new Exception();
		}

		return result;
	}

	@Override
	public MemberVO loginMember(MemberVO vo) throws Exception {

		MemberVO user = dao.loginMember(vo);

		if (user == null) {
			throw new Exception();
		}

		return user;
	}

	@Override
	public String kakaoGetAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=d304b0d6951e3b4f130b2898ef0e1acd"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/kakaologin"); // 본인이 설정한 주소

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	@Override
	public HashMap<String, Object> kakaoGetUserInfo(String access_Token) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickName = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("nickName", nickName);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	@Override
	public int kakaoRegistMember(MemberVO vo) throws Exception {

		int result = dao.kakaoRegistMember(vo);

		if (result == 0) {
			throw new Exception();
		}

		return result;
	}

	@Override
	public MemberVO kakaoLoginMember(MemberVO vo) throws Exception {

		MemberVO user = dao.kakaoLoginMember(vo);

		if (user == null) {
			throw new Exception("해당 이메일의 계정이 존재하지 않습니다");
		}

		return user;
	}

	@Override
	public int emailCheck(String email) {
		int cnt = dao.emailCheck(email);
		return cnt;
	}

	// 자동 로그인
	@Override
	public void updateAutoLoginToken(MemberVO vo) {
	    dao.updateAutoLoginToken(vo);
	}

	// 자동 로그인
	@Override
	public MemberVO findByAutoLoginToken(String autoLoginToken) {
		
		System.out.println("서비스 토큰:" + autoLoginToken);
		
		return dao.findByAutoLoginToken(autoLoginToken);
	}
	
	// 회원 탈퇴
	@Override
	public void memExit(String email){
		dao.memExit(email);
	};
	
	// 회원 수정
	@Override
	public void memUpdate(MemberVO vo){
		dao.memUpdate(vo);
	};

	//이미지 업로드
	@Override
	public String profileUpload(MemberVO vo, String uploadDir, String webPath, MultipartFile file) throws Exception {

		// 파일명 생성
		String origin = file.getOriginalFilename();
		String uniqe = UUID.randomUUID().toString() + "_" + origin;
		String dbPath = webPath + uniqe;
		Path filePath = Paths.get(uploadDir, uniqe); 
		
		System.out.println("dbPath" + dbPath);
		System.out.println("filePath" + filePath);
		
		// 물리적으로 저장
		try {
			Files.copy(file.getInputStream(), filePath);
		} catch (IOException e) {
			throw new Exception("file to save the file", e);
		}
		
		// 물리적 저장 경로를 db 저장
		vo.setProfileImg(dbPath);
		int result = dao.profileUpload(vo);
		if(result == 0) {
			throw new Exception();
		}
		
		return dbPath;
	}

	

}
