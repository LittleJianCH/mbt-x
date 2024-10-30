pub struct Lexbuf {
  content : Bytes
  mut ptr : Int
}

pub fn Lexbuf::from_bytes(bytes : Bytes) -> Lexbuf {
  { content: bytes, ptr: 0 }
}

fn is_empty(self : Lexbuf) -> Bool {
  self.ptr == self.content.length()
}

fn unsafe_peek(self : Lexbuf) -> Byte {
  self.content[self.ptr]
}

fn peek(self : Lexbuf) -> Byte? {
  if self.is_empty() {
    None
  } else {
    Some(self.unsafe_peek())
  }
}

pub fn cur_ptr(self : Lexbuf) -> Int {
  self.ptr
}

pub fn set_ptr(self : Lexbuf, ptr : Int) -> Unit {
  self.ptr = ptr
}

pub fn step(self : Lexbuf) -> Unit {
  self.ptr += 1
}
