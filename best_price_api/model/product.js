function Product(product_name, product_price, product_image_link, shop) {
    this.product_name = product_name;
    this.shop = shop;
    this.product_price = product_price;
    this.product_image_link = product_image_link;
}

module.exports = Product;