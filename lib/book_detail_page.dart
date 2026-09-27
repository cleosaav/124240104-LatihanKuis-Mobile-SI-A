import 'package:flutter/material.dart';
import 'bookModels.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;
  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  book.imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const SizedBox(
                      height: 300,
                      width: 200,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stack) => Container(
                    height: 300,
                    width: 200,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.broken_image, size: 64),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _infoRow(Icons.person, 'Penulis', book.author),
            _infoRow(Icons.calendar_today, 'Tahun Terbit', '${book.year}'),
            _infoRow(Icons.category, 'Genre', book.genre),
            _infoRow(Icons.business, 'Penerbit', book.publisher),
            _infoRow(Icons.menu_book, 'Jumlah Halaman', '${book.pages} halaman'),
            _infoRow(Icons.star, 'Rating', '${book.rating} / 5.0',
                iconColor: Colors.amber),
            const Divider(height: 32),
            const Text(
              'Sinopsis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              book.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value,
      {Color? iconColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: iconColor),
          const SizedBox(width: 12),
          SizedBox(
            width: 120,
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
