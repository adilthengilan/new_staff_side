import 'package:flutter/foundation.dart';
import 'package:tuchtrip_staff_portal/view/Service%20Requests/service_requests.dart';

class RequestProvider extends ChangeNotifier {
  List<Request> _requests = [
    Request(
        needs: 'Wash and iron two shirts',
        date: '2024-07-31',
        time: '08:30 AM',
        number: 102,
        type: 'Single',
        status: 'Pending'),
    Request(
        needs: 'Dry clean suit',
        date: '2024-07-31',
        time: '07:00 PM',
        number: 205,
        type: 'Double',
        status: 'Pending'),
    Request(
        needs: 'Wash and fold bed linens',
        date: '2024-08-01',
        time: '12:00 PM',
        number: 101,
        type: 'Single',
        status: 'Delivered'),
    Request(
        needs: 'Emergency stain removal from dress',
        date: '2024-08-01',
        time: '03:00 PM',
        number: 111,
        type: 'Single',
        status: 'Declined'),
  ];

  List<Request> get requests => _requests;

  void updateStatus(int index, String status) {
    _requests[index].status = status;
    notifyListeners();
  }
}
