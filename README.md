# WineGPT

A small application to feature chat gpt sdk integration in a Flutter app.

## Getting Started

Add you OpenAI API in the services/chatgpt_service.dart file.

You can change the current prompt, as for now it just set the category selected inside the prompt to generate a question of this category. Feel free to change the language and topics.

In order to generate an API Key for OpenAI go to https://platform.openai.com/

## Prompting for dev purpose

We asked ChatGPT to format the output of his answer so we can directly use it in our code:

> using the following format: {"question": "text", "choices": ["A", "B", "C", "D"], "answer": index, "explanation": "text"}'
