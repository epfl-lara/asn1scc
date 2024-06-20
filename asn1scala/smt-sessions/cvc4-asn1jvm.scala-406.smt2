; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10426 () Bool)

(assert start!10426)

(declare-fun res!43731 () Bool)

(declare-fun e!34757 () Bool)

(assert (=> start!10426 (=> (not res!43731) (not e!34757))))

(declare-datatypes ((array!2447 0))(
  ( (array!2448 (arr!1654 (Array (_ BitVec 32) (_ BitVec 8))) (size!1118 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2447)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10426 (= res!43731 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1118 srcBuffer!2))))))))

(assert (=> start!10426 e!34757))

(assert (=> start!10426 true))

(declare-fun array_inv!1023 (array!2447) Bool)

(assert (=> start!10426 (array_inv!1023 srcBuffer!2)))

(declare-datatypes ((BitStream!1928 0))(
  ( (BitStream!1929 (buf!1468 array!2447) (currentByte!3011 (_ BitVec 32)) (currentBit!3006 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1928)

(declare-fun e!34754 () Bool)

(declare-fun inv!12 (BitStream!1928) Bool)

(assert (=> start!10426 (and (inv!12 thiss!1379) e!34754)))

(declare-fun b!52370 () Bool)

(declare-fun res!43730 () Bool)

(assert (=> b!52370 (=> (not res!43730) (not e!34757))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52370 (= res!43730 (validate_offset_bits!1 ((_ sign_extend 32) (size!1118 (buf!1468 thiss!1379))) ((_ sign_extend 32) (currentByte!3011 thiss!1379)) ((_ sign_extend 32) (currentBit!3006 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52371 () Bool)

(assert (=> b!52371 (= e!34757 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1928 BitStream!1928) Bool)

(assert (=> b!52371 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3640 0))(
  ( (Unit!3641) )
))
(declare-fun lt!81381 () Unit!3640)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1928) Unit!3640)

(assert (=> b!52371 (= lt!81381 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81382 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52371 (= lt!81382 (bitIndex!0 (size!1118 (buf!1468 thiss!1379)) (currentByte!3011 thiss!1379) (currentBit!3006 thiss!1379)))))

(declare-fun b!52372 () Bool)

(assert (=> b!52372 (= e!34754 (array_inv!1023 (buf!1468 thiss!1379)))))

(assert (= (and start!10426 res!43731) b!52370))

(assert (= (and b!52370 res!43730) b!52371))

(assert (= start!10426 b!52372))

(declare-fun m!82679 () Bool)

(assert (=> start!10426 m!82679))

(declare-fun m!82681 () Bool)

(assert (=> start!10426 m!82681))

(declare-fun m!82683 () Bool)

(assert (=> b!52370 m!82683))

(declare-fun m!82685 () Bool)

(assert (=> b!52371 m!82685))

(declare-fun m!82687 () Bool)

(assert (=> b!52371 m!82687))

(declare-fun m!82689 () Bool)

(assert (=> b!52371 m!82689))

(declare-fun m!82691 () Bool)

(assert (=> b!52372 m!82691))

(push 1)

(assert (not b!52370))

(assert (not b!52372))

(assert (not b!52371))

(assert (not start!10426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

