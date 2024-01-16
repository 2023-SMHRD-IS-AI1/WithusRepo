package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Following;
import kr.smhrd.entity.Member;
import lombok.NonNull;

@Mapper
public interface FollowMapper {

	void insertFollowing(Following following);

	String toggleFollow(Following following);

	boolean checkFollowing(Following following);

	void deleteFollowing(Following following);



	@Select("SELECT * FROM following WHERE follower = #{userId}")
    List<Member> getFollowers(String userId);

    @Select("SELECT * FROM following WHERE followee = #{userId}")
    List<Member> getFollowings(String userId);

	

	

	

}
