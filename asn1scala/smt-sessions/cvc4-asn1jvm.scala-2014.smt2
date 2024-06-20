; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51524 () Bool)

(assert start!51524)

(declare-fun res!199908 () Bool)

(declare-fun e!165597 () Bool)

(assert (=> start!51524 (=> (not res!199908) (not e!165597))))

(declare-datatypes ((array!12910 0))(
  ( (array!12911 (arr!6651 (Array (_ BitVec 32) (_ BitVec 8))) (size!5664 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10250 0))(
  ( (BitStream!10251 (buf!6118 array!12910) (currentByte!11367 (_ BitVec 32)) (currentBit!11362 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10250)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51524 (= res!199908 (validate_offset_bits!1 ((_ sign_extend 32) (size!5664 (buf!6118 thiss!1854))) ((_ sign_extend 32) (currentByte!11367 thiss!1854)) ((_ sign_extend 32) (currentBit!11362 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51524 e!165597))

(declare-fun e!165598 () Bool)

(declare-fun inv!12 (BitStream!10250) Bool)

(assert (=> start!51524 (and (inv!12 thiss!1854) e!165598)))

(declare-fun b!239308 () Bool)

(declare-fun lt!374019 () (_ BitVec 32))

(assert (=> b!239308 (= e!165597 (and (bvslt lt!374019 #b00000000000000000000000010000000) (bvslt lt!374019 #b11111111111111111111111110000000)))))

(assert (=> b!239308 (= lt!374019 (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11362 thiss!1854)))))))

(declare-fun b!239309 () Bool)

(declare-fun array_inv!5405 (array!12910) Bool)

(assert (=> b!239309 (= e!165598 (array_inv!5405 (buf!6118 thiss!1854)))))

(assert (= (and start!51524 res!199908) b!239308))

(assert (= start!51524 b!239309))

(declare-fun m!361441 () Bool)

(assert (=> start!51524 m!361441))

(declare-fun m!361443 () Bool)

(assert (=> start!51524 m!361443))

(declare-fun m!361445 () Bool)

(assert (=> b!239309 m!361445))

(push 1)

(assert (not start!51524))

(assert (not b!239309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

