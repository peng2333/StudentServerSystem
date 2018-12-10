(function ( /*importstart*/ ) {
var scripts = document.getElementsByTagName('script'),
    length = scripts.length,
    src = scripts[length - 1].src,
    pos = src.indexOf('/js/'),
    scriptPath = src.substr(0, pos) + '/js/';
window.importScriptList = {};
window.importScript = function (filename) {
    if (!filename) return;
    if (filename.indexOf("http://") == -1 && filename.indexOf("https://") == -1) {
        if (filename.substr(0, 1) == '/') filename = filename.substr(1);
        filename = scriptPath + filename;
    }
    if (filename in importScriptList) return;
    importScriptList[filename] = true;
    document.write('<script src="' + filename + '" type="text/javascript"><\/' + 'script>');
}
})( /*importend*/ );
passport._define('uni_forceverify.js'/*tpa=https://passport.baidu.com/passApi/js/uni_forceverify.js*/, function(){
    importScript("domain.js"/*tpa=https://passport.baidu.com/passApi/js/conf/domain.js*/);
    importScript('idcard_validate.min.js'/*tpa=https://passport.baidu.com/passApi/js/lib/idcard_validate.min.js*/);
    importScript("uni_forceverify_core.js"/*tpa=https://passport.baidu.com/passApi/js/uni/uni_forceverify_core.js*/);
    return true;
})