; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18046 () Bool)

(assert start!18046)

(declare-fun b!88733 () Bool)

(declare-fun e!58691 () Bool)

(assert (=> b!88733 (= e!58691 true)))

(declare-fun b!88734 () Bool)

(declare-fun e!58692 () Bool)

(assert (=> b!88734 (= e!58692 false)))

(declare-fun lt!136278 () Bool)

(assert (=> b!88734 (= lt!136278 e!58691)))

(declare-fun res!73057 () Bool)

(assert (=> b!88734 (=> res!73057 e!58691)))

(declare-datatypes ((array!4185 0))(
  ( (array!4186 (arr!2526 (Array (_ BitVec 32) (_ BitVec 8))) (size!1889 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3340 0))(
  ( (BitStream!3341 (buf!2279 array!4185) (currentByte!4521 (_ BitVec 32)) (currentBit!4516 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3340)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88734 (= res!73057 (not (invariant!0 (currentBit!4516 thiss!1151) (currentByte!4521 thiss!1151) (size!1889 (buf!2279 thiss!1151)))))))

(declare-fun b!88735 () Bool)

(declare-fun res!73054 () Bool)

(assert (=> b!88735 (=> res!73054 e!58691)))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!88735 (= res!73054 (bvslt i!576 #b00000000000000000000000000000000))))

(declare-fun res!73055 () Bool)

(assert (=> start!18046 (=> (not res!73055) (not e!58692))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!18046 (= res!73055 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18046 e!58692))

(assert (=> start!18046 true))

(declare-fun e!58693 () Bool)

(declare-fun inv!12 (BitStream!3340) Bool)

(assert (=> start!18046 (and (inv!12 thiss!1151) e!58693)))

(declare-fun thiss!1152 () BitStream!3340)

(declare-fun e!58695 () Bool)

(assert (=> start!18046 (and (inv!12 thiss!1152) e!58695)))

(declare-fun b!88736 () Bool)

(declare-fun res!73056 () Bool)

(assert (=> b!88736 (=> res!73056 e!58691)))

(assert (=> b!88736 (= res!73056 (or (bvsgt i!576 nBits!336) (not (= (size!1889 (buf!2279 thiss!1152)) (size!1889 (buf!2279 thiss!1151))))))))

(declare-fun b!88737 () Bool)

(declare-fun res!73058 () Bool)

(assert (=> b!88737 (=> res!73058 e!58691)))

(assert (=> b!88737 (= res!73058 (not (invariant!0 (currentBit!4516 thiss!1152) (currentByte!4521 thiss!1152) (size!1889 (buf!2279 thiss!1152)))))))

(declare-fun b!88738 () Bool)

(declare-fun array_inv!1735 (array!4185) Bool)

(assert (=> b!88738 (= e!58693 (array_inv!1735 (buf!2279 thiss!1151)))))

(declare-fun b!88739 () Bool)

(declare-fun res!73059 () Bool)

(assert (=> b!88739 (=> (not res!73059) (not e!58692))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88739 (= res!73059 (validate_offset_bits!1 ((_ sign_extend 32) (size!1889 (buf!2279 thiss!1151))) ((_ sign_extend 32) (currentByte!4521 thiss!1151)) ((_ sign_extend 32) (currentBit!4516 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88740 () Bool)

(assert (=> b!88740 (= e!58695 (array_inv!1735 (buf!2279 thiss!1152)))))

(declare-fun b!88741 () Bool)

(declare-fun res!73060 () Bool)

(assert (=> b!88741 (=> res!73060 e!58691)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88741 (= res!73060 (not (= (bitIndex!0 (size!1889 (buf!2279 thiss!1152)) (currentByte!4521 thiss!1152) (currentBit!4516 thiss!1152)) (bvadd (bitIndex!0 (size!1889 (buf!2279 thiss!1151)) (currentByte!4521 thiss!1151) (currentBit!4516 thiss!1151)) ((_ sign_extend 32) i!576)))))))

(assert (= (and start!18046 res!73055) b!88739))

(assert (= (and b!88739 res!73059) b!88734))

(assert (= (and b!88734 (not res!73057)) b!88735))

(assert (= (and b!88735 (not res!73054)) b!88737))

(assert (= (and b!88737 (not res!73058)) b!88736))

(assert (= (and b!88736 (not res!73056)) b!88741))

(assert (= (and b!88741 (not res!73060)) b!88733))

(assert (= start!18046 b!88738))

(assert (= start!18046 b!88740))

(declare-fun m!133805 () Bool)

(assert (=> b!88734 m!133805))

(declare-fun m!133807 () Bool)

(assert (=> b!88739 m!133807))

(declare-fun m!133809 () Bool)

(assert (=> b!88738 m!133809))

(declare-fun m!133811 () Bool)

(assert (=> b!88737 m!133811))

(declare-fun m!133813 () Bool)

(assert (=> b!88740 m!133813))

(declare-fun m!133815 () Bool)

(assert (=> start!18046 m!133815))

(declare-fun m!133817 () Bool)

(assert (=> start!18046 m!133817))

(declare-fun m!133819 () Bool)

(assert (=> b!88741 m!133819))

(declare-fun m!133821 () Bool)

(assert (=> b!88741 m!133821))

(push 1)

(assert (not b!88740))

(assert (not b!88741))

(assert (not b!88734))

(assert (not b!88739))

(assert (not start!18046))

(assert (not b!88737))

(assert (not b!88738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

