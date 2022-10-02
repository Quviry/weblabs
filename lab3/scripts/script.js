function recursive_tree(parent_node, level) {
    console.log("Working over arguments: " + parent_node.nodeName + " " + level);
    var attr = parent_node.className;
    if (attr != '') {
        attr = ", class = " + attr;
    }
    var subtree = '\xa0'.repeat(level) + parent_node.tagName.toLowerCase() + attr + "\n";
    for (var child of parent_node.children) {
        subtree += recursive_tree(child, level + 1);
    }
    return subtree;
}

document.addEventListener("DOMContentLoaded", (evt) => {
    console.log("Start tree recursion");
    let tree_block = document.getElementById("tree");
    tree_block.innerText = recursive_tree(document.documentElement, 0)
})
