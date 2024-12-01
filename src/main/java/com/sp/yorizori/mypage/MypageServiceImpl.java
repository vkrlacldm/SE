package com.sp.yorizori.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.dao.CommonDAO;

@Service("mypage.mypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertFollow(Map<String, Object> map) throws Exception {
		try {
				dao.insertData("mypage.insertFollow", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteFollow(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("mypage.deleteFollow", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public boolean searchFollow(Map<String, Object> map) {
		boolean result = false;
		
		try {
			int cnt = dao.selectOne("mypage.searchFollow", map);
			if (cnt != 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Mypage readMypage(Map<String, Object> map) {
		Mypage dto = null;
		
		try {
			dto = dao.selectOne("mypage.readMypage", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Mypage> listFollower(String userId) {
		List<Mypage> list = null;
		
		try {
			list = dao.selectList("mypage.listFollower", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Mypage> listFollowing(String userId) {
		List<Mypage> list = null;
		
		try {
			list = dao.selectList("mypage.listFollowing", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Mypage> listMyrecipe(Map<String, Object> map) {
		List<Mypage> list = null;
		
		try {
			list = dao.selectList("mypage.listMyrecipe", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Mypage> listLike(Map<String, Object> map) {
		List<Mypage> list = null;
		
		try {
			list = dao.selectList("mypage.listLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Mypage> listWish(Map<String, Object> map) {
		List<Mypage> list = null;
		
		try {
			list = dao.selectList("mypage.listWish", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Mypage> listFavorite(Map<String, Object> map) {
		List<Mypage> list = null;
		
		try {
			list = dao.selectList("mypage.listFavorite", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountMyrecipe(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountMyrecipe", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCountLike(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountLike", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCountWish(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountWish", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCountFavorite(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountFavorite", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCountContest(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountContest", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MyEvent> listContest(Map<String, Object> map) {
		List<MyEvent> list = null;
		
		try {
			list = dao.selectList("mypage.listContest", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountUsable(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountUsable", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MyEvent> listUsable(Map<String, Object> map) {
		List<MyEvent> list = null;
		
		try {
			list = dao.selectList("mypage.listUsable", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountUseless(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountUseless", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MyEvent> listUseless(Map<String, Object> map) {
		List<MyEvent> list = null;
		
		try {
			list = dao.selectList("mypage.listUseless", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountQna(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountQna", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MyQna> listQna(Map<String, Object> map) {
		List<MyQna> list = null;
		
		try {
			list = dao.selectList("mypage.listQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean answerState(int num) {
		boolean result = false;
		
		try {
			int cnt = dao.selectOne("mypage.answerState", num);
			if (cnt != 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int dataCountOrder(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountOrder", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MyClass> listOrder(Map<String, Object> map) {
		List<MyClass> list = null;
		
		try {
			list = dao.selectList("mypage.listOrder", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertReview(MyClass dto) throws Exception {
		try {
			dao.insertData("mypage.insertReview", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCountRefund(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountRefund", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MyClass> listRefund(Map<String, Object> map) {
		List<MyClass> list = null;
		
		try {
			list = dao.selectList("mypage.listRefund", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountSell(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountSell", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MyClass> listSell(Map<String, Object> map) {
		List<MyClass> list = null;
		
		try {
			list = dao.selectList("mypage.listSell", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
