; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1530 () Bool)

(assert start!1530)

(declare-fun b!7237 () Bool)

(declare-fun e!4525 () Bool)

(declare-fun e!4522 () Bool)

(assert (=> b!7237 (= e!4525 (not e!4522))))

(declare-fun res!8029 () Bool)

(assert (=> b!7237 (=> res!8029 e!4522)))

(declare-datatypes ((array!487 0))(
  ( (array!488 (arr!612 (Array (_ BitVec 32) (_ BitVec 8))) (size!210 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!398 0))(
  ( (BitStream!399 (buf!543 array!487) (currentByte!1546 (_ BitVec 32)) (currentBit!1541 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!952 0))(
  ( (tuple2!953 (_1!504 array!487) (_2!504 BitStream!398)) )
))
(declare-fun lt!9626 () tuple2!952)

(declare-datatypes ((List!110 0))(
  ( (Nil!107) (Cons!106 (h!225 Bool) (t!860 List!110)) )
))
(declare-fun lt!9624 () List!110)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((Unit!566 0))(
  ( (Unit!567) )
))
(declare-datatypes ((tuple2!954 0))(
  ( (tuple2!955 (_1!505 Unit!566) (_2!505 BitStream!398)) )
))
(declare-fun lt!9628 () tuple2!954)

(declare-fun byteArrayBitContentToList!0 (BitStream!398 array!487 (_ BitVec 64) (_ BitVec 64)) List!110)

(assert (=> b!7237 (= res!8029 (not (= (byteArrayBitContentToList!0 (_2!505 lt!9628) (_1!504 lt!9626) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9624)))))

(declare-datatypes ((tuple2!956 0))(
  ( (tuple2!957 (_1!506 BitStream!398) (_2!506 BitStream!398)) )
))
(declare-fun lt!9627 () tuple2!956)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!398 BitStream!398 (_ BitVec 64)) List!110)

(assert (=> b!7237 (= lt!9624 (bitStreamReadBitsIntoList!0 (_2!505 lt!9628) (_1!506 lt!9627) nBits!460))))

(declare-fun readBits!0 (BitStream!398 (_ BitVec 64)) tuple2!952)

(assert (=> b!7237 (= lt!9626 (readBits!0 (_1!506 lt!9627) nBits!460))))

(declare-fun thiss!1486 () BitStream!398)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7237 (validate_offset_bits!1 ((_ sign_extend 32) (size!210 (buf!543 (_2!505 lt!9628)))) ((_ sign_extend 32) (currentByte!1546 thiss!1486)) ((_ sign_extend 32) (currentBit!1541 thiss!1486)) nBits!460)))

(declare-fun lt!9629 () Unit!566)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!398 array!487 (_ BitVec 64)) Unit!566)

(assert (=> b!7237 (= lt!9629 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!543 (_2!505 lt!9628)) nBits!460))))

(declare-fun reader!0 (BitStream!398 BitStream!398) tuple2!956)

(assert (=> b!7237 (= lt!9627 (reader!0 thiss!1486 (_2!505 lt!9628)))))

(declare-fun b!7238 () Bool)

(declare-fun e!4521 () Bool)

(declare-fun array_inv!205 (array!487) Bool)

(assert (=> b!7238 (= e!4521 (array_inv!205 (buf!543 thiss!1486)))))

(declare-fun b!7239 () Bool)

(declare-fun res!8026 () Bool)

(assert (=> b!7239 (=> (not res!8026) (not e!4525))))

(declare-fun isPrefixOf!0 (BitStream!398 BitStream!398) Bool)

(assert (=> b!7239 (= res!8026 (isPrefixOf!0 thiss!1486 (_2!505 lt!9628)))))

(declare-fun b!7240 () Bool)

(declare-fun e!4526 () Bool)

(assert (=> b!7240 (= e!4526 e!4525)))

(declare-fun res!8024 () Bool)

