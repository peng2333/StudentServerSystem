define("waimai:widget/common/ui/search/search",function(require,exports,module){require("waimai:static/utils/statis");var CookieDataCenter=require("waimai:static/utils/CookieDataCenter"),AddressDataCenter=require("waimai:static/utils/AddressDataCenter"),resultTmpl=[function(_template_object){var _template_fun_array=[],fn=function(__data__){var _template_varName="";for(var name in __data__)_template_varName+="var "+name+'=__data__["'+name+'"];';eval(_template_varName),_template_fun_array.push('<div class="search-title">    <div class="search-desc">请确定您的地址</div></div><div class="search-list s-list">    <ul>        ');for(var i=0,len=data.length;len>i;i++){var item=data[i];_template_fun_array.push('            <li data-uid = "',"undefined"==typeof item.uid?"":baidu.template._encodeHTML(item.uid),'" data-link = "/waimai?qt=shoplist&lat=',"undefined"==typeof item.latitude?"":baidu.template._encodeHTML(item.latitude),"&lng=","undefined"==typeof item.longitude?"":baidu.template._encodeHTML(item.longitude),"&address=","undefined"==typeof item.name?"":baidu.template._encodeHTML(item.name),"&city_id=","undefined"==typeof city_id?"":baidu.template._encodeHTML(city_id),'" data-msg = "',"undefined"==typeof item.name?"":baidu.template._encodeHTML(item.name),"$","undefined"==typeof(item.address?item.address:"")?"":baidu.template._encodeHTML(item.address?item.address:""),"$","undefined"==typeof item.latitude?"":baidu.template._encodeHTML(item.latitude),"$","undefined"==typeof item.longitude?"":baidu.template._encodeHTML(item.longitude),"$","undefined"==typeof item.shopnum?"":baidu.template._encodeHTML(item.shopnum),"$","undefined"==typeof city_id?"":baidu.template._encodeHTML(city_id),'" data-name="',"undefined"==typeof decodeURIComponent(item.name)?"":baidu.template._encodeHTML(decodeURIComponent(item.name)),'">                <div class="addr addr-icon"></div>                <div class="addr addr-content">                    <p class="addr-name">',"undefined"==typeof item.name?"":baidu.template._encodeHTML(item.name),'</p>                    <p class="addr-desc">',"undefined"==typeof(item.address?item.address:"")?"":baidu.template._encodeHTML(item.address?item.address:""),"</p>                    "),item.shopnum&&0!==parseInt(item.shopnum,10)?_template_fun_array.push('                        <p class="addr-shop-num">',"undefined"==typeof item.shopnum?"":baidu.template._encodeHTML(item.shopnum),"家餐厅</p>                    "):_template_fun_array.push('                        <p class="addr-shop-num addr-no-open">暂无开通</p>                    '),_template_fun_array.push("                </div>            </li>        ")}_template_fun_array.push("    </ul></div>"),_template_varName=null}(_template_object);return fn=null,_template_fun_array.join("")}][0],historyTmpl=[function(_template_object){var _template_fun_array=[],fn=function(__data__){var _template_varName="";for(var name in __data__)_template_varName+="var "+name+'=__data__["'+name+'"];';eval(_template_varName),_template_fun_array.push('<div class="s-list search-list">    <ul>        ');for(var i=0,len=data.length;len>i;i++){var item=data[i];_template_fun_array.push('        <li data-link = "/waimai?qt=shoplist&lat=',"undefined"==typeof item.lat?"":baidu.template._encodeHTML(item.lat),"&lng=","undefined"==typeof item.lng?"":baidu.template._encodeHTML(item.lng),"&address=","undefined"==typeof decodeURIComponent(item.name)?"":baidu.template._encodeHTML(decodeURIComponent(item.name)),"&city_id=","undefined"==typeof decodeURIComponent(item.city_id)?"":baidu.template._encodeHTML(decodeURIComponent(item.city_id)),"&uid=","undefined"==typeof decodeURIComponent(item.uid)?"":baidu.template._encodeHTML(decodeURIComponent(item.uid)),'" data-name="',"undefined"==typeof decodeURIComponent(item.name)?"":baidu.template._encodeHTML(decodeURIComponent(item.name)),'">                <div class="addr his-icon"></div>                <div class="addr addr-content">                    <p class="addr-name">',"undefined"==typeof decodeURIComponent(item.name)?"":baidu.template._encodeHTML(decodeURIComponent(item.name)),'</p>                    <p class="addr-desc">',"undefined"==typeof decodeURIComponent(item.address)?"":baidu.template._encodeHTML(decodeURIComponent(item.address)),"</p>                    "),item.shopnum&&0!==parseInt(item.shopnum,10)?_template_fun_array.push('                        <p class="addr-shop-num">',"undefined"==typeof item.shopnum?"":baidu.template._encodeHTML(item.shopnum),"家外卖餐厅</p>                    "):_template_fun_array.push('                        <p class="addr-shop-num addr-no-open">暂无开通</p>                    '),_template_fun_array.push("                </div>            </li>        ")}_template_fun_array.push('    </ul></div><div class="search-history-clear">    <a class="clear-btn">清空历史记录</a></div>'),_template_varName=null}(_template_object);return fn=null,_template_fun_array.join("")}][0],sugTmpl=[function(_template_object){var _template_fun_array=[],fn=function(__data__){var _template_varName="";for(var name in __data__)_template_varName+="var "+name+'=__data__["'+name+'"];';eval(_template_varName),_template_fun_array.push('<div class="search-list s-list">    <ul>        ');for(var i=0,len=data.length;len>i;i++){var item=data[i];_template_fun_array.push('            <li data-name="',"undefined"==typeof item.name3?"":baidu.template._encodeHTML(item.name3),'" data-lat="',"undefined"==typeof item.lat?"":baidu.template._encodeHTML(item.lat),'" data-lng="',"undefined"==typeof item.lng?"":baidu.template._encodeHTML(item.lng),'">                <div class="addr addr-icon"></div>                <div class="addr addr-content">                    <p class="addr-name">',"undefined"==typeof item.name3?"":baidu.template._encodeHTML(item.name3),'</p>                    <p class="addr-desc">',"undefined"==typeof item.name1?"":baidu.template._encodeHTML(item.name1),"","undefined"==typeof item.name2?"":baidu.template._encodeHTML(item.name2),"","undefined"==typeof item.name3?"":baidu.template._encodeHTML(item.name3),"</p>                </div>            </li>        ")}_template_fun_array.push("    </ul></div>"),_template_varName=null}(_template_object);return fn=null,_template_fun_array.join("")}][0],emptyTmpl=[function(_template_object){var _template_fun_array=[],fn=function(__data__){var _template_varName="";for(var name in __data__)_template_varName+="var "+name+'=__data__["'+name+'"];';eval(_template_varName),_template_fun_array.push("<p>此地点附近暂时没有外卖餐厅，努力覆盖中...</p>"),_template_varName=null}(_template_object);return fn=null,_template_fun_array.join("")}][0],_historyHtml,Search=function(e,t){var a=function(){function e(e){$.extend(C,e)}function t(){C.$resultEl.addClass("mod-search-hide mod-search-container")}function a(){C.$resultEl.addClass("mod-search-hide")}function n(){for(var e=C.$resultEl.find(".s-list li"),t=C.$resultEl.offset().top,a=0,n=e.length;n>a;a++){var i=e.eq(a).offset().top,d=e.eq(a).outerHeight(!0),l=i-d-t;e.eq(a).attr("data-top",l)}}function i(){var e;C.$resultEl.empty().removeClass("mod-search-result mod-search-sug mod-search-empty").addClass("mod-search-history"),e=c(),e?(C.$resultEl.removeClass("mod-search-hide").append(e).show(),n()):C.$resultEl.addClass("mod-search-hide")}function d(){C.$resultEl.hide().empty().removeClass("mod-search-history").addClass("mod-search-hide")}function l(e){C.$resultEl.empty().removeClass("mod-search-hide mod-search-result mod-search-history mod-search-empty").addClass("mod-search-sug").append(e).show(),n(),m()}function s(e){C.$resultEl.empty(),C.$resultEl.removeClass("mod-search-hide mod-search-sug mod-search-history mod-search-empty"),C.$resultEl.addClass("mod-search-result"),C.$resultEl.append(e).show(),n(),m()}function r(){if(C.NOListLiJump)C.$hiddenSearchPOI.val("0-0"),a();else{var e=emptyTmpl();C.$resultEl.empty(),C.$resultEl.removeClass("mod-search-hide mod-search-sug mod-search-history mod-search-result"),C.$resultEl.addClass("mod-search-empty"),C.$resultEl.append(e).show(),m()}}function o(){$(".s-loading").removeClass("mod-search-hide")}function m(){$(".s-loading").addClass("mod-search-hide")}function u(e){e.preventDefault(),e.stopPropagation()}function c(){if(_historyHtml)return _historyHtml;var e=AddressDataCenter.getAll()||[];return e&&e.length?_historyHtml=historyTmpl({data:e}):null}function p(e){var t=CookieDataCenter.getCity().code,e=e?e:C.$searchConEl.val(),a="";$.ajax({url:"/waimai?qt=poisug",type:"POST",dataType:"json",data:{cid:t,type:0,wd:e,from:"pc"},success:function(t){var n=t.s||[];if(n.length>0){if(C.NOListLiJump){a="";var i=[];$.each(n,function(t,a){{var n=a.split("$"),d=n[3],l=n[5].split(",")[0],s=n[5].split(",")[1];d.replace(e,"<b>"+e+"</b>")}i.push({name1:n[0],name2:n[1],name3:d,lat:l,lng:s})}),a=sugTmpl({data:i})}else a="<div class='search-list s-list'><ul>",$.each(n,function(t,n){var i=n.split("$"),d=i[3],l=i[5].split(",")[0],s=i[5].split(",")[1],r="<i></i><span>"+d.replace(e,"<b>"+e+"</b>")+"</span>";a+="<li data-name='"+d+"' data-lat='"+l+"' data-lng='"+s+"'>"+r+"</li>"}),a+="</ul></div>";l(a)}}})}function _(e,t,n){o(),!t&&(t=""),!n&&(n="");var e=e?e:C.$searchConEl.val();addNStat({da_src:"findBk.searchBtn",da_act:"click",da_trd:"waimai"});var i="/waimai?qt=poisearch&from=pc&ie=utf-8&sug=0&tn=B_NORMAL_MAP&oue=1&res=1&c="+CookieDataCenter.getCity().code;$.ajax({type:"GET",url:i,dataType:"json",data:{lat:t,lng:n,wd:e,_t:+new Date},timeout:1e4,success:function(e){if(0==e.error_no)if(""==e.result.url)if(C.NOListLiJump&&1==e.result.content.length){var t=e.result.content[0].name||"",n=e.result.content[0].latitude||"0",i=e.result.content[0].longitude||"0";C.$searchConEl.val(t),C.$hiddenSearchPOI.val(i+"-"+n),C.$hiddenSearchPOI.attr("poi_id",e.result.content[0].uid),a()}else{var d=resultTmpl({data:e.result.content,city_id:e.result.city_id});s(d)}else{var l=e.result.content[0]||{shopnum:0};if(l.shopnum){var o={};o.name=l.name,o.address=l.address,o.lat=l.latitude,o.lng=l.longitude,o.shopnum=l.shopnum,o.city_id=e.result.city_id,o.uid=l.uid,AddressDataCenter.add(o),C.NOListLiJump?(C.$searchConEl.val(o.name),C.$hiddenSearchPOI.val(o.lng+"-"+o.lat),C.$hiddenSearchPOI.attr("poi_id",l.uid),a()):y(e.result.url)}else r()}else r()},error:function(){r()}})}function f(){var e=C.$resultEl.find(".s-list");if(e.length>0){var t=e.find("li.s-on");if(t.length>0)return void t.click()}C.$searchConEl.val()&&_(C.$searchConEl.val(),"","")}function h(){var e,t=C.$resultEl.find(".s-list li");if(t.length>0){if(C.$resultEl.hasClass("mod-search-result")){if(t.size()<5)return}else if(t.size()<7)return;e=C.$resultEl.find(".s-list li.s-on").attr("data-top"),C.$resultEl.scrollTop(e)}}function v(e){var t=C.$searchConEl.filter("input"),n=C.$resultEl,l="show.history";C.showHistoryTrg&&(l=C.showHistoryTrg);var s="hide.history";C.hideHistoryTrg&&(s=C.hideHistoryTrg),$(e).on(l,function(){setTimeout(function(){i()},0)}),$(e).on(s,function(){setTimeout(function(){d()},0)}),n.on("blur",function(){this.hide()}),t.on("click",function(e){var a=t.val(),n=CookieDataCenter.getCity();0==a.length?n.hasaoi||i():p(a),e.stopPropagation()}),t.on("keydown",function(e){if(window.NOBLUR="NOPE",C.$hiddenSearchPOI&&C.$hiddenSearchPOI.val(""),13==e.which)return void f();if(38!=e.which)if(40!=e.which){var a=CookieDataCenter.getCity();setTimeout(function(){var e=t.val();0==e.length?a.hasaoi||i():p(e)},0)}else{var d=n.find(".s-list");if(d.length>0){var l=d.find("li.s-on");0==l.length||l.index()==d.find("li").length-1?(d.find("li:first").addClass("s-on"),l.removeClass("s-on")):(l.next("li").addClass("s-on"),l.removeClass("s-on"));var s=d.find("li.s-on"),r=s.attr("data-name");h(),r&&t.val(r)}}else{var d=n.find(".s-list");if(d.length>0){var l=d.find("li.s-on");0==l.length||0==l.index()?(d.find("li:last").addClass("s-on"),l.removeClass("s-on")):(l.prev("li").addClass("s-on"),l.removeClass("s-on"));var s=d.find("li.s-on"),r=s.attr("data-name");h(),r&&t.val(r)}}}),n.on("click",".s-list li",function(e){var t=$(e.currentTarget);if(u(e),n.hasClass("mod-search-sug")){var a=t.data("name"),i=t.data("lat"),l=t.data("lng");return a&&C.$searchConEl.val(a),void _(a,i,l)}var s={},r=$(this).attr("data-msg"),o=$(this).attr("data-link");if(n.hasClass("mod-search-result")){if(C.NOListLiJump);else if($(this).find(".addr-shop-num").hasClass("addr-no-open"))return;var m=r.split("$");s.name=m[0],s.address=m[1],s.lat=m[2],s.lng=m[3],s.shopnum=m[4],s.city_id=m[5],AddressDataCenter.add(s)}if(C.NOListLiJump){for(var m=o.split("&"),c=[],p=0;p<m.length;p++){var f=m[p].split("=")[0],h=m[p].split("=")[1];c[f]=h}s.name=c.address,s.lat=c.lat,s.lng=c.lng,s.city_id=c.city_id,s.uid=c.uid,AddressDataCenter.add(s),C.$searchConEl.val(c.address),C.$hiddenSearchPOI.val(s.lng+"-"+s.lat),C.$hiddenSearchPOI.attr("poi_id",s.uid),d()}else y(o)}),n.on("mousedown",".s-list li",function(){window.NOBLUR="YES"}),n.on("click",".clear-btn",function(e){u(e),AddressDataCenter.clearAll(),_historyHtml=null,a(),n.empty()}),$(document).on("click",a),n.hover(function(){$(document).unbind("click",a)},function(){$(document).on("click",a)}),t.hover(function(){$(document).unbind("click",a)},function(){$(document).on("click",a)})}function y(e){function t(e,t){var a=new RegExp("(^|&)"+e+"=([^&]*)(&|$)","i"),n=t.match(a);return null!=n?unescape(n[2]):null}var a=/(\/shopinterface)|(\/activity)/;if(a.test(window.location.pathname)){var n=t("lng",e),i=t("lat",e),d=t("address",e);CookieDataCenter.setAddr({lng:n,lat:i,address:d}),window.location.reload()}else location.href=e}var C={$resultEl:null,$searchConEl:null,$searchBtn:null,showHistoryTrg:null,hideHistoryTrg:null,NOListLiJump:null,$hiddenSearchPOI:null};return{initOption:e,initHtml:t,bindEvent:v}}();a.initOption(t),a.initHtml(),a.bindEvent(e),a=null};module.exports={init:function(e){new Search(this,e)}}});