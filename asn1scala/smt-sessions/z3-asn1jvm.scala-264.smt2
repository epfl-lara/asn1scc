; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5142 () Bool)

(assert start!5142)

(declare-fun res!17882 () Bool)

(declare-fun e!13899 () Bool)

(assert (=> start!5142 (=> (not res!17882) (not e!13899))))

(declare-datatypes ((array!1477 0))(
  ( (array!1478 (arr!1073 (Array (_ BitVec 32) (_ BitVec 8))) (size!629 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1477)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5142 (= res!17882 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!629 srcBuffer!2))))))))

(assert (=> start!5142 e!13899))

(assert (=> start!5142 true))

(declare-fun array_inv!599 (array!1477) Bool)

(assert (=> start!5142 (array_inv!599 srcBuffer!2)))

(declare-datatypes ((BitStream!1092 0))(
  ( (BitStream!1093 (buf!938 array!1477) (currentByte!2227 (_ BitVec 32)) (currentBit!2222 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1092)

(declare-fun e!13893 () Bool)

(declare-fun inv!12 (BitStream!1092) Bool)

(assert (=> start!5142 (and (inv!12 thiss!1379) e!13893)))

(declare-fun b!20592 () Bool)

(declare-fun e!13895 () Bool)

(declare-fun e!13898 () Bool)

(assert (=> b!20592 (= e!13895 e!13898)))

(declare-fun res!17884 () Bool)

(assert (=> b!20592 (=> res!17884 e!13898)))

(declare-datatypes ((Unit!1811 0))(
  ( (Unit!1812) )
))
(declare-datatypes ((tuple2!2424 0))(
  ( (tuple2!2425 (_1!1297 Unit!1811) (_2!1297 BitStream!1092)) )
))
(declare-fun lt!29298 () tuple2!2424)

(declare-fun isPrefixOf!0 (BitStream!1092 BitStream!1092) Bool)

(assert (=> b!20592 (= res!17884 (not (isPrefixOf!0 thiss!1379 (_2!1297 lt!29298))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20592 (validate_offset_bits!1 ((_ sign_extend 32) (size!629 (buf!938 (_2!1297 lt!29298)))) ((_ sign_extend 32) (currentByte!2227 (_2!1297 lt!29298))) ((_ sign_extend 32) (currentBit!2222 (_2!1297 lt!29298))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29295 () Unit!1811)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1092 BitStream!1092 (_ BitVec 64) (_ BitVec 64)) Unit!1811)

(assert (=> b!20592 (= lt!29295 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1297 lt!29298) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1092 (_ BitVec 8) (_ BitVec 32)) tuple2!2424)

(assert (=> b!20592 (= lt!29298 (appendBitFromByte!0 thiss!1379 (select (arr!1073 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20593 () Bool)

(declare-fun res!17883 () Bool)

(assert (=> b!20593 (=> (not res!17883) (not e!13899))))

(assert (=> b!20593 (= res!17883 (validate_offset_bits!1 ((_ sign_extend 32) (size!629 (buf!938 thiss!1379))) ((_ sign_extend 32) (currentByte!2227 thiss!1379)) ((_ sign_extend 32) (currentBit!2222 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun e!13896 () Bool)

(declare-datatypes ((tuple2!2426 0))(
  ( (tuple2!2427 (_1!1298 BitStream!1092) (_2!1298 BitStream!1092)) )
))
(declare-fun lt!29299 () tuple2!2426)

(declare-fun b!20594 () Bool)

(declare-datatypes ((List!247 0))(
  ( (Nil!244) (Cons!243 (h!362 Bool) (t!997 List!247)) )
))
(declare-fun head!84 (List!247) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1092 array!1477 (_ BitVec 64) (_ BitVec 64)) List!247)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1092 BitStream!1092 (_ BitVec 64)) List!247)

(assert (=> b!20594 (= e!13896 (= (head!84 (byteArrayBitContentToList!0 (_2!1297 lt!29298) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!84 (bitStreamReadBitsIntoList!0 (_2!1297 lt!29298) (_1!1298 lt!29299) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20595 () Bool)

(assert (=> b!20595 (= e!13899 (not e!13895))))

(declare-fun res!17881 () Bool)

(assert (=> b!20595 (=> res!17881 e!13895)))

(assert (=> b!20595 (= res!17881 (bvsge i!635 to!314))))

(assert (=> b!20595 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29297 () Unit!1811)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1092) Unit!1811)

(assert (=> b!20595 (= lt!29297 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29294 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20595 (= lt!29294 (bitIndex!0 (size!629 (buf!938 thiss!1379)) (currentByte!2227 thiss!1379) (currentBit!2222 thiss!1379)))))

(declare-fun b!20596 () Bool)

(assert (=> b!20596 (= e!13893 (array_inv!599 (buf!938 thiss!1379)))))

(declare-fun b!20597 () Bool)

(assert (=> b!20597 (= e!13898 true)))

(assert (=> b!20597 e!13896))

(declare-fun res!17885 () Bool)

(assert (=> b!20597 (=> (not res!17885) (not e!13896))))

(assert (=> b!20597 (= res!17885 (validate_offset_bits!1 ((_ sign_extend 32) (size!629 (buf!938 (_2!1297 lt!29298)))) ((_ sign_extend 32) (currentByte!2227 thiss!1379)) ((_ sign_extend 32) (currentBit!2222 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29296 () Unit!1811)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1092 array!1477 (_ BitVec 64)) Unit!1811)

(assert (=> b!20597 (= lt!29296 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!938 (_2!1297 lt!29298)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1092 BitStream!1092) tuple2!2426)

(assert (=> b!20597 (= lt!29299 (reader!0 thiss!1379 (_2!1297 lt!29298)))))

(assert (= (and start!5142 res!17882) b!20593))

(assert (= (and b!20593 res!17883) b!20595))

(assert (= (and b!20595 (not res!17881)) b!20592))

(assert (= (and b!20592 (not res!17884)) b!20597))

(assert (= (and b!20597 res!17885) b!20594))

(assert (= start!5142 b!20596))

(declare-fun m!28043 () Bool)

(assert (=> b!20592 m!28043))

(declare-fun m!28045 () Bool)

(assert (=> b!20592 m!28045))

(declare-fun m!28047 () Bool)

(assert (=> b!20592 m!28047))

(declare-fun m!28049 () Bool)

(assert (=> b!20592 m!28049))

(assert (=> b!20592 m!28045))

(declare-fun m!28051 () Bool)

(assert (=> b!20592 m!28051))

(declare-fun m!28053 () Bool)

(assert (=> b!20594 m!28053))

(assert (=> b!20594 m!28053))

(declare-fun m!28055 () Bool)

(assert (=> b!20594 m!28055))

(declare-fun m!28057 () Bool)

(assert (=> b!20594 m!28057))

(assert (=> b!20594 m!28057))

(declare-fun m!28059 () Bool)

(assert (=> b!20594 m!28059))

(declare-fun m!28061 () Bool)

(assert (=> b!20593 m!28061))

(declare-fun m!28063 () Bool)

(assert (=> b!20596 m!28063))

(declare-fun m!28065 () Bool)

(assert (=> b!20595 m!28065))

(declare-fun m!28067 () Bool)

(assert (=> b!20595 m!28067))

(declare-fun m!28069 () Bool)

(assert (=> b!20595 m!28069))

(declare-fun m!28071 () Bool)

(assert (=> b!20597 m!28071))

(declare-fun m!28073 () Bool)

(assert (=> b!20597 m!28073))

(declare-fun m!28075 () Bool)

(assert (=> b!20597 m!28075))

(declare-fun m!28077 () Bool)

(assert (=> start!5142 m!28077))

(declare-fun m!28079 () Bool)

(assert (=> start!5142 m!28079))

(check-sat (not b!20593) (not b!20597) (not start!5142) (not b!20594) (not b!20595) (not b!20592) (not b!20596))
