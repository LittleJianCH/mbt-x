pub struct Engine {
  graph : Array[Array[Int]]
  actions : Array[Int?]
  code_blocks_n : Int
}

pub fn run(self : Engine, lexbuf : Lexbuf) -> Int {
  let mut state = 1
  let backtrace = Array::make(self.code_blocks_n, None)
  while state != 0 {
    match self.actions[state] {
      Some(t) => backtrace[t] = Some(lexbuf.cur_ptr())
      _ => ()
    }
    if lexbuf.is_empty() {
      break
    }
    state = self.graph[state][lexbuf.unsafe_peek().to_int()]
    lexbuf.step()
  }
  for index, b in backtrace.iter2() {
    match b {
      Some(p) => {
        lexbuf.set_ptr(p)
        break index
      }
      None => ()
    }
  } else {
    self.code_blocks_n
  }
}
