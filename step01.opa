import stdlib.themes.bootstrap

function page() {
  <div class="well">
	  <h2 id=#msg>Click the button:</h2>
	  <div class="btn-success">I'm the button</div>
  </div>
}

Server.start(
  Server.http,
  { page: page, title: "Hello, world" }
)