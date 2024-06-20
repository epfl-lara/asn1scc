; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14776 () Bool)

(assert start!14776)

(declare-fun b!76204 () Bool)

(declare-fun e!49984 () Bool)

(declare-fun e!49986 () Bool)

(assert (=> b!76204 (= e!49984 (not e!49986))))

(declare-fun res!63012 () Bool)

(assert (=> b!76204 (=> res!63012 e!49986)))

(declare-fun lt!122155 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!76204 (= res!63012 (or (bvslt i!635 to!314) (not (= lt!122155 (bvsub (bvadd lt!122155 to!314) i!635)))))))

(declare-datatypes ((array!3143 0))(
  ( (array!3144 (arr!2063 (Array (_ BitVec 32) (_ BitVec 8))) (size!1465 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2504 0))(
  ( (BitStream!2505 (buf!1846 array!3143) (currentByte!3637 (_ BitVec 32)) (currentBit!3632 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2504)

(declare-fun isPrefixOf!0 (BitStream!2504 BitStream!2504) Bool)

(assert (=> b!76204 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5030 0))(
  ( (Unit!5031) )
))
(declare-fun lt!122156 () Unit!5030)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2504) Unit!5030)

(assert (=> b!76204 (= lt!122156 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76204 (= lt!122155 (bitIndex!0 (size!1465 (buf!1846 thiss!1379)) (currentByte!3637 thiss!1379) (currentBit!3632 thiss!1379)))))

(declare-fun b!76205 () Bool)

(declare-fun e!49985 () Bool)

(assert (=> b!76205 (= e!49986 e!49985)))

(declare-fun res!63011 () Bool)

(assert (=> b!76205 (=> res!63011 e!49985)))

(assert (=> b!76205 (= res!63011 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6618 0))(
  ( (tuple2!6619 (_1!3440 array!3143) (_2!3440 BitStream!2504)) )
))
(declare-fun lt!122157 () tuple2!6618)

(declare-fun readBits!0 (BitStream!2504 (_ BitVec 64)) tuple2!6618)

(declare-datatypes ((tuple2!6620 0))(
  ( (tuple2!6621 (_1!3441 BitStream!2504) (_2!3441 BitStream!2504)) )
))
(declare-fun reader!0 (BitStream!2504 BitStream!2504) tuple2!6620)

(assert (=> b!76205 (= lt!122157 (readBits!0 (_1!3441 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76206 () Bool)

(assert (=> b!76206 (= e!49985 true)))

(declare-fun srcBuffer!2 () array!3143)

(declare-fun checkByteArrayBitContent!0 (BitStream!2504 array!3143 array!3143 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76206 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3440 lt!122157) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun res!63013 () Bool)

(assert (=> start!14776 (=> (not res!63013) (not e!49984))))

(assert (=> start!14776 (= res!63013 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1465 srcBuffer!2))))))))

(assert (=> start!14776 e!49984))

(assert (=> start!14776 true))

(declare-fun array_inv!1311 (array!3143) Bool)

(assert (=> start!14776 (array_inv!1311 srcBuffer!2)))

(declare-fun e!49983 () Bool)

(declare-fun inv!12 (BitStream!2504) Bool)

(assert (=> start!14776 (and (inv!12 thiss!1379) e!49983)))

(declare-fun b!76207 () Bool)

(declare-fun res!63009 () Bool)

(assert (=> b!76207 (=> (not res!63009) (not e!49984))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76207 (= res!63009 (validate_offset_bits!1 ((_ sign_extend 32) (size!1465 (buf!1846 thiss!1379))) ((_ sign_extend 32) (currentByte!3637 thiss!1379)) ((_ sign_extend 32) (currentBit!3632 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76208 () Bool)

(assert (=> b!76208 (= e!49983 (array_inv!1311 (buf!1846 thiss!1379)))))

(declare-fun b!76209 () Bool)

(declare-fun res!63010 () Bool)

(assert (=> b!76209 (=> res!63010 e!49986)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76209 (= res!63010 (not (invariant!0 (currentBit!3632 thiss!1379) (currentByte!3637 thiss!1379) (size!1465 (buf!1846 thiss!1379)))))))

(assert (= (and start!14776 res!63013) b!76207))

(assert (= (and b!76207 res!63009) b!76204))

(assert (= (and b!76204 (not res!63012)) b!76209))

(assert (= (and b!76209 (not res!63010)) b!76205))

(assert (= (and b!76205 (not res!63011)) b!76206))

(assert (= start!14776 b!76208))

(declare-fun m!121411 () Bool)

(assert (=> b!76205 m!121411))

(declare-fun m!121413 () Bool)

(assert (=> b!76205 m!121413))

(declare-fun m!121415 () Bool)

(assert (=> b!76207 m!121415))

(declare-fun m!121417 () Bool)

(assert (=> start!14776 m!121417))

(declare-fun m!121419 () Bool)

(assert (=> start!14776 m!121419))

(declare-fun m!121421 () Bool)

(assert (=> b!76204 m!121421))

(declare-fun m!121423 () Bool)

(assert (=> b!76204 m!121423))

(declare-fun m!121425 () Bool)

(assert (=> b!76204 m!121425))

(declare-fun m!121427 () Bool)

(assert (=> b!76208 m!121427))

(declare-fun m!121429 () Bool)

(assert (=> b!76206 m!121429))

(declare-fun m!121431 () Bool)

(assert (=> b!76209 m!121431))

(push 1)

(assert (not b!76205))

(assert (not b!76204))

(assert (not b!76207))

(assert (not b!76208))

(assert (not start!14776))

(assert (not b!76209))

(assert (not b!76206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

