package com.mc.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comments {
    private int commentsKey;
    private int pboardKey;
    private String commentsContent;
    private LocalDateTime commentsRdate;
    private LocalDateTime commentsUpdate;

    private String custId;
    private String custName;
    private String custProfileImgUrl;
    private int likeCount;
    private boolean likedByCurrentUser;

    private Integer parentCommentKey;
    private int depth; 
    private String parentCustId;

    public void increaseLikeCount() {
        this.likeCount++;
    }

    public void decreaseLikeCount() {
        if (this.likeCount > 0) {
            this.likeCount--;
        }
    }
}
