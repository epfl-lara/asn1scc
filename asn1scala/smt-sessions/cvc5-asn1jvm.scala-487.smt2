; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14346 () Bool)

(assert start!14346)

(declare-fun b!74397 () Bool)

(declare-fun res!61498 () Bool)

(declare-fun e!48652 () Bool)

(assert (=> b!74397 (=> (not res!61498) (not e!48652))))

(declare-datatypes ((array!3034 0))(
  ( (array!3035 (arr!2012 (Array (_ BitVec 32) (_ BitVec 8))) (size!1418 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2410 0))(
  ( (BitStream!2411 (buf!1799 array!3034) (currentByte!3543 (_ BitVec 32)) (currentBit!3538 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2410)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74397 (= res!61498 (validate_offset_bits!1 ((_ sign_extend 32) (size!1418 (buf!1799 thiss!1379))) ((_ sign_extend 32) (currentByte!3543 thiss!1379)) ((_ sign_extend 32) (currentBit!3538 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!61500 () Bool)

(assert (=> start!14346 (=> (not res!61500) (not e!48652))))

(declare-fun srcBuffer!2 () array!3034)

(assert (=> start!14346 (= res!61500 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1418 srcBuffer!2))))))))

(assert (=> start!14346 e!48652))

(assert (=> start!14346 true))

(declare-fun array_inv!1264 (array!3034) Bool)

(assert (=> start!14346 (array_inv!1264 srcBuffer!2)))

(declare-fun e!48651 () Bool)

(declare-fun inv!12 (BitStream!2410) Bool)

(assert (=> start!14346 (and (inv!12 thiss!1379) e!48651)))

(declare-fun b!74398 () Bool)

(declare-fun e!48653 () Bool)

(assert (=> b!74398 (= e!48652 (not e!48653))))

(declare-fun res!61499 () Bool)

(assert (=> b!74398 (=> res!61499 e!48653)))

(declare-fun lt!119705 () (_ BitVec 64))

(assert (=> b!74398 (= res!61499 (or (bvslt i!635 to!314) (not (= lt!119705 (bvsub (bvadd lt!119705 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2410 BitStream!2410) Bool)

(assert (=> b!74398 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4913 0))(
  ( (Unit!4914) )
))
(declare-fun lt!119707 () Unit!4913)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2410) Unit!4913)

(assert (=> b!74398 (= lt!119707 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74398 (= lt!119705 (bitIndex!0 (size!1418 (buf!1799 thiss!1379)) (currentByte!3543 thiss!1379) (currentBit!3538 thiss!1379)))))

(declare-fun b!74399 () Bool)

(assert (=> b!74399 (= e!48651 (array_inv!1264 (buf!1799 thiss!1379)))))

(declare-fun b!74400 () Bool)

(assert (=> b!74400 (= e!48653 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!6414 0))(
  ( (tuple2!6415 (_1!3321 array!3034) (_2!3321 BitStream!2410)) )
))
(declare-fun lt!119706 () tuple2!6414)

(declare-fun readBits!0 (BitStream!2410 (_ BitVec 64)) tuple2!6414)

(declare-datatypes ((tuple2!6416 0))(
  ( (tuple2!6417 (_1!3322 BitStream!2410) (_2!3322 BitStream!2410)) )
))
(declare-fun reader!0 (BitStream!2410 BitStream!2410) tuple2!6416)

(assert (=> b!74400 (= lt!119706 (readBits!0 (_1!3322 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74401 () Bool)

(declare-fun res!61497 () Bool)

(assert (=> b!74401 (=> res!61497 e!48653)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74401 (= res!61497 (not (invariant!0 (currentBit!3538 thiss!1379) (currentByte!3543 thiss!1379) (size!1418 (buf!1799 thiss!1379)))))))

(assert (= (and start!14346 res!61500) b!74397))

(assert (= (and b!74397 res!61498) b!74398))

(assert (= (and b!74398 (not res!61499)) b!74401))

(assert (= (and b!74401 (not res!61497)) b!74400))

(assert (= start!14346 b!74399))

(declare-fun m!119359 () Bool)

(assert (=> b!74399 m!119359))

(declare-fun m!119361 () Bool)

(assert (=> start!14346 m!119361))

(declare-fun m!119363 () Bool)

(assert (=> start!14346 m!119363))

(declare-fun m!119365 () Bool)

(assert (=> b!74397 m!119365))

(declare-fun m!119367 () Bool)

(assert (=> b!74401 m!119367))

(declare-fun m!119369 () Bool)

(assert (=> b!74400 m!119369))

(declare-fun m!119371 () Bool)

(assert (=> b!74400 m!119371))

(declare-fun m!119373 () Bool)

(assert (=> b!74398 m!119373))

(declare-fun m!119375 () Bool)

(assert (=> b!74398 m!119375))

(declare-fun m!119377 () Bool)

(assert (=> b!74398 m!119377))

(push 1)

(assert (not b!74400))

(assert (not b!74397))

(assert (not b!74398))

(assert (not b!74399))

(assert (not start!14346))

(assert (not b!74401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

