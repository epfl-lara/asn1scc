; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14350 () Bool)

(assert start!14350)

(declare-fun b!74427 () Bool)

(declare-fun res!61522 () Bool)

(declare-fun e!48682 () Bool)

(assert (=> b!74427 (=> (not res!61522) (not e!48682))))

(declare-datatypes ((array!3038 0))(
  ( (array!3039 (arr!2014 (Array (_ BitVec 32) (_ BitVec 8))) (size!1420 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2414 0))(
  ( (BitStream!2415 (buf!1801 array!3038) (currentByte!3545 (_ BitVec 32)) (currentBit!3540 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2414)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74427 (= res!61522 (validate_offset_bits!1 ((_ sign_extend 32) (size!1420 (buf!1801 thiss!1379))) ((_ sign_extend 32) (currentByte!3545 thiss!1379)) ((_ sign_extend 32) (currentBit!3540 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74428 () Bool)

(declare-fun e!48681 () Bool)

(assert (=> b!74428 (= e!48682 (not e!48681))))

(declare-fun res!61524 () Bool)

(assert (=> b!74428 (=> res!61524 e!48681)))

(declare-fun lt!119725 () (_ BitVec 64))

(assert (=> b!74428 (= res!61524 (or (bvslt i!635 to!314) (not (= lt!119725 (bvsub (bvadd lt!119725 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2414 BitStream!2414) Bool)

(assert (=> b!74428 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4917 0))(
  ( (Unit!4918) )
))
(declare-fun lt!119723 () Unit!4917)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2414) Unit!4917)

(assert (=> b!74428 (= lt!119723 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74428 (= lt!119725 (bitIndex!0 (size!1420 (buf!1801 thiss!1379)) (currentByte!3545 thiss!1379) (currentBit!3540 thiss!1379)))))

(declare-fun b!74429 () Bool)

(declare-fun e!48679 () Bool)

(declare-fun array_inv!1266 (array!3038) Bool)

(assert (=> b!74429 (= e!48679 (array_inv!1266 (buf!1801 thiss!1379)))))

(declare-fun res!61521 () Bool)

(assert (=> start!14350 (=> (not res!61521) (not e!48682))))

(declare-fun srcBuffer!2 () array!3038)

(assert (=> start!14350 (= res!61521 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1420 srcBuffer!2))))))))

(assert (=> start!14350 e!48682))

(assert (=> start!14350 true))

(assert (=> start!14350 (array_inv!1266 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2414) Bool)

(assert (=> start!14350 (and (inv!12 thiss!1379) e!48679)))

(declare-fun b!74430 () Bool)

(declare-fun res!61523 () Bool)

(assert (=> b!74430 (=> res!61523 e!48681)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74430 (= res!61523 (not (invariant!0 (currentBit!3540 thiss!1379) (currentByte!3545 thiss!1379) (size!1420 (buf!1801 thiss!1379)))))))

(declare-fun b!74431 () Bool)

(assert (=> b!74431 (= e!48681 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!6422 0))(
  ( (tuple2!6423 (_1!3325 array!3038) (_2!3325 BitStream!2414)) )
))
(declare-fun lt!119724 () tuple2!6422)

(declare-fun readBits!0 (BitStream!2414 (_ BitVec 64)) tuple2!6422)

(declare-datatypes ((tuple2!6424 0))(
  ( (tuple2!6425 (_1!3326 BitStream!2414) (_2!3326 BitStream!2414)) )
))
(declare-fun reader!0 (BitStream!2414 BitStream!2414) tuple2!6424)

(assert (=> b!74431 (= lt!119724 (readBits!0 (_1!3326 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14350 res!61521) b!74427))

(assert (= (and b!74427 res!61522) b!74428))

(assert (= (and b!74428 (not res!61524)) b!74430))

(assert (= (and b!74430 (not res!61523)) b!74431))

(assert (= start!14350 b!74429))

(declare-fun m!119399 () Bool)

(assert (=> b!74428 m!119399))

(declare-fun m!119401 () Bool)

(assert (=> b!74428 m!119401))

(declare-fun m!119403 () Bool)

(assert (=> b!74428 m!119403))

(declare-fun m!119405 () Bool)

(assert (=> b!74429 m!119405))

(declare-fun m!119407 () Bool)

(assert (=> b!74427 m!119407))

(declare-fun m!119409 () Bool)

(assert (=> start!14350 m!119409))

(declare-fun m!119411 () Bool)

(assert (=> start!14350 m!119411))

(declare-fun m!119413 () Bool)

(assert (=> b!74430 m!119413))

(declare-fun m!119415 () Bool)

(assert (=> b!74431 m!119415))

(declare-fun m!119417 () Bool)

(assert (=> b!74431 m!119417))

(push 1)

(assert (not b!74431))

(assert (not b!74429))

(assert (not b!74428))

(assert (not b!74427))

(assert (not start!14350))

(assert (not b!74430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

