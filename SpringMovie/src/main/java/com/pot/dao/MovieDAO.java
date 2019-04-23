package com.pot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pot.dto.JoinVO;
import com.pot.dto.MovieVO;

public interface MovieDAO {

	// 관리자 영화 리스트
	@Select("select s.cinemaname,s.moviename,t.screencode,t.startdate,t.starttime,t.endtime,t.showingcode from SHOWING s,TIME t where s.showingcode=t.showingcode")
	public List<JoinVO> adminMovieList();
	
	// 영화 삭제 리스트
	@Select("select s.cinemaname,s.moviename,t.screencode,t.startdate,t.starttime,t.endtime,t.showingcode from SHOWING s,TIME t where s.showingcode=t.showingcode and t.showingcode=#{showingcode}")
	public List<JoinVO> movieDeleteSearch(String showingcode);
	
	// 영화삭제 
	@Delete("delete from TIME where showingcode=#{showingcode}")
	public void timeDelete(String showingcode);
	
	@Delete("delete from SHOWING where showingcode=#{showingcode}")
	public void showingDelete(String showingcode);
	
	// 영화 검색
	@Select("select moviename from MOVIE where moviename=#{moviename}")
	public String movieSearch(String moviename);

	// 영화관 등록
	@Insert("insert into MOVIE values(#{moviename},#{genre},#{opendate},#{runningtime},#{grade},#{director},#{actor},#{content},#{oldname},#{newname},#{url})")
	public int movieInsert(MovieVO movieVO);

	// 영화 리스트
	@Select("select moviename from MOVIE order by opendate desc")
	public List<MovieVO> movieList();

	// 영화 전체 리스트
	@Select("select * from MOVIE order by opendate desc")
	public List<MovieVO> getMovieList();

	// 한개의 영화정보
	@Select("select * from MOVIE where moviename=#{moviename}")
	public MovieVO getMovie(String moviename);

}
