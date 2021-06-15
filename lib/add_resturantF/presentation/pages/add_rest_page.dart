import 'package:first_proj/core/widgets/instagram_logo.dart';
import 'package:flutter/material.dart';

class RegisterProfilePage extends StatelessWidget {
  const RegisterProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: InstagramLogo(h: 50),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            PhotoUploader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldsEditor(),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoUploader extends StatelessWidget {
  const PhotoUploader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          CirclePhoto(),
          SizedBox(height: 10),
          InkWell(
            child:
                Text('Upload User Photo', style: TextStyle(color: Colors.blue)),
            onTap: () => {},
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class CirclePhoto extends StatelessWidget {
  final String? url;
  const CirclePhoto({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.4,
          width: MediaQuery.of(context).size.width * 0.4,
          color: Colors.black38,
          child: Center(
            child: Icon(
              Icons.add,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      return Image(
        image: NetworkImage(url ?? ''),
      );
    }
  }
}

class TextFieldsEditor extends StatelessWidget {
  const TextFieldsEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InstagramTextFields(name: "Name"),
        InstagramTextFields(name: "Bio", multiline: true),
      ],
    );
  }
}

class InstagramTextFields extends StatelessWidget {
  final String? name;
  final bool multiline;
  const InstagramTextFields({Key? key, this.multiline = false, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name ?? ''),
        Expanded(child: TextField()),
      ],
    );
  }
}
