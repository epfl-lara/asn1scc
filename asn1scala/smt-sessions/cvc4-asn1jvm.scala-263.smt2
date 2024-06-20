; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5138 () Bool)

(assert start!5138)

(declare-datatypes ((array!1473 0))(
  ( (array!1474 (arr!1071 (Array (_ BitVec 32) (_ BitVec 8))) (size!627 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1088 0))(
  ( (BitStream!1089 (buf!936 array!1473) (currentByte!2225 (_ BitVec 32)) (currentBit!2220 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1807 0))(
  ( (Unit!1808) )
))
(declare-datatypes ((tuple2!2416 0))(
  ( (tuple2!2417 (_1!1293 Unit!1807) (_2!1293 BitStream!1088)) )
))
(declare-fun lt!29260 () tuple2!2416)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!2418 0))(
  ( (tuple2!2419 (_1!1294 BitStream!1088) (_2!1294 BitStream!1088)) )
))
(declare-fun lt!29262 () tuple2!2418)

(declare-fun e!13851 () Bool)

(declare-fun srcBuffer!2 () array!1473)

(declare-fun b!20556 () Bool)

(declare-datatypes ((List!245 0))(
  ( (Nil!242) (Cons!241 (h!360 Bool) (t!995 List!245)) )
))
(declare-fun head!82 (List!245) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1088 array!1473 (_ BitVec 64) (_ BitVec 64)) List!245)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1088 BitStream!1088 (_ BitVec 64)) List!245)

