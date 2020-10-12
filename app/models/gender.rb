class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '非公開' },
    { id: 2, name: '男性'   },
    { id: 3, name: '女性'   }
  ]
end
