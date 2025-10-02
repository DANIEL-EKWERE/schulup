// import 'package:flutter/material.dart';
// import 'package:schoolruns/presentation/iphone1415proeightyonescreen/scan_mobile_checkin.dart';
import 'package:schoolruns/presentation/sign_five_screen/controller/sign_five_controller.dart';
// import 'package:usb_serial/usb_serial.dart';
// import 'dart:async';
// import 'dart:typed_data';

// import '../../core/app_export.dart';

// SignFiveController controller = Get.find<SignFiveController>();

// class RegisterCard extends StatefulWidget {
//   const RegisterCard({super.key});

//   @override
//   _RegisterCardState createState() => _RegisterCardState();
// }

// class _RegisterCardState extends State<RegisterCard> {
//   UsbPort? _port;
//   String _status = "Disconnected";
//   String _cardId = "";
//   List<String> _scannedCards = [];
//   StreamSubscription<String>? _subscription;

//   @override
//   void initState() {
//     super.initState();
//     _connectToDevice();
//   }

//   Future<void> _connectToDevice() async {
//     List<UsbDevice> devices = await UsbSerial.listDevices();

//     if (devices.isEmpty) {
//       setState(() {
//         _status = "No USB devices found";
//       });
//       return;
//     }

//     // Connect to first available device
//     UsbDevice device = devices[0];
//     _port = await device.create();

//     bool openResult = await _port!.open();
//     if (!openResult) {
//       setState(() {
//         _status = "Failed to open USB device";
//       });
//       return;
//     }

//     await _port!.setDTR(true);
//     await _port!.setRTS(true);

//     // Common RFID reader settings
//     await _port!.setPortParameters(
//       9600, // Baud rate (adjust based on your reader)
//       UsbPort.DATABITS_8,
//       UsbPort.STOPBITS_1,
//       UsbPort.PARITY_NONE,
//     );

//     setState(() {
//       _status = "Connected to RFID Reader";
//     });

//     // Listen for card data
//     _subscription = _port!.inputStream
//         ?.map((Uint8List data) {
//           return String.fromCharCodes(data);
//         })
//         .listen((String data) {
//           _handleCardData(data);
//         });
//   }

//   void _handleCardData(String data) {
//     setState(() {
//       _cardId += data;

//       // Check if we have a complete card ID (usually ends with newline or specific length)
//       if (_cardId.contains('\n') || _cardId.length >= 10) {
//         String cleanId = _cardId.trim();
//         if (cleanId.isNotEmpty && !_scannedCards.contains(cleanId)) {
//           _scannedCards.insert(0, cleanId);
//           _showCardScannedDialog(cleanId);
//           print('calling here');
//           Get.snackbar(
//             "Success",
//             "Card Registered Successfully \n calling the register function",
//           );
//           controller.registerCard(cleanId);
//         }
//         _cardId = "";
//       }
//     });
//   }

//   void _showCardScannedDialog(String cardId) {
//     showDialog(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             title: Text('Card Scanned'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.credit_card, size: 64, color: Colors.green),
//                 SizedBox(height: 16),
//                 Text('Card ID: $cardId', style: TextStyle(fontSize: 18)),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//     );
//   }

//   @override
//   void dispose() {
//     _subscription?.cancel();
//     _port?.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.chevron_left),
//           onPressed: () => Get.back(),
//         ),
//         title: Text(
//           'Register RFID Card',
//           style: CustomTextStyles.titleSmallPoppinsGray800,
//         ),
//         // backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // ElevatedButton(
//             //   onPressed: () {
//             //     //controller.registerCard();
//             //   },
//             //   child: Text('Register Card'),
//             // ),
//             Card(
//               elevation: 4,
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Icon(
//                       _status.contains("Connected") ? Icons.usb : Icons.usb_off,
//                       size: 48,
//                       color:
//                           _status.contains("Connected")
//                               ? Colors.green
//                               : Colors.red,
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       _status,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             if (_status.contains("Connected"))
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade50,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.blue.shade200),
//                 ),
//                 child: Column(
//                   children: [
//                     Icon(Icons.nfc, size: 48, color: Colors.blue),
//                     SizedBox(height: 8),
//                     Text('Ready to scan cards', style: TextStyle(fontSize: 16)),
//                     SizedBox(height: 4),
//                     Text(
//                       'Tap or swipe an ID card',
//                       style: TextStyle(fontSize: 12, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Scanned Cards',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.refresh),
//                   onPressed: _connectToDevice,
//                   tooltip: 'Reconnect',
//                 ),
//               ],
//             ),
//             Divider(),
//             Expanded(
//               child:
//                   _scannedCards.isEmpty
//                       ? Center(
//                         child: Text(
//                           'No cards scanned yet',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       )
//                       : ListView.builder(
//                         itemCount: _scannedCards.length,
//                         itemBuilder: (context, index) {
//                           return Card(
//                             margin: EdgeInsets.symmetric(vertical: 4),
//                             child: ListTile(
//                               leading: CircleAvatar(
//                                 child: Text('${index + 1}'),
//                                 backgroundColor: Colors.blue,
//                               ),
//                               title: Text(
//                                 _scannedCards[index],
//                                 style: TextStyle(fontFamily: 'monospace'),
//                               ),
//                               subtitle: Text('Scanned'),
//                               trailing: IconButton(
//                                 icon: Icon(Icons.delete, color: Colors.red),
//                                 onPressed: () {
//                                   setState(() {
//                                     _scannedCards.removeAt(index);
//                                   });
//                                 },
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import '../../core/app_export.dart';

