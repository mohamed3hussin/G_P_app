import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class UploadImageApi
{
  Future<dynamic> uploadImage(Uint8List bytes,String fileName) async
  {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.escuelajs.co/api/v1/files/upload'),
    );

    var multipartFile = http.MultipartFile(
      'file',
      http.ByteStream.fromBytes(bytes),
      bytes.length,
      filename: fileName,
    );
    request.files.add(multipartFile);
    StreamedResponse response = await request.send();
    if(response.statusCode == 201)
    {
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    }
    else
    { return null;}
  }

  Future<List<String>> uploadModelImage(File imageFile) async {
    final uri = Uri.parse('https://6ee6-41-233-198-206.ngrok-free.app/api/Product/RecommendLogo');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath(
        'file', // The name attribute for the image field in your API
        imageFile.path,
      ));

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      // final List<dynamic> jsonResponse = json.decode(responseData.body);
      // final List<String> imageUrls = jsonResponse.cast<String>();
      return jsonDecode(responseData);
    } else {
      throw Exception('Failed to upload image');
    }
  }
}