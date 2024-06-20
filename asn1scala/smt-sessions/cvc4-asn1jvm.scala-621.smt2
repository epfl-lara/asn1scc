; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17630 () Bool)

(assert start!17630)

(declare-fun b!85001 () Bool)

(declare-fun e!56669 () Bool)

(declare-datatypes ((array!4033 0))(
  ( (array!4034 (arr!2459 (Array (_ BitVec 32) (_ BitVec 8))) (size!1822 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3206 0))(
  ( (BitStream!3207 (buf!2212 array!4033) (currentByte!4400 (_ BitVec 32)) (currentBit!4395 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3206)

(assert (=> b!85001 (= e!56669 (or (bvsgt ((_ sign_extend 32) (size!1822 (buf!2212 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4400 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4395 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!85002 () Bool)

(declare-fun res!69746 () Bool)

(assert (=> b!85002 (=> (not res!69746) (not e!56669))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85002 (= res!69746 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85003 () Bool)

(declare-fun res!69745 () Bool)

(assert (=> b!85003 (=> (not res!69745) (not e!56669))))

(declare-fun thiss!1151 () BitStream!3206)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85003 (= res!69745 (validate_offset_bits!1 ((_ sign_extend 32) (size!1822 (buf!2212 thiss!1151))) ((_ sign_extend 32) (currentByte!4400 thiss!1151)) ((_ sign_extend 32) (currentBit!4395 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85004 () Bool)

(declare-fun res!69748 () Bool)

(assert (=> b!85004 (=> (not res!69748) (not e!56669))))

(assert (=> b!85004 (= res!69748 (and (bvsle i!576 nBits!336) (= (size!1822 (buf!2212 thiss!1152)) (size!1822 (buf!2212 thiss!1151)))))))

(declare-fun b!85005 () Bool)

(declare-fun e!56670 () Bool)

(declare-fun array_inv!1668 (array!4033) Bool)

(assert (=> b!85005 (= e!56670 (array_inv!1668 (buf!2212 thiss!1152)))))

(declare-fun res!69744 () Bool)

(assert (=> start!17630 (=> (not res!69744) (not e!56669))))

(assert (=> start!17630 (= res!69744 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17630 e!56669))

(assert (=> start!17630 true))

(declare-fun e!56672 () Bool)

(declare-fun inv!12 (BitStream!3206) Bool)

(assert (=> start!17630 (and (inv!12 thiss!1151) e!56672)))

(assert (=> start!17630 (and (inv!12 thiss!1152) e!56670)))

(declare-fun b!85006 () Bool)

(assert (=> b!85006 (= e!56672 (array_inv!1668 (buf!2212 thiss!1151)))))

(declare-fun b!85007 () Bool)

(declare-fun res!69747 () Bool)

(assert (=> b!85007 (=> (not res!69747) (not e!56669))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85007 (= res!69747 (invariant!0 (currentBit!4395 thiss!1151) (currentByte!4400 thiss!1151) (size!1822 (buf!2212 thiss!1151))))))

(declare-fun b!85008 () Bool)

(declare-fun res!69742 () Bool)

(assert (=> b!85008 (=> (not res!69742) (not e!56669))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85008 (= res!69742 (= (bitIndex!0 (size!1822 (buf!2212 thiss!1152)) (currentByte!4400 thiss!1152) (currentBit!4395 thiss!1152)) (bvadd (bitIndex!0 (size!1822 (buf!2212 thiss!1151)) (currentByte!4400 thiss!1151) (currentBit!4395 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!85009 () Bool)

(declare-fun res!69743 () Bool)

(assert (=> b!85009 (=> (not res!69743) (not e!56669))))

(assert (=> b!85009 (= res!69743 (invariant!0 (currentBit!4395 thiss!1152) (currentByte!4400 thiss!1152) (size!1822 (buf!2212 thiss!1152))))))

(assert (= (and start!17630 res!69744) b!85003))

(assert (= (and b!85003 res!69745) b!85007))

(assert (= (and b!85007 res!69747) b!85002))

(assert (= (and b!85002 res!69746) b!85009))

(assert (= (and b!85009 res!69743) b!85004))

(assert (= (and b!85004 res!69748) b!85008))

(assert (= (and b!85008 res!69742) b!85001))

(assert (= start!17630 b!85006))

(assert (= start!17630 b!85005))

(declare-fun m!131321 () Bool)

(assert (=> b!85008 m!131321))

(declare-fun m!131323 () Bool)

(assert (=> b!85008 m!131323))

(declare-fun m!131325 () Bool)

(assert (=> start!17630 m!131325))

(declare-fun m!131327 () Bool)

(assert (=> start!17630 m!131327))

(declare-fun m!131329 () Bool)

(assert (=> b!85005 m!131329))

(declare-fun m!131331 () Bool)

(assert (=> b!85003 m!131331))

(declare-fun m!131333 () Bool)

(assert (=> b!85006 m!131333))

(declare-fun m!131335 () Bool)

(assert (=> b!85009 m!131335))

(declare-fun m!131337 () Bool)

(assert (=> b!85007 m!131337))

(push 1)

(assert (not b!85008))

(assert (not b!85009))

(assert (not start!17630))

(assert (not b!85005))

(assert (not b!85007))

(assert (not b!85003))

(assert (not b!85006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

