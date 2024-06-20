; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47050 () Bool)

(assert start!47050)

(declare-fun b!225047 () Bool)

(declare-fun e!153487 () Bool)

(declare-datatypes ((array!11138 0))(
  ( (array!11139 (arr!5843 (Array (_ BitVec 32) (_ BitVec 8))) (size!4886 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8874 0))(
  ( (BitStream!8875 (buf!5430 array!11138) (currentByte!10191 (_ BitVec 32)) (currentBit!10186 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8874)

(declare-fun array_inv!4627 (array!11138) Bool)

(assert (=> b!225047 (= e!153487 (array_inv!4627 (buf!5430 thiss!1870)))))

(declare-fun b!225046 () Bool)

(declare-fun e!153486 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225046 (= e!153486 (not (invariant!0 (currentBit!10186 thiss!1870) (currentByte!10191 thiss!1870) (size!4886 (buf!5430 thiss!1870)))))))

(declare-fun res!188873 () Bool)

(assert (=> start!47050 (=> (not res!188873) (not e!153486))))

(declare-fun arr!308 () array!11138)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47050 (= res!188873 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4886 arr!308))))))

(assert (=> start!47050 e!153486))

(assert (=> start!47050 true))

(assert (=> start!47050 (array_inv!4627 arr!308)))

(declare-fun inv!12 (BitStream!8874) Bool)

(assert (=> start!47050 (and (inv!12 thiss!1870) e!153487)))

(declare-fun b!225045 () Bool)

(declare-fun res!188874 () Bool)

(assert (=> b!225045 (=> (not res!188874) (not e!153486))))

(assert (=> b!225045 (= res!188874 (bvsge i!761 to!496))))

(declare-fun b!225044 () Bool)

(declare-fun res!188872 () Bool)

(assert (=> b!225044 (=> (not res!188872) (not e!153486))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225044 (= res!188872 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4886 (buf!5430 thiss!1870))) ((_ sign_extend 32) (currentByte!10191 thiss!1870)) ((_ sign_extend 32) (currentBit!10186 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47050 res!188873) b!225044))

(assert (= (and b!225044 res!188872) b!225045))

(assert (= (and b!225045 res!188874) b!225046))

(assert (= start!47050 b!225047))

(declare-fun m!345945 () Bool)

(assert (=> b!225047 m!345945))

(declare-fun m!345947 () Bool)

(assert (=> b!225046 m!345947))

(declare-fun m!345949 () Bool)

(assert (=> start!47050 m!345949))

(declare-fun m!345951 () Bool)

(assert (=> start!47050 m!345951))

(declare-fun m!345953 () Bool)

(assert (=> b!225044 m!345953))

(check-sat (not b!225046) (not start!47050) (not b!225047) (not b!225044))
(check-sat)
(get-model)

(declare-fun d!76398 () Bool)

(assert (=> d!76398 (= (invariant!0 (currentBit!10186 thiss!1870) (currentByte!10191 thiss!1870) (size!4886 (buf!5430 thiss!1870))) (and (bvsge (currentBit!10186 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10186 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10191 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10191 thiss!1870) (size!4886 (buf!5430 thiss!1870))) (and (= (currentBit!10186 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10191 thiss!1870) (size!4886 (buf!5430 thiss!1870)))))))))

(assert (=> b!225046 d!76398))

(declare-fun d!76402 () Bool)

(assert (=> d!76402 (= (array_inv!4627 arr!308) (bvsge (size!4886 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47050 d!76402))

(declare-fun d!76404 () Bool)

(assert (=> d!76404 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10186 thiss!1870) (currentByte!10191 thiss!1870) (size!4886 (buf!5430 thiss!1870))))))

(declare-fun bs!18636 () Bool)

(assert (= bs!18636 d!76404))

(assert (=> bs!18636 m!345947))

(assert (=> start!47050 d!76404))

(declare-fun d!76406 () Bool)

(assert (=> d!76406 (= (array_inv!4627 (buf!5430 thiss!1870)) (bvsge (size!4886 (buf!5430 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225047 d!76406))

(declare-fun d!76408 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76408 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4886 (buf!5430 thiss!1870))) ((_ sign_extend 32) (currentByte!10191 thiss!1870)) ((_ sign_extend 32) (currentBit!10186 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4886 (buf!5430 thiss!1870))) ((_ sign_extend 32) (currentByte!10191 thiss!1870)) ((_ sign_extend 32) (currentBit!10186 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18637 () Bool)

(assert (= bs!18637 d!76408))

(declare-fun m!345967 () Bool)

(assert (=> bs!18637 m!345967))

(assert (=> b!225044 d!76408))

(check-sat (not d!76408) (not d!76404))
