; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46218 () Bool)

(assert start!46218)

(declare-fun res!186878 () Bool)

(declare-fun e!151373 () Bool)

(assert (=> start!46218 (=> (not res!186878) (not e!151373))))

(declare-datatypes ((array!10897 0))(
  ( (array!10898 (arr!5712 (Array (_ BitVec 32) (_ BitVec 8))) (size!4782 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10897)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46218 (= res!186878 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4782 arr!308))))))

(assert (=> start!46218 e!151373))

(assert (=> start!46218 true))

(declare-fun array_inv!4523 (array!10897) Bool)

(assert (=> start!46218 (array_inv!4523 arr!308)))

(declare-datatypes ((BitStream!8666 0))(
  ( (BitStream!8667 (buf!5326 array!10897) (currentByte!9990 (_ BitVec 32)) (currentBit!9985 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8666)

(declare-fun e!151374 () Bool)

(declare-fun inv!12 (BitStream!8666) Bool)

(assert (=> start!46218 (and (inv!12 thiss!1870) e!151374)))

(declare-fun b!222596 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!222596 (= e!151373 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4782 (buf!5326 thiss!1870))) ((_ sign_extend 32) (currentByte!9990 thiss!1870)) ((_ sign_extend 32) (currentBit!9985 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!222594 () Bool)

(declare-fun res!186879 () Bool)

(assert (=> b!222594 (=> (not res!186879) (not e!151373))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222594 (= res!186879 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4782 (buf!5326 thiss!1870))) ((_ sign_extend 32) (currentByte!9990 thiss!1870)) ((_ sign_extend 32) (currentBit!9985 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222595 () Bool)

(declare-fun res!186877 () Bool)

(assert (=> b!222595 (=> (not res!186877) (not e!151373))))

(assert (=> b!222595 (= res!186877 (bvslt i!761 to!496))))

(declare-fun b!222597 () Bool)

(assert (=> b!222597 (= e!151374 (array_inv!4523 (buf!5326 thiss!1870)))))

(assert (= (and start!46218 res!186878) b!222594))

(assert (= (and b!222594 res!186879) b!222595))

(assert (= (and b!222595 res!186877) b!222596))

(assert (= start!46218 b!222597))

(declare-fun m!340887 () Bool)

(assert (=> start!46218 m!340887))

(declare-fun m!340889 () Bool)

(assert (=> start!46218 m!340889))

(declare-fun m!340891 () Bool)

(assert (=> b!222596 m!340891))

(declare-fun m!340893 () Bool)

(assert (=> b!222594 m!340893))

(declare-fun m!340895 () Bool)

(assert (=> b!222597 m!340895))

(push 1)

(assert (not b!222597))

(assert (not b!222594))

(assert (not b!222596))

(assert (not start!46218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75359 () Bool)

(assert (=> d!75359 (= (array_inv!4523 (buf!5326 thiss!1870)) (bvsge (size!4782 (buf!5326 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!222597 d!75359))

(declare-fun d!75361 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75361 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4782 (buf!5326 thiss!1870))) ((_ sign_extend 32) (currentByte!9990 thiss!1870)) ((_ sign_extend 32) (currentBit!9985 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4782 (buf!5326 thiss!1870))) ((_ sign_extend 32) (currentByte!9990 thiss!1870)) ((_ sign_extend 32) (currentBit!9985 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18382 () Bool)

(assert (= bs!18382 d!75361))

(declare-fun m!340905 () Bool)

(assert (=> bs!18382 m!340905))

(assert (=> b!222594 d!75361))

(declare-fun d!75363 () Bool)

(assert (=> d!75363 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4782 (buf!5326 thiss!1870))) ((_ sign_extend 32) (currentByte!9990 thiss!1870)) ((_ sign_extend 32) (currentBit!9985 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4782 (buf!5326 thiss!1870))) ((_ sign_extend 32) (currentByte!9990 thiss!1870)) ((_ sign_extend 32) (currentBit!9985 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18383 () Bool)

(assert (= bs!18383 d!75363))

(assert (=> bs!18383 m!340905))

(assert (=> b!222596 d!75363))

(declare-fun d!75365 () Bool)

(assert (=> d!75365 (= (array_inv!4523 arr!308) (bvsge (size!4782 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46218 d!75365))

(declare-fun d!75367 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75367 (= (inv!12 thiss!1870) (invariant!0 (currentBit!9985 thiss!1870) (currentByte!9990 thiss!1870) (size!4782 (buf!5326 thiss!1870))))))

(declare-fun bs!18384 () Bool)

(assert (= bs!18384 d!75367))

(declare-fun m!340907 () Bool)

(assert (=> bs!18384 m!340907))

(assert (=> start!46218 d!75367))

(push 1)

(assert (not d!75361))

(assert (not d!75367))

(assert (not d!75363))

(check-sat)

(pop 1)

(push 1)

(check-sat)

