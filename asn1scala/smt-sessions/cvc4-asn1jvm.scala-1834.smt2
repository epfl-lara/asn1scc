; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49240 () Bool)

(assert start!49240)

(declare-fun b!234012 () Bool)

(declare-fun e!161326 () Bool)

(declare-fun e!161332 () Bool)

(assert (=> b!234012 (= e!161326 e!161332)))

(declare-fun res!195768 () Bool)

(assert (=> b!234012 (=> (not res!195768) (not e!161332))))

(declare-datatypes ((array!12101 0))(
  ( (array!12102 (arr!6297 (Array (_ BitVec 32) (_ BitVec 8))) (size!5310 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9716 0))(
  ( (BitStream!9717 (buf!5851 array!12101) (currentByte!10894 (_ BitVec 32)) (currentBit!10889 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9716)

(declare-fun lt!369762 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!234012 (= res!195768 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5310 (buf!5851 b1!101)))) lt!369762) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234012 (= lt!369762 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10894 b1!101))) ((_ sign_extend 32) (currentBit!10889 b1!101))))))

(declare-fun b!234013 () Bool)

(declare-fun e!161324 () Bool)

(assert (=> b!234013 (= e!161324 e!161326)))

(declare-fun res!195765 () Bool)

(assert (=> b!234013 (=> (not res!195765) (not e!161326))))

(declare-fun lt!369764 () (_ BitVec 32))

(assert (=> b!234013 (= res!195765 (bvsle lt!369764 bytes!19))))

(declare-fun lt!369763 () (_ BitVec 64))

(assert (=> b!234013 (= lt!369764 ((_ extract 31 0) lt!369763))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!234013 (= lt!369763 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!234015 () Bool)

(declare-fun lt!369766 () (_ BitVec 32))

(declare-fun e!161333 () Bool)

(assert (=> b!234015 (= e!161333 (and (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand lt!369764 #b10000000000000000000000000000000))) (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand lt!369766 #b10000000000000000000000000000000)))))))

(declare-fun b!234016 () Bool)

(declare-fun e!161331 () Bool)

(assert (=> b!234016 (= e!161331 e!161324)))

(declare-fun res!195764 () Bool)

(assert (=> b!234016 (=> (not res!195764) (not e!161324))))

(declare-fun lt!369765 () (_ BitVec 64))

(assert (=> b!234016 (= res!195764 (bvsle bits!86 lt!369765))))

(declare-fun b2!99 () BitStream!9716)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234016 (= lt!369765 (bitIndex!0 (size!5310 (buf!5851 b2!99)) (currentByte!10894 b2!99) (currentBit!10889 b2!99)))))

(declare-fun b!234017 () Bool)

(declare-fun res!195762 () Bool)

(assert (=> b!234017 (=> (not res!195762) (not e!161326))))

(assert (=> b!234017 (= res!195762 (= lt!369765 (bvadd (bitIndex!0 (size!5310 (buf!5851 b1!101)) (currentByte!10894 b1!101) (currentBit!10889 b1!101)) bits!86)))))

(declare-fun b!234018 () Bool)

(declare-fun res!195771 () Bool)

(assert (=> b!234018 (=> (not res!195771) (not e!161326))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!234018 (= res!195771 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5310 (buf!5851 b1!101))) ((_ sign_extend 32) (currentByte!10894 b1!101)) ((_ sign_extend 32) (currentBit!10889 b1!101)) bytes!19))))

(declare-fun b!234019 () Bool)

(declare-fun e!161325 () Bool)

(declare-fun array_inv!5051 (array!12101) Bool)

(assert (=> b!234019 (= e!161325 (array_inv!5051 (buf!5851 b2!99)))))

(declare-fun res!195769 () Bool)

(assert (=> start!49240 (=> (not res!195769) (not e!161331))))

(assert (=> start!49240 (= res!195769 (and (= (size!5310 (buf!5851 b1!101)) (size!5310 (buf!5851 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49240 e!161331))

(declare-fun e!161327 () Bool)

(declare-fun inv!12 (BitStream!9716) Bool)

(assert (=> start!49240 (and (inv!12 b1!101) e!161327)))

(assert (=> start!49240 (and (inv!12 b2!99) e!161325)))

(assert (=> start!49240 true))

(declare-fun b!234014 () Bool)

(declare-fun e!161328 () Bool)

(assert (=> b!234014 (= e!161332 e!161328)))

(declare-fun res!195767 () Bool)

(assert (=> b!234014 (=> (not res!195767) (not e!161328))))

(declare-fun lt!369768 () (_ BitVec 64))

(assert (=> b!234014 (= res!195767 (and (= lt!369765 lt!369768) (= (bvsub lt!369765 bits!86) lt!369762)))))

(assert (=> b!234014 (= lt!369768 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10894 b2!99))) ((_ sign_extend 32) (currentBit!10889 b2!99))))))

(declare-fun b!234020 () Bool)

(declare-fun e!161330 () Bool)

(assert (=> b!234020 (= e!161328 e!161330)))

(declare-fun res!195766 () Bool)

(assert (=> b!234020 (=> (not res!195766) (not e!161330))))

(declare-fun lt!369767 () (_ BitVec 64))

(assert (=> b!234020 (= res!195766 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369767 (bvsub lt!369768 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369767 lt!369768) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369763))))))

