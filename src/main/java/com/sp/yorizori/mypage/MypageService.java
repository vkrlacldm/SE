package com.sp.yorizori.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public void insertFollow(Map<String, Object> map) throws Exception;
	public void deleteFollow(Map<String, Object> map) throws Exception;
	public boolean searchFollow(Map<String, Object> map);
	
	public Mypage readMypage(Map<String, Object> map);
	public List<Mypage> listFollower(String userId);
	public List<Mypage> listFollowing(String userId);
	
	public int dataCountMyrecipe(String userId);
	public List<Mypage> listMyrecipe(Map<String, Object> map);
	
	public int dataCountLike(String userId);
	public List<Mypage> listLike(Map<String, Object> map);
	
	public int dataCountWish(String userId);
	public List<Mypage> listWish(Map<String, Object> map);
	
	public int dataCountFavorite(String userId);
	public List<Mypage> listFavorite(Map<String, Object> map);
	
	public int dataCountContest(String userId);
	public List<MyEvent> listContest(Map<String, Object> map);
	
	public int dataCountUsable(String userId);
	public List<MyEvent> listUsable(Map<String, Object> map);
	public int dataCountUseless(String userId);
	public List<MyEvent> listUseless(Map<String, Object> map);
	
	public int dataCountQna(String userId);
	public List<MyQna> listQna(Map<String, Object> map);
	public boolean answerState(int num);
	
	public int dataCountOrder(String userId);
	public List<MyClass> listOrder(Map<String, Object> map);
	
	public void insertReview(MyClass dto) throws Exception;
	
	public int dataCountRefund(String userId);
	public List<MyClass> listRefund(Map<String, Object> map);
	
	public int dataCountSell(String userId);
	public List<MyClass> listSell(Map<String, Object> map);
}
