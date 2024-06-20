; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8372 () Bool)

(assert start!8372)

(declare-fun b!41831 () Bool)

(declare-fun res!35581 () Bool)

(declare-fun e!27802 () Bool)

(assert (=> b!41831 (=> (not res!35581) (not e!27802))))

(declare-datatypes ((array!2124 0))(
  ( (array!2125 (arr!1459 (Array (_ BitVec 32) (_ BitVec 8))) (size!960 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1664 0))(
  ( (BitStream!1665 (buf!1288 array!2124) (currentByte!2740 (_ BitVec 32)) (currentBit!2735 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1664)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41831 (= res!35581 (validate_offset_bits!1 ((_ sign_extend 32) (size!960 (buf!1288 thiss!1379))) ((_ sign_extend 32) (currentByte!2740 thiss!1379)) ((_ sign_extend 32) (currentBit!2735 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41832 () Bool)

(declare-fun e!27803 () Bool)

(declare-fun array_inv!885 (array!2124) Bool)

(assert (=> b!41832 (= e!27803 (array_inv!885 (buf!1288 thiss!1379)))))

(declare-fun res!35583 () Bool)

(assert (=> start!8372 (=> (not res!35583) (not e!27802))))

(declare-fun srcBuffer!2 () array!2124)

(assert (=> start!8372 (= res!35583 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!960 srcBuffer!2))))))))

(assert (=> start!8372 e!27802))

(assert (=> start!8372 true))

(assert (=> start!8372 (array_inv!885 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1664) Bool)

(assert (=> start!8372 (and (inv!12 thiss!1379) e!27803)))

(declare-fun b!41833 () Bool)

(declare-fun e!27801 () Bool)

(assert (=> b!41833 (= e!27802 (not e!27801))))

(declare-fun res!35579 () Bool)

(assert (=> b!41833 (=> res!35579 e!27801)))

(declare-fun lt!63085 () (_ BitVec 64))

(assert (=> b!41833 (= res!35579 (or (bvslt i!635 to!314) (not (= lt!63085 (bvsub (bvadd lt!63085 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1664 BitStream!1664) Bool)

(assert (=> b!41833 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2971 0))(
  ( (Unit!2972) )
))
(declare-fun lt!63084 () Unit!2971)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1664) Unit!2971)

(assert (=> b!41833 (= lt!63084 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41833 (= lt!63085 (bitIndex!0 (size!960 (buf!1288 thiss!1379)) (currentByte!2740 thiss!1379) (currentBit!2735 thiss!1379)))))

(declare-fun b!41834 () Bool)

(declare-fun e!27805 () Bool)

(assert (=> b!41834 (= e!27805 true)))

(declare-datatypes ((tuple2!4062 0))(
  ( (tuple2!4063 (_1!2121 array!2124) (_2!2121 BitStream!1664)) )
))
(declare-fun lt!63083 () tuple2!4062)

(declare-fun checkByteArrayBitContent!0 (BitStream!1664 array!2124 array!2124 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41834 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2121 lt!63083) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41835 () Bool)

(declare-fun res!35582 () Bool)

(assert (=> b!41835 (=> res!35582 e!27801)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41835 (= res!35582 (not (invariant!0 (currentBit!2735 thiss!1379) (currentByte!2740 thiss!1379) (size!960 (buf!1288 thiss!1379)))))))

(declare-fun b!41836 () Bool)

(assert (=> b!41836 (= e!27801 e!27805)))

(declare-fun res!35580 () Bool)

(assert (=> b!41836 (=> res!35580 e!27805)))

(assert (=> b!41836 (= res!35580 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1664 (_ BitVec 64)) tuple2!4062)

(declare-datatypes ((tuple2!4064 0))(
  ( (tuple2!4065 (_1!2122 BitStream!1664) (_2!2122 BitStream!1664)) )
))
(declare-fun reader!0 (BitStream!1664 BitStream!1664) tuple2!4064)

(assert (=> b!41836 (= lt!63083 (readBits!0 (_1!2122 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8372 res!35583) b!41831))

(assert (= (and b!41831 res!35581) b!41833))

(assert (= (and b!41833 (not res!35579)) b!41835))

(assert (= (and b!41835 (not res!35582)) b!41836))

(assert (= (and b!41836 (not res!35580)) b!41834))

(assert (= start!8372 b!41832))

(declare-fun m!63603 () Bool)

(assert (=> b!41833 m!63603))

(declare-fun m!63605 () Bool)

(assert (=> b!41833 m!63605))

(declare-fun m!63607 () Bool)

(assert (=> b!41833 m!63607))

(declare-fun m!63609 () Bool)

(assert (=> b!41835 m!63609))

(declare-fun m!63611 () Bool)

(assert (=> b!41831 m!63611))

(declare-fun m!63613 () Bool)

(assert (=> b!41834 m!63613))

(declare-fun m!63615 () Bool)

(assert (=> b!41836 m!63615))

(declare-fun m!63617 () Bool)

(assert (=> b!41836 m!63617))

(declare-fun m!63619 () Bool)

(assert (=> b!41832 m!63619))

(declare-fun m!63621 () Bool)

(assert (=> start!8372 m!63621))

(declare-fun m!63623 () Bool)

(assert (=> start!8372 m!63623))

(push 1)

