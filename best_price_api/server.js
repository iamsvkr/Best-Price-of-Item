const cheerio = require('cheerio');
const request = require('request');
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
var Product = require('./model/product.js');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get('/', (req, res)=>{
    res.send("hello");
    console.log("1");
});

app.get('/product/:product_name', (req, res, next) => {
    console.log(req.params.product_name);
    var product_list = [];
    request('https://www.amazon.in/s?k='+req.params.product_name+'&ref=nb_sb_noss_2', 
        (error, response, html)=>{
            if(!error && response.statusCode==200) {
                const $ = cheerio.load(html);

                $('.a-carousel-card').each((i, e)=>{
                    var name = $(e).find('.a-color-base.a-text-normal').text();
                    var price = $(e).find('.a-price-whole').text();
                    var img_link = $(e).find('.a-section.aok-relative.s-image-square-aspect').find('img').attr('src');
                    
                    if(name!=null && price!=null && img_link!=null){
                        //var product = new Product(name, price, img_link, 'amazon');
                        product_list.push({
                        	"product_name" : name,
                        	"product_price" : price,
                        	"product_image_link" : img_link,
                        	"shop" : "amazon"
                        });
                    }
                });
                res.send(product_list);
                console.log(product_list);
            }    
        }
    );
});

app.listen(3000);
