import 'package:flutter/material.dart';

class DangerBottomSheet extends StatelessWidget {
  const DangerBottomSheet({
    super.key,
    required this.onSelected,
  });

  final Function(String type, String title) onSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Tehlike Türünü Seç",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.warning,color: Colors.red),
            title: const Text("Çukur"),
            onTap: (){
              Navigator.pop(context);
              onSelected("hole","Çukur");
            },
          ),

          ListTile(
            leading: const Icon(Icons.scatter_plot,color: Colors.orange),
            title: const Text("Mıcır"),
            onTap: (){
              Navigator.pop(context);
              onSelected("gravel","Mıcır");
            },
          ),

          ListTile(
            leading: const Icon(Icons.water_drop,color: Colors.blue),
            title: const Text("Su Birikintisi"),
            onTap: (){
              Navigator.pop(context);
              onSelected("water","Su Birikintisi");
            },
          ),

          ListTile(
            leading: const Icon(Icons.construction,color: Colors.amber),
            title: const Text("Yol Çalışması"),
            onTap: (){
              Navigator.pop(context);
              onSelected("roadwork","Yol Çalışması");
            },
          ),

          const SizedBox(height:20),

        ],
      ),
    );
  }
}