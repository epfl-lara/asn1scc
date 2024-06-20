; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5700 () Bool)

(assert start!5700)

(declare-datatypes ((array!1623 0))(
  ( (array!1624 (arr!1153 (Array (_ BitVec 32) (_ BitVec 8))) (size!697 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1623)

(declare-datatypes ((BitStream!1226 0))(
  ( (BitStream!1227 (buf!1018 array!1623) (currentByte!2331 (_ BitVec 32)) (currentBit!2326 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2037 0))(
  ( (Unit!2038) )
))
(declare-datatypes ((tuple2!2770 0))(
  ( (tuple2!2771 (_1!1472 Unit!2037) (_2!1472 BitStream!1226)) )
))
(declare-fun lt!34813 () tuple2!2770)

(declare-fun b!24336 () Bool)

(declare-fun e!16576 () Bool)

(declare-datatypes ((tuple2!2772 0))(
  ( (tuple2!2773 (_1!1473 BitStream!1226) (_2!1473 BitStream!1226)) )
))
(declare-fun lt!34817 () tuple2!2772)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((List!314 0))(
  ( (Nil!311) (Cons!310 (h!429 Bool) (t!1064 List!314)) )
))
(declare-fun head!151 (List!314) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1226 array!1623 (_ BitVec 64) (_ BitVec 64)) List!314)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1226 BitStream!1226 (_ BitVec 64)) List!314)

(assert (=> b!24336 (= e!16576 (= (head!151 (byteArrayBitContentToList!0 (_2!1472 lt!34813) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!151 (bitStreamReadBitsIntoList!0 (_2!1472 lt!34813) (_1!1473 lt!34817) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24337 () Bool)

(declare-fun e!16580 () Bool)

(declare-fun e!16582 () Bool)

(assert (=> b!24337 (= e!16580 e!16582)))

(declare-fun res!21003 () Bool)

(assert (=> b!24337 (=> res!21003 e!16582)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!34812 () (_ BitVec 64))

(declare-fun lt!34819 () (_ BitVec 64))

(assert (=> b!24337 (= res!21003 (not (= lt!34812 (bvsub (bvadd lt!34819 to!314) i!635))))))

(declare-fun lt!34821 () tuple2!2770)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24337 (= lt!34812 (bitIndex!0 (size!697 (buf!1018 (_2!1472 lt!34821))) (currentByte!2331 (_2!1472 lt!34821)) (currentBit!2326 (_2!1472 lt!34821))))))

(declare-fun res!21004 () Bool)

(declare-fun e!16573 () Bool)

(assert (=> start!5700 (=> (not res!21004) (not e!16573))))

(assert (=> start!5700 (= res!21004 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!697 srcBuffer!2))))))))

(assert (=> start!5700 e!16573))

(assert (=> start!5700 true))

(declare-fun array_inv!666 (array!1623) Bool)

(assert (=> start!5700 (array_inv!666 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1226)

(declare-fun e!16577 () Bool)

(declare-fun inv!12 (BitStream!1226) Bool)

(assert (=> start!5700 (and (inv!12 thiss!1379) e!16577)))

(declare-fun b!24338 () Bool)

(declare-fun e!16572 () Bool)

(assert (=> b!24338 (= e!16572 true)))

(declare-fun lt!34824 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24338 (validate_offset_bits!1 ((_ sign_extend 32) (size!697 (buf!1018 (_2!1472 lt!34821)))) ((_ sign_extend 32) (currentByte!2331 (_2!1472 lt!34813))) ((_ sign_extend 32) (currentBit!2326 (_2!1472 lt!34813))) lt!34824)))

(declare-fun lt!34818 () Unit!2037)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1226 array!1623 (_ BitVec 64)) Unit!2037)

(assert (=> b!24338 (= lt!34818 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1472 lt!34813) (buf!1018 (_2!1472 lt!34821)) lt!34824))))

(declare-fun lt!34814 () tuple2!2772)

