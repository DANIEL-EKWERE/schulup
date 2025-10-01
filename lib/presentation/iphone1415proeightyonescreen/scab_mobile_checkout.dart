import 'package:flutter/material.dart';
import 'package:schoolruns/presentation/iphone1415proeightyonescreen/controller/iphone1415proeightyonecontroller.dart';
import 'package:usb_serial/usb_serial.dart';
import 'dart:async';
import 'dart:typed_data';

import '../../core/app_export.dart';

Iphone1415ProEightyoneController controller = Get.put(Iphone1415ProEightyoneController());

class RFIDReaderCheckOutScreen extends StatefulWidget {
  @override
  _RFIDReaderCheckOutScreenState createState() => _RFIDReaderCheckOutScreenState();
}

class _RFIDReaderCheckOutScreenState extends State<RFIDReaderCheckOutScreen> {
  UsbPort? _port;
  String _status = "Disconnected";
  String _cardId = "";
  List<String> _scannedCards = [];
  StreamSubscription<String>? _subscription;

  @override
  void initState() {
    super.initState();
    _connectToDevice();
  }

  Future<void> _connectToDevice() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    
    if (devices.isEmpty) {
      setState(() {
        _status = "No USB devices found";
      });
      return;
    }

    // Connect to first available device
    UsbDevice device = devices[0];
    _port = await device.create();
    
    bool openResult = await _port!.open();
    if (!openResult) {
      setState(() {
        _status = "Failed to open USB device";
      });
      return;
    }

    await _port!.setDTR(true);
    await _port!.setRTS(true);
    
    // Common RFID reader settings
    await _port!.setPortParameters(
      9600, // Baud rate (adjust based on your reader)
      UsbPort.DATABITS_8,
      UsbPort.STOPBITS_1,
      UsbPort.PARITY_NONE,
    );

    setState(() {
      _status = "Connected to RFID Reader";
    });

    // Listen for card data
    _subscription = _port!.inputStream?.map((Uint8List data) {
      return String.fromCharCodes(data);
    }).listen((String data) {
      _handleCardData(data);
    });
  }

  void _handleCardData(String data) {
    setState(() {
      _cardId += data;
      
      // Check if we have a complete card ID (usually ends with newline or specific length)
      if (_cardId.contains('\n') || _cardId.length >= 10) {
        String cleanId = _cardId.trim();
        if (cleanId.isNotEmpty && !_scannedCards.contains(cleanId)) {
          _scannedCards.insert(0, cleanId);
          _showCardScannedDialog(cleanId);
        }
        _cardId = "";
      }
    });
  }

  void _showCardScannedDialog(String cardId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Card Scanned'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.credit_card, size: 64, color: Colors.green),
            SizedBox(height: 16),
            Text('Card ID: $cardId', style: TextStyle(fontSize: 18)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _port?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out - RFID Reader'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(
                      _status.contains("Connected") 
                        ? Icons.usb 
                        : Icons.usb_off,
                      size: 48,
                      color: _status.contains("Connected") 
                        ? Colors.green 
                        : Colors.red,
                    ),
                    SizedBox(height: 8),
                    Text(
                      _status,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_status.contains("Connected"))
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  children: [
                    Icon(Icons.nfc, size: 48, color: Colors.blue),
                    SizedBox(height: 8),
                    Text(
                      'Ready to scan cards',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Tap or swipe an ID card',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Scanned Cards',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: _connectToDevice,
                  tooltip: 'Reconnect',
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: _scannedCards.isEmpty
                ? Center(
                    child: Text(
                      'No cards scanned yet',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _scannedCards.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                            backgroundColor: Colors.blue,
                          ),
                          title: Text(
                            _scannedCards[index],
                            style: TextStyle(fontFamily: 'monospace'),
                          ),
                          subtitle: Text('Scanned'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
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
    );
  }
}