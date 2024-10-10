from flask import Flask, render_template, redirect, request, url_for
from gtts import gTTS
import os
import sys

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def main():
    if request.method == 'GET':
        return redirect(url_for('speak'))

    else:
        fileType = request.form['fileType']
        mp3Name = request.form['mp3Name']
        noTypeMp3Name = mp3Name[0:-4]
        sendedText = request.form['text']

        pureText = sendedText.split('%')
        realPureText = ""

        for s in pureText[0]:
            realPureText += s

        splitedText = realPureText.split('/')

        if fileType == ".ppt":
            for i in range(0, (len(splitedText)-1)):
                # print(splitedText[i], file = sys.stderr)
                # print("----------------------------", file=sys.stderr)
                tts = gTTS(text=splitedText[i], lang='ko')
                tts.save(noTypeMp3Name+str(i+1)+".mp3")
                os.system('mv ' + noTypeMp3Name+str(i+1) + ".mp3" + ' static')
                os.system('cp static/' + noTypeMp3Name+str(i+1) + ".mp3" + ' /home/hw/tomcat_www/web/WEB-INF/mp3Files/')
        else:
            tts = gTTS(text=realPureText, lang='ko')
            tts.save(mp3Name)
            os.system('mv ' + mp3Name + ' static')
            os.system('cp static/' + mp3Name + ' /home/hw/tomcat_www/web/WEB-INF/mp3Files/')

        if fileType == ".ppt":
            if request.form['slideLength'] == "null":
                return render_template('main.html', str=realPureText, mp3Name=mp3Name, slideLength="null")
            else:
                return render_template('main.html', str=realPureText, mp3Name=mp3Name, slideLength=request.form['slideLength'], splitedTextLength=len(splitedText), realPureText=realPureText)
        else:
            return render_template('others.html', str=realPureText, mp3Name=mp3Name, slideLength="null", fileType=fileType)


if __name__ == '__main__':
    app.run(host="127.0.0.1", port="5000", debug=True)