SignFiveController controller = Get.put<SignFiveController>(
  SignFiveController(),
);

class RegisterCard extends StatefulWidget {
  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  String _status = "Ready";
  String _cardBuffer = "";
  List<CardScan> _scannedCards = [];
  Timer? _bufferTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    String text = _controller.text;

    if (text.isEmpty) return;

    // Cancel previous timer
    _bufferTimer?.cancel();

    // Check if text contains newline (Enter key pressed)
    if (text.contains('\n')) {
      String cardId = text.replaceAll('\n', '').trim();
      if (cardId.isNotEmpty) {
        _processCardId(cardId);
      }
      _controller.clear();
      _cardBuffer = "";
    } else {
      // Set timer to process if no more input comes
      _cardBuffer = text;
      _bufferTimer = Timer(Duration(milliseconds: 500), () {
        if (_cardBuffer.isNotEmpty) {
          _processCardId(_cardBuffer.trim());
          _controller.clear();
          _cardBuffer = "";
        }
      });
    }
  }

  void _processCardId(String cardId) {
    // Filter out non-alphanumeric characters if needed
    cardId = cardId.replaceAll(RegExp(r'[^\w\s]'), '');

    if (cardId.isEmpty || cardId.length < 4) return;

    // Avoid duplicate scans within 2 seconds
    final now = DateTime.now();
    if (_scannedCards.isNotEmpty) {
      final lastScan = _scannedCards.first;
      if (lastScan.cardId == cardId &&
          now.difference(lastScan.timestamp).inSeconds < 2) {
        return;
      }
    }

    setState(() {
      _scannedCards.insert(0, CardScan(cardId: cardId, timestamp: now));
      _status = "Card Scanned!";
    });
    controller.registerCard(cardId);
    _showCardDialog(cardId);

    // Reset status after 2 seconds
    Timer(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _status = "Ready";
        });
      }
    });
  }

  void _showCardDialog(String cardId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 32),
                SizedBox(width: 12),
                Text('Card Scanned'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card ID:',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Text(
                    cardId,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _focusNode.requestFocus();
                },
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  void _clearHistory() {
    setState(() {
      _scannedCards.clear();
    });
  }

  @override
  void dispose() {
    _bufferTimer?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Register RFID Card',
          style: CustomTextStyles.titleSmallPoppinsGray800,
        ),

        // backgroundColor: Colors.blue,
        actions: [
          if (_scannedCards.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete_sweep),
              tooltip: 'Clear History',
              onPressed: _clearHistory,
            ),
        ],
      ),
      body: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hidden text field to capture RFID input
              Opacity(
                opacity: 0.0,
                child: TextField(
                  focusNode: _focusNode,
                  controller: _controller,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.transparent),
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),

              // Status Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.usb,
                        size: 64,
                        color: _status == "Ready" ? Colors.green : Colors.blue,
                      ),
                      SizedBox(height: 16),
                      Text(
                        _status,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              _status == "Ready" ? Colors.green : Colors.blue,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tap screen to activate',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Scan Area
              Container(
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade50, Colors.blue.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue.shade300, width: 2),
                ),
                child: Column(
                  children: [
                    Icon(Icons.nfc, size: 80, color: Colors.blue.shade700),
                    SizedBox(height: 16),
                    Text(
                      'Ready to Scan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Scan an ID card',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // History Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Scan History (${_scannedCards.length})',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              Divider(height: 24),

              // History List
              Expanded(
                child:
                    _scannedCards.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.inbox,
                                size: 64,
                                color: Colors.grey[300],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'No cards scanned yet',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        )
                        : ListView.builder(
                          itemCount: _scannedCards.length,
                          itemBuilder: (context, index) {
                            final scan = _scannedCards[index];
                            return Card(
                              margin: EdgeInsets.only(bottom: 8),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Text(
                                  scan.cardId,
                                  style: TextStyle(
                                    fontFamily: 'monospace',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  _formatTimestamp(scan.timestamp),
                                  style: TextStyle(fontSize: 12),
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _scannedCards.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
    }
  }
}

class CardScan {
  final String cardId;
  final DateTime timestamp;

  CardScan({required this.cardId, required this.timestamp});
}
