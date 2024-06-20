; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4954 () Bool)

(assert start!4954)

(declare-fun b!19704 () Bool)

(declare-fun e!13153 () Bool)

(declare-fun e!13152 () Bool)

(assert (=> b!19704 (= e!13153 e!13152)))

(declare-fun res!17203 () Bool)

(assert (=> b!19704 (=> (not res!17203) (not e!13152))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!28030 () (_ BitVec 64))

(assert (=> b!19704 (= res!17203 (bvsle to!314 lt!28030))))

(declare-datatypes ((array!1421 0))(
  ( (array!1422 (arr!1045 (Array (_ BitVec 32) (_ BitVec 8))) (size!604 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1421)

(assert (=> b!19704 (= lt!28030 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!604 srcBuffer!2))))))

(declare-fun b!19705 () Bool)

(declare-fun e!13155 () Bool)

(declare-datatypes ((BitStream!1042 0))(
  ( (BitStream!1043 (buf!907 array!1421) (currentByte!2190 (_ BitVec 32)) (currentBit!2185 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1042)

(declare-fun array_inv!574 (array!1421) Bool)

(assert (=> b!19705 (= e!13155 (array_inv!574 (buf!907 thiss!1379)))))

(declare-fun b!19706 () Bool)

(declare-fun res!17200 () Bool)

(assert (=> b!19706 (=> (not res!17200) (not e!13152))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19706 (= res!17200 (validate_offset_bits!1 ((_ sign_extend 32) (size!604 (buf!907 thiss!1379))) ((_ sign_extend 32) (currentByte!2190 thiss!1379)) ((_ sign_extend 32) (currentBit!2185 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19707 () Bool)

(declare-fun e!13149 () Bool)

(declare-fun e!13151 () Bool)

(assert (=> b!19707 (= e!13149 e!13151)))

(declare-fun res!17201 () Bool)

(assert (=> b!19707 (=> res!17201 e!13151)))

(declare-datatypes ((Unit!1755 0))(
  ( (Unit!1756) )
))
(declare-datatypes ((tuple2!2276 0))(
  ( (tuple2!2277 (_1!1223 Unit!1755) (_2!1223 BitStream!1042)) )
))
(declare-fun lt!28035 () tuple2!2276)

(declare-fun isPrefixOf!0 (BitStream!1042 BitStream!1042) Bool)

(assert (=> b!19707 (= res!17201 (not (isPrefixOf!0 thiss!1379 (_2!1223 lt!28035))))))

(assert (=> b!19707 (validate_offset_bits!1 ((_ sign_extend 32) (size!604 (buf!907 (_2!1223 lt!28035)))) ((_ sign_extend 32) (currentByte!2190 (_2!1223 lt!28035))) ((_ sign_extend 32) (currentBit!2185 (_2!1223 lt!28035))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!28031 () Unit!1755)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1042 BitStream!1042 (_ BitVec 64) (_ BitVec 64)) Unit!1755)

(assert (=> b!19707 (= lt!28031 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1223 lt!28035) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1042 (_ BitVec 8) (_ BitVec 32)) tuple2!2276)

(assert (=> b!19707 (= lt!28035 (appendBitFromByte!0 thiss!1379 (select (arr!1045 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19708 () Bool)

(assert (=> b!19708 (= e!13151 (or (bvsge i!635 #b0111111111111111111111111111111111111111111111111111111111111110) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) lt!28030)))))

(declare-datatypes ((List!222 0))(
  ( (Nil!219) (Cons!218 (h!337 Bool) (t!972 List!222)) )
))
(declare-fun lt!28034 () List!222)

(declare-datatypes ((tuple2!2278 0))(
  ( (tuple2!2279 (_1!1224 BitStream!1042) (_2!1224 BitStream!1042)) )
))
(declare-fun lt!28036 () tuple2!2278)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1042 BitStream!1042 (_ BitVec 64)) List!222)

(assert (=> b!19708 (= lt!28034 (bitStreamReadBitsIntoList!0 (_2!1223 lt!28035) (_1!1224 lt!28036) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19708 (validate_offset_bits!1 ((_ sign_extend 32) (size!604 (buf!907 (_2!1223 lt!28035)))) ((_ sign_extend 32) (currentByte!2190 thiss!1379)) ((_ sign_extend 32) (currentBit!2185 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28033 () Unit!1755)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1042 array!1421 (_ BitVec 64)) Unit!1755)

(assert (=> b!19708 (= lt!28033 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!907 (_2!1223 lt!28035)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1042 BitStream!1042) tuple2!2278)

(assert (=> b!19708 (= lt!28036 (reader!0 thiss!1379 (_2!1223 lt!28035)))))

(declare-fun res!17204 () Bool)

(assert (=> start!4954 (=> (not res!17204) (not e!13153))))

(assert (=> start!4954 (= res!17204 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!4954 e!13153))

(assert (=> start!4954 true))

(declare-fun inv!12 (BitStream!1042) Bool)

(assert (=> start!4954 (and (inv!12 thiss!1379) e!13155)))

(assert (=> start!4954 (array_inv!574 srcBuffer!2)))

(declare-fun b!19709 () Bool)

(assert (=> b!19709 (= e!13152 (not e!13149))))

(declare-fun res!17202 () Bool)

(assert (=> b!19709 (=> res!17202 e!13149)))

(assert (=> b!19709 (= res!17202 (bvsge i!635 to!314))))

(assert (=> b!19709 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!28029 () Unit!1755)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1042) Unit!1755)

(assert (=> b!19709 (= lt!28029 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!28032 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19709 (= lt!28032 (bitIndex!0 (size!604 (buf!907 thiss!1379)) (currentByte!2190 thiss!1379) (currentBit!2185 thiss!1379)))))

(assert (= (and start!4954 res!17204) b!19704))

(assert (= (and b!19704 res!17203) b!19706))

(assert (= (and b!19706 res!17200) b!19709))

(assert (= (and b!19709 (not res!17202)) b!19707))

(assert (= (and b!19707 (not res!17201)) b!19708))

(assert (= start!4954 b!19705))

(declare-fun m!26643 () Bool)

(assert (=> b!19705 m!26643))

(declare-fun m!26645 () Bool)

(assert (=> b!19708 m!26645))

(declare-fun m!26647 () Bool)

(assert (=> b!19708 m!26647))

(declare-fun m!26649 () Bool)

(assert (=> b!19708 m!26649))

(declare-fun m!26651 () Bool)

(assert (=> b!19708 m!26651))

(declare-fun m!26653 () Bool)

(assert (=> start!4954 m!26653))

(declare-fun m!26655 () Bool)

(assert (=> start!4954 m!26655))

(declare-fun m!26657 () Bool)

(assert (=> b!19706 m!26657))

(declare-fun m!26659 () Bool)

(assert (=> b!19709 m!26659))

(declare-fun m!26661 () Bool)

(assert (=> b!19709 m!26661))

(declare-fun m!26663 () Bool)

(assert (=> b!19709 m!26663))

(declare-fun m!26665 () Bool)

(assert (=> b!19707 m!26665))

(declare-fun m!26667 () Bool)

(assert (=> b!19707 m!26667))

(assert (=> b!19707 m!26665))

(declare-fun m!26669 () Bool)

(assert (=> b!19707 m!26669))

(declare-fun m!26671 () Bool)

(assert (=> b!19707 m!26671))

(declare-fun m!26673 () Bool)

(assert (=> b!19707 m!26673))

(push 1)

(assert (not start!4954))

(assert (not b!19705))

(assert (not b!19706))

(assert (not b!19709))

(assert (not b!19707))

(assert (not b!19708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

