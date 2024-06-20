; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14746 () Bool)

(assert start!14746)

(declare-fun b!75934 () Bool)

(declare-fun e!49713 () Bool)

(declare-fun e!49714 () Bool)

(assert (=> b!75934 (= e!49713 (not e!49714))))

(declare-fun res!62784 () Bool)

(assert (=> b!75934 (=> res!62784 e!49714)))

(declare-fun lt!121985 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!75934 (= res!62784 (or (bvslt i!635 to!314) (not (= lt!121985 (bvsub (bvadd lt!121985 to!314) i!635)))))))

(declare-datatypes ((array!3113 0))(
  ( (array!3114 (arr!2048 (Array (_ BitVec 32) (_ BitVec 8))) (size!1450 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2474 0))(
  ( (BitStream!2475 (buf!1831 array!3113) (currentByte!3622 (_ BitVec 32)) (currentBit!3617 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2474)

(declare-fun isPrefixOf!0 (BitStream!2474 BitStream!2474) Bool)

(assert (=> b!75934 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5000 0))(
  ( (Unit!5001) )
))
(declare-fun lt!121984 () Unit!5000)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2474) Unit!5000)

(assert (=> b!75934 (= lt!121984 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75934 (= lt!121985 (bitIndex!0 (size!1450 (buf!1831 thiss!1379)) (currentByte!3622 thiss!1379) (currentBit!3617 thiss!1379)))))

(declare-fun res!62785 () Bool)

(assert (=> start!14746 (=> (not res!62785) (not e!49713))))

(declare-fun srcBuffer!2 () array!3113)

(assert (=> start!14746 (= res!62785 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1450 srcBuffer!2))))))))

(assert (=> start!14746 e!49713))

(assert (=> start!14746 true))

(declare-fun array_inv!1296 (array!3113) Bool)

(assert (=> start!14746 (array_inv!1296 srcBuffer!2)))

(declare-fun e!49711 () Bool)

(declare-fun inv!12 (BitStream!2474) Bool)

(assert (=> start!14746 (and (inv!12 thiss!1379) e!49711)))

(declare-fun b!75935 () Bool)

(declare-fun res!62787 () Bool)

(assert (=> b!75935 (=> res!62787 e!49714)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75935 (= res!62787 (not (invariant!0 (currentBit!3617 thiss!1379) (currentByte!3622 thiss!1379) (size!1450 (buf!1831 thiss!1379)))))))

(declare-fun b!75936 () Bool)

(declare-fun res!62786 () Bool)

(assert (=> b!75936 (=> (not res!62786) (not e!49713))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75936 (= res!62786 (validate_offset_bits!1 ((_ sign_extend 32) (size!1450 (buf!1831 thiss!1379))) ((_ sign_extend 32) (currentByte!3622 thiss!1379)) ((_ sign_extend 32) (currentBit!3617 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75937 () Bool)

(declare-fun e!49715 () Bool)

(assert (=> b!75937 (= e!49714 e!49715)))

(declare-fun res!62788 () Bool)

(assert (=> b!75937 (=> res!62788 e!49715)))

(assert (=> b!75937 (= res!62788 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6558 0))(
  ( (tuple2!6559 (_1!3410 array!3113) (_2!3410 BitStream!2474)) )
))
(declare-fun lt!121986 () tuple2!6558)

(declare-fun readBits!0 (BitStream!2474 (_ BitVec 64)) tuple2!6558)

(declare-datatypes ((tuple2!6560 0))(
  ( (tuple2!6561 (_1!3411 BitStream!2474) (_2!3411 BitStream!2474)) )
))
(declare-fun reader!0 (BitStream!2474 BitStream!2474) tuple2!6560)

(assert (=> b!75937 (= lt!121986 (readBits!0 (_1!3411 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75938 () Bool)

(assert (=> b!75938 (= e!49715 true)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2474 array!3113 array!3113 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75938 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3410 lt!121986) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75939 () Bool)

(assert (=> b!75939 (= e!49711 (array_inv!1296 (buf!1831 thiss!1379)))))

(assert (= (and start!14746 res!62785) b!75936))

(assert (= (and b!75936 res!62786) b!75934))

(assert (= (and b!75934 (not res!62784)) b!75935))

(assert (= (and b!75935 (not res!62787)) b!75937))

(assert (= (and b!75937 (not res!62788)) b!75938))

(assert (= start!14746 b!75939))

(declare-fun m!121063 () Bool)

(assert (=> start!14746 m!121063))

(declare-fun m!121065 () Bool)

(assert (=> start!14746 m!121065))

(declare-fun m!121067 () Bool)

(assert (=> b!75939 m!121067))

(declare-fun m!121069 () Bool)

(assert (=> b!75938 m!121069))

(declare-fun m!121071 () Bool)

(assert (=> b!75935 m!121071))

(declare-fun m!121073 () Bool)

(assert (=> b!75937 m!121073))

(declare-fun m!121075 () Bool)

(assert (=> b!75937 m!121075))

(declare-fun m!121077 () Bool)

(assert (=> b!75934 m!121077))

(declare-fun m!121079 () Bool)

(assert (=> b!75934 m!121079))

(declare-fun m!121081 () Bool)

(assert (=> b!75934 m!121081))

(declare-fun m!121083 () Bool)

(assert (=> b!75936 m!121083))

(push 1)

(assert (not b!75938))

(assert (not b!75937))

(assert (not b!75935))

(assert (not b!75936))

(assert (not b!75939))

(assert (not start!14746))

(assert (not b!75934))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

