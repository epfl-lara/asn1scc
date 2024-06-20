; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11796 () Bool)

(assert start!11796)

(declare-datatypes ((array!2653 0))(
  ( (array!2654 (arr!1766 (Array (_ BitVec 32) (_ BitVec 8))) (size!1202 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2653)

(declare-datatypes ((BitStream!2092 0))(
  ( (BitStream!2093 (buf!1583 array!2653) (currentByte!3201 (_ BitVec 32)) (currentBit!3196 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4027 0))(
  ( (Unit!4028) )
))
(declare-datatypes ((tuple2!5306 0))(
  ( (tuple2!5307 (_1!2764 Unit!4027) (_2!2764 BitStream!2092)) )
))
(declare-fun lt!92255 () tuple2!5306)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5308 0))(
  ( (tuple2!5309 (_1!2765 BitStream!2092) (_2!2765 BitStream!2092)) )
))
(declare-fun lt!92256 () tuple2!5308)

(declare-fun e!38671 () Bool)

(declare-fun b!58320 () Bool)

(declare-datatypes ((List!621 0))(
  ( (Nil!618) (Cons!617 (h!736 Bool) (t!1371 List!621)) )
))
(declare-fun head!440 (List!621) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2092 array!2653 (_ BitVec 64) (_ BitVec 64)) List!621)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2092 BitStream!2092 (_ BitVec 64)) List!621)

