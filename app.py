from flask import Flask, request, send_file
import subprocess
import os
import uuid

app = Flask(__name__)

@app.route('/overlay', methods=['POST'])
def overlay_video():
    if 'video' not in request.files:
        return {"error": "No video file provided"}, 400

    file = request.files['video']
    input_path = f"/tmp/{uuid.uuid4()}.mp4"
    output_path = "/tmp/output.mp4"
    file.save(input_path)

    # Run FFmpeg to apply overlay
    try:
        subprocess.run([
            'ffmpeg', '-i', input_path, '-i', 'overlay.png',
            '-filter_complex', '[0:v][1:v] overlay=0:0',
            '-c:a', 'copy', output_path
        ], check=True)
    except subprocess.CalledProcessError as e:
        return {"error": f"FFmpeg failed: {e}"}, 500

    return send_file(output_path, mimetype='video/mp4')
