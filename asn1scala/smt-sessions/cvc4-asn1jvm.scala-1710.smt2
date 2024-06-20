; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47292 () Bool)

(assert start!47292)

(declare-fun b!225733 () Bool)

(declare-fun e!154174 () Bool)

(declare-fun e!154175 () Bool)

(assert (=> b!225733 (= e!154174 e!154175)))

(declare-fun res!189420 () Bool)

(assert (=> b!225733 (=> (not res!189420) (not e!154175))))

(declare-datatypes ((array!11253 0))(
  ( (array!11254 (arr!5895 (Array (_ BitVec 32) (_ BitVec 8))) (size!4938 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8972 0))(
  ( (BitStream!8973 (buf!5479 array!11253) (currentByte!10266 (_ BitVec 32)) (currentBit!10261 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8972)

(declare-datatypes ((tuple2!19314 0))(
  ( (tuple2!19315 (_1!10444 (_ BitVec 8)) (_2!10444 BitStream!8972)) )
))
(declare-fun lt!358779 () tuple2!19314)

(assert (=> b!225733 (= res!189420 (= (size!4938 (buf!5479 thiss!1870)) (size!4938 (buf!5479 (_2!10444 lt!358779)))))))

(declare-fun readByte!0 (BitStream!8972) tuple2!19314)

(assert (=> b!225733 (= lt!358779 (readByte!0 thiss!1870))))

(declare-fun b!225734 () Bool)

(declare-fun res!189417 () Bool)

(assert (=> b!225734 (=> (not res!189417) (not e!154174))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225734 (= res!189417 (bvslt i!761 to!496))))

(declare-fun res!189419 () Bool)

(assert (=> start!47292 (=> (not res!189419) (not e!154174))))

(declare-fun arr!308 () array!11253)

(assert (=> start!47292 (= res!189419 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4938 arr!308))))))

(assert (=> start!47292 e!154174))

(assert (=> start!47292 true))

(declare-fun array_inv!4679 (array!11253) Bool)

(assert (=> start!47292 (array_inv!4679 arr!308)))

(declare-fun e!154177 () Bool)

(declare-fun inv!12 (BitStream!8972) Bool)

(assert (=> start!47292 (and (inv!12 thiss!1870) e!154177)))

(declare-fun b!225735 () Bool)

(assert (=> b!225735 (= e!154177 (array_inv!4679 (buf!5479 thiss!1870)))))

(declare-fun b!225736 () Bool)

(declare-fun res!189418 () Bool)

(assert (=> b!225736 (=> (not res!189418) (not e!154174))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225736 (= res!189418 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4938 (buf!5479 thiss!1870))) ((_ sign_extend 32) (currentByte!10266 thiss!1870)) ((_ sign_extend 32) (currentBit!10261 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225737 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225737 (= e!154175 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4938 (buf!5479 (_2!10444 lt!358779))) (currentByte!10266 (_2!10444 lt!358779)) (currentBit!10261 (_2!10444 lt!358779)))))))

(assert (= (and start!47292 res!189419) b!225736))

(assert (= (and b!225736 res!189418) b!225734))

(assert (= (and b!225734 res!189417) b!225733))

(assert (= (and b!225733 res!189420) b!225737))

(assert (= start!47292 b!225735))

(declare-fun m!346773 () Bool)

(assert (=> b!225737 m!346773))

(declare-fun m!346775 () Bool)

(assert (=> b!225736 m!346775))

(declare-fun m!346777 () Bool)

(assert (=> start!47292 m!346777))

(declare-fun m!346779 () Bool)

(assert (=> start!47292 m!346779))

(declare-fun m!346781 () Bool)

(assert (=> b!225735 m!346781))

(declare-fun m!346783 () Bool)

(assert (=> b!225733 m!346783))

(push 1)

(assert (not b!225736))

(assert (not b!225737))

(assert (not start!47292))

(assert (not b!225735))

(assert (not b!225733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76598 () Bool)

(assert (=> d!76598 (= (array_inv!4679 arr!308) (bvsge (size!4938 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47292 d!76598))

(declare-fun d!76600 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76600 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10261 thiss!1870) (currentByte!10266 thiss!1870) (size!4938 (buf!5479 thiss!1870))))))

(declare-fun bs!18722 () Bool)

(assert (= bs!18722 d!76600))

(declare-fun m!346785 () Bool)

(assert (=> bs!18722 m!346785))

(assert (=> start!47292 d!76600))

(declare-fun d!76602 () Bool)

(declare-fun lt!358830 () (_ BitVec 8))

(declare-fun lt!358836 () (_ BitVec 8))

(assert (=> d!76602 (= lt!358830 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5895 (buf!5479 thiss!1870)) (currentByte!10266 thiss!1870))) ((_ sign_extend 24) lt!358836))))))

