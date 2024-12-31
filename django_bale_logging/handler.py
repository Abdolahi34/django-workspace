import logging
import requests
from django.conf import settings


class BaleHandler(logging.Handler):
    def __init__(self):
        super().__init__()
        self.token = settings.BALE_BOT_TOKEN
        self.chat_id = settings.BALE_CHAT_ID

    def emit(self, record):
        log_entry = self.format(record)
        self.send_message(log_entry)

    def send_message(self, message):
        url = f'https://tapi.bale.ai/bot{self.token}/sendMessage'
        headers = {"Content-Type": "application/json"}
        data = {'chat_id': self.chat_id, 'text': message}
        try:
            requests.post(url=url, json=data, headers=headers, timeout=3)
        except Exception as e:
            print(f'Error while sending message to Bale: {e}')
