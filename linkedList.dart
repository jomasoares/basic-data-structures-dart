class LinkedNode<type>{
  type value;
  LinkedNode<type> next;
  LinkedNode<type> previous;

  LinkedNode({this.value});
}

class LinkedList<type>{
  LinkedNode<type> _first;
  LinkedNode<type> _last;
  LinkedNode<type> pointer;
  int _size = 0;

  LinkedNode add(type value){
    LinkedNode<type> newNode = LinkedNode<type>(value: value);
    if(_size == 0){
      _first = newNode;
      _last = newNode;
      pointer = newNode;
    } else {
      LinkedNode<type> prev = _last;
      _last.next = newNode;
      _last = newNode;
      _last.previous = prev;
    }
    _size++;
    return newNode;
  }

  LinkedNode remove(int index){
    this.pointer = this._first;
    if(this.size == 0){
      var message = "Can't remove from empty list";
      throw RangeError(message);
    } else if (index < 0 || index >= this.size) {
      var message = "Index out of range.";
      throw RangeError(message);
    }
    int i = 0;
    do {
      this.next();
      i++;
    } while (i < index);

    /*
      Acording to this stack overflow article 
      (https://stackoverflow.com/questions/20482596/how-do-we-delete-an-object-in-dart#20490161),
      flutter has a garbage collector.
    */
    this.pointer.previous.next = this.pointer.next;
    this.pointer.next.previous = this.pointer.previous;
    this._size--;

    return this.pointer;
  }

  LinkedNode next(){
    pointer = pointer.next;
    return pointer;
  }

  int get size => _size;
  LinkedNode get first => _first;
  LinkedNode get last => _last;
  
}