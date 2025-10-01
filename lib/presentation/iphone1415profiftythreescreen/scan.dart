import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//2064510171

class RFIDReaderScreen extends StatefulWidget {
  @override
  _RFIDReaderScreenState createState() => _RFIDReaderScreenState();
}

class _RFIDReaderScreenState extends State<RFIDReaderScreen> {
  final FocusNode _focusNode = FocusNode();
  String _cardBuffer = "";
  List<CardScan> _scannedCards = [];
  bool _isReaderActive = false;

  @override
  void initState() {
    super.initState();
    // Auto-focus to start listening
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
      setState(() {
        _isReaderActive = true;
      });
    });
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      // Enter key indicates end of card scan
      if (event.logicalKey == LogicalKeyboardKey.enter) {
        if (_cardBuffer.isNotEmpty) {
          _processCardId(_cardBuffer.trim());
          _cardBuffer = "";
        }
      } 
      // Capture alphanumeric characters
      else if (event.character != null && event.character!.isNotEmpty) {
        _cardBuffer += event.character!;
      }
    }
  }

  void _processCardId(String cardId) {
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
      _scannedCards.insert(0, CardScan(
        cardId: cardId,
        timestamp: now,
      ));
    });

    _showCardDialog(cardId);
    
    // Play system beep (optional)
    SystemSound.play(SystemSoundType.click);
  }

  void _showCardDialog(String cardId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      child: Scaffold(
        appBar: AppBar(
          title: Text('RFID Card Reader'),
          elevation: 2,
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
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                          color: _isReaderActive ? Colors.green : Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          _isReaderActive ? 'Reader Active' : 'Reader Inactive',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _isReaderActive ? Colors.green : Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Scan an ID card to begin',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 24),
                
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
                    border: Border.all(
                      color: Colors.blue.shade300,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.nfc,
                        size: 80,
                        color: Colors.blue.shade700,
                      ),
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
                        'Place card near reader',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 24),
                
                // History Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Scan History (${_scannedCards.length})',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                
                Divider(height: 24),
                
                // History List
                Expanded(
                  child: _scannedCards.isEmpty
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
                                  ),
                                ),
                                subtitle: Text(
                                  _formatTimestamp(scan.timestamp),
                                  style: TextStyle(fontSize: 12),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete_outline, color: Colors.red),
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

  CardScan({
    required this.cardId,
    required this.timestamp,
  });
}