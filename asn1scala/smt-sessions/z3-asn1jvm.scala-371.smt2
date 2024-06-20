; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8638 () Bool)

(assert start!8638)

(declare-fun b!43034 () Bool)

(declare-fun e!28739 () Bool)

(declare-datatypes ((array!2202 0))(
  ( (array!2203 (arr!1497 (Array (_ BitVec 32) (_ BitVec 8))) (size!995 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1734 0))(
  ( (BitStream!1735 (buf!1329 array!2202) (currentByte!2795 (_ BitVec 32)) (currentBit!2790 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1734)

(declare-fun array_inv!920 (array!2202) Bool)

(assert (=> b!43034 (= e!28739 (array_inv!920 (buf!1329 thiss!1379)))))

(declare-fun res!36565 () Bool)

(declare-fun e!28733 () Bool)

(assert (=> start!8638 (=> (not res!36565) (not e!28733))))

(declare-fun srcBuffer!2 () array!2202)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8638 (= res!36565 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!995 srcBuffer!2))))))))

(assert (=> start!8638 e!28733))

(assert (=> start!8638 true))

(assert (=> start!8638 (array_inv!920 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1734) Bool)

(assert (=> start!8638 (and (inv!12 thiss!1379) e!28739)))

(declare-fun b!43035 () Bool)

(declare-fun res!36564 () Bool)

(assert (=> b!43035 (=> (not res!36564) (not e!28733))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43035 (= res!36564 (validate_offset_bits!1 ((_ sign_extend 32) (size!995 (buf!1329 thiss!1379))) ((_ sign_extend 32) (currentByte!2795 thiss!1379)) ((_ sign_extend 32) (currentBit!2790 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!43036 () Bool)

(declare-fun e!28734 () Bool)

(assert (=> b!43036 (= e!28733 (not e!28734))))

(declare-fun res!36563 () Bool)

(assert (=> b!43036 (=> res!36563 e!28734)))

(assert (=> b!43036 (= res!36563 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1734 BitStream!1734) Bool)

(assert (=> b!43036 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3060 0))(
  ( (Unit!3061) )
))
(declare-fun lt!64932 () Unit!3060)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1734) Unit!3060)

(assert (=> b!43036 (= lt!64932 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!64933 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43036 (= lt!64933 (bitIndex!0 (size!995 (buf!1329 thiss!1379)) (currentByte!2795 thiss!1379) (currentBit!2790 thiss!1379)))))

(declare-fun b!43037 () Bool)

(declare-fun e!28738 () Bool)

(assert (=> b!43037 (= e!28734 e!28738)))

(declare-fun res!36566 () Bool)

(assert (=> b!43037 (=> res!36566 e!28738)))

(declare-datatypes ((tuple2!4218 0))(
  ( (tuple2!4219 (_1!2202 Unit!3060) (_2!2202 BitStream!1734)) )
))
(declare-fun lt!64936 () tuple2!4218)

(assert (=> b!43037 (= res!36566 (not (isPrefixOf!0 thiss!1379 (_2!2202 lt!64936))))))

(assert (=> b!43037 (validate_offset_bits!1 ((_ sign_extend 32) (size!995 (buf!1329 (_2!2202 lt!64936)))) ((_ sign_extend 32) (currentByte!2795 (_2!2202 lt!64936))) ((_ sign_extend 32) (currentBit!2790 (_2!2202 lt!64936))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64935 () Unit!3060)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1734 BitStream!1734 (_ BitVec 64) (_ BitVec 64)) Unit!3060)

(assert (=> b!43037 (= lt!64935 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2202 lt!64936) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1734 (_ BitVec 8) (_ BitVec 32)) tuple2!4218)

(assert (=> b!43037 (= lt!64936 (appendBitFromByte!0 thiss!1379 (select (arr!1497 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!43038 () Bool)

(assert (=> b!43038 (= e!28738 true)))

(declare-fun lt!64929 () Bool)

(declare-fun lt!64934 () tuple2!4218)

(assert (=> b!43038 (= lt!64929 (isPrefixOf!0 (_2!2202 lt!64936) (_2!2202 lt!64934)))))

(assert (=> b!43038 (isPrefixOf!0 thiss!1379 (_2!2202 lt!64934))))

(declare-fun lt!64928 () Unit!3060)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1734 BitStream!1734 BitStream!1734) Unit!3060)

(assert (=> b!43038 (= lt!64928 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2202 lt!64936) (_2!2202 lt!64934)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1734 array!2202 (_ BitVec 64) (_ BitVec 64)) tuple2!4218)

(assert (=> b!43038 (= lt!64934 (appendBitsMSBFirstLoop!0 (_2!2202 lt!64936) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!28736 () Bool)

(assert (=> b!43038 e!28736))

(declare-fun res!36567 () Bool)

(assert (=> b!43038 (=> (not res!36567) (not e!28736))))

(assert (=> b!43038 (= res!36567 (validate_offset_bits!1 ((_ sign_extend 32) (size!995 (buf!1329 (_2!2202 lt!64936)))) ((_ sign_extend 32) (currentByte!2795 thiss!1379)) ((_ sign_extend 32) (currentBit!2790 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64930 () Unit!3060)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1734 array!2202 (_ BitVec 64)) Unit!3060)

(assert (=> b!43038 (= lt!64930 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1329 (_2!2202 lt!64936)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4220 0))(
  ( (tuple2!4221 (_1!2203 BitStream!1734) (_2!2203 BitStream!1734)) )
))
(declare-fun lt!64931 () tuple2!4220)

(declare-fun reader!0 (BitStream!1734 BitStream!1734) tuple2!4220)

(assert (=> b!43038 (= lt!64931 (reader!0 thiss!1379 (_2!2202 lt!64936)))))

(declare-fun b!43039 () Bool)

(declare-datatypes ((List!508 0))(
  ( (Nil!505) (Cons!504 (h!623 Bool) (t!1258 List!508)) )
))
(declare-fun head!327 (List!508) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1734 array!2202 (_ BitVec 64) (_ BitVec 64)) List!508)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1734 BitStream!1734 (_ BitVec 64)) List!508)

(assert (=> b!43039 (= e!28736 (= (head!327 (byteArrayBitContentToList!0 (_2!2202 lt!64936) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!327 (bitStreamReadBitsIntoList!0 (_2!2202 lt!64936) (_1!2203 lt!64931) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!8638 res!36565) b!43035))

(assert (= (and b!43035 res!36564) b!43036))

(assert (= (and b!43036 (not res!36563)) b!43037))

(assert (= (and b!43037 (not res!36566)) b!43038))

(assert (= (and b!43038 res!36567) b!43039))

(assert (= start!8638 b!43034))

(declare-fun m!65363 () Bool)

(assert (=> b!43034 m!65363))

(declare-fun m!65365 () Bool)

(assert (=> b!43038 m!65365))

(declare-fun m!65367 () Bool)

(assert (=> b!43038 m!65367))

(declare-fun m!65369 () Bool)

(assert (=> b!43038 m!65369))

(declare-fun m!65371 () Bool)

(assert (=> b!43038 m!65371))

(declare-fun m!65373 () Bool)

(assert (=> b!43038 m!65373))

(declare-fun m!65375 () Bool)

(assert (=> b!43038 m!65375))

(declare-fun m!65377 () Bool)

(assert (=> b!43038 m!65377))

(declare-fun m!65379 () Bool)

(assert (=> b!43039 m!65379))

(assert (=> b!43039 m!65379))

(declare-fun m!65381 () Bool)

(assert (=> b!43039 m!65381))

(declare-fun m!65383 () Bool)

(assert (=> b!43039 m!65383))

(assert (=> b!43039 m!65383))

(declare-fun m!65385 () Bool)

(assert (=> b!43039 m!65385))

(declare-fun m!65387 () Bool)

(assert (=> b!43037 m!65387))

(declare-fun m!65389 () Bool)

(assert (=> b!43037 m!65389))

(declare-fun m!65391 () Bool)

(assert (=> b!43037 m!65391))

(declare-fun m!65393 () Bool)

(assert (=> b!43037 m!65393))

(declare-fun m!65395 () Bool)

(assert (=> b!43037 m!65395))

(assert (=> b!43037 m!65389))

(declare-fun m!65397 () Bool)

(assert (=> b!43035 m!65397))

(declare-fun m!65399 () Bool)

(assert (=> start!8638 m!65399))

(declare-fun m!65401 () Bool)

(assert (=> start!8638 m!65401))

(declare-fun m!65403 () Bool)

(assert (=> b!43036 m!65403))

(declare-fun m!65405 () Bool)

(assert (=> b!43036 m!65405))

(declare-fun m!65407 () Bool)

(assert (=> b!43036 m!65407))

(check-sat (not b!43037) (not b!43034) (not b!43039) (not b!43036) (not start!8638) (not b!43035) (not b!43038))
