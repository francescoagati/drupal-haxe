package drupal.api;

import haxe.Template;
import drupal.view.IView;
import drupal.view.ViewHaxeTemplate;
class BaseApi  implements IApi {
  
  public var view:String;
  public var layout:String;
  public var output:String;
  public var view_render:IView;
  
  public function new() {
  }
  
  public function render(data:Dynamic) {
    view_render= new ViewHaxeTemplate(view);
    output=view_render.render(data);
  }
  
  public function renderString(s:String) {
    output=s;
  }
  
}