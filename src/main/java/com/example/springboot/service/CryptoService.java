package com.example.springboot.service;

public interface CryptoService {

    String encrypt(String keyId,String text);
    String decrypt(String keyId, String encryptedText);
}