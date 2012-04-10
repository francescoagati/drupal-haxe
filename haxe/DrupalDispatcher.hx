import haxe.web.Dispatch;
using StringTools;

class DrupalDispatcher {
  
  var url:String;
  var api:Api;

  function setUrl(base_url:String) {
     url=untyped __php__("$_GET['q']");
     url=url.replace(base_url + "/", "");
  }
  
  function dispatch() {
    
    var d = new Dispatch(url,new Hash());
    api=new Api();

    d.onMeta=function(m,value) {
      if (m=="view") api.view=value;
      if (m=="layout") api.layout=value;
    };
    d.dispatch(api);
    
  }
  
  public function new(base_url:String) {
    setUrl(base_url);
    dispatch(); 
  }
  
  public function getOutput():String {
    return api.output;
  }
  
  public static function main() {}
  
}