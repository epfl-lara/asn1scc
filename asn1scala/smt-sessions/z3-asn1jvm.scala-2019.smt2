; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51672 () Bool)

(assert start!51672)

(declare-fun res!199950 () Bool)

(declare-fun e!165725 () Bool)

(assert (=> start!51672 (=> (not res!199950) (not e!165725))))

(declare-datatypes ((array!12950 0))(
  ( (array!12951 (arr!6665 (Array (_ BitVec 32) (_ BitVec 8))) (size!5678 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10278 0))(
  ( (BitStream!10279 (buf!6132 array!12950) (currentByte!11417 (_ BitVec 32)) (currentBit!11412 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10278)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51672 (= res!199950 (validate_offset_bits!1 ((_ sign_extend 32) (size!5678 (buf!6132 thiss!1854))) ((_ sign_extend 32) (currentByte!11417 thiss!1854)) ((_ sign_extend 32) (currentBit!11412 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51672 e!165725))

(declare-fun e!165724 () Bool)

(declare-fun inv!12 (BitStream!10278) Bool)

(assert (=> start!51672 (and (inv!12 thiss!1854) e!165724)))

(declare-fun b!239392 () Bool)

(declare-fun lt!374025 () (_ BitVec 32))

(assert (=> b!239392 (= e!165725 (and (bvsgt lt!374025 #b00000000000000000000000000000000) (bvsgt ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!374025))) #b00000000000000000000000000100000)))))

(assert (=> b!239392 (= lt!374025 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11412 thiss!1854))))))

(declare-fun b!239393 () Bool)

(declare-fun array_inv!5419 (array!12950) Bool)

(assert (=> b!239393 (= e!165724 (array_inv!5419 (buf!6132 thiss!1854)))))

(assert (= (and start!51672 res!199950) b!239392))

(assert (= start!51672 b!239393))

(declare-fun m!361585 () Bool)

(assert (=> start!51672 m!361585))

(declare-fun m!361587 () Bool)

(assert (=> start!51672 m!361587))

(declare-fun m!361589 () Bool)

(assert (=> b!239393 m!361589))

(check-sat (not b!239393) (not start!51672))
(check-sat)
