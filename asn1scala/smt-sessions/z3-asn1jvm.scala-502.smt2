; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14774 () Bool)

(assert start!14774)

(declare-fun b!76186 () Bool)

(declare-fun e!49967 () Bool)

(assert (=> b!76186 (= e!49967 true)))

(declare-datatypes ((array!3141 0))(
  ( (array!3142 (arr!2062 (Array (_ BitVec 32) (_ BitVec 8))) (size!1464 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2502 0))(
  ( (BitStream!2503 (buf!1845 array!3141) (currentByte!3636 (_ BitVec 32)) (currentBit!3631 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2502)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!6614 0))(
  ( (tuple2!6615 (_1!3438 array!3141) (_2!3438 BitStream!2502)) )
))
(declare-fun lt!122146 () tuple2!6614)

(declare-fun srcBuffer!2 () array!3141)

(declare-fun checkByteArrayBitContent!0 (BitStream!2502 array!3141 array!3141 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76186 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3438 lt!122146) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76187 () Bool)

(declare-fun e!49965 () Bool)

(declare-fun e!49963 () Bool)

(assert (=> b!76187 (= e!49965 (not e!49963))))

(declare-fun res!62994 () Bool)

(assert (=> b!76187 (=> res!62994 e!49963)))

(declare-fun lt!122148 () (_ BitVec 64))

(assert (=> b!76187 (= res!62994 (or (bvslt i!635 to!314) (not (= lt!122148 (bvsub (bvadd lt!122148 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2502 BitStream!2502) Bool)

(assert (=> b!76187 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5028 0))(
  ( (Unit!5029) )
))
(declare-fun lt!122147 () Unit!5028)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2502) Unit!5028)

(assert (=> b!76187 (= lt!122147 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76187 (= lt!122148 (bitIndex!0 (size!1464 (buf!1845 thiss!1379)) (currentByte!3636 thiss!1379) (currentBit!3631 thiss!1379)))))

(declare-fun b!76188 () Bool)

(assert (=> b!76188 (= e!49963 e!49967)))

(declare-fun res!62998 () Bool)

(assert (=> b!76188 (=> res!62998 e!49967)))

(assert (=> b!76188 (= res!62998 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2502 (_ BitVec 64)) tuple2!6614)

(declare-datatypes ((tuple2!6616 0))(
  ( (tuple2!6617 (_1!3439 BitStream!2502) (_2!3439 BitStream!2502)) )
))
(declare-fun reader!0 (BitStream!2502 BitStream!2502) tuple2!6616)

(assert (=> b!76188 (= lt!122146 (readBits!0 (_1!3439 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!62996 () Bool)

(assert (=> start!14774 (=> (not res!62996) (not e!49965))))

(assert (=> start!14774 (= res!62996 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1464 srcBuffer!2))))))))

(assert (=> start!14774 e!49965))

(assert (=> start!14774 true))

(declare-fun array_inv!1310 (array!3141) Bool)

(assert (=> start!14774 (array_inv!1310 srcBuffer!2)))

(declare-fun e!49966 () Bool)

(declare-fun inv!12 (BitStream!2502) Bool)

(assert (=> start!14774 (and (inv!12 thiss!1379) e!49966)))

(declare-fun b!76189 () Bool)

(assert (=> b!76189 (= e!49966 (array_inv!1310 (buf!1845 thiss!1379)))))

(declare-fun b!76190 () Bool)

(declare-fun res!62997 () Bool)

(assert (=> b!76190 (=> (not res!62997) (not e!49965))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76190 (= res!62997 (validate_offset_bits!1 ((_ sign_extend 32) (size!1464 (buf!1845 thiss!1379))) ((_ sign_extend 32) (currentByte!3636 thiss!1379)) ((_ sign_extend 32) (currentBit!3631 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76191 () Bool)

(declare-fun res!62995 () Bool)

(assert (=> b!76191 (=> res!62995 e!49963)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76191 (= res!62995 (not (invariant!0 (currentBit!3631 thiss!1379) (currentByte!3636 thiss!1379) (size!1464 (buf!1845 thiss!1379)))))))

(assert (= (and start!14774 res!62996) b!76190))

(assert (= (and b!76190 res!62997) b!76187))

(assert (= (and b!76187 (not res!62994)) b!76191))

(assert (= (and b!76191 (not res!62995)) b!76188))

(assert (= (and b!76188 (not res!62998)) b!76186))

(assert (= start!14774 b!76189))

(declare-fun m!121389 () Bool)

(assert (=> b!76188 m!121389))

(declare-fun m!121391 () Bool)

(assert (=> b!76188 m!121391))

(declare-fun m!121393 () Bool)

(assert (=> b!76187 m!121393))

(declare-fun m!121395 () Bool)

(assert (=> b!76187 m!121395))

(declare-fun m!121397 () Bool)

(assert (=> b!76187 m!121397))

(declare-fun m!121399 () Bool)

(assert (=> b!76189 m!121399))

(declare-fun m!121401 () Bool)

(assert (=> b!76191 m!121401))

(declare-fun m!121403 () Bool)

(assert (=> b!76190 m!121403))

(declare-fun m!121405 () Bool)

(assert (=> start!14774 m!121405))

(declare-fun m!121407 () Bool)

(assert (=> start!14774 m!121407))

(declare-fun m!121409 () Bool)

(assert (=> b!76186 m!121409))

(check-sat (not b!76188) (not b!76187) (not b!76191) (not b!76186) (not b!76189) (not start!14774) (not b!76190))
