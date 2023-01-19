export const idlFactory = ({ IDL }) => {
  const Book = IDL.Record({ 'title' : IDL.Text, 'pages' : IDL.Nat });
  return IDL.Service({
    'add_book' : IDL.Func([Book], [], ['oneway']),
    'expose_second_maximum' : IDL.Func([IDL.Vec(IDL.Int)], [IDL.Int], []),
    'get_books' : IDL.Func([], [IDL.Vec(Book)], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
