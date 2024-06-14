package com.amur.notice.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import java.util.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class NoticeListDto {

    private List<NoticeDto> notices;
    private int currentPage;
    private int totalPageCount;

}
