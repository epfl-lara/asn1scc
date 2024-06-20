; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8486 () Bool)

(assert start!8486)

(declare-fun b!42416 () Bool)

(declare-fun e!28305 () Bool)

(declare-datatypes ((array!2175 0))(
  ( (array!2176 (arr!1483 (Array (_ BitVec 32) (_ BitVec 8))) (size!984 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1712 0))(
  ( (BitStream!1713 (buf!1315 array!2175) (currentByte!2773 (_ BitVec 32)) (currentBit!2768 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1712)

(declare-fun array_inv!909 (array!2175) Bool)

(assert (=> b!42416 (= e!28305 (array_inv!909 (buf!1315 thiss!1379)))))

(declare-fun b!42417 () Bool)

(declare-fun e!28307 () Bool)

(assert (=> b!42417 (= e!28307 true)))

(declare-datatypes ((tuple2!4158 0))(
  ( (tuple2!4159 (_1!2172 BitStream!1712) (_2!2172 BitStream!1712)) )
))
(declare-fun lt!63764 () tuple2!4158)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((List!503 0))(
  ( (Nil!500) (Cons!499 (h!618 Bool) (t!1253 List!503)) )
))
(declare-fun lt!63768 () List!503)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1712 BitStream!1712 (_ BitVec 64)) List!503)

(assert (=> b!42417 (= lt!63768 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2172 lt!63764) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!3022 0))(
  ( (Unit!3023) )
))
(declare-fun lt!63769 () Unit!3022)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1712 array!2175 (_ BitVec 64)) Unit!3022)

(assert (=> b!42417 (= lt!63769 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1315 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2175)

(declare-datatypes ((tuple2!4160 0))(
  ( (tuple2!4161 (_1!2173 array!2175) (_2!2173 BitStream!1712)) )
))
(declare-fun lt!63767 () tuple2!4160)

(declare-fun checkByteArrayBitContent!0 (BitStream!1712 array!2175 array!2175 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42417 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2173 lt!63767) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!42418 () Bool)

(declare-fun e!28308 () Bool)

(declare-fun e!28306 () Bool)

(assert (=> b!42418 (= e!28308 (not e!28306))))

(declare-fun res!36075 () Bool)

(assert (=> b!42418 (=> res!36075 e!28306)))

(declare-fun lt!63765 () (_ BitVec 64))

(assert (=> b!42418 (= res!36075 (or (bvslt i!635 to!314) (not (= lt!63765 (bvsub (bvadd lt!63765 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1712 BitStream!1712) Bool)

(assert (=> b!42418 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63766 () Unit!3022)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1712) Unit!3022)

(assert (=> b!42418 (= lt!63766 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42418 (= lt!63765 (bitIndex!0 (size!984 (buf!1315 thiss!1379)) (currentByte!2773 thiss!1379) (currentBit!2768 thiss!1379)))))

(declare-fun b!42419 () Bool)

(assert (=> b!42419 (= e!28306 e!28307)))

(declare-fun res!36078 () Bool)

(assert (=> b!42419 (=> res!36078 e!28307)))

(assert (=> b!42419 (= res!36078 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1712 (_ BitVec 64)) tuple2!4160)

(assert (=> b!42419 (= lt!63767 (readBits!0 (_1!2172 lt!63764) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1712 BitStream!1712) tuple2!4158)

(assert (=> b!42419 (= lt!63764 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!42420 () Bool)

(declare-fun res!36077 () Bool)

(assert (=> b!42420 (=> res!36077 e!28306)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42420 (= res!36077 (not (invariant!0 (currentBit!2768 thiss!1379) (currentByte!2773 thiss!1379) (size!984 (buf!1315 thiss!1379)))))))

(declare-fun res!36076 () Bool)

(assert (=> start!8486 (=> (not res!36076) (not e!28308))))

(assert (=> start!8486 (= res!36076 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!984 srcBuffer!2))))))))

(assert (=> start!8486 e!28308))

(assert (=> start!8486 true))

(assert (=> start!8486 (array_inv!909 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1712) Bool)

(assert (=> start!8486 (and (inv!12 thiss!1379) e!28305)))

(declare-fun b!42421 () Bool)

(declare-fun res!36074 () Bool)

(assert (=> b!42421 (=> (not res!36074) (not e!28308))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42421 (= res!36074 (validate_offset_bits!1 ((_ sign_extend 32) (size!984 (buf!1315 thiss!1379))) ((_ sign_extend 32) (currentByte!2773 thiss!1379)) ((_ sign_extend 32) (currentBit!2768 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8486 res!36076) b!42421))

(assert (= (and b!42421 res!36074) b!42418))

(assert (= (and b!42418 (not res!36075)) b!42420))

(assert (= (and b!42420 (not res!36077)) b!42419))

(assert (= (and b!42419 (not res!36078)) b!42417))

(assert (= start!8486 b!42416))

(declare-fun m!64349 () Bool)

(assert (=> b!42417 m!64349))

(declare-fun m!64351 () Bool)

(assert (=> b!42417 m!64351))

(declare-fun m!64353 () Bool)

(assert (=> b!42417 m!64353))

(declare-fun m!64355 () Bool)

(assert (=> b!42418 m!64355))

(declare-fun m!64357 () Bool)

(assert (=> b!42418 m!64357))

(declare-fun m!64359 () Bool)

(assert (=> b!42418 m!64359))

(declare-fun m!64361 () Bool)

(assert (=> start!8486 m!64361))

(declare-fun m!64363 () Bool)

(assert (=> start!8486 m!64363))

(declare-fun m!64365 () Bool)

(assert (=> b!42419 m!64365))

(declare-fun m!64367 () Bool)

(assert (=> b!42419 m!64367))

(declare-fun m!64369 () Bool)

(assert (=> b!42420 m!64369))

(declare-fun m!64371 () Bool)

(assert (=> b!42416 m!64371))

(declare-fun m!64373 () Bool)

(assert (=> b!42421 m!64373))

(push 1)

(assert (not b!42418))

(assert (not b!42419))

(assert (not b!42420))

