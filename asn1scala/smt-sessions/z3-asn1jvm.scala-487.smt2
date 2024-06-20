; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14348 () Bool)

(assert start!14348)

(declare-fun b!74412 () Bool)

(declare-fun e!48665 () Bool)

(declare-fun e!48668 () Bool)

(assert (=> b!74412 (= e!48665 (not e!48668))))

(declare-fun res!61512 () Bool)

(assert (=> b!74412 (=> res!61512 e!48668)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!119714 () (_ BitVec 64))

(assert (=> b!74412 (= res!61512 (or (bvslt i!635 to!314) (not (= lt!119714 (bvsub (bvadd lt!119714 to!314) i!635)))))))

(declare-datatypes ((array!3036 0))(
  ( (array!3037 (arr!2013 (Array (_ BitVec 32) (_ BitVec 8))) (size!1419 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2412 0))(
  ( (BitStream!2413 (buf!1800 array!3036) (currentByte!3544 (_ BitVec 32)) (currentBit!3539 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2412)

(declare-fun isPrefixOf!0 (BitStream!2412 BitStream!2412) Bool)

(assert (=> b!74412 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4915 0))(
  ( (Unit!4916) )
))
(declare-fun lt!119716 () Unit!4915)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2412) Unit!4915)

(assert (=> b!74412 (= lt!119716 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74412 (= lt!119714 (bitIndex!0 (size!1419 (buf!1800 thiss!1379)) (currentByte!3544 thiss!1379) (currentBit!3539 thiss!1379)))))

(declare-fun b!74413 () Bool)

(assert (=> b!74413 (= e!48668 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!6418 0))(
  ( (tuple2!6419 (_1!3323 array!3036) (_2!3323 BitStream!2412)) )
))
(declare-fun lt!119715 () tuple2!6418)

(declare-fun readBits!0 (BitStream!2412 (_ BitVec 64)) tuple2!6418)

(declare-datatypes ((tuple2!6420 0))(
  ( (tuple2!6421 (_1!3324 BitStream!2412) (_2!3324 BitStream!2412)) )
))
(declare-fun reader!0 (BitStream!2412 BitStream!2412) tuple2!6420)

(assert (=> b!74413 (= lt!119715 (readBits!0 (_1!3324 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74414 () Bool)

(declare-fun res!61510 () Bool)

(assert (=> b!74414 (=> res!61510 e!48668)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74414 (= res!61510 (not (invariant!0 (currentBit!3539 thiss!1379) (currentByte!3544 thiss!1379) (size!1419 (buf!1800 thiss!1379)))))))

(declare-fun b!74415 () Bool)

(declare-fun e!48666 () Bool)

(declare-fun array_inv!1265 (array!3036) Bool)

(assert (=> b!74415 (= e!48666 (array_inv!1265 (buf!1800 thiss!1379)))))

(declare-fun b!74416 () Bool)

(declare-fun res!61511 () Bool)

(assert (=> b!74416 (=> (not res!61511) (not e!48665))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74416 (= res!61511 (validate_offset_bits!1 ((_ sign_extend 32) (size!1419 (buf!1800 thiss!1379))) ((_ sign_extend 32) (currentByte!3544 thiss!1379)) ((_ sign_extend 32) (currentBit!3539 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!61509 () Bool)

(assert (=> start!14348 (=> (not res!61509) (not e!48665))))

(declare-fun srcBuffer!2 () array!3036)

(assert (=> start!14348 (= res!61509 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1419 srcBuffer!2))))))))

(assert (=> start!14348 e!48665))

(assert (=> start!14348 true))

(assert (=> start!14348 (array_inv!1265 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2412) Bool)

(assert (=> start!14348 (and (inv!12 thiss!1379) e!48666)))

(assert (= (and start!14348 res!61509) b!74416))

(assert (= (and b!74416 res!61511) b!74412))

(assert (= (and b!74412 (not res!61512)) b!74414))

(assert (= (and b!74414 (not res!61510)) b!74413))

(assert (= start!14348 b!74415))

(declare-fun m!119379 () Bool)

(assert (=> start!14348 m!119379))

(declare-fun m!119381 () Bool)

(assert (=> start!14348 m!119381))

(declare-fun m!119383 () Bool)

(assert (=> b!74414 m!119383))

(declare-fun m!119385 () Bool)

(assert (=> b!74415 m!119385))

(declare-fun m!119387 () Bool)

(assert (=> b!74412 m!119387))

(declare-fun m!119389 () Bool)

(assert (=> b!74412 m!119389))

(declare-fun m!119391 () Bool)

(assert (=> b!74412 m!119391))

(declare-fun m!119393 () Bool)

(assert (=> b!74413 m!119393))

(declare-fun m!119395 () Bool)

(assert (=> b!74413 m!119395))

(declare-fun m!119397 () Bool)

(assert (=> b!74416 m!119397))

(check-sat (not b!74414) (not b!74412) (not b!74413) (not b!74415) (not start!14348) (not b!74416))
