package kr.smhrd.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
public class Following {

    private Long following_idx;
    @NonNull
    private String follower;
    @NonNull
    private String followee;
    private LocalDateTime created_at;

}
