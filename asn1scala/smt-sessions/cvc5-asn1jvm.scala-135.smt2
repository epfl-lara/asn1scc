; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3224 () Bool)

(assert start!3224)

(declare-fun res!13682 () Bool)

(declare-fun e!9014 () Bool)

(assert (=> start!3224 (=> (not res!13682) (not e!9014))))

(declare-datatypes ((array!810 0))(
  ( (array!811 (arr!775 (Array (_ BitVec 32) (_ BitVec 8))) (size!346 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!652 0))(
  ( (BitStream!653 (buf!697 array!810) (currentByte!1835 (_ BitVec 32)) (currentBit!1830 (_ BitVec 32))) )
))
(declare-fun b!186 () BitStream!652)

(declare-fun thiss!913 () BitStream!652)

(assert (=> start!3224 (= res!13682 (= (size!346 (buf!697 b!186)) (size!346 (buf!697 thiss!913))))))

(assert (=> start!3224 e!9014))

(declare-fun e!9015 () Bool)

(declare-fun inv!12 (BitStream!652) Bool)

(assert (=> start!3224 (and (inv!12 b!186) e!9015)))

(declare-fun e!9013 () Bool)

(assert (=> start!3224 (and (inv!12 thiss!913) e!9013)))

(declare-fun b!14559 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14559 (= e!9014 (not (invariant!0 (currentBit!1830 b!186) (currentByte!1835 b!186) (size!346 (buf!697 thiss!913)))))))

(declare-fun b!14560 () Bool)

(declare-fun array_inv!335 (array!810) Bool)

(assert (=> b!14560 (= e!9015 (array_inv!335 (buf!697 b!186)))))

(declare-fun b!14561 () Bool)

(assert (=> b!14561 (= e!9013 (array_inv!335 (buf!697 thiss!913)))))

(assert (= (and start!3224 res!13682) b!14559))

(assert (= start!3224 b!14560))

(assert (= start!3224 b!14561))

(declare-fun m!20969 () Bool)

(assert (=> start!3224 m!20969))

(declare-fun m!20971 () Bool)

(assert (=> start!3224 m!20971))

(declare-fun m!20973 () Bool)

(assert (=> b!14559 m!20973))

(declare-fun m!20975 () Bool)

(assert (=> b!14560 m!20975))

(declare-fun m!20977 () Bool)

(assert (=> b!14561 m!20977))

(push 1)

(assert (not b!14559))

(assert (not b!14560))

(assert (not start!3224))

(assert (not b!14561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4748 () Bool)

(assert (=> d!4748 (= (invariant!0 (currentBit!1830 b!186) (currentByte!1835 b!186) (size!346 (buf!697 thiss!913))) (and (bvsge (currentBit!1830 b!186) #b00000000000000000000000000000000) (bvslt (currentBit!1830 b!186) #b00000000000000000000000000001000) (bvsge (currentByte!1835 b!186) #b00000000000000000000000000000000) (or (bvslt (currentByte!1835 b!186) (size!346 (buf!697 thiss!913))) (and (= (currentBit!1830 b!186) #b00000000000000000000000000000000) (= (currentByte!1835 b!186) (size!346 (buf!697 thiss!913)))))))))

(assert (=> b!14559 d!4748))

(declare-fun d!4752 () Bool)

(assert (=> d!4752 (= (array_inv!335 (buf!697 b!186)) (bvsge (size!346 (buf!697 b!186)) #b00000000000000000000000000000000))))

(assert (=> b!14560 d!4752))

(declare-fun d!4756 () Bool)

(assert (=> d!4756 (= (inv!12 b!186) (invariant!0 (currentBit!1830 b!186) (currentByte!1835 b!186) (size!346 (buf!697 b!186))))))

(declare-fun bs!1305 () Bool)

(assert (= bs!1305 d!4756))

(declare-fun m!21003 () Bool)

(assert (=> bs!1305 m!21003))

(assert (=> start!3224 d!4756))

(declare-fun d!4758 () Bool)

(assert (=> d!4758 (= (inv!12 thiss!913) (invariant!0 (currentBit!1830 thiss!913) (currentByte!1835 thiss!913) (size!346 (buf!697 thiss!913))))))

(declare-fun bs!1306 () Bool)

(assert (= bs!1306 d!4758))

(declare-fun m!21005 () Bool)

(assert (=> bs!1306 m!21005))

(assert (=> start!3224 d!4758))

(declare-fun d!4760 () Bool)

(assert (=> d!4760 (= (array_inv!335 (buf!697 thiss!913)) (bvsge (size!346 (buf!697 thiss!913)) #b00000000000000000000000000000000))))

(assert (=> b!14561 d!4760))

(push 1)

(assert (not d!4758))

(assert (not d!4756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

