; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3228 () Bool)

(assert start!3228)

(declare-fun res!13688 () Bool)

(declare-fun e!9044 () Bool)

(assert (=> start!3228 (=> (not res!13688) (not e!9044))))

(declare-datatypes ((array!814 0))(
  ( (array!815 (arr!777 (Array (_ BitVec 32) (_ BitVec 8))) (size!348 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!656 0))(
  ( (BitStream!657 (buf!699 array!814) (currentByte!1837 (_ BitVec 32)) (currentBit!1832 (_ BitVec 32))) )
))
(declare-fun b!186 () BitStream!656)

(declare-fun thiss!913 () BitStream!656)

(assert (=> start!3228 (= res!13688 (= (size!348 (buf!699 b!186)) (size!348 (buf!699 thiss!913))))))

(assert (=> start!3228 e!9044))

(declare-fun e!9043 () Bool)

(declare-fun inv!12 (BitStream!656) Bool)

(assert (=> start!3228 (and (inv!12 b!186) e!9043)))

(declare-fun e!9045 () Bool)

(assert (=> start!3228 (and (inv!12 thiss!913) e!9045)))

(declare-fun b!14577 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14577 (= e!9044 (not (invariant!0 (currentBit!1832 b!186) (currentByte!1837 b!186) (size!348 (buf!699 thiss!913)))))))

(declare-fun b!14578 () Bool)

(declare-fun array_inv!337 (array!814) Bool)

(assert (=> b!14578 (= e!9043 (array_inv!337 (buf!699 b!186)))))

(declare-fun b!14579 () Bool)

(assert (=> b!14579 (= e!9045 (array_inv!337 (buf!699 thiss!913)))))

(assert (= (and start!3228 res!13688) b!14577))

(assert (= start!3228 b!14578))

(assert (= start!3228 b!14579))

(declare-fun m!20989 () Bool)

(assert (=> start!3228 m!20989))

(declare-fun m!20991 () Bool)

(assert (=> start!3228 m!20991))

(declare-fun m!20993 () Bool)

(assert (=> b!14577 m!20993))

(declare-fun m!20995 () Bool)

(assert (=> b!14578 m!20995))

(declare-fun m!20997 () Bool)

(assert (=> b!14579 m!20997))

(push 1)

(assert (not start!3228))

(assert (not b!14579))

(assert (not b!14577))

(assert (not b!14578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4742 () Bool)

(assert (=> d!4742 (= (inv!12 b!186) (invariant!0 (currentBit!1832 b!186) (currentByte!1837 b!186) (size!348 (buf!699 b!186))))))

(declare-fun bs!1303 () Bool)

(assert (= bs!1303 d!4742))

(declare-fun m!20999 () Bool)

(assert (=> bs!1303 m!20999))

(assert (=> start!3228 d!4742))

(declare-fun d!4744 () Bool)

(assert (=> d!4744 (= (inv!12 thiss!913) (invariant!0 (currentBit!1832 thiss!913) (currentByte!1837 thiss!913) (size!348 (buf!699 thiss!913))))))

(declare-fun bs!1304 () Bool)

(assert (= bs!1304 d!4744))

(declare-fun m!21001 () Bool)

(assert (=> bs!1304 m!21001))

(assert (=> start!3228 d!4744))

(declare-fun d!4746 () Bool)

(assert (=> d!4746 (= (array_inv!337 (buf!699 thiss!913)) (bvsge (size!348 (buf!699 thiss!913)) #b00000000000000000000000000000000))))

(assert (=> b!14579 d!4746))

(declare-fun d!4750 () Bool)

(assert (=> d!4750 (= (invariant!0 (currentBit!1832 b!186) (currentByte!1837 b!186) (size!348 (buf!699 thiss!913))) (and (bvsge (currentBit!1832 b!186) #b00000000000000000000000000000000) (bvslt (currentBit!1832 b!186) #b00000000000000000000000000001000) (bvsge (currentByte!1837 b!186) #b00000000000000000000000000000000) (or (bvslt (currentByte!1837 b!186) (size!348 (buf!699 thiss!913))) (and (= (currentBit!1832 b!186) #b00000000000000000000000000000000) (= (currentByte!1837 b!186) (size!348 (buf!699 thiss!913)))))))))

(assert (=> b!14577 d!4750))

(declare-fun d!4754 () Bool)

(assert (=> d!4754 (= (array_inv!337 (buf!699 b!186)) (bvsge (size!348 (buf!699 b!186)) #b00000000000000000000000000000000))))

(assert (=> b!14578 d!4754))

(push 1)

(assert (not d!4742))

(assert (not d!4744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

