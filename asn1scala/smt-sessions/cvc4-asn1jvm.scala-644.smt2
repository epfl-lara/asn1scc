; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18050 () Bool)

(assert start!18050)

(declare-fun b!88787 () Bool)

(declare-fun res!73100 () Bool)

(declare-fun e!58731 () Bool)

(assert (=> b!88787 (=> res!73100 e!58731)))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!88787 (= res!73100 (bvslt i!576 #b00000000000000000000000000000000))))

(declare-fun b!88788 () Bool)

(declare-fun e!58729 () Bool)

(declare-datatypes ((array!4189 0))(
  ( (array!4190 (arr!2528 (Array (_ BitVec 32) (_ BitVec 8))) (size!1891 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3344 0))(
  ( (BitStream!3345 (buf!2281 array!4189) (currentByte!4523 (_ BitVec 32)) (currentBit!4518 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3344)

(declare-fun array_inv!1737 (array!4189) Bool)

(assert (=> b!88788 (= e!58729 (array_inv!1737 (buf!2281 thiss!1151)))))

(declare-fun b!88789 () Bool)

(declare-fun res!73098 () Bool)

(assert (=> b!88789 (=> res!73098 e!58731)))

(declare-fun thiss!1152 () BitStream!3344)

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88789 (= res!73098 (or (bvsgt i!576 nBits!336) (not (= (size!1891 (buf!2281 thiss!1152)) (size!1891 (buf!2281 thiss!1151))))))))

(declare-fun b!88790 () Bool)

(declare-fun res!73097 () Bool)

(assert (=> b!88790 (=> res!73097 e!58731)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88790 (= res!73097 (not (invariant!0 (currentBit!4518 thiss!1152) (currentByte!4523 thiss!1152) (size!1891 (buf!2281 thiss!1152)))))))

(declare-fun b!88791 () Bool)

(declare-fun e!58726 () Bool)

(assert (=> b!88791 (= e!58726 (array_inv!1737 (buf!2281 thiss!1152)))))

(declare-fun b!88792 () Bool)

(assert (=> b!88792 (= e!58731 true)))

(declare-fun b!88793 () Bool)

(declare-fun res!73099 () Bool)

(declare-fun e!58730 () Bool)

(assert (=> b!88793 (=> (not res!73099) (not e!58730))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88793 (= res!73099 (validate_offset_bits!1 ((_ sign_extend 32) (size!1891 (buf!2281 thiss!1151))) ((_ sign_extend 32) (currentByte!4523 thiss!1151)) ((_ sign_extend 32) (currentBit!4518 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun res!73096 () Bool)

(assert (=> start!18050 (=> (not res!73096) (not e!58730))))

(assert (=> start!18050 (= res!73096 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18050 e!58730))

(assert (=> start!18050 true))

(declare-fun inv!12 (BitStream!3344) Bool)

(assert (=> start!18050 (and (inv!12 thiss!1151) e!58729)))

(assert (=> start!18050 (and (inv!12 thiss!1152) e!58726)))

(declare-fun b!88794 () Bool)

(declare-fun res!73101 () Bool)

(assert (=> b!88794 (=> res!73101 e!58731)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88794 (= res!73101 (not (= (bitIndex!0 (size!1891 (buf!2281 thiss!1152)) (currentByte!4523 thiss!1152) (currentBit!4518 thiss!1152)) (bvadd (bitIndex!0 (size!1891 (buf!2281 thiss!1151)) (currentByte!4523 thiss!1151) (currentBit!4518 thiss!1151)) ((_ sign_extend 32) i!576)))))))

(declare-fun b!88795 () Bool)

(assert (=> b!88795 (= e!58730 false)))

(declare-fun lt!136284 () Bool)

(assert (=> b!88795 (= lt!136284 e!58731)))

(declare-fun res!73102 () Bool)

(assert (=> b!88795 (=> res!73102 e!58731)))

(assert (=> b!88795 (= res!73102 (not (invariant!0 (currentBit!4518 thiss!1151) (currentByte!4523 thiss!1151) (size!1891 (buf!2281 thiss!1151)))))))

(assert (= (and start!18050 res!73096) b!88793))

(assert (= (and b!88793 res!73099) b!88795))

(assert (= (and b!88795 (not res!73102)) b!88787))

(assert (= (and b!88787 (not res!73100)) b!88790))

(assert (= (and b!88790 (not res!73097)) b!88789))

(assert (= (and b!88789 (not res!73098)) b!88794))

(assert (= (and b!88794 (not res!73101)) b!88792))

(assert (= start!18050 b!88788))

(assert (= start!18050 b!88791))

(declare-fun m!133841 () Bool)

(assert (=> b!88795 m!133841))

(declare-fun m!133843 () Bool)

(assert (=> b!88793 m!133843))

(declare-fun m!133845 () Bool)

(assert (=> b!88790 m!133845))

(declare-fun m!133847 () Bool)

(assert (=> b!88794 m!133847))

(declare-fun m!133849 () Bool)

(assert (=> b!88794 m!133849))

(declare-fun m!133851 () Bool)

(assert (=> b!88791 m!133851))

(declare-fun m!133853 () Bool)

(assert (=> start!18050 m!133853))

(declare-fun m!133855 () Bool)

(assert (=> start!18050 m!133855))

(declare-fun m!133857 () Bool)

(assert (=> b!88788 m!133857))

(push 1)

(assert (not b!88793))

(assert (not start!18050))

(assert (not b!88794))

(assert (not b!88788))

(assert (not b!88795))

(assert (not b!88791))

(assert (not b!88790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

