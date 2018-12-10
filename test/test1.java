import com.sss.bean.Item;
import com.sss.bean.Question;
import com.sss.service.netdisk.impl.FileServiceImpl;
import com.sss.service.user.UserService;
import com.sss.service.user.impl.UserServiceImpl;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;
//cs
public class test1 {
    FileServiceImpl fileService = new FileServiceImpl();
    @Test
    public void testGetChiled() {
        List<Item> child = fileService.getChild("f:/test1");
        for (Item item : child) {
            System.out.println(item.getName()+"- - - - - - - - -"+item.getLastModifyDate()+"- - - - - - - - -"+item.getPostfix()+"- - - - - - - - -"+item.getPath());
        }
    }

    UserServiceImpl userService = new UserServiceImpl();

}
