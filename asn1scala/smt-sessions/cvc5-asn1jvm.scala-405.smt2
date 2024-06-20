; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10416 () Bool)

(assert start!10416)

(declare-fun res!43700 () Bool)

(declare-fun e!34695 () Bool)

(assert (=> start!10416 (=> (not res!43700) (not e!34695))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!2437 0))(
  ( (array!2438 (arr!1649 (Array (_ BitVec 32) (_ BitVec 8))) (size!1113 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2437)

(assert (=> start!10416 (= res!43700 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1113 srcBuffer!2))))))))

(assert (=> start!10416 e!34695))

(assert (=> start!10416 true))

(declare-fun array_inv!1018 (array!2437) Bool)

(assert (=> start!10416 (array_inv!1018 srcBuffer!2)))

(declare-datatypes ((BitStream!1918 0))(
  ( (BitStream!1919 (buf!1463 array!2437) (currentByte!3006 (_ BitVec 32)) (currentBit!3001 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1918)

(declare-fun e!34696 () Bool)

(declare-fun inv!12 (BitStream!1918) Bool)

(assert (=> start!10416 (and (inv!12 thiss!1379) e!34696)))

(declare-fun b!52325 () Bool)

(declare-fun res!43701 () Bool)

(assert (=> b!52325 (=> (not res!43701) (not e!34695))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52325 (= res!43701 (validate_offset_bits!1 ((_ sign_extend 32) (size!1113 (buf!1463 thiss!1379))) ((_ sign_extend 32) (currentByte!3006 thiss!1379)) ((_ sign_extend 32) (currentBit!3001 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52326 () Bool)

(assert (=> b!52326 (= e!34695 (not (or (bvsge i!635 to!314) (let ((bdg!2518 ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and (bvsge bdg!2518 #b00000000000000000000000000000000) (bvslt bdg!2518 (size!1113 srcBuffer!2)))))))))

(declare-fun isPrefixOf!0 (BitStream!1918 BitStream!1918) Bool)

(assert (=> b!52326 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3630 0))(
  ( (Unit!3631) )
))
(declare-fun lt!81351 () Unit!3630)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1918) Unit!3630)

(assert (=> b!52326 (= lt!81351 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81352 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52326 (= lt!81352 (bitIndex!0 (size!1113 (buf!1463 thiss!1379)) (currentByte!3006 thiss!1379) (currentBit!3001 thiss!1379)))))

(declare-fun b!52327 () Bool)

(assert (=> b!52327 (= e!34696 (array_inv!1018 (buf!1463 thiss!1379)))))

(assert (= (and start!10416 res!43700) b!52325))

(assert (= (and b!52325 res!43701) b!52326))

(assert (= start!10416 b!52327))

(declare-fun m!82609 () Bool)

(assert (=> start!10416 m!82609))

(declare-fun m!82611 () Bool)

(assert (=> start!10416 m!82611))

(declare-fun m!82613 () Bool)

(assert (=> b!52325 m!82613))

(declare-fun m!82615 () Bool)

(assert (=> b!52326 m!82615))

(declare-fun m!82617 () Bool)

(assert (=> b!52326 m!82617))

(declare-fun m!82619 () Bool)

(assert (=> b!52326 m!82619))

(declare-fun m!82621 () Bool)

(assert (=> b!52327 m!82621))

(push 1)

(assert (not b!52326))

(assert (not start!10416))

(assert (not b!52327))

(assert (not b!52325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

