package com.kh.finalProject.common.encrypt;

import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Map;

import javax.crypto.Cipher;

import org.springframework.stereotype.Component;
@Component
public class RSAEncrypto implements MyEncrypt {

	//양방향 암호화
	private PublicKey publicKey;
	private PrivateKey privateKey;
	
	public RSAEncrypto() {
		String path = this.getClass().getResource("/").getPath();
		path = path.substring(0, path.lastIndexOf("/target"));
		File f = new File(path + "src/main/webapp/WEB-INF/keys.hd");
		if(f.exists()) {
			try(ObjectInputStream ois = new ObjectInputStream(new FileInputStream(f))) {
				Map<String, Object> keys = (Map)ois.readObject();
				publicKey = (PublicKey)keys.get("public");
				privateKey = (PrivateKey)keys.get("private");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			if(publicKey == null || privateKey == null) {
				try {
					getKey();
				} catch(NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
			}
		}
	}

	private void getKey() throws NoSuchAlgorithmException {
		SecureRandom ser = new SecureRandom();
		KeyPairGenerator keygen;
		keygen = KeyPairGenerator.getInstance("RSA");
		keygen.initialize(2048,ser);
		KeyPair keypair = keygen.generateKeyPair();
		publicKey = keypair.getPublic();
		privateKey = keypair.getPrivate();
	}
	
	
	@Override
	public String encrypt(String msg) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE,  publicKey);
		byte[] encrypt = cipher.doFinal(msg.getBytes());
		return Base64.getEncoder().encodeToString(encrypt);
	}

	@Override
	public String decrypt(String msg) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] enc = Base64.getDecoder().decode(msg.getBytes());
		byte[] decrypt = cipher.doFinal(enc);
		return new String(decrypt,"UTF-8");
	}

	
	
	
	
}
