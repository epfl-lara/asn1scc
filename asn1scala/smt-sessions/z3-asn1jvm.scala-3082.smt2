; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70998 () Bool)

(assert start!70998)

(declare-fun res!263484 () Bool)

(declare-fun e!230916 () Bool)

(assert (=> start!70998 (=> (not res!263484) (not e!230916))))

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20248 0))(
  ( (array!20249 (arr!9917 (Array (_ BitVec 32) (_ BitVec 8))) (size!8825 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13812 0))(
  ( (BitStream!13813 (buf!7967 array!20248) (currentByte!14698 (_ BitVec 32)) (currentBit!14693 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13812)

(assert (=> start!70998 (= res!263484 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8825 (buf!7967 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14698 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14693 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8825 (buf!7967 thiss!1788))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14698 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14693 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!70998 e!230916))

(assert (=> start!70998 true))

(declare-fun e!230915 () Bool)

(declare-fun inv!12 (BitStream!13812) Bool)

(assert (=> start!70998 (and (inv!12 thiss!1788) e!230915)))

(declare-fun b!320750 () Bool)

(declare-fun res!263485 () Bool)

(assert (=> b!320750 (=> (not res!263485) (not e!230916))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320750 (= res!263485 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14693 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14698 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (size!8825 (buf!7967 thiss!1788))))))))

(declare-fun b!320751 () Bool)

(assert (=> b!320751 (= e!230916 (bvslt ((_ sign_extend 32) nBits!545) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320752 () Bool)

(declare-fun array_inv!8377 (array!20248) Bool)

(assert (=> b!320752 (= e!230915 (array_inv!8377 (buf!7967 thiss!1788)))))

(assert (= (and start!70998 res!263484) b!320750))

(assert (= (and b!320750 res!263485) b!320751))

(assert (= start!70998 b!320752))

(declare-fun m!459117 () Bool)

(assert (=> start!70998 m!459117))

(declare-fun m!459119 () Bool)

(assert (=> b!320750 m!459119))

(declare-fun m!459121 () Bool)

(assert (=> b!320752 m!459121))

(check-sat (not b!320752) (not start!70998) (not b!320750))
(check-sat)