(assert (=> b!234020 (= lt!369767 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5310 (buf!5851 b2!99)))))))

(declare-fun b!234021 () Bool)

(assert (=> b!234021 (= e!161327 (array_inv!5051 (buf!5851 b1!101)))))

(declare-fun b!234022 () Bool)

(assert (=> b!234022 (= e!161330 e!161333)))

(declare-fun res!195770 () Bool)

(assert (=> b!234022 (=> (not res!195770) (not e!161333))))

(assert (=> b!234022 (= res!195770 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5310 (buf!5851 b2!99))) ((_ sign_extend 32) (currentByte!10894 b2!99)) ((_ sign_extend 32) (currentBit!10889 b2!99)) lt!369766))))

(assert (=> b!234022 (= lt!369766 (bvsub bytes!19 lt!369764))))

(declare-fun b!234023 () Bool)

(declare-fun res!195763 () Bool)

(assert (=> b!234023 (=> (not res!195763) (not e!161326))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!234023 (= res!195763 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5310 (buf!5851 b1!101))) ((_ sign_extend 32) (currentByte!10894 b1!101)) ((_ sign_extend 32) (currentBit!10889 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!49240 res!195769) b!234016))

(assert (= (and b!234016 res!195764) b!234013))

(assert (= (and b!234013 res!195765) b!234018))

(assert (= (and b!234018 res!195771) b!234017))

(assert (= (and b!234017 res!195762) b!234023))

(assert (= (and b!234023 res!195763) b!234012))

(assert (= (and b!234012 res!195768) b!234014))

(assert (= (and b!234014 res!195767) b!234020))

(assert (= (and b!234020 res!195766) b!234022))

(assert (= (and b!234022 res!195770) b!234015))

(assert (= start!49240 b!234021))

(assert (= start!49240 b!234019))

(declare-fun m!356363 () Bool)

(assert (=> start!49240 m!356363))

(declare-fun m!356365 () Bool)

(assert (=> start!49240 m!356365))

(declare-fun m!356367 () Bool)

(assert (=> b!234017 m!356367))

(declare-fun m!356369 () Bool)

(assert (=> b!234018 m!356369))

(declare-fun m!356371 () Bool)

(assert (=> b!234022 m!356371))

(declare-fun m!356373 () Bool)

(assert (=> b!234021 m!356373))

(declare-fun m!356375 () Bool)

(assert (=> b!234019 m!356375))

(declare-fun m!356377 () Bool)

(assert (=> b!234016 m!356377))

(declare-fun m!356379 () Bool)

(assert (=> b!234023 m!356379))

(push 1)

(assert (not b!234023))

(assert (not b!234019))

(assert (not b!234016))

(assert (not start!49240))

(assert (not b!234022))

(assert (not b!234021))

(assert (not b!234018))

