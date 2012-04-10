import haxe.Template;

class BaseApi  {
  
  public var view:Dynamic;
  public var layout:Dynamic;
  public var output:String;
  
  
  public function render(data:Dynamic) {
    
    var str = haxe.Resource.getString(view[0]);
    var t = new haxe.Template(str);
    output = t.execute(data);

  }
  
  public function renderString(s:String) {
    output=s;
  }
  
}