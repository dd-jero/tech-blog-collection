package com.amur.notice.model.service;

import com.amur.notice.model.NoticeDto;
import com.amur.notice.model.NoticeListDto;

import java.util.Map;

public interface NoticeService {

    void writeNotice(NoticeDto noticeDto) throws Exception;
    NoticeListDto listNotice(Map<String, String> map) throws Exception;
    NoticeDto getNotice(int noticeNo);
    void updateHit(int noticeNo) throws Exception;
    void modifyNotice(NoticeDto noticeDto) throws Exception;
    void deleteNotice(int noticeNo) throws Exception;

}
