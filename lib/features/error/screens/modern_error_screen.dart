// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:smile_chat/utils/app_images.dart';

class ModernErrorScreen extends StatefulWidget {
  final FlutterErrorDetails? errorDetails;
  final String? title;
  final String? message;
  final VoidCallback? onGoHome;
  final VoidCallback? onRetry;
  final bool showErrorDetails;

  const ModernErrorScreen({
    super.key,
    this.errorDetails,
    this.title,
    this.message,
    this.onGoHome,
    this.onRetry,
    this.showErrorDetails = false,
  });

  @override
  State<ModernErrorScreen> createState() => _ModernErrorScreenState();
}

class _ModernErrorScreenState extends State<ModernErrorScreen>
    with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late AnimationController _fadeController;
  late AnimationController _slideController;

  Animation<double>? _bounceAnimation;
  Animation<double>? _fadeAnimation;
  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _bounceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.elasticOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    // Start animations with staggered delays
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _bounceController.forward();
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _slideController.forward();
    });
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  String _getErrorTitle() {
    if (widget.errorDetails != null) {
      final exception = widget.errorDetails!.exception;
      if (exception is FlutterError) {
        return 'App Error Occurred';
      } else if (exception is AssertionError) {
        return 'Something Unexpected Happened';
      } else if (exception.toString().contains('RenderFlex')) {
        return 'Layout Issue Detected';
      } else if (exception.toString().contains('Network') ||
          exception.toString().contains('Http')) {
        return 'Connection Problem';
      } else if (exception.toString().contains('Permission')) {
        return 'Permission Required';
      }
    }
    return 'Oops! Something went wrong';
  }

  String _getErrorMessage() {
    if (widget.errorDetails != null) {
      final exception = widget.errorDetails!.exception;
      if (exception is FlutterError) {
        return 'The app encountered a technical issue. Let\'s get you back on track!';
      } else if (exception is AssertionError) {
        return 'An unexpected condition occurred. No worries, let\'s head back home.';
      } else if (exception.toString().contains('RenderFlex')) {
        return 'There\'s a display issue with this screen. Going home will fix it.';
      } else if (exception.toString().contains('Network') ||
          exception.toString().contains('Http')) {
        return 'Unable to connect to our servers. Please check your connection.';
      } else if (exception.toString().contains('Permission')) {
        return 'We need certain permissions to continue. Please grant access.';
      }
    }
    return 'We encountered an unexpected error. Don\'t worry, it\'s not your fault!';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.surface,
              colorScheme.surfaceContainerHighest.withOpacity(0.2),
              colorScheme.primaryContainer.withOpacity(0.1),
            ],
            stops: const [0.0, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: size.height - 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Error Image with Floating Animation
                  AnimatedBuilder(
                    animation: _bounceController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _bounceAnimation?.value ?? 0.0,
                        child: FadeTransition(
                          opacity: _fadeAnimation ??
                              const AlwaysStoppedAnimation(0.0),
                          child: Container(
                            width: 240,
                            height: 240,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(120),
                              boxShadow: [
                                BoxShadow(
                                  color: colorScheme.primary.withOpacity(0.15),
                                  blurRadius: 40,
                                  spreadRadius: 8,
                                  offset: const Offset(0, 10),
                                ),
                                BoxShadow(
                                  color: colorScheme.surface,
                                  blurRadius: 20,
                                  spreadRadius: -5,
                                  offset: const Offset(0, -5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: Image.asset(
                                Assets.assetsImagesOops,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  // Fallback with beautiful gradient background
                                  return Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          colorScheme.errorContainer,
                                          colorScheme.errorContainer
                                              .withOpacity(0.8),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(120),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.sentiment_dissatisfied_rounded,
                                        size: 100,
                                        color: colorScheme.onErrorContainer,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 48),

                  // Error Title with Slide Animation
                  SlideTransition(
                    position: _slideAnimation ??
                        const AlwaysStoppedAnimation(Offset.zero),
                    child: FadeTransition(
                      opacity:
                          _fadeAnimation ?? const AlwaysStoppedAnimation(0.0),
                      child: Text(
                        widget.title ?? _getErrorTitle(),
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                          letterSpacing: -0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Error Message
                  SlideTransition(
                    position: _slideAnimation ??
                        const AlwaysStoppedAnimation(Offset.zero),
                    child: FadeTransition(
                      opacity:
                          _fadeAnimation ?? const AlwaysStoppedAnimation(0.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          widget.message ?? _getErrorMessage(),
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            height: 1.6,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Error Details (if enabled)
                  if (widget.showErrorDetails && widget.errorDetails != null)
                    SlideTransition(
                      position: _slideAnimation ??
                          const AlwaysStoppedAnimation(Offset.zero),
                      child: FadeTransition(
                        opacity:
                            _fadeAnimation ?? const AlwaysStoppedAnimation(0.0),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 32),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: colorScheme.outline.withOpacity(0.2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.code_rounded,
                                    size: 18,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Technical Details',
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                widget.errorDetails!.exception.toString(),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontFamily: 'Courier',
                                  fontSize: 12,
                                ),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  // Action Buttons
                  SlideTransition(
                    position: _slideAnimation ??
                        const AlwaysStoppedAnimation(Offset.zero),
                    child: FadeTransition(
                      opacity:
                          _fadeAnimation ?? const AlwaysStoppedAnimation(0.0),
                      child: Column(
                        children: [
                          // Go Home Button (Primary)
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: FilledButton.icon(
                              onPressed: widget.onGoHome ??
                                  () => Navigator.pop(context),
                              icon: const Icon(Icons.home_rounded, size: 22),
                              label: const Text(
                                'Go to Home',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: FilledButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 3,
                                shadowColor:
                                    colorScheme.primary.withOpacity(0.3),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Help Text
                  SlideTransition(
                    position: _slideAnimation ??
                        const AlwaysStoppedAnimation(Offset.zero),
                    child: FadeTransition(
                      opacity:
                          _fadeAnimation ?? const AlwaysStoppedAnimation(0.0),
                      child: TextButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Help & Support coming soon!'),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: colorScheme.inverseSurface,
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.help_outline_rounded,
                          size: 20,
                          color: colorScheme.onSurfaceVariant.withOpacity(0.8),
                        ),
                        label: Text(
                          'Need help? Contact support',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color:
                                colorScheme.onSurfaceVariant.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Example Usage
class ErrorScreenExample extends StatelessWidget {
  const ErrorScreenExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ModernErrorScreen(
      // Optional custom messages
      title: 'Oops! Something went wrong',
      message: 'Don\'t worry, we\'re here to help you get back on track!',

      // Show technical details (useful for development)
      showErrorDetails: true, // Set to false in production

      // Primary action - Go Home
      onGoHome: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/home',
          (route) => false,
        );
      },

      // Optional secondary action - Retry
      onRetry: () {
        // Retry the failed operation
        Navigator.of(context).pop();
      },
    );
  }
}
