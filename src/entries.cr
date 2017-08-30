module Emerald
  class Contact
    ::DB.mapping({
      id:     Int,
      title:  String,
      author: String,
      hook:   String,
      body:   String,
      date:   Int,
    })
  end
end