(assert (=> b!20556 (= e!13851 (= (head!82 (byteArrayBitContentToList!0 (_2!1293 lt!29260) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!82 (bitStreamReadBitsIntoList!0 (_2!1293 lt!29260) (_1!1294 lt!29262) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20557 () Bool)

(declare-fun e!13852 () Bool)

(declare-fun e!13857 () Bool)

(assert (=> b!20557 (= e!13852 (not e!13857))))

(declare-fun res!17855 () Bool)

(assert (=> b!20557 (=> res!17855 e!13857)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20557 (= res!17855 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1088)

(declare-fun isPrefixOf!0 (BitStream!1088 BitStream!1088) Bool)

(assert (=> b!20557 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29261 () Unit!1807)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1088) Unit!1807)

(assert (=> b!20557 (= lt!29261 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29259 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20557 (= lt!29259 (bitIndex!0 (size!627 (buf!936 thiss!1379)) (currentByte!2225 thiss!1379) (currentBit!2220 thiss!1379)))))

(declare-fun b!20558 () Bool)

(declare-fun res!17852 () Bool)

(assert (=> b!20558 (=> (not res!17852) (not e!13852))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20558 (= res!17852 (validate_offset_bits!1 ((_ sign_extend 32) (size!627 (buf!936 thiss!1379))) ((_ sign_extend 32) (currentByte!2225 thiss!1379)) ((_ sign_extend 32) (currentBit!2220 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!17853 () Bool)

(assert (=> start!5138 (=> (not res!17853) (not e!13852))))

(assert (=> start!5138 (= res!17853 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!627 srcBuffer!2))))))))

(assert (=> start!5138 e!13852))

(assert (=> start!5138 true))

(declare-fun array_inv!597 (array!1473) Bool)

(assert (=> start!5138 (array_inv!597 srcBuffer!2)))

(declare-fun e!13853 () Bool)

(declare-fun inv!12 (BitStream!1088) Bool)

(assert (=> start!5138 (and (inv!12 thiss!1379) e!13853)))

(declare-fun b!20559 () Bool)

(declare-fun e!13856 () Bool)

(assert (=> b!20559 (= e!13856 (or (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> b!20559 e!13851))

(declare-fun res!17851 () Bool)

(assert (=> b!20559 (=> (not res!17851) (not e!13851))))

(assert (=> b!20559 (= res!17851 (validate_offset_bits!1 ((_ sign_extend 32) (size!627 (buf!936 (_2!1293 lt!29260)))) ((_ sign_extend 32) (currentByte!2225 thiss!1379)) ((_ sign_extend 32) (currentBit!2220 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29258 () Unit!1807)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1088 array!1473 (_ BitVec 64)) Unit!1807)

(assert (=> b!20559 (= lt!29258 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!936 (_2!1293 lt!29260)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1088 BitStream!1088) tuple2!2418)

(assert (=> b!20559 (= lt!29262 (reader!0 thiss!1379 (_2!1293 lt!29260)))))

(declare-fun b!20560 () Bool)

(assert (=> b!20560 (= e!13853 (array_inv!597 (buf!936 thiss!1379)))))

(declare-fun b!20561 () Bool)

(assert (=> b!20561 (= e!13857 e!13856)))

(declare-fun res!17854 () Bool)

(assert (=> b!20561 (=> res!17854 e!13856)))

(assert (=> b!20561 (= res!17854 (not (isPrefixOf!0 thiss!1379 (_2!1293 lt!29260))))))

(assert (=> b!20561 (validate_offset_bits!1 ((_ sign_extend 32) (size!627 (buf!936 (_2!1293 lt!29260)))) ((_ sign_extend 32) (currentByte!2225 (_2!1293 lt!29260))) ((_ sign_extend 32) (currentBit!2220 (_2!1293 lt!29260))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29263 () Unit!1807)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1088 BitStream!1088 (_ BitVec 64) (_ BitVec 64)) Unit!1807)

(assert (=> b!20561 (= lt!29263 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1293 lt!29260) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1088 (_ BitVec 8) (_ BitVec 32)) tuple2!2416)

(assert (=> b!20561 (= lt!29260 (appendBitFromByte!0 thiss!1379 (select (arr!1071 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5138 res!17853) b!20558))

(assert (= (and b!20558 res!17852) b!20557))

(assert (= (and b!20557 (not res!17855)) b!20561))

(assert (= (and b!20561 (not res!17854)) b!20559))

(assert (= (and b!20559 res!17851) b!20556))

(assert (= start!5138 b!20560))

(declare-fun m!27967 () Bool)

(assert (=> start!5138 m!27967))

(declare-fun m!27969 () Bool)

(assert (=> start!5138 m!27969))

(declare-fun m!27971 () Bool)

(assert (=> b!20558 m!27971))

(declare-fun m!27973 () Bool)

(assert (=> b!20557 m!27973))

(declare-fun m!27975 () Bool)

(assert (=> b!20557 m!27975))

(declare-fun m!27977 () Bool)

(assert (=> b!20557 m!27977))

(declare-fun m!27979 () Bool)

(assert (=> b!20559 m!27979))

(declare-fun m!27981 () Bool)

(assert (=> b!20559 m!27981))

(declare-fun m!27983 () Bool)

(assert (=> b!20559 m!27983))

(declare-fun m!27985 () Bool)

(assert (=> b!20560 m!27985))

(declare-fun m!27987 () Bool)

(assert (=> b!20561 m!27987))

(declare-fun m!27989 () Bool)

(assert (=> b!20561 m!27989))

(declare-fun m!27991 () Bool)

(assert (=> b!20561 m!27991))

(declare-fun m!27993 () Bool)

(assert (=> b!20561 m!27993))

(assert (=> b!20561 m!27989))

(declare-fun m!27995 () Bool)

(assert (=> b!20561 m!27995))

(declare-fun m!27997 () Bool)

(assert (=> b!20556 m!27997))

(assert (=> b!20556 m!27997))

(declare-fun m!27999 () Bool)

(assert (=> b!20556 m!27999))

(declare-fun m!28001 () Bool)

(assert (=> b!20556 m!28001))

(assert (=> b!20556 m!28001))

(declare-fun m!28003 () Bool)

(assert (=> b!20556 m!28003))

(push 1)

(assert (not b!20561))

(assert (not b!20558))

(assert (not b!20560))

(assert (not start!5138))

(assert (not b!20557))

(assert (not b!20559))

(assert (not b!20556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

