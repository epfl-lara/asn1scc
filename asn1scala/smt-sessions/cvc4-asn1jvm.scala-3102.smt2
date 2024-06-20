; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71444 () Bool)

(assert start!71444)

(declare-fun res!263968 () Bool)

(declare-fun e!231589 () Bool)

(assert (=> start!71444 (=> (not res!263968) (not e!231589))))

(declare-datatypes ((array!20409 0))(
  ( (array!20410 (arr!9978 (Array (_ BitVec 32) (_ BitVec 8))) (size!8886 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13934 0))(
  ( (BitStream!13935 (buf!8028 array!20409) (currentByte!14813 (_ BitVec 32)) (currentBit!14808 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13934)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!71444 (= res!263968 (validate_offset_bit!0 ((_ sign_extend 32) (size!8886 (buf!8028 thiss!1701))) ((_ sign_extend 32) (currentByte!14813 thiss!1701)) ((_ sign_extend 32) (currentBit!14808 thiss!1701))))))

(assert (=> start!71444 e!231589))

(declare-fun e!231590 () Bool)

(declare-fun inv!12 (BitStream!13934) Bool)

(assert (=> start!71444 (and (inv!12 thiss!1701) e!231590)))

(declare-fun b!321504 () Bool)

(assert (=> b!321504 (= e!231589 (or (bvslt (currentBit!14808 thiss!1701) #b00000000000000000000000000000000) (bvsge (currentBit!14808 thiss!1701) #b00000000000000000000000000001000)))))

(declare-fun b!321505 () Bool)

(declare-fun array_inv!8438 (array!20409) Bool)

(assert (=> b!321505 (= e!231590 (array_inv!8438 (buf!8028 thiss!1701)))))

(assert (= (and start!71444 res!263968) b!321504))

(assert (= start!71444 b!321505))

(declare-fun m!459853 () Bool)

(assert (=> start!71444 m!459853))

(declare-fun m!459855 () Bool)

(assert (=> start!71444 m!459855))

(declare-fun m!459857 () Bool)

(assert (=> b!321505 m!459857))

(push 1)

(assert (not start!71444))

(assert (not b!321505))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105446 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105446 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8886 (buf!8028 thiss!1701))) ((_ sign_extend 32) (currentByte!14813 thiss!1701)) ((_ sign_extend 32) (currentBit!14808 thiss!1701))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8886 (buf!8028 thiss!1701))) ((_ sign_extend 32) (currentByte!14813 thiss!1701)) ((_ sign_extend 32) (currentBit!14808 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27740 () Bool)

(assert (= bs!27740 d!105446))

(declare-fun m!459865 () Bool)

(assert (=> bs!27740 m!459865))

(assert (=> start!71444 d!105446))

(declare-fun d!105448 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105448 (= (inv!12 thiss!1701) (invariant!0 (currentBit!14808 thiss!1701) (currentByte!14813 thiss!1701) (size!8886 (buf!8028 thiss!1701))))))

(declare-fun bs!27742 () Bool)

(assert (= bs!27742 d!105448))

(declare-fun m!459869 () Bool)

(assert (=> bs!27742 m!459869))

(assert (=> start!71444 d!105448))

(declare-fun d!105452 () Bool)

(assert (=> d!105452 (= (array_inv!8438 (buf!8028 thiss!1701)) (bvsge (size!8886 (buf!8028 thiss!1701)) #b00000000000000000000000000000000))))

(assert (=> b!321505 d!105452))

(push 1)

(assert (not d!105446))

(assert (not d!105448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

