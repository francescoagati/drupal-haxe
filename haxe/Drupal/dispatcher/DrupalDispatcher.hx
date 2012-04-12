package drupal.dispatcher;
using StringTools;

import drupal.dispatcher.ServiceDispatcher;

class DrupalDispatcher extends UrlDispatcher {
  

  override public function setUrl(base_url:String) {
     url=untyped __php__("$_GET['q']");
     url=url.replace(base_url + "/", "");
     url=base_url;
  }
    
  public function new(base_url:String) {
    super(base_url);
    setUrl(base_url);
    dispatch(); 
  }
  
  public static function main() {
    
    var d=new DrupalDispatcher("/users/5");
    trace(d.getOutput());
  }
  
}