import stdlib.themes.bootstrap
import stdlib.themes.bootstrap.font-awesome
import stdlib.web.client

// database declaration
database int /counter

// actors declaration
private Network.network(bool) channel = Network.cloud("channel")

function display() {
  #msg = <>Hello <span id="toto" onclick={
    function(e) { Client.alert(Dom.get_id(Dom.get_at_position(e.mouse_position_on_page))) }
  }>visitor</span> number {/counter}!</>
}

// counter increment
function action(_) {
  /counter++
  // broadcast the "ping" to the channel
  Network.broadcast(true, channel)
  Dom.add_class(#button, "btn-success")
  display()
}

// reset the counter
function reset(_) {
  /counter = 0
  display()
}

// load the client actor
function register(_) {
  Network.add_callback(function(_){display()}, channel)
}

function page() {
  <div class="well" onready={register}>
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