import stdlib.themes.bootstrap

database int /counter

function action(_) {
	/counter++
	Dom.add_class(#button, "btn-success")
	#msg = <>Hello visitor number {/counter}!</>
}

function page() {
	<div class="well">
		<h2 id=#msg>Click the button:</h2>
		<button id=#button class="btn" onclick={action}>Click!</button>
	</div>
}

Server.start(
	Server.http,
	{ ~page, title: "Hello, world" }
)