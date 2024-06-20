; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5134 () Bool)

(assert start!5134)

(declare-fun res!17825 () Bool)

(declare-fun e!13811 () Bool)

(assert (=> start!5134 (=> (not res!17825) (not e!13811))))

(declare-datatypes ((array!1469 0))(
  ( (array!1470 (arr!1069 (Array (_ BitVec 32) (_ BitVec 8))) (size!625 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1469)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5134 (= res!17825 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!625 srcBuffer!2))))))))

(assert (=> start!5134 e!13811))

(assert (=> start!5134 true))

(declare-fun array_inv!595 (array!1469) Bool)

(assert (=> start!5134 (array_inv!595 srcBuffer!2)))

(declare-datatypes ((BitStream!1084 0))(
  ( (BitStream!1085 (buf!934 array!1469) (currentByte!2223 (_ BitVec 32)) (currentBit!2218 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1084)

(declare-fun e!13814 () Bool)

(declare-fun inv!12 (BitStream!1084) Bool)

(assert (=> start!5134 (and (inv!12 thiss!1379) e!13814)))

(declare-fun b!20520 () Bool)

(declare-fun e!13815 () Bool)

(assert (=> b!20520 (= e!13811 (not e!13815))))

(declare-fun res!17821 () Bool)

(assert (=> b!20520 (=> res!17821 e!13815)))

(assert (=> b!20520 (= res!17821 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1084 BitStream!1084) Bool)

(assert (=> b!20520 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1803 0))(
  ( (Unit!1804) )
))
(declare-fun lt!29224 () Unit!1803)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1084) Unit!1803)

(assert (=> b!20520 (= lt!29224 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29225 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20520 (= lt!29225 (bitIndex!0 (size!625 (buf!934 thiss!1379)) (currentByte!2223 thiss!1379) (currentBit!2218 thiss!1379)))))

(declare-fun b!20521 () Bool)

(declare-fun res!17823 () Bool)

(assert (=> b!20521 (=> (not res!17823) (not e!13811))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20521 (= res!17823 (validate_offset_bits!1 ((_ sign_extend 32) (size!625 (buf!934 thiss!1379))) ((_ sign_extend 32) (currentByte!2223 thiss!1379)) ((_ sign_extend 32) (currentBit!2218 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20522 () Bool)

(declare-fun e!13813 () Bool)

(assert (=> b!20522 (= e!13815 e!13813)))

(declare-fun res!17824 () Bool)

(assert (=> b!20522 (=> res!17824 e!13813)))

(declare-datatypes ((tuple2!2408 0))(
  ( (tuple2!2409 (_1!1289 Unit!1803) (_2!1289 BitStream!1084)) )
))
(declare-fun lt!29222 () tuple2!2408)

(assert (=> b!20522 (= res!17824 (not (isPrefixOf!0 thiss!1379 (_2!1289 lt!29222))))))

(assert (=> b!20522 (validate_offset_bits!1 ((_ sign_extend 32) (size!625 (buf!934 (_2!1289 lt!29222)))) ((_ sign_extend 32) (currentByte!2223 (_2!1289 lt!29222))) ((_ sign_extend 32) (currentBit!2218 (_2!1289 lt!29222))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29227 () Unit!1803)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1084 BitStream!1084 (_ BitVec 64) (_ BitVec 64)) Unit!1803)

(assert (=> b!20522 (= lt!29227 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1289 lt!29222) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1084 (_ BitVec 8) (_ BitVec 32)) tuple2!2408)

(assert (=> b!20522 (= lt!29222 (appendBitFromByte!0 thiss!1379 (select (arr!1069 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!13810 () Bool)

(declare-fun b!20523 () Bool)

(declare-datatypes ((tuple2!2410 0))(
  ( (tuple2!2411 (_1!1290 BitStream!1084) (_2!1290 BitStream!1084)) )
))
(declare-fun lt!29226 () tuple2!2410)

(declare-datatypes ((List!243 0))(
  ( (Nil!240) (Cons!239 (h!358 Bool) (t!993 List!243)) )
))
(declare-fun head!80 (List!243) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1084 array!1469 (_ BitVec 64) (_ BitVec 64)) List!243)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1084 BitStream!1084 (_ BitVec 64)) List!243)

(assert (=> b!20523 (= e!13810 (= (head!80 (byteArrayBitContentToList!0 (_2!1289 lt!29222) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!80 (bitStreamReadBitsIntoList!0 (_2!1289 lt!29222) (_1!1290 lt!29226) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20524 () Bool)

(assert (=> b!20524 (= e!13813 (or (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> b!20524 e!13810))

(declare-fun res!17822 () Bool)

(assert (=> b!20524 (=> (not res!17822) (not e!13810))))

(assert (=> b!20524 (= res!17822 (validate_offset_bits!1 ((_ sign_extend 32) (size!625 (buf!934 (_2!1289 lt!29222)))) ((_ sign_extend 32) (currentByte!2223 thiss!1379)) ((_ sign_extend 32) (currentBit!2218 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29223 () Unit!1803)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1084 array!1469 (_ BitVec 64)) Unit!1803)

(assert (=> b!20524 (= lt!29223 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!934 (_2!1289 lt!29222)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1084 BitStream!1084) tuple2!2410)

(assert (=> b!20524 (= lt!29226 (reader!0 thiss!1379 (_2!1289 lt!29222)))))

(declare-fun b!20525 () Bool)

(assert (=> b!20525 (= e!13814 (array_inv!595 (buf!934 thiss!1379)))))

(assert (= (and start!5134 res!17825) b!20521))

(assert (= (and b!20521 res!17823) b!20520))

(assert (= (and b!20520 (not res!17821)) b!20522))

(assert (= (and b!20522 (not res!17824)) b!20524))

(assert (= (and b!20524 res!17822) b!20523))

(assert (= start!5134 b!20525))

(declare-fun m!27891 () Bool)

(assert (=> b!20524 m!27891))

(declare-fun m!27893 () Bool)

(assert (=> b!20524 m!27893))

(declare-fun m!27895 () Bool)

(assert (=> b!20524 m!27895))

(declare-fun m!27897 () Bool)

(assert (=> b!20525 m!27897))

(declare-fun m!27899 () Bool)

(assert (=> b!20523 m!27899))

(assert (=> b!20523 m!27899))

(declare-fun m!27901 () Bool)

(assert (=> b!20523 m!27901))

(declare-fun m!27903 () Bool)

(assert (=> b!20523 m!27903))

(assert (=> b!20523 m!27903))

(declare-fun m!27905 () Bool)

(assert (=> b!20523 m!27905))

(declare-fun m!27907 () Bool)

(assert (=> b!20522 m!27907))

(declare-fun m!27909 () Bool)

(assert (=> b!20522 m!27909))

(declare-fun m!27911 () Bool)

(assert (=> b!20522 m!27911))

(declare-fun m!27913 () Bool)

(assert (=> b!20522 m!27913))

(declare-fun m!27915 () Bool)

(assert (=> b!20522 m!27915))

(assert (=> b!20522 m!27911))

(declare-fun m!27917 () Bool)

(assert (=> start!5134 m!27917))

(declare-fun m!27919 () Bool)

(assert (=> start!5134 m!27919))

(declare-fun m!27921 () Bool)

(assert (=> b!20521 m!27921))

(declare-fun m!27923 () Bool)

(assert (=> b!20520 m!27923))

(declare-fun m!27925 () Bool)

(assert (=> b!20520 m!27925))

(declare-fun m!27927 () Bool)

(assert (=> b!20520 m!27927))

(push 1)

(assert (not b!20521))

(assert (not b!20525))

(assert (not start!5134))

(assert (not b!20523))

(assert (not b!20524))

(assert (not b!20522))

(assert (not b!20520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

