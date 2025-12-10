{ inputs, config, ... }:
{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;

    quickCss = builtins.readFile ./discord.css;

    config = {
      useQuickCss = true;

      plugins = {
        anonymiseFileNames.enable = true;
        betterGifAltText.enable = true;
        betterGifPicker.enable = true;
        betterRoleContext.enable = true;
        betterRoleDot.enable = true;
        betterSessions.enable = true;
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        blurNsfw.enable = true;
        callTimer.enable = true;
        clearUrLs.enable = true;

        clientTheme = {
          enable = true;
          color = config.lib.stylix.colors.base00;
        };

        copyFileContents.enable = true;
        copyUserUrLs.enable = true;
        customRpc.enable = true;
        dearrow.enable = true;
        dontRoundMyTimestamps.enable = true;
        fakeNitro.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        gameActivityToggle.enable = true;
        imageZoom.enable = true;
        implicitRelationships.enable = true;
        keepCurrentChannel.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageClickActions.enable = true;
        messageLinkEmbeds.enable = true;
        messageLogger.enable = true;
        noUnblockToJump.enable = true;
        openInApp.enable = true;
        permissionFreeWill.enable = true;
        platformIndicators.enable = true;
        relationshipNotifier.enable = true;
        revealAllSpoilers.enable = true;
        roleColorEverywhere.enable = true;
        serverInfo.enable = true;
        shikiCodeblocks.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;

        showMeYourName = {
          enable = true;
        };

        showTimeoutDuration.enable = true;
        sortFriendRequests.enable = true;
        spotifyCrack.enable = true;
        spotifyShareCommands.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        unlockedAvatarZoom.enable = true;
        userVoiceShow.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        volumeBooster.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
