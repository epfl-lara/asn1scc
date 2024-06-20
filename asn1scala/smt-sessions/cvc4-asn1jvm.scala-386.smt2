; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10002 () Bool)

(assert start!10002)

(declare-fun b!50254 () Bool)

(declare-fun res!42037 () Bool)

(declare-fun e!33176 () Bool)

(assert (=> b!50254 (=> (not res!42037) (not e!33176))))

(declare-datatypes ((array!2324 0))(
  ( (array!2325 (arr!1585 (Array (_ BitVec 32) (_ BitVec 8))) (size!1056 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1826 0))(
  ( (BitStream!1827 (buf!1411 array!2324) (currentByte!2934 (_ BitVec 32)) (currentBit!2929 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1826)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50254 (= res!42037 (validate_offset_bits!1 ((_ sign_extend 32) (size!1056 (buf!1411 thiss!1379))) ((_ sign_extend 32) (currentByte!2934 thiss!1379)) ((_ sign_extend 32) (currentBit!2929 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50255 () Bool)

(declare-fun e!33174 () Bool)

(assert (=> b!50255 (= e!33176 (not e!33174))))

(declare-fun res!42041 () Bool)

(assert (=> b!50255 (=> res!42041 e!33174)))

(assert (=> b!50255 (= res!42041 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1826 BitStream!1826) Bool)

(assert (=> b!50255 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3487 0))(
  ( (Unit!3488) )
))
(declare-fun lt!78037 () Unit!3487)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1826) Unit!3487)

(assert (=> b!50255 (= lt!78037 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!78046 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50255 (= lt!78046 (bitIndex!0 (size!1056 (buf!1411 thiss!1379)) (currentByte!2934 thiss!1379) (currentBit!2929 thiss!1379)))))

(declare-fun b!50256 () Bool)

(declare-fun res!42049 () Bool)

(declare-fun e!33178 () Bool)

(assert (=> b!50256 (=> res!42049 e!33178)))

(declare-datatypes ((tuple2!4640 0))(
  ( (tuple2!4641 (_1!2425 Unit!3487) (_2!2425 BitStream!1826)) )
))
(declare-fun lt!78052 () tuple2!4640)

(assert (=> b!50256 (= res!42049 (not (= (size!1056 (buf!1411 thiss!1379)) (size!1056 (buf!1411 (_2!2425 lt!78052))))))))

(declare-fun b!50257 () Bool)

(declare-fun e!33175 () Bool)

(declare-fun array_inv!966 (array!2324) Bool)

(assert (=> b!50257 (= e!33175 (array_inv!966 (buf!1411 thiss!1379)))))

(declare-fun b!50259 () Bool)

(declare-fun e!33173 () Bool)

(declare-fun e!33171 () Bool)

(assert (=> b!50259 (= e!33173 e!33171)))

(declare-fun res!42038 () Bool)

(assert (=> b!50259 (=> res!42038 e!33171)))

(assert (=> b!50259 (= res!42038 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!554 0))(
  ( (Nil!551) (Cons!550 (h!669 Bool) (t!1304 List!554)) )
))
(declare-fun lt!78038 () List!554)

(declare-datatypes ((tuple2!4642 0))(
  ( (tuple2!4643 (_1!2426 BitStream!1826) (_2!2426 BitStream!1826)) )
))
(declare-fun lt!78044 () tuple2!4642)

(declare-fun lt!78051 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1826 BitStream!1826 (_ BitVec 64)) List!554)

(assert (=> b!50259 (= lt!78038 (bitStreamReadBitsIntoList!0 (_2!2425 lt!78052) (_1!2426 lt!78044) lt!78051))))

(declare-fun lt!78050 () List!554)

(declare-fun lt!78040 () tuple2!4642)

(assert (=> b!50259 (= lt!78050 (bitStreamReadBitsIntoList!0 (_2!2425 lt!78052) (_1!2426 lt!78040) (bvsub to!314 i!635)))))

(declare-fun lt!78048 () tuple2!4640)

(assert (=> b!50259 (validate_offset_bits!1 ((_ sign_extend 32) (size!1056 (buf!1411 (_2!2425 lt!78052)))) ((_ sign_extend 32) (currentByte!2934 (_2!2425 lt!78048))) ((_ sign_extend 32) (currentBit!2929 (_2!2425 lt!78048))) lt!78051)))

(declare-fun lt!78045 () Unit!3487)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1826 array!2324 (_ BitVec 64)) Unit!3487)

(assert (=> b!50259 (= lt!78045 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2425 lt!78048) (buf!1411 (_2!2425 lt!78052)) lt!78051))))

(declare-fun reader!0 (BitStream!1826 BitStream!1826) tuple2!4642)

(assert (=> b!50259 (= lt!78044 (reader!0 (_2!2425 lt!78048) (_2!2425 lt!78052)))))

(assert (=> b!50259 (validate_offset_bits!1 ((_ sign_extend 32) (size!1056 (buf!1411 (_2!2425 lt!78052)))) ((_ sign_extend 32) (currentByte!2934 thiss!1379)) ((_ sign_extend 32) (currentBit!2929 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78047 () Unit!3487)

(assert (=> b!50259 (= lt!78047 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1411 (_2!2425 lt!78052)) (bvsub to!314 i!635)))))

(assert (=> b!50259 (= lt!78040 (reader!0 thiss!1379 (_2!2425 lt!78052)))))

(declare-fun b!50260 () Bool)

(assert (=> b!50260 (= e!33178 e!33173)))

(declare-fun res!42046 () Bool)

(assert (=> b!50260 (=> res!42046 e!33173)))

(assert (=> b!50260 (= res!42046 (not (= (size!1056 (buf!1411 (_2!2425 lt!78048))) (size!1056 (buf!1411 (_2!2425 lt!78052))))))))

(declare-fun e!33168 () Bool)

(assert (=> b!50260 e!33168))

(declare-fun res!42051 () Bool)

(assert (=> b!50260 (=> (not res!42051) (not e!33168))))

(assert (=> b!50260 (= res!42051 (= (size!1056 (buf!1411 (_2!2425 lt!78052))) (size!1056 (buf!1411 thiss!1379))))))

(declare-fun b!50261 () Bool)

(declare-fun res!42047 () Bool)

(assert (=> b!50261 (=> res!42047 e!33173)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50261 (= res!42047 (not (invariant!0 (currentBit!2929 (_2!2425 lt!78048)) (currentByte!2934 (_2!2425 lt!78048)) (size!1056 (buf!1411 (_2!2425 lt!78052))))))))

(declare-fun b!50262 () Bool)

(declare-fun e!33179 () Bool)

(assert (=> b!50262 (= e!33174 e!33179)))

(declare-fun res!42048 () Bool)

(assert (=> b!50262 (=> res!42048 e!33179)))

(assert (=> b!50262 (= res!42048 (not (isPrefixOf!0 thiss!1379 (_2!2425 lt!78048))))))

(assert (=> b!50262 (validate_offset_bits!1 ((_ sign_extend 32) (size!1056 (buf!1411 (_2!2425 lt!78048)))) ((_ sign_extend 32) (currentByte!2934 (_2!2425 lt!78048))) ((_ sign_extend 32) (currentBit!2929 (_2!2425 lt!78048))) lt!78051)))

(assert (=> b!50262 (= lt!78051 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78049 () Unit!3487)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1826 BitStream!1826 (_ BitVec 64) (_ BitVec 64)) Unit!3487)

(assert (=> b!50262 (= lt!78049 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2425 lt!78048) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2324)

(declare-fun appendBitFromByte!0 (BitStream!1826 (_ BitVec 8) (_ BitVec 32)) tuple2!4640)

(assert (=> b!50262 (= lt!78048 (appendBitFromByte!0 thiss!1379 (select (arr!1585 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50263 () Bool)

(declare-fun e!33172 () Bool)

(assert (=> b!50263 (= e!33179 e!33172)))

(declare-fun res!42040 () Bool)

(assert (=> b!50263 (=> res!42040 e!33172)))

(assert (=> b!50263 (= res!42040 (not (isPrefixOf!0 (_2!2425 lt!78048) (_2!2425 lt!78052))))))

(assert (=> b!50263 (isPrefixOf!0 thiss!1379 (_2!2425 lt!78052))))

(declare-fun lt!78041 () Unit!3487)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1826 BitStream!1826 BitStream!1826) Unit!3487)

(assert (=> b!50263 (= lt!78041 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2425 lt!78048) (_2!2425 lt!78052)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1826 array!2324 (_ BitVec 64) (_ BitVec 64)) tuple2!4640)

(assert (=> b!50263 (= lt!78052 (appendBitsMSBFirstLoop!0 (_2!2425 lt!78048) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!33169 () Bool)

(assert (=> b!50263 e!33169))

(declare-fun res!42045 () Bool)

(assert (=> b!50263 (=> (not res!42045) (not e!33169))))

(assert (=> b!50263 (= res!42045 (validate_offset_bits!1 ((_ sign_extend 32) (size!1056 (buf!1411 (_2!2425 lt!78048)))) ((_ sign_extend 32) (currentByte!2934 thiss!1379)) ((_ sign_extend 32) (currentBit!2929 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78042 () Unit!3487)

(assert (=> b!50263 (= lt!78042 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1411 (_2!2425 lt!78048)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78043 () tuple2!4642)

(assert (=> b!50263 (= lt!78043 (reader!0 thiss!1379 (_2!2425 lt!78048)))))

(declare-fun b!50264 () Bool)

(declare-fun head!373 (List!554) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1826 array!2324 (_ BitVec 64) (_ BitVec 64)) List!554)

(assert (=> b!50264 (= e!33169 (= (head!373 (byteArrayBitContentToList!0 (_2!2425 lt!78048) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!373 (bitStreamReadBitsIntoList!0 (_2!2425 lt!78048) (_1!2426 lt!78043) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50265 () Bool)

(assert (=> b!50265 (= e!33171 true)))

(declare-fun tail!240 (List!554) List!554)

(assert (=> b!50265 (= lt!78038 (tail!240 lt!78050))))

(declare-fun lt!78039 () Unit!3487)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1826 BitStream!1826 BitStream!1826 BitStream!1826 (_ BitVec 64) List!554) Unit!3487)

(assert (=> b!50265 (= lt!78039 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2425 lt!78052) (_2!2425 lt!78052) (_1!2426 lt!78040) (_1!2426 lt!78044) (bvsub to!314 i!635) lt!78050))))

(declare-fun b!50266 () Bool)

(declare-fun res!42043 () Bool)

(assert (=> b!50266 (=> res!42043 e!33171)))

(declare-fun length!249 (List!554) Int)

(assert (=> b!50266 (= res!42043 (<= (length!249 lt!78050) 0))))

(declare-fun b!50267 () Bool)

(declare-fun res!42042 () Bool)

(assert (=> b!50267 (=> res!42042 e!33173)))

(assert (=> b!50267 (= res!42042 (not (invariant!0 (currentBit!2929 (_2!2425 lt!78048)) (currentByte!2934 (_2!2425 lt!78048)) (size!1056 (buf!1411 (_2!2425 lt!78048))))))))

(declare-fun res!42039 () Bool)

(assert (=> start!10002 (=> (not res!42039) (not e!33176))))

(assert (=> start!10002 (= res!42039 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1056 srcBuffer!2))))))))

(assert (=> start!10002 e!33176))

(assert (=> start!10002 true))

(assert (=> start!10002 (array_inv!966 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1826) Bool)

(assert (=> start!10002 (and (inv!12 thiss!1379) e!33175)))

(declare-fun lt!78036 () (_ BitVec 64))

(declare-fun b!50258 () Bool)

(assert (=> b!50258 (= e!33168 (= lt!78036 (bvsub (bvsub (bvadd (bitIndex!0 (size!1056 (buf!1411 (_2!2425 lt!78048))) (currentByte!2934 (_2!2425 lt!78048)) (currentBit!2929 (_2!2425 lt!78048))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!50268 () Bool)

(assert (=> b!50268 (= e!33172 e!33178)))

(declare-fun res!42050 () Bool)

(assert (=> b!50268 (=> res!42050 e!33178)))

(assert (=> b!50268 (= res!42050 (not (= lt!78036 (bvsub (bvadd lt!78046 to!314) i!635))))))

(assert (=> b!50268 (= lt!78036 (bitIndex!0 (size!1056 (buf!1411 (_2!2425 lt!78052))) (currentByte!2934 (_2!2425 lt!78052)) (currentBit!2929 (_2!2425 lt!78052))))))

(declare-fun b!50269 () Bool)

(declare-fun res!42044 () Bool)

(assert (=> b!50269 (=> res!42044 e!33178)))

(assert (=> b!50269 (= res!42044 (not (invariant!0 (currentBit!2929 (_2!2425 lt!78052)) (currentByte!2934 (_2!2425 lt!78052)) (size!1056 (buf!1411 (_2!2425 lt!78052))))))))

(assert (= (and start!10002 res!42039) b!50254))

(assert (= (and b!50254 res!42037) b!50255))

(assert (= (and b!50255 (not res!42041)) b!50262))

(assert (= (and b!50262 (not res!42048)) b!50263))

(assert (= (and b!50263 res!42045) b!50264))

(assert (= (and b!50263 (not res!42040)) b!50268))

(assert (= (and b!50268 (not res!42050)) b!50269))

(assert (= (and b!50269 (not res!42044)) b!50256))

(assert (= (and b!50256 (not res!42049)) b!50260))

(assert (= (and b!50260 res!42051) b!50258))

(assert (= (and b!50260 (not res!42046)) b!50267))

(assert (= (and b!50267 (not res!42042)) b!50261))

(assert (= (and b!50261 (not res!42047)) b!50259))

(assert (= (and b!50259 (not res!42038)) b!50266))

(assert (= (and b!50266 (not res!42043)) b!50265))

(assert (= start!10002 b!50257))

(declare-fun m!79059 () Bool)

(assert (=> b!50263 m!79059))

(declare-fun m!79061 () Bool)

(assert (=> b!50263 m!79061))

(declare-fun m!79063 () Bool)

(assert (=> b!50263 m!79063))

(declare-fun m!79065 () Bool)

(assert (=> b!50263 m!79065))

(declare-fun m!79067 () Bool)

(assert (=> b!50263 m!79067))

(declare-fun m!79069 () Bool)

(assert (=> b!50263 m!79069))

(declare-fun m!79071 () Bool)

(assert (=> b!50263 m!79071))

(declare-fun m!79073 () Bool)

(assert (=> b!50265 m!79073))

(declare-fun m!79075 () Bool)

(assert (=> b!50265 m!79075))

(declare-fun m!79077 () Bool)

(assert (=> start!10002 m!79077))

(declare-fun m!79079 () Bool)

(assert (=> start!10002 m!79079))

(declare-fun m!79081 () Bool)

(assert (=> b!50257 m!79081))

(declare-fun m!79083 () Bool)

(assert (=> b!50258 m!79083))

(declare-fun m!79085 () Bool)

(assert (=> b!50264 m!79085))

(assert (=> b!50264 m!79085))

(declare-fun m!79087 () Bool)

(assert (=> b!50264 m!79087))

(declare-fun m!79089 () Bool)

(assert (=> b!50264 m!79089))

(assert (=> b!50264 m!79089))

(declare-fun m!79091 () Bool)

(assert (=> b!50264 m!79091))

(declare-fun m!79093 () Bool)

(assert (=> b!50267 m!79093))

(declare-fun m!79095 () Bool)

(assert (=> b!50254 m!79095))

(declare-fun m!79097 () Bool)

(assert (=> b!50269 m!79097))

(declare-fun m!79099 () Bool)

(assert (=> b!50266 m!79099))

(declare-fun m!79101 () Bool)

(assert (=> b!50268 m!79101))

(declare-fun m!79103 () Bool)

(assert (=> b!50255 m!79103))

(declare-fun m!79105 () Bool)

(assert (=> b!50255 m!79105))

(declare-fun m!79107 () Bool)

(assert (=> b!50255 m!79107))

(declare-fun m!79109 () Bool)

(assert (=> b!50259 m!79109))

(declare-fun m!79111 () Bool)

(assert (=> b!50259 m!79111))

(declare-fun m!79113 () Bool)

(assert (=> b!50259 m!79113))

(declare-fun m!79115 () Bool)

(assert (=> b!50259 m!79115))

(declare-fun m!79117 () Bool)

(assert (=> b!50259 m!79117))

(declare-fun m!79119 () Bool)

(assert (=> b!50259 m!79119))

(declare-fun m!79121 () Bool)

(assert (=> b!50259 m!79121))

(declare-fun m!79123 () Bool)

(assert (=> b!50259 m!79123))

(declare-fun m!79125 () Bool)

(assert (=> b!50262 m!79125))

(assert (=> b!50262 m!79125))

(declare-fun m!79127 () Bool)

(assert (=> b!50262 m!79127))

(declare-fun m!79129 () Bool)

(assert (=> b!50262 m!79129))

(declare-fun m!79131 () Bool)

(assert (=> b!50262 m!79131))

(declare-fun m!79133 () Bool)

(assert (=> b!50262 m!79133))

(declare-fun m!79135 () Bool)

(assert (=> b!50261 m!79135))

(push 1)

(assert (not b!50264))

(assert (not b!50262))

(assert (not b!50269))

(assert (not b!50255))

(assert (not b!50258))

(assert (not b!50265))

(assert (not b!50259))

(assert (not b!50263))

(assert (not b!50261))

(assert (not b!50254))

(assert (not b!50268))

(assert (not start!10002))

(assert (not b!50257))

(assert (not b!50266))

(assert (not b!50267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

