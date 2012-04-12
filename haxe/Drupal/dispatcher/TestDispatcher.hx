package drupal.dispatcher;
using StringTools;
import drupal.dispatcher.DrupalDispatcher;

class TestDispatcher extends UrlDispatcher {
  

  override public function setUrl(base_url:String) {
     url=base_url;
  }
    
  public function new(base_url:String) {
    super(base_url);
    setUrl(base_url);
    dispatch(); 
  }
  
  public static function main() {
    
    var d=new TestDispatcher("/users/5");
    trace(d.getOutput());
  }
  
}