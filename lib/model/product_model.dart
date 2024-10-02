class ProductModel{
  String? name;
  String? image;
  String? price;
  String? description;
  String? tag;
  String? id;

  ProductModel({this.name, this.image, this.price, this.description, this.tag,this.id});
}

List<ProductModel> product=[
  ProductModel(
      id: '1',
      name: 'Mens Full Slave Shirt',
      image: 'https://cdni.llbean.net/is/image/wim/513053_43331_41?wid=428&hei=494',
      price: '2000',
      description: 'Our lightest flannel shirt is also one of our most versatile. Its as soft and cozy as flannel should be, but not quite as warm – so you can wear it comfortably year-round. The innovative, easy-care fabric also wicks moisture away and has built-in stretch for enhanced freedom of movement.',
      tag: 'shirt'
  ),
  ProductModel(
      id: '2',
      name: 'Mens Formal Shoe',
      image: 'https://storage.apex4u.com/91331A81_1.jpeg',
      price: '5000',
      description: 'Our lightest flannel shirt is also one of our most versatile. Its as soft and cozy as flannel should be, but not quite as warm – so you can wear it comfortably year-round. The innovative, easy-care fabric also wicks moisture away and has built-in stretch for enhanced freedom of movement.',
      tag: 'shoe'
  ),
  ProductModel(
      id: '3',
      name: 'Mens Sneakers Shoe',
      image: 'https://m.media-amazon.com/images/I/614aiM56siL._AC_UY1000_.jpg',
      price: '3000',
      description: 'Our lightest flannel shirt is also one of our most versatile. Its as soft and cozy as flannel should be, but not quite as warm – so you can wear it comfortably year-round. The innovative, easy-care fabric also wicks moisture away and has built-in stretch for enhanced freedom of movement.',
      tag: 'shoe'
  ),
  ProductModel(
      id: '4',
      name: 'Mens Smart Watch',
      image: 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1619789123-fitbit-sense-advanced-smartwatch-1619789116.jpg',
      price: '7000',
      description: 'Our lightest flannel shirt is also one of our most versatile. Its as soft and cozy as flannel should be, but not quite as warm – so you can wear it comfortably year-round. The innovative, easy-care fabric also wicks moisture away and has built-in stretch for enhanced freedom of movement.',
      tag: 'watch'
  ),
  ProductModel(
      id: '5',
      name: 'Mens T-Shirt ',
      image: 'https://images.napali.app/global/dcshoes-products/all/default/xlarge/adyzt05273_dcshoes,f_ktew_frt1.jpg',
      price: '1000',
      description: 'Our lightest flannel shirt is also one of our most versatile. Its as soft and cozy as flannel should be, but not quite as warm – so you can wear it comfortably year-round. The innovative, easy-care fabric also wicks moisture away and has built-in stretch for enhanced freedom of movement.',
      tag: 't-shirt'
  ),
  ProductModel(
      id: '6',
      name: 'Mens Cap',
      image: 'https://eoms.cutpricebd.com/oms_products/big/620d7c0c71835_black-and-white-stylish-cotton-cap-for-men-70723.png',
      price: '300',
      description: 'Our lightest flannel shirt is also one of our most versatile. Its as soft and cozy as flannel should be, but not quite as warm – so you can wear it comfortably year-round. The innovative, easy-care fabric also wicks moisture away and has built-in stretch for enhanced freedom of movement.',
      tag: 'cap'
  ),
];