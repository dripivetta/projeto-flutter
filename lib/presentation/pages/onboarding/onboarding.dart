import 'package:flutter/material.dart';
import 'package:tg/presentation/pages/welcome/welcome_page.dart';
import 'package:tg/widgets/base_color/base_color.dart';
import 'package:tg/widgets/onboarding_page/custom_buttom_continue.dart';
import 'package:tg/widgets/onboarding_page/custom_link_pular_instrucao.dart';
import 'package:tg/widgets/onboarding_page/custom_paginator.dart';
import 'package:tg/widgets/onboarding_page/custom_slider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                BaseColors().getAzulEscuro(),
                BaseColors().getAzulMaisClaro(),
              ],
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  physics: const ClampingScrollPhysics(),
                  children: [
                    CustomSlider(
                      image: 'assets/onboarding_page/prancheta.png',
                      title: 'Cadastro de cliente',
                      text:
                          'Tenha o controle do cadastro dos clientes na palma da mão.',
                      widthImage: 300,
                      heightImage: 250,
                      fontSizeTitle: 24,
                      fontWeightTitle: FontWeight.w500,
                      colorTitle: BaseColors().getBranco(),
                      textAlignTitle: TextAlign.center,
                      fontSizeText: 18,
                      colorText: BaseColors().getBranco(),
                      textAlignText: TextAlign.center,
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    ),
                    CustomSlider(
                      image: 'assets/onboarding_page/casa.png',
                      title: 'Controle de cadastros',
                      text:
                          'Tenha acesso aos cadastrose de clientes e orçamentos.',
                      widthImage: 300,
                      heightImage: 250,
                      fontSizeTitle: 24,
                      fontWeightTitle: FontWeight.w500,
                      colorTitle: BaseColors().getBranco(),
                      textAlignTitle: TextAlign.center,
                      fontSizeText: 18,
                      colorText: BaseColors().getBranco(),
                      textAlignText: TextAlign.center,
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    ),
                    CustomSlider(
                      image: 'assets/onboarding_page/automacao.png',
                      title: 'Automatização',
                      text:
                          'Automatize seus orçamentos de forma simples e rápida.',
                      widthImage: 300,
                      heightImage: 250,
                      fontSizeTitle: 24,
                      fontWeightTitle: FontWeight.w500,
                      colorTitle: BaseColors().getBranco(),
                      textAlignTitle: TextAlign.center,
                      fontSizeText: 18,
                      colorText: BaseColors().getBranco(),
                      textAlignText: TextAlign.center,
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    ),
                  ],
                ),
                CustomPaginator(
                  page: _currentPage,
                  shape: BoxShape.circle,
                  coloridx: BaseColors().getCinza(),
                  colornotidx: BaseColors().getBrancoCinza(),
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.all(4),
                  listgenerate: 3,
                  mainAxisAlignmentColumn: MainAxisAlignment.end,
                  padding: const EdgeInsets.only(bottom: 165),
                  mainAxisAlignmentRow: MainAxisAlignment.center,
                ),
                CustomBottomContinue(
                  text: _currentPage == 2 ? 'QUERO ENTRAR' : 'CONTINUAR',
                  goToInicialPage:
                      _currentPage == 2 ? goToInicialPage : proximoCard,
                  fontSize: 18,
                  color: BaseColors().getCinza(),
                  paddingText: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(16)),
                  border: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  background: MaterialStateProperty.all<Color>(
                    BaseColors().getBrancoCinza(),
                  ),
                  width: 300,
                  height: 60,
                  paddingButtom: const EdgeInsets.only(bottom: 85),
                  mainAxisAlignmentColumn: MainAxisAlignment.end,
                ),
                CustomLinkPularInstrucoes(
                  text: 'Pular instruções',
                  goToInicialPage: goToInicialPage,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: BaseColors().getPreto(),
                  padding: const EdgeInsets.only(bottom: 40),
                  mainAxisAlignmentColumn: MainAxisAlignment.end,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToInicialPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const WelcomePage(),
      ),
    );
  }

  proximoCard() {
    _controller.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }
}
