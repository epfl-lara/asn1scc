; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38132 () Bool)

(assert start!38132)

(declare-fun res!142332 () Bool)

(declare-fun e!120005 () Bool)

(assert (=> start!38132 (=> (not res!142332) (not e!120005))))

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9176 0))(
  ( (array!9177 (arr!4985 (Array (_ BitVec 32) (_ BitVec 8))) (size!4055 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7218 0))(
  ( (BitStream!7219 (buf!4483 array!9176) (currentByte!8517 (_ BitVec 32)) (currentBit!8512 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7218)

(assert (=> start!38132 (= res!142332 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4055 (buf!4483 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8517 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8512 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4055 (buf!4483 thiss!1817))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8517 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8512 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38132 e!120005))

(assert (=> start!38132 true))

(declare-fun e!120006 () Bool)

(declare-fun inv!12 (BitStream!7218) Bool)

(assert (=> start!38132 (and (inv!12 thiss!1817) e!120006)))

(declare-fun b!171749 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!171749 (= e!120005 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8512 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8517 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4055 (buf!4483 thiss!1817)))))))))

(declare-fun b!171750 () Bool)

(declare-fun array_inv!3796 (array!9176) Bool)

(assert (=> b!171750 (= e!120006 (array_inv!3796 (buf!4483 thiss!1817)))))

(assert (= (and start!38132 res!142332) b!171749))

(assert (= start!38132 b!171750))

(declare-fun m!271001 () Bool)

(assert (=> start!38132 m!271001))

(declare-fun m!271003 () Bool)

(assert (=> b!171749 m!271003))

(declare-fun m!271005 () Bool)

(assert (=> b!171750 m!271005))

(check-sat (not b!171749) (not start!38132) (not b!171750))
(check-sat)
(get-model)

(declare-fun d!60867 () Bool)

(assert (=> d!60867 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8512 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8517 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4055 (buf!4483 thiss!1817))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8512 thiss!1817))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8512 thiss!1817))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8517 thiss!1817))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8517 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4055 (buf!4483 thiss!1817))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8512 thiss!1817))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8517 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4055 (buf!4483 thiss!1817)))))))))))

(assert (=> b!171749 d!60867))

(declare-fun d!60871 () Bool)

(assert (=> d!60871 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8512 thiss!1817) (currentByte!8517 thiss!1817) (size!4055 (buf!4483 thiss!1817))))))

(declare-fun bs!15139 () Bool)

(assert (= bs!15139 d!60871))

(declare-fun m!271015 () Bool)

(assert (=> bs!15139 m!271015))

(assert (=> start!38132 d!60871))

(declare-fun d!60881 () Bool)

(assert (=> d!60881 (= (array_inv!3796 (buf!4483 thiss!1817)) (bvsge (size!4055 (buf!4483 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!171750 d!60881))

(check-sat (not d!60871))
