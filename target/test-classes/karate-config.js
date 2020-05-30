 function fn() {
   karate.configure('connectTimeout', 5000);
   karate.configure('readTimeout', 5000);


  var config = { // base config JSON
       username: 'QAtechtools',
       password: 'qatechtools@test',
       baseURL: 'https://api.github.com',
       randomName: makeid()

     };


function makeid() {
   var length=5;
   var result           = '';
   var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
   var charactersLength = characters.length;
   for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
   }
   return result;
}


   return config;


}




