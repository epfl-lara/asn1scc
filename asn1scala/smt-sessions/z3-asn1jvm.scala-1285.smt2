; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36624 () Bool)

(assert start!36624)

(declare-fun res!140042 () Bool)

(declare-fun e!116821 () Bool)

(assert (=> start!36624 (=> (not res!140042) (not e!116821))))

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8716 0))(
  ( (array!8717 (arr!4790 (Array (_ BitVec 32) (_ BitVec 8))) (size!3869 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6894 0))(
  ( (BitStream!6895 (buf!4321 array!8716) (currentByte!8181 (_ BitVec 32)) (currentBit!8176 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6894)

(assert (=> start!36624 (= res!140042 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3869 (buf!4321 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8181 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8176 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3869 (buf!4321 thiss!1909))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8181 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8176 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36624 e!116821))

(assert (=> start!36624 true))

(declare-fun e!116822 () Bool)

(declare-fun inv!12 (BitStream!6894) Bool)

(assert (=> start!36624 (and (inv!12 thiss!1909) e!116822)))

(declare-fun b!168226 () Bool)

(declare-fun res!140041 () Bool)

(assert (=> b!168226 (=> (not res!140041) (not e!116821))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168226 (= res!140041 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8176 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8181 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (size!3869 (buf!4321 thiss!1909))))))))

(declare-fun b!168227 () Bool)

(assert (=> b!168227 (= e!116821 (bvslt ((_ sign_extend 32) nBits!601) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!168228 () Bool)

(declare-fun array_inv!3610 (array!8716) Bool)

(assert (=> b!168228 (= e!116822 (array_inv!3610 (buf!4321 thiss!1909)))))

(assert (= (and start!36624 res!140042) b!168226))

(assert (= (and b!168226 res!140041) b!168227))

(assert (= start!36624 b!168228))

(declare-fun m!267861 () Bool)

(assert (=> start!36624 m!267861))

(declare-fun m!267863 () Bool)

(assert (=> b!168226 m!267863))

(declare-fun m!267865 () Bool)

(assert (=> b!168228 m!267865))

(check-sat (not b!168226) (not start!36624) (not b!168228))
(check-sat)
