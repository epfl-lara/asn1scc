; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8380 () Bool)

(assert start!8380)

(declare-fun b!41903 () Bool)

(declare-fun e!27877 () Bool)

(assert (=> b!41903 (= e!27877 true)))

(declare-datatypes ((array!2132 0))(
  ( (array!2133 (arr!1463 (Array (_ BitVec 32) (_ BitVec 8))) (size!964 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2132)

(declare-datatypes ((BitStream!1672 0))(
  ( (BitStream!1673 (buf!1292 array!2132) (currentByte!2744 (_ BitVec 32)) (currentBit!2739 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1672)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!4078 0))(
  ( (tuple2!4079 (_1!2129 array!2132) (_2!2129 BitStream!1672)) )
))
(declare-fun lt!63120 () tuple2!4078)

(declare-fun checkByteArrayBitContent!0 (BitStream!1672 array!2132 array!2132 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41903 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2129 lt!63120) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41904 () Bool)

(declare-fun res!35642 () Bool)

(declare-fun e!27876 () Bool)

(assert (=> b!41904 (=> (not res!35642) (not e!27876))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41904 (= res!35642 (validate_offset_bits!1 ((_ sign_extend 32) (size!964 (buf!1292 thiss!1379))) ((_ sign_extend 32) (currentByte!2744 thiss!1379)) ((_ sign_extend 32) (currentBit!2739 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41905 () Bool)

(declare-fun res!35641 () Bool)

(declare-fun e!27873 () Bool)

(assert (=> b!41905 (=> res!35641 e!27873)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41905 (= res!35641 (not (invariant!0 (currentBit!2739 thiss!1379) (currentByte!2744 thiss!1379) (size!964 (buf!1292 thiss!1379)))))))

(declare-fun b!41906 () Bool)

(assert (=> b!41906 (= e!27876 (not e!27873))))

(declare-fun res!35643 () Bool)

(assert (=> b!41906 (=> res!35643 e!27873)))

(declare-fun lt!63121 () (_ BitVec 64))

(assert (=> b!41906 (= res!35643 (or (bvslt i!635 to!314) (not (= lt!63121 (bvsub (bvadd lt!63121 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1672 BitStream!1672) Bool)

(assert (=> b!41906 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2979 0))(
  ( (Unit!2980) )
))
(declare-fun lt!63119 () Unit!2979)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1672) Unit!2979)

(assert (=> b!41906 (= lt!63119 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41906 (= lt!63121 (bitIndex!0 (size!964 (buf!1292 thiss!1379)) (currentByte!2744 thiss!1379) (currentBit!2739 thiss!1379)))))

(declare-fun b!41907 () Bool)

(declare-fun e!27875 () Bool)

(declare-fun array_inv!889 (array!2132) Bool)

(assert (=> b!41907 (= e!27875 (array_inv!889 (buf!1292 thiss!1379)))))

(declare-fun res!35639 () Bool)

(assert (=> start!8380 (=> (not res!35639) (not e!27876))))

(assert (=> start!8380 (= res!35639 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!964 srcBuffer!2))))))))

(assert (=> start!8380 e!27876))

(assert (=> start!8380 true))

(assert (=> start!8380 (array_inv!889 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1672) Bool)

(assert (=> start!8380 (and (inv!12 thiss!1379) e!27875)))

(declare-fun b!41908 () Bool)

(assert (=> b!41908 (= e!27873 e!27877)))

(declare-fun res!35640 () Bool)

(assert (=> b!41908 (=> res!35640 e!27877)))

(assert (=> b!41908 (= res!35640 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1672 (_ BitVec 64)) tuple2!4078)

(declare-datatypes ((tuple2!4080 0))(
  ( (tuple2!4081 (_1!2130 BitStream!1672) (_2!2130 BitStream!1672)) )
))
(declare-fun reader!0 (BitStream!1672 BitStream!1672) tuple2!4080)

(assert (=> b!41908 (= lt!63120 (readBits!0 (_1!2130 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8380 res!35639) b!41904))

(assert (= (and b!41904 res!35642) b!41906))

(assert (= (and b!41906 (not res!35643)) b!41905))

(assert (= (and b!41905 (not res!35641)) b!41908))

(assert (= (and b!41908 (not res!35640)) b!41903))

(assert (= start!8380 b!41907))

(declare-fun m!63691 () Bool)

(assert (=> b!41903 m!63691))

(declare-fun m!63693 () Bool)

(assert (=> start!8380 m!63693))

(declare-fun m!63695 () Bool)

(assert (=> start!8380 m!63695))

(declare-fun m!63697 () Bool)

(assert (=> b!41907 m!63697))

(declare-fun m!63699 () Bool)

(assert (=> b!41908 m!63699))

(declare-fun m!63701 () Bool)

(assert (=> b!41908 m!63701))

(declare-fun m!63703 () Bool)

(assert (=> b!41905 m!63703))

(declare-fun m!63705 () Bool)

(assert (=> b!41906 m!63705))

(declare-fun m!63707 () Bool)

(assert (=> b!41906 m!63707))

(declare-fun m!63709 () Bool)

(assert (=> b!41906 m!63709))

(declare-fun m!63711 () Bool)

(assert (=> b!41904 m!63711))

(push 1)

(assert (not b!41904))

(assert (not b!41905))

(assert (not b!41906))

(assert (not b!41908))

(assert (not b!41903))

(assert (not b!41907))

(assert (not start!8380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

