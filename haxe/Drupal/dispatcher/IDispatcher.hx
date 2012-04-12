package drupal.dispatcher;
interface IDispatcher {
  
  var url:String;
  function setUrl(base_url:String):Void;
  function dispatch():Void;
  function getOutput():String;
  
}