(assert (=> b!58320 (= e!38671 (= (head!440 (byteArrayBitContentToList!0 (_2!2764 lt!92255) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!440 (bitStreamReadBitsIntoList!0 (_2!2764 lt!92255) (_1!2765 lt!92256) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58321 () Bool)

(declare-fun e!38666 () Bool)

(assert (=> b!58321 (= e!38666 true)))

(declare-fun lt!92259 () tuple2!5308)

(declare-fun thiss!1379 () BitStream!2092)

(declare-fun lt!92251 () tuple2!5306)

(declare-fun reader!0 (BitStream!2092 BitStream!2092) tuple2!5308)

(assert (=> b!58321 (= lt!92259 (reader!0 thiss!1379 (_2!2764 lt!92251)))))

(declare-fun b!58322 () Bool)

(declare-fun e!38667 () Bool)

(declare-fun e!38670 () Bool)

(assert (=> b!58322 (= e!38667 e!38670)))

(declare-fun res!48435 () Bool)

(assert (=> b!58322 (=> res!48435 e!38670)))

(declare-fun isPrefixOf!0 (BitStream!2092 BitStream!2092) Bool)

(assert (=> b!58322 (= res!48435 (not (isPrefixOf!0 (_2!2764 lt!92255) (_2!2764 lt!92251))))))

(assert (=> b!58322 (isPrefixOf!0 thiss!1379 (_2!2764 lt!92251))))

(declare-fun lt!92260 () Unit!4027)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2092 BitStream!2092 BitStream!2092) Unit!4027)

(assert (=> b!58322 (= lt!92260 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2764 lt!92255) (_2!2764 lt!92251)))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2092 array!2653 (_ BitVec 64) (_ BitVec 64)) tuple2!5306)

(assert (=> b!58322 (= lt!92251 (appendBitsMSBFirstLoop!0 (_2!2764 lt!92255) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58322 e!38671))

(declare-fun res!48434 () Bool)

(assert (=> b!58322 (=> (not res!48434) (not e!38671))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58322 (= res!48434 (validate_offset_bits!1 ((_ sign_extend 32) (size!1202 (buf!1583 (_2!2764 lt!92255)))) ((_ sign_extend 32) (currentByte!3201 thiss!1379)) ((_ sign_extend 32) (currentBit!3196 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92257 () Unit!4027)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2092 array!2653 (_ BitVec 64)) Unit!4027)

(assert (=> b!58322 (= lt!92257 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1583 (_2!2764 lt!92255)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58322 (= lt!92256 (reader!0 thiss!1379 (_2!2764 lt!92255)))))

(declare-fun b!58323 () Bool)

(declare-fun res!48437 () Bool)

(declare-fun e!38668 () Bool)

(assert (=> b!58323 (=> res!48437 e!38668)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58323 (= res!48437 (not (invariant!0 (currentBit!3196 (_2!2764 lt!92251)) (currentByte!3201 (_2!2764 lt!92251)) (size!1202 (buf!1583 (_2!2764 lt!92251))))))))

(declare-fun b!58324 () Bool)

(assert (=> b!58324 (= e!38668 e!38666)))

(declare-fun res!48432 () Bool)

(assert (=> b!58324 (=> res!48432 e!38666)))

(assert (=> b!58324 (= res!48432 (not (= (size!1202 (buf!1583 (_2!2764 lt!92255))) (size!1202 (buf!1583 (_2!2764 lt!92251))))))))

(declare-fun e!38665 () Bool)

(assert (=> b!58324 e!38665))

(declare-fun res!48438 () Bool)

(assert (=> b!58324 (=> (not res!48438) (not e!38665))))

(assert (=> b!58324 (= res!48438 (= (size!1202 (buf!1583 (_2!2764 lt!92251))) (size!1202 (buf!1583 thiss!1379))))))

(declare-fun b!58325 () Bool)

(declare-fun res!48430 () Bool)

(declare-fun e!38673 () Bool)

(assert (=> b!58325 (=> (not res!48430) (not e!38673))))

(assert (=> b!58325 (= res!48430 (validate_offset_bits!1 ((_ sign_extend 32) (size!1202 (buf!1583 thiss!1379))) ((_ sign_extend 32) (currentByte!3201 thiss!1379)) ((_ sign_extend 32) (currentBit!3196 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58326 () Bool)

(declare-fun res!48433 () Bool)

(assert (=> b!58326 (=> res!48433 e!38668)))

(assert (=> b!58326 (= res!48433 (not (= (size!1202 (buf!1583 thiss!1379)) (size!1202 (buf!1583 (_2!2764 lt!92251))))))))

(declare-fun b!58327 () Bool)

(declare-fun res!48429 () Bool)

(assert (=> b!58327 (=> res!48429 e!38666)))

(assert (=> b!58327 (= res!48429 (not (invariant!0 (currentBit!3196 (_2!2764 lt!92255)) (currentByte!3201 (_2!2764 lt!92255)) (size!1202 (buf!1583 (_2!2764 lt!92251))))))))

(declare-fun b!58328 () Bool)

(declare-fun res!48427 () Bool)

(assert (=> b!58328 (=> res!48427 e!38666)))

(assert (=> b!58328 (= res!48427 (not (invariant!0 (currentBit!3196 (_2!2764 lt!92255)) (currentByte!3201 (_2!2764 lt!92255)) (size!1202 (buf!1583 (_2!2764 lt!92255))))))))

(declare-fun lt!92253 () (_ BitVec 64))

(declare-fun b!58329 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58329 (= e!38665 (= lt!92253 (bvsub (bvsub (bvadd (bitIndex!0 (size!1202 (buf!1583 (_2!2764 lt!92255))) (currentByte!3201 (_2!2764 lt!92255)) (currentBit!3196 (_2!2764 lt!92255))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58330 () Bool)

(declare-fun e!38674 () Bool)

(assert (=> b!58330 (= e!38673 (not e!38674))))

(declare-fun res!48431 () Bool)

(assert (=> b!58330 (=> res!48431 e!38674)))

(assert (=> b!58330 (= res!48431 (bvsge i!635 to!314))))

(assert (=> b!58330 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92252 () Unit!4027)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2092) Unit!4027)

(assert (=> b!58330 (= lt!92252 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92258 () (_ BitVec 64))

(assert (=> b!58330 (= lt!92258 (bitIndex!0 (size!1202 (buf!1583 thiss!1379)) (currentByte!3201 thiss!1379) (currentBit!3196 thiss!1379)))))

(declare-fun res!48436 () Bool)

(assert (=> start!11796 (=> (not res!48436) (not e!38673))))

(assert (=> start!11796 (= res!48436 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1202 srcBuffer!2))))))))

(assert (=> start!11796 e!38673))

(assert (=> start!11796 true))

(declare-fun array_inv!1105 (array!2653) Bool)

(assert (=> start!11796 (array_inv!1105 srcBuffer!2)))

(declare-fun e!38672 () Bool)

(declare-fun inv!12 (BitStream!2092) Bool)

(assert (=> start!11796 (and (inv!12 thiss!1379) e!38672)))

(declare-fun b!58331 () Bool)

(assert (=> b!58331 (= e!38674 e!38667)))

(declare-fun res!48428 () Bool)

(assert (=> b!58331 (=> res!48428 e!38667)))

(assert (=> b!58331 (= res!48428 (not (isPrefixOf!0 thiss!1379 (_2!2764 lt!92255))))))

(assert (=> b!58331 (validate_offset_bits!1 ((_ sign_extend 32) (size!1202 (buf!1583 (_2!2764 lt!92255)))) ((_ sign_extend 32) (currentByte!3201 (_2!2764 lt!92255))) ((_ sign_extend 32) (currentBit!3196 (_2!2764 lt!92255))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92254 () Unit!4027)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2092 BitStream!2092 (_ BitVec 64) (_ BitVec 64)) Unit!4027)

(assert (=> b!58331 (= lt!92254 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2764 lt!92255) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2092 (_ BitVec 8) (_ BitVec 32)) tuple2!5306)

(assert (=> b!58331 (= lt!92255 (appendBitFromByte!0 thiss!1379 (select (arr!1766 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58332 () Bool)

(assert (=> b!58332 (= e!38672 (array_inv!1105 (buf!1583 thiss!1379)))))

(declare-fun b!58333 () Bool)

(assert (=> b!58333 (= e!38670 e!38668)))

(declare-fun res!48426 () Bool)

(assert (=> b!58333 (=> res!48426 e!38668)))

(assert (=> b!58333 (= res!48426 (not (= lt!92253 (bvsub (bvadd lt!92258 to!314) i!635))))))

(assert (=> b!58333 (= lt!92253 (bitIndex!0 (size!1202 (buf!1583 (_2!2764 lt!92251))) (currentByte!3201 (_2!2764 lt!92251)) (currentBit!3196 (_2!2764 lt!92251))))))

(assert (= (and start!11796 res!48436) b!58325))

(assert (= (and b!58325 res!48430) b!58330))

(assert (= (and b!58330 (not res!48431)) b!58331))

(assert (= (and b!58331 (not res!48428)) b!58322))

(assert (= (and b!58322 res!48434) b!58320))

(assert (= (and b!58322 (not res!48435)) b!58333))

(assert (= (and b!58333 (not res!48426)) b!58323))

(assert (= (and b!58323 (not res!48437)) b!58326))

(assert (= (and b!58326 (not res!48433)) b!58324))

(assert (= (and b!58324 res!48438) b!58329))

(assert (= (and b!58324 (not res!48432)) b!58328))

(assert (= (and b!58328 (not res!48427)) b!58327))

(assert (= (and b!58327 (not res!48429)) b!58321))

(assert (= start!11796 b!58332))

(declare-fun m!91909 () Bool)

(assert (=> b!58332 m!91909))

(declare-fun m!91911 () Bool)

(assert (=> b!58323 m!91911))

(declare-fun m!91913 () Bool)

(assert (=> b!58322 m!91913))

(declare-fun m!91915 () Bool)

(assert (=> b!58322 m!91915))

(declare-fun m!91917 () Bool)

(assert (=> b!58322 m!91917))

(declare-fun m!91919 () Bool)

(assert (=> b!58322 m!91919))

(declare-fun m!91921 () Bool)

(assert (=> b!58322 m!91921))

(declare-fun m!91923 () Bool)

(assert (=> b!58322 m!91923))

(declare-fun m!91925 () Bool)

(assert (=> b!58322 m!91925))

(declare-fun m!91927 () Bool)

(assert (=> b!58331 m!91927))

(declare-fun m!91929 () Bool)

(assert (=> b!58331 m!91929))

(declare-fun m!91931 () Bool)

(assert (=> b!58331 m!91931))

(declare-fun m!91933 () Bool)

(assert (=> b!58331 m!91933))

(assert (=> b!58331 m!91927))

(declare-fun m!91935 () Bool)

(assert (=> b!58331 m!91935))

(declare-fun m!91937 () Bool)

(assert (=> b!58333 m!91937))

(declare-fun m!91939 () Bool)

(assert (=> b!58320 m!91939))

(assert (=> b!58320 m!91939))

(declare-fun m!91941 () Bool)

(assert (=> b!58320 m!91941))

(declare-fun m!91943 () Bool)

(assert (=> b!58320 m!91943))

(assert (=> b!58320 m!91943))

(declare-fun m!91945 () Bool)

(assert (=> b!58320 m!91945))

(declare-fun m!91947 () Bool)

(assert (=> b!58328 m!91947))

(declare-fun m!91949 () Bool)

(assert (=> b!58330 m!91949))

(declare-fun m!91951 () Bool)

(assert (=> b!58330 m!91951))

(declare-fun m!91953 () Bool)

(assert (=> b!58330 m!91953))

(declare-fun m!91955 () Bool)

(assert (=> b!58321 m!91955))

(declare-fun m!91957 () Bool)

(assert (=> b!58325 m!91957))

(declare-fun m!91959 () Bool)

(assert (=> b!58327 m!91959))

(declare-fun m!91961 () Bool)

(assert (=> b!58329 m!91961))

(declare-fun m!91963 () Bool)

(assert (=> start!11796 m!91963))

(declare-fun m!91965 () Bool)

(assert (=> start!11796 m!91965))

(push 1)

