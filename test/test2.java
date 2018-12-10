
import com.sss.bean.Data;
import com.sss.bean.Friends;
import com.sss.bean.JsonList;
import com.sss.vo.OnlineUserVo;
import org.junit.Test;

/**
 * Created by ZhangPeng on 2018/6/20
 */
public class test2 {
    @Test
    public void test(){
        OnlineUserVo me = new OnlineUserVo();
        me.setId(1);
        me.setUsername("张鹏");
        me.setAvatar("..\\images\\header\\1.jpg");
        me.setSign("666");

        Friends friends = new Friends();
        OnlineUserVo frined1 = new OnlineUserVo();
        frined1.setId(2);
        frined1.setUsername("花花");
        frined1.setAvatar("..\\images\\header\\3.jpg");
        frined1.setSign("777");
        OnlineUserVo frined2 = new OnlineUserVo();
        frined2.setId(3);
        frined2.setUsername("卓卓");
        frined2.setAvatar("..\\images\\header\\8.jpg");
        frined2.setSign("888");
        friends.getList().add(frined1);
        friends.getList().add(frined2);

        Data data = new Data();
        data.setMine(me);
        data.getFriend().add(friends);

        JsonList jsonList = new JsonList();
        jsonList.setData(data);
        System.out.println(jsonList);

    }


}
