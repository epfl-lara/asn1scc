; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5670 () Bool)

(assert start!5670)

(declare-fun res!20419 () Bool)

(declare-fun e!16079 () Bool)

(assert (=> start!5670 (=> (not res!20419) (not e!16079))))

(declare-datatypes ((array!1593 0))(
  ( (array!1594 (arr!1138 (Array (_ BitVec 32) (_ BitVec 8))) (size!682 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1593)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5670 (= res!20419 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!682 srcBuffer!2))))))))

(assert (=> start!5670 e!16079))

(assert (=> start!5670 true))

(declare-fun array_inv!651 (array!1593) Bool)

(assert (=> start!5670 (array_inv!651 srcBuffer!2)))

(declare-datatypes ((BitStream!1196 0))(
  ( (BitStream!1197 (buf!1003 array!1593) (currentByte!2316 (_ BitVec 32)) (currentBit!2311 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1196)

(declare-fun e!16078 () Bool)

(declare-fun inv!12 (BitStream!1196) Bool)

(assert (=> start!5670 (and (inv!12 thiss!1379) e!16078)))

(declare-fun b!23706 () Bool)

(declare-fun res!20410 () Bool)

(declare-fun e!16083 () Bool)

(assert (=> b!23706 (=> res!20410 e!16083)))

(declare-datatypes ((Unit!2007 0))(
  ( (Unit!2008) )
))
(declare-datatypes ((tuple2!2710 0))(
  ( (tuple2!2711 (_1!1442 Unit!2007) (_2!1442 BitStream!1196)) )
))
(declare-fun lt!34209 () tuple2!2710)

(assert (=> b!23706 (= res!20410 (not (= (size!682 (buf!1003 thiss!1379)) (size!682 (buf!1003 (_2!1442 lt!34209))))))))

(declare-fun b!23707 () Bool)

(declare-fun e!16081 () Bool)

(assert (=> b!23707 (= e!16081 true)))

(declare-datatypes ((tuple2!2712 0))(
  ( (tuple2!2713 (_1!1443 BitStream!1196) (_2!1443 BitStream!1196)) )
))
(declare-fun lt!34212 () tuple2!2712)

(declare-fun lt!34202 () tuple2!2710)

(declare-fun reader!0 (BitStream!1196 BitStream!1196) tuple2!2712)

(assert (=> b!23707 (= lt!34212 (reader!0 (_2!1442 lt!34202) (_2!1442 lt!34209)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23707 (validate_offset_bits!1 ((_ sign_extend 32) (size!682 (buf!1003 (_2!1442 lt!34209)))) ((_ sign_extend 32) (currentByte!2316 thiss!1379)) ((_ sign_extend 32) (currentBit!2311 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34210 () Unit!2007)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1196 array!1593 (_ BitVec 64)) Unit!2007)

(assert (=> b!23707 (= lt!34210 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1003 (_2!1442 lt!34209)) (bvsub to!314 i!635)))))

(declare-fun lt!34208 () tuple2!2712)

(assert (=> b!23707 (= lt!34208 (reader!0 thiss!1379 (_2!1442 lt!34209)))))

(declare-fun b!23708 () Bool)

(declare-fun e!16087 () Bool)

(declare-fun lt!34203 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23708 (= e!16087 (= lt!34203 (bvsub (bvsub (bvadd (bitIndex!0 (size!682 (buf!1003 (_2!1442 lt!34202))) (currentByte!2316 (_2!1442 lt!34202)) (currentBit!2311 (_2!1442 lt!34202))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23709 () Bool)

(declare-fun res!20415 () Bool)

(assert (=> b!23709 (=> res!20415 e!16081)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23709 (= res!20415 (not (invariant!0 (currentBit!2311 (_2!1442 lt!34202)) (currentByte!2316 (_2!1442 lt!34202)) (size!682 (buf!1003 (_2!1442 lt!34202))))))))

(declare-fun b!23710 () Bool)

(declare-fun e!16082 () Bool)

(declare-fun lt!34204 () tuple2!2712)

(declare-datatypes ((List!299 0))(
  ( (Nil!296) (Cons!295 (h!414 Bool) (t!1049 List!299)) )
))
(declare-fun head!136 (List!299) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1196 array!1593 (_ BitVec 64) (_ BitVec 64)) List!299)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1196 BitStream!1196 (_ BitVec 64)) List!299)

(assert (=> b!23710 (= e!16082 (= (head!136 (byteArrayBitContentToList!0 (_2!1442 lt!34202) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!136 (bitStreamReadBitsIntoList!0 (_2!1442 lt!34202) (_1!1443 lt!34204) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23711 () Bool)

(declare-fun res!20411 () Bool)

(assert (=> b!23711 (=> res!20411 e!16083)))

(assert (=> b!23711 (= res!20411 (not (invariant!0 (currentBit!2311 (_2!1442 lt!34209)) (currentByte!2316 (_2!1442 lt!34209)) (size!682 (buf!1003 (_2!1442 lt!34209))))))))

(declare-fun b!23712 () Bool)

(assert (=> b!23712 (= e!16078 (array_inv!651 (buf!1003 thiss!1379)))))

(declare-fun b!23713 () Bool)

(declare-fun res!20409 () Bool)

(assert (=> b!23713 (=> (not res!20409) (not e!16079))))

(assert (=> b!23713 (= res!20409 (validate_offset_bits!1 ((_ sign_extend 32) (size!682 (buf!1003 thiss!1379))) ((_ sign_extend 32) (currentByte!2316 thiss!1379)) ((_ sign_extend 32) (currentBit!2311 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23714 () Bool)

(declare-fun e!16084 () Bool)

(declare-fun e!16077 () Bool)

(assert (=> b!23714 (= e!16084 e!16077)))

(declare-fun res!20414 () Bool)

(assert (=> b!23714 (=> res!20414 e!16077)))

(declare-fun isPrefixOf!0 (BitStream!1196 BitStream!1196) Bool)

(assert (=> b!23714 (= res!20414 (not (isPrefixOf!0 (_2!1442 lt!34202) (_2!1442 lt!34209))))))

(assert (=> b!23714 (isPrefixOf!0 thiss!1379 (_2!1442 lt!34209))))

(declare-fun lt!34206 () Unit!2007)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1196 BitStream!1196 BitStream!1196) Unit!2007)

(assert (=> b!23714 (= lt!34206 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1442 lt!34202) (_2!1442 lt!34209)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1196 array!1593 (_ BitVec 64) (_ BitVec 64)) tuple2!2710)

(assert (=> b!23714 (= lt!34209 (appendBitsMSBFirstLoop!0 (_2!1442 lt!34202) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!23714 e!16082))

(declare-fun res!20420 () Bool)

(assert (=> b!23714 (=> (not res!20420) (not e!16082))))

(assert (=> b!23714 (= res!20420 (validate_offset_bits!1 ((_ sign_extend 32) (size!682 (buf!1003 (_2!1442 lt!34202)))) ((_ sign_extend 32) (currentByte!2316 thiss!1379)) ((_ sign_extend 32) (currentBit!2311 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34211 () Unit!2007)

(assert (=> b!23714 (= lt!34211 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1003 (_2!1442 lt!34202)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!23714 (= lt!34204 (reader!0 thiss!1379 (_2!1442 lt!34202)))))

(declare-fun b!23715 () Bool)

(assert (=> b!23715 (= e!16077 e!16083)))

(declare-fun res!20418 () Bool)

(assert (=> b!23715 (=> res!20418 e!16083)))

(declare-fun lt!34207 () (_ BitVec 64))

(assert (=> b!23715 (= res!20418 (not (= lt!34203 (bvsub (bvadd lt!34207 to!314) i!635))))))

(assert (=> b!23715 (= lt!34203 (bitIndex!0 (size!682 (buf!1003 (_2!1442 lt!34209))) (currentByte!2316 (_2!1442 lt!34209)) (currentBit!2311 (_2!1442 lt!34209))))))

(declare-fun b!23716 () Bool)

(declare-fun e!16080 () Bool)

(assert (=> b!23716 (= e!16079 (not e!16080))))

(declare-fun res!20413 () Bool)

(assert (=> b!23716 (=> res!20413 e!16080)))

(assert (=> b!23716 (= res!20413 (bvsge i!635 to!314))))

(assert (=> b!23716 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34213 () Unit!2007)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1196) Unit!2007)

(assert (=> b!23716 (= lt!34213 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23716 (= lt!34207 (bitIndex!0 (size!682 (buf!1003 thiss!1379)) (currentByte!2316 thiss!1379) (currentBit!2311 thiss!1379)))))

(declare-fun b!23717 () Bool)

(assert (=> b!23717 (= e!16083 e!16081)))

(declare-fun res!20412 () Bool)

(assert (=> b!23717 (=> res!20412 e!16081)))

(assert (=> b!23717 (= res!20412 (not (= (size!682 (buf!1003 (_2!1442 lt!34202))) (size!682 (buf!1003 (_2!1442 lt!34209))))))))

(assert (=> b!23717 e!16087))

(declare-fun res!20417 () Bool)

(assert (=> b!23717 (=> (not res!20417) (not e!16087))))

(assert (=> b!23717 (= res!20417 (= (size!682 (buf!1003 (_2!1442 lt!34209))) (size!682 (buf!1003 thiss!1379))))))

(declare-fun b!23718 () Bool)

(assert (=> b!23718 (= e!16080 e!16084)))

(declare-fun res!20421 () Bool)

(assert (=> b!23718 (=> res!20421 e!16084)))

(assert (=> b!23718 (= res!20421 (not (isPrefixOf!0 thiss!1379 (_2!1442 lt!34202))))))

(assert (=> b!23718 (validate_offset_bits!1 ((_ sign_extend 32) (size!682 (buf!1003 (_2!1442 lt!34202)))) ((_ sign_extend 32) (currentByte!2316 (_2!1442 lt!34202))) ((_ sign_extend 32) (currentBit!2311 (_2!1442 lt!34202))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34205 () Unit!2007)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1196 BitStream!1196 (_ BitVec 64) (_ BitVec 64)) Unit!2007)

(assert (=> b!23718 (= lt!34205 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1442 lt!34202) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1196 (_ BitVec 8) (_ BitVec 32)) tuple2!2710)

(assert (=> b!23718 (= lt!34202 (appendBitFromByte!0 thiss!1379 (select (arr!1138 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23719 () Bool)

(declare-fun res!20416 () Bool)

(assert (=> b!23719 (=> res!20416 e!16081)))

(assert (=> b!23719 (= res!20416 (not (invariant!0 (currentBit!2311 (_2!1442 lt!34202)) (currentByte!2316 (_2!1442 lt!34202)) (size!682 (buf!1003 (_2!1442 lt!34209))))))))

(assert (= (and start!5670 res!20419) b!23713))

(assert (= (and b!23713 res!20409) b!23716))

(assert (= (and b!23716 (not res!20413)) b!23718))

(assert (= (and b!23718 (not res!20421)) b!23714))

(assert (= (and b!23714 res!20420) b!23710))

(assert (= (and b!23714 (not res!20414)) b!23715))

(assert (= (and b!23715 (not res!20418)) b!23711))

(assert (= (and b!23711 (not res!20411)) b!23706))

(assert (= (and b!23706 (not res!20410)) b!23717))

(assert (= (and b!23717 res!20417) b!23708))

(assert (= (and b!23717 (not res!20412)) b!23709))

(assert (= (and b!23709 (not res!20415)) b!23719))

(assert (= (and b!23719 (not res!20416)) b!23707))

(assert (= start!5670 b!23712))

(declare-fun m!33341 () Bool)

(assert (=> b!23714 m!33341))

(declare-fun m!33343 () Bool)

(assert (=> b!23714 m!33343))

(declare-fun m!33345 () Bool)

(assert (=> b!23714 m!33345))

(declare-fun m!33347 () Bool)

(assert (=> b!23714 m!33347))

(declare-fun m!33349 () Bool)

(assert (=> b!23714 m!33349))

(declare-fun m!33351 () Bool)

(assert (=> b!23714 m!33351))

(declare-fun m!33353 () Bool)

(assert (=> b!23714 m!33353))

(declare-fun m!33355 () Bool)

(assert (=> start!5670 m!33355))

(declare-fun m!33357 () Bool)

(assert (=> start!5670 m!33357))

(declare-fun m!33359 () Bool)

(assert (=> b!23718 m!33359))

(declare-fun m!33361 () Bool)

(assert (=> b!23718 m!33361))

(assert (=> b!23718 m!33361))

(declare-fun m!33363 () Bool)

(assert (=> b!23718 m!33363))

(declare-fun m!33365 () Bool)

(assert (=> b!23718 m!33365))

(declare-fun m!33367 () Bool)

(assert (=> b!23718 m!33367))

(declare-fun m!33369 () Bool)

(assert (=> b!23712 m!33369))

(declare-fun m!33371 () Bool)

(assert (=> b!23713 m!33371))

(declare-fun m!33373 () Bool)

(assert (=> b!23709 m!33373))

(declare-fun m!33375 () Bool)

(assert (=> b!23708 m!33375))

(declare-fun m!33377 () Bool)

(assert (=> b!23710 m!33377))

(assert (=> b!23710 m!33377))

(declare-fun m!33379 () Bool)

(assert (=> b!23710 m!33379))

(declare-fun m!33381 () Bool)

(assert (=> b!23710 m!33381))

(assert (=> b!23710 m!33381))

(declare-fun m!33383 () Bool)

(assert (=> b!23710 m!33383))

(declare-fun m!33385 () Bool)

(assert (=> b!23707 m!33385))

(declare-fun m!33387 () Bool)

(assert (=> b!23707 m!33387))

(declare-fun m!33389 () Bool)

(assert (=> b!23707 m!33389))

(declare-fun m!33391 () Bool)

(assert (=> b!23707 m!33391))

(declare-fun m!33393 () Bool)

(assert (=> b!23716 m!33393))

(declare-fun m!33395 () Bool)

(assert (=> b!23716 m!33395))

(declare-fun m!33397 () Bool)

(assert (=> b!23716 m!33397))

(declare-fun m!33399 () Bool)

(assert (=> b!23711 m!33399))

(declare-fun m!33401 () Bool)

(assert (=> b!23715 m!33401))

(declare-fun m!33403 () Bool)

(assert (=> b!23719 m!33403))

(push 1)

(assert (not b!23710))

(assert (not b!23716))

(assert (not b!23707))

(assert (not b!23714))

(assert (not b!23709))

(assert (not b!23719))

(assert (not b!23708))

(assert (not b!23715))

(assert (not b!23713))

(assert (not start!5670))

(assert (not b!23711))

(assert (not b!23712))

(assert (not b!23718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

