; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47018 () Bool)

(assert start!47018)

(declare-fun b!224999 () Bool)

(declare-fun e!153439 () Bool)

(declare-datatypes ((array!11127 0))(
  ( (array!11128 (arr!5839 (Array (_ BitVec 32) (_ BitVec 8))) (size!4882 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8866 0))(
  ( (BitStream!8867 (buf!5426 array!11127) (currentByte!10181 (_ BitVec 32)) (currentBit!10176 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8866)

(declare-fun array_inv!4623 (array!11127) Bool)

(assert (=> b!224999 (= e!153439 (array_inv!4623 (buf!5426 thiss!1870)))))

(declare-fun b!224998 () Bool)

(declare-fun e!153438 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224998 (= e!153438 (not (invariant!0 (currentBit!10176 thiss!1870) (currentByte!10181 thiss!1870) (size!4882 (buf!5426 thiss!1870)))))))

(declare-fun b!224997 () Bool)

(declare-fun res!188837 () Bool)

(assert (=> b!224997 (=> (not res!188837) (not e!153438))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!224997 (= res!188837 (bvsge i!761 to!496))))

(declare-fun res!188838 () Bool)

(assert (=> start!47018 (=> (not res!188838) (not e!153438))))

(declare-fun arr!308 () array!11127)

(assert (=> start!47018 (= res!188838 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4882 arr!308))))))

(assert (=> start!47018 e!153438))

(assert (=> start!47018 true))

(assert (=> start!47018 (array_inv!4623 arr!308)))

(declare-fun inv!12 (BitStream!8866) Bool)

(assert (=> start!47018 (and (inv!12 thiss!1870) e!153439)))

(declare-fun b!224996 () Bool)

(declare-fun res!188836 () Bool)

(assert (=> b!224996 (=> (not res!188836) (not e!153438))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224996 (= res!188836 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4882 (buf!5426 thiss!1870))) ((_ sign_extend 32) (currentByte!10181 thiss!1870)) ((_ sign_extend 32) (currentBit!10176 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47018 res!188838) b!224996))

(assert (= (and b!224996 res!188836) b!224997))

(assert (= (and b!224997 res!188837) b!224998))

(assert (= start!47018 b!224999))

(declare-fun m!345899 () Bool)

(assert (=> b!224999 m!345899))

(declare-fun m!345901 () Bool)

(assert (=> b!224998 m!345901))

(declare-fun m!345903 () Bool)

(assert (=> start!47018 m!345903))

(declare-fun m!345905 () Bool)

(assert (=> start!47018 m!345905))

(declare-fun m!345907 () Bool)

(assert (=> b!224996 m!345907))

(push 1)

(assert (not b!224996))

(assert (not b!224999))

(assert (not start!47018))

(assert (not b!224998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76360 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76360 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4882 (buf!5426 thiss!1870))) ((_ sign_extend 32) (currentByte!10181 thiss!1870)) ((_ sign_extend 32) (currentBit!10176 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4882 (buf!5426 thiss!1870))) ((_ sign_extend 32) (currentByte!10181 thiss!1870)) ((_ sign_extend 32) (currentBit!10176 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18625 () Bool)

(assert (= bs!18625 d!76360))

(declare-fun m!345929 () Bool)

(assert (=> bs!18625 m!345929))

(assert (=> b!224996 d!76360))

(declare-fun d!76366 () Bool)

(assert (=> d!76366 (= (array_inv!4623 (buf!5426 thiss!1870)) (bvsge (size!4882 (buf!5426 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!224999 d!76366))

(declare-fun d!76370 () Bool)

(assert (=> d!76370 (= (array_inv!4623 arr!308) (bvsge (size!4882 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47018 d!76370))

(declare-fun d!76372 () Bool)

(assert (=> d!76372 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10176 thiss!1870) (currentByte!10181 thiss!1870) (size!4882 (buf!5426 thiss!1870))))))

(declare-fun bs!18627 () Bool)

(assert (= bs!18627 d!76372))

(assert (=> bs!18627 m!345901))

(assert (=> start!47018 d!76372))

(declare-fun d!76376 () Bool)

(assert (=> d!76376 (= (invariant!0 (currentBit!10176 thiss!1870) (currentByte!10181 thiss!1870) (size!4882 (buf!5426 thiss!1870))) (and (bvsge (currentBit!10176 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10176 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10181 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10181 thiss!1870) (size!4882 (buf!5426 thiss!1870))) (and (= (currentBit!10176 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10181 thiss!1870) (size!4882 (buf!5426 thiss!1870)))))))))

(assert (=> b!224998 d!76376))

(push 1)

(assert (not d!76360))

(assert (not d!76372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

