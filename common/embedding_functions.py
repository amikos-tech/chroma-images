"""
This file contains a dummy default embedding function for Chroma so that we don't have to install onnxruntime and tokenizers in the server image.
"""
from chromadb.api.types import Documents, EmbeddingFunction, Embeddings


class DefaultEmbeddingFunction(EmbeddingFunction[Documents]):
    def __init__(self):
        pass

    def __call__(self, input: Documents) -> Embeddings:
        return [[0.1] * 384] * len(input)
