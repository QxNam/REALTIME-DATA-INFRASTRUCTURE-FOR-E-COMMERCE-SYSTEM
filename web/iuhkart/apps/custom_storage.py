from storages.backends.s3boto3 import S3Boto3Storage
from urllib.parse import urlparse
class CustomStorage(S3Boto3Storage):
    custom_domain = 'image.iuhkart.systems'
    def url(self, name):
        parsed = urlparse(name)
        if parsed.scheme and parsed.netloc:
            return name
        return super().url(name)
    
class CustomerStorage(CustomStorage):
    bucket_name = 'customer'

class ShopStorage(CustomStorage):
    bucket_name = 'shop'

class ProductStorage(CustomStorage):
    bucket_name = 'product'
