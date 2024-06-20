; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5152 () Bool)

(assert start!5152)

(declare-fun b!20684 () Bool)

(declare-fun res!17961 () Bool)

(declare-fun e!14000 () Bool)

(assert (=> b!20684 (=> (not res!17961) (not e!14000))))

(declare-datatypes ((array!1487 0))(
  ( (array!1488 (arr!1078 (Array (_ BitVec 32) (_ BitVec 8))) (size!634 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1102 0))(
  ( (BitStream!1103 (buf!943 array!1487) (currentByte!2232 (_ BitVec 32)) (currentBit!2227 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1102)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20684 (= res!17961 (validate_offset_bits!1 ((_ sign_extend 32) (size!634 (buf!943 thiss!1379))) ((_ sign_extend 32) (currentByte!2232 thiss!1379)) ((_ sign_extend 32) (currentBit!2227 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20685 () Bool)

(declare-fun e!14002 () Bool)

(assert (=> b!20685 (= e!14000 (not e!14002))))

(declare-fun res!17962 () Bool)

(assert (=> b!20685 (=> res!17962 e!14002)))

(assert (=> b!20685 (= res!17962 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1102 BitStream!1102) Bool)

(assert (=> b!20685 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1821 0))(
  ( (Unit!1822) )
))
(declare-fun lt!29384 () Unit!1821)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1102) Unit!1821)

(assert (=> b!20685 (= lt!29384 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29388 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20685 (= lt!29388 (bitIndex!0 (size!634 (buf!943 thiss!1379)) (currentByte!2232 thiss!1379) (currentBit!2227 thiss!1379)))))

(declare-fun srcBuffer!2 () array!1487)

(declare-datatypes ((tuple2!2444 0))(
  ( (tuple2!2445 (_1!1307 Unit!1821) (_2!1307 BitStream!1102)) )
))
(declare-fun lt!29387 () tuple2!2444)

(declare-fun e!14007 () Bool)

(declare-datatypes ((tuple2!2446 0))(
  ( (tuple2!2447 (_1!1308 BitStream!1102) (_2!1308 BitStream!1102)) )
))
(declare-fun lt!29389 () tuple2!2446)

(declare-fun b!20686 () Bool)

(declare-datatypes ((List!252 0))(
  ( (Nil!249) (Cons!248 (h!367 Bool) (t!1002 List!252)) )
))
(declare-fun head!89 (List!252) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1102 array!1487 (_ BitVec 64) (_ BitVec 64)) List!252)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1102 BitStream!1102 (_ BitVec 64)) List!252)

(assert (=> b!20686 (= e!14007 (= (head!89 (byteArrayBitContentToList!0 (_2!1307 lt!29387) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!89 (bitStreamReadBitsIntoList!0 (_2!1307 lt!29387) (_1!1308 lt!29389) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!17960 () Bool)

(assert (=> start!5152 (=> (not res!17960) (not e!14000))))

(assert (=> start!5152 (= res!17960 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!634 srcBuffer!2))))))))

(assert (=> start!5152 e!14000))

(assert (=> start!5152 true))

(declare-fun array_inv!604 (array!1487) Bool)

(assert (=> start!5152 (array_inv!604 srcBuffer!2)))

(declare-fun e!14001 () Bool)

(declare-fun inv!12 (BitStream!1102) Bool)

(assert (=> start!5152 (and (inv!12 thiss!1379) e!14001)))

(declare-fun b!20687 () Bool)

(declare-fun e!14006 () Bool)

(assert (=> b!20687 (= e!14002 e!14006)))

(declare-fun res!17959 () Bool)

(assert (=> b!20687 (=> res!17959 e!14006)))

(assert (=> b!20687 (= res!17959 (not (isPrefixOf!0 thiss!1379 (_2!1307 lt!29387))))))

(assert (=> b!20687 (validate_offset_bits!1 ((_ sign_extend 32) (size!634 (buf!943 (_2!1307 lt!29387)))) ((_ sign_extend 32) (currentByte!2232 (_2!1307 lt!29387))) ((_ sign_extend 32) (currentBit!2227 (_2!1307 lt!29387))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29385 () Unit!1821)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1102 BitStream!1102 (_ BitVec 64) (_ BitVec 64)) Unit!1821)

(assert (=> b!20687 (= lt!29385 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1307 lt!29387) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1102 (_ BitVec 8) (_ BitVec 32)) tuple2!2444)

(assert (=> b!20687 (= lt!29387 (appendBitFromByte!0 thiss!1379 (select (arr!1078 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20688 () Bool)

(declare-fun e!14005 () Bool)

(assert (=> b!20688 (= e!14006 e!14005)))

(declare-fun res!17958 () Bool)

(assert (=> b!20688 (=> res!17958 e!14005)))

(assert (=> b!20688 (= res!17958 (or (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> b!20688 e!14007))

(declare-fun res!17963 () Bool)

(assert (=> b!20688 (=> (not res!17963) (not e!14007))))

(assert (=> b!20688 (= res!17963 (validate_offset_bits!1 ((_ sign_extend 32) (size!634 (buf!943 (_2!1307 lt!29387)))) ((_ sign_extend 32) (currentByte!2232 thiss!1379)) ((_ sign_extend 32) (currentBit!2227 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29386 () Unit!1821)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1102 array!1487 (_ BitVec 64)) Unit!1821)

(assert (=> b!20688 (= lt!29386 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!943 (_2!1307 lt!29387)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1102 BitStream!1102) tuple2!2446)

(assert (=> b!20688 (= lt!29389 (reader!0 thiss!1379 (_2!1307 lt!29387)))))

(declare-fun b!20689 () Bool)

(assert (=> b!20689 (= e!14005 (validate_offset_bits!1 ((_ sign_extend 32) (size!634 (buf!943 (_2!1307 lt!29387)))) ((_ sign_extend 32) (currentByte!2232 (_2!1307 lt!29387))) ((_ sign_extend 32) (currentBit!2227 (_2!1307 lt!29387))) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun b!20690 () Bool)

(assert (=> b!20690 (= e!14001 (array_inv!604 (buf!943 thiss!1379)))))

(assert (= (and start!5152 res!17960) b!20684))

(assert (= (and b!20684 res!17961) b!20685))

(assert (= (and b!20685 (not res!17962)) b!20687))

(assert (= (and b!20687 (not res!17959)) b!20688))

(assert (= (and b!20688 res!17963) b!20686))

(assert (= (and b!20688 (not res!17958)) b!20689))

(assert (= start!5152 b!20690))

(declare-fun m!28233 () Bool)

(assert (=> b!20688 m!28233))

(declare-fun m!28235 () Bool)

(assert (=> b!20688 m!28235))

(declare-fun m!28237 () Bool)

(assert (=> b!20688 m!28237))

(declare-fun m!28239 () Bool)

(assert (=> start!5152 m!28239))

(declare-fun m!28241 () Bool)

(assert (=> start!5152 m!28241))

(declare-fun m!28243 () Bool)

(assert (=> b!20686 m!28243))

(assert (=> b!20686 m!28243))

(declare-fun m!28245 () Bool)

(assert (=> b!20686 m!28245))

(declare-fun m!28247 () Bool)

(assert (=> b!20686 m!28247))

(assert (=> b!20686 m!28247))

(declare-fun m!28249 () Bool)

(assert (=> b!20686 m!28249))

(declare-fun m!28251 () Bool)

(assert (=> b!20685 m!28251))

(declare-fun m!28253 () Bool)

(assert (=> b!20685 m!28253))

(declare-fun m!28255 () Bool)

(assert (=> b!20685 m!28255))

(declare-fun m!28257 () Bool)

(assert (=> b!20687 m!28257))

(declare-fun m!28259 () Bool)

(assert (=> b!20687 m!28259))

(declare-fun m!28261 () Bool)

(assert (=> b!20687 m!28261))

(assert (=> b!20687 m!28257))

(declare-fun m!28263 () Bool)

(assert (=> b!20687 m!28263))

(declare-fun m!28265 () Bool)

(assert (=> b!20687 m!28265))

(declare-fun m!28267 () Bool)

(assert (=> b!20690 m!28267))

(declare-fun m!28269 () Bool)

(assert (=> b!20684 m!28269))

(declare-fun m!28271 () Bool)

(assert (=> b!20689 m!28271))

(push 1)

(assert (not b!20686))

(assert (not b!20684))

(assert (not b!20690))

(assert (not b!20687))

(assert (not b!20688))

(assert (not b!20685))

(assert (not start!5152))

(assert (not b!20689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

