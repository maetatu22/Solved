class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '健康'},
    { id: 3, name: '仕事・職場'},
    { id: 4, name: '人間関係'},
    { id: 5, name: '恋愛・夫婦'},
    { id: 6, name: '経済・資産'},
    { id: 7, name: '子育て・結婚'},
    { id: 8, name: 'その他'},
  ]
end
