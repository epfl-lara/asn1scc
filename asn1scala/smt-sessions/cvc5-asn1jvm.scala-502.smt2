; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14772 () Bool)

(assert start!14772)

(declare-fun res!62979 () Bool)

(declare-fun e!49946 () Bool)

(assert (=> start!14772 (=> (not res!62979) (not e!49946))))

(declare-datatypes ((array!3139 0))(
  ( (array!3140 (arr!2061 (Array (_ BitVec 32) (_ BitVec 8))) (size!1463 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3139)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14772 (= res!62979 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1463 srcBuffer!2))))))))

(assert (=> start!14772 e!49946))

(assert (=> start!14772 true))

(declare-fun array_inv!1309 (array!3139) Bool)

(assert (=> start!14772 (array_inv!1309 srcBuffer!2)))

(declare-datatypes ((BitStream!2500 0))(
  ( (BitStream!2501 (buf!1844 array!3139) (currentByte!3635 (_ BitVec 32)) (currentBit!3630 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2500)

(declare-fun e!49950 () Bool)

(declare-fun inv!12 (BitStream!2500) Bool)

(assert (=> start!14772 (and (inv!12 thiss!1379) e!49950)))

(declare-fun b!76168 () Bool)

(declare-fun e!49947 () Bool)

(assert (=> b!76168 (= e!49947 true)))

(declare-datatypes ((tuple2!6610 0))(
  ( (tuple2!6611 (_1!3436 array!3139) (_2!3436 BitStream!2500)) )
))
(declare-fun lt!122139 () tuple2!6610)

(declare-fun checkByteArrayBitContent!0 (BitStream!2500 array!3139 array!3139 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76168 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3436 lt!122139) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76169 () Bool)

(declare-fun e!49948 () Bool)

(assert (=> b!76169 (= e!49946 (not e!49948))))

(declare-fun res!62980 () Bool)

(assert (=> b!76169 (=> res!62980 e!49948)))

(declare-fun lt!122138 () (_ BitVec 64))

(assert (=> b!76169 (= res!62980 (or (bvslt i!635 to!314) (not (= lt!122138 (bvsub (bvadd lt!122138 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2500 BitStream!2500) Bool)

(assert (=> b!76169 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5026 0))(
  ( (Unit!5027) )
))
(declare-fun lt!122137 () Unit!5026)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2500) Unit!5026)

(assert (=> b!76169 (= lt!122137 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76169 (= lt!122138 (bitIndex!0 (size!1463 (buf!1844 thiss!1379)) (currentByte!3635 thiss!1379) (currentBit!3630 thiss!1379)))))

(declare-fun b!76170 () Bool)

(declare-fun res!62981 () Bool)

(assert (=> b!76170 (=> (not res!62981) (not e!49946))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76170 (= res!62981 (validate_offset_bits!1 ((_ sign_extend 32) (size!1463 (buf!1844 thiss!1379))) ((_ sign_extend 32) (currentByte!3635 thiss!1379)) ((_ sign_extend 32) (currentBit!3630 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76171 () Bool)

(assert (=> b!76171 (= e!49948 e!49947)))

(declare-fun res!62983 () Bool)

(assert (=> b!76171 (=> res!62983 e!49947)))

(assert (=> b!76171 (= res!62983 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2500 (_ BitVec 64)) tuple2!6610)

(declare-datatypes ((tuple2!6612 0))(
  ( (tuple2!6613 (_1!3437 BitStream!2500) (_2!3437 BitStream!2500)) )
))
(declare-fun reader!0 (BitStream!2500 BitStream!2500) tuple2!6612)

(assert (=> b!76171 (= lt!122139 (readBits!0 (_1!3437 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76172 () Bool)

(declare-fun res!62982 () Bool)

(assert (=> b!76172 (=> res!62982 e!49948)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76172 (= res!62982 (not (invariant!0 (currentBit!3630 thiss!1379) (currentByte!3635 thiss!1379) (size!1463 (buf!1844 thiss!1379)))))))

(declare-fun b!76173 () Bool)

(assert (=> b!76173 (= e!49950 (array_inv!1309 (buf!1844 thiss!1379)))))

(assert (= (and start!14772 res!62979) b!76170))

(assert (= (and b!76170 res!62981) b!76169))

(assert (= (and b!76169 (not res!62980)) b!76172))

(assert (= (and b!76172 (not res!62982)) b!76171))

(assert (= (and b!76171 (not res!62983)) b!76168))

(assert (= start!14772 b!76173))

(declare-fun m!121367 () Bool)

(assert (=> start!14772 m!121367))

(declare-fun m!121369 () Bool)

(assert (=> start!14772 m!121369))

(declare-fun m!121371 () Bool)

(assert (=> b!76173 m!121371))

(declare-fun m!121373 () Bool)

(assert (=> b!76172 m!121373))

(declare-fun m!121375 () Bool)

(assert (=> b!76171 m!121375))

(declare-fun m!121377 () Bool)

(assert (=> b!76171 m!121377))

(declare-fun m!121379 () Bool)

(assert (=> b!76168 m!121379))

(declare-fun m!121381 () Bool)

(assert (=> b!76170 m!121381))

(declare-fun m!121383 () Bool)

(assert (=> b!76169 m!121383))

(declare-fun m!121385 () Bool)

(assert (=> b!76169 m!121385))

(declare-fun m!121387 () Bool)

(assert (=> b!76169 m!121387))

(push 1)

(assert (not start!14772))

(assert (not b!76171))

(assert (not b!76168))

(assert (not b!76173))

(assert (not b!76172))

(assert (not b!76169))

(assert (not b!76170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

