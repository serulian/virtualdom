interface Node {
	readonly attribute Number nodeType;

	void appendChild(Node node);
	void removeChild(Node node);
	void replaceChild(Node node, Node child);
	void insertBefore(Node node, Node? child);

	readonly attribute NodeList childNodes;

	readonly attribute Node? parentNode;
	readonly attribute Node? firstChild;
	readonly attribute Node? lastChild;
	readonly attribute Node? nextSibling;

	getter any (String propertyName);
	setter void (String propertyName, any value);
};

interface Event {
  readonly attribute String type;
  readonly attribute Element? target;
  readonly attribute Element? srcElement;

  getter String (String propertyName);
};

interface NodeList {
  getter Node? (Number index);
  readonly attribute Number length;	
};

interface Element : Node {
	readonly attribute String tagName;
	attribute String id;
	attribute String className;
	String getAttribute(String name);
	void setAttribute(String name, String value);
	void removeAttribute(String name);
	Boolean hasAttribute(String name);
	Boolean matches(String selector);

	readonly attribute Array attributes;

	void addEventListener(String type, any listener, optional Boolean capture);
	void removeEventListener(String type, any listener, optional Boolean capture);
};

interface HTMLIFrameElement : Element {
	readonly attribute HTMLWindow contentWindow;
};

interface Text : Node {
	readonly attribute String wholeText;	
};

interface HTMLDocument {
  Element createElement(String localName);
  Text createTextNode(String data);

  attribute Element body;
  Element getElementById(String elementId);
  Array getElementsByTagName(String tagName);

  Boolean hasFocus();
};

[Global]
interface Window {
   static readonly attribute HTMLDocument document;
};

interface HTMLWindow {
   readonly attribute HTMLDocument document;		
};

