; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49238 () Bool)

(assert start!49238)

(declare-fun b!233976 () Bool)

(declare-fun res!195739 () Bool)

(declare-fun e!161296 () Bool)

(assert (=> b!233976 (=> (not res!195739) (not e!161296))))

(declare-datatypes ((array!12099 0))(
  ( (array!12100 (arr!6296 (Array (_ BitVec 32) (_ BitVec 8))) (size!5309 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9714 0))(
  ( (BitStream!9715 (buf!5850 array!12099) (currentByte!10893 (_ BitVec 32)) (currentBit!10888 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9714)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233976 (= res!195739 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5309 (buf!5850 b1!101))) ((_ sign_extend 32) (currentByte!10893 b1!101)) ((_ sign_extend 32) (currentBit!10888 b1!101)) bytes!19))))

(declare-fun b!233977 () Bool)

(declare-fun e!161291 () Bool)

(declare-fun b2!99 () BitStream!9714)

(declare-fun array_inv!5050 (array!12099) Bool)

(assert (=> b!233977 (= e!161291 (array_inv!5050 (buf!5850 b2!99)))))

(declare-fun res!195740 () Bool)

(declare-fun e!161297 () Bool)

(assert (=> start!49238 (=> (not res!195740) (not e!161297))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> start!49238 (= res!195740 (and (= (size!5309 (buf!5850 b1!101)) (size!5309 (buf!5850 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49238 e!161297))

(declare-fun e!161298 () Bool)

(declare-fun inv!12 (BitStream!9714) Bool)

(assert (=> start!49238 (and (inv!12 b1!101) e!161298)))

(assert (=> start!49238 (and (inv!12 b2!99) e!161291)))

(assert (=> start!49238 true))

(declare-fun b!233978 () Bool)

(declare-fun e!161290 () Bool)

(assert (=> b!233978 (= e!161297 e!161290)))

(declare-fun res!195741 () Bool)

(assert (=> b!233978 (=> (not res!195741) (not e!161290))))

(declare-fun lt!369742 () (_ BitVec 64))

(assert (=> b!233978 (= res!195741 (bvsle bits!86 lt!369742))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233978 (= lt!369742 (bitIndex!0 (size!5309 (buf!5850 b2!99)) (currentByte!10893 b2!99) (currentBit!10888 b2!99)))))

(declare-fun b!233979 () Bool)

(declare-fun e!161294 () Bool)

(assert (=> b!233979 (= e!161296 e!161294)))

(declare-fun res!195735 () Bool)

(assert (=> b!233979 (=> (not res!195735) (not e!161294))))

(declare-fun lt!369747 () (_ BitVec 64))

(assert (=> b!233979 (= res!195735 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5309 (buf!5850 b1!101)))) lt!369747) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233979 (= lt!369747 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10893 b1!101))) ((_ sign_extend 32) (currentBit!10888 b1!101))))))

(declare-fun b!233980 () Bool)

(declare-fun res!195732 () Bool)

(assert (=> b!233980 (=> (not res!195732) (not e!161296))))

(assert (=> b!233980 (= res!195732 (= lt!369742 (bvadd (bitIndex!0 (size!5309 (buf!5850 b1!101)) (currentByte!10893 b1!101) (currentBit!10888 b1!101)) bits!86)))))

(declare-fun b!233981 () Bool)

(declare-fun e!161293 () Bool)

(declare-fun e!161292 () Bool)

(assert (=> b!233981 (= e!161293 e!161292)))

(declare-fun res!195733 () Bool)

(assert (=> b!233981 (=> (not res!195733) (not e!161292))))

(declare-fun lt!369743 () (_ BitVec 32))

(assert (=> b!233981 (= res!195733 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5309 (buf!5850 b2!99))) ((_ sign_extend 32) (currentByte!10893 b2!99)) ((_ sign_extend 32) (currentBit!10888 b2!99)) lt!369743))))

(declare-fun lt!369745 () (_ BitVec 32))

(assert (=> b!233981 (= lt!369743 (bvsub bytes!19 lt!369745))))

(declare-fun b!233982 () Bool)

(declare-fun e!161295 () Bool)

