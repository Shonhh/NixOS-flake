{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisablePocket = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
      	Value = true;
	Locked = true;
	Cryptomining = true;
	Fingerprinting = true;
      };
    };
  };
}
