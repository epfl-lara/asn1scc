; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14744 () Bool)

(assert start!14744)

(declare-fun b!75916 () Bool)

(declare-fun e!49698 () Bool)

(assert (=> b!75916 (= e!49698 true)))

(declare-datatypes ((array!3111 0))(
  ( (array!3112 (arr!2047 (Array (_ BitVec 32) (_ BitVec 8))) (size!1449 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3111)

(declare-datatypes ((BitStream!2472 0))(
  ( (BitStream!2473 (buf!1830 array!3111) (currentByte!3621 (_ BitVec 32)) (currentBit!3616 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2472)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!6554 0))(
  ( (tuple2!6555 (_1!3408 array!3111) (_2!3408 BitStream!2472)) )
))
(declare-fun lt!121975 () tuple2!6554)

(declare-fun checkByteArrayBitContent!0 (BitStream!2472 array!3111 array!3111 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75916 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3408 lt!121975) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75917 () Bool)

(declare-fun e!49694 () Bool)

(assert (=> b!75917 (= e!49694 e!49698)))

(declare-fun res!62773 () Bool)

(assert (=> b!75917 (=> res!62773 e!49698)))

(assert (=> b!75917 (= res!62773 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2472 (_ BitVec 64)) tuple2!6554)

(declare-datatypes ((tuple2!6556 0))(
  ( (tuple2!6557 (_1!3409 BitStream!2472) (_2!3409 BitStream!2472)) )
))
(declare-fun reader!0 (BitStream!2472 BitStream!2472) tuple2!6556)

(assert (=> b!75917 (= lt!121975 (readBits!0 (_1!3409 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!62771 () Bool)

(declare-fun e!49693 () Bool)

(assert (=> start!14744 (=> (not res!62771) (not e!49693))))

(assert (=> start!14744 (= res!62771 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1449 srcBuffer!2))))))))

(assert (=> start!14744 e!49693))

(assert (=> start!14744 true))

(declare-fun array_inv!1295 (array!3111) Bool)

(assert (=> start!14744 (array_inv!1295 srcBuffer!2)))

(declare-fun e!49697 () Bool)

(declare-fun inv!12 (BitStream!2472) Bool)

(assert (=> start!14744 (and (inv!12 thiss!1379) e!49697)))

(declare-fun b!75918 () Bool)

(declare-fun res!62769 () Bool)

(assert (=> b!75918 (=> (not res!62769) (not e!49693))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75918 (= res!62769 (validate_offset_bits!1 ((_ sign_extend 32) (size!1449 (buf!1830 thiss!1379))) ((_ sign_extend 32) (currentByte!3621 thiss!1379)) ((_ sign_extend 32) (currentBit!3616 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75919 () Bool)

(declare-fun res!62772 () Bool)

(assert (=> b!75919 (=> res!62772 e!49694)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75919 (= res!62772 (not (invariant!0 (currentBit!3616 thiss!1379) (currentByte!3621 thiss!1379) (size!1449 (buf!1830 thiss!1379)))))))

(declare-fun b!75920 () Bool)

(assert (=> b!75920 (= e!49697 (array_inv!1295 (buf!1830 thiss!1379)))))

(declare-fun b!75921 () Bool)

(assert (=> b!75921 (= e!49693 (not e!49694))))

(declare-fun res!62770 () Bool)

(assert (=> b!75921 (=> res!62770 e!49694)))

(declare-fun lt!121977 () (_ BitVec 64))

(assert (=> b!75921 (= res!62770 (or (bvslt i!635 to!314) (not (= lt!121977 (bvsub (bvadd lt!121977 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2472 BitStream!2472) Bool)

(assert (=> b!75921 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4998 0))(
  ( (Unit!4999) )
))
(declare-fun lt!121976 () Unit!4998)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2472) Unit!4998)

(assert (=> b!75921 (= lt!121976 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75921 (= lt!121977 (bitIndex!0 (size!1449 (buf!1830 thiss!1379)) (currentByte!3621 thiss!1379) (currentBit!3616 thiss!1379)))))

(assert (= (and start!14744 res!62771) b!75918))

(assert (= (and b!75918 res!62769) b!75921))

(assert (= (and b!75921 (not res!62770)) b!75919))

(assert (= (and b!75919 (not res!62772)) b!75917))

(assert (= (and b!75917 (not res!62773)) b!75916))

(assert (= start!14744 b!75920))

(declare-fun m!121041 () Bool)

(assert (=> start!14744 m!121041))

(declare-fun m!121043 () Bool)

(assert (=> start!14744 m!121043))

(declare-fun m!121045 () Bool)

(assert (=> b!75921 m!121045))

(declare-fun m!121047 () Bool)

(assert (=> b!75921 m!121047))

(declare-fun m!121049 () Bool)

(assert (=> b!75921 m!121049))

(declare-fun m!121051 () Bool)

(assert (=> b!75919 m!121051))

(declare-fun m!121053 () Bool)

(assert (=> b!75916 m!121053))

(declare-fun m!121055 () Bool)

(assert (=> b!75920 m!121055))

(declare-fun m!121057 () Bool)

(assert (=> b!75917 m!121057))

(declare-fun m!121059 () Bool)

(assert (=> b!75917 m!121059))

(declare-fun m!121061 () Bool)

(assert (=> b!75918 m!121061))

(check-sat (not b!75917) (not b!75920) (not b!75918) (not start!14744) (not b!75916) (not b!75919) (not b!75921))
