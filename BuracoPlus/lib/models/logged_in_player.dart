class PlayerStatisticsMonthly {
  String? itaScoreMonthly;
  int? itaVictoriesMonthly;
  int? itaLosesMonthly;
  int? itaGamesLeftMonthly;
  int? itaWinsInARowMonthly;
  int? itaNumberOfGamesMonthly;
  int? itaClubBonusPointsMonthly;
  int? itaMissionsBonusPointsMonthly;
  String? proScoreMonthly;
  int? proVictoriesMonthly;
  int? proLosesMonthly;
  int? proGamesLeftMonthly;
  int? proWinsInARowMonthly;
  int? proNumberOfGamesMonthly;
  int? proClubBonusPointsMonthly;
  int? proMissionsBonusPointsMonthly;
  int? proEventX2Monthly;
  int? itaEventX2Monthly;
  int? proEvent5WinsInARowMonthly;
  int? itaEvent5WinsInARowMonthly;

  PlayerStatisticsMonthly({
    this.itaScoreMonthly,
    this.itaVictoriesMonthly,
    this.itaLosesMonthly,
    this.itaGamesLeftMonthly,
    this.itaWinsInARowMonthly,
    this.itaNumberOfGamesMonthly,
    this.itaClubBonusPointsMonthly,
    this.itaMissionsBonusPointsMonthly,
    this.proScoreMonthly,
    this.proVictoriesMonthly,
    this.proLosesMonthly,
    this.proGamesLeftMonthly,
    this.proWinsInARowMonthly,
    this.proNumberOfGamesMonthly,
    this.proClubBonusPointsMonthly,
    this.proMissionsBonusPointsMonthly,
    this.proEventX2Monthly,
    this.itaEventX2Monthly,
    this.proEvent5WinsInARowMonthly,
    this.itaEvent5WinsInARowMonthly,
  });
  PlayerStatisticsMonthly.fromJson(Map<String, dynamic> json) {
    itaScoreMonthly = json['itaScoreMonthly']?.toString();
    itaVictoriesMonthly =
        int.tryParse(json['itaVictoriesMonthly']?.toString() ?? '');
    itaLosesMonthly = int.tryParse(json['itaLosesMonthly']?.toString() ?? '');
    itaGamesLeftMonthly =
        int.tryParse(json['itaGamesLeftMonthly']?.toString() ?? '');
    itaWinsInARowMonthly =
        int.tryParse(json['itaWinsInARowMonthly']?.toString() ?? '');
    itaNumberOfGamesMonthly =
        int.tryParse(json['itaNumberOfGamesMonthly']?.toString() ?? '');
    itaClubBonusPointsMonthly =
        int.tryParse(json['itaClubBonusPointsMonthly']?.toString() ?? '');
    itaMissionsBonusPointsMonthly =
        int.tryParse(json['itaMissionsBonusPointsMonthly']?.toString() ?? '');
    proScoreMonthly = json['proScoreMonthly']?.toString();
    proVictoriesMonthly =
        int.tryParse(json['proVictoriesMonthly']?.toString() ?? '');
    proLosesMonthly = int.tryParse(json['proLosesMonthly']?.toString() ?? '');
    proGamesLeftMonthly =
        int.tryParse(json['proGamesLeftMonthly']?.toString() ?? '');
    proWinsInARowMonthly =
        int.tryParse(json['proWinsInARowMonthly']?.toString() ?? '');
    proNumberOfGamesMonthly =
        int.tryParse(json['proNumberOfGamesMonthly']?.toString() ?? '');
    proClubBonusPointsMonthly =
        int.tryParse(json['proClubBonusPointsMonthly']?.toString() ?? '');
    proMissionsBonusPointsMonthly =
        int.tryParse(json['proMissionsBonusPointsMonthly']?.toString() ?? '');
    proEventX2Monthly =
        int.tryParse(json['proEventX2Monthly']?.toString() ?? '');
    itaEventX2Monthly =
        int.tryParse(json['itaEventX2Monthly']?.toString() ?? '');
    proEvent5WinsInARowMonthly =
        int.tryParse(json['proEvent5WinsInARowMonthly']?.toString() ?? '');
    itaEvent5WinsInARowMonthly =
        int.tryParse(json['itaEvent5WinsInARowMonthly']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['itaScoreMonthly'] = itaScoreMonthly;
    data['itaVictoriesMonthly'] = itaVictoriesMonthly;
    data['itaLosesMonthly'] = itaLosesMonthly;
    data['itaGamesLeftMonthly'] = itaGamesLeftMonthly;
    data['itaWinsInARowMonthly'] = itaWinsInARowMonthly;
    data['itaNumberOfGamesMonthly'] = itaNumberOfGamesMonthly;
    data['itaClubBonusPointsMonthly'] = itaClubBonusPointsMonthly;
    data['itaMissionsBonusPointsMonthly'] = itaMissionsBonusPointsMonthly;
    data['proScoreMonthly'] = proScoreMonthly;
    data['proVictoriesMonthly'] = proVictoriesMonthly;
    data['proLosesMonthly'] = proLosesMonthly;
    data['proGamesLeftMonthly'] = proGamesLeftMonthly;
    data['proWinsInARowMonthly'] = proWinsInARowMonthly;
    data['proNumberOfGamesMonthly'] = proNumberOfGamesMonthly;
    data['proClubBonusPointsMonthly'] = proClubBonusPointsMonthly;
    data['proMissionsBonusPointsMonthly'] = proMissionsBonusPointsMonthly;
    data['proEventX2Monthly'] = proEventX2Monthly;
    data['itaEventX2Monthly'] = itaEventX2Monthly;
    data['proEvent5WinsInARowMonthly'] = proEvent5WinsInARowMonthly;
    data['itaEvent5WinsInARowMonthly'] = itaEvent5WinsInARowMonthly;
    return data;
  }
}

class PlayerStatistics {
  String? itaScore;
  int? itaVictories;
  int? itaLoses;
  int? itaGamesLeft;
  int? itaWinsInARow;
  int? itaNumberOfGames;
  int? itaClubBonusPoints;
  int? itaMissionsBonusPoints;
  String? proScore;
  int? proVictories;
  int? proLoses;
  int? proGamesLeft;
  int? proWinsInARow;
  int? proNumberOfGames;
  int? proClubBonusPoints;
  int? proMissionsBonusPoints;
  int? proEventX2;
  int? itaEventX2;
  int? proEvent5WinsInARow;
  int? itaEvent5WinsInARow;

  PlayerStatistics({
    this.itaScore,
    this.itaVictories,
    this.itaLoses,
    this.itaGamesLeft,
    this.itaWinsInARow,
    this.itaNumberOfGames,
    this.itaClubBonusPoints,
    this.itaMissionsBonusPoints,
    this.proScore,
    this.proVictories,
    this.proLoses,
    this.proGamesLeft,
    this.proWinsInARow,
    this.proNumberOfGames,
    this.proClubBonusPoints,
    this.proMissionsBonusPoints,
    this.proEventX2,
    this.itaEventX2,
    this.proEvent5WinsInARow,
    this.itaEvent5WinsInARow,
  });
  PlayerStatistics.fromJson(Map<String, dynamic> json) {
    itaScore = json['itaScore']?.toString();
    itaVictories = int.tryParse(json['itaVictories']?.toString() ?? '');
    itaLoses = int.tryParse(json['itaLoses']?.toString() ?? '');
    itaGamesLeft = int.tryParse(json['itaGamesLeft']?.toString() ?? '');
    itaWinsInARow = int.tryParse(json['itaWinsInARow']?.toString() ?? '');
    itaNumberOfGames = int.tryParse(json['itaNumberOfGames']?.toString() ?? '');
    itaClubBonusPoints =
        int.tryParse(json['itaClubBonusPoints']?.toString() ?? '');
    itaMissionsBonusPoints =
        int.tryParse(json['itaMissionsBonusPoints']?.toString() ?? '');
    proScore = json['proScore']?.toString();
    proVictories = int.tryParse(json['proVictories']?.toString() ?? '');
    proLoses = int.tryParse(json['proLoses']?.toString() ?? '');
    proGamesLeft = int.tryParse(json['proGamesLeft']?.toString() ?? '');
    proWinsInARow = int.tryParse(json['proWinsInARow']?.toString() ?? '');
    proNumberOfGames = int.tryParse(json['proNumberOfGames']?.toString() ?? '');
    proClubBonusPoints =
        int.tryParse(json['proClubBonusPoints']?.toString() ?? '');
    proMissionsBonusPoints =
        int.tryParse(json['proMissionsBonusPoints']?.toString() ?? '');
    proEventX2 = int.tryParse(json['proEventX2']?.toString() ?? '');
    itaEventX2 = int.tryParse(json['itaEventX2']?.toString() ?? '');
    proEvent5WinsInARow =
        int.tryParse(json['proEvent5WinsInARow']?.toString() ?? '');
    itaEvent5WinsInARow =
        int.tryParse(json['itaEvent5WinsInARow']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['itaScore'] = itaScore;
    data['itaVictories'] = itaVictories;
    data['itaLoses'] = itaLoses;
    data['itaGamesLeft'] = itaGamesLeft;
    data['itaWinsInARow'] = itaWinsInARow;
    data['itaNumberOfGames'] = itaNumberOfGames;
    data['itaClubBonusPoints'] = itaClubBonusPoints;
    data['itaMissionsBonusPoints'] = itaMissionsBonusPoints;
    data['proScore'] = proScore;
    data['proVictories'] = proVictories;
    data['proLoses'] = proLoses;
    data['proGamesLeft'] = proGamesLeft;
    data['proWinsInARow'] = proWinsInARow;
    data['proNumberOfGames'] = proNumberOfGames;
    data['proClubBonusPoints'] = proClubBonusPoints;
    data['proMissionsBonusPoints'] = proMissionsBonusPoints;
    data['proEventX2'] = proEventX2;
    data['itaEventX2'] = itaEventX2;
    data['proEvent5WinsInARow'] = proEvent5WinsInARow;
    data['itaEvent5WinsInARow'] = itaEvent5WinsInARow;
    return data;
  }
}

class LoggedInPlayer {
  PlayerStatistics? playerStatistics;
  PlayerStatisticsMonthly? playerStatisticsMonthly;
  String? Id;
  int? oldId;
  String? playerName;
  String? avatarUrl;
  String? email;
  String? userCreatedAt;
  String? userUpdatedAt;
  String? avatarUpdatedAt;
  int? clubPoints;
  int? origination;
  String? userData;
  String? password;
  String? lastLoginDate;
  int? isActive;
  String? activationToken;
  String? lastMessageOpenedDatetime;
  String? lastMessageNotificationDatetime;
  String? lastFriendRequestOpenedDateTime;
  String? lastFriendRequestNotificationDatetime;
  int? isPowerAdmin;
  String? verifyEmailSentResponse;
  String? lastPersonalNotificationsOpenedDateTime;
  String? lastPersonalNotificationsNotificationDatetime;
  String? lastPersonalClubNotificationsOpenedDateTime;
  String? lastPersonalClubNotificationsNotificationDatetime;
  int? coins;
  int? gamesCount;
  String? resetAt;
  int? videoAdWatched;
  int? playerWatchCount;
  String? playerWatchCountResetAt;
  int? lives;
  int? isSubscriptionActive;
  String? subscriptionEndAt;
  String? subscriptionCreatedAt;
  String? subscriptionUpdatedAt;
  int? diamonds;
  int? preferredLobby;
  int? systemSounds;
  int? trill;
  int? manualSorting;
  int? topCardsRotation;
  int? curvedCards;
  String? language;
  int? cardFront;
  int? cardRear;
  int? tableBg;
  int? acceptingFriendsRequest;
  int? acceptingClubsInvites;
  int? acceptingTablesInvites;
  String? mutedPlayersIds;
  int? nicknameChangingCounter;
  String? customTableOptions;
  int? appId;

  LoggedInPlayer({
    this.playerStatistics,
    this.playerStatisticsMonthly,
    this.Id,
    this.oldId,
    this.playerName,
    this.avatarUrl,
    this.email,
    this.userCreatedAt,
    this.userUpdatedAt,
    this.avatarUpdatedAt,
    this.clubPoints,
    this.origination,
    this.userData,
    this.password,
    this.lastLoginDate,
    this.isActive,
    this.activationToken,
    this.lastMessageOpenedDatetime,
    this.lastMessageNotificationDatetime,
    this.lastFriendRequestOpenedDateTime,
    this.lastFriendRequestNotificationDatetime,
    this.isPowerAdmin,
    this.verifyEmailSentResponse,
    this.lastPersonalNotificationsOpenedDateTime,
    this.lastPersonalNotificationsNotificationDatetime,
    this.lastPersonalClubNotificationsOpenedDateTime,
    this.lastPersonalClubNotificationsNotificationDatetime,
    this.coins,
    this.gamesCount,
    this.resetAt,
    this.videoAdWatched,
    this.playerWatchCount,
    this.playerWatchCountResetAt,
    this.lives,
    this.isSubscriptionActive,
    this.subscriptionEndAt,
    this.subscriptionCreatedAt,
    this.subscriptionUpdatedAt,
    this.diamonds,
    this.preferredLobby,
    this.systemSounds,
    this.trill,
    this.manualSorting,
    this.topCardsRotation,
    this.curvedCards,
    this.language,
    this.cardFront,
    this.cardRear,
    this.tableBg,
    this.acceptingFriendsRequest,
    this.acceptingClubsInvites,
    this.acceptingTablesInvites,
    this.mutedPlayersIds,
    this.nicknameChangingCounter,
    this.customTableOptions,
    this.appId,
  });
  LoggedInPlayer.fromJson(Map<String, dynamic> json) {
    playerStatistics =
        (json['playerStatistics'] != null && (json['playerStatistics'] is Map))
            ? PlayerStatistics.fromJson(json['playerStatistics'])
            : null;
    playerStatisticsMonthly = (json['playerStatisticsMonthly'] != null &&
            (json['playerStatisticsMonthly'] is Map))
        ? PlayerStatisticsMonthly.fromJson(json['playerStatisticsMonthly'])
        : null;
    Id = json['_id']?.toString();
    oldId = int.tryParse(json['oldId']?.toString() ?? '');
    playerName = json['playerName']?.toString();
    avatarUrl = json['avatarUrl']?.toString();
    email = json['email']?.toString();
    userCreatedAt = json['userCreatedAt']?.toString();
    userUpdatedAt = json['userUpdatedAt']?.toString();
    avatarUpdatedAt = json['avatarUpdatedAt']?.toString();
    clubPoints = int.tryParse(json['clubPoints']?.toString() ?? '');
    origination = int.tryParse(json['origination']?.toString() ?? '');
    userData = json['userData']?.toString();
    password = json['password']?.toString();
    lastLoginDate = json['lastLoginDate']?.toString();
    isActive = int.tryParse(json['isActive']?.toString() ?? '');
    activationToken = json['activationToken']?.toString();
    lastMessageOpenedDatetime = json['lastMessageOpenedDatetime']?.toString();
    lastMessageNotificationDatetime =
        json['lastMessageNotificationDatetime']?.toString();
    lastFriendRequestOpenedDateTime =
        json['lastFriendRequestOpenedDateTime']?.toString();
    lastFriendRequestNotificationDatetime =
        json['lastFriendRequestNotificationDatetime']?.toString();
    isPowerAdmin = int.tryParse(json['isPowerAdmin']?.toString() ?? '');
    verifyEmailSentResponse = json['verifyEmailSentResponse']?.toString();
    lastPersonalNotificationsOpenedDateTime =
        json['lastPersonalNotificationsOpenedDateTime']?.toString();
    lastPersonalNotificationsNotificationDatetime =
        json['lastPersonalNotificationsNotificationDatetime']?.toString();
    lastPersonalClubNotificationsOpenedDateTime =
        json['lastPersonalClubNotificationsOpenedDateTime']?.toString();
    lastPersonalClubNotificationsNotificationDatetime =
        json['lastPersonalClubNotificationsNotificationDatetime']?.toString();
    coins = int.tryParse(json['coins']?.toString() ?? '');
    gamesCount = int.tryParse(json['gamesCount']?.toString() ?? '');
    resetAt = json['resetAt']?.toString();
    videoAdWatched = int.tryParse(json['videoAdWatched']?.toString() ?? '');
    playerWatchCount = int.tryParse(json['playerWatchCount']?.toString() ?? '');
    playerWatchCountResetAt = json['playerWatchCountResetAt']?.toString();
    lives = int.tryParse(json['lives']?.toString() ?? '');
    isSubscriptionActive =
        int.tryParse(json['isSubscriptionActive']?.toString() ?? '');
    subscriptionEndAt = json['subscriptionEndAt']?.toString();
    subscriptionCreatedAt = json['subscriptionCreatedAt']?.toString();
    subscriptionUpdatedAt = json['subscriptionUpdatedAt']?.toString();
    diamonds = int.tryParse(json['diamonds']?.toString() ?? '');
    preferredLobby = int.tryParse(json['preferredLobby']?.toString() ?? '');
    systemSounds = int.tryParse(json['systemSounds']?.toString() ?? '');
    trill = int.tryParse(json['trill']?.toString() ?? '');
    manualSorting = int.tryParse(json['manualSorting']?.toString() ?? '');
    topCardsRotation = int.tryParse(json['topCardsRotation']?.toString() ?? '');
    curvedCards = int.tryParse(json['curvedCards']?.toString() ?? '');
    language = json['language']?.toString();
    cardFront = int.tryParse(json['cardFront']?.toString() ?? '');
    cardRear = int.tryParse(json['cardRear']?.toString() ?? '');
    tableBg = int.tryParse(json['tableBg']?.toString() ?? '');
    acceptingFriendsRequest =
        int.tryParse(json['acceptingFriendsRequest']?.toString() ?? '');
    acceptingClubsInvites =
        int.tryParse(json['acceptingClubsInvites']?.toString() ?? '');
    acceptingTablesInvites =
        int.tryParse(json['acceptingTablesInvites']?.toString() ?? '');
    mutedPlayersIds = json['mutedPlayersIds']?.toString();
    nicknameChangingCounter =
        int.tryParse(json['nicknameChangingCounter']?.toString() ?? '');
    customTableOptions = json['customTableOptions']?.toString();
    appId = int.tryParse(json['appId']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (playerStatistics != null) {
      data['playerStatistics'] = playerStatistics!.toJson();
    }
    if (playerStatisticsMonthly != null) {
      data['playerStatisticsMonthly'] = playerStatisticsMonthly!.toJson();
    }
    data['_id'] = Id;
    data['oldId'] = oldId;
    data['playerName'] = playerName;
    data['avatarUrl'] = avatarUrl;
    data['email'] = email;
    data['userCreatedAt'] = userCreatedAt;
    data['userUpdatedAt'] = userUpdatedAt;
    data['avatarUpdatedAt'] = avatarUpdatedAt;
    data['clubPoints'] = clubPoints;
    data['origination'] = origination;
    data['userData'] = userData;
    data['password'] = password;
    data['lastLoginDate'] = lastLoginDate;
    data['isActive'] = isActive;
    data['activationToken'] = activationToken;
    data['lastMessageOpenedDatetime'] = lastMessageOpenedDatetime;
    data['lastMessageNotificationDatetime'] = lastMessageNotificationDatetime;
    data['lastFriendRequestOpenedDateTime'] = lastFriendRequestOpenedDateTime;
    data['lastFriendRequestNotificationDatetime'] =
        lastFriendRequestNotificationDatetime;
    data['isPowerAdmin'] = isPowerAdmin;
    data['verifyEmailSentResponse'] = verifyEmailSentResponse;
    data['lastPersonalNotificationsOpenedDateTime'] =
        lastPersonalNotificationsOpenedDateTime;
    data['lastPersonalNotificationsNotificationDatetime'] =
        lastPersonalNotificationsNotificationDatetime;
    data['lastPersonalClubNotificationsOpenedDateTime'] =
        lastPersonalClubNotificationsOpenedDateTime;
    data['lastPersonalClubNotificationsNotificationDatetime'] =
        lastPersonalClubNotificationsNotificationDatetime;
    data['coins'] = coins;
    data['gamesCount'] = gamesCount;
    data['resetAt'] = resetAt;
    data['videoAdWatched'] = videoAdWatched;
    data['playerWatchCount'] = playerWatchCount;
    data['playerWatchCountResetAt'] = playerWatchCountResetAt;
    data['lives'] = lives;
    data['isSubscriptionActive'] = isSubscriptionActive;
    data['subscriptionEndAt'] = subscriptionEndAt;
    data['subscriptionCreatedAt'] = subscriptionCreatedAt;
    data['subscriptionUpdatedAt'] = subscriptionUpdatedAt;
    data['diamonds'] = diamonds;
    data['preferredLobby'] = preferredLobby;
    data['systemSounds'] = systemSounds;
    data['trill'] = trill;
    data['manualSorting'] = manualSorting;
    data['topCardsRotation'] = topCardsRotation;
    data['curvedCards'] = curvedCards;
    data['language'] = language;
    data['cardFront'] = cardFront;
    data['cardRear'] = cardRear;
    data['tableBg'] = tableBg;
    data['acceptingFriendsRequest'] = acceptingFriendsRequest;
    data['acceptingClubsInvites'] = acceptingClubsInvites;
    data['acceptingTablesInvites'] = acceptingTablesInvites;
    data['mutedPlayersIds'] = mutedPlayersIds;
    data['nicknameChangingCounter'] = nicknameChangingCounter;
    data['customTableOptions'] = customTableOptions;
    data['appId'] = appId;
    return data;
  }
}
