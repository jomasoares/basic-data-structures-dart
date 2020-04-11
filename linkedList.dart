class LinkedNode{
  int value;
  LinkedNode next;

  LinkedNode({this.value});
}

class LinkedList<obj>{
  LinkedNode _first;
  LinkedNode _last;
  LinkedNode pointer;
  int _size = 0;
  obj value;

  LinkedNode add(int value){
    LinkedNode newNode = LinkedNode(value: value);
    if(_size == 0){
      _first = newNode;
      _last = newNode;
      pointer = newNode;
    } else {
      _last.next = newNode;
      _last = newNode;
    }
    _size++;
    return newNode;
  }

  LinkedNode next(){
    pointer = pointer.next;
    return pointer;
  }

  int get size => _size;
  LinkedNode get first => _first;
  LinkedNode get last => _last;

  obj returnObj() => value;
  
}