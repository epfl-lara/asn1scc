; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54808 () Bool)

(assert start!54808)

(declare-fun res!215161 () Bool)

(declare-fun e!177884 () Bool)

(assert (=> start!54808 (=> (not res!215161) (not e!177884))))

(declare-fun nBits!539 () (_ BitVec 64))

(declare-datatypes ((array!13862 0))(
  ( (array!13863 (arr!7070 (Array (_ BitVec 32) (_ BitVec 8))) (size!6083 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11088 0))(
  ( (BitStream!11089 (buf!6605 array!13862) (currentByte!12090 (_ BitVec 32)) (currentBit!12085 (_ BitVec 32))) )
))
(declare-fun thiss!1774 () BitStream!11088)

(declare-fun from!530 () (_ BitVec 64))

(assert (=> start!54808 (= res!215161 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!539) (bvsle nBits!539 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!530) (bvsle from!530 nBits!539) (bvsle ((_ sign_extend 32) (size!6083 (buf!6605 thiss!1774))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12090 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12085 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6083 (buf!6605 thiss!1774))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12090 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12085 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54808 e!177884))

(assert (=> start!54808 true))

(declare-fun e!177885 () Bool)

(declare-fun inv!12 (BitStream!11088) Bool)

(assert (=> start!54808 (and (inv!12 thiss!1774) e!177885)))

(declare-fun b!256683 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256683 (= e!177884 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12085 thiss!1774))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12090 thiss!1774))) ((_ extract 31 0) ((_ sign_extend 32) (size!6083 (buf!6605 thiss!1774)))))))))

(declare-fun b!256684 () Bool)

(declare-fun array_inv!5824 (array!13862) Bool)

(assert (=> b!256684 (= e!177885 (array_inv!5824 (buf!6605 thiss!1774)))))

(assert (= (and start!54808 res!215161) b!256683))

(assert (= start!54808 b!256684))

(declare-fun m!386279 () Bool)

(assert (=> start!54808 m!386279))

(declare-fun m!386281 () Bool)

(assert (=> b!256683 m!386281))

(declare-fun m!386283 () Bool)

(assert (=> b!256684 m!386283))

(check-sat (not start!54808) (not b!256683) (not b!256684))
(check-sat)
(get-model)

(declare-fun d!86078 () Bool)

(assert (=> d!86078 (= (inv!12 thiss!1774) (invariant!0 (currentBit!12085 thiss!1774) (currentByte!12090 thiss!1774) (size!6083 (buf!6605 thiss!1774))))))

(declare-fun bs!21747 () Bool)

(assert (= bs!21747 d!86078))

(declare-fun m!386291 () Bool)

(assert (=> bs!21747 m!386291))

(assert (=> start!54808 d!86078))

(declare-fun d!86080 () Bool)

(assert (=> d!86080 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12085 thiss!1774))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12090 thiss!1774))) ((_ extract 31 0) ((_ sign_extend 32) (size!6083 (buf!6605 thiss!1774))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12085 thiss!1774))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12085 thiss!1774))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12090 thiss!1774))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12090 thiss!1774))) ((_ extract 31 0) ((_ sign_extend 32) (size!6083 (buf!6605 thiss!1774))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12085 thiss!1774))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12090 thiss!1774))) ((_ extract 31 0) ((_ sign_extend 32) (size!6083 (buf!6605 thiss!1774)))))))))))

(assert (=> b!256683 d!86080))

(declare-fun d!86082 () Bool)

(assert (=> d!86082 (= (array_inv!5824 (buf!6605 thiss!1774)) (bvsge (size!6083 (buf!6605 thiss!1774)) #b00000000000000000000000000000000))))

(assert (=> b!256684 d!86082))

(check-sat (not d!86078))
(check-sat)
