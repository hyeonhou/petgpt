package com.mc.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
    private int boardKey;
    private int itemKey;
    private String custId;
    private String boardTitle;
    private String boardContent;
    private String boardImg;
    private String boardOption;
    private Date boardRdate;
    private Date boardUpdate;
}