import 'dart:async';
import 'package:flutter/material.dart';


class VerifyEmailScreen extends StatefulWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  int _seconds = 44;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  void _resendEmail() {
    if (_seconds == 0) {
      setState(() => _seconds = 44);
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6FA),
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Email Icon
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFE8EAF6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.mail_outline_rounded,
                size: 60,
                color: Color(0xFF1A2340),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Verify Your email',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "We've sent a verification link to\n${widget.email}",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Check your inbox and spam folder',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A2340),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Open Email App',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _resendEmail,
              child: Text(
                _seconds > 0
                    ? 'Resend Email (00:${_seconds.toString().padLeft(2, '0')})'
                    : 'Resend Email',
                style: TextStyle(
                  color: _seconds > 0 ? Colors.grey : const Color(0xFF1A2340),
                  fontWeight: _seconds > 0
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
