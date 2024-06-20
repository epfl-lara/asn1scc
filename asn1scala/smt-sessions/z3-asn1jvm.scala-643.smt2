; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18042 () Bool)

(assert start!18042)

(declare-fun b!88675 () Bool)

(declare-fun res!73008 () Bool)

(declare-fun e!58658 () Bool)

(assert (=> b!88675 (=> (not res!73008) (not e!58658))))

(declare-datatypes ((array!4181 0))(
  ( (array!4182 (arr!2524 (Array (_ BitVec 32) (_ BitVec 8))) (size!1887 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3336 0))(
  ( (BitStream!3337 (buf!2277 array!4181) (currentByte!4519 (_ BitVec 32)) (currentBit!4514 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3336)

(declare-fun thiss!1151 () BitStream!3336)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88675 (= res!73008 (and (bvsle i!576 nBits!336) (= (size!1887 (buf!2277 thiss!1152)) (size!1887 (buf!2277 thiss!1151)))))))

(declare-fun b!88676 () Bool)

(declare-fun res!73010 () Bool)

(assert (=> b!88676 (=> (not res!73010) (not e!58658))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88676 (= res!73010 (invariant!0 (currentBit!4514 thiss!1151) (currentByte!4519 thiss!1151) (size!1887 (buf!2277 thiss!1151))))))

(declare-fun b!88677 () Bool)

(declare-fun res!73013 () Bool)

(assert (=> b!88677 (=> (not res!73013) (not e!58658))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88677 (= res!73013 (validate_offset_bits!1 ((_ sign_extend 32) (size!1887 (buf!2277 thiss!1151))) ((_ sign_extend 32) (currentByte!4519 thiss!1151)) ((_ sign_extend 32) (currentBit!4514 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88678 () Bool)

(declare-fun res!73011 () Bool)

(assert (=> b!88678 (=> (not res!73011) (not e!58658))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88678 (= res!73011 (= (bitIndex!0 (size!1887 (buf!2277 thiss!1152)) (currentByte!4519 thiss!1152) (currentBit!4514 thiss!1152)) (bvadd (bitIndex!0 (size!1887 (buf!2277 thiss!1151)) (currentByte!4519 thiss!1151) (currentBit!4514 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!88679 () Bool)

(declare-fun res!73014 () Bool)

(assert (=> b!88679 (=> (not res!73014) (not e!58658))))

(assert (=> b!88679 (= res!73014 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88680 () Bool)

(declare-fun e!58659 () Bool)

(declare-fun array_inv!1733 (array!4181) Bool)

(assert (=> b!88680 (= e!58659 (array_inv!1733 (buf!2277 thiss!1151)))))

(declare-fun b!88681 () Bool)

(declare-fun e!58661 () Bool)

(assert (=> b!88681 (= e!58661 (array_inv!1733 (buf!2277 thiss!1152)))))

(declare-fun res!73012 () Bool)

(assert (=> start!18042 (=> (not res!73012) (not e!58658))))

(assert (=> start!18042 (= res!73012 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18042 e!58658))

(assert (=> start!18042 true))

(declare-fun inv!12 (BitStream!3336) Bool)

(assert (=> start!18042 (and (inv!12 thiss!1151) e!58659)))

(assert (=> start!18042 (and (inv!12 thiss!1152) e!58661)))

(declare-fun b!88682 () Bool)

(assert (=> b!88682 (= e!58658 (and (bvslt i!576 nBits!336) (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand i!576 #b10000000000000000000000000000000))) (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 i!576) #b10000000000000000000000000000000)))))))

(declare-fun b!88683 () Bool)

(declare-fun res!73009 () Bool)

(assert (=> b!88683 (=> (not res!73009) (not e!58658))))

(assert (=> b!88683 (= res!73009 (validate_offset_bits!1 ((_ sign_extend 32) (size!1887 (buf!2277 thiss!1152))) ((_ sign_extend 32) (currentByte!4519 thiss!1152)) ((_ sign_extend 32) (currentBit!4514 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88684 () Bool)

(declare-fun res!73015 () Bool)

(assert (=> b!88684 (=> (not res!73015) (not e!58658))))

(assert (=> b!88684 (= res!73015 (invariant!0 (currentBit!4514 thiss!1152) (currentByte!4519 thiss!1152) (size!1887 (buf!2277 thiss!1152))))))

(assert (= (and start!18042 res!73012) b!88677))

(assert (= (and b!88677 res!73013) b!88676))

(assert (= (and b!88676 res!73010) b!88679))

(assert (= (and b!88679 res!73014) b!88684))

(assert (= (and b!88684 res!73015) b!88675))

(assert (= (and b!88675 res!73008) b!88678))

(assert (= (and b!88678 res!73011) b!88683))

(assert (= (and b!88683 res!73009) b!88682))

(assert (= start!18042 b!88680))

(assert (= start!18042 b!88681))

(declare-fun m!133765 () Bool)

(assert (=> b!88677 m!133765))

(declare-fun m!133767 () Bool)

(assert (=> b!88680 m!133767))

(declare-fun m!133769 () Bool)

(assert (=> b!88676 m!133769))

(declare-fun m!133771 () Bool)

(assert (=> b!88678 m!133771))

(declare-fun m!133773 () Bool)

(assert (=> b!88678 m!133773))

(declare-fun m!133775 () Bool)

(assert (=> b!88683 m!133775))

(declare-fun m!133777 () Bool)

(assert (=> b!88684 m!133777))

(declare-fun m!133779 () Bool)

(assert (=> b!88681 m!133779))

(declare-fun m!133781 () Bool)

(assert (=> start!18042 m!133781))

(declare-fun m!133783 () Bool)

(assert (=> start!18042 m!133783))

(check-sat (not b!88680) (not start!18042) (not b!88683) (not b!88684) (not b!88681) (not b!88676) (not b!88678) (not b!88677))
(check-sat)
