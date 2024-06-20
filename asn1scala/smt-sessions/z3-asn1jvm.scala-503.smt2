; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14780 () Bool)

(assert start!14780)

(declare-fun b!76240 () Bool)

(declare-fun e!50020 () Bool)

(declare-datatypes ((array!3147 0))(
  ( (array!3148 (arr!2065 (Array (_ BitVec 32) (_ BitVec 8))) (size!1467 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2508 0))(
  ( (BitStream!2509 (buf!1848 array!3147) (currentByte!3639 (_ BitVec 32)) (currentBit!3634 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2508)

(declare-fun array_inv!1313 (array!3147) Bool)

(assert (=> b!76240 (= e!50020 (array_inv!1313 (buf!1848 thiss!1379)))))

(declare-fun b!76241 () Bool)

(declare-fun e!50021 () Bool)

(declare-fun e!50017 () Bool)

(assert (=> b!76241 (= e!50021 (not e!50017))))

(declare-fun res!63042 () Bool)

(assert (=> b!76241 (=> res!63042 e!50017)))

(declare-fun lt!122175 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!76241 (= res!63042 (or (bvslt i!635 to!314) (not (= lt!122175 (bvsub (bvadd lt!122175 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2508 BitStream!2508) Bool)

(assert (=> b!76241 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5034 0))(
  ( (Unit!5035) )
))
(declare-fun lt!122174 () Unit!5034)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2508) Unit!5034)

(assert (=> b!76241 (= lt!122174 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76241 (= lt!122175 (bitIndex!0 (size!1467 (buf!1848 thiss!1379)) (currentByte!3639 thiss!1379) (currentBit!3634 thiss!1379)))))

(declare-fun res!63040 () Bool)

(assert (=> start!14780 (=> (not res!63040) (not e!50021))))

(declare-fun srcBuffer!2 () array!3147)

(assert (=> start!14780 (= res!63040 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1467 srcBuffer!2))))))))

(assert (=> start!14780 e!50021))

(assert (=> start!14780 true))

(assert (=> start!14780 (array_inv!1313 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2508) Bool)

(assert (=> start!14780 (and (inv!12 thiss!1379) e!50020)))

(declare-fun b!76242 () Bool)

(declare-fun e!50019 () Bool)

(assert (=> b!76242 (= e!50019 true)))

(declare-datatypes ((tuple2!6626 0))(
  ( (tuple2!6627 (_1!3444 array!3147) (_2!3444 BitStream!2508)) )
))
(declare-fun lt!122173 () tuple2!6626)

(declare-fun checkByteArrayBitContent!0 (BitStream!2508 array!3147 array!3147 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76242 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3444 lt!122173) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76243 () Bool)

(declare-fun res!63043 () Bool)

(assert (=> b!76243 (=> (not res!63043) (not e!50021))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76243 (= res!63043 (validate_offset_bits!1 ((_ sign_extend 32) (size!1467 (buf!1848 thiss!1379))) ((_ sign_extend 32) (currentByte!3639 thiss!1379)) ((_ sign_extend 32) (currentBit!3634 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76244 () Bool)

(declare-fun res!63039 () Bool)

(assert (=> b!76244 (=> res!63039 e!50017)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76244 (= res!63039 (not (invariant!0 (currentBit!3634 thiss!1379) (currentByte!3639 thiss!1379) (size!1467 (buf!1848 thiss!1379)))))))

(declare-fun b!76245 () Bool)

(assert (=> b!76245 (= e!50017 e!50019)))

(declare-fun res!63041 () Bool)

(assert (=> b!76245 (=> res!63041 e!50019)))

(assert (=> b!76245 (= res!63041 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2508 (_ BitVec 64)) tuple2!6626)

(declare-datatypes ((tuple2!6628 0))(
  ( (tuple2!6629 (_1!3445 BitStream!2508) (_2!3445 BitStream!2508)) )
))
(declare-fun reader!0 (BitStream!2508 BitStream!2508) tuple2!6628)

(assert (=> b!76245 (= lt!122173 (readBits!0 (_1!3445 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14780 res!63040) b!76243))

(assert (= (and b!76243 res!63043) b!76241))

(assert (= (and b!76241 (not res!63042)) b!76244))

(assert (= (and b!76244 (not res!63039)) b!76245))

(assert (= (and b!76245 (not res!63041)) b!76242))

(assert (= start!14780 b!76240))

(declare-fun m!121455 () Bool)

(assert (=> b!76242 m!121455))

(declare-fun m!121457 () Bool)

(assert (=> b!76244 m!121457))

(declare-fun m!121459 () Bool)

(assert (=> b!76240 m!121459))

(declare-fun m!121461 () Bool)

(assert (=> b!76241 m!121461))

(declare-fun m!121463 () Bool)

(assert (=> b!76241 m!121463))

(declare-fun m!121465 () Bool)

(assert (=> b!76241 m!121465))

(declare-fun m!121467 () Bool)

(assert (=> b!76245 m!121467))

(declare-fun m!121469 () Bool)

(assert (=> b!76245 m!121469))

(declare-fun m!121471 () Bool)

(assert (=> start!14780 m!121471))

(declare-fun m!121473 () Bool)

(assert (=> start!14780 m!121473))

(declare-fun m!121475 () Bool)

(assert (=> b!76243 m!121475))

(check-sat (not b!76242) (not b!76241) (not b!76245) (not start!14780) (not b!76243) (not b!76240) (not b!76244))
