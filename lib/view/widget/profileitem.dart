import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';

class profileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const profileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(14),
          
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 20,
              decoration: BoxDecoration(
                // color: AppColor.primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColor.primaryColor),
            ),

            const SizedBox(width: 14),

            /// العنوان
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            /// السهم
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColor.grey,
            ),
          ],
        ),
      ),
    );
  }
}
