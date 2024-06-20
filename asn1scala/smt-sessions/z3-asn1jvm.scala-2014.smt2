; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51522 () Bool)

(assert start!51522)

(declare-fun res!199905 () Bool)

(declare-fun e!165589 () Bool)

(assert (=> start!51522 (=> (not res!199905) (not e!165589))))

(declare-datatypes ((array!12908 0))(
  ( (array!12909 (arr!6650 (Array (_ BitVec 32) (_ BitVec 8))) (size!5663 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10248 0))(
  ( (BitStream!10249 (buf!6117 array!12908) (currentByte!11366 (_ BitVec 32)) (currentBit!11361 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10248)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51522 (= res!199905 (validate_offset_bits!1 ((_ sign_extend 32) (size!5663 (buf!6117 thiss!1854))) ((_ sign_extend 32) (currentByte!11366 thiss!1854)) ((_ sign_extend 32) (currentBit!11361 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51522 e!165589))

(declare-fun e!165590 () Bool)

(declare-fun inv!12 (BitStream!10248) Bool)

(assert (=> start!51522 (and (inv!12 thiss!1854) e!165590)))

(declare-fun b!239302 () Bool)

(declare-fun lt!374016 () (_ BitVec 32))

(assert (=> b!239302 (= e!165589 (and (bvslt lt!374016 #b00000000000000000000000010000000) (bvslt lt!374016 #b11111111111111111111111110000000)))))

(assert (=> b!239302 (= lt!374016 (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11361 thiss!1854)))))))

(declare-fun b!239303 () Bool)

(declare-fun array_inv!5404 (array!12908) Bool)

(assert (=> b!239303 (= e!165590 (array_inv!5404 (buf!6117 thiss!1854)))))

(assert (= (and start!51522 res!199905) b!239302))

(assert (= start!51522 b!239303))

(declare-fun m!361435 () Bool)

(assert (=> start!51522 m!361435))

(declare-fun m!361437 () Bool)

(assert (=> start!51522 m!361437))

(declare-fun m!361439 () Bool)

(assert (=> b!239303 m!361439))

(check-sat (not start!51522) (not b!239303))
(check-sat)
