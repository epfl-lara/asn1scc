; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10420 () Bool)

(assert start!10420)

(declare-fun res!43712 () Bool)

(declare-fun e!34718 () Bool)

(assert (=> start!10420 (=> (not res!43712) (not e!34718))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!2441 0))(
  ( (array!2442 (arr!1651 (Array (_ BitVec 32) (_ BitVec 8))) (size!1115 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2441)

(assert (=> start!10420 (= res!43712 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1115 srcBuffer!2))))))))

(assert (=> start!10420 e!34718))

(assert (=> start!10420 true))

(declare-fun array_inv!1020 (array!2441) Bool)

(assert (=> start!10420 (array_inv!1020 srcBuffer!2)))

(declare-datatypes ((BitStream!1922 0))(
  ( (BitStream!1923 (buf!1465 array!2441) (currentByte!3008 (_ BitVec 32)) (currentBit!3003 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1922)

(declare-fun e!34719 () Bool)

(declare-fun inv!12 (BitStream!1922) Bool)

(assert (=> start!10420 (and (inv!12 thiss!1379) e!34719)))

(declare-fun b!52343 () Bool)

(declare-fun res!43713 () Bool)

(assert (=> b!52343 (=> (not res!43713) (not e!34718))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52343 (= res!43713 (validate_offset_bits!1 ((_ sign_extend 32) (size!1115 (buf!1465 thiss!1379))) ((_ sign_extend 32) (currentByte!3008 thiss!1379)) ((_ sign_extend 32) (currentBit!3003 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52344 () Bool)

(assert (=> b!52344 (= e!34718 (not (or (bvsge i!635 to!314) (let ((bdg!2518 ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and (bvsge bdg!2518 #b00000000000000000000000000000000) (bvslt bdg!2518 (size!1115 srcBuffer!2)))))))))

(declare-fun isPrefixOf!0 (BitStream!1922 BitStream!1922) Bool)

(assert (=> b!52344 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3634 0))(
  ( (Unit!3635) )
))
(declare-fun lt!81363 () Unit!3634)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1922) Unit!3634)

(assert (=> b!52344 (= lt!81363 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81364 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52344 (= lt!81364 (bitIndex!0 (size!1115 (buf!1465 thiss!1379)) (currentByte!3008 thiss!1379) (currentBit!3003 thiss!1379)))))

(declare-fun b!52345 () Bool)

(assert (=> b!52345 (= e!34719 (array_inv!1020 (buf!1465 thiss!1379)))))

(assert (= (and start!10420 res!43712) b!52343))

(assert (= (and b!52343 res!43713) b!52344))

(assert (= start!10420 b!52345))

(declare-fun m!82637 () Bool)

(assert (=> start!10420 m!82637))

(declare-fun m!82639 () Bool)

(assert (=> start!10420 m!82639))

(declare-fun m!82641 () Bool)

(assert (=> b!52343 m!82641))

(declare-fun m!82643 () Bool)

(assert (=> b!52344 m!82643))

(declare-fun m!82645 () Bool)

(assert (=> b!52344 m!82645))

(declare-fun m!82647 () Bool)

(assert (=> b!52344 m!82647))

(declare-fun m!82649 () Bool)

(assert (=> b!52345 m!82649))

(push 1)

(assert (not b!52345))

(assert (not b!52344))

(assert (not start!10420))

(assert (not b!52343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

