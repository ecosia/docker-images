# Mockgen

## Usage

```
# mount your directory in the container
docker run -v `pwd`:/defs \
  ecosiadev/mockgen:v1.4.2 \
  mockgen -source /defs/health.pb.go -destination /defs/mock/health.mock.pb.go -package mock_proto
```
