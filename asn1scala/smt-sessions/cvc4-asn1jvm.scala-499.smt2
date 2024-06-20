; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14758 () Bool)

(assert start!14758)

(declare-fun b!76042 () Bool)

(declare-fun e!49824 () Bool)

(declare-fun e!49821 () Bool)

(assert (=> b!76042 (= e!49824 e!49821)))

(declare-fun res!62875 () Bool)

(assert (=> b!76042 (=> res!62875 e!49821)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!76042 (= res!62875 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!3125 0))(
  ( (array!3126 (arr!2054 (Array (_ BitVec 32) (_ BitVec 8))) (size!1456 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2486 0))(
  ( (BitStream!2487 (buf!1837 array!3125) (currentByte!3628 (_ BitVec 32)) (currentBit!3623 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6582 0))(
  ( (tuple2!6583 (_1!3422 array!3125) (_2!3422 BitStream!2486)) )
))
(declare-fun lt!122073 () tuple2!6582)

(declare-datatypes ((tuple2!6584 0))(
  ( (tuple2!6585 (_1!3423 BitStream!2486) (_2!3423 BitStream!2486)) )
))
(declare-fun lt!122071 () tuple2!6584)

(declare-fun readBits!0 (BitStream!2486 (_ BitVec 64)) tuple2!6582)

(assert (=> b!76042 (= lt!122073 (readBits!0 (_1!3423 lt!122071) (bvsub to!314 i!635)))))

(declare-fun thiss!1379 () BitStream!2486)

(declare-fun reader!0 (BitStream!2486 BitStream!2486) tuple2!6584)

(assert (=> b!76042 (= lt!122071 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!76043 () Bool)

(assert (=> b!76043 (= e!49821 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((List!785 0))(
  ( (Nil!782) (Cons!781 (h!900 Bool) (t!1535 List!785)) )
))
(declare-fun lt!122072 () List!785)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2486 BitStream!2486 (_ BitVec 64)) List!785)

(assert (=> b!76043 (= lt!122072 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!3423 lt!122071) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!5012 0))(
  ( (Unit!5013) )
))
(declare-fun lt!122076 () Unit!5012)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2486 array!3125 (_ BitVec 64)) Unit!5012)

(assert (=> b!76043 (= lt!122076 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1837 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!3125)

(declare-fun checkByteArrayBitContent!0 (BitStream!2486 array!3125 array!3125 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76043 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3422 lt!122073) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun res!62877 () Bool)

(declare-fun e!49819 () Bool)

(assert (=> start!14758 (=> (not res!62877) (not e!49819))))

(assert (=> start!14758 (= res!62877 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1456 srcBuffer!2))))))))

(assert (=> start!14758 e!49819))

(assert (=> start!14758 true))

(declare-fun array_inv!1302 (array!3125) Bool)

(assert (=> start!14758 (array_inv!1302 srcBuffer!2)))

(declare-fun e!49822 () Bool)

(declare-fun inv!12 (BitStream!2486) Bool)

(assert (=> start!14758 (and (inv!12 thiss!1379) e!49822)))

(declare-fun b!76044 () Bool)

(assert (=> b!76044 (= e!49822 (array_inv!1302 (buf!1837 thiss!1379)))))

(declare-fun b!76045 () Bool)

(assert (=> b!76045 (= e!49819 (not e!49824))))

(declare-fun res!62874 () Bool)

(assert (=> b!76045 (=> res!62874 e!49824)))

(declare-fun lt!122074 () (_ BitVec 64))

(assert (=> b!76045 (= res!62874 (or (bvslt i!635 to!314) (not (= lt!122074 (bvsub (bvadd lt!122074 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2486 BitStream!2486) Bool)

(assert (=> b!76045 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!122075 () Unit!5012)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2486) Unit!5012)

(assert (=> b!76045 (= lt!122075 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76045 (= lt!122074 (bitIndex!0 (size!1456 (buf!1837 thiss!1379)) (currentByte!3628 thiss!1379) (currentBit!3623 thiss!1379)))))

(declare-fun b!76046 () Bool)

(declare-fun res!62876 () Bool)

(assert (=> b!76046 (=> res!62876 e!49824)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76046 (= res!62876 (not (invariant!0 (currentBit!3623 thiss!1379) (currentByte!3628 thiss!1379) (size!1456 (buf!1837 thiss!1379)))))))

(declare-fun b!76047 () Bool)

(declare-fun res!62878 () Bool)

(assert (=> b!76047 (=> (not res!62878) (not e!49819))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76047 (= res!62878 (validate_offset_bits!1 ((_ sign_extend 32) (size!1456 (buf!1837 thiss!1379))) ((_ sign_extend 32) (currentByte!3628 thiss!1379)) ((_ sign_extend 32) (currentBit!3623 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14758 res!62877) b!76047))

(assert (= (and b!76047 res!62878) b!76045))

(assert (= (and b!76045 (not res!62874)) b!76046))

(assert (= (and b!76046 (not res!62876)) b!76042))

(assert (= (and b!76042 (not res!62875)) b!76043))

(assert (= start!14758 b!76044))

(declare-fun m!121209 () Bool)

(assert (=> b!76043 m!121209))

(declare-fun m!121211 () Bool)

(assert (=> b!76043 m!121211))

(declare-fun m!121213 () Bool)

(assert (=> b!76043 m!121213))

(declare-fun m!121215 () Bool)

(assert (=> b!76045 m!121215))

(declare-fun m!121217 () Bool)

(assert (=> b!76045 m!121217))

(declare-fun m!121219 () Bool)

(assert (=> b!76045 m!121219))

(declare-fun m!121221 () Bool)

(assert (=> b!76046 m!121221))

(declare-fun m!121223 () Bool)

(assert (=> b!76044 m!121223))

(declare-fun m!121225 () Bool)

(assert (=> start!14758 m!121225))

(declare-fun m!121227 () Bool)

(assert (=> start!14758 m!121227))

(declare-fun m!121229 () Bool)

(assert (=> b!76047 m!121229))

(declare-fun m!121231 () Bool)

(assert (=> b!76042 m!121231))

(declare-fun m!121233 () Bool)

(assert (=> b!76042 m!121233))

(push 1)

(assert (not b!76046))

(assert (not b!76043))

(assert (not b!76047))

(assert (not b!76042))

(assert (not start!14758))

(assert (not b!76045))

(assert (not b!76044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