(declare-fun reader!0 (BitStream!1226 BitStream!1226) tuple2!2772)

(assert (=> b!24338 (= lt!34814 (reader!0 (_2!1472 lt!34813) (_2!1472 lt!34821)))))

(assert (=> b!24338 (validate_offset_bits!1 ((_ sign_extend 32) (size!697 (buf!1018 (_2!1472 lt!34821)))) ((_ sign_extend 32) (currentByte!2331 thiss!1379)) ((_ sign_extend 32) (currentBit!2326 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34825 () Unit!2037)

(assert (=> b!24338 (= lt!34825 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1018 (_2!1472 lt!34821)) (bvsub to!314 i!635)))))

(declare-fun lt!34816 () tuple2!2772)

(assert (=> b!24338 (= lt!34816 (reader!0 thiss!1379 (_2!1472 lt!34821)))))

(declare-fun b!24339 () Bool)

(declare-fun e!16575 () Bool)

(assert (=> b!24339 (= e!16573 (not e!16575))))

(declare-fun res!21005 () Bool)

(assert (=> b!24339 (=> res!21005 e!16575)))

(assert (=> b!24339 (= res!21005 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1226 BitStream!1226) Bool)

(assert (=> b!24339 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34823 () Unit!2037)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1226) Unit!2037)

(assert (=> b!24339 (= lt!34823 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24339 (= lt!34819 (bitIndex!0 (size!697 (buf!1018 thiss!1379)) (currentByte!2331 thiss!1379) (currentBit!2326 thiss!1379)))))

(declare-fun b!24340 () Bool)

(declare-fun res!20995 () Bool)

(assert (=> b!24340 (=> (not res!20995) (not e!16573))))

(assert (=> b!24340 (= res!20995 (validate_offset_bits!1 ((_ sign_extend 32) (size!697 (buf!1018 thiss!1379))) ((_ sign_extend 32) (currentByte!2331 thiss!1379)) ((_ sign_extend 32) (currentBit!2326 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24341 () Bool)

(declare-fun res!21000 () Bool)

(assert (=> b!24341 (=> res!21000 e!16572)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24341 (= res!21000 (not (invariant!0 (currentBit!2326 (_2!1472 lt!34813)) (currentByte!2331 (_2!1472 lt!34813)) (size!697 (buf!1018 (_2!1472 lt!34821))))))))

(declare-fun e!16581 () Bool)

(declare-fun b!24342 () Bool)

(assert (=> b!24342 (= e!16581 (= lt!34812 (bvsub (bvsub (bvadd (bitIndex!0 (size!697 (buf!1018 (_2!1472 lt!34813))) (currentByte!2331 (_2!1472 lt!34813)) (currentBit!2326 (_2!1472 lt!34813))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24343 () Bool)

(declare-fun res!20996 () Bool)

(assert (=> b!24343 (=> res!20996 e!16572)))

(assert (=> b!24343 (= res!20996 (not (invariant!0 (currentBit!2326 (_2!1472 lt!34813)) (currentByte!2331 (_2!1472 lt!34813)) (size!697 (buf!1018 (_2!1472 lt!34813))))))))

(declare-fun b!24344 () Bool)

(declare-fun res!20994 () Bool)

(assert (=> b!24344 (=> res!20994 e!16582)))

(assert (=> b!24344 (= res!20994 (not (invariant!0 (currentBit!2326 (_2!1472 lt!34821)) (currentByte!2331 (_2!1472 lt!34821)) (size!697 (buf!1018 (_2!1472 lt!34821))))))))

(declare-fun b!24345 () Bool)

(declare-fun e!16579 () Bool)

(assert (=> b!24345 (= e!16579 e!16580)))

(declare-fun res!20997 () Bool)

(assert (=> b!24345 (=> res!20997 e!16580)))

(assert (=> b!24345 (= res!20997 (not (isPrefixOf!0 (_2!1472 lt!34813) (_2!1472 lt!34821))))))

(assert (=> b!24345 (isPrefixOf!0 thiss!1379 (_2!1472 lt!34821))))

(declare-fun lt!34815 () Unit!2037)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1226 BitStream!1226 BitStream!1226) Unit!2037)

(assert (=> b!24345 (= lt!34815 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1472 lt!34813) (_2!1472 lt!34821)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1226 array!1623 (_ BitVec 64) (_ BitVec 64)) tuple2!2770)

(assert (=> b!24345 (= lt!34821 (appendBitsMSBFirstLoop!0 (_2!1472 lt!34813) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24345 e!16576))

(declare-fun res!21002 () Bool)

(assert (=> b!24345 (=> (not res!21002) (not e!16576))))

(assert (=> b!24345 (= res!21002 (validate_offset_bits!1 ((_ sign_extend 32) (size!697 (buf!1018 (_2!1472 lt!34813)))) ((_ sign_extend 32) (currentByte!2331 thiss!1379)) ((_ sign_extend 32) (currentBit!2326 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34822 () Unit!2037)

(assert (=> b!24345 (= lt!34822 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1018 (_2!1472 lt!34813)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24345 (= lt!34817 (reader!0 thiss!1379 (_2!1472 lt!34813)))))

(declare-fun b!24346 () Bool)

(assert (=> b!24346 (= e!16577 (array_inv!666 (buf!1018 thiss!1379)))))

(declare-fun b!24347 () Bool)

(declare-fun res!21006 () Bool)

(assert (=> b!24347 (=> res!21006 e!16582)))

(assert (=> b!24347 (= res!21006 (not (= (size!697 (buf!1018 thiss!1379)) (size!697 (buf!1018 (_2!1472 lt!34821))))))))

(declare-fun b!24348 () Bool)

(assert (=> b!24348 (= e!16575 e!16579)))

(declare-fun res!21001 () Bool)

(assert (=> b!24348 (=> res!21001 e!16579)))

(assert (=> b!24348 (= res!21001 (not (isPrefixOf!0 thiss!1379 (_2!1472 lt!34813))))))

(assert (=> b!24348 (validate_offset_bits!1 ((_ sign_extend 32) (size!697 (buf!1018 (_2!1472 lt!34813)))) ((_ sign_extend 32) (currentByte!2331 (_2!1472 lt!34813))) ((_ sign_extend 32) (currentBit!2326 (_2!1472 lt!34813))) lt!34824)))

(assert (=> b!24348 (= lt!34824 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34820 () Unit!2037)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1226 BitStream!1226 (_ BitVec 64) (_ BitVec 64)) Unit!2037)

(assert (=> b!24348 (= lt!34820 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1472 lt!34813) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1226 (_ BitVec 8) (_ BitVec 32)) tuple2!2770)

(assert (=> b!24348 (= lt!34813 (appendBitFromByte!0 thiss!1379 (select (arr!1153 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24349 () Bool)

(assert (=> b!24349 (= e!16582 e!16572)))

(declare-fun res!20999 () Bool)

(assert (=> b!24349 (=> res!20999 e!16572)))

(assert (=> b!24349 (= res!20999 (not (= (size!697 (buf!1018 (_2!1472 lt!34813))) (size!697 (buf!1018 (_2!1472 lt!34821))))))))

(assert (=> b!24349 e!16581))

(declare-fun res!20998 () Bool)

(assert (=> b!24349 (=> (not res!20998) (not e!16581))))

(assert (=> b!24349 (= res!20998 (= (size!697 (buf!1018 (_2!1472 lt!34821))) (size!697 (buf!1018 thiss!1379))))))

(assert (= (and start!5700 res!21004) b!24340))

(assert (= (and b!24340 res!20995) b!24339))

(assert (= (and b!24339 (not res!21005)) b!24348))

(assert (= (and b!24348 (not res!21001)) b!24345))

(assert (= (and b!24345 res!21002) b!24336))

(assert (= (and b!24345 (not res!20997)) b!24337))

(assert (= (and b!24337 (not res!21003)) b!24344))

(assert (= (and b!24344 (not res!20994)) b!24347))

(assert (= (and b!24347 (not res!21006)) b!24349))

(assert (= (and b!24349 res!20998) b!24342))

(assert (= (and b!24349 (not res!20999)) b!24343))

(assert (= (and b!24343 (not res!20996)) b!24341))

(assert (= (and b!24341 (not res!21000)) b!24338))

(assert (= start!5700 b!24346))

(declare-fun m!34345 () Bool)

(assert (=> b!24340 m!34345))

(declare-fun m!34347 () Bool)

(assert (=> b!24343 m!34347))

(declare-fun m!34349 () Bool)

(assert (=> b!24342 m!34349))

(declare-fun m!34351 () Bool)

(assert (=> b!24345 m!34351))

(declare-fun m!34353 () Bool)

(assert (=> b!24345 m!34353))

(declare-fun m!34355 () Bool)

(assert (=> b!24345 m!34355))

(declare-fun m!34357 () Bool)

(assert (=> b!24345 m!34357))

(declare-fun m!34359 () Bool)

(assert (=> b!24345 m!34359))

(declare-fun m!34361 () Bool)

(assert (=> b!24345 m!34361))

(declare-fun m!34363 () Bool)

(assert (=> b!24345 m!34363))

(declare-fun m!34365 () Bool)

(assert (=> start!5700 m!34365))

(declare-fun m!34367 () Bool)

(assert (=> start!5700 m!34367))

(declare-fun m!34369 () Bool)

(assert (=> b!24336 m!34369))

(assert (=> b!24336 m!34369))

(declare-fun m!34371 () Bool)

(assert (=> b!24336 m!34371))

(declare-fun m!34373 () Bool)

(assert (=> b!24336 m!34373))

(assert (=> b!24336 m!34373))

(declare-fun m!34375 () Bool)

(assert (=> b!24336 m!34375))

(declare-fun m!34377 () Bool)

(assert (=> b!24341 m!34377))

(declare-fun m!34379 () Bool)

(assert (=> b!24337 m!34379))

(declare-fun m!34381 () Bool)

(assert (=> b!24339 m!34381))

(declare-fun m!34383 () Bool)

(assert (=> b!24339 m!34383))

(declare-fun m!34385 () Bool)

(assert (=> b!24339 m!34385))

(declare-fun m!34387 () Bool)

(assert (=> b!24344 m!34387))

(declare-fun m!34389 () Bool)

(assert (=> b!24346 m!34389))

(declare-fun m!34391 () Bool)

(assert (=> b!24338 m!34391))

(declare-fun m!34393 () Bool)

(assert (=> b!24338 m!34393))

(declare-fun m!34395 () Bool)

(assert (=> b!24338 m!34395))

(declare-fun m!34397 () Bool)

(assert (=> b!24338 m!34397))

(declare-fun m!34399 () Bool)

(assert (=> b!24338 m!34399))

(declare-fun m!34401 () Bool)

(assert (=> b!24338 m!34401))

(declare-fun m!34403 () Bool)

(assert (=> b!24348 m!34403))

(declare-fun m!34405 () Bool)

(assert (=> b!24348 m!34405))

(declare-fun m!34407 () Bool)

(assert (=> b!24348 m!34407))

(declare-fun m!34409 () Bool)

(assert (=> b!24348 m!34409))

(declare-fun m!34411 () Bool)

(assert (=> b!24348 m!34411))

(assert (=> b!24348 m!34407))

(push 1)

(assert (not b!24336))

(assert (not b!24341))

(assert (not b!24346))

(assert (not b!24344))

(assert (not b!24339))

(assert (not b!24348))

(assert (not b!24340))

(assert (not start!5700))

(assert (not b!24345))

(assert (not b!24342))

(assert (not b!24343))

(assert (not b!24337))

(assert (not b!24338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

