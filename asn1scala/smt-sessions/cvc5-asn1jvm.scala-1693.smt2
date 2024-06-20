; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47048 () Bool)

(assert start!47048)

(declare-fun res!188865 () Bool)

(declare-fun e!153473 () Bool)

(assert (=> start!47048 (=> (not res!188865) (not e!153473))))

(declare-datatypes ((array!11136 0))(
  ( (array!11137 (arr!5842 (Array (_ BitVec 32) (_ BitVec 8))) (size!4885 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11136)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47048 (= res!188865 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4885 arr!308))))))

(assert (=> start!47048 e!153473))

(assert (=> start!47048 true))

(declare-fun array_inv!4626 (array!11136) Bool)

(assert (=> start!47048 (array_inv!4626 arr!308)))

(declare-datatypes ((BitStream!8872 0))(
  ( (BitStream!8873 (buf!5429 array!11136) (currentByte!10190 (_ BitVec 32)) (currentBit!10185 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8872)

(declare-fun e!153476 () Bool)

(declare-fun inv!12 (BitStream!8872) Bool)

(assert (=> start!47048 (and (inv!12 thiss!1870) e!153476)))

(declare-fun b!225035 () Bool)

(assert (=> b!225035 (= e!153476 (array_inv!4626 (buf!5429 thiss!1870)))))

(declare-fun b!225032 () Bool)

(declare-fun res!188864 () Bool)

(assert (=> b!225032 (=> (not res!188864) (not e!153473))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225032 (= res!188864 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4885 (buf!5429 thiss!1870))) ((_ sign_extend 32) (currentByte!10190 thiss!1870)) ((_ sign_extend 32) (currentBit!10185 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225033 () Bool)

(declare-fun res!188863 () Bool)

(assert (=> b!225033 (=> (not res!188863) (not e!153473))))

(assert (=> b!225033 (= res!188863 (bvsge i!761 to!496))))

(declare-fun b!225034 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225034 (= e!153473 (not (invariant!0 (currentBit!10185 thiss!1870) (currentByte!10190 thiss!1870) (size!4885 (buf!5429 thiss!1870)))))))

(assert (= (and start!47048 res!188865) b!225032))

(assert (= (and b!225032 res!188864) b!225033))

(assert (= (and b!225033 res!188863) b!225034))

(assert (= start!47048 b!225035))

(declare-fun m!345935 () Bool)

(assert (=> start!47048 m!345935))

(declare-fun m!345937 () Bool)

(assert (=> start!47048 m!345937))

(declare-fun m!345939 () Bool)

(assert (=> b!225035 m!345939))

(declare-fun m!345941 () Bool)

(assert (=> b!225032 m!345941))

(declare-fun m!345943 () Bool)

(assert (=> b!225034 m!345943))

(push 1)

(assert (not b!225035))

(assert (not start!47048))

(assert (not b!225034))

(assert (not b!225032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76390 () Bool)

(assert (=> d!76390 (= (array_inv!4626 (buf!5429 thiss!1870)) (bvsge (size!4885 (buf!5429 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225035 d!76390))

(declare-fun d!76392 () Bool)

(assert (=> d!76392 (= (array_inv!4626 arr!308) (bvsge (size!4885 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47048 d!76392))

(declare-fun d!76394 () Bool)

(assert (=> d!76394 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10185 thiss!1870) (currentByte!10190 thiss!1870) (size!4885 (buf!5429 thiss!1870))))))

(declare-fun bs!18634 () Bool)

(assert (= bs!18634 d!76394))

(assert (=> bs!18634 m!345943))

(assert (=> start!47048 d!76394))

(declare-fun d!76396 () Bool)

(assert (=> d!76396 (= (invariant!0 (currentBit!10185 thiss!1870) (currentByte!10190 thiss!1870) (size!4885 (buf!5429 thiss!1870))) (and (bvsge (currentBit!10185 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10185 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10190 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10190 thiss!1870) (size!4885 (buf!5429 thiss!1870))) (and (= (currentBit!10185 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10190 thiss!1870) (size!4885 (buf!5429 thiss!1870)))))))))

(assert (=> b!225034 d!76396))

(declare-fun d!76400 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76400 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4885 (buf!5429 thiss!1870))) ((_ sign_extend 32) (currentByte!10190 thiss!1870)) ((_ sign_extend 32) (currentBit!10185 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4885 (buf!5429 thiss!1870))) ((_ sign_extend 32) (currentByte!10190 thiss!1870)) ((_ sign_extend 32) (currentBit!10185 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18635 () Bool)

(assert (= bs!18635 d!76400))

(declare-fun m!345965 () Bool)

(assert (=> bs!18635 m!345965))

(assert (=> b!225032 d!76400))

(push 1)

(assert (not d!76400))

(assert (not d!76394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

