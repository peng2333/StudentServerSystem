define("waimai:widget/common/mustbuy/mustbuy",function(t,i,a){var r={},e={},n=function(t){if(t)for(var i=0;i<t.length;i++){var a=t[i];if(a)try{for(var n=0;n<a.data.length;n++)r[a.data[n].item_id]?(r[a.data[n].item_id].push(a.data[n].category_id),e[a.data[n].item_id]=a.data[n].require_category_id):(r[a.data[n].item_id]=[],r[a.data[n].item_id].push(a.data[n].category_id),e[a.data[n].item_id]=a.data[n].require_category_id)}catch(d){}}},d=[],u=function(t){for(var i=0;i<t.length;i++)d.push(t[i].category_id)},o=!1;a.exports={init:function(t){o=!0,n(t),u(t)},haveCategory:function(t,i){try{for(var a=0;a<t.length;a++){var e=t[a].uniqId,n=r[e];if(n&&-1!=n.indexOf(i))return!0}return!1}catch(d){}},getReguireId:function(t){return e[t]},isInit:function(){return o},isRequireIdInCategory:function(){for(var t in e)if(e.hasOwnProperty(t)&&0!=e[t]&&-1==d.indexOf(e[t]))return!1;return!0}}});