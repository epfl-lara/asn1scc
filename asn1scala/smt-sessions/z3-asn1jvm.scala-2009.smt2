; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51378 () Bool)

(assert start!51378)

(declare-fun res!199860 () Bool)

(declare-fun e!165453 () Bool)

(assert (=> start!51378 (=> (not res!199860) (not e!165453))))

(declare-datatypes ((array!12866 0))(
  ( (array!12867 (arr!6635 (Array (_ BitVec 32) (_ BitVec 8))) (size!5648 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10218 0))(
  ( (BitStream!10219 (buf!6102 array!12866) (currentByte!11318 (_ BitVec 32)) (currentBit!11313 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10218)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51378 (= res!199860 (validate_offset_bits!1 ((_ sign_extend 32) (size!5648 (buf!6102 thiss!1854))) ((_ sign_extend 32) (currentByte!11318 thiss!1854)) ((_ sign_extend 32) (currentBit!11313 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51378 e!165453))

(declare-fun e!165454 () Bool)

(declare-fun inv!12 (BitStream!10218) Bool)

(assert (=> start!51378 (and (inv!12 thiss!1854) e!165454)))

(declare-fun b!239212 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239212 (= e!165453 (not (invariant!0 (currentBit!11313 thiss!1854) (currentByte!11318 thiss!1854) (size!5648 (buf!6102 thiss!1854)))))))

(declare-fun b!239213 () Bool)

(declare-fun array_inv!5389 (array!12866) Bool)

(assert (=> b!239213 (= e!165454 (array_inv!5389 (buf!6102 thiss!1854)))))

(assert (= (and start!51378 res!199860) b!239212))

(assert (= start!51378 b!239213))

(declare-fun m!361299 () Bool)

(assert (=> start!51378 m!361299))

(declare-fun m!361301 () Bool)

(assert (=> start!51378 m!361301))

(declare-fun m!361303 () Bool)

(assert (=> b!239212 m!361303))

(declare-fun m!361305 () Bool)

(assert (=> b!239213 m!361305))

(check-sat (not start!51378) (not b!239213) (not b!239212))
(check-sat)
(get-model)

(declare-fun d!80558 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80558 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5648 (buf!6102 thiss!1854))) ((_ sign_extend 32) (currentByte!11318 thiss!1854)) ((_ sign_extend 32) (currentBit!11313 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5648 (buf!6102 thiss!1854))) ((_ sign_extend 32) (currentByte!11318 thiss!1854)) ((_ sign_extend 32) (currentBit!11313 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

