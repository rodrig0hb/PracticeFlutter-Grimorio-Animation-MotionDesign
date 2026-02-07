// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:grimorio/controller/book_controller.dart';
import 'package:grimorio/models/personal_book.dart';
import 'package:animations/animations.dart';
import '../../theme.dart';
import 'components/display_text.dart';
import 'components/primary_button.dart';
import 'components/secondary_button.dart';
import 'edit_details.dart';
import 'home.dart';

class BookDetails extends StatefulWidget {
  BookDetails({super.key, required this.personalBook});

  PersonalBook personalBook;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  final BookController bookController = BookController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppBackgroundProperties.boxDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: DisplayText("Detalhes do Livro"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Image.network(
                      widget.personalBook.googleBook.thumbnailLink,
                      height: 220,
                      width: 144,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      widget.personalBook.googleBook.title,
                      style: ModalDecorationProperties.bookTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        widget.personalBook.googleBook.authors,
                        style: ModalDecorationProperties.bookAuthor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.personalBook.googleBook.description,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppColors.mediumPink,
                          ),
                        ),
                        Text(
                          "Inicio da Leitura",
                          style: TextStyle(color: AppColors.mediumPink),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(children: <Widget>[
                      Text(
                        widget.personalBook.dayStarted,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppColors.mediumPink,
                          ),
                        ),
                        Text(
                          "Final da Leitura",
                          style: TextStyle(color: AppColors.mediumPink),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(children: <Widget>[
                      Text(
                        widget.personalBook.dayFinished,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Comentários",
                          style: TextStyle(color: AppColors.mediumPink),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Row(
                      children: [
                        Expanded(child: Text(widget.personalBook.comments)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PrimaryButtonIcon(
                      icon: Icons.edit,
                      text: "Editar",
                      onTap: () {
                        Navigator.of(context)
                            .push(
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return EditDetails(
                                  personalBook: widget.personalBook);
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SharedAxisTransition(
                                animation: animation,
                                secondaryAnimation: secondaryAnimation,
                                transitionType: SharedAxisTransitionType.scaled,
                                child: child,
                              );
                            },
                          ),
                        )
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              widget.personalBook = value;
                            });
                          }
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SecondaryButton(
                      icon: Icons.delete,
                      text: "Excluir",
                      onTap: () {
                        // Delete book
                        bookController.deleteBook(widget.personalBook);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                          (_) => false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
