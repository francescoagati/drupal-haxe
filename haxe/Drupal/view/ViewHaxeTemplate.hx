package drupal.view;
class ViewHaxeTemplate implements IView {

  private var template:String;

  public function new(template:String) {
    this.template=template;
  }

  public function render(data:Dynamic):String {
    
    var str = haxe.Resource.getString(template);
    var t = new haxe.Template(str);
    return t.execute(data);
    
  }

}