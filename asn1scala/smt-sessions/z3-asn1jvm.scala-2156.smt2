; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54794 () Bool)

(assert start!54794)

(declare-fun nBits!539 () (_ BitVec 64))

(declare-fun from!530 () (_ BitVec 64))

(declare-datatypes ((array!13854 0))(
  ( (array!13855 (arr!7067 (Array (_ BitVec 32) (_ BitVec 8))) (size!6080 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11082 0))(
  ( (BitStream!11083 (buf!6602 array!13854) (currentByte!12086 (_ BitVec 32)) (currentBit!12081 (_ BitVec 32))) )
))
(declare-fun thiss!1774 () BitStream!11082)

(assert (=> start!54794 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!539) (bvsle nBits!539 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!530) (bvsle from!530 nBits!539) (bvsle ((_ sign_extend 32) (size!6080 (buf!6602 thiss!1774))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12086 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12081 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6080 (buf!6602 thiss!1774))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12086 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12081 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54794 true))

(declare-fun e!177861 () Bool)

(declare-fun inv!12 (BitStream!11082) Bool)

(assert (=> start!54794 (and (inv!12 thiss!1774) e!177861)))

(declare-fun b!256669 () Bool)

(declare-fun array_inv!5821 (array!13854) Bool)

(assert (=> b!256669 (= e!177861 (array_inv!5821 (buf!6602 thiss!1774)))))

(assert (= start!54794 b!256669))

(declare-fun m!386263 () Bool)

(assert (=> start!54794 m!386263))

(declare-fun m!386265 () Bool)

(assert (=> b!256669 m!386265))

(check-sat (not b!256669) (not start!54794))
(check-sat)
(get-model)

(declare-fun d!86068 () Bool)

(assert (=> d!86068 (= (array_inv!5821 (buf!6602 thiss!1774)) (bvsge (size!6080 (buf!6602 thiss!1774)) #b00000000000000000000000000000000))))

(assert (=> b!256669 d!86068))

(declare-fun d!86070 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86070 (= (inv!12 thiss!1774) (invariant!0 (currentBit!12081 thiss!1774) (currentByte!12086 thiss!1774) (size!6080 (buf!6602 thiss!1774))))))

(declare-fun bs!21743 () Bool)

(assert (= bs!21743 d!86070))

(declare-fun m!386271 () Bool)

(assert (=> bs!21743 m!386271))

(assert (=> start!54794 d!86070))

(check-sat (not d!86070))
(check-sat)
(get-model)

(declare-fun d!86072 () Bool)

(assert (=> d!86072 (= (invariant!0 (currentBit!12081 thiss!1774) (currentByte!12086 thiss!1774) (size!6080 (buf!6602 thiss!1774))) (and (bvsge (currentBit!12081 thiss!1774) #b00000000000000000000000000000000) (bvslt (currentBit!12081 thiss!1774) #b00000000000000000000000000001000) (bvsge (currentByte!12086 thiss!1774) #b00000000000000000000000000000000) (or (bvslt (currentByte!12086 thiss!1774) (size!6080 (buf!6602 thiss!1774))) (and (= (currentBit!12081 thiss!1774) #b00000000000000000000000000000000) (= (currentByte!12086 thiss!1774) (size!6080 (buf!6602 thiss!1774)))))))))

(assert (=> d!86070 d!86072))

(check-sat)
