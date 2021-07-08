/// Every failure retruned by the all repositories should be a subtype of this class.
abstract class Failure {}

/// Will be based in case of server failures.
class ServerFailure extends Failure {}

/// Will be passed in case of network failures.
class NoConnectionFailure extends Failure {}
