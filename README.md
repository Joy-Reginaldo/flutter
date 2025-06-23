# 🧮 BMI Calculator - Flutter App

Este é um aplicativo Flutter simples que calcula o IMC (Índice de Massa Corporal) de uma pessoa com base no peso (kg) e altura (cm) fornecidos.

## 📱 Protótipo

A interface foi desenvolvida com base no seguinte protótipo:

## 🧩 Funcionalidades

- Seleção de gênero (masculino/feminino)
- Entrada de peso (em kg)
- Entrada de altura (em cm)
- Cálculo do IMC com base na fórmula:

```
IMC = peso / (altura * altura)
```

> Obs: A altura é convertida de cm para metros.

- Exibição do valor do IMC e da classificação:
  - Abaixo de 18.5: Abaixo do peso
  - 18.5 - 24.9: Normal
  - 25 - 29.9: Sobrepeso
  - 30 ou mais: Obesidade

- Botão para calcular novamente
- Validação de entradas (evita erro de divisão por zero ou entradas inválidas)

## 💻 Como executar

1. Clone o repositório:
```bash
git clone https://github.com/Joy-Reginaldo/flutter.git
```

2. Acesse a pasta do projeto:
```bash
cd flutter-bmi-calculator
```

3. Instale as dependências:
```bash
flutter pub get
```

4. Execute o projeto:
```bash
flutter run
```

> Certifique-se de estar com o ambiente Flutter corretamente configurado. Use `flutter doctor` para verificar.

## 📋 Estrutura do Código

- `main.dart`: toda a lógica da aplicação (UI, cálculo, validação).
- `StatefulWidget`: usado para manter o estado dos inputs e do resultado.
- `TextEditingController`: controla os campos de peso e altura.

## 📂 Estrutura do Projeto

```
flutter/
├── lib/
│   └── main.dart
├── README.md
└── ...
```

## 👩‍💻 Autor(a)
Joy
