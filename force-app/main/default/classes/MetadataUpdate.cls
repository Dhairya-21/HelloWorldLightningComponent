public class MetadataUpdate implements Metadata.DeployCallback{
    public void handleResult(Metadata.DeployResult result, Metadata.DeployCallbackContext context){
        if(result == Metadata.DeployStatus.SUCCEEDED){
            System.debug('success ', result);
        }else {
            System.debug('failed', result);
        }
    }
    public static void HandleUpdate(String st, String st2, Map<String,Object> obj) {
        Metadata.CustomMetadata MCM = new Metadata.CustomMetadata();
        MCM.fullName = st;
        MCM.label = st2;
        for (String key : obj.keySet()) {
            Metadata.label CF = new Metadata.CustomMetadataValue();
            CF.field = key;
            CF.value = obj.get(key);
            MCM.values.add(CF);
        }

        
    }
}