(assert (=> d!76602 (= lt!358836 ((_ extract 7 0) (currentBit!10261 thiss!1870)))))

(declare-fun e!154190 () Bool)

(assert (=> d!76602 e!154190))

(declare-fun res!189439 () Bool)

(assert (=> d!76602 (=> (not res!189439) (not e!154190))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76602 (= res!189439 (validate_offset_bits!1 ((_ sign_extend 32) (size!4938 (buf!5479 thiss!1870))) ((_ sign_extend 32) (currentByte!10266 thiss!1870)) ((_ sign_extend 32) (currentBit!10261 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!16605 0))(
  ( (Unit!16606) )
))
(declare-datatypes ((tuple2!19316 0))(
  ( (tuple2!19317 (_1!10445 Unit!16605) (_2!10445 (_ BitVec 8))) )
))
(declare-fun Unit!16607 () Unit!16605)

(declare-fun Unit!16608 () Unit!16605)

(assert (=> d!76602 (= (readByte!0 thiss!1870) (tuple2!19315 (_2!10445 (ite (bvsgt ((_ sign_extend 24) lt!358836) #b00000000000000000000000000000000) (tuple2!19317 Unit!16607 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358830) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5895 (buf!5479 thiss!1870)) (bvadd (currentByte!10266 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358836)))))))) (tuple2!19317 Unit!16608 lt!358830))) (BitStream!8973 (buf!5479 thiss!1870) (bvadd (currentByte!10266 thiss!1870) #b00000000000000000000000000000001) (currentBit!10261 thiss!1870))))))

(declare-fun b!225754 () Bool)

(declare-fun e!154189 () Bool)

(assert (=> b!225754 (= e!154190 e!154189)))

(declare-fun res!189440 () Bool)

(assert (=> b!225754 (=> (not res!189440) (not e!154189))))

(declare-fun lt!358833 () tuple2!19314)

(assert (=> b!225754 (= res!189440 (= (buf!5479 (_2!10444 lt!358833)) (buf!5479 thiss!1870)))))

(declare-fun lt!358834 () (_ BitVec 8))

(declare-fun lt!358831 () (_ BitVec 8))

(declare-fun Unit!16612 () Unit!16605)

(declare-fun Unit!16614 () Unit!16605)

(assert (=> b!225754 (= lt!358833 (tuple2!19315 (_2!10445 (ite (bvsgt ((_ sign_extend 24) lt!358834) #b00000000000000000000000000000000) (tuple2!19317 Unit!16612 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358831) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5895 (buf!5479 thiss!1870)) (bvadd (currentByte!10266 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358834)))))))) (tuple2!19317 Unit!16614 lt!358831))) (BitStream!8973 (buf!5479 thiss!1870) (bvadd (currentByte!10266 thiss!1870) #b00000000000000000000000000000001) (currentBit!10261 thiss!1870))))))

(assert (=> b!225754 (= lt!358831 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5895 (buf!5479 thiss!1870)) (currentByte!10266 thiss!1870))) ((_ sign_extend 24) lt!358834))))))

(assert (=> b!225754 (= lt!358834 ((_ extract 7 0) (currentBit!10261 thiss!1870)))))

(declare-fun lt!358835 () (_ BitVec 64))

(declare-fun lt!358832 () (_ BitVec 64))

(declare-fun b!225755 () Bool)

(assert (=> b!225755 (= e!154189 (= (bitIndex!0 (size!4938 (buf!5479 (_2!10444 lt!358833))) (currentByte!10266 (_2!10444 lt!358833)) (currentBit!10261 (_2!10444 lt!358833))) (bvadd lt!358832 lt!358835)))))

(assert (=> b!225755 (or (not (= (bvand lt!358832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358835 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!358832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!358832 lt!358835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!225755 (= lt!358835 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!225755 (= lt!358832 (bitIndex!0 (size!4938 (buf!5479 thiss!1870)) (currentByte!10266 thiss!1870) (currentBit!10261 thiss!1870)))))

(assert (= (and d!76602 res!189439) b!225754))

(assert (= (and b!225754 res!189440) b!225755))

(declare-fun m!346801 () Bool)

(assert (=> d!76602 m!346801))

(declare-fun m!346803 () Bool)

(assert (=> d!76602 m!346803))

(declare-fun m!346805 () Bool)

(assert (=> d!76602 m!346805))

(assert (=> b!225754 m!346805))

(assert (=> b!225754 m!346801))

(declare-fun m!346807 () Bool)

(assert (=> b!225755 m!346807))

(declare-fun m!346809 () Bool)

(assert (=> b!225755 m!346809))

(assert (=> b!225733 d!76602))

(declare-fun d!76620 () Bool)

(declare-fun e!154199 () Bool)

(assert (=> d!76620 e!154199))

(declare-fun res!189453 () Bool)

(assert (=> d!76620 (=> (not res!189453) (not e!154199))))

(declare-fun lt!358873 () (_ BitVec 64))

(declare-fun lt!358870 () (_ BitVec 64))

(declare-fun lt!358872 () (_ BitVec 64))

(assert (=> d!76620 (= res!189453 (= lt!358872 (bvsub lt!358870 lt!358873)))))

(assert (=> d!76620 (or (= (bvand lt!358870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358870 lt!358873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76620 (= lt!358873 (remainingBits!0 ((_ sign_extend 32) (size!4938 (buf!5479 (_2!10444 lt!358779)))) ((_ sign_extend 32) (currentByte!10266 (_2!10444 lt!358779))) ((_ sign_extend 32) (currentBit!10261 (_2!10444 lt!358779)))))))

(declare-fun lt!358875 () (_ BitVec 64))

(declare-fun lt!358871 () (_ BitVec 64))

(assert (=> d!76620 (= lt!358870 (bvmul lt!358875 lt!358871))))

(assert (=> d!76620 (or (= lt!358875 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358871 (bvsdiv (bvmul lt!358875 lt!358871) lt!358875)))))

(assert (=> d!76620 (= lt!358871 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76620 (= lt!358875 ((_ sign_extend 32) (size!4938 (buf!5479 (_2!10444 lt!358779)))))))

(assert (=> d!76620 (= lt!358872 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10266 (_2!10444 lt!358779))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10261 (_2!10444 lt!358779)))))))

(assert (=> d!76620 (invariant!0 (currentBit!10261 (_2!10444 lt!358779)) (currentByte!10266 (_2!10444 lt!358779)) (size!4938 (buf!5479 (_2!10444 lt!358779))))))

(assert (=> d!76620 (= (bitIndex!0 (size!4938 (buf!5479 (_2!10444 lt!358779))) (currentByte!10266 (_2!10444 lt!358779)) (currentBit!10261 (_2!10444 lt!358779))) lt!358872)))

(declare-fun b!225766 () Bool)

(declare-fun res!189452 () Bool)

(assert (=> b!225766 (=> (not res!189452) (not e!154199))))

(assert (=> b!225766 (= res!189452 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358872))))

(declare-fun b!225767 () Bool)

(declare-fun lt!358874 () (_ BitVec 64))

(assert (=> b!225767 (= e!154199 (bvsle lt!358872 (bvmul lt!358874 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225767 (or (= lt!358874 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358874 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358874)))))

(assert (=> b!225767 (= lt!358874 ((_ sign_extend 32) (size!4938 (buf!5479 (_2!10444 lt!358779)))))))

(assert (= (and d!76620 res!189453) b!225766))

(assert (= (and b!225766 res!189452) b!225767))

(declare-fun m!346823 () Bool)

(assert (=> d!76620 m!346823))

(declare-fun m!346825 () Bool)

(assert (=> d!76620 m!346825))

(assert (=> b!225737 d!76620))

(declare-fun d!76628 () Bool)

(assert (=> d!76628 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4938 (buf!5479 thiss!1870))) ((_ sign_extend 32) (currentByte!10266 thiss!1870)) ((_ sign_extend 32) (currentBit!10261 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4938 (buf!5479 thiss!1870))) ((_ sign_extend 32) (currentByte!10266 thiss!1870)) ((_ sign_extend 32) (currentBit!10261 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18727 () Bool)

(assert (= bs!18727 d!76628))

(declare-fun m!346827 () Bool)

(assert (=> bs!18727 m!346827))

(assert (=> b!225736 d!76628))

(declare-fun d!76630 () Bool)

(assert (=> d!76630 (= (array_inv!4679 (buf!5479 thiss!1870)) (bvsge (size!4938 (buf!5479 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225735 d!76630))

(push 1)

(assert (not d!76600))

(assert (not d!76602))

(assert (not d!76620))

(assert (not b!225755))

(assert (not d!76628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