(assert (not b!234017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78778 () Bool)

(assert (=> d!78778 (= (array_inv!5051 (buf!5851 b1!101)) (bvsge (size!5310 (buf!5851 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!234021 d!78778))

(declare-fun d!78780 () Bool)

(declare-fun e!161344 () Bool)

(assert (=> d!78780 e!161344))

(declare-fun res!195792 () Bool)

(assert (=> d!78780 (=> (not res!195792) (not e!161344))))

(declare-fun lt!369831 () (_ BitVec 64))

(declare-fun lt!369833 () (_ BitVec 64))

(declare-fun lt!369834 () (_ BitVec 64))

(assert (=> d!78780 (= res!195792 (= lt!369831 (bvsub lt!369834 lt!369833)))))

(assert (=> d!78780 (or (= (bvand lt!369834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369834 lt!369833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78780 (= lt!369833 (remainingBits!0 ((_ sign_extend 32) (size!5310 (buf!5851 b2!99))) ((_ sign_extend 32) (currentByte!10894 b2!99)) ((_ sign_extend 32) (currentBit!10889 b2!99))))))

(declare-fun lt!369829 () (_ BitVec 64))

(declare-fun lt!369832 () (_ BitVec 64))

(assert (=> d!78780 (= lt!369834 (bvmul lt!369829 lt!369832))))

(assert (=> d!78780 (or (= lt!369829 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369832 (bvsdiv (bvmul lt!369829 lt!369832) lt!369829)))))

(assert (=> d!78780 (= lt!369832 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78780 (= lt!369829 ((_ sign_extend 32) (size!5310 (buf!5851 b2!99))))))

(assert (=> d!78780 (= lt!369831 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10894 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10889 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78780 (invariant!0 (currentBit!10889 b2!99) (currentByte!10894 b2!99) (size!5310 (buf!5851 b2!99)))))

(assert (=> d!78780 (= (bitIndex!0 (size!5310 (buf!5851 b2!99)) (currentByte!10894 b2!99) (currentBit!10889 b2!99)) lt!369831)))

(declare-fun b!234044 () Bool)

(declare-fun res!195793 () Bool)

(assert (=> b!234044 (=> (not res!195793) (not e!161344))))

(assert (=> b!234044 (= res!195793 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369831))))

(declare-fun b!234045 () Bool)

(declare-fun lt!369830 () (_ BitVec 64))

(assert (=> b!234045 (= e!161344 (bvsle lt!369831 (bvmul lt!369830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234045 (or (= lt!369830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369830)))))

(assert (=> b!234045 (= lt!369830 ((_ sign_extend 32) (size!5310 (buf!5851 b2!99))))))

(assert (= (and d!78780 res!195792) b!234044))

(assert (= (and b!234044 res!195793) b!234045))

(declare-fun m!356393 () Bool)

(assert (=> d!78780 m!356393))

(declare-fun m!356395 () Bool)

(assert (=> d!78780 m!356395))

(assert (=> b!234016 d!78780))

(declare-fun d!78782 () Bool)

(declare-fun e!161345 () Bool)

(assert (=> d!78782 e!161345))

(declare-fun res!195794 () Bool)

(assert (=> d!78782 (=> (not res!195794) (not e!161345))))

(declare-fun lt!369840 () (_ BitVec 64))

(declare-fun lt!369837 () (_ BitVec 64))

(declare-fun lt!369839 () (_ BitVec 64))

(assert (=> d!78782 (= res!195794 (= lt!369837 (bvsub lt!369840 lt!369839)))))

(assert (=> d!78782 (or (= (bvand lt!369840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369840 lt!369839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78782 (= lt!369839 (remainingBits!0 ((_ sign_extend 32) (size!5310 (buf!5851 b1!101))) ((_ sign_extend 32) (currentByte!10894 b1!101)) ((_ sign_extend 32) (currentBit!10889 b1!101))))))

(declare-fun lt!369835 () (_ BitVec 64))

(declare-fun lt!369838 () (_ BitVec 64))

(assert (=> d!78782 (= lt!369840 (bvmul lt!369835 lt!369838))))

(assert (=> d!78782 (or (= lt!369835 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369838 (bvsdiv (bvmul lt!369835 lt!369838) lt!369835)))))

(assert (=> d!78782 (= lt!369838 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78782 (= lt!369835 ((_ sign_extend 32) (size!5310 (buf!5851 b1!101))))))

(assert (=> d!78782 (= lt!369837 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10894 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10889 b1!101))))))

(assert (=> d!78782 (invariant!0 (currentBit!10889 b1!101) (currentByte!10894 b1!101) (size!5310 (buf!5851 b1!101)))))

(assert (=> d!78782 (= (bitIndex!0 (size!5310 (buf!5851 b1!101)) (currentByte!10894 b1!101) (currentBit!10889 b1!101)) lt!369837)))

(declare-fun b!234046 () Bool)

(declare-fun res!195795 () Bool)

(assert (=> b!234046 (=> (not res!195795) (not e!161345))))

(assert (=> b!234046 (= res!195795 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369837))))

(declare-fun b!234047 () Bool)

(declare-fun lt!369836 () (_ BitVec 64))

(assert (=> b!234047 (= e!161345 (bvsle lt!369837 (bvmul lt!369836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234047 (or (= lt!369836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369836)))))

(assert (=> b!234047 (= lt!369836 ((_ sign_extend 32) (size!5310 (buf!5851 b1!101))))))

(assert (= (and d!78782 res!195794) b!234046))

(assert (= (and b!234046 res!195795) b!234047))

(assert (=> d!78782 m!356379))

(declare-fun m!356397 () Bool)

(assert (=> d!78782 m!356397))

(assert (=> b!234017 d!78782))

(declare-fun d!78784 () Bool)

(assert (=> d!78784 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5310 (buf!5851 b2!99))) ((_ sign_extend 32) (currentByte!10894 b2!99)) ((_ sign_extend 32) (currentBit!10889 b2!99)) lt!369766) (bvsle ((_ sign_extend 32) lt!369766) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5310 (buf!5851 b2!99))) ((_ sign_extend 32) (currentByte!10894 b2!99)) ((_ sign_extend 32) (currentBit!10889 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19419 () Bool)

(assert (= bs!19419 d!78784))

(assert (=> bs!19419 m!356393))

(assert (=> b!234022 d!78784))

(declare-fun d!78786 () Bool)

(assert (=> d!78786 (= (remainingBits!0 ((_ sign_extend 32) (size!5310 (buf!5851 b1!101))) ((_ sign_extend 32) (currentByte!10894 b1!101)) ((_ sign_extend 32) (currentBit!10889 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5310 (buf!5851 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10894 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10889 b1!101)))))))

(assert (=> b!234023 d!78786))

(declare-fun d!78788 () Bool)

(assert (=> d!78788 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5310 (buf!5851 b1!101))) ((_ sign_extend 32) (currentByte!10894 b1!101)) ((_ sign_extend 32) (currentBit!10889 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5310 (buf!5851 b1!101))) ((_ sign_extend 32) (currentByte!10894 b1!101)) ((_ sign_extend 32) (currentBit!10889 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19420 () Bool)

(assert (= bs!19420 d!78788))

(assert (=> bs!19420 m!356379))

(assert (=> b!234018 d!78788))

(declare-fun d!78790 () Bool)

(assert (=> d!78790 (= (array_inv!5051 (buf!5851 b2!99)) (bvsge (size!5310 (buf!5851 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!234019 d!78790))

(declare-fun d!78792 () Bool)

(assert (=> d!78792 (= (inv!12 b1!101) (invariant!0 (currentBit!10889 b1!101) (currentByte!10894 b1!101) (size!5310 (buf!5851 b1!101))))))

(declare-fun bs!19421 () Bool)

(assert (= bs!19421 d!78792))

(assert (=> bs!19421 m!356397))

(assert (=> start!49240 d!78792))

(declare-fun d!78794 () Bool)

(assert (=> d!78794 (= (inv!12 b2!99) (invariant!0 (currentBit!10889 b2!99) (currentByte!10894 b2!99) (size!5310 (buf!5851 b2!99))))))

(declare-fun bs!19422 () Bool)

(assert (= bs!19422 d!78794))

(assert (=> bs!19422 m!356395))

(assert (=> start!49240 d!78794))

(push 1)

(assert (not d!78780))

(assert (not d!78782))

(assert (not d!78794))

(assert (not d!78788))

(assert (not d!78784))

(assert (not d!78792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

