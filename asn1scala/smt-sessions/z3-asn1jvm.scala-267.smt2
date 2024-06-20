; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5160 () Bool)

(assert start!5160)

(declare-fun res!18027 () Bool)

(declare-fun e!14092 () Bool)

(assert (=> start!5160 (=> (not res!18027) (not e!14092))))

(declare-datatypes ((array!1495 0))(
  ( (array!1496 (arr!1082 (Array (_ BitVec 32) (_ BitVec 8))) (size!638 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1495)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5160 (= res!18027 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!638 srcBuffer!2))))))))

(assert (=> start!5160 e!14092))

(assert (=> start!5160 true))

(declare-fun array_inv!608 (array!1495) Bool)

(assert (=> start!5160 (array_inv!608 srcBuffer!2)))

(declare-datatypes ((BitStream!1110 0))(
  ( (BitStream!1111 (buf!947 array!1495) (currentByte!2236 (_ BitVec 32)) (currentBit!2231 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1110)

(declare-fun e!14093 () Bool)

(declare-fun inv!12 (BitStream!1110) Bool)

(assert (=> start!5160 (and (inv!12 thiss!1379) e!14093)))

(declare-fun b!20763 () Bool)

(declare-fun e!14091 () Bool)

(assert (=> b!20763 (= e!14091 true)))

(declare-fun lt!29465 () Bool)

(declare-datatypes ((Unit!1829 0))(
  ( (Unit!1830) )
))
(declare-datatypes ((tuple2!2460 0))(
  ( (tuple2!2461 (_1!1315 Unit!1829) (_2!1315 BitStream!1110)) )
))
(declare-fun lt!29466 () tuple2!2460)

(declare-fun isPrefixOf!0 (BitStream!1110 BitStream!1110) Bool)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1110 array!1495 (_ BitVec 64) (_ BitVec 64)) tuple2!2460)

(assert (=> b!20763 (= lt!29465 (isPrefixOf!0 (_2!1315 lt!29466) (_2!1315 (appendBitsMSBFirstLoop!0 (_2!1315 lt!29466) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))

(declare-fun e!14095 () Bool)

(assert (=> b!20763 e!14095))

(declare-fun res!18029 () Bool)

(assert (=> b!20763 (=> (not res!18029) (not e!14095))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20763 (= res!18029 (validate_offset_bits!1 ((_ sign_extend 32) (size!638 (buf!947 (_2!1315 lt!29466)))) ((_ sign_extend 32) (currentByte!2236 thiss!1379)) ((_ sign_extend 32) (currentBit!2231 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29464 () Unit!1829)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1110 array!1495 (_ BitVec 64)) Unit!1829)

(assert (=> b!20763 (= lt!29464 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!947 (_2!1315 lt!29466)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2462 0))(
  ( (tuple2!2463 (_1!1316 BitStream!1110) (_2!1316 BitStream!1110)) )
))
(declare-fun lt!29463 () tuple2!2462)

(declare-fun reader!0 (BitStream!1110 BitStream!1110) tuple2!2462)

(assert (=> b!20763 (= lt!29463 (reader!0 thiss!1379 (_2!1315 lt!29466)))))

(declare-fun b!20764 () Bool)

(declare-fun e!14096 () Bool)

(assert (=> b!20764 (= e!14092 (not e!14096))))

(declare-fun res!18026 () Bool)

(assert (=> b!20764 (=> res!18026 e!14096)))

(assert (=> b!20764 (= res!18026 (bvsge i!635 to!314))))

(assert (=> b!20764 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29462 () Unit!1829)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1110) Unit!1829)

(assert (=> b!20764 (= lt!29462 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29467 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20764 (= lt!29467 (bitIndex!0 (size!638 (buf!947 thiss!1379)) (currentByte!2236 thiss!1379) (currentBit!2231 thiss!1379)))))

(declare-fun b!20765 () Bool)

(assert (=> b!20765 (= e!14093 (array_inv!608 (buf!947 thiss!1379)))))

(declare-fun b!20766 () Bool)

(declare-fun res!18025 () Bool)

(assert (=> b!20766 (=> (not res!18025) (not e!14092))))

(assert (=> b!20766 (= res!18025 (validate_offset_bits!1 ((_ sign_extend 32) (size!638 (buf!947 thiss!1379))) ((_ sign_extend 32) (currentByte!2236 thiss!1379)) ((_ sign_extend 32) (currentBit!2231 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20767 () Bool)

(assert (=> b!20767 (= e!14096 e!14091)))

(declare-fun res!18028 () Bool)

(assert (=> b!20767 (=> res!18028 e!14091)))

(assert (=> b!20767 (= res!18028 (not (isPrefixOf!0 thiss!1379 (_2!1315 lt!29466))))))

(assert (=> b!20767 (validate_offset_bits!1 ((_ sign_extend 32) (size!638 (buf!947 (_2!1315 lt!29466)))) ((_ sign_extend 32) (currentByte!2236 (_2!1315 lt!29466))) ((_ sign_extend 32) (currentBit!2231 (_2!1315 lt!29466))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29461 () Unit!1829)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1110 BitStream!1110 (_ BitVec 64) (_ BitVec 64)) Unit!1829)

(assert (=> b!20767 (= lt!29461 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1315 lt!29466) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1110 (_ BitVec 8) (_ BitVec 32)) tuple2!2460)

(assert (=> b!20767 (= lt!29466 (appendBitFromByte!0 thiss!1379 (select (arr!1082 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20768 () Bool)

(declare-datatypes ((List!256 0))(
  ( (Nil!253) (Cons!252 (h!371 Bool) (t!1006 List!256)) )
))
(declare-fun head!93 (List!256) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1110 array!1495 (_ BitVec 64) (_ BitVec 64)) List!256)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1110 BitStream!1110 (_ BitVec 64)) List!256)

(assert (=> b!20768 (= e!14095 (= (head!93 (byteArrayBitContentToList!0 (_2!1315 lt!29466) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!93 (bitStreamReadBitsIntoList!0 (_2!1315 lt!29466) (_1!1316 lt!29463) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5160 res!18027) b!20766))

(assert (= (and b!20766 res!18025) b!20764))

(assert (= (and b!20764 (not res!18026)) b!20767))

(assert (= (and b!20767 (not res!18028)) b!20763))

(assert (= (and b!20763 res!18029) b!20768))

(assert (= start!5160 b!20765))

(declare-fun m!28395 () Bool)

(assert (=> b!20767 m!28395))

(declare-fun m!28397 () Bool)

(assert (=> b!20767 m!28397))

(declare-fun m!28399 () Bool)

(assert (=> b!20767 m!28399))

(declare-fun m!28401 () Bool)

(assert (=> b!20767 m!28401))

(assert (=> b!20767 m!28397))

(declare-fun m!28403 () Bool)

(assert (=> b!20767 m!28403))

(declare-fun m!28405 () Bool)

(assert (=> b!20765 m!28405))

(declare-fun m!28407 () Bool)

(assert (=> start!5160 m!28407))

(declare-fun m!28409 () Bool)

(assert (=> start!5160 m!28409))

(declare-fun m!28411 () Bool)

(assert (=> b!20764 m!28411))

(declare-fun m!28413 () Bool)

(assert (=> b!20764 m!28413))

(declare-fun m!28415 () Bool)

(assert (=> b!20764 m!28415))

(declare-fun m!28417 () Bool)

(assert (=> b!20766 m!28417))

(declare-fun m!28419 () Bool)

(assert (=> b!20763 m!28419))

(declare-fun m!28421 () Bool)

(assert (=> b!20763 m!28421))

(declare-fun m!28423 () Bool)

(assert (=> b!20763 m!28423))

(declare-fun m!28425 () Bool)

(assert (=> b!20763 m!28425))

(declare-fun m!28427 () Bool)

(assert (=> b!20763 m!28427))

(declare-fun m!28429 () Bool)

(assert (=> b!20768 m!28429))

(assert (=> b!20768 m!28429))

(declare-fun m!28431 () Bool)

(assert (=> b!20768 m!28431))

(declare-fun m!28433 () Bool)

(assert (=> b!20768 m!28433))

(assert (=> b!20768 m!28433))

(declare-fun m!28435 () Bool)

(assert (=> b!20768 m!28435))

(check-sat (not b!20766) (not b!20764) (not start!5160) (not b!20768) (not b!20763) (not b!20767) (not b!20765))
