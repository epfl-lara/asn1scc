; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14752 () Bool)

(assert start!14752)

(declare-fun b!75988 () Bool)

(declare-fun e!49770 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!75988 (= e!49770 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((array!3119 0))(
  ( (array!3120 (arr!2051 (Array (_ BitVec 32) (_ BitVec 8))) (size!1453 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2480 0))(
  ( (BitStream!2481 (buf!1834 array!3119) (currentByte!3625 (_ BitVec 32)) (currentBit!3620 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2480)

(declare-datatypes ((Unit!5006 0))(
  ( (Unit!5007) )
))
(declare-fun lt!122019 () Unit!5006)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2480 array!3119 (_ BitVec 64)) Unit!5006)

(assert (=> b!75988 (= lt!122019 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1834 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!3119)

(declare-datatypes ((tuple2!6570 0))(
  ( (tuple2!6571 (_1!3416 array!3119) (_2!3416 BitStream!2480)) )
))
(declare-fun lt!122021 () tuple2!6570)

(declare-fun checkByteArrayBitContent!0 (BitStream!2480 array!3119 array!3119 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75988 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3416 lt!122021) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75989 () Bool)

(declare-fun res!62829 () Bool)

(declare-fun e!49769 () Bool)

(assert (=> b!75989 (=> res!62829 e!49769)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75989 (= res!62829 (not (invariant!0 (currentBit!3620 thiss!1379) (currentByte!3625 thiss!1379) (size!1453 (buf!1834 thiss!1379)))))))

(declare-fun b!75990 () Bool)

(declare-fun e!49765 () Bool)

(declare-fun array_inv!1299 (array!3119) Bool)

(assert (=> b!75990 (= e!49765 (array_inv!1299 (buf!1834 thiss!1379)))))

(declare-fun b!75991 () Bool)

(declare-fun e!49768 () Bool)

(assert (=> b!75991 (= e!49768 (not e!49769))))

(declare-fun res!62833 () Bool)

(assert (=> b!75991 (=> res!62833 e!49769)))

(declare-fun lt!122022 () (_ BitVec 64))

(assert (=> b!75991 (= res!62833 (or (bvslt i!635 to!314) (not (= lt!122022 (bvsub (bvadd lt!122022 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2480 BitStream!2480) Bool)

(assert (=> b!75991 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!122020 () Unit!5006)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2480) Unit!5006)

(assert (=> b!75991 (= lt!122020 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75991 (= lt!122022 (bitIndex!0 (size!1453 (buf!1834 thiss!1379)) (currentByte!3625 thiss!1379) (currentBit!3620 thiss!1379)))))

(declare-fun b!75992 () Bool)

(assert (=> b!75992 (= e!49769 e!49770)))

(declare-fun res!62831 () Bool)

(assert (=> b!75992 (=> res!62831 e!49770)))

(assert (=> b!75992 (= res!62831 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2480 (_ BitVec 64)) tuple2!6570)

(declare-datatypes ((tuple2!6572 0))(
  ( (tuple2!6573 (_1!3417 BitStream!2480) (_2!3417 BitStream!2480)) )
))
(declare-fun reader!0 (BitStream!2480 BitStream!2480) tuple2!6572)

(assert (=> b!75992 (= lt!122021 (readBits!0 (_1!3417 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75993 () Bool)

(declare-fun res!62830 () Bool)

(assert (=> b!75993 (=> (not res!62830) (not e!49768))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75993 (= res!62830 (validate_offset_bits!1 ((_ sign_extend 32) (size!1453 (buf!1834 thiss!1379))) ((_ sign_extend 32) (currentByte!3625 thiss!1379)) ((_ sign_extend 32) (currentBit!3620 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!62832 () Bool)

(assert (=> start!14752 (=> (not res!62832) (not e!49768))))

(assert (=> start!14752 (= res!62832 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1453 srcBuffer!2))))))))

(assert (=> start!14752 e!49768))

(assert (=> start!14752 true))

(assert (=> start!14752 (array_inv!1299 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2480) Bool)

(assert (=> start!14752 (and (inv!12 thiss!1379) e!49765)))

(assert (= (and start!14752 res!62832) b!75993))

(assert (= (and b!75993 res!62830) b!75991))

(assert (= (and b!75991 (not res!62833)) b!75989))

(assert (= (and b!75989 (not res!62829)) b!75992))

(assert (= (and b!75992 (not res!62831)) b!75988))

(assert (= start!14752 b!75990))

(declare-fun m!121133 () Bool)

(assert (=> b!75990 m!121133))

(declare-fun m!121135 () Bool)

(assert (=> start!14752 m!121135))

(declare-fun m!121137 () Bool)

(assert (=> start!14752 m!121137))

(declare-fun m!121139 () Bool)

(assert (=> b!75993 m!121139))

(declare-fun m!121141 () Bool)

(assert (=> b!75992 m!121141))

(declare-fun m!121143 () Bool)

(assert (=> b!75992 m!121143))

(declare-fun m!121145 () Bool)

(assert (=> b!75991 m!121145))

(declare-fun m!121147 () Bool)

(assert (=> b!75991 m!121147))

(declare-fun m!121149 () Bool)

(assert (=> b!75991 m!121149))

(declare-fun m!121151 () Bool)

(assert (=> b!75988 m!121151))

(declare-fun m!121153 () Bool)

(assert (=> b!75988 m!121153))

(declare-fun m!121155 () Bool)

(assert (=> b!75989 m!121155))

(push 1)

(assert (not b!75991))

(assert (not b!75993))

(assert (not b!75988))

(assert (not b!75990))

(assert (not b!75989))

(assert (not b!75992))

(assert (not start!14752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

