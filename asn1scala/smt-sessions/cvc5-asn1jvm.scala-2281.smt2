; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57816 () Bool)

(assert start!57816)

(declare-fun b!265317 () Bool)

(declare-fun e!185338 () Bool)

(declare-fun e!185336 () Bool)

(assert (=> b!265317 (= e!185338 (not e!185336))))

(declare-fun res!221729 () Bool)

(assert (=> b!265317 (=> res!221729 e!185336)))

(declare-fun e!185343 () Bool)

(assert (=> b!265317 (= res!221729 e!185343)))

(declare-fun res!221727 () Bool)

(assert (=> b!265317 (=> (not res!221727) (not e!185343))))

(declare-datatypes ((array!14783 0))(
  ( (array!14784 (arr!7435 (Array (_ BitVec 32) (_ BitVec 8))) (size!6448 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11710 0))(
  ( (BitStream!11711 (buf!6916 array!14783) (currentByte!12798 (_ BitVec 32)) (currentBit!12793 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11710)

(assert (=> b!265317 (= res!221727 (not (= (size!6448 (buf!6916 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11710)

(declare-fun isPrefixOf!0 (BitStream!11710 BitStream!11710) Bool)

(assert (=> b!265317 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18872 0))(
  ( (Unit!18873) )
))
(declare-fun lt!406412 () Unit!18872)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11710) Unit!18872)

(assert (=> b!265317 (= lt!406412 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406414 () BitStream!11710)

(assert (=> b!265317 (isPrefixOf!0 lt!406414 lt!406414)))

(declare-fun lt!406411 () Unit!18872)

(assert (=> b!265317 (= lt!406411 (lemmaIsPrefixRefl!0 lt!406414))))

(assert (=> b!265317 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406415 () Unit!18872)

(assert (=> b!265317 (= lt!406415 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265317 (= lt!406414 (BitStream!11711 (buf!6916 w2!580) (currentByte!12798 w1!584) (currentBit!12793 w1!584)))))

(declare-fun b!265318 () Bool)

(declare-fun e!185337 () Bool)

(assert (=> b!265318 (= e!185337 (isPrefixOf!0 lt!406414 w1!584))))

(declare-fun b!265319 () Bool)

(declare-fun e!185340 () Bool)

(declare-fun array_inv!6172 (array!14783) Bool)

(assert (=> b!265319 (= e!185340 (array_inv!6172 (buf!6916 w1!584)))))

(declare-fun b!265320 () Bool)

(assert (=> b!265320 (= e!185336 e!185337)))

(declare-fun res!221730 () Bool)

(assert (=> b!265320 (=> res!221730 e!185337)))

(declare-fun e!185339 () Bool)

(assert (=> b!265320 (= res!221730 e!185339)))

(declare-fun res!221728 () Bool)

(assert (=> b!265320 (=> (not res!221728) (not e!185339))))

(assert (=> b!265320 (= res!221728 (not (= (size!6448 (buf!6916 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!406413 () Unit!18872)

(declare-fun e!185342 () Unit!18872)

(assert (=> b!265320 (= lt!406413 e!185342)))

(declare-fun c!12195 () Bool)

(assert (=> b!265320 (= c!12195 (not (= (size!6448 (buf!6916 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!265321 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14783 array!14783 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265321 (= e!185343 (not (arrayBitRangesEq!0 (buf!6916 w1!584) (buf!6916 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584)))))))

(declare-fun b!265322 () Bool)

(declare-fun e!185341 () Bool)

(assert (=> b!265322 (= e!185341 (array_inv!6172 (buf!6916 w2!580)))))

(declare-fun res!221731 () Bool)

(assert (=> start!57816 (=> (not res!221731) (not e!185338))))

(assert (=> start!57816 (= res!221731 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57816 e!185338))

(declare-fun inv!12 (BitStream!11710) Bool)

(assert (=> start!57816 (and (inv!12 w1!584) e!185340)))

(assert (=> start!57816 (and (inv!12 w2!580) e!185341)))

(declare-fun b!265323 () Bool)

(declare-fun lt!406409 () Unit!18872)

(assert (=> b!265323 (= e!185342 lt!406409)))

(declare-fun lt!406410 () (_ BitVec 64))

(assert (=> b!265323 (= lt!406410 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14783 array!14783 (_ BitVec 64) (_ BitVec 64)) Unit!18872)

(assert (=> b!265323 (= lt!406409 (arrayBitRangesEqSymmetric!0 (buf!6916 w1!584) (buf!6916 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406410))))

(assert (=> b!265323 (arrayBitRangesEq!0 (buf!6916 w2!580) (buf!6916 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406410)))

(declare-fun b!265324 () Bool)

(assert (=> b!265324 (= e!185339 (not (arrayBitRangesEq!0 (buf!6916 w2!580) (buf!6916 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584)))))))

(declare-fun b!265325 () Bool)

(declare-fun Unit!18874 () Unit!18872)

(assert (=> b!265325 (= e!185342 Unit!18874)))

(assert (= (and start!57816 res!221731) b!265317))

(assert (= (and b!265317 res!221727) b!265321))

(assert (= (and b!265317 (not res!221729)) b!265320))

(assert (= (and b!265320 c!12195) b!265323))

(assert (= (and b!265320 (not c!12195)) b!265325))

(assert (= (and b!265320 res!221728) b!265324))

(assert (= (and b!265320 (not res!221730)) b!265318))

(assert (= start!57816 b!265319))

(assert (= start!57816 b!265322))

(declare-fun m!395999 () Bool)

(assert (=> start!57816 m!395999))

(declare-fun m!396001 () Bool)

(assert (=> start!57816 m!396001))

(declare-fun m!396003 () Bool)

(assert (=> start!57816 m!396003))

(declare-fun m!396005 () Bool)

(assert (=> b!265323 m!396005))

(declare-fun m!396007 () Bool)

(assert (=> b!265323 m!396007))

(declare-fun m!396009 () Bool)

(assert (=> b!265323 m!396009))

(declare-fun m!396011 () Bool)

(assert (=> b!265322 m!396011))

(declare-fun m!396013 () Bool)

(assert (=> b!265318 m!396013))

(assert (=> b!265324 m!396005))

(assert (=> b!265324 m!396005))

(declare-fun m!396015 () Bool)

(assert (=> b!265324 m!396015))

(declare-fun m!396017 () Bool)

(assert (=> b!265317 m!396017))

(declare-fun m!396019 () Bool)

(assert (=> b!265317 m!396019))

(declare-fun m!396021 () Bool)

(assert (=> b!265317 m!396021))

(declare-fun m!396023 () Bool)

(assert (=> b!265317 m!396023))

(declare-fun m!396025 () Bool)

(assert (=> b!265317 m!396025))

(declare-fun m!396027 () Bool)

(assert (=> b!265317 m!396027))

(declare-fun m!396029 () Bool)

(assert (=> b!265319 m!396029))

(assert (=> b!265321 m!396005))

(assert (=> b!265321 m!396005))

(declare-fun m!396031 () Bool)

(assert (=> b!265321 m!396031))

(push 1)

(assert (not start!57816))

(assert (not b!265324))

(assert (not b!265319))

(assert (not b!265317))

(assert (not b!265321))

(assert (not b!265322))

(assert (not b!265318))

(assert (not b!265323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89566 () Bool)

(assert (=> d!89566 (= (array_inv!6172 (buf!6916 w2!580)) (bvsge (size!6448 (buf!6916 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265322 d!89566))

(declare-fun d!89568 () Bool)

(assert (=> d!89568 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406462 () Unit!18872)

(declare-fun choose!11 (BitStream!11710) Unit!18872)

(assert (=> d!89568 (= lt!406462 (choose!11 w2!580))))

(assert (=> d!89568 (= (lemmaIsPrefixRefl!0 w2!580) lt!406462)))

(declare-fun bs!22735 () Bool)

(assert (= bs!22735 d!89568))

(assert (=> bs!22735 m!396021))

(declare-fun m!396111 () Bool)

(assert (=> bs!22735 m!396111))

(assert (=> b!265317 d!89568))

(declare-fun d!89574 () Bool)

(assert (=> d!89574 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406464 () Unit!18872)

(assert (=> d!89574 (= lt!406464 (choose!11 w1!584))))

(assert (=> d!89574 (= (lemmaIsPrefixRefl!0 w1!584) lt!406464)))

(declare-fun bs!22737 () Bool)

(assert (= bs!22737 d!89574))

(assert (=> bs!22737 m!396019))

(declare-fun m!396117 () Bool)

(assert (=> bs!22737 m!396117))

(assert (=> b!265317 d!89574))

(declare-fun d!89580 () Bool)

(declare-fun res!221791 () Bool)

(declare-fun e!185422 () Bool)

(assert (=> d!89580 (=> (not res!221791) (not e!185422))))

(assert (=> d!89580 (= res!221791 (= (size!6448 (buf!6916 lt!406414)) (size!6448 (buf!6916 lt!406414))))))

(assert (=> d!89580 (= (isPrefixOf!0 lt!406414 lt!406414) e!185422)))

(declare-fun b!265407 () Bool)

(declare-fun res!221790 () Bool)

(assert (=> b!265407 (=> (not res!221790) (not e!185422))))

(assert (=> b!265407 (= res!221790 (bvsle (bitIndex!0 (size!6448 (buf!6916 lt!406414)) (currentByte!12798 lt!406414) (currentBit!12793 lt!406414)) (bitIndex!0 (size!6448 (buf!6916 lt!406414)) (currentByte!12798 lt!406414) (currentBit!12793 lt!406414))))))

(declare-fun b!265408 () Bool)

(declare-fun e!185423 () Bool)

(assert (=> b!265408 (= e!185422 e!185423)))

(declare-fun res!221789 () Bool)

(assert (=> b!265408 (=> res!221789 e!185423)))

(assert (=> b!265408 (= res!221789 (= (size!6448 (buf!6916 lt!406414)) #b00000000000000000000000000000000))))

(declare-fun b!265409 () Bool)

(assert (=> b!265409 (= e!185423 (arrayBitRangesEq!0 (buf!6916 lt!406414) (buf!6916 lt!406414) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 lt!406414)) (currentByte!12798 lt!406414) (currentBit!12793 lt!406414))))))

(assert (= (and d!89580 res!221791) b!265407))

(assert (= (and b!265407 res!221790) b!265408))

(assert (= (and b!265408 (not res!221789)) b!265409))

(declare-fun m!396127 () Bool)

(assert (=> b!265407 m!396127))

(assert (=> b!265407 m!396127))

(assert (=> b!265409 m!396127))

(assert (=> b!265409 m!396127))

(declare-fun m!396129 () Bool)

(assert (=> b!265409 m!396129))

(assert (=> b!265317 d!89580))

(declare-fun d!89592 () Bool)

(declare-fun res!221794 () Bool)

(declare-fun e!185424 () Bool)

(assert (=> d!89592 (=> (not res!221794) (not e!185424))))

(assert (=> d!89592 (= res!221794 (= (size!6448 (buf!6916 w1!584)) (size!6448 (buf!6916 w1!584))))))

(assert (=> d!89592 (= (isPrefixOf!0 w1!584 w1!584) e!185424)))

(declare-fun b!265410 () Bool)

(declare-fun res!221793 () Bool)

(assert (=> b!265410 (=> (not res!221793) (not e!185424))))

(assert (=> b!265410 (= res!221793 (bvsle (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584)) (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584))))))

(declare-fun b!265411 () Bool)

(declare-fun e!185425 () Bool)

(assert (=> b!265411 (= e!185424 e!185425)))

(declare-fun res!221792 () Bool)

(assert (=> b!265411 (=> res!221792 e!185425)))

(assert (=> b!265411 (= res!221792 (= (size!6448 (buf!6916 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265412 () Bool)

(assert (=> b!265412 (= e!185425 (arrayBitRangesEq!0 (buf!6916 w1!584) (buf!6916 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584))))))

(assert (= (and d!89592 res!221794) b!265410))

(assert (= (and b!265410 res!221793) b!265411))

(assert (= (and b!265411 (not res!221792)) b!265412))

(assert (=> b!265410 m!396005))

(assert (=> b!265410 m!396005))

(assert (=> b!265412 m!396005))

(assert (=> b!265412 m!396005))

(declare-fun m!396131 () Bool)

(assert (=> b!265412 m!396131))

(assert (=> b!265317 d!89592))

(declare-fun d!89594 () Bool)

(assert (=> d!89594 (isPrefixOf!0 lt!406414 lt!406414)))

(declare-fun lt!406467 () Unit!18872)

(assert (=> d!89594 (= lt!406467 (choose!11 lt!406414))))

(assert (=> d!89594 (= (lemmaIsPrefixRefl!0 lt!406414) lt!406467)))

(declare-fun bs!22740 () Bool)

(assert (= bs!22740 d!89594))

(assert (=> bs!22740 m!396017))

(declare-fun m!396133 () Bool)

(assert (=> bs!22740 m!396133))

(assert (=> b!265317 d!89594))

(declare-fun d!89596 () Bool)

(declare-fun res!221797 () Bool)

(declare-fun e!185426 () Bool)

(assert (=> d!89596 (=> (not res!221797) (not e!185426))))

(assert (=> d!89596 (= res!221797 (= (size!6448 (buf!6916 w2!580)) (size!6448 (buf!6916 w2!580))))))

(assert (=> d!89596 (= (isPrefixOf!0 w2!580 w2!580) e!185426)))

(declare-fun b!265413 () Bool)

(declare-fun res!221796 () Bool)

(assert (=> b!265413 (=> (not res!221796) (not e!185426))))

(assert (=> b!265413 (= res!221796 (bvsle (bitIndex!0 (size!6448 (buf!6916 w2!580)) (currentByte!12798 w2!580) (currentBit!12793 w2!580)) (bitIndex!0 (size!6448 (buf!6916 w2!580)) (currentByte!12798 w2!580) (currentBit!12793 w2!580))))))

(declare-fun b!265414 () Bool)

(declare-fun e!185427 () Bool)

(assert (=> b!265414 (= e!185426 e!185427)))

(declare-fun res!221795 () Bool)

(assert (=> b!265414 (=> res!221795 e!185427)))

(assert (=> b!265414 (= res!221795 (= (size!6448 (buf!6916 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!265415 () Bool)

(assert (=> b!265415 (= e!185427 (arrayBitRangesEq!0 (buf!6916 w2!580) (buf!6916 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w2!580)) (currentByte!12798 w2!580) (currentBit!12793 w2!580))))))

(assert (= (and d!89596 res!221797) b!265413))

(assert (= (and b!265413 res!221796) b!265414))

(assert (= (and b!265414 (not res!221795)) b!265415))

(declare-fun m!396135 () Bool)

(assert (=> b!265413 m!396135))

(assert (=> b!265413 m!396135))

(assert (=> b!265415 m!396135))

(assert (=> b!265415 m!396135))

(declare-fun m!396137 () Bool)

(assert (=> b!265415 m!396137))

(assert (=> b!265317 d!89596))

(declare-fun d!89598 () Bool)

(declare-fun e!185449 () Bool)

(assert (=> d!89598 e!185449))

(declare-fun res!221819 () Bool)

(assert (=> d!89598 (=> (not res!221819) (not e!185449))))

(declare-fun lt!406500 () (_ BitVec 64))

(declare-fun lt!406506 () (_ BitVec 64))

(declare-fun lt!406502 () (_ BitVec 64))

(assert (=> d!89598 (= res!221819 (= lt!406506 (bvsub lt!406500 lt!406502)))))

(assert (=> d!89598 (or (= (bvand lt!406500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406500 lt!406502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89598 (= lt!406502 (remainingBits!0 ((_ sign_extend 32) (size!6448 (buf!6916 w1!584))) ((_ sign_extend 32) (currentByte!12798 w1!584)) ((_ sign_extend 32) (currentBit!12793 w1!584))))))

(declare-fun lt!406505 () (_ BitVec 64))

(declare-fun lt!406504 () (_ BitVec 64))

(assert (=> d!89598 (= lt!406500 (bvmul lt!406505 lt!406504))))

(assert (=> d!89598 (or (= lt!406505 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406504 (bvsdiv (bvmul lt!406505 lt!406504) lt!406505)))))

(assert (=> d!89598 (= lt!406504 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89598 (= lt!406505 ((_ sign_extend 32) (size!6448 (buf!6916 w1!584))))))

(assert (=> d!89598 (= lt!406506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12798 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12793 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89598 (invariant!0 (currentBit!12793 w1!584) (currentByte!12798 w1!584) (size!6448 (buf!6916 w1!584)))))

(assert (=> d!89598 (= (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584)) lt!406506)))

(declare-fun b!265442 () Bool)

(declare-fun res!221822 () Bool)

(assert (=> b!265442 (=> (not res!221822) (not e!185449))))

(assert (=> b!265442 (= res!221822 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406506))))

(declare-fun b!265444 () Bool)

(declare-fun lt!406501 () (_ BitVec 64))

(assert (=> b!265444 (= e!185449 (bvsle lt!406506 (bvmul lt!406501 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265444 (or (= lt!406501 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406501 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406501)))))

(assert (=> b!265444 (= lt!406501 ((_ sign_extend 32) (size!6448 (buf!6916 w1!584))))))

(assert (= (and d!89598 res!221819) b!265442))

(assert (= (and b!265442 res!221822) b!265444))

(declare-fun m!396139 () Bool)

(assert (=> d!89598 m!396139))

(declare-fun m!396141 () Bool)

(assert (=> d!89598 m!396141))

(assert (=> b!265323 d!89598))

(declare-fun d!89600 () Bool)

(assert (=> d!89600 (arrayBitRangesEq!0 (buf!6916 w2!580) (buf!6916 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406410)))

(declare-fun lt!406515 () Unit!18872)

(declare-fun choose!8 (array!14783 array!14783 (_ BitVec 64) (_ BitVec 64)) Unit!18872)

(assert (=> d!89600 (= lt!406515 (choose!8 (buf!6916 w1!584) (buf!6916 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406410))))

(assert (=> d!89600 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406410))))

(assert (=> d!89600 (= (arrayBitRangesEqSymmetric!0 (buf!6916 w1!584) (buf!6916 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406410) lt!406515)))

(declare-fun bs!22741 () Bool)

(assert (= bs!22741 d!89600))

(assert (=> bs!22741 m!396009))

(declare-fun m!396163 () Bool)

(assert (=> bs!22741 m!396163))

(assert (=> b!265323 d!89600))

(declare-fun d!89606 () Bool)

(declare-fun res!221853 () Bool)

(declare-fun e!185480 () Bool)

(assert (=> d!89606 (=> res!221853 e!185480)))

(assert (=> d!89606 (= res!221853 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!406410))))

(assert (=> d!89606 (= (arrayBitRangesEq!0 (buf!6916 w2!580) (buf!6916 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406410) e!185480)))

(declare-fun e!185479 () Bool)

(declare-fun b!265483 () Bool)

(declare-datatypes ((tuple4!368 0))(
  ( (tuple4!369 (_1!12164 (_ BitVec 32)) (_2!12164 (_ BitVec 32)) (_3!964 (_ BitVec 32)) (_4!184 (_ BitVec 32))) )
))
(declare-fun lt!406553 () tuple4!368)

(declare-fun lt!406552 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265483 (= e!185479 (byteRangesEq!0 (select (arr!7435 (buf!6916 w2!580)) (_4!184 lt!406553)) (select (arr!7435 (buf!6916 w1!584)) (_4!184 lt!406553)) #b00000000000000000000000000000000 lt!406552))))

(declare-fun b!265484 () Bool)

(declare-fun e!185483 () Bool)

(declare-fun e!185484 () Bool)

(assert (=> b!265484 (= e!185483 e!185484)))

(declare-fun res!221855 () Bool)

(declare-fun call!4132 () Bool)

(assert (=> b!265484 (= res!221855 call!4132)))

(assert (=> b!265484 (=> (not res!221855) (not e!185484))))

(declare-fun b!265485 () Bool)

(declare-fun res!221852 () Bool)

(assert (=> b!265485 (= res!221852 (= lt!406552 #b00000000000000000000000000000000))))

(assert (=> b!265485 (=> res!221852 e!185479)))

(assert (=> b!265485 (= e!185484 e!185479)))

(declare-fun b!265486 () Bool)

(declare-fun e!185482 () Bool)

(assert (=> b!265486 (= e!185480 e!185482)))

(declare-fun res!221851 () Bool)

(assert (=> b!265486 (=> (not res!221851) (not e!185482))))

(declare-fun e!185481 () Bool)

(assert (=> b!265486 (= res!221851 e!185481)))

(declare-fun res!221854 () Bool)

(assert (=> b!265486 (=> res!221854 e!185481)))

(assert (=> b!265486 (= res!221854 (bvsge (_1!12164 lt!406553) (_2!12164 lt!406553)))))

(assert (=> b!265486 (= lt!406552 ((_ extract 31 0) (bvsrem lt!406410 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406554 () (_ BitVec 32))

(assert (=> b!265486 (= lt!406554 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!368)

(assert (=> b!265486 (= lt!406553 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!406410))))

(declare-fun b!265487 () Bool)

(assert (=> b!265487 (= e!185482 e!185483)))

(declare-fun c!12209 () Bool)

(assert (=> b!265487 (= c!12209 (= (_3!964 lt!406553) (_4!184 lt!406553)))))

(declare-fun b!265488 () Bool)

(declare-fun arrayRangesEq!1020 (array!14783 array!14783 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265488 (= e!185481 (arrayRangesEq!1020 (buf!6916 w2!580) (buf!6916 w1!584) (_1!12164 lt!406553) (_2!12164 lt!406553)))))

(declare-fun b!265489 () Bool)

(assert (=> b!265489 (= e!185483 call!4132)))

(declare-fun bm!4129 () Bool)

(assert (=> bm!4129 (= call!4132 (byteRangesEq!0 (select (arr!7435 (buf!6916 w2!580)) (_3!964 lt!406553)) (select (arr!7435 (buf!6916 w1!584)) (_3!964 lt!406553)) lt!406554 (ite c!12209 lt!406552 #b00000000000000000000000000001000)))))

(assert (= (and d!89606 (not res!221853)) b!265486))

(assert (= (and b!265486 (not res!221854)) b!265488))

(assert (= (and b!265486 res!221851) b!265487))

(assert (= (and b!265487 c!12209) b!265489))

(assert (= (and b!265487 (not c!12209)) b!265484))

(assert (= (and b!265484 res!221855) b!265485))

(assert (= (and b!265485 (not res!221852)) b!265483))

(assert (= (or b!265489 b!265484) bm!4129))

(declare-fun m!396201 () Bool)

(assert (=> b!265483 m!396201))

(declare-fun m!396203 () Bool)

(assert (=> b!265483 m!396203))

(assert (=> b!265483 m!396201))

(assert (=> b!265483 m!396203))

(declare-fun m!396205 () Bool)

(assert (=> b!265483 m!396205))

(declare-fun m!396207 () Bool)

(assert (=> b!265486 m!396207))

(declare-fun m!396209 () Bool)

(assert (=> b!265488 m!396209))

(declare-fun m!396211 () Bool)

(assert (=> bm!4129 m!396211))

(declare-fun m!396213 () Bool)

(assert (=> bm!4129 m!396213))

(assert (=> bm!4129 m!396211))

(assert (=> bm!4129 m!396213))

(declare-fun m!396215 () Bool)

(assert (=> bm!4129 m!396215))

(assert (=> b!265323 d!89606))

(declare-fun d!89618 () Bool)

(declare-fun res!221860 () Bool)

(declare-fun e!185488 () Bool)

(assert (=> d!89618 (=> res!221860 e!185488)))

(assert (=> d!89618 (= res!221860 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584))))))

(assert (=> d!89618 (= (arrayBitRangesEq!0 (buf!6916 w1!584) (buf!6916 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584))) e!185488)))

(declare-fun lt!406557 () (_ BitVec 32))

(declare-fun b!265492 () Bool)

(declare-fun lt!406558 () tuple4!368)

(declare-fun e!185487 () Bool)

(assert (=> b!265492 (= e!185487 (byteRangesEq!0 (select (arr!7435 (buf!6916 w1!584)) (_4!184 lt!406558)) (select (arr!7435 (buf!6916 w2!580)) (_4!184 lt!406558)) #b00000000000000000000000000000000 lt!406557))))

(declare-fun b!265493 () Bool)

(declare-fun e!185491 () Bool)

(declare-fun e!185492 () Bool)

(assert (=> b!265493 (= e!185491 e!185492)))

(declare-fun res!221862 () Bool)

(declare-fun call!4133 () Bool)

(assert (=> b!265493 (= res!221862 call!4133)))

(assert (=> b!265493 (=> (not res!221862) (not e!185492))))

(declare-fun b!265494 () Bool)

(declare-fun res!221859 () Bool)

(assert (=> b!265494 (= res!221859 (= lt!406557 #b00000000000000000000000000000000))))

(assert (=> b!265494 (=> res!221859 e!185487)))

(assert (=> b!265494 (= e!185492 e!185487)))

(declare-fun b!265495 () Bool)

(declare-fun e!185490 () Bool)

(assert (=> b!265495 (= e!185488 e!185490)))

(declare-fun res!221858 () Bool)

(assert (=> b!265495 (=> (not res!221858) (not e!185490))))

(declare-fun e!185489 () Bool)

(assert (=> b!265495 (= res!221858 e!185489)))

(declare-fun res!221861 () Bool)

(assert (=> b!265495 (=> res!221861 e!185489)))

(assert (=> b!265495 (= res!221861 (bvsge (_1!12164 lt!406558) (_2!12164 lt!406558)))))

(assert (=> b!265495 (= lt!406557 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406559 () (_ BitVec 32))

(assert (=> b!265495 (= lt!406559 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265495 (= lt!406558 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584))))))

(declare-fun b!265496 () Bool)

(assert (=> b!265496 (= e!185490 e!185491)))

(declare-fun c!12210 () Bool)

(assert (=> b!265496 (= c!12210 (= (_3!964 lt!406558) (_4!184 lt!406558)))))

(declare-fun b!265497 () Bool)

(assert (=> b!265497 (= e!185489 (arrayRangesEq!1020 (buf!6916 w1!584) (buf!6916 w2!580) (_1!12164 lt!406558) (_2!12164 lt!406558)))))

(declare-fun b!265498 () Bool)

(assert (=> b!265498 (= e!185491 call!4133)))

(declare-fun bm!4130 () Bool)

(assert (=> bm!4130 (= call!4133 (byteRangesEq!0 (select (arr!7435 (buf!6916 w1!584)) (_3!964 lt!406558)) (select (arr!7435 (buf!6916 w2!580)) (_3!964 lt!406558)) lt!406559 (ite c!12210 lt!406557 #b00000000000000000000000000001000)))))

(assert (= (and d!89618 (not res!221860)) b!265495))

(assert (= (and b!265495 (not res!221861)) b!265497))

(assert (= (and b!265495 res!221858) b!265496))

(assert (= (and b!265496 c!12210) b!265498))

(assert (= (and b!265496 (not c!12210)) b!265493))

(assert (= (and b!265493 res!221862) b!265494))

(assert (= (and b!265494 (not res!221859)) b!265492))

(assert (= (or b!265498 b!265493) bm!4130))

(declare-fun m!396217 () Bool)

(assert (=> b!265492 m!396217))

(declare-fun m!396219 () Bool)

(assert (=> b!265492 m!396219))

(assert (=> b!265492 m!396217))

(assert (=> b!265492 m!396219))

(declare-fun m!396221 () Bool)

(assert (=> b!265492 m!396221))

(assert (=> b!265495 m!396005))

(declare-fun m!396223 () Bool)

(assert (=> b!265495 m!396223))

(declare-fun m!396225 () Bool)

(assert (=> b!265497 m!396225))

(declare-fun m!396227 () Bool)

(assert (=> bm!4130 m!396227))

(declare-fun m!396229 () Bool)

(assert (=> bm!4130 m!396229))

(assert (=> bm!4130 m!396227))

(assert (=> bm!4130 m!396229))

(declare-fun m!396231 () Bool)

(assert (=> bm!4130 m!396231))

(assert (=> b!265321 d!89618))

(assert (=> b!265321 d!89598))

(declare-fun d!89620 () Bool)

(declare-fun res!221873 () Bool)

(declare-fun e!185503 () Bool)

(assert (=> d!89620 (=> (not res!221873) (not e!185503))))

(assert (=> d!89620 (= res!221873 (= (size!6448 (buf!6916 w1!584)) (size!6448 (buf!6916 w2!580))))))

(assert (=> d!89620 (= (isPrefixOf!0 w1!584 w2!580) e!185503)))

(declare-fun b!265511 () Bool)

(declare-fun res!221872 () Bool)

(assert (=> b!265511 (=> (not res!221872) (not e!185503))))

(assert (=> b!265511 (= res!221872 (bvsle (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584)) (bitIndex!0 (size!6448 (buf!6916 w2!580)) (currentByte!12798 w2!580) (currentBit!12793 w2!580))))))

(declare-fun b!265512 () Bool)

(declare-fun e!185504 () Bool)

(assert (=> b!265512 (= e!185503 e!185504)))

(declare-fun res!221871 () Bool)

(assert (=> b!265512 (=> res!221871 e!185504)))

(assert (=> b!265512 (= res!221871 (= (size!6448 (buf!6916 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265513 () Bool)

(assert (=> b!265513 (= e!185504 (arrayBitRangesEq!0 (buf!6916 w1!584) (buf!6916 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584))))))

(assert (= (and d!89620 res!221873) b!265511))

(assert (= (and b!265511 res!221872) b!265512))

(assert (= (and b!265512 (not res!221871)) b!265513))

(assert (=> b!265511 m!396005))

(assert (=> b!265511 m!396135))

(assert (=> b!265513 m!396005))

(assert (=> b!265513 m!396005))

(assert (=> b!265513 m!396031))

(assert (=> start!57816 d!89620))

(declare-fun d!89622 () Bool)

(assert (=> d!89622 (= (inv!12 w1!584) (invariant!0 (currentBit!12793 w1!584) (currentByte!12798 w1!584) (size!6448 (buf!6916 w1!584))))))

(declare-fun bs!22744 () Bool)

(assert (= bs!22744 d!89622))

(assert (=> bs!22744 m!396141))

(assert (=> start!57816 d!89622))

(declare-fun d!89624 () Bool)

(assert (=> d!89624 (= (inv!12 w2!580) (invariant!0 (currentBit!12793 w2!580) (currentByte!12798 w2!580) (size!6448 (buf!6916 w2!580))))))

(declare-fun bs!22745 () Bool)

(assert (= bs!22745 d!89624))

(declare-fun m!396233 () Bool)

(assert (=> bs!22745 m!396233))

(assert (=> start!57816 d!89624))

(declare-fun d!89626 () Bool)

(declare-fun res!221876 () Bool)

(declare-fun e!185505 () Bool)

(assert (=> d!89626 (=> (not res!221876) (not e!185505))))

(assert (=> d!89626 (= res!221876 (= (size!6448 (buf!6916 lt!406414)) (size!6448 (buf!6916 w1!584))))))

(assert (=> d!89626 (= (isPrefixOf!0 lt!406414 w1!584) e!185505)))

(declare-fun b!265514 () Bool)

(declare-fun res!221875 () Bool)

(assert (=> b!265514 (=> (not res!221875) (not e!185505))))

(assert (=> b!265514 (= res!221875 (bvsle (bitIndex!0 (size!6448 (buf!6916 lt!406414)) (currentByte!12798 lt!406414) (currentBit!12793 lt!406414)) (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584))))))

(declare-fun b!265515 () Bool)

(declare-fun e!185506 () Bool)

(assert (=> b!265515 (= e!185505 e!185506)))

(declare-fun res!221874 () Bool)

(assert (=> b!265515 (=> res!221874 e!185506)))

(assert (=> b!265515 (= res!221874 (= (size!6448 (buf!6916 lt!406414)) #b00000000000000000000000000000000))))

(declare-fun b!265516 () Bool)

(assert (=> b!265516 (= e!185506 (arrayBitRangesEq!0 (buf!6916 lt!406414) (buf!6916 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 lt!406414)) (currentByte!12798 lt!406414) (currentBit!12793 lt!406414))))))

(assert (= (and d!89626 res!221876) b!265514))

(assert (= (and b!265514 res!221875) b!265515))

(assert (= (and b!265515 (not res!221874)) b!265516))

(assert (=> b!265514 m!396127))

(assert (=> b!265514 m!396005))

(assert (=> b!265516 m!396127))

(assert (=> b!265516 m!396127))

(declare-fun m!396235 () Bool)

(assert (=> b!265516 m!396235))

(assert (=> b!265318 d!89626))

(declare-fun d!89628 () Bool)

(declare-fun res!221879 () Bool)

(declare-fun e!185508 () Bool)

(assert (=> d!89628 (=> res!221879 e!185508)))

(assert (=> d!89628 (= res!221879 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584))))))

(assert (=> d!89628 (= (arrayBitRangesEq!0 (buf!6916 w2!580) (buf!6916 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584))) e!185508)))

(declare-fun lt!406564 () (_ BitVec 32))

(declare-fun e!185507 () Bool)

(declare-fun b!265517 () Bool)

(declare-fun lt!406565 () tuple4!368)

(assert (=> b!265517 (= e!185507 (byteRangesEq!0 (select (arr!7435 (buf!6916 w2!580)) (_4!184 lt!406565)) (select (arr!7435 (buf!6916 w1!584)) (_4!184 lt!406565)) #b00000000000000000000000000000000 lt!406564))))

(declare-fun b!265518 () Bool)

(declare-fun e!185511 () Bool)

(declare-fun e!185512 () Bool)

(assert (=> b!265518 (= e!185511 e!185512)))

(declare-fun res!221881 () Bool)

(declare-fun call!4136 () Bool)

(assert (=> b!265518 (= res!221881 call!4136)))

(assert (=> b!265518 (=> (not res!221881) (not e!185512))))

(declare-fun b!265519 () Bool)

(declare-fun res!221878 () Bool)

(assert (=> b!265519 (= res!221878 (= lt!406564 #b00000000000000000000000000000000))))

(assert (=> b!265519 (=> res!221878 e!185507)))

(assert (=> b!265519 (= e!185512 e!185507)))

(declare-fun b!265520 () Bool)

(declare-fun e!185510 () Bool)

(assert (=> b!265520 (= e!185508 e!185510)))

(declare-fun res!221877 () Bool)

(assert (=> b!265520 (=> (not res!221877) (not e!185510))))

(declare-fun e!185509 () Bool)

(assert (=> b!265520 (= res!221877 e!185509)))

(declare-fun res!221880 () Bool)

(assert (=> b!265520 (=> res!221880 e!185509)))

(assert (=> b!265520 (= res!221880 (bvsge (_1!12164 lt!406565) (_2!12164 lt!406565)))))

(assert (=> b!265520 (= lt!406564 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406566 () (_ BitVec 32))

(assert (=> b!265520 (= lt!406566 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265520 (= lt!406565 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6448 (buf!6916 w1!584)) (currentByte!12798 w1!584) (currentBit!12793 w1!584))))))

(declare-fun b!265521 () Bool)

(assert (=> b!265521 (= e!185510 e!185511)))

(declare-fun c!12213 () Bool)

(assert (=> b!265521 (= c!12213 (= (_3!964 lt!406565) (_4!184 lt!406565)))))

(declare-fun b!265522 () Bool)

(assert (=> b!265522 (= e!185509 (arrayRangesEq!1020 (buf!6916 w2!580) (buf!6916 w1!584) (_1!12164 lt!406565) (_2!12164 lt!406565)))))

(declare-fun b!265523 () Bool)

(assert (=> b!265523 (= e!185511 call!4136)))

(declare-fun bm!4133 () Bool)

(assert (=> bm!4133 (= call!4136 (byteRangesEq!0 (select (arr!7435 (buf!6916 w2!580)) (_3!964 lt!406565)) (select (arr!7435 (buf!6916 w1!584)) (_3!964 lt!406565)) lt!406566 (ite c!12213 lt!406564 #b00000000000000000000000000001000)))))

(assert (= (and d!89628 (not res!221879)) b!265520))

(assert (= (and b!265520 (not res!221880)) b!265522))

(assert (= (and b!265520 res!221877) b!265521))

(assert (= (and b!265521 c!12213) b!265523))

(assert (= (and b!265521 (not c!12213)) b!265518))

(assert (= (and b!265518 res!221881) b!265519))

(assert (= (and b!265519 (not res!221878)) b!265517))

(assert (= (or b!265523 b!265518) bm!4133))

(declare-fun m!396237 () Bool)

(assert (=> b!265517 m!396237))

(declare-fun m!396239 () Bool)

(assert (=> b!265517 m!396239))

(assert (=> b!265517 m!396237))

(assert (=> b!265517 m!396239))

(declare-fun m!396241 () Bool)

(assert (=> b!265517 m!396241))

(assert (=> b!265520 m!396005))

(assert (=> b!265520 m!396223))

(declare-fun m!396243 () Bool)

(assert (=> b!265522 m!396243))

(declare-fun m!396245 () Bool)

(assert (=> bm!4133 m!396245))

(declare-fun m!396247 () Bool)

(assert (=> bm!4133 m!396247))

(assert (=> bm!4133 m!396245))

(assert (=> bm!4133 m!396247))

(declare-fun m!396249 () Bool)

(assert (=> bm!4133 m!396249))

(assert (=> b!265324 d!89628))

(assert (=> b!265324 d!89598))

(declare-fun d!89630 () Bool)

(assert (=> d!89630 (= (array_inv!6172 (buf!6916 w1!584)) (bvsge (size!6448 (buf!6916 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265319 d!89630))

(push 1)

(assert (not b!265409))

(assert (not b!265497))

(assert (not b!265488))

(assert (not b!265520))

(assert (not d!89622))

(assert (not b!265522))

(assert (not b!265517))

(assert (not d!89598))

(assert (not d!89600))

(assert (not bm!4130))

(assert (not b!265415))

(assert (not b!265513))

(assert (not d!89624))

(assert (not b!265511))

(assert (not d!89594))

(assert (not b!265495))

(assert (not b!265410))

(assert (not d!89568))

(assert (not b!265492))

(assert (not bm!4133))

(assert (not b!265516))

(assert (not d!89574))

(assert (not bm!4129))

(assert (not b!265483))

(assert (not b!265412))

(assert (not b!265486))

(assert (not b!265407))

(assert (not b!265413))

(assert (not b!265514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

