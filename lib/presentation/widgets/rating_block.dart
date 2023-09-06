import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/colors.dart';

class RatingBlock extends StatelessWidget {
  final int? rating;
  final String? ratingName;

  const RatingBlock({super.key, this.rating, this.ratingName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.yellow.withOpacity(.2),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: AppColors.yellow,
          ),
          Text(
            '${rating ?? 0} ${ratingName ?? ''}',
            style: const TextStyle(
                color: AppColors.yellow,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
