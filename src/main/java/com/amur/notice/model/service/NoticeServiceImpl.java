package com.amur.notice.model.service;

import com.amur.notice.model.NoticeDto;
import com.amur.notice.model.NoticeListDto;
import com.amur.notice.model.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService {


    private NoticeMapper noticeMapper;

    @Autowired
    private NoticeServiceImpl(NoticeMapper noticeMapper){
        super();
        this.noticeMapper = noticeMapper;
    }
    @Override
    public void writeNotice(NoticeDto noticeDto) throws Exception {

    }

    @Override
    public NoticeListDto listNotice(Map<String, String> map) throws Exception {

        Map<String, Object> param = new HashMap<String, Object>();
        param.put("word", map.get("word") == null ? "" : map.get("word"));
        int currentPage = Integer.parseInt(map.get("pgno") == null ? "1" : map.get("pgno"));
        int sizePerPage = Integer.parseInt(map.get("spp") == null ? "20" : map.get("spp"));
        int start = currentPage * sizePerPage - sizePerPage;
        param.put("start", start);
        param.put("listsize", sizePerPage);

        String key = map.get("key");
        param.put("key", key == null ? "" : key);
        if ("member_id".equals(key))
            param.put("key", key == null ? "" : "b.member_id");
        List<NoticeDto> list = noticeMapper.listNotice(param);

        if ("member_id".equals(key))
            param.put("key", key == null ? "" : "member_id");
//		int totalArticleCount = boardMapper.getTotalArticleCount(param);
//		int totalPageCount = (totalArticleCount - 1) / sizePerPage + 1;

        NoticeListDto noticeListDto = new NoticeListDto();
        noticeListDto.setNotices(list);
        noticeListDto.setCurrentPage(currentPage);
//		boardListDto.setTotalPageCount(totalPageCount);

        return noticeListDto;
    }

    @Override
    public NoticeDto getNotice(int noticeNo) {
        return null;
    }

    @Override
    public void updateHit(int noticeNo) throws Exception {

    }

    @Override
    public void modifyNotice(NoticeDto noticeDto) throws Exception {

    }

    @Override
    public void deleteNotice(int noticeNo) throws Exception {

    }
}
