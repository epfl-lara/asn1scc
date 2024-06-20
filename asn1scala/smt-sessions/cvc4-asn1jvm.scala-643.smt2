; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18044 () Bool)

(assert start!18044)

(declare-fun b!88705 () Bool)

(declare-fun res!73034 () Bool)

(declare-fun e!58677 () Bool)

(assert (=> b!88705 (=> (not res!73034) (not e!58677))))

(declare-datatypes ((array!4183 0))(
  ( (array!4184 (arr!2525 (Array (_ BitVec 32) (_ BitVec 8))) (size!1888 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3338 0))(
  ( (BitStream!3339 (buf!2278 array!4183) (currentByte!4520 (_ BitVec 32)) (currentBit!4515 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3338)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88705 (= res!73034 (invariant!0 (currentBit!4515 thiss!1151) (currentByte!4520 thiss!1151) (size!1888 (buf!2278 thiss!1151))))))

(declare-fun res!73033 () Bool)

(assert (=> start!18044 (=> (not res!73033) (not e!58677))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!18044 (= res!73033 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18044 e!58677))

(assert (=> start!18044 true))

(declare-fun e!58674 () Bool)

(declare-fun inv!12 (BitStream!3338) Bool)

(assert (=> start!18044 (and (inv!12 thiss!1151) e!58674)))

(declare-fun thiss!1152 () BitStream!3338)

(declare-fun e!58675 () Bool)

(assert (=> start!18044 (and (inv!12 thiss!1152) e!58675)))

(declare-fun b!88706 () Bool)

(declare-fun array_inv!1734 (array!4183) Bool)

(assert (=> b!88706 (= e!58675 (array_inv!1734 (buf!2278 thiss!1152)))))

(declare-fun b!88707 () Bool)

(declare-fun res!73038 () Bool)

(assert (=> b!88707 (=> (not res!73038) (not e!58677))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88707 (= res!73038 (validate_offset_bits!1 ((_ sign_extend 32) (size!1888 (buf!2278 thiss!1152))) ((_ sign_extend 32) (currentByte!4520 thiss!1152)) ((_ sign_extend 32) (currentBit!4515 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88708 () Bool)

(declare-fun res!73036 () Bool)

(assert (=> b!88708 (=> (not res!73036) (not e!58677))))

(assert (=> b!88708 (= res!73036 (and (bvsle i!576 nBits!336) (= (size!1888 (buf!2278 thiss!1152)) (size!1888 (buf!2278 thiss!1151)))))))

(declare-fun b!88709 () Bool)

(declare-fun res!73039 () Bool)

(assert (=> b!88709 (=> (not res!73039) (not e!58677))))

(assert (=> b!88709 (= res!73039 (validate_offset_bits!1 ((_ sign_extend 32) (size!1888 (buf!2278 thiss!1151))) ((_ sign_extend 32) (currentByte!4520 thiss!1151)) ((_ sign_extend 32) (currentBit!4515 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88710 () Bool)

(assert (=> b!88710 (= e!58677 (and (bvslt i!576 nBits!336) (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand i!576 #b10000000000000000000000000000000))) (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 i!576) #b10000000000000000000000000000000)))))))

(declare-fun b!88711 () Bool)

(assert (=> b!88711 (= e!58674 (array_inv!1734 (buf!2278 thiss!1151)))))

(declare-fun b!88712 () Bool)

(declare-fun res!73037 () Bool)

(assert (=> b!88712 (=> (not res!73037) (not e!58677))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88712 (= res!73037 (= (bitIndex!0 (size!1888 (buf!2278 thiss!1152)) (currentByte!4520 thiss!1152) (currentBit!4515 thiss!1152)) (bvadd (bitIndex!0 (size!1888 (buf!2278 thiss!1151)) (currentByte!4520 thiss!1151) (currentBit!4515 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!88713 () Bool)

(declare-fun res!73035 () Bool)

(assert (=> b!88713 (=> (not res!73035) (not e!58677))))

(assert (=> b!88713 (= res!73035 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88714 () Bool)

(declare-fun res!73032 () Bool)

(assert (=> b!88714 (=> (not res!73032) (not e!58677))))

(assert (=> b!88714 (= res!73032 (invariant!0 (currentBit!4515 thiss!1152) (currentByte!4520 thiss!1152) (size!1888 (buf!2278 thiss!1152))))))

(assert (= (and start!18044 res!73033) b!88709))

(assert (= (and b!88709 res!73039) b!88705))

(assert (= (and b!88705 res!73034) b!88713))

(assert (= (and b!88713 res!73035) b!88714))

(assert (= (and b!88714 res!73032) b!88708))

(assert (= (and b!88708 res!73036) b!88712))

(assert (= (and b!88712 res!73037) b!88707))

(assert (= (and b!88707 res!73038) b!88710))

(assert (= start!18044 b!88711))

(assert (= start!18044 b!88706))

(declare-fun m!133785 () Bool)

(assert (=> b!88712 m!133785))

(declare-fun m!133787 () Bool)

(assert (=> b!88712 m!133787))

(declare-fun m!133789 () Bool)

(assert (=> b!88707 m!133789))

(declare-fun m!133791 () Bool)

(assert (=> b!88711 m!133791))

(declare-fun m!133793 () Bool)

(assert (=> b!88706 m!133793))

(declare-fun m!133795 () Bool)

(assert (=> b!88714 m!133795))

(declare-fun m!133797 () Bool)

(assert (=> b!88705 m!133797))

(declare-fun m!133799 () Bool)

(assert (=> start!18044 m!133799))

(declare-fun m!133801 () Bool)

(assert (=> start!18044 m!133801))

(declare-fun m!133803 () Bool)

(assert (=> b!88709 m!133803))

(push 1)

(assert (not start!18044))

(assert (not b!88712))

(assert (not b!88706))

(assert (not b!88709))

(assert (not b!88714))

(assert (not b!88705))

(assert (not b!88711))

(assert (not b!88707))

(check-sat)

(pop 1)

(push 1)

(check-sat)

