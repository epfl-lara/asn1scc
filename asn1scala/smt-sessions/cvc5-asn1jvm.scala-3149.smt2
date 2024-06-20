; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72302 () Bool)

(assert start!72302)

(declare-datatypes ((array!20707 0))(
  ( (array!20708 (arr!10105 (Array (_ BitVec 32) (_ BitVec 8))) (size!9013 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14188 0))(
  ( (BitStream!14189 (buf!8155 array!20707) (currentByte!15047 (_ BitVec 32)) (currentBit!15042 (_ BitVec 32))) )
))
(declare-fun thiss!1711 () BitStream!14188)

(assert (=> start!72302 (and (bvsle ((_ sign_extend 32) (size!9013 (buf!8155 thiss!1711))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15047 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15042 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9013 (buf!8155 thiss!1711))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15047 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15042 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!233378 () Bool)

(declare-fun inv!12 (BitStream!14188) Bool)

(assert (=> start!72302 (and (inv!12 thiss!1711) e!233378)))

(declare-fun b!323977 () Bool)

(declare-fun array_inv!8565 (array!20707) Bool)

(assert (=> b!323977 (= e!233378 (array_inv!8565 (buf!8155 thiss!1711)))))

(assert (= start!72302 b!323977))

(declare-fun m!462027 () Bool)

(assert (=> start!72302 m!462027))

(declare-fun m!462029 () Bool)

(assert (=> b!323977 m!462029))

(push 1)

(assert (not start!72302))

(assert (not b!323977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106264 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106264 (= (inv!12 thiss!1711) (invariant!0 (currentBit!15042 thiss!1711) (currentByte!15047 thiss!1711) (size!9013 (buf!8155 thiss!1711))))))

(declare-fun bs!27988 () Bool)

(assert (= bs!27988 d!106264))

(declare-fun m!462041 () Bool)

(assert (=> bs!27988 m!462041))

(assert (=> start!72302 d!106264))

(declare-fun d!106268 () Bool)

(assert (=> d!106268 (= (array_inv!8565 (buf!8155 thiss!1711)) (bvsge (size!9013 (buf!8155 thiss!1711)) #b00000000000000000000000000000000))))

(assert (=> b!323977 d!106268))

(push 1)

