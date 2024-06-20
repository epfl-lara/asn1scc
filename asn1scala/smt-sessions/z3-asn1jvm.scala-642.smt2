; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18036 () Bool)

(assert start!18036)

(declare-fun b!88589 () Bool)

(declare-fun res!72946 () Bool)

(declare-fun e!58613 () Bool)

(assert (=> b!88589 (=> (not res!72946) (not e!58613))))

(declare-datatypes ((array!4175 0))(
  ( (array!4176 (arr!2521 (Array (_ BitVec 32) (_ BitVec 8))) (size!1884 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3330 0))(
  ( (BitStream!3331 (buf!2274 array!4175) (currentByte!4516 (_ BitVec 32)) (currentBit!4511 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3330)

(declare-fun thiss!1151 () BitStream!3330)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88589 (= res!72946 (and (bvsle i!576 nBits!336) (= (size!1884 (buf!2274 thiss!1152)) (size!1884 (buf!2274 thiss!1151)))))))

(declare-fun b!88590 () Bool)

(declare-fun res!72944 () Bool)

(assert (=> b!88590 (=> (not res!72944) (not e!58613))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88590 (= res!72944 (= (bitIndex!0 (size!1884 (buf!2274 thiss!1152)) (currentByte!4516 thiss!1152) (currentBit!4511 thiss!1152)) (bvadd (bitIndex!0 (size!1884 (buf!2274 thiss!1151)) (currentByte!4516 thiss!1151) (currentBit!4511 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!88591 () Bool)

(declare-fun res!72941 () Bool)

(assert (=> b!88591 (=> (not res!72941) (not e!58613))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88591 (= res!72941 (invariant!0 (currentBit!4511 thiss!1151) (currentByte!4516 thiss!1151) (size!1884 (buf!2274 thiss!1151))))))

(declare-fun b!88592 () Bool)

(assert (=> b!88592 (= e!58613 (and (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand i!576 #b10000000000000000000000000000000))) (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 i!576) #b10000000000000000000000000000000)))))))

(declare-fun b!88593 () Bool)

(declare-fun res!72943 () Bool)

(assert (=> b!88593 (=> (not res!72943) (not e!58613))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88593 (= res!72943 (validate_offset_bits!1 ((_ sign_extend 32) (size!1884 (buf!2274 thiss!1151))) ((_ sign_extend 32) (currentByte!4516 thiss!1151)) ((_ sign_extend 32) (currentBit!4511 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88594 () Bool)

(declare-fun e!58614 () Bool)

(declare-fun array_inv!1730 (array!4175) Bool)

(assert (=> b!88594 (= e!58614 (array_inv!1730 (buf!2274 thiss!1151)))))

(declare-fun res!72945 () Bool)

(assert (=> start!18036 (=> (not res!72945) (not e!58613))))

(assert (=> start!18036 (= res!72945 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18036 e!58613))

(assert (=> start!18036 true))

(declare-fun inv!12 (BitStream!3330) Bool)

(assert (=> start!18036 (and (inv!12 thiss!1151) e!58614)))

(declare-fun e!58617 () Bool)

(assert (=> start!18036 (and (inv!12 thiss!1152) e!58617)))

(declare-fun b!88595 () Bool)

(declare-fun res!72940 () Bool)

(assert (=> b!88595 (=> (not res!72940) (not e!58613))))

(assert (=> b!88595 (= res!72940 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88596 () Bool)

(assert (=> b!88596 (= e!58617 (array_inv!1730 (buf!2274 thiss!1152)))))

(declare-fun b!88597 () Bool)

(declare-fun res!72942 () Bool)

(assert (=> b!88597 (=> (not res!72942) (not e!58613))))

(assert (=> b!88597 (= res!72942 (invariant!0 (currentBit!4511 thiss!1152) (currentByte!4516 thiss!1152) (size!1884 (buf!2274 thiss!1152))))))

(assert (= (and start!18036 res!72945) b!88593))

(assert (= (and b!88593 res!72943) b!88591))

(assert (= (and b!88591 res!72941) b!88595))

(assert (= (and b!88595 res!72940) b!88597))

(assert (= (and b!88597 res!72942) b!88589))

(assert (= (and b!88589 res!72946) b!88590))

(assert (= (and b!88590 res!72944) b!88592))

(assert (= start!18036 b!88594))

(assert (= start!18036 b!88596))

(declare-fun m!133709 () Bool)

(assert (=> b!88597 m!133709))

(declare-fun m!133711 () Bool)

(assert (=> b!88590 m!133711))

(declare-fun m!133713 () Bool)

(assert (=> b!88590 m!133713))

(declare-fun m!133715 () Bool)

(assert (=> b!88596 m!133715))

(declare-fun m!133717 () Bool)

(assert (=> b!88594 m!133717))

(declare-fun m!133719 () Bool)

(assert (=> start!18036 m!133719))

(declare-fun m!133721 () Bool)

(assert (=> start!18036 m!133721))

(declare-fun m!133723 () Bool)

(assert (=> b!88593 m!133723))

(declare-fun m!133725 () Bool)

(assert (=> b!88591 m!133725))

(check-sat (not b!88596) (not b!88597) (not start!18036) (not b!88594) (not b!88590) (not b!88591) (not b!88593))
(check-sat)
