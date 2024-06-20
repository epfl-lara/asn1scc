; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8360 () Bool)

(assert start!8360)

(declare-fun b!41723 () Bool)

(declare-fun e!27694 () Bool)

(assert (=> b!41723 (= e!27694 true)))

(declare-datatypes ((array!2112 0))(
  ( (array!2113 (arr!1453 (Array (_ BitVec 32) (_ BitVec 8))) (size!954 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2112)

(declare-datatypes ((BitStream!1652 0))(
  ( (BitStream!1653 (buf!1282 array!2112) (currentByte!2734 (_ BitVec 32)) (currentBit!2729 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1652)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!4038 0))(
  ( (tuple2!4039 (_1!2109 array!2112) (_2!2109 BitStream!1652)) )
))
(declare-fun lt!63030 () tuple2!4038)

(declare-fun checkByteArrayBitContent!0 (BitStream!1652 array!2112 array!2112 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41723 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2109 lt!63030) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41724 () Bool)

(declare-fun e!27692 () Bool)

(assert (=> b!41724 (= e!27692 e!27694)))

(declare-fun res!35489 () Bool)

(assert (=> b!41724 (=> res!35489 e!27694)))

(assert (=> b!41724 (= res!35489 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1652 (_ BitVec 64)) tuple2!4038)

(declare-datatypes ((tuple2!4040 0))(
  ( (tuple2!4041 (_1!2110 BitStream!1652) (_2!2110 BitStream!1652)) )
))
(declare-fun reader!0 (BitStream!1652 BitStream!1652) tuple2!4040)

(assert (=> b!41724 (= lt!63030 (readBits!0 (_1!2110 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35492 () Bool)

(declare-fun e!27695 () Bool)

(assert (=> start!8360 (=> (not res!35492) (not e!27695))))

(assert (=> start!8360 (= res!35492 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!954 srcBuffer!2))))))))

(assert (=> start!8360 e!27695))

(assert (=> start!8360 true))

(declare-fun array_inv!879 (array!2112) Bool)

(assert (=> start!8360 (array_inv!879 srcBuffer!2)))

(declare-fun e!27697 () Bool)

(declare-fun inv!12 (BitStream!1652) Bool)

(assert (=> start!8360 (and (inv!12 thiss!1379) e!27697)))

(declare-fun b!41725 () Bool)

(declare-fun res!35493 () Bool)

(assert (=> b!41725 (=> res!35493 e!27692)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41725 (= res!35493 (not (invariant!0 (currentBit!2729 thiss!1379) (currentByte!2734 thiss!1379) (size!954 (buf!1282 thiss!1379)))))))

(declare-fun b!41726 () Bool)

(assert (=> b!41726 (= e!27697 (array_inv!879 (buf!1282 thiss!1379)))))

(declare-fun b!41727 () Bool)

(declare-fun res!35491 () Bool)

(assert (=> b!41727 (=> (not res!35491) (not e!27695))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41727 (= res!35491 (validate_offset_bits!1 ((_ sign_extend 32) (size!954 (buf!1282 thiss!1379))) ((_ sign_extend 32) (currentByte!2734 thiss!1379)) ((_ sign_extend 32) (currentBit!2729 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41728 () Bool)

(assert (=> b!41728 (= e!27695 (not e!27692))))

(declare-fun res!35490 () Bool)

(assert (=> b!41728 (=> res!35490 e!27692)))

(declare-fun lt!63031 () (_ BitVec 64))

(assert (=> b!41728 (= res!35490 (or (bvslt i!635 to!314) (not (= lt!63031 (bvsub (bvadd lt!63031 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1652 BitStream!1652) Bool)

(assert (=> b!41728 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2959 0))(
  ( (Unit!2960) )
))
(declare-fun lt!63029 () Unit!2959)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1652) Unit!2959)

(assert (=> b!41728 (= lt!63029 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41728 (= lt!63031 (bitIndex!0 (size!954 (buf!1282 thiss!1379)) (currentByte!2734 thiss!1379) (currentBit!2729 thiss!1379)))))

(assert (= (and start!8360 res!35492) b!41727))

(assert (= (and b!41727 res!35491) b!41728))

(assert (= (and b!41728 (not res!35490)) b!41725))

(assert (= (and b!41725 (not res!35493)) b!41724))

(assert (= (and b!41724 (not res!35489)) b!41723))

(assert (= start!8360 b!41726))

(declare-fun m!63471 () Bool)

(assert (=> start!8360 m!63471))

(declare-fun m!63473 () Bool)

(assert (=> start!8360 m!63473))

(declare-fun m!63475 () Bool)

(assert (=> b!41726 m!63475))

(declare-fun m!63477 () Bool)

(assert (=> b!41723 m!63477))

(declare-fun m!63479 () Bool)

(assert (=> b!41727 m!63479))

(declare-fun m!63481 () Bool)

(assert (=> b!41728 m!63481))

(declare-fun m!63483 () Bool)

(assert (=> b!41728 m!63483))

(declare-fun m!63485 () Bool)

(assert (=> b!41728 m!63485))

(declare-fun m!63487 () Bool)

(assert (=> b!41724 m!63487))

(declare-fun m!63489 () Bool)

(assert (=> b!41724 m!63489))

(declare-fun m!63491 () Bool)

(assert (=> b!41725 m!63491))

(push 1)

