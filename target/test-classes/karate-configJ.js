 function fn() {
   karate.configure('connectTimeout', 5000);
   karate.configure('readTimeout', 5000);


   var config = { // base config JSON
       appId: '0b87dde7-9503-4f85-9d64-ade68988ca4d',
       appSecret: 'cVXWNQRKJHVS:UHS@z59WbYBxJs?8A8-',
       username:'jhon@atidemo.onmicrosoft.com',
       password:'pramati@123',
       authURL: 'https://login.microsoftonline.com/a4e719c5-6190-44e2-a31d-b220f3531748/oauth2/v2.0',
       atiawsURL: 'https://qa-aws-api.atiworksitesolutions.com/api/v1/atiaws'
       //var result=karate.callsingle('classpath:authentication/Authenticate.feature',config);

       // and it sets a variable called 'authInfo' used in headers-single.feature
       //config.authInfo = { authTime: result.time, authToken: result.access_token };

     };


 if(true){
   var result=karate.callSingle('classpath:authentication/Authenticate.feature',config);
     karate.log('My config result-----',result);
     // and it sets a variable called 'authInfo' used in headers-single.feature
     config.authInfo = { authToken: result.accessToken };
}
   return config;


   }





