import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TimeFormatter {
  /// Formats timestamp to WhatsApp-style time display
  /// - If today: shows time (e.g., "10:30 AM")
  /// - If yesterday: shows "Yesterday"
  /// - If this week: shows day name (e.g., "Monday")
  /// - If older: shows date (e.g., "23/07/2023")
  static String formatChatTime(Timestamp timestamp) {
    final DateTime messageTime = timestamp.toDate();
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime yesterday = today.subtract(const Duration(days: 1));
    final DateTime messageDate =
        DateTime(messageTime.year, messageTime.month, messageTime.day);

    // If message is from today
    if (messageDate == today) {
      return DateFormat('h:mm a').format(messageTime); // "10:30 AM"
    }

    // If message is from yesterday
    if (messageDate == yesterday) {
      return 'Yesterday';
    }

    // If message is from this week (last 7 days)
    final Duration difference = today.difference(messageDate);
    if (difference.inDays <= 6) {
      return DateFormat('EEEE').format(messageTime); // "Monday"
    }

    // If message is older than a week
    return DateFormat('dd/MM/yyyy').format(messageTime); // "23/07/2023"
  }

  /// Alternative format that shows more detail for recent messages
  static String formatChatTimeDetailed(Timestamp timestamp) {
    final DateTime messageTime = timestamp.toDate();
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime yesterday = today.subtract(const Duration(days: 1));
    final DateTime messageDate =
        DateTime(messageTime.year, messageTime.month, messageTime.day);

    // If message is from today
    if (messageDate == today) {
      final Duration timeDiff = now.difference(messageTime);

      if (timeDiff.inMinutes < 1) {
        return 'now';
      } else if (timeDiff.inHours < 1) {
        return '${timeDiff.inMinutes}m ago';
      } else {
        return DateFormat('h:mm a').format(messageTime);
      }
    }

    // If message is from yesterday
    if (messageDate == yesterday) {
      return 'Yesterday';
    }

    // If message is from this week
    final Duration difference = today.difference(messageDate);
    if (difference.inDays <= 6) {
      return DateFormat('EEEE').format(messageTime);
    }

    // If message is older than a week but this year
    if (messageTime.year == now.year) {
      return DateFormat('MMM dd').format(messageTime); // "Jul 23"
    }

    // If message is from previous years
    return DateFormat('dd/MM/yy').format(messageTime); // "23/07/23"
  }

  /// Format for message bubbles inside chat (more detailed)
  static String formatMessageTime(Timestamp timestamp) {
    final DateTime messageTime = timestamp.toDate();
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime messageDate =
        DateTime(messageTime.year, messageTime.month, messageTime.day);

    if (messageDate == today) {
      return DateFormat('h:mm a').format(messageTime);
    } else if (messageDate == today.subtract(const Duration(days: 1))) {
      return 'Yesterday ${DateFormat('h:mm a').format(messageTime)}';
    } else {
      return DateFormat('MMM dd, h:mm a').format(messageTime);
    }
  }
}
