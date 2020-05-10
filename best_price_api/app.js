const cheerio = require('cheerio');
const request = require('request');

request('https://www.amazon.in/s?k=trimmer', 
    (error, response, html)=>{
        if(!error && response.statusCode==200) {
            const $ = cheerio.load(html);

            $('.a-carousel-card').each((i, e)=>{
                var name = $(e).find('.a-color-base.a-text-normal').text();
                var price = $(e).find('.a-price-whole').text();
                var img_link = $(e).find('.a-section.aok-relative.s-image-square-aspect').find('img').attr('src');
                
                if(name!=null && price!=null && img_link!=null){
                    console.log(name+" \n "+ price+" \n "+img_link);
                }
            });
            

            // $('div[class="sg-col-inner"]').each((i, e)=>{
            //     var name = $(e).find('.a-color-base.a-text-normal').text();
            //     var price = $(e).find('.a-price-whole').text();
            //     var img_link = $(e).find('.a-section.aok-relative.s-image-square-aspect').find('img').attr('src');
                
            //     if(name!=null && price!=null && img_link!=null){
            //         console.log(name+" \n "+ price+" \n "+img_link);
            //     }
            // });

        }    
    }
);




