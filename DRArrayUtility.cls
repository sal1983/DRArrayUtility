global class DRArrayUtility implements vlocity_cmt.VlocityOpenInterface
{
    
    global Boolean invokeMethod(String methodName, Map<String, Object> inputs, Map<String, Object> output, Map<String, Object> options)
    {
        try {
           
            if (methodName == 'arr2obj') {
                return arr2obj(inputs, output, options);
            }
            
        } catch (Exception e) {
            output.put('Error', e.getMessage());
            output.put('ErrorLine', e.getLineNumber());
            output.put('ErrorStack', e.getStackTraceString());
        }
        return false;

    }

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

}