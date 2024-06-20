; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31780 () Bool)

(assert start!31780)

(declare-fun res!132427 () Bool)

(declare-fun e!107865 () Bool)

(assert (=> start!31780 (=> (not res!132427) (not e!107865))))

(declare-datatypes ((array!7404 0))(
  ( (array!7405 (arr!4281 (Array (_ BitVec 32) (_ BitVec 8))) (size!3360 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5888 0))(
  ( (BitStream!5889 (buf!3818 array!7404) (currentByte!7010 (_ BitVec 32)) (currentBit!7005 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5888)

(declare-fun buf!77 () array!7404)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31780 (= res!132427 (and (= (size!3360 (buf!3818 b1!99)) (size!3360 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31780 e!107865))

(declare-fun e!107862 () Bool)

(declare-fun inv!12 (BitStream!5888) Bool)

(assert (=> start!31780 (and (inv!12 b1!99) e!107862)))

(declare-fun array_inv!3107 (array!7404) Bool)

(assert (=> start!31780 (array_inv!3107 buf!77)))

(assert (=> start!31780 true))

(declare-fun b!158557 () Bool)

(declare-fun res!132428 () Bool)

(assert (=> b!158557 (=> (not res!132428) (not e!107865))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158557 (= res!132428 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3360 (buf!3818 b1!99))) ((_ sign_extend 32) (currentByte!7010 b1!99)) ((_ sign_extend 32) (currentBit!7005 b1!99)) bytes!14))))

(declare-fun b!158558 () Bool)

(assert (=> b!158558 (= e!107865 (and (bvsle ((_ sign_extend 32) (size!3360 buf!77)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7010 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7005 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3360 buf!77)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7010 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7005 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!158559 () Bool)

(assert (=> b!158559 (= e!107862 (array_inv!3107 (buf!3818 b1!99)))))

(assert (= (and start!31780 res!132427) b!158557))

(assert (= (and b!158557 res!132428) b!158558))

(assert (= start!31780 b!158559))

(declare-fun m!249045 () Bool)

(assert (=> start!31780 m!249045))

(declare-fun m!249047 () Bool)

(assert (=> start!31780 m!249047))

(declare-fun m!249049 () Bool)

(assert (=> b!158557 m!249049))

(declare-fun m!249051 () Bool)

(assert (=> b!158559 m!249051))

(push 1)

(assert (not b!158557))

(assert (not b!158559))

(assert (not start!31780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53197 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53197 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3360 (buf!3818 b1!99))) ((_ sign_extend 32) (currentByte!7010 b1!99)) ((_ sign_extend 32) (currentBit!7005 b1!99)) bytes!14) (bvsle ((_ sign_extend 32) bytes!14) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3360 (buf!3818 b1!99))) ((_ sign_extend 32) (currentByte!7010 b1!99)) ((_ sign_extend 32) (currentBit!7005 b1!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13119 () Bool)

(assert (= bs!13119 d!53197))

(declare-fun m!249061 () Bool)

(assert (=> bs!13119 m!249061))

(assert (=> b!158557 d!53197))

(declare-fun d!53201 () Bool)

(assert (=> d!53201 (= (array_inv!3107 (buf!3818 b1!99)) (bvsge (size!3360 (buf!3818 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158559 d!53201))

(declare-fun d!53203 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53203 (= (inv!12 b1!99) (invariant!0 (currentBit!7005 b1!99) (currentByte!7010 b1!99) (size!3360 (buf!3818 b1!99))))))

(declare-fun bs!13120 () Bool)

(assert (= bs!13120 d!53203))

(declare-fun m!249063 () Bool)

(assert (=> bs!13120 m!249063))

(assert (=> start!31780 d!53203))

(declare-fun d!53205 () Bool)

(assert (=> d!53205 (= (array_inv!3107 buf!77) (bvsge (size!3360 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31780 d!53205))

(push 1)

(assert (not d!53203))

(assert (not d!53197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

