# Virtual DOM Library

## Example Usage

```seru
from "github.com/Serulian/virtualdom:master" import EventManager, ComputeDiff, ApplyDiff, NodeWrapper
from "github.com/Serulian/virtualdom:master" import Div, Img
from webidl`github.com/Serulian/virtualdom:master` import document

function<void> updateDom(em EventManager, message string, src string) {
	// Register an onclick handler.
	var onClick = em.RegisterFunction(function<void>() {
		updateDom(em, 'Changed!', 'changed.png')
	})

	// Create the DOM.
	var newDom = <Div Key="rootElement" id="rootElement" onclick={onClick}>
		<Img Key="icon" src={src} />
		{ message }
	</Div>

	// Compute a diff against the current DOM tree.
	var diff = ComputeDiff(newDom, NodeWrapper.For(document.getElementById('rootElement')))

	// Apply the diff to update the DOM tree.
	ApplyDiff(diff, document.getElementById('foo'), em)
}

function<void> StartApp() {
	var em = EventManager.ForElement(document.getElementById('rootElement'))
	updateDom(em, 'Hello World', 'helloworld.png')
}
```