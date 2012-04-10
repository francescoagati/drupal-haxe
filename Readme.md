An example of use of haxe with Drupal.

active the module menur and call url inside your drupal: /haxe/users/5

With an hook menu that call an instance of DrupalDispatcher


	function menur_menu() {
	  $items['haxe'] = array(
	    'page callback' => 'menur_haxe_router',
	    'access arguments' => array('access content'), 
	  );
	  return $items;
	}

	function menur_haxe_router() {
      	
	  require_once dirname(__FILE__).'/haxe/www/lib/php/Boot.class.php';
		$dp=new DrupalDispatcher('haxe');
		return $dp->getOutput();
	
	}


a Dispatcher for routing the url 



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



and the api as callback to url route



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



