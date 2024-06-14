package com.amur.notice.controller;

import com.amur.community.model.CommunityDto;
import com.amur.community.model.CommunityListDto;
import com.amur.notice.model.NoticeDto;
import com.amur.notice.model.NoticeListDto;
import com.amur.notice.model.service.NoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.RouteMatcher;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Map;

@RequestMapping("/notice")
@Slf4j
@RestController
@CrossOrigin("*")

public class NoticeController {

    private NoticeService noticeService;

    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    @PostMapping
    public ResponseEntity<?> writeNotice(@RequestBody NoticeDto noticeDto){
        try {
            noticeService.writeNotice(noticeDto);
            System.out.println("공지사항 작성");
            return new ResponseEntity<Void>(HttpStatus.CREATED);
        }
        catch (Exception e){
            return exceptionHandling(e);
        }
    }

    @GetMapping
    public ResponseEntity<?> listNotice(@RequestParam Map<String, String> map){
        try{
            NoticeListDto noticeListDto = noticeService.listNotice(map);
            log.info("공지사항 불러오기");
            HttpHeaders header = new HttpHeaders();
            header.setContentType(new MediaType("application", "json", StandardCharsets.UTF_8));
            return ResponseEntity.ok().headers(header).body(noticeListDto);
        }catch (Exception e){
            return exceptionHandling(e);
        }
    }

    private ResponseEntity<String> exceptionHandling(Exception e)
    {
        e.printStackTrace();
        return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
