; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63724 () Bool)

(assert start!63724)

(declare-fun res!235310 () Bool)

(declare-fun e!203022 () Bool)

(assert (=> start!63724 (=> (not res!235310) (not e!203022))))

(declare-datatypes ((array!16615 0))(
  ( (array!16616 (arr!8166 (Array (_ BitVec 32) (_ BitVec 8))) (size!7170 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12710 0))(
  ( (BitStream!12711 (buf!7416 array!16615) (currentByte!13750 (_ BitVec 32)) (currentBit!13745 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12710)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63724 (= res!235310 (validate_offset_bits!1 ((_ sign_extend 32) (size!7170 (buf!7416 thiss!1929))) ((_ sign_extend 32) (currentByte!13750 thiss!1929)) ((_ sign_extend 32) (currentBit!13745 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13745 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63724 e!203022))

(declare-fun e!203021 () Bool)

(declare-fun inv!12 (BitStream!12710) Bool)

(assert (=> start!63724 (and (inv!12 thiss!1929) e!203021)))

(declare-fun b!284035 () Bool)

(declare-fun res!235309 () Bool)

(assert (=> b!284035 (=> (not res!235309) (not e!203022))))

(assert (=> b!284035 (= res!235309 (not (= (currentBit!13745 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284036 () Bool)

(assert (=> b!284036 (= e!203022 (not (inv!12 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000))))))

(declare-fun b!284037 () Bool)

(declare-fun array_inv!6863 (array!16615) Bool)

(assert (=> b!284037 (= e!203021 (array_inv!6863 (buf!7416 thiss!1929)))))

(assert (= (and start!63724 res!235310) b!284035))

(assert (= (and b!284035 res!235309) b!284036))

(assert (= start!63724 b!284037))

(declare-fun m!417175 () Bool)

(assert (=> start!63724 m!417175))

(declare-fun m!417177 () Bool)

(assert (=> start!63724 m!417177))

(declare-fun m!417179 () Bool)

(assert (=> b!284036 m!417179))

(declare-fun m!417181 () Bool)

(assert (=> b!284037 m!417181))

(push 1)

(assert (not start!63724))

(assert (not b!284037))

(assert (not b!284036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97674 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97674 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7170 (buf!7416 thiss!1929))) ((_ sign_extend 32) (currentByte!13750 thiss!1929)) ((_ sign_extend 32) (currentBit!13745 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13745 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7170 (buf!7416 thiss!1929))) ((_ sign_extend 32) (currentByte!13750 thiss!1929)) ((_ sign_extend 32) (currentBit!13745 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13745 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24684 () Bool)

(assert (= bs!24684 d!97674))

(declare-fun m!417183 () Bool)

(assert (=> bs!24684 m!417183))

(assert (=> start!63724 d!97674))

(declare-fun d!97680 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97680 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13745 thiss!1929) (currentByte!13750 thiss!1929) (size!7170 (buf!7416 thiss!1929))))))

(declare-fun bs!24686 () Bool)

(assert (= bs!24686 d!97680))

(declare-fun m!417187 () Bool)

(assert (=> bs!24686 m!417187))

(assert (=> start!63724 d!97680))

(declare-fun d!97684 () Bool)

(assert (=> d!97684 (= (array_inv!6863 (buf!7416 thiss!1929)) (bvsge (size!7170 (buf!7416 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284037 d!97684))

(declare-fun d!97686 () Bool)

(assert (=> d!97686 (= (inv!12 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) (invariant!0 (currentBit!13745 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) (currentByte!13750 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) (size!7170 (buf!7416 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)))))))

(declare-fun bs!24688 () Bool)

(assert (= bs!24688 d!97686))

(declare-fun m!417191 () Bool)

(assert (=> bs!24688 m!417191))

(assert (=> b!284036 d!97686))

(push 1)

(assert (not d!97686))

(assert (not d!97680))

(assert (not d!97674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97706 () Bool)

(assert (=> d!97706 (= (invariant!0 (currentBit!13745 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) (currentByte!13750 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) (size!7170 (buf!7416 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!13745 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!13745 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!13750 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13750 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) (size!7170 (buf!7416 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)))) (and (= (currentBit!13745 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!13750 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000)) (size!7170 (buf!7416 (BitStream!12711 (buf!7416 thiss!1929) (currentByte!13750 thiss!1929) #b00000000000000000000000000000000))))))))))

