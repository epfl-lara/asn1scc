; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5162 () Bool)

(assert start!5162)

(declare-datatypes ((array!1497 0))(
  ( (array!1498 (arr!1083 (Array (_ BitVec 32) (_ BitVec 8))) (size!639 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1497)

(declare-datatypes ((BitStream!1112 0))(
  ( (BitStream!1113 (buf!948 array!1497) (currentByte!2237 (_ BitVec 32)) (currentBit!2232 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2464 0))(
  ( (tuple2!2465 (_1!1317 BitStream!1112) (_2!1317 BitStream!1112)) )
))
(declare-fun lt!29488 () tuple2!2464)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!14112 () Bool)

(declare-fun b!20781 () Bool)

(declare-datatypes ((Unit!1831 0))(
  ( (Unit!1832) )
))
(declare-datatypes ((tuple2!2466 0))(
  ( (tuple2!2467 (_1!1318 Unit!1831) (_2!1318 BitStream!1112)) )
))
(declare-fun lt!29487 () tuple2!2466)

(declare-datatypes ((List!257 0))(
  ( (Nil!254) (Cons!253 (h!372 Bool) (t!1007 List!257)) )
))
(declare-fun head!94 (List!257) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1112 array!1497 (_ BitVec 64) (_ BitVec 64)) List!257)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1112 BitStream!1112 (_ BitVec 64)) List!257)

(assert (=> b!20781 (= e!14112 (= (head!94 (byteArrayBitContentToList!0 (_2!1318 lt!29487) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!94 (bitStreamReadBitsIntoList!0 (_2!1318 lt!29487) (_1!1317 lt!29488) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20782 () Bool)

(declare-fun e!14117 () Bool)

(declare-fun e!14115 () Bool)

(assert (=> b!20782 (= e!14117 e!14115)))

(declare-fun res!18041 () Bool)

(assert (=> b!20782 (=> res!18041 e!14115)))

(declare-fun thiss!1379 () BitStream!1112)

(declare-fun isPrefixOf!0 (BitStream!1112 BitStream!1112) Bool)

(assert (=> b!20782 (= res!18041 (not (isPrefixOf!0 thiss!1379 (_2!1318 lt!29487))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20782 (validate_offset_bits!1 ((_ sign_extend 32) (size!639 (buf!948 (_2!1318 lt!29487)))) ((_ sign_extend 32) (currentByte!2237 (_2!1318 lt!29487))) ((_ sign_extend 32) (currentBit!2232 (_2!1318 lt!29487))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29483 () Unit!1831)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1112 BitStream!1112 (_ BitVec 64) (_ BitVec 64)) Unit!1831)

(assert (=> b!20782 (= lt!29483 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1318 lt!29487) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1112 (_ BitVec 8) (_ BitVec 32)) tuple2!2466)

(assert (=> b!20782 (= lt!29487 (appendBitFromByte!0 thiss!1379 (select (arr!1083 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20783 () Bool)

(declare-fun e!14113 () Bool)

(declare-fun array_inv!609 (array!1497) Bool)

(assert (=> b!20783 (= e!14113 (array_inv!609 (buf!948 thiss!1379)))))

(declare-fun res!18040 () Bool)

(declare-fun e!14114 () Bool)

(assert (=> start!5162 (=> (not res!18040) (not e!14114))))

(assert (=> start!5162 (= res!18040 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!639 srcBuffer!2))))))))

(assert (=> start!5162 e!14114))

(assert (=> start!5162 true))

(assert (=> start!5162 (array_inv!609 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1112) Bool)

(assert (=> start!5162 (and (inv!12 thiss!1379) e!14113)))

(declare-fun b!20784 () Bool)

(assert (=> b!20784 (= e!14115 true)))

(declare-fun lt!29484 () Bool)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1112 array!1497 (_ BitVec 64) (_ BitVec 64)) tuple2!2466)

(assert (=> b!20784 (= lt!29484 (isPrefixOf!0 (_2!1318 lt!29487) (_2!1318 (appendBitsMSBFirstLoop!0 (_2!1318 lt!29487) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))

(assert (=> b!20784 e!14112))

(declare-fun res!18043 () Bool)

(assert (=> b!20784 (=> (not res!18043) (not e!14112))))

(assert (=> b!20784 (= res!18043 (validate_offset_bits!1 ((_ sign_extend 32) (size!639 (buf!948 (_2!1318 lt!29487)))) ((_ sign_extend 32) (currentByte!2237 thiss!1379)) ((_ sign_extend 32) (currentBit!2232 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29482 () Unit!1831)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1112 array!1497 (_ BitVec 64)) Unit!1831)

(assert (=> b!20784 (= lt!29482 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!948 (_2!1318 lt!29487)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1112 BitStream!1112) tuple2!2464)

(assert (=> b!20784 (= lt!29488 (reader!0 thiss!1379 (_2!1318 lt!29487)))))

(declare-fun b!20785 () Bool)

(assert (=> b!20785 (= e!14114 (not e!14117))))

(declare-fun res!18042 () Bool)

(assert (=> b!20785 (=> res!18042 e!14117)))

(assert (=> b!20785 (= res!18042 (bvsge i!635 to!314))))

(assert (=> b!20785 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29486 () Unit!1831)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1112) Unit!1831)

(assert (=> b!20785 (= lt!29486 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29485 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20785 (= lt!29485 (bitIndex!0 (size!639 (buf!948 thiss!1379)) (currentByte!2237 thiss!1379) (currentBit!2232 thiss!1379)))))

(declare-fun b!20786 () Bool)

(declare-fun res!18044 () Bool)

(assert (=> b!20786 (=> (not res!18044) (not e!14114))))

(assert (=> b!20786 (= res!18044 (validate_offset_bits!1 ((_ sign_extend 32) (size!639 (buf!948 thiss!1379))) ((_ sign_extend 32) (currentByte!2237 thiss!1379)) ((_ sign_extend 32) (currentBit!2232 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5162 res!18040) b!20786))

(assert (= (and b!20786 res!18044) b!20785))

(assert (= (and b!20785 (not res!18042)) b!20782))

(assert (= (and b!20782 (not res!18041)) b!20784))

(assert (= (and b!20784 res!18043) b!20781))

(assert (= start!5162 b!20783))

(declare-fun m!28437 () Bool)

(assert (=> b!20783 m!28437))

(declare-fun m!28439 () Bool)

(assert (=> b!20786 m!28439))

(declare-fun m!28441 () Bool)

(assert (=> b!20782 m!28441))

(declare-fun m!28443 () Bool)

(assert (=> b!20782 m!28443))

(declare-fun m!28445 () Bool)

(assert (=> b!20782 m!28445))

(assert (=> b!20782 m!28441))

(declare-fun m!28447 () Bool)

(assert (=> b!20782 m!28447))

(declare-fun m!28449 () Bool)

(assert (=> b!20782 m!28449))

(declare-fun m!28451 () Bool)

(assert (=> start!5162 m!28451))

(declare-fun m!28453 () Bool)

(assert (=> start!5162 m!28453))

(declare-fun m!28455 () Bool)

(assert (=> b!20785 m!28455))

(declare-fun m!28457 () Bool)

(assert (=> b!20785 m!28457))

(declare-fun m!28459 () Bool)

(assert (=> b!20785 m!28459))

(declare-fun m!28461 () Bool)

(assert (=> b!20784 m!28461))

(declare-fun m!28463 () Bool)

(assert (=> b!20784 m!28463))

(declare-fun m!28465 () Bool)

(assert (=> b!20784 m!28465))

(declare-fun m!28467 () Bool)

(assert (=> b!20784 m!28467))

(declare-fun m!28469 () Bool)

(assert (=> b!20784 m!28469))

(declare-fun m!28471 () Bool)

(assert (=> b!20781 m!28471))

(assert (=> b!20781 m!28471))

(declare-fun m!28473 () Bool)

(assert (=> b!20781 m!28473))

(declare-fun m!28475 () Bool)

(assert (=> b!20781 m!28475))

(assert (=> b!20781 m!28475))

(declare-fun m!28477 () Bool)

(assert (=> b!20781 m!28477))

(push 1)

(assert (not b!20783))

(assert (not b!20781))

(assert (not b!20782))

(assert (not b!20785))

(assert (not start!5162))

(assert (not b!20784))

(assert (not b!20786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

