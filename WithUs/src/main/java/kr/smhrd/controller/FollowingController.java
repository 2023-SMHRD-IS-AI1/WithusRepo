package kr.smhrd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.entity.Following;
import kr.smhrd.entity.Member;
import kr.smhrd.mapper.FollowMapper;
@RestController
public class FollowingController {
	
	@Autowired
    private FollowMapper followMapper;
	
//	@PostMapping("/goFollow")
//	public ResponseEntity<String> insertFollowing(@RequestBody Following following) {
//		System.out.println(following);
//	    try {
//	        followMapper.insertFollowing(following);
//	        return ResponseEntity.ok("Success");
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error");
//	    }
//	}
	
	@PostMapping("/goFollow")
	public ResponseEntity<String> toggleFollow(@RequestBody Following following) {
	    try {
	        // 여기서는 팔로우 상태를 확인하고 적절한 액션을 취하는 로직이 필요합니다.
	        // 예를 들어, 팔로우가 이미 있으면 삭제하고, 없으면 추가합니다.
	        boolean isFollowed = followMapper.checkFollowing(following);
	        if (isFollowed) {
	            followMapper.deleteFollowing(following);
	            return ResponseEntity.ok("unfollowed"); // 팔로우 취소 상태
	        } else {
	            followMapper.insertFollowing(following);
	            return ResponseEntity.ok("followed"); // 팔로우 상태
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error");
	    }
	}
	
    @GetMapping("getFollowers/{userId}")
    public Map<String, Object> getFollowers(@PathVariable String userId) {
        List<Member> followers = followMapper.getFollowers(userId);
        Map<String, Object> response = new HashMap<>();
        response.put("count", followers.size());
        // response.put("followers", followers);
        
        return response;
    }

    @GetMapping("getFollowings/{userId}")
    public Map<String, Object> getFollowings(@PathVariable String userId) {
        List<Member> followings = followMapper.getFollowings(userId);
        Map<String, Object> response = new HashMap<>();
        response.put("count", followings.size());
        // response.put("followings", followings);

        return response;
    }
	
	
}
