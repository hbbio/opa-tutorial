import stdlib.themes.bootstrap
import stdlib.themes.bootstrap.font-awesome

database int /counter;

function display() {
	#msg = <>Hello visitor number {/counter}!</>;
}

function action(_) {
	/counter++;
	Dom.add_class(#button, "btn-success");
	display();
}

function reset(_) {
	/counter = 0;
	display();
}

function page() {
	<div class="well">
		<h2 id=#msg>Click the button:</h2>
		<button id=#button class="btn" onclick={action}>Click!</button>
		<a class="btn btn-danger" onclick={reset}>
  		<i class="fa fa-trash-o fa-lg"></i> Reset</a>
	</div>
}

Server.start(
	Server.http,
	{ ~page, title: "Hello, world" }
)