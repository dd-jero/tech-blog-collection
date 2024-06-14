package com.amur.notice.model.mapper;

import com.amur.notice.model.NoticeDto;
import java.util.*;
import java.sql.SQLException;

public interface NoticeMapper {

    void writeNotice(NoticeDto noticeDto) throws SQLException;
    List<NoticeDto> listNotice(Map<String, Object> map) throws SQLException;
    int getTotalNoticeCount(Map<String, Object> map) throws SQLException;
    NoticeDto getNotice(int noticeId) throws SQLException;
    void updateHit(int noticeNo) throws SQLException;
    void modifyNotice(NoticeDto noticeDto) throws SQLException;
    void deleteNotice(int noticeId) throws SQLException;

}
