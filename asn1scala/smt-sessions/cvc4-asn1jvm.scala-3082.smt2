; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71000 () Bool)

(assert start!71000)

(declare-fun res!263491 () Bool)

(declare-fun e!230924 () Bool)

(assert (=> start!71000 (=> (not res!263491) (not e!230924))))

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20250 0))(
  ( (array!20251 (arr!9918 (Array (_ BitVec 32) (_ BitVec 8))) (size!8826 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13814 0))(
  ( (BitStream!13815 (buf!7968 array!20250) (currentByte!14699 (_ BitVec 32)) (currentBit!14694 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13814)

(assert (=> start!71000 (= res!263491 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8826 (buf!7968 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14699 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14694 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8826 (buf!7968 thiss!1788))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14699 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14694 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71000 e!230924))

(assert (=> start!71000 true))

(declare-fun e!230925 () Bool)

(declare-fun inv!12 (BitStream!13814) Bool)

(assert (=> start!71000 (and (inv!12 thiss!1788) e!230925)))

(declare-fun b!320759 () Bool)

(declare-fun res!263490 () Bool)

(assert (=> b!320759 (=> (not res!263490) (not e!230924))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320759 (= res!263490 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14694 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14699 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (size!8826 (buf!7968 thiss!1788))))))))

(declare-fun b!320760 () Bool)

(assert (=> b!320760 (= e!230924 (bvslt ((_ sign_extend 32) nBits!545) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320761 () Bool)

(declare-fun array_inv!8378 (array!20250) Bool)

(assert (=> b!320761 (= e!230925 (array_inv!8378 (buf!7968 thiss!1788)))))

(assert (= (and start!71000 res!263491) b!320759))

(assert (= (and b!320759 res!263490) b!320760))

(assert (= start!71000 b!320761))

(declare-fun m!459123 () Bool)

(assert (=> start!71000 m!459123))

(declare-fun m!459125 () Bool)

(assert (=> b!320759 m!459125))

(declare-fun m!459127 () Bool)

(assert (=> b!320761 m!459127))

(push 1)

(assert (not start!71000))

(assert (not b!320759))

(assert (not b!320761))

(check-sat)

