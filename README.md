# DRArrayUtility
Custom formula function to achieve multiple array items into single object : 

Step 1 : Create a custom function in using below code : 

private boolean arr2obj(Map<String, Object> inputs, Map<String, Object> output, Map<String, Object> options) {
        List<Object> arguments = (List<Object>)inputs.get('arguments');
        List<Object> reqs = (List<Object>) arguments;
        List<string> jsonarray= new List<string> ();
        for(Object a: reqs){
            jsonarray.add(String.valueOf(a));
        }
        Integer totalattribs = Integer.valueOf( jsonarray[1]); 
        String outputPath = String.valueOf( jsonarray[0]);
        String [] attribNames = new List<String>();
        List<List<String>> attributes = new List<List<String>>() ;
        jsonarray.remove(0);jsonarray.remove(0);
 
        String[]  attribs  =  new List<String>();
        Integer j = 0;
        for(Integer i = 0; i < jsonarray.size(); i++)
        {
            attribs.add(jsonarray[i]);
            j++;
            if (j == totalattribs+1 )
            {
                j=0;
                attributes.add(new List<String>(attribs));
                attribs.clear();
            }  
        }    
        String result = '';
        String coma;
        String coma1;
        result +=('{ "'+outputPath+'" : [');
        for (Integer k = 1; k < totalattribs+1; k++) {
            result +=('{');
            for (Integer m = 0; m < attributes.size(); m++) {
                result +=('"'+attributes[m][0] + '" : "' + attributes[m][k] +'"' );
                coma = (m==attributes.size()-1 ? '' : ',');
                result+=coma;            
            }
            result +=('}'); 
            coma1 = (k==totalattribs ? '' : ',');
            result+=coma1;
        }    
        result +=(']');
        result +=('}');
        output.put('result',  JSON.deserializeUntyped(result));
        return true;    
    }
Step 2 : Create formula with 4 inputs : 

 

Output Path for your array.
Size of the Array 
Name of the JSON attribute for your array item.
Array of the objects
  

EXAMPLE 1 : 

arr2obj("output",TOSTRING(LISTSIZE(measures:id)),"id", measures:id , "version", measures:version)
 

Inputs : 

{
  "measures": {
    "version": [
      "1",
      "1",
      "2",
      "2",
      "1",
      "1"
    ],
    "id": [
      "fc24ad62-a1ad-4752-b5d3-8d5ba9ae1b1c",
      "f5477434-2617-48b9-b767-0da3537c885a",
      "2b25eccd-4cf3-4dc7-bc6e-d3f8dd1d2bac",
      "70d1f239-8dfd-4edf-95f2-58526a48e007",
      "6acb78cf-1db6-401b-a76d-45c2e1611c0b",
      "4ea2286f-f124-4e33-97ae-57ce9f141fbc"
    ]
  }
}
Outputs : 

{
  "measures": {
    "output": [
      {
        "version": "1",
        "id": "fc24ad62-a1ad-4752-b5d3-8d5ba9ae1b1c"
      },
      {
        "version": "1",
        "id": "f5477434-2617-48b9-b767-0da3537c885a"
      },
      {
        "version": "2",
        "id": "2b25eccd-4cf3-4dc7-bc6e-d3f8dd1d2bac"
      },
      {
        "version": "2",
        "id": "70d1f239-8dfd-4edf-95f2-58526a48e007"
      },
      {
        "version": "1",
        "id": "6acb78cf-1db6-401b-a76d-45c2e1611c0b"
      },
      {
        "version": "1",
        "id": "4ea2286f-f124-4e33-97ae-57ce9f141fbc"
      }
    ]
  }
}
 

 

EXAMPLE 2 : 

arr2obj("Products",TOSTRING(LISTSIZE(product)),"Id",product:ProductId)
 

Inputs :

{
  "product": [
    {
      "Name": "Lorem Ipsum",
      "ProductId": 1234
    },
    {
      "Name": "Lorem Ipsum",
      "ProductId": 5678
    },{
      "Name": "Lorem Ipsum",
      "ProductId": 1234
    },
    {
      "Name": "Lorem Ipsum",
      "ProductId": 5678
    },{
      "Name": "Lorem Ipsum",
      "ProductId": 1234
    },
    {
      "Name": "Lorem Ipsum",
      "ProductId": 5678
    }
  ]
}
Outputs : 

{
  "Products": [
    {
      "Id": "1234"
    },
    {
      "Id": "5678"
    },
    {
      "Id": "1234"
    },
    {
      "Id": "5678"
    },
    {
      "Id": "1234"
    },
    {
      "Id": "5678"
    }
  ]
}
 

  
