; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14356 () Bool)

(assert start!14356)

(declare-fun b!74472 () Bool)

(declare-fun res!61557 () Bool)

(declare-fun e!48728 () Bool)

(assert (=> b!74472 (=> res!61557 e!48728)))

(declare-datatypes ((array!3044 0))(
  ( (array!3045 (arr!2017 (Array (_ BitVec 32) (_ BitVec 8))) (size!1423 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2420 0))(
  ( (BitStream!2421 (buf!1804 array!3044) (currentByte!3548 (_ BitVec 32)) (currentBit!3543 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2420)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74472 (= res!61557 (not (invariant!0 (currentBit!3543 thiss!1379) (currentByte!3548 thiss!1379) (size!1423 (buf!1804 thiss!1379)))))))

(declare-fun b!74473 () Bool)

(declare-fun e!48725 () Bool)

(declare-fun array_inv!1269 (array!3044) Bool)

(assert (=> b!74473 (= e!48725 (array_inv!1269 (buf!1804 thiss!1379)))))

(declare-fun b!74474 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!74474 (= e!48728 (or (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!6434 0))(
  ( (tuple2!6435 (_1!3331 array!3044) (_2!3331 BitStream!2420)) )
))
(declare-fun lt!119751 () tuple2!6434)

(declare-fun readBits!0 (BitStream!2420 (_ BitVec 64)) tuple2!6434)

(declare-datatypes ((tuple2!6436 0))(
  ( (tuple2!6437 (_1!3332 BitStream!2420) (_2!3332 BitStream!2420)) )
))
(declare-fun reader!0 (BitStream!2420 BitStream!2420) tuple2!6436)

(assert (=> b!74474 (= lt!119751 (readBits!0 (_1!3332 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74475 () Bool)

(declare-fun e!48726 () Bool)

(assert (=> b!74475 (= e!48726 (not e!48728))))

(declare-fun res!61558 () Bool)

(assert (=> b!74475 (=> res!61558 e!48728)))

(declare-fun lt!119750 () (_ BitVec 64))

(assert (=> b!74475 (= res!61558 (or (bvslt i!635 to!314) (not (= lt!119750 (bvsub (bvadd lt!119750 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2420 BitStream!2420) Bool)

(assert (=> b!74475 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4923 0))(
  ( (Unit!4924) )
))
(declare-fun lt!119752 () Unit!4923)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2420) Unit!4923)

(assert (=> b!74475 (= lt!119752 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74475 (= lt!119750 (bitIndex!0 (size!1423 (buf!1804 thiss!1379)) (currentByte!3548 thiss!1379) (currentBit!3543 thiss!1379)))))

(declare-fun b!74476 () Bool)

(declare-fun res!61559 () Bool)

(assert (=> b!74476 (=> (not res!61559) (not e!48726))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74476 (= res!61559 (validate_offset_bits!1 ((_ sign_extend 32) (size!1423 (buf!1804 thiss!1379))) ((_ sign_extend 32) (currentByte!3548 thiss!1379)) ((_ sign_extend 32) (currentBit!3543 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!61560 () Bool)

(assert (=> start!14356 (=> (not res!61560) (not e!48726))))

(declare-fun srcBuffer!2 () array!3044)

(assert (=> start!14356 (= res!61560 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1423 srcBuffer!2))))))))

(assert (=> start!14356 e!48726))

(assert (=> start!14356 true))

(assert (=> start!14356 (array_inv!1269 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2420) Bool)

(assert (=> start!14356 (and (inv!12 thiss!1379) e!48725)))

(assert (= (and start!14356 res!61560) b!74476))

(assert (= (and b!74476 res!61559) b!74475))

(assert (= (and b!74475 (not res!61558)) b!74472))

(assert (= (and b!74472 (not res!61557)) b!74474))

(assert (= start!14356 b!74473))

(declare-fun m!119459 () Bool)

(assert (=> b!74473 m!119459))

(declare-fun m!119461 () Bool)

(assert (=> b!74472 m!119461))

(declare-fun m!119463 () Bool)

(assert (=> start!14356 m!119463))

(declare-fun m!119465 () Bool)

(assert (=> start!14356 m!119465))

(declare-fun m!119467 () Bool)

(assert (=> b!74474 m!119467))

(declare-fun m!119469 () Bool)

(assert (=> b!74474 m!119469))

(declare-fun m!119471 () Bool)

(assert (=> b!74475 m!119471))

(declare-fun m!119473 () Bool)

(assert (=> b!74475 m!119473))

(declare-fun m!119475 () Bool)

(assert (=> b!74475 m!119475))

(declare-fun m!119477 () Bool)

(assert (=> b!74476 m!119477))

(push 1)

(assert (not b!74476))

(assert (not b!74475))

(assert (not start!14356))

(assert (not b!74472))

(assert (not b!74474))

(assert (not b!74473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

