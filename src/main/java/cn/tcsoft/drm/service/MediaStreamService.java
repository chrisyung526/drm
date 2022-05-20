package cn.tcsoft.drm.service;

import org.springframework.http.ResponseEntity;

import java.util.Map;

public interface MediaStreamService {
    String getDecrypt(String identifier,String streamToken);

    ResponseEntity<?> playlist(String identifier, String listName, String streamToken);

    ResponseEntity<?> codeRateSwitch(String identifier, String rate, String listName, String streamToken);

    ResponseEntity<?> codeRateSwitch(String identifier,String live, String rate, String listName, String streamToken);

    Map generalToken();

    Boolean isExpire(String streamToken);
}
