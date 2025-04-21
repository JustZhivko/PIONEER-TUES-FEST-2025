import 'package:flutter/material.dart';

class InformationalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_img1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PIONEER – нашата напълно автоматизирана стабилизирана ракета. В сърцето ѝ стои Arduino Nano – мини компютър, който в реално време обработва данните от два ключови сензора. MPU9250 следи наклона, ускорението и посоката чрез вграден акселерометър, жироскоп и магнетометър. BMP280 измерва атмосферното налягане, от което изчисляваме височината. Всички тези данни се използват от TVC системата – Thrust Vector Control – която управлява ъгъла на тягата, така че ракетата автоматично да се стабилизира по време на полет. PIONEER следи и реагира на всяко отклонение от курса, като постоянно регулира посоката си – бързо, прецизно и напълно автономно.',
                  style: TextStyle(
                    fontFamily: 'Blanka',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
