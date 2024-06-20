; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63602 () Bool)

(assert start!63602)

(declare-fun res!235244 () Bool)

(declare-fun e!202905 () Bool)

(assert (=> start!63602 (=> (not res!235244) (not e!202905))))

(declare-datatypes ((array!16575 0))(
  ( (array!16576 (arr!8152 (Array (_ BitVec 32) (_ BitVec 8))) (size!7156 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12682 0))(
  ( (BitStream!12683 (buf!7402 array!16575) (currentByte!13716 (_ BitVec 32)) (currentBit!13711 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12682)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63602 (= res!235244 (validate_offset_bits!1 ((_ sign_extend 32) (size!7156 (buf!7402 thiss!1929))) ((_ sign_extend 32) (currentByte!13716 thiss!1929)) ((_ sign_extend 32) (currentBit!13711 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13711 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63602 e!202905))

(declare-fun e!202904 () Bool)

(declare-fun inv!12 (BitStream!12682) Bool)

(assert (=> start!63602 (and (inv!12 thiss!1929) e!202904)))

(declare-fun b!283927 () Bool)

(declare-fun res!235243 () Bool)

(assert (=> b!283927 (=> (not res!235243) (not e!202905))))

(assert (=> b!283927 (= res!235243 (not (= (currentBit!13711 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!283928 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283928 (= e!202905 (not (invariant!0 (currentBit!13711 thiss!1929) (currentByte!13716 thiss!1929) (size!7156 (buf!7402 thiss!1929)))))))

(declare-fun b!283929 () Bool)

(declare-fun array_inv!6849 (array!16575) Bool)

(assert (=> b!283929 (= e!202904 (array_inv!6849 (buf!7402 thiss!1929)))))

(assert (= (and start!63602 res!235244) b!283927))

(assert (= (and b!283927 res!235243) b!283928))

(assert (= start!63602 b!283929))

(declare-fun m!417051 () Bool)

(assert (=> start!63602 m!417051))

(declare-fun m!417053 () Bool)

(assert (=> start!63602 m!417053))

(declare-fun m!417055 () Bool)

(assert (=> b!283928 m!417055))

(declare-fun m!417057 () Bool)

(assert (=> b!283929 m!417057))

(push 1)

(assert (not start!63602))

(assert (not b!283929))

(assert (not b!283928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97576 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97576 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7156 (buf!7402 thiss!1929))) ((_ sign_extend 32) (currentByte!13716 thiss!1929)) ((_ sign_extend 32) (currentBit!13711 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13711 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7156 (buf!7402 thiss!1929))) ((_ sign_extend 32) (currentByte!13716 thiss!1929)) ((_ sign_extend 32) (currentBit!13711 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13711 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24649 () Bool)

(assert (= bs!24649 d!97576))

(declare-fun m!417075 () Bool)

(assert (=> bs!24649 m!417075))

(assert (=> start!63602 d!97576))

(declare-fun d!97578 () Bool)

(assert (=> d!97578 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13711 thiss!1929) (currentByte!13716 thiss!1929) (size!7156 (buf!7402 thiss!1929))))))

(declare-fun bs!24650 () Bool)

(assert (= bs!24650 d!97578))

(assert (=> bs!24650 m!417055))

(assert (=> start!63602 d!97578))

(declare-fun d!97580 () Bool)

(assert (=> d!97580 (= (array_inv!6849 (buf!7402 thiss!1929)) (bvsge (size!7156 (buf!7402 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283929 d!97580))

(declare-fun d!97582 () Bool)

(assert (=> d!97582 (= (invariant!0 (currentBit!13711 thiss!1929) (currentByte!13716 thiss!1929) (size!7156 (buf!7402 thiss!1929))) (and (bvsge (currentBit!13711 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13711 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13716 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13716 thiss!1929) (size!7156 (buf!7402 thiss!1929))) (and (= (currentBit!13711 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13716 thiss!1929) (size!7156 (buf!7402 thiss!1929)))))))))

(assert (=> b!283928 d!97582))

(push 1)

(assert (not d!97576))

(assert (not d!97578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

