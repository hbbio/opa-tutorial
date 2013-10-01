import stdlib.themes.bootstrap

function action(_) {
  #msg = <>Hello!</>;
}

function page() {
  <div class="well">
	  <h2 id=#msg>Click the button:</h2>
	  <div class="btn-success" onclick={action}>I'm the button</div>
  </div>
}

Server.start(
  Server.http,
  { ~page, title: "Hello, world" }
)