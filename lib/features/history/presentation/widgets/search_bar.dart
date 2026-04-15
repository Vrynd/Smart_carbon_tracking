import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/core/core.dart';

class SearchBar extends StatefulWidget {
  final String searchQuery;
  final Function(String) onSearchChanged;
  final VoidCallback onFilterPressed;
  final bool showFilterDot;

  const SearchBar({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.onFilterPressed,
    this.showFilterDot = false,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.searchQuery);
  }

  @override
  void didUpdateWidget(covariant SearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchQuery != _controller.text) {
      _controller.text = widget.searchQuery;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onChanged: (value) {
              setState(() {});
              widget.onSearchChanged(value);
            },
            style: context.text.bodyLarge,
            cursorColor: context.colors.primary,
            decoration: InputDecoration(
              hintText: 'Search receipt history...',
              hintStyle: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: context.colors.primary,
                  size: 20,
                ),
              ),
              suffixIcon: _controller.text.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: IconButton(
                        icon: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: context.colors.onSurfaceVariant.withValues(
                              alpha: 0.1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedCancel01,
                            color: context.colors.onSurfaceVariant.withValues(
                              alpha: 0.7,
                            ),
                            size: 16,
                          ),
                        ),
                        onPressed: () {
                          setState(() => _controller.clear());
                          widget.onSearchChanged('');
                        },
                      ),
                    )
                  : null,
              filled: true,
              fillColor: context.colors.surfaceContainerLowest.withValues(
                alpha: .8,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: context.colors.surfaceContainerLowest,
                  width: 1.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: context.colors.primary.withValues(alpha: 0.6),
                  width: 1.2,
                ),
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onFilterPressed,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.colors.primary.withValues(alpha: 0.15),
                  width: 1.1,
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedFilter,
                    color: context.colors.primary,
                    size: 20,
                  ),
                  if (widget.showFilterDot)
                    Positioned(
                      top: -4,
                      right: -4,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.colors.surface,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
