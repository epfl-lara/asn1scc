; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4940 () Bool)

(assert start!4940)

(declare-fun b!19597 () Bool)

(declare-fun res!17114 () Bool)

(declare-fun e!13024 () Bool)

(assert (=> b!19597 (=> (not res!17114) (not e!13024))))

(declare-datatypes ((array!1407 0))(
  ( (array!1408 (arr!1038 (Array (_ BitVec 32) (_ BitVec 8))) (size!597 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1028 0))(
  ( (BitStream!1029 (buf!900 array!1407) (currentByte!2183 (_ BitVec 32)) (currentBit!2178 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1028)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19597 (= res!17114 (validate_offset_bits!1 ((_ sign_extend 32) (size!597 (buf!900 thiss!1379))) ((_ sign_extend 32) (currentByte!2183 thiss!1379)) ((_ sign_extend 32) (currentBit!2178 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19599 () Bool)

(declare-fun e!13023 () Bool)

(declare-fun array_inv!567 (array!1407) Bool)

(assert (=> b!19599 (= e!13023 (array_inv!567 (buf!900 thiss!1379)))))

(declare-fun b!19600 () Bool)

(declare-fun e!13026 () Bool)

(declare-fun e!13022 () Bool)

(assert (=> b!19600 (= e!13026 e!13022)))

(declare-fun res!17116 () Bool)

(assert (=> b!19600 (=> res!17116 e!13022)))

(declare-datatypes ((Unit!1741 0))(
  ( (Unit!1742) )
))
(declare-datatypes ((tuple2!2248 0))(
  ( (tuple2!2249 (_1!1209 Unit!1741) (_2!1209 BitStream!1028)) )
))
(declare-fun lt!27885 () tuple2!2248)

(declare-fun isPrefixOf!0 (BitStream!1028 BitStream!1028) Bool)

(assert (=> b!19600 (= res!17116 (not (isPrefixOf!0 thiss!1379 (_2!1209 lt!27885))))))

(assert (=> b!19600 (validate_offset_bits!1 ((_ sign_extend 32) (size!597 (buf!900 (_2!1209 lt!27885)))) ((_ sign_extend 32) (currentByte!2183 (_2!1209 lt!27885))) ((_ sign_extend 32) (currentBit!2178 (_2!1209 lt!27885))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27881 () Unit!1741)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1028 BitStream!1028 (_ BitVec 64) (_ BitVec 64)) Unit!1741)

(assert (=> b!19600 (= lt!27881 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1209 lt!27885) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1407)

(declare-fun appendBitFromByte!0 (BitStream!1028 (_ BitVec 8) (_ BitVec 32)) tuple2!2248)

(assert (=> b!19600 (= lt!27885 (appendBitFromByte!0 thiss!1379 (select (arr!1038 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19601 () Bool)

(assert (=> b!19601 (= e!13024 (not e!13026))))

(declare-fun res!17115 () Bool)

(assert (=> b!19601 (=> res!17115 e!13026)))

(assert (=> b!19601 (= res!17115 (bvsge i!635 to!314))))

(assert (=> b!19601 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27880 () Unit!1741)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1028) Unit!1741)

(assert (=> b!19601 (= lt!27880 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27882 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19601 (= lt!27882 (bitIndex!0 (size!597 (buf!900 thiss!1379)) (currentByte!2183 thiss!1379) (currentBit!2178 thiss!1379)))))

(declare-fun res!17117 () Bool)

(assert (=> start!4940 (=> (not res!17117) (not e!13024))))

(assert (=> start!4940 (= res!17117 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!597 srcBuffer!2))))))))

(assert (=> start!4940 e!13024))

(assert (=> start!4940 true))

(assert (=> start!4940 (array_inv!567 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1028) Bool)

(assert (=> start!4940 (and (inv!12 thiss!1379) e!13023)))

(declare-fun b!19598 () Bool)

(assert (=> b!19598 (= e!13022 true)))

(declare-datatypes ((List!215 0))(
  ( (Nil!212) (Cons!211 (h!330 Bool) (t!965 List!215)) )
))
(declare-fun lt!27886 () List!215)

(declare-datatypes ((tuple2!2250 0))(
  ( (tuple2!2251 (_1!1210 BitStream!1028) (_2!1210 BitStream!1028)) )
))
(declare-fun lt!27884 () tuple2!2250)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1028 BitStream!1028 (_ BitVec 64)) List!215)

(assert (=> b!19598 (= lt!27886 (bitStreamReadBitsIntoList!0 (_2!1209 lt!27885) (_1!1210 lt!27884) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19598 (validate_offset_bits!1 ((_ sign_extend 32) (size!597 (buf!900 (_2!1209 lt!27885)))) ((_ sign_extend 32) (currentByte!2183 thiss!1379)) ((_ sign_extend 32) (currentBit!2178 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27883 () Unit!1741)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1028 array!1407 (_ BitVec 64)) Unit!1741)

(assert (=> b!19598 (= lt!27883 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!900 (_2!1209 lt!27885)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1028 BitStream!1028) tuple2!2250)

(assert (=> b!19598 (= lt!27884 (reader!0 thiss!1379 (_2!1209 lt!27885)))))

(assert (= (and start!4940 res!17117) b!19597))

(assert (= (and b!19597 res!17114) b!19601))

(assert (= (and b!19601 (not res!17115)) b!19600))

(assert (= (and b!19600 (not res!17116)) b!19598))

(assert (= start!4940 b!19599))

(declare-fun m!26419 () Bool)

(assert (=> b!19600 m!26419))

(declare-fun m!26421 () Bool)

(assert (=> b!19600 m!26421))

(declare-fun m!26423 () Bool)

(assert (=> b!19600 m!26423))

(declare-fun m!26425 () Bool)

(assert (=> b!19600 m!26425))

(assert (=> b!19600 m!26419))

(declare-fun m!26427 () Bool)

(assert (=> b!19600 m!26427))

(declare-fun m!26429 () Bool)

(assert (=> b!19598 m!26429))

(declare-fun m!26431 () Bool)

(assert (=> b!19598 m!26431))

(declare-fun m!26433 () Bool)

(assert (=> b!19598 m!26433))

(declare-fun m!26435 () Bool)

(assert (=> b!19598 m!26435))

(declare-fun m!26437 () Bool)

(assert (=> b!19599 m!26437))

(declare-fun m!26439 () Bool)

(assert (=> start!4940 m!26439))

(declare-fun m!26441 () Bool)

(assert (=> start!4940 m!26441))

(declare-fun m!26443 () Bool)

(assert (=> b!19601 m!26443))

(declare-fun m!26445 () Bool)

(assert (=> b!19601 m!26445))

(declare-fun m!26447 () Bool)

(assert (=> b!19601 m!26447))

(declare-fun m!26449 () Bool)

(assert (=> b!19597 m!26449))

(push 1)

(assert (not b!19598))

(assert (not start!4940))

(assert (not b!19597))

(assert (not b!19599))

(assert (not b!19601))

(assert (not b!19600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

