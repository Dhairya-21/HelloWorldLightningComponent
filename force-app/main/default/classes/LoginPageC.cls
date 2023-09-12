public with sharing class LoginPageC {
    public PageReference Register() {
        PageReference Fp = new PageReference('/apex/Register');
        Fp.setRedirect(False);
        return Fp;
    }
}