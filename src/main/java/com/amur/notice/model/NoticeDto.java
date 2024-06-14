package com.amur.notice.model;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class NoticeDto {
    private int noticeNo;
    private String userId;
    private String title;
    private String content;
    private int hit;
    private String registerTime;

}
