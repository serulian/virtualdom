# Virtual DOM Library

## Example Usage

```seru
from "github.com/Serulian/virtualdom:master" import EventManager, EmptyContext, Context, Render
from "github.com/Serulian/virtualdom:master" import Div, Img, If
from webidl`github.com/Serulian/virtualdom:master` import document

function<void> StartApp() {
	// Register an EventManager rooted at the root element. It will handle all event
	// listeners.
	var em = EventManager.ForElement(document.getElementById('rootElement'))

	// Render once.
	setImage('http://some/path', context)

	// Replace.
	setImage('http://another/path', context)
}

function<void> setImage(imageUrl string, context Context) {
	var updatedDom = <Div id="rootElement">
		<Img src={imageUrl} />

		// Only render the Div if the expression returns true.
		<Div @If={imageUrl.HasPrefix('http://subdomain.mydomain.com')}>
			Image is on the subdomain!
		</Div>
	</Div>

	// Render the DOM to the rootElement, replacing its existing content.
	Render(updatedDom, context, document.getElementById('rootElement'))
}
```