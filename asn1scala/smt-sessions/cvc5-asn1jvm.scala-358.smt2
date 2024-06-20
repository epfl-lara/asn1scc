; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8362 () Bool)

(assert start!8362)

(declare-fun b!41741 () Bool)

(declare-fun e!27711 () Bool)

(declare-fun e!27713 () Bool)

(assert (=> b!41741 (= e!27711 e!27713)))

(declare-fun res!35505 () Bool)

(assert (=> b!41741 (=> res!35505 e!27713)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!41741 (= res!35505 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!2114 0))(
  ( (array!2115 (arr!1454 (Array (_ BitVec 32) (_ BitVec 8))) (size!955 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1654 0))(
  ( (BitStream!1655 (buf!1283 array!2114) (currentByte!2735 (_ BitVec 32)) (currentBit!2730 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1654)

(declare-datatypes ((tuple2!4042 0))(
  ( (tuple2!4043 (_1!2111 array!2114) (_2!2111 BitStream!1654)) )
))
(declare-fun lt!63039 () tuple2!4042)

(declare-fun readBits!0 (BitStream!1654 (_ BitVec 64)) tuple2!4042)

(declare-datatypes ((tuple2!4044 0))(
  ( (tuple2!4045 (_1!2112 BitStream!1654) (_2!2112 BitStream!1654)) )
))
(declare-fun reader!0 (BitStream!1654 BitStream!1654) tuple2!4044)

(assert (=> b!41741 (= lt!63039 (readBits!0 (_1!2112 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41742 () Bool)

(declare-fun res!35504 () Bool)

(assert (=> b!41742 (=> res!35504 e!27711)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41742 (= res!35504 (not (invariant!0 (currentBit!2730 thiss!1379) (currentByte!2735 thiss!1379) (size!955 (buf!1283 thiss!1379)))))))

(declare-fun b!41743 () Bool)

(declare-fun e!27715 () Bool)

(declare-fun array_inv!880 (array!2114) Bool)

(assert (=> b!41743 (= e!27715 (array_inv!880 (buf!1283 thiss!1379)))))

(declare-fun b!41744 () Bool)

(assert (=> b!41744 (= e!27713 true)))

(declare-fun srcBuffer!2 () array!2114)

(declare-fun checkByteArrayBitContent!0 (BitStream!1654 array!2114 array!2114 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41744 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2111 lt!63039) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41745 () Bool)

(declare-fun res!35508 () Bool)

(declare-fun e!27710 () Bool)

(assert (=> b!41745 (=> (not res!35508) (not e!27710))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41745 (= res!35508 (validate_offset_bits!1 ((_ sign_extend 32) (size!955 (buf!1283 thiss!1379))) ((_ sign_extend 32) (currentByte!2735 thiss!1379)) ((_ sign_extend 32) (currentBit!2730 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41746 () Bool)

(assert (=> b!41746 (= e!27710 (not e!27711))))

(declare-fun res!35507 () Bool)

(assert (=> b!41746 (=> res!35507 e!27711)))

(declare-fun lt!63040 () (_ BitVec 64))

(assert (=> b!41746 (= res!35507 (or (bvslt i!635 to!314) (not (= lt!63040 (bvsub (bvadd lt!63040 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1654 BitStream!1654) Bool)

(assert (=> b!41746 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2961 0))(
  ( (Unit!2962) )
))
(declare-fun lt!63038 () Unit!2961)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1654) Unit!2961)

(assert (=> b!41746 (= lt!63038 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41746 (= lt!63040 (bitIndex!0 (size!955 (buf!1283 thiss!1379)) (currentByte!2735 thiss!1379) (currentBit!2730 thiss!1379)))))

(declare-fun res!35506 () Bool)

(assert (=> start!8362 (=> (not res!35506) (not e!27710))))

(assert (=> start!8362 (= res!35506 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!955 srcBuffer!2))))))))

(assert (=> start!8362 e!27710))

(assert (=> start!8362 true))

(assert (=> start!8362 (array_inv!880 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1654) Bool)

(assert (=> start!8362 (and (inv!12 thiss!1379) e!27715)))

(assert (= (and start!8362 res!35506) b!41745))

(assert (= (and b!41745 res!35508) b!41746))

(assert (= (and b!41746 (not res!35507)) b!41742))

(assert (= (and b!41742 (not res!35504)) b!41741))

(assert (= (and b!41741 (not res!35505)) b!41744))

(assert (= start!8362 b!41743))

(declare-fun m!63493 () Bool)

(assert (=> start!8362 m!63493))

(declare-fun m!63495 () Bool)

(assert (=> start!8362 m!63495))

(declare-fun m!63497 () Bool)

(assert (=> b!41746 m!63497))

(declare-fun m!63499 () Bool)

(assert (=> b!41746 m!63499))

(declare-fun m!63501 () Bool)

(assert (=> b!41746 m!63501))

(declare-fun m!63503 () Bool)

(assert (=> b!41745 m!63503))

(declare-fun m!63505 () Bool)

(assert (=> b!41743 m!63505))

(declare-fun m!63507 () Bool)

(assert (=> b!41741 m!63507))

(declare-fun m!63509 () Bool)

(assert (=> b!41741 m!63509))

(declare-fun m!63511 () Bool)

(assert (=> b!41742 m!63511))

(declare-fun m!63513 () Bool)

(assert (=> b!41744 m!63513))

(push 1)

(assert (not start!8362))

(assert (not b!41741))

(assert (not b!41742))

(assert (not b!41744))

(assert (not b!41745))

(assert (not b!41746))

(assert (not b!41743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

