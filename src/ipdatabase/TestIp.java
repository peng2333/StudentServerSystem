package ipdatabase;

import ipdatabase.ip.IpHelper;
import org.junit.Test;

/**
 * Created by XiongTianCi on 2018/7/3
 *
 * @author tianci
 */
public class TestIp {
    @Test
    public void example() throws Exception {
        String ip = "58.30.15.255";
        String region = IpHelper.findRegionByIp(ip);
        System.out.println(region);
    }
}
