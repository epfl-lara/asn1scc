; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3210 () Bool)

(assert start!3210)

(declare-fun res!13679 () Bool)

(declare-fun e!9000 () Bool)

(assert (=> start!3210 (=> (not res!13679) (not e!9000))))

(declare-datatypes ((array!805 0))(
  ( (array!806 (arr!774 (Array (_ BitVec 32) (_ BitVec 8))) (size!345 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!650 0))(
  ( (BitStream!651 (buf!696 array!805) (currentByte!1834 (_ BitVec 32)) (currentBit!1829 (_ BitVec 32))) )
))
(declare-fun b!186 () BitStream!650)

(declare-fun thiss!913 () BitStream!650)

(assert (=> start!3210 (= res!13679 (= (size!345 (buf!696 b!186)) (size!345 (buf!696 thiss!913))))))

(assert (=> start!3210 e!9000))

(declare-fun e!8999 () Bool)

(declare-fun inv!12 (BitStream!650) Bool)

(assert (=> start!3210 (and (inv!12 b!186) e!8999)))

(declare-fun e!8998 () Bool)

(assert (=> start!3210 (and (inv!12 thiss!913) e!8998)))

(declare-fun b!14550 () Bool)

(assert (=> b!14550 (= e!9000 (not (inv!12 (BitStream!651 (buf!696 thiss!913) (currentByte!1834 b!186) (currentBit!1829 b!186)))))))

(declare-fun b!14551 () Bool)

(declare-fun array_inv!334 (array!805) Bool)

(assert (=> b!14551 (= e!8999 (array_inv!334 (buf!696 b!186)))))

(declare-fun b!14552 () Bool)

(assert (=> b!14552 (= e!8998 (array_inv!334 (buf!696 thiss!913)))))

(assert (= (and start!3210 res!13679) b!14550))

(assert (= start!3210 b!14551))

(assert (= start!3210 b!14552))

(declare-fun m!20941 () Bool)

(assert (=> start!3210 m!20941))

(declare-fun m!20943 () Bool)

(assert (=> start!3210 m!20943))

(declare-fun m!20945 () Bool)

(assert (=> b!14550 m!20945))

(declare-fun m!20947 () Bool)

(assert (=> b!14551 m!20947))

(declare-fun m!20949 () Bool)

(assert (=> b!14552 m!20949))

(push 1)

(assert (not b!14550))

(assert (not b!14551))

(assert (not start!3210))

(assert (not b!14552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4711 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4711 (= (inv!12 (BitStream!651 (buf!696 thiss!913) (currentByte!1834 b!186) (currentBit!1829 b!186))) (invariant!0 (currentBit!1829 (BitStream!651 (buf!696 thiss!913) (currentByte!1834 b!186) (currentBit!1829 b!186))) (currentByte!1834 (BitStream!651 (buf!696 thiss!913) (currentByte!1834 b!186) (currentBit!1829 b!186))) (size!345 (buf!696 (BitStream!651 (buf!696 thiss!913) (currentByte!1834 b!186) (currentBit!1829 b!186))))))))

(declare-fun bs!1292 () Bool)

(assert (= bs!1292 d!4711))

(declare-fun m!20953 () Bool)

(assert (=> bs!1292 m!20953))

(assert (=> b!14550 d!4711))

(declare-fun d!4720 () Bool)

(assert (=> d!4720 (= (array_inv!334 (buf!696 b!186)) (bvsge (size!345 (buf!696 b!186)) #b00000000000000000000000000000000))))

(assert (=> b!14551 d!4720))

(declare-fun d!4726 () Bool)

(assert (=> d!4726 (= (inv!12 b!186) (invariant!0 (currentBit!1829 b!186) (currentByte!1834 b!186) (size!345 (buf!696 b!186))))))

(declare-fun bs!1295 () Bool)

(assert (= bs!1295 d!4726))

