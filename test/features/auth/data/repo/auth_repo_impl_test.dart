import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/features/auth/data/repo/auth_repo_impl.dart';
import 'package:restaurants/features/auth/domain/entities/user_entity.dart';

import '../../../../mocks/mocks.mocks.dart';

void main() {
  late MockAuthEmailServices mockAuthService;
  late AuthRepoImpl authRepo;
  late MockUser mockUser;

  setUp(() {
    mockAuthService = MockAuthEmailServices();
    mockUser = MockUser();
    authRepo = AuthRepoImpl(authServices: mockAuthService);
  });

  test('should return UserEntity when sign up succeeds', () async {
    // Arrange
    when(mockUser.id).thenReturn('123');
    when(mockUser.email).thenReturn('test@example.com');
    when(mockUser.userMetadata).thenReturn({
      'userName': 'hanafi',
      'numberPhone': '0100000000',
      'image': null,
    });

    when(
      mockAuthService.signUpWithEmail(any, any, any, any),
    ).thenAnswer((_) async => mockUser);

    // Act
    final result = await authRepo.signUpWithEmail(
      'hanafi',
      'test@example.com',
      '0100000000',
      'password123',
    );

    // Assert
    expect(result.isRight(), true);
    final user = result.getOrElse(() => throw Exception());
    expect(user, isA<UserEntity>());
    expect(user.id, '123');
    expect(user.email, 'test@example.com');
    expect(user.userName, 'hanafi');
    expect(user.numberPhone, '0100000000');
  });

  test(
    'should return EmailConfirmationPendingFailure when session is null',
    () async {
      // Arrange
      when(
        mockAuthService.signUpWithEmail(any, any, any, any),
      ).thenThrow(EmailConfirmationPendingFailure(message: 'البريد غير مفعل'));

      // Act
      final result = await authRepo.signUpWithEmail(
        'hanafi',
        'test@example.com',
        '0100000000',
        'password123',
      );

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<EmailConfirmationPendingFailure>()),
        (_) => fail('Expected failure'),
      );
    },
  );

  test('should return ServerFailure when exception occurs', () async {
    // Arrange
    when(
      mockAuthService.signUpWithEmail(any, any, any, any),
    ).thenThrow(Exception('حدث خطأ في السيرفر'));

    // Act
    final result = await authRepo.signUpWithEmail(
      'hanafi',
      'test@example.com',
      '0100000000',
      'password123',
    );

    // Assert
    expect(result.isLeft(), true);
    result.fold((failure) {
      expect(failure, isA<ServerFailure>());
      expect(failure.message, contains('حدث خطأ'));
    }, (_) => fail('Expected failure'));
  });
}
