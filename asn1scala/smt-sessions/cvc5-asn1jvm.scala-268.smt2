; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5164 () Bool)

(assert start!5164)

(declare-fun res!18056 () Bool)

(declare-fun e!14136 () Bool)

(assert (=> start!5164 (=> (not res!18056) (not e!14136))))

(declare-datatypes ((array!1499 0))(
  ( (array!1500 (arr!1084 (Array (_ BitVec 32) (_ BitVec 8))) (size!640 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1499)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5164 (= res!18056 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!640 srcBuffer!2))))))))

(assert (=> start!5164 e!14136))

(assert (=> start!5164 true))

(declare-fun array_inv!610 (array!1499) Bool)

(assert (=> start!5164 (array_inv!610 srcBuffer!2)))

(declare-datatypes ((BitStream!1114 0))(
  ( (BitStream!1115 (buf!949 array!1499) (currentByte!2238 (_ BitVec 32)) (currentBit!2233 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1114)

(declare-fun e!14135 () Bool)

(declare-fun inv!12 (BitStream!1114) Bool)

(assert (=> start!5164 (and (inv!12 thiss!1379) e!14135)))

(declare-fun b!20799 () Bool)

(declare-fun e!14139 () Bool)

(assert (=> b!20799 (= e!14139 true)))

(declare-fun lt!29506 () Bool)

(declare-datatypes ((Unit!1833 0))(
  ( (Unit!1834) )
))
(declare-datatypes ((tuple2!2468 0))(
  ( (tuple2!2469 (_1!1319 Unit!1833) (_2!1319 BitStream!1114)) )
))
(declare-fun lt!29508 () tuple2!2468)

(declare-fun isPrefixOf!0 (BitStream!1114 BitStream!1114) Bool)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1114 array!1499 (_ BitVec 64) (_ BitVec 64)) tuple2!2468)

(assert (=> b!20799 (= lt!29506 (isPrefixOf!0 (_2!1319 lt!29508) (_2!1319 (appendBitsMSBFirstLoop!0 (_2!1319 lt!29508) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))

(declare-fun e!14137 () Bool)

(assert (=> b!20799 e!14137))

(declare-fun res!18058 () Bool)

(assert (=> b!20799 (=> (not res!18058) (not e!14137))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20799 (= res!18058 (validate_offset_bits!1 ((_ sign_extend 32) (size!640 (buf!949 (_2!1319 lt!29508)))) ((_ sign_extend 32) (currentByte!2238 thiss!1379)) ((_ sign_extend 32) (currentBit!2233 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29505 () Unit!1833)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1114 array!1499 (_ BitVec 64)) Unit!1833)

(assert (=> b!20799 (= lt!29505 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!949 (_2!1319 lt!29508)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2470 0))(
  ( (tuple2!2471 (_1!1320 BitStream!1114) (_2!1320 BitStream!1114)) )
))
(declare-fun lt!29507 () tuple2!2470)

(declare-fun reader!0 (BitStream!1114 BitStream!1114) tuple2!2470)

(assert (=> b!20799 (= lt!29507 (reader!0 thiss!1379 (_2!1319 lt!29508)))))

(declare-fun b!20800 () Bool)

(assert (=> b!20800 (= e!14135 (array_inv!610 (buf!949 thiss!1379)))))

(declare-fun b!20801 () Bool)

(declare-datatypes ((List!258 0))(
  ( (Nil!255) (Cons!254 (h!373 Bool) (t!1008 List!258)) )
))
(declare-fun head!95 (List!258) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1114 array!1499 (_ BitVec 64) (_ BitVec 64)) List!258)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1114 BitStream!1114 (_ BitVec 64)) List!258)

(assert (=> b!20801 (= e!14137 (= (head!95 (byteArrayBitContentToList!0 (_2!1319 lt!29508) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!95 (bitStreamReadBitsIntoList!0 (_2!1319 lt!29508) (_1!1320 lt!29507) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20802 () Bool)

(declare-fun e!14134 () Bool)

(assert (=> b!20802 (= e!14136 (not e!14134))))

(declare-fun res!18059 () Bool)

(assert (=> b!20802 (=> res!18059 e!14134)))

(assert (=> b!20802 (= res!18059 (bvsge i!635 to!314))))

(assert (=> b!20802 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29504 () Unit!1833)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1114) Unit!1833)

(assert (=> b!20802 (= lt!29504 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29503 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20802 (= lt!29503 (bitIndex!0 (size!640 (buf!949 thiss!1379)) (currentByte!2238 thiss!1379) (currentBit!2233 thiss!1379)))))

(declare-fun b!20803 () Bool)

(declare-fun res!18057 () Bool)

(assert (=> b!20803 (=> (not res!18057) (not e!14136))))

(assert (=> b!20803 (= res!18057 (validate_offset_bits!1 ((_ sign_extend 32) (size!640 (buf!949 thiss!1379))) ((_ sign_extend 32) (currentByte!2238 thiss!1379)) ((_ sign_extend 32) (currentBit!2233 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20804 () Bool)

(assert (=> b!20804 (= e!14134 e!14139)))

(declare-fun res!18055 () Bool)

(assert (=> b!20804 (=> res!18055 e!14139)))

(assert (=> b!20804 (= res!18055 (not (isPrefixOf!0 thiss!1379 (_2!1319 lt!29508))))))

(assert (=> b!20804 (validate_offset_bits!1 ((_ sign_extend 32) (size!640 (buf!949 (_2!1319 lt!29508)))) ((_ sign_extend 32) (currentByte!2238 (_2!1319 lt!29508))) ((_ sign_extend 32) (currentBit!2233 (_2!1319 lt!29508))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29509 () Unit!1833)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1114 BitStream!1114 (_ BitVec 64) (_ BitVec 64)) Unit!1833)

(assert (=> b!20804 (= lt!29509 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1319 lt!29508) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1114 (_ BitVec 8) (_ BitVec 32)) tuple2!2468)

(assert (=> b!20804 (= lt!29508 (appendBitFromByte!0 thiss!1379 (select (arr!1084 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5164 res!18056) b!20803))

(assert (= (and b!20803 res!18057) b!20802))

(assert (= (and b!20802 (not res!18059)) b!20804))

(assert (= (and b!20804 (not res!18055)) b!20799))

(assert (= (and b!20799 res!18058) b!20801))

(assert (= start!5164 b!20800))

(declare-fun m!28479 () Bool)

(assert (=> b!20801 m!28479))

(assert (=> b!20801 m!28479))

(declare-fun m!28481 () Bool)

(assert (=> b!20801 m!28481))

(declare-fun m!28483 () Bool)

(assert (=> b!20801 m!28483))

(assert (=> b!20801 m!28483))

(declare-fun m!28485 () Bool)

(assert (=> b!20801 m!28485))

(declare-fun m!28487 () Bool)

(assert (=> b!20802 m!28487))

(declare-fun m!28489 () Bool)

(assert (=> b!20802 m!28489))

(declare-fun m!28491 () Bool)

(assert (=> b!20802 m!28491))

(declare-fun m!28493 () Bool)

(assert (=> b!20804 m!28493))

(declare-fun m!28495 () Bool)

(assert (=> b!20804 m!28495))

(declare-fun m!28497 () Bool)

(assert (=> b!20804 m!28497))

(declare-fun m!28499 () Bool)

(assert (=> b!20804 m!28499))

(declare-fun m!28501 () Bool)

(assert (=> b!20804 m!28501))

(assert (=> b!20804 m!28495))

(declare-fun m!28503 () Bool)

(assert (=> b!20803 m!28503))

(declare-fun m!28505 () Bool)

(assert (=> b!20800 m!28505))

(declare-fun m!28507 () Bool)

(assert (=> start!5164 m!28507))

(declare-fun m!28509 () Bool)

(assert (=> start!5164 m!28509))

(declare-fun m!28511 () Bool)

(assert (=> b!20799 m!28511))

(declare-fun m!28513 () Bool)

(assert (=> b!20799 m!28513))

(declare-fun m!28515 () Bool)

(assert (=> b!20799 m!28515))

(declare-fun m!28517 () Bool)

(assert (=> b!20799 m!28517))

(declare-fun m!28519 () Bool)

(assert (=> b!20799 m!28519))

(push 1)

(assert (not b!20803))

(assert (not b!20802))

(assert (not b!20800))

(assert (not b!20801))

(assert (not start!5164))

(assert (not b!20804))

(assert (not b!20799))

(check-sat)

(pop 1)

