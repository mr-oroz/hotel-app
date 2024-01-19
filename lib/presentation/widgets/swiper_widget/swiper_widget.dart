import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget({
    super.key,
    this.images,
  });

  final List<String>? images;

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  final ScrollController _controller = ScrollController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _onScroll();
    });
  }

  void _onScroll() {
    var newPage =
        (_controller.offset / MediaQuery.of(context).size.width).round();
    if (_currentPage != newPage) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 257,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ListView.separated(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.images != null ? widget.images!.length : 0,
              itemBuilder: (context, index) {
                final image = widget.images![index];
                return SizedBox(
                  height: 257,
                  width: size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: image == 'https://gogolhotel.ru/images/r4.jpg' ? 'https://www.pallenz.co.nz/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png' : image,
                      width: size.width,
                      key: UniqueKey(),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: const Color(0xFFF2F2F2),
                      ),
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 16),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: 75,
                height: 17,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.images!.length, (index) => _buildDot(index)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    double opacity = 1.0 - (0.5 * (index - _currentPage).abs());
    if (opacity < 0.1) opacity = 0.1;
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: AppColor.black.withOpacity(opacity),
          borderRadius: BorderRadius.circular(3.5),
        ),
      ),
    );
  }
}
