; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8356 () Bool)

(assert start!8356)

(declare-fun b!41687 () Bool)

(declare-fun e!27657 () Bool)

(declare-fun e!27659 () Bool)

(assert (=> b!41687 (= e!27657 e!27659)))

(declare-fun res!35463 () Bool)

(assert (=> b!41687 (=> res!35463 e!27659)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!41687 (= res!35463 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!2108 0))(
  ( (array!2109 (arr!1451 (Array (_ BitVec 32) (_ BitVec 8))) (size!952 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1648 0))(
  ( (BitStream!1649 (buf!1280 array!2108) (currentByte!2732 (_ BitVec 32)) (currentBit!2727 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1648)

(declare-datatypes ((tuple2!4030 0))(
  ( (tuple2!4031 (_1!2105 array!2108) (_2!2105 BitStream!1648)) )
))
(declare-fun lt!63013 () tuple2!4030)

(declare-fun readBits!0 (BitStream!1648 (_ BitVec 64)) tuple2!4030)

(declare-datatypes ((tuple2!4032 0))(
  ( (tuple2!4033 (_1!2106 BitStream!1648) (_2!2106 BitStream!1648)) )
))
(declare-fun reader!0 (BitStream!1648 BitStream!1648) tuple2!4032)

(assert (=> b!41687 (= lt!63013 (readBits!0 (_1!2106 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41688 () Bool)

(assert (=> b!41688 (= e!27659 true)))

(declare-fun srcBuffer!2 () array!2108)

(declare-fun checkByteArrayBitContent!0 (BitStream!1648 array!2108 array!2108 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41688 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2105 lt!63013) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41689 () Bool)

(declare-fun res!35462 () Bool)

(declare-fun e!27658 () Bool)

(assert (=> b!41689 (=> (not res!35462) (not e!27658))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41689 (= res!35462 (validate_offset_bits!1 ((_ sign_extend 32) (size!952 (buf!1280 thiss!1379))) ((_ sign_extend 32) (currentByte!2732 thiss!1379)) ((_ sign_extend 32) (currentBit!2727 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41690 () Bool)

(assert (=> b!41690 (= e!27658 (not e!27657))))

(declare-fun res!35460 () Bool)

(assert (=> b!41690 (=> res!35460 e!27657)))

(declare-fun lt!63012 () (_ BitVec 64))

(assert (=> b!41690 (= res!35460 (or (bvslt i!635 to!314) (not (= lt!63012 (bvsub (bvadd lt!63012 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1648 BitStream!1648) Bool)

(assert (=> b!41690 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2955 0))(
  ( (Unit!2956) )
))
(declare-fun lt!63011 () Unit!2955)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1648) Unit!2955)

(assert (=> b!41690 (= lt!63011 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41690 (= lt!63012 (bitIndex!0 (size!952 (buf!1280 thiss!1379)) (currentByte!2732 thiss!1379) (currentBit!2727 thiss!1379)))))

(declare-fun res!35459 () Bool)

(assert (=> start!8356 (=> (not res!35459) (not e!27658))))

(assert (=> start!8356 (= res!35459 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!952 srcBuffer!2))))))))

(assert (=> start!8356 e!27658))

(assert (=> start!8356 true))

(declare-fun array_inv!877 (array!2108) Bool)

(assert (=> start!8356 (array_inv!877 srcBuffer!2)))

(declare-fun e!27661 () Bool)

(declare-fun inv!12 (BitStream!1648) Bool)

(assert (=> start!8356 (and (inv!12 thiss!1379) e!27661)))

(declare-fun b!41691 () Bool)

(assert (=> b!41691 (= e!27661 (array_inv!877 (buf!1280 thiss!1379)))))

(declare-fun b!41692 () Bool)

(declare-fun res!35461 () Bool)

(assert (=> b!41692 (=> res!35461 e!27657)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41692 (= res!35461 (not (invariant!0 (currentBit!2727 thiss!1379) (currentByte!2732 thiss!1379) (size!952 (buf!1280 thiss!1379)))))))

(assert (= (and start!8356 res!35459) b!41689))

(assert (= (and b!41689 res!35462) b!41690))

(assert (= (and b!41690 (not res!35460)) b!41692))

(assert (= (and b!41692 (not res!35461)) b!41687))

(assert (= (and b!41687 (not res!35463)) b!41688))

(assert (= start!8356 b!41691))

(declare-fun m!63427 () Bool)

(assert (=> b!41692 m!63427))

(declare-fun m!63429 () Bool)

(assert (=> b!41689 m!63429))

(declare-fun m!63431 () Bool)

(assert (=> start!8356 m!63431))

(declare-fun m!63433 () Bool)

(assert (=> start!8356 m!63433))

(declare-fun m!63435 () Bool)

(assert (=> b!41688 m!63435))

(declare-fun m!63437 () Bool)

(assert (=> b!41691 m!63437))

(declare-fun m!63439 () Bool)

(assert (=> b!41687 m!63439))

(declare-fun m!63441 () Bool)

(assert (=> b!41687 m!63441))

(declare-fun m!63443 () Bool)

(assert (=> b!41690 m!63443))

(declare-fun m!63445 () Bool)

(assert (=> b!41690 m!63445))

(declare-fun m!63447 () Bool)

(assert (=> b!41690 m!63447))

(push 1)

(assert (not start!8356))

(assert (not b!41688))

(assert (not b!41690))

(assert (not b!41689))

(assert (not b!41691))

(assert (not b!41687))

(assert (not b!41692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

