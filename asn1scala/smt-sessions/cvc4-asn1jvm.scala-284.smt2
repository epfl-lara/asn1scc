; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5688 () Bool)

(assert start!5688)

(declare-fun b!24084 () Bool)

(declare-fun e!16383 () Bool)

(declare-fun e!16379 () Bool)

(assert (=> b!24084 (= e!16383 e!16379)))

(declare-fun res!20771 () Bool)

(assert (=> b!24084 (=> res!20771 e!16379)))

(declare-datatypes ((array!1611 0))(
  ( (array!1612 (arr!1147 (Array (_ BitVec 32) (_ BitVec 8))) (size!691 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1214 0))(
  ( (BitStream!1215 (buf!1012 array!1611) (currentByte!2325 (_ BitVec 32)) (currentBit!2320 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2025 0))(
  ( (Unit!2026) )
))
(declare-datatypes ((tuple2!2746 0))(
  ( (tuple2!2747 (_1!1460 Unit!2025) (_2!1460 BitStream!1214)) )
))
(declare-fun lt!34560 () tuple2!2746)

(declare-fun lt!34571 () tuple2!2746)

(declare-fun isPrefixOf!0 (BitStream!1214 BitStream!1214) Bool)

(assert (=> b!24084 (= res!20771 (not (isPrefixOf!0 (_2!1460 lt!34560) (_2!1460 lt!34571))))))

(declare-fun thiss!1379 () BitStream!1214)

(assert (=> b!24084 (isPrefixOf!0 thiss!1379 (_2!1460 lt!34571))))

(declare-fun lt!34561 () Unit!2025)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1214 BitStream!1214 BitStream!1214) Unit!2025)

(assert (=> b!24084 (= lt!34561 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1460 lt!34560) (_2!1460 lt!34571)))))

(declare-fun srcBuffer!2 () array!1611)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1214 array!1611 (_ BitVec 64) (_ BitVec 64)) tuple2!2746)

