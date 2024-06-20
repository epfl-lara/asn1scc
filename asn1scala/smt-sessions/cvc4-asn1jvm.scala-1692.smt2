; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47022 () Bool)

(assert start!47022)

(declare-fun b!225020 () Bool)

(declare-fun res!188854 () Bool)

(declare-fun e!153461 () Bool)

(assert (=> b!225020 (=> (not res!188854) (not e!153461))))

(declare-datatypes ((array!11131 0))(
  ( (array!11132 (arr!5841 (Array (_ BitVec 32) (_ BitVec 8))) (size!4884 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8870 0))(
  ( (BitStream!8871 (buf!5428 array!11131) (currentByte!10183 (_ BitVec 32)) (currentBit!10178 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8870)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225020 (= res!188854 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4884 (buf!5428 thiss!1870))) ((_ sign_extend 32) (currentByte!10183 thiss!1870)) ((_ sign_extend 32) (currentBit!10178 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225023 () Bool)

(declare-fun e!153462 () Bool)

(declare-fun array_inv!4625 (array!11131) Bool)

(assert (=> b!225023 (= e!153462 (array_inv!4625 (buf!5428 thiss!1870)))))

(declare-fun b!225021 () Bool)

(declare-fun res!188856 () Bool)

(assert (=> b!225021 (=> (not res!188856) (not e!153461))))

(assert (=> b!225021 (= res!188856 (bvsge i!761 to!496))))

(declare-fun b!225022 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225022 (= e!153461 (not (invariant!0 (currentBit!10178 thiss!1870) (currentByte!10183 thiss!1870) (size!4884 (buf!5428 thiss!1870)))))))

(declare-fun res!188855 () Bool)

(assert (=> start!47022 (=> (not res!188855) (not e!153461))))

(declare-fun arr!308 () array!11131)

(assert (=> start!47022 (= res!188855 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4884 arr!308))))))

(assert (=> start!47022 e!153461))

(assert (=> start!47022 true))

(assert (=> start!47022 (array_inv!4625 arr!308)))

(declare-fun inv!12 (BitStream!8870) Bool)

(assert (=> start!47022 (and (inv!12 thiss!1870) e!153462)))

(assert (= (and start!47022 res!188855) b!225020))

(assert (= (and b!225020 res!188854) b!225021))

(assert (= (and b!225021 res!188856) b!225022))

(assert (= start!47022 b!225023))

(declare-fun m!345919 () Bool)

(assert (=> b!225020 m!345919))

(declare-fun m!345921 () Bool)

(assert (=> b!225023 m!345921))

(declare-fun m!345923 () Bool)

(assert (=> b!225022 m!345923))

(declare-fun m!345925 () Bool)

(assert (=> start!47022 m!345925))

(declare-fun m!345927 () Bool)

(assert (=> start!47022 m!345927))

(push 1)

(assert (not start!47022))

(assert (not b!225022))

(assert (not b!225020))

(assert (not b!225023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76362 () Bool)

(assert (=> d!76362 (= (array_inv!4625 arr!308) (bvsge (size!4884 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47022 d!76362))

(declare-fun d!76364 () Bool)

(assert (=> d!76364 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10178 thiss!1870) (currentByte!10183 thiss!1870) (size!4884 (buf!5428 thiss!1870))))))

(declare-fun bs!18626 () Bool)

(assert (= bs!18626 d!76364))

(assert (=> bs!18626 m!345923))

(assert (=> start!47022 d!76364))

(declare-fun d!76368 () Bool)

(assert (=> d!76368 (= (invariant!0 (currentBit!10178 thiss!1870) (currentByte!10183 thiss!1870) (size!4884 (buf!5428 thiss!1870))) (and (bvsge (currentBit!10178 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10178 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10183 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10183 thiss!1870) (size!4884 (buf!5428 thiss!1870))) (and (= (currentBit!10178 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10183 thiss!1870) (size!4884 (buf!5428 thiss!1870)))))))))

(assert (=> b!225022 d!76368))

(declare-fun d!76378 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76378 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4884 (buf!5428 thiss!1870))) ((_ sign_extend 32) (currentByte!10183 thiss!1870)) ((_ sign_extend 32) (currentBit!10178 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4884 (buf!5428 thiss!1870))) ((_ sign_extend 32) (currentByte!10183 thiss!1870)) ((_ sign_extend 32) (currentBit!10178 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18628 () Bool)

(assert (= bs!18628 d!76378))

(declare-fun m!345931 () Bool)

(assert (=> bs!18628 m!345931))

(assert (=> b!225020 d!76378))

(declare-fun d!76382 () Bool)

(assert (=> d!76382 (= (array_inv!4625 (buf!5428 thiss!1870)) (bvsge (size!4884 (buf!5428 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225023 d!76382))

(push 1)

