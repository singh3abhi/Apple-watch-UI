import 'package:flutter/material.dart';
import 'dart:math';

class BubbleLens extends StatefulWidget {
  final double width;
  final double height;
  final List<Widget> widgets;
  final double size;
  final double paddingX;
  final double paddingY;
  final Duration duration;
  final Radius radius;
  final double highRatio;
  final double lowRatio;
  final Function(int)? onBubbleTap;

  const BubbleLens({
    Key? key,
    required this.width,
    required this.height,
    required this.widgets,
    this.size = 100,
    this.paddingX = 10,
    this.paddingY = 0,
    this.duration = const Duration(milliseconds: 100),
    this.radius = const Radius.circular(999),
    this.highRatio = 0,
    this.lowRatio = 0,
    this.onBubbleTap,
  }) : super(key: key);

  @override
  BubbleLensState createState() => BubbleLensState();
}

class BubbleLensState extends State<BubbleLens> with TickerProviderStateMixin {
  double _middleX = 0;
  double _middleY = 0;
  double _offsetX = 0;
  double _offsetY = 0;

  double _minLeft = double.infinity;
  double _maxLeft = double.negativeInfinity;
  double _minTop = double.infinity;
  double _maxTop = double.negativeInfinity;

  late AnimationController _animationController;
  late Animation<double> _offsetXAnimation;
  late Animation<double> _offsetYAnimation;
  bool _isAnimating = false;
  int? _focusedBubbleIndex;

