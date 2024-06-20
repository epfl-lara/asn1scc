; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5150 () Bool)

(assert start!5150)

(declare-fun b!20664 () Bool)

(declare-fun res!17945 () Bool)

(declare-fun e!13983 () Bool)

(assert (=> b!20664 (=> (not res!17945) (not e!13983))))

(declare-datatypes ((array!1485 0))(
  ( (array!1486 (arr!1077 (Array (_ BitVec 32) (_ BitVec 8))) (size!633 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1100 0))(
  ( (BitStream!1101 (buf!942 array!1485) (currentByte!2231 (_ BitVec 32)) (currentBit!2226 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1100)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20664 (= res!17945 (validate_offset_bits!1 ((_ sign_extend 32) (size!633 (buf!942 thiss!1379))) ((_ sign_extend 32) (currentByte!2231 thiss!1379)) ((_ sign_extend 32) (currentBit!2226 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20665 () Bool)

(declare-fun e!13977 () Bool)

(assert (=> b!20665 (= e!13977 true)))

(declare-fun e!13982 () Bool)

(assert (=> b!20665 e!13982))

(declare-fun res!17944 () Bool)

(assert (=> b!20665 (=> (not res!17944) (not e!13982))))

(declare-datatypes ((Unit!1819 0))(
  ( (Unit!1820) )
))
(declare-datatypes ((tuple2!2440 0))(
  ( (tuple2!2441 (_1!1305 Unit!1819) (_2!1305 BitStream!1100)) )
))
(declare-fun lt!29369 () tuple2!2440)

(assert (=> b!20665 (= res!17944 (validate_offset_bits!1 ((_ sign_extend 32) (size!633 (buf!942 (_2!1305 lt!29369)))) ((_ sign_extend 32) (currentByte!2231 thiss!1379)) ((_ sign_extend 32) (currentBit!2226 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29366 () Unit!1819)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1100 array!1485 (_ BitVec 64)) Unit!1819)

(assert (=> b!20665 (= lt!29366 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!942 (_2!1305 lt!29369)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2442 0))(
  ( (tuple2!2443 (_1!1306 BitStream!1100) (_2!1306 BitStream!1100)) )
))
(declare-fun lt!29367 () tuple2!2442)

(declare-fun reader!0 (BitStream!1100 BitStream!1100) tuple2!2442)

(assert (=> b!20665 (= lt!29367 (reader!0 thiss!1379 (_2!1305 lt!29369)))))

(declare-fun b!20666 () Bool)

(declare-fun e!13978 () Bool)

(assert (=> b!20666 (= e!13978 e!13977)))

(declare-fun res!17942 () Bool)

(assert (=> b!20666 (=> res!17942 e!13977)))

(declare-fun isPrefixOf!0 (BitStream!1100 BitStream!1100) Bool)

(assert (=> b!20666 (= res!17942 (not (isPrefixOf!0 thiss!1379 (_2!1305 lt!29369))))))

(assert (=> b!20666 (validate_offset_bits!1 ((_ sign_extend 32) (size!633 (buf!942 (_2!1305 lt!29369)))) ((_ sign_extend 32) (currentByte!2231 (_2!1305 lt!29369))) ((_ sign_extend 32) (currentBit!2226 (_2!1305 lt!29369))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29368 () Unit!1819)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1100 BitStream!1100 (_ BitVec 64) (_ BitVec 64)) Unit!1819)

(assert (=> b!20666 (= lt!29368 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1305 lt!29369) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1485)

(declare-fun appendBitFromByte!0 (BitStream!1100 (_ BitVec 8) (_ BitVec 32)) tuple2!2440)

(assert (=> b!20666 (= lt!29369 (appendBitFromByte!0 thiss!1379 (select (arr!1077 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20667 () Bool)

(declare-fun e!13980 () Bool)

(declare-fun array_inv!603 (array!1485) Bool)

(assert (=> b!20667 (= e!13980 (array_inv!603 (buf!942 thiss!1379)))))

(declare-fun b!20668 () Bool)

(assert (=> b!20668 (= e!13983 (not e!13978))))

(declare-fun res!17941 () Bool)

(assert (=> b!20668 (=> res!17941 e!13978)))

(assert (=> b!20668 (= res!17941 (bvsge i!635 to!314))))

(assert (=> b!20668 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29370 () Unit!1819)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1100) Unit!1819)

(assert (=> b!20668 (= lt!29370 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29371 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20668 (= lt!29371 (bitIndex!0 (size!633 (buf!942 thiss!1379)) (currentByte!2231 thiss!1379) (currentBit!2226 thiss!1379)))))

(declare-fun b!20669 () Bool)

(declare-datatypes ((List!251 0))(
  ( (Nil!248) (Cons!247 (h!366 Bool) (t!1001 List!251)) )
))
(declare-fun head!88 (List!251) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1100 array!1485 (_ BitVec 64) (_ BitVec 64)) List!251)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1100 BitStream!1100 (_ BitVec 64)) List!251)

(assert (=> b!20669 (= e!13982 (= (head!88 (byteArrayBitContentToList!0 (_2!1305 lt!29369) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!88 (bitStreamReadBitsIntoList!0 (_2!1305 lt!29369) (_1!1306 lt!29367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!17943 () Bool)

(assert (=> start!5150 (=> (not res!17943) (not e!13983))))

(assert (=> start!5150 (= res!17943 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!633 srcBuffer!2))))))))

(assert (=> start!5150 e!13983))

(assert (=> start!5150 true))

(assert (=> start!5150 (array_inv!603 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1100) Bool)

(assert (=> start!5150 (and (inv!12 thiss!1379) e!13980)))

(assert (= (and start!5150 res!17943) b!20664))

(assert (= (and b!20664 res!17945) b!20668))

(assert (= (and b!20668 (not res!17941)) b!20666))

(assert (= (and b!20666 (not res!17942)) b!20665))

(assert (= (and b!20665 res!17944) b!20669))

(assert (= start!5150 b!20667))

(declare-fun m!28195 () Bool)

(assert (=> b!20667 m!28195))

(declare-fun m!28197 () Bool)

(assert (=> b!20664 m!28197))

(declare-fun m!28199 () Bool)

(assert (=> b!20665 m!28199))

(declare-fun m!28201 () Bool)

(assert (=> b!20665 m!28201))

(declare-fun m!28203 () Bool)

(assert (=> b!20665 m!28203))

(declare-fun m!28205 () Bool)

(assert (=> b!20669 m!28205))

(assert (=> b!20669 m!28205))

(declare-fun m!28207 () Bool)

(assert (=> b!20669 m!28207))

(declare-fun m!28209 () Bool)

(assert (=> b!20669 m!28209))

(assert (=> b!20669 m!28209))

(declare-fun m!28211 () Bool)

(assert (=> b!20669 m!28211))

(declare-fun m!28213 () Bool)

(assert (=> b!20666 m!28213))

(declare-fun m!28215 () Bool)

(assert (=> b!20666 m!28215))

(declare-fun m!28217 () Bool)

(assert (=> b!20666 m!28217))

(assert (=> b!20666 m!28215))

(declare-fun m!28219 () Bool)

(assert (=> b!20666 m!28219))

(declare-fun m!28221 () Bool)

(assert (=> b!20666 m!28221))

(declare-fun m!28223 () Bool)

(assert (=> start!5150 m!28223))

(declare-fun m!28225 () Bool)

(assert (=> start!5150 m!28225))

(declare-fun m!28227 () Bool)

(assert (=> b!20668 m!28227))

(declare-fun m!28229 () Bool)

(assert (=> b!20668 m!28229))

(declare-fun m!28231 () Bool)

(assert (=> b!20668 m!28231))

(push 1)

(assert (not b!20667))

(assert (not b!20664))

(assert (not b!20669))

(assert (not start!5150))

(assert (not b!20666))

(assert (not b!20668))

(assert (not b!20665))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

