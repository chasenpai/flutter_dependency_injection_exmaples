import 'package:flutter/material.dart';
import 'package:note/domain/uitl/note_order.dart';
import 'package:note/domain/uitl/order_type.dart';

class OrderSection extends StatelessWidget {
  final NoteOrder noteOrder;
  final Function(NoteOrder order) onOrderChanged;

  const OrderSection({
    required this.noteOrder,
    required this.onOrderChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const testStyle = TextStyle(
      fontSize: 16.0,
      color: Colors.white,
    );
    return Column(
      children: [
        Row(
          children: [
            Radio<NoteOrder>(
              value: NoteOrder.title(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.title(noteOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text(
              'Title',
              style: testStyle,
            ),
            Radio<NoteOrder>(
              value: NoteOrder.date(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.date(noteOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text(
              'Date',
              style: testStyle,
            ),
            Radio<NoteOrder>(
              value: NoteOrder.color(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.color(noteOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text(
              'Color',
              style: testStyle,
            ),
          ],
        ),
        Row(
          children: [
            Radio<OrderType>(
              value: const OrderType.asc(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChanged(noteOrder.copyWith(
                  orderType: const OrderType.asc(),
                ));
              },
              activeColor: Colors.white,
            ),
            const Text(
              'Asc',
              style: testStyle,
            ),
            Radio<OrderType>(
              value: const OrderType.desc(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChanged(noteOrder.copyWith(
                  orderType: const OrderType.desc(),
                ));
              },
              activeColor: Colors.white,
            ),
            const Text(
              'Desc',
              style: testStyle,
            ),
          ],
        ),
      ],
    );
  }
}
