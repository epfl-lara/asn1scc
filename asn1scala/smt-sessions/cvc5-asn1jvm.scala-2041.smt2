; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52042 () Bool)

(assert start!52042)

(declare-fun res!200199 () Bool)

(declare-fun e!166272 () Bool)

(assert (=> start!52042 (=> (not res!200199) (not e!166272))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-datatypes ((array!13097 0))(
  ( (array!13098 (arr!6724 (Array (_ BitVec 32) (_ BitVec 8))) (size!5737 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10396 0))(
  ( (BitStream!10397 (buf!6191 array!13097) (currentByte!11531 (_ BitVec 32)) (currentBit!11526 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10396)

(assert (=> start!52042 (= res!200199 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!5737 (buf!6191 thiss!982))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11531 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11526 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5737 (buf!6191 thiss!982))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11531 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11526 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52042 e!166272))

(assert (=> start!52042 true))

(declare-fun e!166273 () Bool)

(declare-fun inv!12 (BitStream!10396) Bool)

(assert (=> start!52042 (and (inv!12 thiss!982) e!166273)))

(declare-fun b!239818 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239818 (= e!166272 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11526 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11531 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (size!5737 (buf!6191 thiss!982)))))))))

(declare-fun b!239819 () Bool)

(declare-fun array_inv!5478 (array!13097) Bool)

(assert (=> b!239819 (= e!166273 (array_inv!5478 (buf!6191 thiss!982)))))

(assert (= (and start!52042 res!200199) b!239818))

(assert (= start!52042 b!239819))

(declare-fun m!362135 () Bool)

(assert (=> start!52042 m!362135))

(declare-fun m!362137 () Bool)

(assert (=> b!239818 m!362137))

(declare-fun m!362139 () Bool)

(assert (=> b!239819 m!362139))

(push 1)

(assert (not b!239819))

(assert (not b!239818))

(assert (not start!52042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81142 () Bool)

(assert (=> d!81142 (= (array_inv!5478 (buf!6191 thiss!982)) (bvsge (size!5737 (buf!6191 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!239819 d!81142))

(declare-fun d!81144 () Bool)

(assert (=> d!81144 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11526 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11531 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (size!5737 (buf!6191 thiss!982))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11526 thiss!982))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11526 thiss!982))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11531 thiss!982))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11531 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (size!5737 (buf!6191 thiss!982))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11526 thiss!982))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11531 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (size!5737 (buf!6191 thiss!982)))))))))))

(assert (=> b!239818 d!81144))

(declare-fun d!81150 () Bool)

(assert (=> d!81150 (= (inv!12 thiss!982) (invariant!0 (currentBit!11526 thiss!982) (currentByte!11531 thiss!982) (size!5737 (buf!6191 thiss!982))))))

(declare-fun bs!20455 () Bool)

(assert (= bs!20455 d!81150))

(declare-fun m!362155 () Bool)

(assert (=> bs!20455 m!362155))

(assert (=> start!52042 d!81150))

(push 1)

(assert (not d!81150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

