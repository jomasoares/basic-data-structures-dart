import 'linkedList.dart';

class _StackNode<type>{
  type value;
  _StackNode<type> above;
  _StackNode<type> below;

  _StackNode({this.above, this.below, this.value});
}

class Stack<type>{
  _StackNode<type> pointer;
  int _size = 0;


  type push(type new_value){
    if(_size == 0){
      _StackNode<type> new_top = _StackNode<type>(above: null, below: null, value: new_value);
      pointer = new_top;
    } else {
      _StackNode<type> old_top = pointer;
      _StackNode<type> new_top = _StackNode<type>(above: null, below: pointer, value: new_value);
      old_top.above = new_top;
      pointer = new_top;
    }
    _size++;
    return new_value;
  }

  type pop(){
    if(size == 0){
      var message = "can't pop empty stack";
      throw RangeError(message);
    }
    type v = pointer.value;
    pointer = pointer.below;
    _size--;
    return v;
  }

  type top(){
    return pointer.value;
  }

  get size => _size;
}