(assert (=> b!7240 (=> (not res!8024) (not e!4525))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7240 (= res!8024 (invariant!0 (currentBit!1541 (_2!505 lt!9628)) (currentByte!1546 (_2!505 lt!9628)) (size!210 (buf!543 (_2!505 lt!9628)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!487)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!398 array!487 (_ BitVec 64) (_ BitVec 64)) tuple2!954)

(assert (=> b!7240 (= lt!9628 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7241 () Bool)

(declare-fun res!8023 () Bool)

(assert (=> b!7241 (=> (not res!8023) (not e!4525))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7241 (= res!8023 (= (bitIndex!0 (size!210 (buf!543 (_2!505 lt!9628))) (currentByte!1546 (_2!505 lt!9628)) (currentBit!1541 (_2!505 lt!9628))) (bvadd (bitIndex!0 (size!210 (buf!543 thiss!1486)) (currentByte!1546 thiss!1486) (currentBit!1541 thiss!1486)) nBits!460)))))

(declare-fun b!7243 () Bool)

(declare-fun res!8025 () Bool)

(assert (=> b!7243 (=> (not res!8025) (not e!4526))))

(assert (=> b!7243 (= res!8025 (validate_offset_bits!1 ((_ sign_extend 32) (size!210 (buf!543 thiss!1486))) ((_ sign_extend 32) (currentByte!1546 thiss!1486)) ((_ sign_extend 32) (currentBit!1541 thiss!1486)) nBits!460))))

(declare-fun b!7244 () Bool)

(declare-fun res!8028 () Bool)

(assert (=> b!7244 (=> (not res!8028) (not e!4525))))

(assert (=> b!7244 (= res!8028 (= (size!210 (buf!543 thiss!1486)) (size!210 (buf!543 (_2!505 lt!9628)))))))

(declare-fun b!7245 () Bool)

(declare-fun res!8027 () Bool)

(assert (=> b!7245 (=> res!8027 e!4522)))

(assert (=> b!7245 (= res!8027 (not (= lt!9624 (byteArrayBitContentToList!0 (_2!505 lt!9628) srcBuffer!6 from!367 nBits!460))))))

(declare-fun res!8022 () Bool)

(assert (=> start!1530 (=> (not res!8022) (not e!4526))))

(assert (=> start!1530 (= res!8022 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!210 srcBuffer!6))))))))

(assert (=> start!1530 e!4526))

(assert (=> start!1530 true))

(assert (=> start!1530 (array_inv!205 srcBuffer!6)))

(declare-fun inv!12 (BitStream!398) Bool)

(assert (=> start!1530 (and (inv!12 thiss!1486) e!4521)))

(declare-fun b!7242 () Bool)

(assert (=> b!7242 (= e!4522 true)))

(declare-fun lt!9625 () Unit!566)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!398 array!487 array!487 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!566)

(assert (=> b!7242 (= lt!9625 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!505 lt!9628) srcBuffer!6 (_1!504 lt!9626) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1530 res!8022) b!7243))

(assert (= (and b!7243 res!8025) b!7240))

(assert (= (and b!7240 res!8024) b!7244))

(assert (= (and b!7244 res!8028) b!7241))

(assert (= (and b!7241 res!8023) b!7239))

(assert (= (and b!7239 res!8026) b!7237))

(assert (= (and b!7237 (not res!8029)) b!7245))

(assert (= (and b!7245 (not res!8027)) b!7242))

(assert (= start!1530 b!7238))

(declare-fun m!9269 () Bool)

(assert (=> b!7238 m!9269))

(declare-fun m!9271 () Bool)

(assert (=> b!7240 m!9271))

(declare-fun m!9273 () Bool)

(assert (=> b!7240 m!9273))

(declare-fun m!9275 () Bool)

(assert (=> b!7239 m!9275))

(declare-fun m!9277 () Bool)

(assert (=> b!7243 m!9277))

(declare-fun m!9279 () Bool)

(assert (=> b!7241 m!9279))

(declare-fun m!9281 () Bool)

(assert (=> b!7241 m!9281))

(declare-fun m!9283 () Bool)

(assert (=> b!7245 m!9283))

(declare-fun m!9285 () Bool)

(assert (=> start!1530 m!9285))

(declare-fun m!9287 () Bool)

(assert (=> start!1530 m!9287))

(declare-fun m!9289 () Bool)

(assert (=> b!7242 m!9289))

(declare-fun m!9291 () Bool)

(assert (=> b!7237 m!9291))

(declare-fun m!9293 () Bool)

(assert (=> b!7237 m!9293))

(declare-fun m!9295 () Bool)

(assert (=> b!7237 m!9295))

(declare-fun m!9297 () Bool)

(assert (=> b!7237 m!9297))

(declare-fun m!9299 () Bool)

(assert (=> b!7237 m!9299))

(declare-fun m!9301 () Bool)

(assert (=> b!7237 m!9301))

(push 1)

