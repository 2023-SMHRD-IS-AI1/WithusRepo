package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Following;
import kr.smhrd.entity.Member;
import lombok.NonNull;

@Mapper
public interface FollowMapper {
	
	// 팔로우 추가하기
	void insertFollowing(Following following);
	
	// 팔로우 상태 변경하기
	String toggleFollow(Following following);
	
	// 팔로우 상태 확인하기
	boolean checkFollowing(Following following);
	
	// 팔로우 취소하기
	void deleteFollowing(Following following);
	
	// 팔로우 목록 가져오기
	@Select("SELECT * FROM following WHERE follower = #{userId}")
    List<Member> getFollowers(String userId);
	
	// 팔로잉 목록 가져오기
    @Select("SELECT * FROM following WHERE followee = #{userId}")
    List<Member> getFollowings(String userId);

	

	

	

}
