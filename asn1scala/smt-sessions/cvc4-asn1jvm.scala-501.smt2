; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14770 () Bool)

(assert start!14770)

(declare-fun b!76151 () Bool)

(declare-fun e!49931 () Bool)

(declare-datatypes ((array!3137 0))(
  ( (array!3138 (arr!2060 (Array (_ BitVec 32) (_ BitVec 8))) (size!1462 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2498 0))(
  ( (BitStream!2499 (buf!1843 array!3137) (currentByte!3634 (_ BitVec 32)) (currentBit!3629 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2498)

(declare-fun array_inv!1308 (array!3137) Bool)

(assert (=> b!76151 (= e!49931 (array_inv!1308 (buf!1843 thiss!1379)))))

(declare-fun b!76152 () Bool)

(declare-fun res!62967 () Bool)

(declare-fun e!49928 () Bool)

(assert (=> b!76152 (=> (not res!62967) (not e!49928))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76152 (= res!62967 (validate_offset_bits!1 ((_ sign_extend 32) (size!1462 (buf!1843 thiss!1379))) ((_ sign_extend 32) (currentByte!3634 thiss!1379)) ((_ sign_extend 32) (currentBit!3629 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76153 () Bool)

(declare-fun res!62964 () Bool)

(declare-fun e!49927 () Bool)

(assert (=> b!76153 (=> res!62964 e!49927)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76153 (= res!62964 (not (invariant!0 (currentBit!3629 thiss!1379) (currentByte!3634 thiss!1379) (size!1462 (buf!1843 thiss!1379)))))))

(declare-fun b!76154 () Bool)

(declare-fun e!49930 () Bool)

(assert (=> b!76154 (= e!49930 true)))

(declare-fun srcBuffer!2 () array!3137)

(declare-datatypes ((tuple2!6606 0))(
  ( (tuple2!6607 (_1!3434 array!3137) (_2!3434 BitStream!2498)) )
))
(declare-fun lt!122128 () tuple2!6606)

(declare-fun checkByteArrayBitContent!0 (BitStream!2498 array!3137 array!3137 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76154 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3434 lt!122128) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76155 () Bool)

(assert (=> b!76155 (= e!49928 (not e!49927))))

(declare-fun res!62965 () Bool)

(assert (=> b!76155 (=> res!62965 e!49927)))

(declare-fun lt!122129 () (_ BitVec 64))

(assert (=> b!76155 (= res!62965 (or (bvslt i!635 to!314) (not (= lt!122129 (bvsub (bvadd lt!122129 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2498 BitStream!2498) Bool)

(assert (=> b!76155 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5024 0))(
  ( (Unit!5025) )
))
(declare-fun lt!122130 () Unit!5024)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2498) Unit!5024)

(assert (=> b!76155 (= lt!122130 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76155 (= lt!122129 (bitIndex!0 (size!1462 (buf!1843 thiss!1379)) (currentByte!3634 thiss!1379) (currentBit!3629 thiss!1379)))))

(declare-fun res!62968 () Bool)

(assert (=> start!14770 (=> (not res!62968) (not e!49928))))

(assert (=> start!14770 (= res!62968 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1462 srcBuffer!2))))))))

(assert (=> start!14770 e!49928))

(assert (=> start!14770 true))

(assert (=> start!14770 (array_inv!1308 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2498) Bool)

(assert (=> start!14770 (and (inv!12 thiss!1379) e!49931)))

(declare-fun b!76150 () Bool)

(assert (=> b!76150 (= e!49927 e!49930)))

(declare-fun res!62966 () Bool)

(assert (=> b!76150 (=> res!62966 e!49930)))

(assert (=> b!76150 (= res!62966 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2498 (_ BitVec 64)) tuple2!6606)

(declare-datatypes ((tuple2!6608 0))(
  ( (tuple2!6609 (_1!3435 BitStream!2498) (_2!3435 BitStream!2498)) )
))
(declare-fun reader!0 (BitStream!2498 BitStream!2498) tuple2!6608)

(assert (=> b!76150 (= lt!122128 (readBits!0 (_1!3435 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14770 res!62968) b!76152))

(assert (= (and b!76152 res!62967) b!76155))

(assert (= (and b!76155 (not res!62965)) b!76153))

(assert (= (and b!76153 (not res!62964)) b!76150))

(assert (= (and b!76150 (not res!62966)) b!76154))

(assert (= start!14770 b!76151))

(declare-fun m!121345 () Bool)

(assert (=> b!76154 m!121345))

(declare-fun m!121347 () Bool)

(assert (=> start!14770 m!121347))

(declare-fun m!121349 () Bool)

(assert (=> start!14770 m!121349))

(declare-fun m!121351 () Bool)

(assert (=> b!76150 m!121351))

(declare-fun m!121353 () Bool)

(assert (=> b!76150 m!121353))

(declare-fun m!121355 () Bool)

(assert (=> b!76155 m!121355))

(declare-fun m!121357 () Bool)

(assert (=> b!76155 m!121357))

(declare-fun m!121359 () Bool)

(assert (=> b!76155 m!121359))

(declare-fun m!121361 () Bool)

(assert (=> b!76152 m!121361))

(declare-fun m!121363 () Bool)

(assert (=> b!76153 m!121363))

(declare-fun m!121365 () Bool)

(assert (=> b!76151 m!121365))

(push 1)

(assert (not b!76153))

(assert (not b!76151))

(assert (not b!76154))

(assert (not b!76152))

(assert (not b!76150))

