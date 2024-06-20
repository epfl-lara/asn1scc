; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14732 () Bool)

(assert start!14732)

(declare-fun b!75808 () Bool)

(declare-fun e!49590 () Bool)

(declare-fun e!49587 () Bool)

(assert (=> b!75808 (= e!49590 e!49587)))

(declare-fun res!62679 () Bool)

(assert (=> b!75808 (=> res!62679 e!49587)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!75808 (= res!62679 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!3099 0))(
  ( (array!3100 (arr!2041 (Array (_ BitVec 32) (_ BitVec 8))) (size!1443 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2460 0))(
  ( (BitStream!2461 (buf!1824 array!3099) (currentByte!3615 (_ BitVec 32)) (currentBit!3610 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2460)

(declare-datatypes ((tuple2!6530 0))(
  ( (tuple2!6531 (_1!3396 array!3099) (_2!3396 BitStream!2460)) )
))
(declare-fun lt!121922 () tuple2!6530)

(declare-fun readBits!0 (BitStream!2460 (_ BitVec 64)) tuple2!6530)

(declare-datatypes ((tuple2!6532 0))(
  ( (tuple2!6533 (_1!3397 BitStream!2460) (_2!3397 BitStream!2460)) )
))
(declare-fun reader!0 (BitStream!2460 BitStream!2460) tuple2!6532)

(assert (=> b!75808 (= lt!121922 (readBits!0 (_1!3397 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75809 () Bool)

(declare-fun e!49586 () Bool)

(assert (=> b!75809 (= e!49586 (not e!49590))))

(declare-fun res!62682 () Bool)

(assert (=> b!75809 (=> res!62682 e!49590)))

(declare-fun lt!121921 () (_ BitVec 64))

(assert (=> b!75809 (= res!62682 (or (bvslt i!635 to!314) (not (= lt!121921 (bvsub (bvadd lt!121921 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2460 BitStream!2460) Bool)

(assert (=> b!75809 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4986 0))(
  ( (Unit!4987) )
))
(declare-fun lt!121923 () Unit!4986)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2460) Unit!4986)

(assert (=> b!75809 (= lt!121923 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75809 (= lt!121921 (bitIndex!0 (size!1443 (buf!1824 thiss!1379)) (currentByte!3615 thiss!1379) (currentBit!3610 thiss!1379)))))

(declare-fun b!75810 () Bool)

(declare-fun res!62683 () Bool)

(assert (=> b!75810 (=> (not res!62683) (not e!49586))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75810 (= res!62683 (validate_offset_bits!1 ((_ sign_extend 32) (size!1443 (buf!1824 thiss!1379))) ((_ sign_extend 32) (currentByte!3615 thiss!1379)) ((_ sign_extend 32) (currentBit!3610 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75811 () Bool)

(assert (=> b!75811 (= e!49587 true)))

(declare-fun srcBuffer!2 () array!3099)

(declare-fun checkByteArrayBitContent!0 (BitStream!2460 array!3099 array!3099 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75811 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3396 lt!121922) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75813 () Bool)

(declare-fun res!62680 () Bool)

(assert (=> b!75813 (=> res!62680 e!49590)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75813 (= res!62680 (not (invariant!0 (currentBit!3610 thiss!1379) (currentByte!3615 thiss!1379) (size!1443 (buf!1824 thiss!1379)))))))

(declare-fun res!62681 () Bool)

(assert (=> start!14732 (=> (not res!62681) (not e!49586))))

(assert (=> start!14732 (= res!62681 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1443 srcBuffer!2))))))))

(assert (=> start!14732 e!49586))

(assert (=> start!14732 true))

(declare-fun array_inv!1289 (array!3099) Bool)

(assert (=> start!14732 (array_inv!1289 srcBuffer!2)))

(declare-fun e!49585 () Bool)

(declare-fun inv!12 (BitStream!2460) Bool)

(assert (=> start!14732 (and (inv!12 thiss!1379) e!49585)))

(declare-fun b!75812 () Bool)

(assert (=> b!75812 (= e!49585 (array_inv!1289 (buf!1824 thiss!1379)))))

(assert (= (and start!14732 res!62681) b!75810))

(assert (= (and b!75810 res!62683) b!75809))

(assert (= (and b!75809 (not res!62682)) b!75813))

(assert (= (and b!75813 (not res!62680)) b!75808))

(assert (= (and b!75808 (not res!62679)) b!75811))

(assert (= start!14732 b!75812))

(declare-fun m!120909 () Bool)

(assert (=> b!75810 m!120909))

(declare-fun m!120911 () Bool)

(assert (=> b!75809 m!120911))

(declare-fun m!120913 () Bool)

(assert (=> b!75809 m!120913))

(declare-fun m!120915 () Bool)

(assert (=> b!75809 m!120915))

(declare-fun m!120917 () Bool)

(assert (=> b!75808 m!120917))

(declare-fun m!120919 () Bool)

(assert (=> b!75808 m!120919))

(declare-fun m!120921 () Bool)

(assert (=> start!14732 m!120921))

(declare-fun m!120923 () Bool)

(assert (=> start!14732 m!120923))

(declare-fun m!120925 () Bool)

(assert (=> b!75813 m!120925))

(declare-fun m!120927 () Bool)

(assert (=> b!75811 m!120927))

(declare-fun m!120929 () Bool)

(assert (=> b!75812 m!120929))

(check-sat (not b!75810) (not b!75809) (not b!75808) (not b!75811) (not b!75812) (not start!14732) (not b!75813))
