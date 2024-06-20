; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14756 () Bool)

(assert start!14756)

(declare-fun b!76025 () Bool)

(declare-fun e!49806 () Bool)

(declare-datatypes ((array!3123 0))(
  ( (array!3124 (arr!2053 (Array (_ BitVec 32) (_ BitVec 8))) (size!1455 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2484 0))(
  ( (BitStream!2485 (buf!1836 array!3123) (currentByte!3627 (_ BitVec 32)) (currentBit!3622 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2484)

(declare-fun array_inv!1301 (array!3123) Bool)

(assert (=> b!76025 (= e!49806 (array_inv!1301 (buf!1836 thiss!1379)))))

(declare-fun b!76026 () Bool)

(declare-fun res!62860 () Bool)

(declare-fun e!49803 () Bool)

(assert (=> b!76026 (=> res!62860 e!49803)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76026 (= res!62860 (not (invariant!0 (currentBit!3622 thiss!1379) (currentByte!3627 thiss!1379) (size!1455 (buf!1836 thiss!1379)))))))

(declare-fun b!76027 () Bool)

(declare-fun e!49804 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!76027 (= e!49804 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((List!784 0))(
  ( (Nil!781) (Cons!780 (h!899 Bool) (t!1534 List!784)) )
))
(declare-fun lt!122057 () List!784)

(declare-datatypes ((tuple2!6578 0))(
  ( (tuple2!6579 (_1!3420 BitStream!2484) (_2!3420 BitStream!2484)) )
))
(declare-fun lt!122053 () tuple2!6578)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2484 BitStream!2484 (_ BitVec 64)) List!784)

(assert (=> b!76027 (= lt!122057 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!3420 lt!122053) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!5010 0))(
  ( (Unit!5011) )
))
(declare-fun lt!122055 () Unit!5010)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2484 array!3123 (_ BitVec 64)) Unit!5010)

(assert (=> b!76027 (= lt!122055 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1836 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!3123)

(declare-datatypes ((tuple2!6580 0))(
  ( (tuple2!6581 (_1!3421 array!3123) (_2!3421 BitStream!2484)) )
))
(declare-fun lt!122058 () tuple2!6580)

(declare-fun checkByteArrayBitContent!0 (BitStream!2484 array!3123 array!3123 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76027 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3421 lt!122058) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76028 () Bool)

(declare-fun e!49802 () Bool)

(assert (=> b!76028 (= e!49802 (not e!49803))))

(declare-fun res!62859 () Bool)

(assert (=> b!76028 (=> res!62859 e!49803)))

(declare-fun lt!122056 () (_ BitVec 64))

(assert (=> b!76028 (= res!62859 (or (bvslt i!635 to!314) (not (= lt!122056 (bvsub (bvadd lt!122056 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2484 BitStream!2484) Bool)

(assert (=> b!76028 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!122054 () Unit!5010)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2484) Unit!5010)

(assert (=> b!76028 (= lt!122054 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76028 (= lt!122056 (bitIndex!0 (size!1455 (buf!1836 thiss!1379)) (currentByte!3627 thiss!1379) (currentBit!3622 thiss!1379)))))

(declare-fun b!76029 () Bool)

(declare-fun res!62861 () Bool)

(assert (=> b!76029 (=> (not res!62861) (not e!49802))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76029 (= res!62861 (validate_offset_bits!1 ((_ sign_extend 32) (size!1455 (buf!1836 thiss!1379))) ((_ sign_extend 32) (currentByte!3627 thiss!1379)) ((_ sign_extend 32) (currentBit!3622 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76024 () Bool)

(assert (=> b!76024 (= e!49803 e!49804)))

(declare-fun res!62862 () Bool)

(assert (=> b!76024 (=> res!62862 e!49804)))

(assert (=> b!76024 (= res!62862 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2484 (_ BitVec 64)) tuple2!6580)

(assert (=> b!76024 (= lt!122058 (readBits!0 (_1!3420 lt!122053) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!2484 BitStream!2484) tuple2!6578)

(assert (=> b!76024 (= lt!122053 (reader!0 thiss!1379 thiss!1379))))

(declare-fun res!62863 () Bool)

(assert (=> start!14756 (=> (not res!62863) (not e!49802))))

(assert (=> start!14756 (= res!62863 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1455 srcBuffer!2))))))))

(assert (=> start!14756 e!49802))

(assert (=> start!14756 true))

(assert (=> start!14756 (array_inv!1301 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2484) Bool)

(assert (=> start!14756 (and (inv!12 thiss!1379) e!49806)))

(assert (= (and start!14756 res!62863) b!76029))

(assert (= (and b!76029 res!62861) b!76028))

(assert (= (and b!76028 (not res!62859)) b!76026))

(assert (= (and b!76026 (not res!62860)) b!76024))

(assert (= (and b!76024 (not res!62862)) b!76027))

(assert (= start!14756 b!76025))

(declare-fun m!121183 () Bool)

(assert (=> b!76024 m!121183))

(declare-fun m!121185 () Bool)

(assert (=> b!76024 m!121185))

(declare-fun m!121187 () Bool)

(assert (=> b!76025 m!121187))

(declare-fun m!121189 () Bool)

(assert (=> b!76028 m!121189))

(declare-fun m!121191 () Bool)

(assert (=> b!76028 m!121191))

(declare-fun m!121193 () Bool)

(assert (=> b!76028 m!121193))

(declare-fun m!121195 () Bool)

(assert (=> b!76029 m!121195))

(declare-fun m!121197 () Bool)

(assert (=> b!76026 m!121197))

(declare-fun m!121199 () Bool)

(assert (=> start!14756 m!121199))

(declare-fun m!121201 () Bool)

(assert (=> start!14756 m!121201))

(declare-fun m!121203 () Bool)

(assert (=> b!76027 m!121203))

(declare-fun m!121205 () Bool)

(assert (=> b!76027 m!121205))

(declare-fun m!121207 () Bool)

(assert (=> b!76027 m!121207))

(check-sat (not b!76029) (not b!76025) (not b!76028) (not b!76024) (not start!14756) (not b!76027) (not b!76026))
