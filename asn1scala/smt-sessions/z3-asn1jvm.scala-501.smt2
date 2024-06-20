; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14768 () Bool)

(assert start!14768)

(declare-fun res!62949 () Bool)

(declare-fun e!49910 () Bool)

(assert (=> start!14768 (=> (not res!62949) (not e!49910))))

(declare-datatypes ((array!3135 0))(
  ( (array!3136 (arr!2059 (Array (_ BitVec 32) (_ BitVec 8))) (size!1461 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3135)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14768 (= res!62949 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1461 srcBuffer!2))))))))

(assert (=> start!14768 e!49910))

(assert (=> start!14768 true))

(declare-fun array_inv!1307 (array!3135) Bool)

(assert (=> start!14768 (array_inv!1307 srcBuffer!2)))

(declare-datatypes ((BitStream!2496 0))(
  ( (BitStream!2497 (buf!1842 array!3135) (currentByte!3633 (_ BitVec 32)) (currentBit!3628 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2496)

(declare-fun e!49909 () Bool)

(declare-fun inv!12 (BitStream!2496) Bool)

(assert (=> start!14768 (and (inv!12 thiss!1379) e!49909)))

(declare-fun b!76132 () Bool)

(declare-fun e!49911 () Bool)

(assert (=> b!76132 (= e!49911 true)))

(declare-datatypes ((tuple2!6602 0))(
  ( (tuple2!6603 (_1!3432 array!3135) (_2!3432 BitStream!2496)) )
))
(declare-fun lt!122119 () tuple2!6602)

(declare-fun checkByteArrayBitContent!0 (BitStream!2496 array!3135 array!3135 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76132 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3432 lt!122119) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76133 () Bool)

(declare-fun e!49914 () Bool)

(assert (=> b!76133 (= e!49914 e!49911)))

(declare-fun res!62952 () Bool)

(assert (=> b!76133 (=> res!62952 e!49911)))

(assert (=> b!76133 (= res!62952 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2496 (_ BitVec 64)) tuple2!6602)

(declare-datatypes ((tuple2!6604 0))(
  ( (tuple2!6605 (_1!3433 BitStream!2496) (_2!3433 BitStream!2496)) )
))
(declare-fun reader!0 (BitStream!2496 BitStream!2496) tuple2!6604)

(assert (=> b!76133 (= lt!122119 (readBits!0 (_1!3433 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76134 () Bool)

(declare-fun res!62951 () Bool)

(assert (=> b!76134 (=> res!62951 e!49914)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76134 (= res!62951 (not (invariant!0 (currentBit!3628 thiss!1379) (currentByte!3633 thiss!1379) (size!1461 (buf!1842 thiss!1379)))))))

(declare-fun b!76135 () Bool)

(assert (=> b!76135 (= e!49910 (not e!49914))))

(declare-fun res!62950 () Bool)

(assert (=> b!76135 (=> res!62950 e!49914)))

(declare-fun lt!122120 () (_ BitVec 64))

(assert (=> b!76135 (= res!62950 (or (bvslt i!635 to!314) (not (= lt!122120 (bvsub (bvadd lt!122120 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2496 BitStream!2496) Bool)

(assert (=> b!76135 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5022 0))(
  ( (Unit!5023) )
))
(declare-fun lt!122121 () Unit!5022)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2496) Unit!5022)

(assert (=> b!76135 (= lt!122121 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76135 (= lt!122120 (bitIndex!0 (size!1461 (buf!1842 thiss!1379)) (currentByte!3633 thiss!1379) (currentBit!3628 thiss!1379)))))

(declare-fun b!76136 () Bool)

(declare-fun res!62953 () Bool)

(assert (=> b!76136 (=> (not res!62953) (not e!49910))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76136 (= res!62953 (validate_offset_bits!1 ((_ sign_extend 32) (size!1461 (buf!1842 thiss!1379))) ((_ sign_extend 32) (currentByte!3633 thiss!1379)) ((_ sign_extend 32) (currentBit!3628 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76137 () Bool)

(assert (=> b!76137 (= e!49909 (array_inv!1307 (buf!1842 thiss!1379)))))

(assert (= (and start!14768 res!62949) b!76136))

(assert (= (and b!76136 res!62953) b!76135))

(assert (= (and b!76135 (not res!62950)) b!76134))

(assert (= (and b!76134 (not res!62951)) b!76133))

(assert (= (and b!76133 (not res!62952)) b!76132))

(assert (= start!14768 b!76137))

(declare-fun m!121323 () Bool)

(assert (=> b!76137 m!121323))

(declare-fun m!121325 () Bool)

(assert (=> b!76132 m!121325))

(declare-fun m!121327 () Bool)

(assert (=> b!76136 m!121327))

(declare-fun m!121329 () Bool)

(assert (=> start!14768 m!121329))

(declare-fun m!121331 () Bool)

(assert (=> start!14768 m!121331))

(declare-fun m!121333 () Bool)

(assert (=> b!76135 m!121333))

(declare-fun m!121335 () Bool)

(assert (=> b!76135 m!121335))

(declare-fun m!121337 () Bool)

(assert (=> b!76135 m!121337))

(declare-fun m!121339 () Bool)

(assert (=> b!76134 m!121339))

(declare-fun m!121341 () Bool)

(assert (=> b!76133 m!121341))

(declare-fun m!121343 () Bool)

(assert (=> b!76133 m!121343))

(check-sat (not b!76135) (not b!76136) (not b!76132) (not b!76137) (not b!76133) (not start!14768) (not b!76134))
