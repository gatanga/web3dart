import 'package:test/test.dart';
import 'package:web3dart/web3dart.dart';

// https://github.com/ethereum/wiki/wiki/JSON-RPC#the-default-block-parameter
const blockParameters = {
  BlockNum.current(): 'latest',
  BlockNum.genesis(): 'earliest',
  BlockNum.pending(): 'pending',
  BlockNum.exact(64): '0x40',
};

void main() {
  test('block parameters encode', () {
    blockParameters.forEach((block, encoded) {
      expect(block.toBlockParam(), encoded);
    });
  });

  test('pending block param is pending', () {
    expect(const BlockNum.pending().isPending, true);
  });
}
