import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_node/web_node.dart';

Map<String, String> textData = {};

class MarkdownEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iFrame = html.IFrameElement();
    final editor = iFrame.ownerDocument!.querySelector("#editor");
    iFrame.srcdoc = """
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <div id='editor'></div>
    <script>
    const Editor = toastui.Editor;
    const editor = new Editor({
      el: document.querySelector('#editor'),
      height: 'auto',
      initialEditType: 'markdown',
      previewStyle: 'vertical'
    });
    
    document.getElementById("editor").addEventListener("change", (function(){
      
    }));
    editor.getMarkdown();
    </script>
        """;

    editor?.innerText = textData[this.hashCode.toString()] ?? "";
    editor?.addEventListener('change', (event) {
      textData[this.hashCode.toString()] = editor.innerText;
    });

    return WebNode(node: iFrame);
  }
}
