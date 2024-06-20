; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14354 () Bool)

(assert start!14354)

(declare-fun b!74457 () Bool)

(declare-fun e!48710 () Bool)

(declare-datatypes ((array!3042 0))(
  ( (array!3043 (arr!2016 (Array (_ BitVec 32) (_ BitVec 8))) (size!1422 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2418 0))(
  ( (BitStream!2419 (buf!1803 array!3042) (currentByte!3547 (_ BitVec 32)) (currentBit!3542 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2418)

(declare-fun array_inv!1268 (array!3042) Bool)

(assert (=> b!74457 (= e!48710 (array_inv!1268 (buf!1803 thiss!1379)))))

(declare-fun res!61546 () Bool)

(declare-fun e!48709 () Bool)

(assert (=> start!14354 (=> (not res!61546) (not e!48709))))

(declare-fun srcBuffer!2 () array!3042)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14354 (= res!61546 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1422 srcBuffer!2))))))))

(assert (=> start!14354 e!48709))

(assert (=> start!14354 true))

(assert (=> start!14354 (array_inv!1268 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2418) Bool)

(assert (=> start!14354 (and (inv!12 thiss!1379) e!48710)))

(declare-fun b!74458 () Bool)

(declare-fun e!48711 () Bool)

(assert (=> b!74458 (= e!48709 (not e!48711))))

(declare-fun res!61548 () Bool)

(assert (=> b!74458 (=> res!61548 e!48711)))

(declare-fun lt!119743 () (_ BitVec 64))

(assert (=> b!74458 (= res!61548 (or (bvslt i!635 to!314) (not (= lt!119743 (bvsub (bvadd lt!119743 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2418 BitStream!2418) Bool)

(assert (=> b!74458 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4921 0))(
  ( (Unit!4922) )
))
(declare-fun lt!119742 () Unit!4921)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2418) Unit!4921)

(assert (=> b!74458 (= lt!119742 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74458 (= lt!119743 (bitIndex!0 (size!1422 (buf!1803 thiss!1379)) (currentByte!3547 thiss!1379) (currentBit!3542 thiss!1379)))))

(declare-fun b!74459 () Bool)

(assert (=> b!74459 (= e!48711 (or (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!6430 0))(
  ( (tuple2!6431 (_1!3329 array!3042) (_2!3329 BitStream!2418)) )
))
(declare-fun lt!119741 () tuple2!6430)

(declare-fun readBits!0 (BitStream!2418 (_ BitVec 64)) tuple2!6430)

(declare-datatypes ((tuple2!6432 0))(
  ( (tuple2!6433 (_1!3330 BitStream!2418) (_2!3330 BitStream!2418)) )
))
(declare-fun reader!0 (BitStream!2418 BitStream!2418) tuple2!6432)

(assert (=> b!74459 (= lt!119741 (readBits!0 (_1!3330 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74460 () Bool)

(declare-fun res!61547 () Bool)

(assert (=> b!74460 (=> res!61547 e!48711)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74460 (= res!61547 (not (invariant!0 (currentBit!3542 thiss!1379) (currentByte!3547 thiss!1379) (size!1422 (buf!1803 thiss!1379)))))))

(declare-fun b!74461 () Bool)

(declare-fun res!61545 () Bool)

(assert (=> b!74461 (=> (not res!61545) (not e!48709))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74461 (= res!61545 (validate_offset_bits!1 ((_ sign_extend 32) (size!1422 (buf!1803 thiss!1379))) ((_ sign_extend 32) (currentByte!3547 thiss!1379)) ((_ sign_extend 32) (currentBit!3542 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14354 res!61546) b!74461))

(assert (= (and b!74461 res!61545) b!74458))

(assert (= (and b!74458 (not res!61548)) b!74460))

(assert (= (and b!74460 (not res!61547)) b!74459))

(assert (= start!14354 b!74457))

(declare-fun m!119439 () Bool)

(assert (=> b!74461 m!119439))

(declare-fun m!119441 () Bool)

(assert (=> b!74460 m!119441))

(declare-fun m!119443 () Bool)

(assert (=> start!14354 m!119443))

(declare-fun m!119445 () Bool)

(assert (=> start!14354 m!119445))

(declare-fun m!119447 () Bool)

(assert (=> b!74459 m!119447))

(declare-fun m!119449 () Bool)

(assert (=> b!74459 m!119449))

(declare-fun m!119451 () Bool)

(assert (=> b!74457 m!119451))

(declare-fun m!119453 () Bool)

(assert (=> b!74458 m!119453))

(declare-fun m!119455 () Bool)

(assert (=> b!74458 m!119455))

(declare-fun m!119457 () Bool)

(assert (=> b!74458 m!119457))

(check-sat (not start!14354) (not b!74460) (not b!74461) (not b!74457) (not b!74458) (not b!74459))