(assert (=> b!24084 (= lt!34571 (appendBitsMSBFirstLoop!0 (_2!1460 lt!34560) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16378 () Bool)

(assert (=> b!24084 e!16378))

(declare-fun res!20769 () Bool)

(assert (=> b!24084 (=> (not res!20769) (not e!16378))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24084 (= res!20769 (validate_offset_bits!1 ((_ sign_extend 32) (size!691 (buf!1012 (_2!1460 lt!34560)))) ((_ sign_extend 32) (currentByte!2325 thiss!1379)) ((_ sign_extend 32) (currentBit!2320 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34572 () Unit!2025)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1214 array!1611 (_ BitVec 64)) Unit!2025)

(assert (=> b!24084 (= lt!34572 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1012 (_2!1460 lt!34560)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2748 0))(
  ( (tuple2!2749 (_1!1461 BitStream!1214) (_2!1461 BitStream!1214)) )
))
(declare-fun lt!34567 () tuple2!2748)

(declare-fun reader!0 (BitStream!1214 BitStream!1214) tuple2!2748)

(assert (=> b!24084 (= lt!34567 (reader!0 thiss!1379 (_2!1460 lt!34560)))))

(declare-fun b!24085 () Bool)

(declare-fun e!16381 () Bool)

(declare-fun e!16384 () Bool)

(assert (=> b!24085 (= e!16381 (not e!16384))))

(declare-fun res!20762 () Bool)

(assert (=> b!24085 (=> res!20762 e!16384)))

(assert (=> b!24085 (= res!20762 (bvsge i!635 to!314))))

(assert (=> b!24085 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34562 () Unit!2025)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1214) Unit!2025)

(assert (=> b!24085 (= lt!34562 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!34565 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24085 (= lt!34565 (bitIndex!0 (size!691 (buf!1012 thiss!1379)) (currentByte!2325 thiss!1379) (currentBit!2320 thiss!1379)))))

(declare-fun b!24086 () Bool)

(declare-fun res!20763 () Bool)

(declare-fun e!16375 () Bool)

(assert (=> b!24086 (=> res!20763 e!16375)))

(assert (=> b!24086 (= res!20763 (not (= (size!691 (buf!1012 thiss!1379)) (size!691 (buf!1012 (_2!1460 lt!34571))))))))

(declare-fun b!24087 () Bool)

(declare-fun e!16377 () Bool)

(assert (=> b!24087 (= e!16377 true)))

(declare-fun lt!34566 () (_ BitVec 64))

(assert (=> b!24087 (validate_offset_bits!1 ((_ sign_extend 32) (size!691 (buf!1012 (_2!1460 lt!34571)))) ((_ sign_extend 32) (currentByte!2325 (_2!1460 lt!34560))) ((_ sign_extend 32) (currentBit!2320 (_2!1460 lt!34560))) lt!34566)))

(declare-fun lt!34569 () Unit!2025)

(assert (=> b!24087 (= lt!34569 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1460 lt!34560) (buf!1012 (_2!1460 lt!34571)) lt!34566))))

(declare-fun lt!34573 () tuple2!2748)

(assert (=> b!24087 (= lt!34573 (reader!0 (_2!1460 lt!34560) (_2!1460 lt!34571)))))

(assert (=> b!24087 (validate_offset_bits!1 ((_ sign_extend 32) (size!691 (buf!1012 (_2!1460 lt!34571)))) ((_ sign_extend 32) (currentByte!2325 thiss!1379)) ((_ sign_extend 32) (currentBit!2320 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34570 () Unit!2025)

(assert (=> b!24087 (= lt!34570 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1012 (_2!1460 lt!34571)) (bvsub to!314 i!635)))))

(declare-fun lt!34563 () tuple2!2748)

(assert (=> b!24087 (= lt!34563 (reader!0 thiss!1379 (_2!1460 lt!34571)))))

(declare-fun b!24088 () Bool)

(assert (=> b!24088 (= e!16375 e!16377)))

(declare-fun res!20768 () Bool)

(assert (=> b!24088 (=> res!20768 e!16377)))

(assert (=> b!24088 (= res!20768 (not (= (size!691 (buf!1012 (_2!1460 lt!34560))) (size!691 (buf!1012 (_2!1460 lt!34571))))))))

(declare-fun e!16374 () Bool)

(assert (=> b!24088 e!16374))

(declare-fun res!20761 () Bool)

(assert (=> b!24088 (=> (not res!20761) (not e!16374))))

(assert (=> b!24088 (= res!20761 (= (size!691 (buf!1012 (_2!1460 lt!34571))) (size!691 (buf!1012 thiss!1379))))))

(declare-fun b!24089 () Bool)

(assert (=> b!24089 (= e!16379 e!16375)))

(declare-fun res!20760 () Bool)

(assert (=> b!24089 (=> res!20760 e!16375)))

(declare-fun lt!34568 () (_ BitVec 64))

(assert (=> b!24089 (= res!20760 (not (= lt!34568 (bvsub (bvadd lt!34565 to!314) i!635))))))

(assert (=> b!24089 (= lt!34568 (bitIndex!0 (size!691 (buf!1012 (_2!1460 lt!34571))) (currentByte!2325 (_2!1460 lt!34571)) (currentBit!2320 (_2!1460 lt!34571))))))

(declare-fun b!24090 () Bool)

(declare-fun res!20772 () Bool)

(assert (=> b!24090 (=> res!20772 e!16377)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24090 (= res!20772 (not (invariant!0 (currentBit!2320 (_2!1460 lt!34560)) (currentByte!2325 (_2!1460 lt!34560)) (size!691 (buf!1012 (_2!1460 lt!34571))))))))

(declare-fun b!24091 () Bool)

(assert (=> b!24091 (= e!16384 e!16383)))

(declare-fun res!20767 () Bool)

(assert (=> b!24091 (=> res!20767 e!16383)))

(assert (=> b!24091 (= res!20767 (not (isPrefixOf!0 thiss!1379 (_2!1460 lt!34560))))))

(assert (=> b!24091 (validate_offset_bits!1 ((_ sign_extend 32) (size!691 (buf!1012 (_2!1460 lt!34560)))) ((_ sign_extend 32) (currentByte!2325 (_2!1460 lt!34560))) ((_ sign_extend 32) (currentBit!2320 (_2!1460 lt!34560))) lt!34566)))

(assert (=> b!24091 (= lt!34566 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34564 () Unit!2025)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1214 BitStream!1214 (_ BitVec 64) (_ BitVec 64)) Unit!2025)

(assert (=> b!24091 (= lt!34564 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1460 lt!34560) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1214 (_ BitVec 8) (_ BitVec 32)) tuple2!2746)

(assert (=> b!24091 (= lt!34560 (appendBitFromByte!0 thiss!1379 (select (arr!1147 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!20764 () Bool)

(assert (=> start!5688 (=> (not res!20764) (not e!16381))))

(assert (=> start!5688 (= res!20764 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!691 srcBuffer!2))))))))

(assert (=> start!5688 e!16381))

(assert (=> start!5688 true))

(declare-fun array_inv!660 (array!1611) Bool)

(assert (=> start!5688 (array_inv!660 srcBuffer!2)))

(declare-fun e!16380 () Bool)

(declare-fun inv!12 (BitStream!1214) Bool)

(assert (=> start!5688 (and (inv!12 thiss!1379) e!16380)))

(declare-fun b!24092 () Bool)

(declare-datatypes ((List!308 0))(
  ( (Nil!305) (Cons!304 (h!423 Bool) (t!1058 List!308)) )
))
(declare-fun head!145 (List!308) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1214 array!1611 (_ BitVec 64) (_ BitVec 64)) List!308)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1214 BitStream!1214 (_ BitVec 64)) List!308)

(assert (=> b!24092 (= e!16378 (= (head!145 (byteArrayBitContentToList!0 (_2!1460 lt!34560) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!145 (bitStreamReadBitsIntoList!0 (_2!1460 lt!34560) (_1!1461 lt!34567) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24093 () Bool)

(declare-fun res!20765 () Bool)

(assert (=> b!24093 (=> res!20765 e!16377)))

(assert (=> b!24093 (= res!20765 (not (invariant!0 (currentBit!2320 (_2!1460 lt!34560)) (currentByte!2325 (_2!1460 lt!34560)) (size!691 (buf!1012 (_2!1460 lt!34560))))))))

(declare-fun b!24094 () Bool)

(assert (=> b!24094 (= e!16380 (array_inv!660 (buf!1012 thiss!1379)))))

(declare-fun b!24095 () Bool)

(declare-fun res!20770 () Bool)

(assert (=> b!24095 (=> (not res!20770) (not e!16381))))

(assert (=> b!24095 (= res!20770 (validate_offset_bits!1 ((_ sign_extend 32) (size!691 (buf!1012 thiss!1379))) ((_ sign_extend 32) (currentByte!2325 thiss!1379)) ((_ sign_extend 32) (currentBit!2320 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24096 () Bool)

(assert (=> b!24096 (= e!16374 (= lt!34568 (bvsub (bvsub (bvadd (bitIndex!0 (size!691 (buf!1012 (_2!1460 lt!34560))) (currentByte!2325 (_2!1460 lt!34560)) (currentBit!2320 (_2!1460 lt!34560))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24097 () Bool)

(declare-fun res!20766 () Bool)

(assert (=> b!24097 (=> res!20766 e!16375)))

(assert (=> b!24097 (= res!20766 (not (invariant!0 (currentBit!2320 (_2!1460 lt!34571)) (currentByte!2325 (_2!1460 lt!34571)) (size!691 (buf!1012 (_2!1460 lt!34571))))))))

(assert (= (and start!5688 res!20764) b!24095))

(assert (= (and b!24095 res!20770) b!24085))

(assert (= (and b!24085 (not res!20762)) b!24091))

(assert (= (and b!24091 (not res!20767)) b!24084))

(assert (= (and b!24084 res!20769) b!24092))

(assert (= (and b!24084 (not res!20771)) b!24089))

(assert (= (and b!24089 (not res!20760)) b!24097))

(assert (= (and b!24097 (not res!20766)) b!24086))

(assert (= (and b!24086 (not res!20763)) b!24088))

(assert (= (and b!24088 res!20761) b!24096))

(assert (= (and b!24088 (not res!20768)) b!24093))

(assert (= (and b!24093 (not res!20765)) b!24090))

(assert (= (and b!24090 (not res!20772)) b!24087))

(assert (= start!5688 b!24094))

(declare-fun m!33937 () Bool)

(assert (=> start!5688 m!33937))

(declare-fun m!33939 () Bool)

(assert (=> start!5688 m!33939))

(declare-fun m!33941 () Bool)

(assert (=> b!24093 m!33941))

(declare-fun m!33943 () Bool)

(assert (=> b!24089 m!33943))

(declare-fun m!33945 () Bool)

(assert (=> b!24092 m!33945))

(assert (=> b!24092 m!33945))

(declare-fun m!33947 () Bool)

(assert (=> b!24092 m!33947))

(declare-fun m!33949 () Bool)

(assert (=> b!24092 m!33949))

(assert (=> b!24092 m!33949))

(declare-fun m!33951 () Bool)

(assert (=> b!24092 m!33951))

(declare-fun m!33953 () Bool)

(assert (=> b!24087 m!33953))

(declare-fun m!33955 () Bool)

(assert (=> b!24087 m!33955))

(declare-fun m!33957 () Bool)

(assert (=> b!24087 m!33957))

(declare-fun m!33959 () Bool)

(assert (=> b!24087 m!33959))

(declare-fun m!33961 () Bool)

(assert (=> b!24087 m!33961))

(declare-fun m!33963 () Bool)

(assert (=> b!24087 m!33963))

(declare-fun m!33965 () Bool)

(assert (=> b!24094 m!33965))

(declare-fun m!33967 () Bool)

(assert (=> b!24095 m!33967))

(declare-fun m!33969 () Bool)

(assert (=> b!24085 m!33969))

(declare-fun m!33971 () Bool)

(assert (=> b!24085 m!33971))

(declare-fun m!33973 () Bool)

(assert (=> b!24085 m!33973))

(declare-fun m!33975 () Bool)

(assert (=> b!24090 m!33975))

(declare-fun m!33977 () Bool)

(assert (=> b!24097 m!33977))

(declare-fun m!33979 () Bool)

(assert (=> b!24091 m!33979))

(declare-fun m!33981 () Bool)

(assert (=> b!24091 m!33981))

(declare-fun m!33983 () Bool)

(assert (=> b!24091 m!33983))

(declare-fun m!33985 () Bool)

(assert (=> b!24091 m!33985))

(assert (=> b!24091 m!33981))

(declare-fun m!33987 () Bool)

(assert (=> b!24091 m!33987))

(declare-fun m!33989 () Bool)

(assert (=> b!24084 m!33989))

(declare-fun m!33991 () Bool)

(assert (=> b!24084 m!33991))

(declare-fun m!33993 () Bool)

(assert (=> b!24084 m!33993))

(declare-fun m!33995 () Bool)

(assert (=> b!24084 m!33995))

(declare-fun m!33997 () Bool)

(assert (=> b!24084 m!33997))

(declare-fun m!33999 () Bool)

(assert (=> b!24084 m!33999))

(declare-fun m!34001 () Bool)

(assert (=> b!24084 m!34001))

(declare-fun m!34003 () Bool)

(assert (=> b!24096 m!34003))

(push 1)

(assert (not b!24093))

(assert (not b!24085))

(assert (not start!5688))

(assert (not b!24087))

(assert (not b!24090))

(assert (not b!24091))

(assert (not b!24084))

(assert (not b!24096))

(assert (not b!24092))

(assert (not b!24094))

(assert (not b!24089))

(assert (not b!24095))

(assert (not b!24097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

