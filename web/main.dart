import 'dart:html';

void main() {
  querySelector('#output').text = 'Shelter pets give the best hugs!';
  alignImageProperly();
  addHeader();
  addStyleElement();
  fixCase();
  alignFooter();
  fixSpelling();
}

void alignImageProperly() {
    querySelector('#tears')
        ..parent.style.setProperty("width", "100%")
        ..style.setProperty("display", "block")
        ..style.setProperty("margin-right", "auto")
        ..style.setProperty("margin-left", "auto");
}

addHeader() {
    var heading = HeadingElement.h3();
    heading.text = "Animal Names";
    querySelector('.dogs').children.insert(0, heading);
}

addStyleElement() {
  var styleElement = new StyleElement();
  document.head.append(styleElement);
  CssStyleSheet sheet = styleElement.sheet;

  final rule = '.dogs { width: 150px; padding: 20px; margin-left: auto; margin-right: auto; display: block; }';
  sheet.insertRule(rule, 0);
}

fixCase() {
    var listElementChildren = querySelector('.dogs').children[1].children;

    listElementChildren.asMap().forEach((idx, value) {
        listElementChildren[idx].text = "${value.text[0].toUpperCase()}${value.text.substring(1)}";
    });
}

alignFooter() {
    querySelectorAll('footer').first.style.setProperty("text-align", "center");
}

// fixSpelling() {
//     var p = querySelector('footer').querySelector('p');
//     p.innerHtml = p.innerHtml.replaceFirst('offical', 'official');
// }

fixSpelling() {
    var p = querySelector('footer').querySelector('p');
    p.setInnerHtml(p.innerHtml.replaceFirst('offical', 'official'), treeSanitizer: AllowAllTreeSanitizer());
}

class AllowAllTreeSanitizer implements NodeTreeSanitizer {
    void sanitizeTree(Node node) {}
}

// void main() {
//   Element output = querySelector('#output');
//   output.children.addAll(thingsTodo().map(newLI));
// }

// LIElement newLI(String itemText) => LIElement()..text = itemText;

// Iterable<String> thingsTodo() sync* {
//   var actions = ['Walk', 'Wash', 'Feed'];
//   var pets = ['cats', 'dogs'];

//   for (var action in actions) {
//     for (var pet in pets) {
//       if (pet == 'cats' && action != 'Feed') continue;
//       yield '$action the $pet';
//     }
//   }
// }

// void addTodoItem(String item) {
//   print(item);

//   var listElement = LIElement();
//   listElement.text = item;
//   todoList.children.add(listElement);
// }

// UListElement todoList;
