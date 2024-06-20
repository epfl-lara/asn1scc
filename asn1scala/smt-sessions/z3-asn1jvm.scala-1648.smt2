; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46102 () Bool)

(assert start!46102)

(declare-fun res!186828 () Bool)

(declare-fun e!151123 () Bool)

(assert (=> start!46102 (=> (not res!186828) (not e!151123))))

(declare-datatypes ((array!10830 0))(
  ( (array!10831 (arr!5684 (Array (_ BitVec 32) (_ BitVec 8))) (size!4754 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8616 0))(
  ( (BitStream!8617 (buf!5301 array!10830) (currentByte!9958 (_ BitVec 32)) (currentBit!9953 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8616)

(assert (=> start!46102 (= res!186828 (and (bvsle ((_ sign_extend 32) (size!4754 (buf!5301 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9958 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9953 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4754 (buf!5301 thiss!1933))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9958 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9953 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46102 e!151123))

(declare-fun e!151124 () Bool)

(declare-fun inv!12 (BitStream!8616) Bool)

(assert (=> start!46102 (and (inv!12 thiss!1933) e!151124)))

(declare-fun b!222469 () Bool)

(declare-fun res!186827 () Bool)

(assert (=> b!222469 (=> (not res!186827) (not e!151123))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222469 (= res!186827 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9953 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9958 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4754 (buf!5301 thiss!1933))))))))

(declare-fun b!222470 () Bool)

(assert (=> b!222470 (= e!151123 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!9953 thiss!1933)) #b00000000000000000000000000000111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222471 () Bool)

(declare-fun array_inv!4495 (array!10830) Bool)

(assert (=> b!222471 (= e!151124 (array_inv!4495 (buf!5301 thiss!1933)))))

(assert (= (and start!46102 res!186828) b!222469))

(assert (= (and b!222469 res!186827) b!222470))

(assert (= start!46102 b!222471))

(declare-fun m!340699 () Bool)

(assert (=> start!46102 m!340699))

(declare-fun m!340701 () Bool)

(assert (=> b!222469 m!340701))

(declare-fun m!340703 () Bool)

(assert (=> b!222471 m!340703))

(check-sat (not b!222469) (not start!46102) (not b!222471))
(check-sat)
