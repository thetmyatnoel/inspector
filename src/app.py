from flask import Flask, request, jsonify, make_response
from flask_cors import CORS
import whisper
import os
from werkzeug.utils import secure_filename
import tempfile

app = Flask(__name__)
CORS(app, resources={r"/data/*": {"origins": "*"}})
model = whisper.load_model("large")

@app.route('/transcribe', methods=['POST'])
def transcribe_audio():
    if 'file' not in request.files:
        return jsonify({"error": "No file part"}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({"error": "No selected file"}), 400

    # Use tempfile for handling audio files securely
    temp_dir = tempfile.mkdtemp()
    audio_path = os.path.join(temp_dir, secure_filename(file.filename))
    file.save(audio_path)
    
    try:
        # Transcribe the audio file
        result = model.transcribe(audio_path)
        transcription = result["text"]
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        # Clean up the temporary file
        os.remove(audio_path)
        os.rmdir(temp_dir)

    # Return the transcription
    return make_response(jsonify({"transcription": transcription}), 200, {"Content-Type": "application/json; charset=utf-8"})
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)