(assert (=> b!233982 (= e!161294 e!161295)))

(declare-fun res!195738 () Bool)

(assert (=> b!233982 (=> (not res!195738) (not e!161295))))

(declare-fun lt!369746 () (_ BitVec 64))

(assert (=> b!233982 (= res!195738 (and (= lt!369742 lt!369746) (= (bvsub lt!369742 bits!86) lt!369747)))))

(assert (=> b!233982 (= lt!369746 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10893 b2!99))) ((_ sign_extend 32) (currentBit!10888 b2!99))))))

(declare-fun b!233983 () Bool)

(assert (=> b!233983 (= e!161298 (array_inv!5050 (buf!5850 b1!101)))))

(declare-fun b!233984 () Bool)

(assert (=> b!233984 (= e!161290 e!161296)))

(declare-fun res!195737 () Bool)

(assert (=> b!233984 (=> (not res!195737) (not e!161296))))

(assert (=> b!233984 (= res!195737 (bvsle lt!369745 bytes!19))))

(declare-fun lt!369744 () (_ BitVec 64))

(assert (=> b!233984 (= lt!369745 ((_ extract 31 0) lt!369744))))

(assert (=> b!233984 (= lt!369744 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233985 () Bool)

(declare-fun res!195734 () Bool)

(assert (=> b!233985 (=> (not res!195734) (not e!161296))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233985 (= res!195734 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5309 (buf!5850 b1!101))) ((_ sign_extend 32) (currentByte!10893 b1!101)) ((_ sign_extend 32) (currentBit!10888 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233986 () Bool)

(assert (=> b!233986 (= e!161292 (and (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand lt!369745 #b10000000000000000000000000000000))) (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand lt!369743 #b10000000000000000000000000000000)))))))

(declare-fun b!233987 () Bool)

(assert (=> b!233987 (= e!161295 e!161293)))

(declare-fun res!195736 () Bool)

(assert (=> b!233987 (=> (not res!195736) (not e!161293))))

(declare-fun lt!369741 () (_ BitVec 64))

(assert (=> b!233987 (= res!195736 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369741 (bvsub lt!369746 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369741 lt!369746) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369744))))))

(assert (=> b!233987 (= lt!369741 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5309 (buf!5850 b2!99)))))))

(assert (= (and start!49238 res!195740) b!233978))

(assert (= (and b!233978 res!195741) b!233984))

(assert (= (and b!233984 res!195737) b!233976))

(assert (= (and b!233976 res!195739) b!233980))

(assert (= (and b!233980 res!195732) b!233985))

(assert (= (and b!233985 res!195734) b!233979))

(assert (= (and b!233979 res!195735) b!233982))

(assert (= (and b!233982 res!195738) b!233987))

(assert (= (and b!233987 res!195736) b!233981))

(assert (= (and b!233981 res!195733) b!233986))

(assert (= start!49238 b!233983))

(assert (= start!49238 b!233977))

(declare-fun m!356345 () Bool)

(assert (=> b!233985 m!356345))

(declare-fun m!356347 () Bool)

(assert (=> start!49238 m!356347))

(declare-fun m!356349 () Bool)

(assert (=> start!49238 m!356349))

(declare-fun m!356351 () Bool)

(assert (=> b!233983 m!356351))

(declare-fun m!356353 () Bool)

(assert (=> b!233976 m!356353))

(declare-fun m!356355 () Bool)

(assert (=> b!233977 m!356355))

(declare-fun m!356357 () Bool)

(assert (=> b!233978 m!356357))

(declare-fun m!356359 () Bool)

(assert (=> b!233981 m!356359))

(declare-fun m!356361 () Bool)

(assert (=> b!233980 m!356361))

(check-sat (not b!233977) (not b!233978) (not start!49238) (not b!233983) (not b!233985) (not b!233981) (not b!233980) (not b!233976))
(check-sat)
(get-model)

(declare-fun d!78742 () Bool)

(declare-fun e!161336 () Bool)

(assert (=> d!78742 e!161336))

(declare-fun res!195776 () Bool)

(assert (=> d!78742 (=> (not res!195776) (not e!161336))))

(declare-fun lt!369786 () (_ BitVec 64))

(declare-fun lt!369782 () (_ BitVec 64))

(declare-fun lt!369781 () (_ BitVec 64))

(assert (=> d!78742 (= res!195776 (= lt!369786 (bvsub lt!369781 lt!369782)))))

(assert (=> d!78742 (or (= (bvand lt!369781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369782 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369781 lt!369782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78742 (= lt!369782 (remainingBits!0 ((_ sign_extend 32) (size!5309 (buf!5850 b1!101))) ((_ sign_extend 32) (currentByte!10893 b1!101)) ((_ sign_extend 32) (currentBit!10888 b1!101))))))

(declare-fun lt!369783 () (_ BitVec 64))

(declare-fun lt!369785 () (_ BitVec 64))

(assert (=> d!78742 (= lt!369781 (bvmul lt!369783 lt!369785))))

(assert (=> d!78742 (or (= lt!369783 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369785 (bvsdiv (bvmul lt!369783 lt!369785) lt!369783)))))

(assert (=> d!78742 (= lt!369785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78742 (= lt!369783 ((_ sign_extend 32) (size!5309 (buf!5850 b1!101))))))

(assert (=> d!78742 (= lt!369786 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10893 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10888 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78742 (invariant!0 (currentBit!10888 b1!101) (currentByte!10893 b1!101) (size!5309 (buf!5850 b1!101)))))

(assert (=> d!78742 (= (bitIndex!0 (size!5309 (buf!5850 b1!101)) (currentByte!10893 b1!101) (currentBit!10888 b1!101)) lt!369786)))

(declare-fun b!234028 () Bool)

(declare-fun res!195777 () Bool)

(assert (=> b!234028 (=> (not res!195777) (not e!161336))))

(assert (=> b!234028 (= res!195777 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369786))))

(declare-fun b!234029 () Bool)

(declare-fun lt!369784 () (_ BitVec 64))

(assert (=> b!234029 (= e!161336 (bvsle lt!369786 (bvmul lt!369784 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234029 (or (= lt!369784 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369784 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369784)))))

(assert (=> b!234029 (= lt!369784 ((_ sign_extend 32) (size!5309 (buf!5850 b1!101))))))

(assert (= (and d!78742 res!195776) b!234028))

(assert (= (and b!234028 res!195777) b!234029))

(assert (=> d!78742 m!356345))

(declare-fun m!356381 () Bool)

(assert (=> d!78742 m!356381))

(assert (=> b!233980 d!78742))

(declare-fun d!78744 () Bool)

(assert (=> d!78744 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5309 (buf!5850 b2!99))) ((_ sign_extend 32) (currentByte!10893 b2!99)) ((_ sign_extend 32) (currentBit!10888 b2!99)) lt!369743) (bvsle ((_ sign_extend 32) lt!369743) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5309 (buf!5850 b2!99))) ((_ sign_extend 32) (currentByte!10893 b2!99)) ((_ sign_extend 32) (currentBit!10888 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19411 () Bool)

(assert (= bs!19411 d!78744))

(declare-fun m!356383 () Bool)

(assert (=> bs!19411 m!356383))

(assert (=> b!233981 d!78744))

(declare-fun d!78746 () Bool)

(assert (=> d!78746 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5309 (buf!5850 b1!101))) ((_ sign_extend 32) (currentByte!10893 b1!101)) ((_ sign_extend 32) (currentBit!10888 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5309 (buf!5850 b1!101))) ((_ sign_extend 32) (currentByte!10893 b1!101)) ((_ sign_extend 32) (currentBit!10888 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19412 () Bool)

(assert (= bs!19412 d!78746))

(assert (=> bs!19412 m!356345))

(assert (=> b!233976 d!78746))

(declare-fun d!78748 () Bool)

(assert (=> d!78748 (= (array_inv!5050 (buf!5850 b2!99)) (bvsge (size!5309 (buf!5850 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233977 d!78748))

(declare-fun d!78750 () Bool)

(assert (=> d!78750 (= (array_inv!5050 (buf!5850 b1!101)) (bvsge (size!5309 (buf!5850 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233983 d!78750))

(declare-fun d!78752 () Bool)

(declare-fun e!161337 () Bool)

(assert (=> d!78752 e!161337))

(declare-fun res!195778 () Bool)

(assert (=> d!78752 (=> (not res!195778) (not e!161337))))

(declare-fun lt!369788 () (_ BitVec 64))

(declare-fun lt!369792 () (_ BitVec 64))

(declare-fun lt!369787 () (_ BitVec 64))

(assert (=> d!78752 (= res!195778 (= lt!369792 (bvsub lt!369787 lt!369788)))))

(assert (=> d!78752 (or (= (bvand lt!369787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369788 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369787 lt!369788) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78752 (= lt!369788 (remainingBits!0 ((_ sign_extend 32) (size!5309 (buf!5850 b2!99))) ((_ sign_extend 32) (currentByte!10893 b2!99)) ((_ sign_extend 32) (currentBit!10888 b2!99))))))

(declare-fun lt!369789 () (_ BitVec 64))

(declare-fun lt!369791 () (_ BitVec 64))

(assert (=> d!78752 (= lt!369787 (bvmul lt!369789 lt!369791))))

(assert (=> d!78752 (or (= lt!369789 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369791 (bvsdiv (bvmul lt!369789 lt!369791) lt!369789)))))

(assert (=> d!78752 (= lt!369791 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78752 (= lt!369789 ((_ sign_extend 32) (size!5309 (buf!5850 b2!99))))))

(assert (=> d!78752 (= lt!369792 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10893 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10888 b2!99))))))

(assert (=> d!78752 (invariant!0 (currentBit!10888 b2!99) (currentByte!10893 b2!99) (size!5309 (buf!5850 b2!99)))))

(assert (=> d!78752 (= (bitIndex!0 (size!5309 (buf!5850 b2!99)) (currentByte!10893 b2!99) (currentBit!10888 b2!99)) lt!369792)))

(declare-fun b!234030 () Bool)

(declare-fun res!195779 () Bool)

(assert (=> b!234030 (=> (not res!195779) (not e!161337))))

(assert (=> b!234030 (= res!195779 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369792))))

(declare-fun b!234031 () Bool)

(declare-fun lt!369790 () (_ BitVec 64))

(assert (=> b!234031 (= e!161337 (bvsle lt!369792 (bvmul lt!369790 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234031 (or (= lt!369790 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369790 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369790)))))

(assert (=> b!234031 (= lt!369790 ((_ sign_extend 32) (size!5309 (buf!5850 b2!99))))))

(assert (= (and d!78752 res!195778) b!234030))

(assert (= (and b!234030 res!195779) b!234031))

(assert (=> d!78752 m!356383))

(declare-fun m!356385 () Bool)

(assert (=> d!78752 m!356385))

(assert (=> b!233978 d!78752))

(declare-fun d!78754 () Bool)

(assert (=> d!78754 (= (inv!12 b1!101) (invariant!0 (currentBit!10888 b1!101) (currentByte!10893 b1!101) (size!5309 (buf!5850 b1!101))))))

(declare-fun bs!19413 () Bool)

(assert (= bs!19413 d!78754))

(assert (=> bs!19413 m!356381))

(assert (=> start!49238 d!78754))

(declare-fun d!78756 () Bool)

(assert (=> d!78756 (= (inv!12 b2!99) (invariant!0 (currentBit!10888 b2!99) (currentByte!10893 b2!99) (size!5309 (buf!5850 b2!99))))))

(declare-fun bs!19414 () Bool)

(assert (= bs!19414 d!78756))

(assert (=> bs!19414 m!356385))

(assert (=> start!49238 d!78756))

(declare-fun d!78758 () Bool)

(assert (=> d!78758 (= (remainingBits!0 ((_ sign_extend 32) (size!5309 (buf!5850 b1!101))) ((_ sign_extend 32) (currentByte!10893 b1!101)) ((_ sign_extend 32) (currentBit!10888 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5309 (buf!5850 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10893 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10888 b1!101)))))))

(assert (=> b!233985 d!78758))

(check-sat (not d!78754) (not d!78752) (not d!78756) (not d!78742) (not d!78746) (not d!78744))
