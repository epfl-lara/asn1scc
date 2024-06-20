; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14742 () Bool)

(assert start!14742)

(declare-fun b!75898 () Bool)

(declare-fun res!62755 () Bool)

(declare-fun e!49680 () Bool)

(assert (=> b!75898 (=> res!62755 e!49680)))

(declare-datatypes ((array!3109 0))(
  ( (array!3110 (arr!2046 (Array (_ BitVec 32) (_ BitVec 8))) (size!1448 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2470 0))(
  ( (BitStream!2471 (buf!1829 array!3109) (currentByte!3620 (_ BitVec 32)) (currentBit!3615 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2470)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75898 (= res!62755 (not (invariant!0 (currentBit!3615 thiss!1379) (currentByte!3620 thiss!1379) (size!1448 (buf!1829 thiss!1379)))))))

(declare-fun b!75899 () Bool)

(declare-fun e!49675 () Bool)

(assert (=> b!75899 (= e!49675 (not e!49680))))

(declare-fun res!62757 () Bool)

(assert (=> b!75899 (=> res!62757 e!49680)))

(declare-fun lt!121968 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!75899 (= res!62757 (or (bvslt i!635 to!314) (not (= lt!121968 (bvsub (bvadd lt!121968 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2470 BitStream!2470) Bool)

(assert (=> b!75899 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4996 0))(
  ( (Unit!4997) )
))
(declare-fun lt!121967 () Unit!4996)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2470) Unit!4996)

(assert (=> b!75899 (= lt!121967 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75899 (= lt!121968 (bitIndex!0 (size!1448 (buf!1829 thiss!1379)) (currentByte!3620 thiss!1379) (currentBit!3615 thiss!1379)))))

(declare-fun b!75900 () Bool)

(declare-fun res!62754 () Bool)

(assert (=> b!75900 (=> (not res!62754) (not e!49675))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75900 (= res!62754 (validate_offset_bits!1 ((_ sign_extend 32) (size!1448 (buf!1829 thiss!1379))) ((_ sign_extend 32) (currentByte!3620 thiss!1379)) ((_ sign_extend 32) (currentBit!3615 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75901 () Bool)

(declare-fun e!49678 () Bool)

(declare-fun array_inv!1294 (array!3109) Bool)

(assert (=> b!75901 (= e!49678 (array_inv!1294 (buf!1829 thiss!1379)))))

(declare-fun res!62756 () Bool)

(assert (=> start!14742 (=> (not res!62756) (not e!49675))))

(declare-fun srcBuffer!2 () array!3109)

(assert (=> start!14742 (= res!62756 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1448 srcBuffer!2))))))))

(assert (=> start!14742 e!49675))

(assert (=> start!14742 true))

(assert (=> start!14742 (array_inv!1294 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2470) Bool)

(assert (=> start!14742 (and (inv!12 thiss!1379) e!49678)))

(declare-fun b!75902 () Bool)

(declare-fun e!49679 () Bool)

(assert (=> b!75902 (= e!49680 e!49679)))

(declare-fun res!62758 () Bool)

(assert (=> b!75902 (=> res!62758 e!49679)))

(assert (=> b!75902 (= res!62758 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6550 0))(
  ( (tuple2!6551 (_1!3406 array!3109) (_2!3406 BitStream!2470)) )
))
(declare-fun lt!121966 () tuple2!6550)

(declare-fun readBits!0 (BitStream!2470 (_ BitVec 64)) tuple2!6550)

(declare-datatypes ((tuple2!6552 0))(
  ( (tuple2!6553 (_1!3407 BitStream!2470) (_2!3407 BitStream!2470)) )
))
(declare-fun reader!0 (BitStream!2470 BitStream!2470) tuple2!6552)

(assert (=> b!75902 (= lt!121966 (readBits!0 (_1!3407 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75903 () Bool)

(assert (=> b!75903 (= e!49679 true)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2470 array!3109 array!3109 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75903 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3406 lt!121966) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!14742 res!62756) b!75900))

(assert (= (and b!75900 res!62754) b!75899))

(assert (= (and b!75899 (not res!62757)) b!75898))

(assert (= (and b!75898 (not res!62755)) b!75902))

(assert (= (and b!75902 (not res!62758)) b!75903))

(assert (= start!14742 b!75901))

(declare-fun m!121019 () Bool)

(assert (=> start!14742 m!121019))

(declare-fun m!121021 () Bool)

(assert (=> start!14742 m!121021))

(declare-fun m!121023 () Bool)

(assert (=> b!75898 m!121023))

(declare-fun m!121025 () Bool)

(assert (=> b!75902 m!121025))

(declare-fun m!121027 () Bool)

(assert (=> b!75902 m!121027))

(declare-fun m!121029 () Bool)

(assert (=> b!75900 m!121029))

(declare-fun m!121031 () Bool)

(assert (=> b!75901 m!121031))

(declare-fun m!121033 () Bool)

(assert (=> b!75899 m!121033))

(declare-fun m!121035 () Bool)

(assert (=> b!75899 m!121035))

(declare-fun m!121037 () Bool)

(assert (=> b!75899 m!121037))

(declare-fun m!121039 () Bool)

(assert (=> b!75903 m!121039))

(push 1)

(assert (not b!75900))

(assert (not b!75901))

(assert (not b!75899))

(assert (not b!75898))

(assert (not b!75903))

(assert (not b!75902))

(assert (not start!14742))

(check-sat)

(pop 1)

