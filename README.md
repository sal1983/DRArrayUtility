# DRArrayUtility
Vlocity Dataraptor Custom formula function to achieve multiple array items into single object : 

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
 

  
