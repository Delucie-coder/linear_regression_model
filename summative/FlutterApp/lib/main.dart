import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const StudentPredictorApp());
}

class StudentPredictorApp extends StatelessWidget {
  // Fixed: Removed super.key for older Flutter versions
  const StudentPredictorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALU Exam Predictor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PredictionPage(),
    );
  }
}

class PredictionPage extends StatefulWidget {
  // Fixed: Removed super.key
  const PredictionPage({Key? key}) : super(key: key);

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> _controllers = {
    'Hours_Studied': TextEditingController(text: '15'),
    'Attendance': TextEditingController(text: '90'),
    'Parental_Involvement': TextEditingController(text: '2'),
    'Access_to_Resources': TextEditingController(text: '2'),
    'Extracurricular_Activities': TextEditingController(text: '1'),
    'Sleep_Hours': TextEditingController(text: '8'),
    'Previous_Scores': TextEditingController(text: '80'),
    'Motivation_Level': TextEditingController(text: '2'),
    'Internet_Access': TextEditingController(text: '1'),
    'Tutoring_Sessions': TextEditingController(text: '3'),
    'Family_Income': TextEditingController(text: '1'),
    'Teacher_Quality': TextEditingController(text: '2'),
    'School_Type': TextEditingController(text: '1'),
    'Peer_Influence': TextEditingController(text: '1'),
    'Physical_Activity': TextEditingController(text: '4'),
    'Learning_Disabilities': TextEditingController(text: '0'),
    'Parental_Education_Level': TextEditingController(text: '3'),
    'Distance_from_Home': TextEditingController(text: '1'),
    'Gender': TextEditingController(text: '0'),
  };

  String _predictionResult = "Ready to Predict";
  bool _isLoading = false;

  Future<void> getPredictionFromAPI() async {
    setState(() => _isLoading = true);

    final url =
        Uri.parse('https://delucie-tudent-performance-api.hf.space/predict');

    try {
      Map<String, dynamic> jsonData = {};
      _controllers.forEach((key, controller) {
        jsonData[key] = double.parse(controller.text);
      });

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(jsonData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _predictionResult =
              "Predicted Score: ${data['predicted_exam_score']}%";
        });
      } else {
        setState(() =>
            _predictionResult = "Error: API Response ${response.statusCode}");
      }
    } catch (e) {
      setState(() => _predictionResult = "Check Internet / API Status");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Performance Predictor"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Enter Student Parameters",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              ..._controllers.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextFormField(
                    controller: entry.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: entry.key.replaceAll('_', ' '),
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.edit_note),
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 25),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: getPredictionFromAPI,
                      icon: const Icon(Icons.analytics),
                      label: const Text("PREDICT NOW"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 55),
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Colors.indigo.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.indigo, width: 2)),
                child: Text(
                  _predictionResult,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
