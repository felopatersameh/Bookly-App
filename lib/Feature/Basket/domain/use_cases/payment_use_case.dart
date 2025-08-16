import 'package:dartz/dartz.dart';
import '../../../../Core/Utils/Errors/failure.dart';
import '../../data/repositories/payment_repo.dart';
import '../Entities/payment_input_entities.dart';

class PaymentUseCase {
  final PaymentRepo paymentRepo;
  PaymentUseCase(this.paymentRepo);
  Future<Either<Failure, bool>> execute({
    required PaymentInputEntities paymentInputEntities,
  }) async {
    return await paymentRepo.makePaymentIntent(
      paymentInputEntities: paymentInputEntities,
    );
  }
}