  @override
  void initState() {
    super.initState();
    _middleX = widget.width / 2;
    _middleY = widget.height / 2;
    _offsetX = _middleX - widget.size / 2;
    _offsetY = _middleY - widget.size / 2;

    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetXAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _offsetYAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.addListener(() {
      if (_isAnimating) {
        setState(() {
          _offsetX = _offsetXAnimation.value;
          _offsetY = _offsetYAnimation.value;
        });
      }
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isAnimating = false;
      }
    });
  }

  void _centerBubble(int index) {
    // Get current bubble positions with current offset
    List<List<double>> bubblePositions = _getCurrentBubblePositions();

    if (index < bubblePositions.length) {
      double bubbleLeft = bubblePositions[index][0];
      double bubbleTop = bubblePositions[index][1];

      // Calculate bubble center
      double bubbleCenterX = bubbleLeft + widget.size / 2;
      double bubbleCenterY = bubbleTop + widget.size / 2;

      // Calculate how much to move to center this bubble
      double deltaX = _middleX - bubbleCenterX;
      double deltaY = _middleY - bubbleCenterY;

      // New target offset
      double targetOffsetX = _offsetX + deltaX;
      double targetOffsetY = _offsetY + deltaY;

      // Apply constraints
      targetOffsetX = max(_minLeft, min(_maxLeft, targetOffsetX));
      targetOffsetY = max(_minTop, min(_maxTop, targetOffsetY));

      _offsetXAnimation = Tween<double>(
        begin: _offsetX,
        end: targetOffsetX,
      ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
      );
      _offsetYAnimation = Tween<double>(
        begin: _offsetY,
        end: targetOffsetY,
      ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
      );

      _isAnimating = true;
      _animationController.reset();
      _animationController.forward();
    }
  }

  int _getFocusedBubbleRow() {
    if (_focusedBubbleIndex == null || _focusedBubbleIndex! >= 17) return -1;

    List<int> rowCounts = [3, 4, 3, 4, 3];
    int bubbleCount = 0;

    for (int row = 0; row < rowCounts.length; row++) {
      bubbleCount += rowCounts[row];
      if (_focusedBubbleIndex! < bubbleCount) {
        return row;
      }
    }
    return -1;
  }

  List<List<double>> _getCurrentBubblePositions() {
    List<List<double>> positions = [];
    List<int> rowCounts = [3, 4, 3, 4, 3];

    int bubbleIndex = 0;
    double currentY = _offsetY;

    // First add the main bubbles in 3,4,3,4,3 pattern
    for (
      int rowIndex = 0;
      rowIndex < rowCounts.length && bubbleIndex < 17;
      rowIndex++
    ) {
      int bubblesInRow = rowCounts[rowIndex];

      // Adjust spacing if there's a focused bubble in this row
      double baseSpacing = widget.paddingX;
      double extraSpacing = 0;

      if (_focusedBubbleIndex != null && _focusedBubbleIndex! < 17) {
        // Calculate which row the focused bubble is in
        int focusedRow = _getFocusedBubbleRow();
        if (focusedRow == rowIndex) {
          extraSpacing = 40; // Add extra spacing around focused bubble's row
        }
      }

      double effectiveSpacing = baseSpacing + extraSpacing;
      double totalRowWidth =
          (bubblesInRow - 1) * (widget.size + effectiveSpacing);
      double startX =
          _offsetX + widget.width / 2 - totalRowWidth / 2 - widget.size / 2;

      // Add extra space BEFORE focused row
      if (_focusedBubbleIndex != null && _focusedBubbleIndex! < 17) {
        int focusedRow = _getFocusedBubbleRow();
        if (focusedRow == rowIndex) {
          currentY += 30; // Add space before the focused row
        }
      }

      for (
        int colIndex = 0;
        colIndex < bubblesInRow && bubbleIndex < 17;
        colIndex++
      ) {
        double left = startX + colIndex * (widget.size + effectiveSpacing);
        double top = currentY;

        // Add curves
        if (rowIndex <= 1) {
          // Upper rows: inward curves (downward)
          double relativePos = (colIndex / (bubblesInRow - 1)) - 0.5;
          double curveStrength = rowIndex == 0 ? 50.0 : 40.0;
          double curveOffset = curveStrength * (relativePos * relativePos);
          top += curveOffset;
        } else if (rowIndex >= 3) {
          // Bottom rows: outward curves (upward) - opposite direction
          double relativePos = (colIndex / (bubblesInRow - 1)) - 0.5;
          double curveStrength = rowIndex == 4 ? 50.0 : 40.0;
          double curveOffset = curveStrength * (relativePos * relativePos);
          top -= curveOffset;
        }

        positions.add([left, top]);
        bubbleIndex++;
      }

      // Add extra vertical spacing around focused bubble's row
      double verticalSpacing = widget.paddingY;
      if (_focusedBubbleIndex != null && _focusedBubbleIndex! < 17) {
        int focusedRow = _getFocusedBubbleRow();
        if (focusedRow == rowIndex) {
          verticalSpacing += 30; // Extra vertical space below focused row
        }
        if (focusedRow >= 0 && rowIndex == focusedRow + 1) {
          verticalSpacing += 30; // Extra vertical space above row after focused
        }
      }

      currentY += widget.size + verticalSpacing;
    }

    // Add small decorative bubbles positioned dynamically relative to main bubbles
    if (bubbleIndex < widget.widgets.length && positions.length >= 17) {
      // Get key reference positions from the main bubbles grid
      double row0CenterY = positions.length > 0 ? positions[0][1] : _offsetY;
      double row1CenterY =
          positions.length > 3
              ? positions[3][1]
              : _offsetY + widget.size + widget.paddingY;
      double row2CenterY =
          positions.length > 7
              ? positions[7][1]
              : _offsetY + 2 * (widget.size + widget.paddingY);
      double row3CenterY =
          positions.length > 10
              ? positions[10][1]
              : _offsetY + 3 * (widget.size + widget.paddingY);
      double row4CenterY =
          positions.length > 14
              ? positions[14][1]
              : _offsetY + 4 * (widget.size + widget.paddingY);

      // Calculate edge positions
      double leftEdge = _offsetX - 30;
      double rightEdge = _offsetX + widget.width + 10;
      double centerX = _offsetX + widget.width / 2;

      // Define small bubble positions relative to current main bubble layout
      List<List<double>> dynamicSmallBubbles = [
        // Top row decorative bubbles (above row 0)
        [centerX - 60, row0CenterY - 30], // Bubble 1
        [centerX + 60, row0CenterY - 30], // Bubble 2
        // Side bubbles for row 1
        [leftEdge, row1CenterY + 10], // Bubble 3
        [rightEdge, row1CenterY + 10], // Bubble 4
        // Side bubbles for row 2 (middle)
        [leftEdge - 10, row2CenterY + 20], // Bubble 5
        [rightEdge + 10, row2CenterY + 20], // Bubble 6
        // Side bubbles for row 3
        [leftEdge + 10, row3CenterY + 15], // Bubble 7
        [rightEdge - 10, row3CenterY + 15], // Bubble 8
        // Bottom decorative bubbles
        [centerX - 40, row4CenterY + 50], // Bubble 9
        [centerX + 40, row4CenterY + 50], // Bubble 10
      ];

      for (var pos in dynamicSmallBubbles) {
        if (bubbleIndex >= widget.widgets.length) break;
        positions.add(pos);
        bubbleIndex++;
      }
    }

    return positions;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // Tap on empty space unfocuses all bubbles
          setState(() {
            _focusedBubbleIndex = null;
          });
        },
        onPanUpdate: (details) {
          if (!_isAnimating) {
            double newOffsetX = max(
              _minLeft,
              min(_maxLeft, _offsetX + details.delta.dx),
            );
            double newOffsetY = max(
              _minTop,
              min(_maxTop, _offsetY + details.delta.dy),
            );
            if (newOffsetX != _offsetX || newOffsetY != _offsetY) {
              setState(() {
                _offsetX = newOffsetX;
                _offsetY = newOffsetY;
              });
            }
          }
        },
        child: Stack(
          children: () {
            List<List<double>> bubblePositions = _getCurrentBubblePositions();
            return widget.widgets.asMap().entries.map((entry) {
              int index = entry.key;
              Widget item = entry.value;

              if (index >= bubblePositions.length) return Container();

              double left = bubblePositions[index][0];
              double top = bubblePositions[index][1];

              _minLeft = min(
                _minLeft,
                -(left - _offsetX) + _middleX - (widget.size / 2),
              );
              _maxLeft = max(
                _maxLeft,
                left - _offsetX + _middleX - (widget.size / 2),
              );
              _minTop = min(
                _minTop,
                -(top - _offsetY) + _middleY - (widget.size / 2),
              );
              _maxTop = max(
                _maxTop,
                top - _offsetY + _middleY - (widget.size / 2),
              );

              // Determine if this is a small decorative bubble (indices 17+)
              bool isSmallBubble = index >= 17;
              double bubbleSize =
                  isSmallBubble ? widget.size * 0.15 : widget.size;

              double distance = sqrt(
                pow(_middleX - (left + bubbleSize / 2), 2) +
                    pow(_middleY - (top + bubbleSize / 2), 2),
              );

              double scale;
              bool isFocused = _focusedBubbleIndex == index;

              if (isSmallBubble) {
                // Small bubbles keep their size
                scale = 1.0;
              } else {
                if (_focusedBubbleIndex != null) {
                  if (isFocused) {
                    // Focused bubble gets slightly larger
                    scale = 1.3;
                  } else {
                    // Non-focused bubbles keep normal size
                    scale = 1.0;
                  }
                } else {
                  // Normal distance-based scaling when no focus
                  double size = widget.size / max(distance / widget.size, 1);
                  scale = max(
                    0,
                    min(
                      1,
                      (size /
                              widget.size *
                              (1 + widget.highRatio + widget.lowRatio)) -
                          widget.lowRatio,
                    ),
                  );
                }
              }
              return AnimatedPositioned(
                duration: widget.duration,
                top: top,
                left: left,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _focusedBubbleIndex = index;
                    });
                    if (widget.onBubbleTap != null) {
                      widget.onBubbleTap!(index);
                    }
                    _centerBubble(index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: bubbleSize,
                    height: bubbleSize,
                    child: Transform.scale(
                      scale: scale,
                      child: AnimatedOpacity(
                        opacity:
                            (_focusedBubbleIndex != null && !isFocused)
                                ? 0.3
                                : 1.0,
                        duration: widget.duration,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(widget.radius),
                          child: Container(
                            width: bubbleSize,
                            height: bubbleSize,
                            child: item,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList();
          }(),
        ),
      ),
    );
  }
}
