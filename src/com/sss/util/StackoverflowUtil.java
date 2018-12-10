package com.sss.util;

import com.sss.bean.Exceptionans;
import org.junit.Test;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Selectable;

import java.util.ArrayList;
import java.util.List;

/**
 * 可以根据输入异常去stackoverflow进行搜索答案
 * @author XDerhuo
 */
public class StackoverflowUtil implements PageProcessor {

    private Site site = Site.me().setRetryTimes(3).setSleepTime(100);

    private List<Exceptionans> anslist = new ArrayList<>();
    @Override
    public void process(Page page) {
        List<Selectable> all = page.getHtml()
                .xpath("//div[@class='flush-left js-search-results']/div[@class='question-summary search-result']")
                .nodes();

        List<String> ans = new ArrayList<>();
        if (page.getUrl().toString().indexOf("search?q")==-1){
            //在回答页面

            //回答
            List<String> answers = page.getHtml()
                    .xpath("//div[@id='answers']" +
                            "//div[@class='post-text']" +
                            "//html()")
                    .all();
            //点赞数量
            List<String> goods = page.getHtml()
                    .xpath("//div[@id='answers']" +
                            "//span[@itemprop='upvoteCount']" +
                            "//text()")
                    .all();

            //存入集合中
            for (int i = 0; i < answers.size(); i++) {
                Exceptionans ex = new Exceptionans();
                ex.setAnswer(answers.get(i));
                ex.setGoods(Integer.valueOf(goods.get(i)));
                anslist.add(ex);
            }
        }else {
            //如果是在搜索页面
/*            System.out.println("点赞数：");
            List<String> all1 = page.getHtml()
                    .xpath("//div[@class='flush-left js-search-results']//div[@class='question-summary search-result']//span[@class='vote-count-post']/strong//text()")
                    .all();
            for (String s : all1) {
                System.out.println(s);
            }*/

            for (Selectable selectable : all) {
                String s = selectable
                        .xpath("//div[@class='result-link']//a/@href")
                        .toString();
                ans.add(s);
            }
            //迭代
            page.addTargetRequests(ans);
        }
    }

    @Override
    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public List<Exceptionans> getAnslist() {
        return anslist;
    }

    public void setAnslist(List<Exceptionans> anslist) {
        this.anslist = anslist;
    }

    @Test
    public void test(){
        StackoverflowUtil stackoverflowUtil = new StackoverflowUtil();
        Spider.create(stackoverflowUtil).addUrl("https://stackoverflow.com/search?q=123").thread(5).run();
        List<Exceptionans> anslist = stackoverflowUtil.getAnslist();
        for (Exceptionans exceptionans : anslist) {
            System.out.println(exceptionans);
        }
    }

}
