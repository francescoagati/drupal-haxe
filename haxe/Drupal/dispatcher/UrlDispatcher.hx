package drupal.dispatcher;

import haxe.web.Dispatch;
import drupal.view.ViewHaxeTemplate;
import drupal.api.Api;

class UrlDispatcher implements IDispatcher {
  
  public var url:String;
  var api:Api;

  public function setUrl(base_url:String) {}
  
  public function dispatch() {
    
    var d = new Dispatch(url,new Hash());
    api=new Api();

    d.onMeta=function(m,value) {
      trace(value[0]);
      if (m=="view") api.view=value[0];
      if (m=="layout") api.layout=value[0];
    };
    
    trace(api.view);
    d.dispatch(api);
    
  }
  
  public function new(base_url:String) {}
  
  public function getOutput():String {
    return api.output;
  }
  
}