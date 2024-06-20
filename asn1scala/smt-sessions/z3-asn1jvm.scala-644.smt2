; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18048 () Bool)

(assert start!18048)

(declare-fun b!88760 () Bool)

(declare-fun e!58709 () Bool)

(declare-datatypes ((array!4187 0))(
  ( (array!4188 (arr!2527 (Array (_ BitVec 32) (_ BitVec 8))) (size!1890 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3342 0))(
  ( (BitStream!3343 (buf!2280 array!4187) (currentByte!4522 (_ BitVec 32)) (currentBit!4517 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3342)

(declare-fun array_inv!1736 (array!4187) Bool)

(assert (=> b!88760 (= e!58709 (array_inv!1736 (buf!2280 thiss!1152)))))

(declare-fun b!88761 () Bool)

(declare-fun res!73080 () Bool)

(declare-fun e!58712 () Bool)

(assert (=> b!88761 (=> (not res!73080) (not e!58712))))

(declare-fun thiss!1151 () BitStream!3342)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88761 (= res!73080 (validate_offset_bits!1 ((_ sign_extend 32) (size!1890 (buf!2280 thiss!1151))) ((_ sign_extend 32) (currentByte!4522 thiss!1151)) ((_ sign_extend 32) (currentBit!4517 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88762 () Bool)

(assert (=> b!88762 (= e!58712 false)))

(declare-fun lt!136281 () Bool)

(declare-fun e!58710 () Bool)

(assert (=> b!88762 (= lt!136281 e!58710)))

(declare-fun res!73077 () Bool)

(assert (=> b!88762 (=> res!73077 e!58710)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88762 (= res!73077 (not (invariant!0 (currentBit!4517 thiss!1151) (currentByte!4522 thiss!1151) (size!1890 (buf!2280 thiss!1151)))))))

(declare-fun res!73081 () Bool)

(assert (=> start!18048 (=> (not res!73081) (not e!58712))))

(assert (=> start!18048 (= res!73081 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18048 e!58712))

(assert (=> start!18048 true))

(declare-fun e!58713 () Bool)

(declare-fun inv!12 (BitStream!3342) Bool)

(assert (=> start!18048 (and (inv!12 thiss!1151) e!58713)))

(assert (=> start!18048 (and (inv!12 thiss!1152) e!58709)))

(declare-fun b!88763 () Bool)

(declare-fun res!73075 () Bool)

(assert (=> b!88763 (=> res!73075 e!58710)))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!88763 (= res!73075 (bvslt i!576 #b00000000000000000000000000000000))))

(declare-fun b!88764 () Bool)

(assert (=> b!88764 (= e!58713 (array_inv!1736 (buf!2280 thiss!1151)))))

(declare-fun b!88765 () Bool)

(declare-fun res!73078 () Bool)

(assert (=> b!88765 (=> res!73078 e!58710)))

(assert (=> b!88765 (= res!73078 (or (bvsgt i!576 nBits!336) (not (= (size!1890 (buf!2280 thiss!1152)) (size!1890 (buf!2280 thiss!1151))))))))

(declare-fun b!88766 () Bool)

(declare-fun res!73076 () Bool)

(assert (=> b!88766 (=> res!73076 e!58710)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88766 (= res!73076 (not (= (bitIndex!0 (size!1890 (buf!2280 thiss!1152)) (currentByte!4522 thiss!1152) (currentBit!4517 thiss!1152)) (bvadd (bitIndex!0 (size!1890 (buf!2280 thiss!1151)) (currentByte!4522 thiss!1151) (currentBit!4517 thiss!1151)) ((_ sign_extend 32) i!576)))))))

(declare-fun b!88767 () Bool)

(declare-fun res!73079 () Bool)

(assert (=> b!88767 (=> res!73079 e!58710)))

(assert (=> b!88767 (= res!73079 (not (invariant!0 (currentBit!4517 thiss!1152) (currentByte!4522 thiss!1152) (size!1890 (buf!2280 thiss!1152)))))))

(declare-fun b!88768 () Bool)

(assert (=> b!88768 (= e!58710 true)))

(assert (= (and start!18048 res!73081) b!88761))

(assert (= (and b!88761 res!73080) b!88762))

(assert (= (and b!88762 (not res!73077)) b!88763))

(assert (= (and b!88763 (not res!73075)) b!88767))

(assert (= (and b!88767 (not res!73079)) b!88765))

(assert (= (and b!88765 (not res!73078)) b!88766))

(assert (= (and b!88766 (not res!73076)) b!88768))

(assert (= start!18048 b!88764))

(assert (= start!18048 b!88760))

(declare-fun m!133823 () Bool)

(assert (=> start!18048 m!133823))

(declare-fun m!133825 () Bool)

(assert (=> start!18048 m!133825))

(declare-fun m!133827 () Bool)

(assert (=> b!88760 m!133827))

(declare-fun m!133829 () Bool)

(assert (=> b!88761 m!133829))

(declare-fun m!133831 () Bool)

(assert (=> b!88766 m!133831))

(declare-fun m!133833 () Bool)

(assert (=> b!88766 m!133833))

(declare-fun m!133835 () Bool)

(assert (=> b!88764 m!133835))

(declare-fun m!133837 () Bool)

(assert (=> b!88767 m!133837))

(declare-fun m!133839 () Bool)

(assert (=> b!88762 m!133839))

(check-sat (not start!18048) (not b!88766) (not b!88761) (not b!88760) (not b!88767) (not b!88764) (not b!88762))
