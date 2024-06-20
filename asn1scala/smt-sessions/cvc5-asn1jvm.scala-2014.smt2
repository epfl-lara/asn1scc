; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51520 () Bool)

(assert start!51520)

(declare-fun res!199902 () Bool)

(declare-fun e!165579 () Bool)

(assert (=> start!51520 (=> (not res!199902) (not e!165579))))

(declare-datatypes ((array!12906 0))(
  ( (array!12907 (arr!6649 (Array (_ BitVec 32) (_ BitVec 8))) (size!5662 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10246 0))(
  ( (BitStream!10247 (buf!6116 array!12906) (currentByte!11365 (_ BitVec 32)) (currentBit!11360 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10246)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51520 (= res!199902 (validate_offset_bits!1 ((_ sign_extend 32) (size!5662 (buf!6116 thiss!1854))) ((_ sign_extend 32) (currentByte!11365 thiss!1854)) ((_ sign_extend 32) (currentBit!11360 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51520 e!165579))

(declare-fun e!165581 () Bool)

(declare-fun inv!12 (BitStream!10246) Bool)

(assert (=> start!51520 (and (inv!12 thiss!1854) e!165581)))

(declare-fun b!239296 () Bool)

(declare-fun lt!374013 () (_ BitVec 32))

(assert (=> b!239296 (= e!165579 (and (bvslt lt!374013 #b00000000000000000000000010000000) (bvslt lt!374013 #b11111111111111111111111110000000)))))

(assert (=> b!239296 (= lt!374013 (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11360 thiss!1854)))))))

(declare-fun b!239297 () Bool)

(declare-fun array_inv!5403 (array!12906) Bool)

(assert (=> b!239297 (= e!165581 (array_inv!5403 (buf!6116 thiss!1854)))))

(assert (= (and start!51520 res!199902) b!239296))

(assert (= start!51520 b!239297))

(declare-fun m!361429 () Bool)

(assert (=> start!51520 m!361429))

(declare-fun m!361431 () Bool)

(assert (=> start!51520 m!361431))

(declare-fun m!361433 () Bool)

(assert (=> b!239297 m!361433))

(push 1)

(assert (not b!239297))

(assert (not start!51520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

