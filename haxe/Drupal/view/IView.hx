package drupal.view;
interface IView {
  private var template:String;
  public function render(data:Dynamic):String;
}