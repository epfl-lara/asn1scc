; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10432 () Bool)

(assert start!10432)

(declare-fun res!43749 () Bool)

(declare-fun e!34790 () Bool)

(assert (=> start!10432 (=> (not res!43749) (not e!34790))))

(declare-datatypes ((array!2453 0))(
  ( (array!2454 (arr!1657 (Array (_ BitVec 32) (_ BitVec 8))) (size!1121 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2453)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10432 (= res!43749 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1121 srcBuffer!2))))))))

(assert (=> start!10432 e!34790))

(assert (=> start!10432 true))

(declare-fun array_inv!1026 (array!2453) Bool)

(assert (=> start!10432 (array_inv!1026 srcBuffer!2)))

(declare-datatypes ((BitStream!1934 0))(
  ( (BitStream!1935 (buf!1471 array!2453) (currentByte!3014 (_ BitVec 32)) (currentBit!3009 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1934)

(declare-fun e!34791 () Bool)

(declare-fun inv!12 (BitStream!1934) Bool)

(assert (=> start!10432 (and (inv!12 thiss!1379) e!34791)))

(declare-fun b!52397 () Bool)

(declare-fun res!43748 () Bool)

(assert (=> b!52397 (=> (not res!43748) (not e!34790))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52397 (= res!43748 (validate_offset_bits!1 ((_ sign_extend 32) (size!1121 (buf!1471 thiss!1379))) ((_ sign_extend 32) (currentByte!3014 thiss!1379)) ((_ sign_extend 32) (currentBit!3009 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52398 () Bool)

(assert (=> b!52398 (= e!34790 (not (or (bvsge i!635 to!314) (bvslt (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1934 BitStream!1934) Bool)

(assert (=> b!52398 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3646 0))(
  ( (Unit!3647) )
))
(declare-fun lt!81399 () Unit!3646)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1934) Unit!3646)

(assert (=> b!52398 (= lt!81399 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81400 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52398 (= lt!81400 (bitIndex!0 (size!1121 (buf!1471 thiss!1379)) (currentByte!3014 thiss!1379) (currentBit!3009 thiss!1379)))))

(declare-fun b!52399 () Bool)

(assert (=> b!52399 (= e!34791 (array_inv!1026 (buf!1471 thiss!1379)))))

(assert (= (and start!10432 res!43749) b!52397))

(assert (= (and b!52397 res!43748) b!52398))

(assert (= start!10432 b!52399))

(declare-fun m!82721 () Bool)

(assert (=> start!10432 m!82721))

(declare-fun m!82723 () Bool)

(assert (=> start!10432 m!82723))

(declare-fun m!82725 () Bool)

(assert (=> b!52397 m!82725))

(declare-fun m!82727 () Bool)

(assert (=> b!52398 m!82727))

(declare-fun m!82729 () Bool)

(assert (=> b!52398 m!82729))

(declare-fun m!82731 () Bool)

(assert (=> b!52398 m!82731))

(declare-fun m!82733 () Bool)

(assert (=> b!52399 m!82733))

(push 1)

(assert (not b!52398))

(assert (not start!10432))

(assert (not b!52399))

(assert (not b!52397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

