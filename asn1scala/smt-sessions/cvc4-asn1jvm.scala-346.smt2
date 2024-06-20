; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8192 () Bool)

(assert start!8192)

(declare-fun res!34881 () Bool)

(declare-fun e!27076 () Bool)

(assert (=> start!8192 (=> (not res!34881) (not e!27076))))

(declare-datatypes ((array!2040 0))(
  ( (array!2041 (arr!1420 (Array (_ BitVec 32) (_ BitVec 8))) (size!921 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2040)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8192 (= res!34881 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!921 srcBuffer!2))))))))

(assert (=> start!8192 e!27076))

(assert (=> start!8192 true))

(declare-fun array_inv!846 (array!2040) Bool)

(assert (=> start!8192 (array_inv!846 srcBuffer!2)))

(declare-datatypes ((BitStream!1586 0))(
  ( (BitStream!1587 (buf!1249 array!2040) (currentByte!2683 (_ BitVec 32)) (currentBit!2678 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1586)

(declare-fun e!27073 () Bool)

(declare-fun inv!12 (BitStream!1586) Bool)

(assert (=> start!8192 (and (inv!12 thiss!1379) e!27073)))

(declare-fun b!40979 () Bool)

(declare-fun res!34880 () Bool)

(assert (=> b!40979 (=> (not res!34880) (not e!27076))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40979 (= res!34880 (validate_offset_bits!1 ((_ sign_extend 32) (size!921 (buf!1249 thiss!1379))) ((_ sign_extend 32) (currentByte!2683 thiss!1379)) ((_ sign_extend 32) (currentBit!2678 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40980 () Bool)

(assert (=> b!40980 (= e!27076 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1586 BitStream!1586) Bool)

(assert (=> b!40980 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2887 0))(
  ( (Unit!2888) )
))
(declare-fun lt!62167 () Unit!2887)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1586) Unit!2887)

(assert (=> b!40980 (= lt!62167 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62166 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40980 (= lt!62166 (bitIndex!0 (size!921 (buf!1249 thiss!1379)) (currentByte!2683 thiss!1379) (currentBit!2678 thiss!1379)))))

(declare-fun b!40981 () Bool)

(assert (=> b!40981 (= e!27073 (array_inv!846 (buf!1249 thiss!1379)))))

(assert (= (and start!8192 res!34881) b!40979))

(assert (= (and b!40979 res!34880) b!40980))

(assert (= start!8192 b!40981))

(declare-fun m!62615 () Bool)

(assert (=> start!8192 m!62615))

(declare-fun m!62617 () Bool)

(assert (=> start!8192 m!62617))

(declare-fun m!62619 () Bool)

(assert (=> b!40979 m!62619))

(declare-fun m!62621 () Bool)

(assert (=> b!40980 m!62621))

(declare-fun m!62623 () Bool)

(assert (=> b!40980 m!62623))

(declare-fun m!62625 () Bool)

(assert (=> b!40980 m!62625))

(declare-fun m!62627 () Bool)

(assert (=> b!40981 m!62627))

(push 1)

(assert (not b!40979))

(assert (not b!40980))

(assert (not start!8192))

(assert (not b!40981))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

