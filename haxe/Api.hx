import haxe.web.Dispatch;

class Api extends BaseApi {
    
    public function new() {}
      
    @view('user')
    function doUsers(d:Dispatch,id:Int) {
      render({
        name:'mario',
        surname:'rossi'
      });
    }
}