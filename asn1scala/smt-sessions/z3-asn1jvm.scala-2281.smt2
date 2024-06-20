; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57818 () Bool)

(assert start!57818)

(declare-fun res!221744 () Bool)

(declare-fun e!185366 () Bool)

(assert (=> start!57818 (=> (not res!221744) (not e!185366))))

(declare-datatypes ((array!14785 0))(
  ( (array!14786 (arr!7436 (Array (_ BitVec 32) (_ BitVec 8))) (size!6449 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11712 0))(
  ( (BitStream!11713 (buf!6917 array!14785) (currentByte!12799 (_ BitVec 32)) (currentBit!12794 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11712)

(declare-fun w2!580 () BitStream!11712)

(declare-fun isPrefixOf!0 (BitStream!11712 BitStream!11712) Bool)

(assert (=> start!57818 (= res!221744 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57818 e!185366))

(declare-fun e!185371 () Bool)

(declare-fun inv!12 (BitStream!11712) Bool)

(assert (=> start!57818 (and (inv!12 w1!584) e!185371)))

(declare-fun e!185373 () Bool)

(assert (=> start!57818 (and (inv!12 w2!580) e!185373)))

(declare-fun b!265344 () Bool)

(declare-fun array_inv!6173 (array!14785) Bool)

(assert (=> b!265344 (= e!185371 (array_inv!6173 (buf!6917 w1!584)))))

(declare-fun b!265345 () Bool)

(declare-datatypes ((Unit!18875 0))(
  ( (Unit!18876) )
))
(declare-fun e!185365 () Unit!18875)

(declare-fun lt!406430 () Unit!18875)

(assert (=> b!265345 (= e!185365 lt!406430)))

(declare-fun lt!406434 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265345 (= lt!406434 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14785 array!14785 (_ BitVec 64) (_ BitVec 64)) Unit!18875)

(assert (=> b!265345 (= lt!406430 (arrayBitRangesEqSymmetric!0 (buf!6917 w1!584) (buf!6917 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406434))))

(declare-fun arrayBitRangesEq!0 (array!14785 array!14785 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!265345 (arrayBitRangesEq!0 (buf!6917 w2!580) (buf!6917 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406434)))

(declare-fun b!265346 () Bool)

(declare-fun e!185369 () Bool)

(assert (=> b!265346 (= e!185369 (not (arrayBitRangesEq!0 (buf!6917 w2!580) (buf!6917 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584)))))))

(declare-fun b!265347 () Bool)

(declare-fun e!185367 () Bool)

(assert (=> b!265347 (= e!185367 (not (arrayBitRangesEq!0 (buf!6917 w1!584) (buf!6917 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584)))))))

(declare-fun b!265348 () Bool)

(declare-fun e!185372 () Bool)

(declare-fun lt!406436 () BitStream!11712)

(assert (=> b!265348 (= e!185372 (isPrefixOf!0 lt!406436 w1!584))))

(declare-fun b!265349 () Bool)

(assert (=> b!265349 (= e!185373 (array_inv!6173 (buf!6917 w2!580)))))

(declare-fun b!265350 () Bool)

(declare-fun e!185364 () Bool)

(assert (=> b!265350 (= e!185364 e!185372)))

(declare-fun res!221746 () Bool)

(assert (=> b!265350 (=> res!221746 e!185372)))

(assert (=> b!265350 (= res!221746 e!185369)))

(declare-fun res!221745 () Bool)

(assert (=> b!265350 (=> (not res!221745) (not e!185369))))

(assert (=> b!265350 (= res!221745 (not (= (size!6449 (buf!6917 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!406431 () Unit!18875)

(assert (=> b!265350 (= lt!406431 e!185365)))

(declare-fun c!12198 () Bool)

(assert (=> b!265350 (= c!12198 (not (= (size!6449 (buf!6917 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!265351 () Bool)

(declare-fun Unit!18877 () Unit!18875)

(assert (=> b!265351 (= e!185365 Unit!18877)))

(declare-fun b!265352 () Bool)

(assert (=> b!265352 (= e!185366 (not e!185364))))

(declare-fun res!221743 () Bool)

(assert (=> b!265352 (=> res!221743 e!185364)))

(assert (=> b!265352 (= res!221743 e!185367)))

(declare-fun res!221742 () Bool)

(assert (=> b!265352 (=> (not res!221742) (not e!185367))))

(assert (=> b!265352 (= res!221742 (not (= (size!6449 (buf!6917 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!265352 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406433 () Unit!18875)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11712) Unit!18875)

(assert (=> b!265352 (= lt!406433 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!265352 (isPrefixOf!0 lt!406436 lt!406436)))

(declare-fun lt!406435 () Unit!18875)

(assert (=> b!265352 (= lt!406435 (lemmaIsPrefixRefl!0 lt!406436))))

(assert (=> b!265352 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406432 () Unit!18875)

(assert (=> b!265352 (= lt!406432 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265352 (= lt!406436 (BitStream!11713 (buf!6917 w2!580) (currentByte!12799 w1!584) (currentBit!12794 w1!584)))))

(assert (= (and start!57818 res!221744) b!265352))

(assert (= (and b!265352 res!221742) b!265347))

(assert (= (and b!265352 (not res!221743)) b!265350))

(assert (= (and b!265350 c!12198) b!265345))

(assert (= (and b!265350 (not c!12198)) b!265351))

(assert (= (and b!265350 res!221745) b!265346))

(assert (= (and b!265350 (not res!221746)) b!265348))

(assert (= start!57818 b!265344))

(assert (= start!57818 b!265349))

(declare-fun m!396033 () Bool)

(assert (=> b!265345 m!396033))

(declare-fun m!396035 () Bool)

(assert (=> b!265345 m!396035))

(declare-fun m!396037 () Bool)

(assert (=> b!265345 m!396037))

(assert (=> b!265346 m!396033))

(assert (=> b!265346 m!396033))

(declare-fun m!396039 () Bool)

(assert (=> b!265346 m!396039))

(declare-fun m!396041 () Bool)

(assert (=> b!265352 m!396041))

(declare-fun m!396043 () Bool)

(assert (=> b!265352 m!396043))

(declare-fun m!396045 () Bool)

(assert (=> b!265352 m!396045))

(declare-fun m!396047 () Bool)

(assert (=> b!265352 m!396047))

(declare-fun m!396049 () Bool)

(assert (=> b!265352 m!396049))

(declare-fun m!396051 () Bool)

(assert (=> b!265352 m!396051))

(assert (=> b!265347 m!396033))

(assert (=> b!265347 m!396033))

(declare-fun m!396053 () Bool)

(assert (=> b!265347 m!396053))

(declare-fun m!396055 () Bool)

(assert (=> b!265349 m!396055))

(declare-fun m!396057 () Bool)

(assert (=> start!57818 m!396057))

(declare-fun m!396059 () Bool)

(assert (=> start!57818 m!396059))

(declare-fun m!396061 () Bool)

(assert (=> start!57818 m!396061))

(declare-fun m!396063 () Bool)

(assert (=> b!265344 m!396063))

(declare-fun m!396065 () Bool)

(assert (=> b!265348 m!396065))

(check-sat (not b!265345) (not b!265347) (not start!57818) (not b!265349) (not b!265352) (not b!265346) (not b!265344) (not b!265348))
(check-sat)
(get-model)

(declare-fun d!89558 () Bool)

(declare-fun res!221768 () Bool)

(declare-fun e!185409 () Bool)

(assert (=> d!89558 (=> (not res!221768) (not e!185409))))

(assert (=> d!89558 (= res!221768 (= (size!6449 (buf!6917 lt!406436)) (size!6449 (buf!6917 w1!584))))))

(assert (=> d!89558 (= (isPrefixOf!0 lt!406436 w1!584) e!185409)))

(declare-fun b!265386 () Bool)

(declare-fun res!221770 () Bool)

(assert (=> b!265386 (=> (not res!221770) (not e!185409))))

(assert (=> b!265386 (= res!221770 (bvsle (bitIndex!0 (size!6449 (buf!6917 lt!406436)) (currentByte!12799 lt!406436) (currentBit!12794 lt!406436)) (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584))))))

(declare-fun b!265387 () Bool)

(declare-fun e!185408 () Bool)

(assert (=> b!265387 (= e!185409 e!185408)))

(declare-fun res!221769 () Bool)

(assert (=> b!265387 (=> res!221769 e!185408)))

(assert (=> b!265387 (= res!221769 (= (size!6449 (buf!6917 lt!406436)) #b00000000000000000000000000000000))))

(declare-fun b!265388 () Bool)

(assert (=> b!265388 (= e!185408 (arrayBitRangesEq!0 (buf!6917 lt!406436) (buf!6917 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 lt!406436)) (currentByte!12799 lt!406436) (currentBit!12794 lt!406436))))))

(assert (= (and d!89558 res!221768) b!265386))

(assert (= (and b!265386 res!221770) b!265387))

(assert (= (and b!265387 (not res!221769)) b!265388))

(declare-fun m!396101 () Bool)

(assert (=> b!265386 m!396101))

(assert (=> b!265386 m!396033))

(assert (=> b!265388 m!396101))

(assert (=> b!265388 m!396101))

(declare-fun m!396103 () Bool)

(assert (=> b!265388 m!396103))

(assert (=> b!265348 d!89558))

(declare-fun d!89560 () Bool)

(assert (=> d!89560 (= (array_inv!6173 (buf!6917 w2!580)) (bvsge (size!6449 (buf!6917 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265349 d!89560))

(declare-fun d!89562 () Bool)

(declare-fun res!221771 () Bool)

(declare-fun e!185411 () Bool)

(assert (=> d!89562 (=> (not res!221771) (not e!185411))))

(assert (=> d!89562 (= res!221771 (= (size!6449 (buf!6917 w1!584)) (size!6449 (buf!6917 w2!580))))))

(assert (=> d!89562 (= (isPrefixOf!0 w1!584 w2!580) e!185411)))

(declare-fun b!265389 () Bool)

(declare-fun res!221773 () Bool)

(assert (=> b!265389 (=> (not res!221773) (not e!185411))))

(assert (=> b!265389 (= res!221773 (bvsle (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584)) (bitIndex!0 (size!6449 (buf!6917 w2!580)) (currentByte!12799 w2!580) (currentBit!12794 w2!580))))))

(declare-fun b!265390 () Bool)

(declare-fun e!185410 () Bool)

(assert (=> b!265390 (= e!185411 e!185410)))

(declare-fun res!221772 () Bool)

(assert (=> b!265390 (=> res!221772 e!185410)))

(assert (=> b!265390 (= res!221772 (= (size!6449 (buf!6917 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265391 () Bool)

(assert (=> b!265391 (= e!185410 (arrayBitRangesEq!0 (buf!6917 w1!584) (buf!6917 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584))))))

(assert (= (and d!89562 res!221771) b!265389))

(assert (= (and b!265389 res!221773) b!265390))

(assert (= (and b!265390 (not res!221772)) b!265391))

(assert (=> b!265389 m!396033))

(declare-fun m!396105 () Bool)

(assert (=> b!265389 m!396105))

(assert (=> b!265391 m!396033))

(assert (=> b!265391 m!396033))

(assert (=> b!265391 m!396053))

(assert (=> start!57818 d!89562))

(declare-fun d!89564 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89564 (= (inv!12 w1!584) (invariant!0 (currentBit!12794 w1!584) (currentByte!12799 w1!584) (size!6449 (buf!6917 w1!584))))))

(declare-fun bs!22731 () Bool)

(assert (= bs!22731 d!89564))

(declare-fun m!396107 () Bool)

(assert (=> bs!22731 m!396107))

(assert (=> start!57818 d!89564))

(declare-fun d!89570 () Bool)

(assert (=> d!89570 (= (inv!12 w2!580) (invariant!0 (currentBit!12794 w2!580) (currentByte!12799 w2!580) (size!6449 (buf!6917 w2!580))))))

(declare-fun bs!22732 () Bool)

(assert (= bs!22732 d!89570))

(declare-fun m!396109 () Bool)

(assert (=> bs!22732 m!396109))

(assert (=> start!57818 d!89570))

(declare-fun d!89572 () Bool)

(assert (=> d!89572 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406463 () Unit!18875)

(declare-fun choose!11 (BitStream!11712) Unit!18875)

(assert (=> d!89572 (= lt!406463 (choose!11 w2!580))))

(assert (=> d!89572 (= (lemmaIsPrefixRefl!0 w2!580) lt!406463)))

(declare-fun bs!22736 () Bool)

(assert (= bs!22736 d!89572))

(assert (=> bs!22736 m!396045))

(declare-fun m!396113 () Bool)

(assert (=> bs!22736 m!396113))

(assert (=> b!265352 d!89572))

(declare-fun d!89576 () Bool)

(assert (=> d!89576 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406465 () Unit!18875)

(assert (=> d!89576 (= lt!406465 (choose!11 w1!584))))

(assert (=> d!89576 (= (lemmaIsPrefixRefl!0 w1!584) lt!406465)))

(declare-fun bs!22738 () Bool)

(assert (= bs!22738 d!89576))

(assert (=> bs!22738 m!396043))

(declare-fun m!396115 () Bool)

(assert (=> bs!22738 m!396115))

(assert (=> b!265352 d!89576))

(declare-fun d!89578 () Bool)

(declare-fun res!221774 () Bool)

(declare-fun e!185413 () Bool)

(assert (=> d!89578 (=> (not res!221774) (not e!185413))))

(assert (=> d!89578 (= res!221774 (= (size!6449 (buf!6917 lt!406436)) (size!6449 (buf!6917 lt!406436))))))

(assert (=> d!89578 (= (isPrefixOf!0 lt!406436 lt!406436) e!185413)))

(declare-fun b!265392 () Bool)

(declare-fun res!221776 () Bool)

(assert (=> b!265392 (=> (not res!221776) (not e!185413))))

(assert (=> b!265392 (= res!221776 (bvsle (bitIndex!0 (size!6449 (buf!6917 lt!406436)) (currentByte!12799 lt!406436) (currentBit!12794 lt!406436)) (bitIndex!0 (size!6449 (buf!6917 lt!406436)) (currentByte!12799 lt!406436) (currentBit!12794 lt!406436))))))

(declare-fun b!265393 () Bool)

(declare-fun e!185412 () Bool)

(assert (=> b!265393 (= e!185413 e!185412)))

(declare-fun res!221775 () Bool)

(assert (=> b!265393 (=> res!221775 e!185412)))

(assert (=> b!265393 (= res!221775 (= (size!6449 (buf!6917 lt!406436)) #b00000000000000000000000000000000))))

(declare-fun b!265394 () Bool)

(assert (=> b!265394 (= e!185412 (arrayBitRangesEq!0 (buf!6917 lt!406436) (buf!6917 lt!406436) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 lt!406436)) (currentByte!12799 lt!406436) (currentBit!12794 lt!406436))))))

(assert (= (and d!89578 res!221774) b!265392))

(assert (= (and b!265392 res!221776) b!265393))

(assert (= (and b!265393 (not res!221775)) b!265394))

(assert (=> b!265392 m!396101))

(assert (=> b!265392 m!396101))

(assert (=> b!265394 m!396101))

(assert (=> b!265394 m!396101))

(declare-fun m!396119 () Bool)

(assert (=> b!265394 m!396119))

(assert (=> b!265352 d!89578))

(declare-fun d!89582 () Bool)

(assert (=> d!89582 (isPrefixOf!0 lt!406436 lt!406436)))

(declare-fun lt!406466 () Unit!18875)

(assert (=> d!89582 (= lt!406466 (choose!11 lt!406436))))

(assert (=> d!89582 (= (lemmaIsPrefixRefl!0 lt!406436) lt!406466)))

(declare-fun bs!22739 () Bool)

(assert (= bs!22739 d!89582))

(assert (=> bs!22739 m!396049))

(declare-fun m!396121 () Bool)

(assert (=> bs!22739 m!396121))

(assert (=> b!265352 d!89582))

(declare-fun d!89586 () Bool)

(declare-fun res!221777 () Bool)

(declare-fun e!185415 () Bool)

(assert (=> d!89586 (=> (not res!221777) (not e!185415))))

(assert (=> d!89586 (= res!221777 (= (size!6449 (buf!6917 w1!584)) (size!6449 (buf!6917 w1!584))))))

(assert (=> d!89586 (= (isPrefixOf!0 w1!584 w1!584) e!185415)))

(declare-fun b!265395 () Bool)

(declare-fun res!221779 () Bool)

(assert (=> b!265395 (=> (not res!221779) (not e!185415))))

(assert (=> b!265395 (= res!221779 (bvsle (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584)) (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584))))))

(declare-fun b!265396 () Bool)

(declare-fun e!185414 () Bool)

(assert (=> b!265396 (= e!185415 e!185414)))

(declare-fun res!221778 () Bool)

(assert (=> b!265396 (=> res!221778 e!185414)))

(assert (=> b!265396 (= res!221778 (= (size!6449 (buf!6917 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265397 () Bool)

(assert (=> b!265397 (= e!185414 (arrayBitRangesEq!0 (buf!6917 w1!584) (buf!6917 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584))))))

(assert (= (and d!89586 res!221777) b!265395))

(assert (= (and b!265395 res!221779) b!265396))

(assert (= (and b!265396 (not res!221778)) b!265397))

(assert (=> b!265395 m!396033))

(assert (=> b!265395 m!396033))

(assert (=> b!265397 m!396033))

(assert (=> b!265397 m!396033))

(declare-fun m!396123 () Bool)

(assert (=> b!265397 m!396123))

(assert (=> b!265352 d!89586))

(declare-fun d!89588 () Bool)

(declare-fun res!221780 () Bool)

(declare-fun e!185417 () Bool)

(assert (=> d!89588 (=> (not res!221780) (not e!185417))))

(assert (=> d!89588 (= res!221780 (= (size!6449 (buf!6917 w2!580)) (size!6449 (buf!6917 w2!580))))))

(assert (=> d!89588 (= (isPrefixOf!0 w2!580 w2!580) e!185417)))

(declare-fun b!265398 () Bool)

(declare-fun res!221782 () Bool)

(assert (=> b!265398 (=> (not res!221782) (not e!185417))))

(assert (=> b!265398 (= res!221782 (bvsle (bitIndex!0 (size!6449 (buf!6917 w2!580)) (currentByte!12799 w2!580) (currentBit!12794 w2!580)) (bitIndex!0 (size!6449 (buf!6917 w2!580)) (currentByte!12799 w2!580) (currentBit!12794 w2!580))))))

(declare-fun b!265399 () Bool)

(declare-fun e!185416 () Bool)

(assert (=> b!265399 (= e!185417 e!185416)))

(declare-fun res!221781 () Bool)

(assert (=> b!265399 (=> res!221781 e!185416)))

(assert (=> b!265399 (= res!221781 (= (size!6449 (buf!6917 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!265400 () Bool)

(assert (=> b!265400 (= e!185416 (arrayBitRangesEq!0 (buf!6917 w2!580) (buf!6917 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w2!580)) (currentByte!12799 w2!580) (currentBit!12794 w2!580))))))

(assert (= (and d!89588 res!221780) b!265398))

(assert (= (and b!265398 res!221782) b!265399))

(assert (= (and b!265399 (not res!221781)) b!265400))

(assert (=> b!265398 m!396105))

(assert (=> b!265398 m!396105))

(assert (=> b!265400 m!396105))

(assert (=> b!265400 m!396105))

(declare-fun m!396125 () Bool)

(assert (=> b!265400 m!396125))

(assert (=> b!265352 d!89588))

(declare-fun b!265438 () Bool)

(declare-fun res!221821 () Bool)

(declare-fun lt!406498 () (_ BitVec 32))

(assert (=> b!265438 (= res!221821 (= lt!406498 #b00000000000000000000000000000000))))

(declare-fun e!185447 () Bool)

(assert (=> b!265438 (=> res!221821 e!185447)))

(declare-fun e!185446 () Bool)

(assert (=> b!265438 (= e!185446 e!185447)))

(declare-fun b!265439 () Bool)

(declare-fun e!185444 () Bool)

(declare-fun e!185445 () Bool)

(assert (=> b!265439 (= e!185444 e!185445)))

(declare-fun res!221817 () Bool)

(assert (=> b!265439 (=> (not res!221817) (not e!185445))))

(declare-fun e!185448 () Bool)

(assert (=> b!265439 (= res!221817 e!185448)))

(declare-fun res!221816 () Bool)

(assert (=> b!265439 (=> res!221816 e!185448)))

(declare-datatypes ((tuple4!366 0))(
  ( (tuple4!367 (_1!12163 (_ BitVec 32)) (_2!12163 (_ BitVec 32)) (_3!963 (_ BitVec 32)) (_4!183 (_ BitVec 32))) )
))
(declare-fun lt!406499 () tuple4!366)

(assert (=> b!265439 (= res!221816 (bvsge (_1!12163 lt!406499) (_2!12163 lt!406499)))))

(assert (=> b!265439 (= lt!406498 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406503 () (_ BitVec 32))

(assert (=> b!265439 (= lt!406503 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!366)

(assert (=> b!265439 (= lt!406499 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584))))))

(declare-fun call!4127 () Bool)

(declare-fun bm!4124 () Bool)

(declare-fun c!12204 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4124 (= call!4127 (byteRangesEq!0 (select (arr!7436 (buf!6917 w1!584)) (_3!963 lt!406499)) (select (arr!7436 (buf!6917 w2!580)) (_3!963 lt!406499)) lt!406503 (ite c!12204 lt!406498 #b00000000000000000000000000001000)))))

(declare-fun b!265441 () Bool)

(assert (=> b!265441 (= e!185447 (byteRangesEq!0 (select (arr!7436 (buf!6917 w1!584)) (_4!183 lt!406499)) (select (arr!7436 (buf!6917 w2!580)) (_4!183 lt!406499)) #b00000000000000000000000000000000 lt!406498))))

(declare-fun b!265443 () Bool)

(declare-fun arrayRangesEq!1019 (array!14785 array!14785 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265443 (= e!185448 (arrayRangesEq!1019 (buf!6917 w1!584) (buf!6917 w2!580) (_1!12163 lt!406499) (_2!12163 lt!406499)))))

(declare-fun b!265445 () Bool)

(declare-fun e!185450 () Bool)

(assert (=> b!265445 (= e!185450 e!185446)))

(declare-fun res!221818 () Bool)

(assert (=> b!265445 (= res!221818 call!4127)))

(assert (=> b!265445 (=> (not res!221818) (not e!185446))))

(declare-fun b!265446 () Bool)

(assert (=> b!265446 (= e!185450 call!4127)))

(declare-fun d!89590 () Bool)

(declare-fun res!221820 () Bool)

(assert (=> d!89590 (=> res!221820 e!185444)))

(assert (=> d!89590 (= res!221820 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584))))))

(assert (=> d!89590 (= (arrayBitRangesEq!0 (buf!6917 w1!584) (buf!6917 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584))) e!185444)))

(declare-fun b!265440 () Bool)

(assert (=> b!265440 (= e!185445 e!185450)))

(assert (=> b!265440 (= c!12204 (= (_3!963 lt!406499) (_4!183 lt!406499)))))

(assert (= (and d!89590 (not res!221820)) b!265439))

(assert (= (and b!265439 (not res!221816)) b!265443))

(assert (= (and b!265439 res!221817) b!265440))

(assert (= (and b!265440 c!12204) b!265446))

(assert (= (and b!265440 (not c!12204)) b!265445))

(assert (= (and b!265445 res!221818) b!265438))

(assert (= (and b!265438 (not res!221821)) b!265441))

(assert (= (or b!265446 b!265445) bm!4124))

(assert (=> b!265439 m!396033))

(declare-fun m!396143 () Bool)

(assert (=> b!265439 m!396143))

(declare-fun m!396145 () Bool)

(assert (=> bm!4124 m!396145))

(declare-fun m!396147 () Bool)

(assert (=> bm!4124 m!396147))

(assert (=> bm!4124 m!396145))

(assert (=> bm!4124 m!396147))

(declare-fun m!396149 () Bool)

(assert (=> bm!4124 m!396149))

(declare-fun m!396151 () Bool)

(assert (=> b!265441 m!396151))

(declare-fun m!396153 () Bool)

(assert (=> b!265441 m!396153))

(assert (=> b!265441 m!396151))

(assert (=> b!265441 m!396153))

(declare-fun m!396155 () Bool)

(assert (=> b!265441 m!396155))

(declare-fun m!396157 () Bool)

(assert (=> b!265443 m!396157))

(assert (=> b!265347 d!89590))

(declare-fun d!89602 () Bool)

(declare-fun e!185454 () Bool)

(assert (=> d!89602 e!185454))

(declare-fun res!221829 () Bool)

(assert (=> d!89602 (=> (not res!221829) (not e!185454))))

(declare-fun lt!406536 () (_ BitVec 64))

(declare-fun lt!406534 () (_ BitVec 64))

(declare-fun lt!406533 () (_ BitVec 64))

(assert (=> d!89602 (= res!221829 (= lt!406534 (bvsub lt!406536 lt!406533)))))

(assert (=> d!89602 (or (= (bvand lt!406536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406533 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406536 lt!406533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89602 (= lt!406533 (remainingBits!0 ((_ sign_extend 32) (size!6449 (buf!6917 w1!584))) ((_ sign_extend 32) (currentByte!12799 w1!584)) ((_ sign_extend 32) (currentBit!12794 w1!584))))))

(declare-fun lt!406535 () (_ BitVec 64))

(declare-fun lt!406532 () (_ BitVec 64))

(assert (=> d!89602 (= lt!406536 (bvmul lt!406535 lt!406532))))

(assert (=> d!89602 (or (= lt!406535 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406532 (bvsdiv (bvmul lt!406535 lt!406532) lt!406535)))))

(assert (=> d!89602 (= lt!406532 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89602 (= lt!406535 ((_ sign_extend 32) (size!6449 (buf!6917 w1!584))))))

(assert (=> d!89602 (= lt!406534 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12799 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12794 w1!584))))))

(assert (=> d!89602 (invariant!0 (currentBit!12794 w1!584) (currentByte!12799 w1!584) (size!6449 (buf!6917 w1!584)))))

(assert (=> d!89602 (= (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584)) lt!406534)))

(declare-fun b!265453 () Bool)

(declare-fun res!221830 () Bool)

(assert (=> b!265453 (=> (not res!221830) (not e!185454))))

(assert (=> b!265453 (= res!221830 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406534))))

(declare-fun b!265454 () Bool)

(declare-fun lt!406531 () (_ BitVec 64))

(assert (=> b!265454 (= e!185454 (bvsle lt!406534 (bvmul lt!406531 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265454 (or (= lt!406531 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406531 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406531)))))

(assert (=> b!265454 (= lt!406531 ((_ sign_extend 32) (size!6449 (buf!6917 w1!584))))))

(assert (= (and d!89602 res!221829) b!265453))

(assert (= (and b!265453 res!221830) b!265454))

(declare-fun m!396167 () Bool)

(assert (=> d!89602 m!396167))

(assert (=> d!89602 m!396107))

(assert (=> b!265347 d!89602))

(declare-fun b!265455 () Bool)

(declare-fun res!221835 () Bool)

(declare-fun lt!406537 () (_ BitVec 32))

(assert (=> b!265455 (= res!221835 (= lt!406537 #b00000000000000000000000000000000))))

(declare-fun e!185458 () Bool)

(assert (=> b!265455 (=> res!221835 e!185458)))

(declare-fun e!185457 () Bool)

(assert (=> b!265455 (= e!185457 e!185458)))

(declare-fun b!265456 () Bool)

(declare-fun e!185455 () Bool)

(declare-fun e!185456 () Bool)

(assert (=> b!265456 (= e!185455 e!185456)))

(declare-fun res!221832 () Bool)

(assert (=> b!265456 (=> (not res!221832) (not e!185456))))

(declare-fun e!185459 () Bool)

(assert (=> b!265456 (= res!221832 e!185459)))

(declare-fun res!221831 () Bool)

(assert (=> b!265456 (=> res!221831 e!185459)))

(declare-fun lt!406538 () tuple4!366)

(assert (=> b!265456 (= res!221831 (bvsge (_1!12163 lt!406538) (_2!12163 lt!406538)))))

(assert (=> b!265456 (= lt!406537 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406539 () (_ BitVec 32))

(assert (=> b!265456 (= lt!406539 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265456 (= lt!406538 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584))))))

(declare-fun call!4128 () Bool)

(declare-fun c!12205 () Bool)

(declare-fun bm!4125 () Bool)

(assert (=> bm!4125 (= call!4128 (byteRangesEq!0 (select (arr!7436 (buf!6917 w2!580)) (_3!963 lt!406538)) (select (arr!7436 (buf!6917 w1!584)) (_3!963 lt!406538)) lt!406539 (ite c!12205 lt!406537 #b00000000000000000000000000001000)))))

(declare-fun b!265458 () Bool)

(assert (=> b!265458 (= e!185458 (byteRangesEq!0 (select (arr!7436 (buf!6917 w2!580)) (_4!183 lt!406538)) (select (arr!7436 (buf!6917 w1!584)) (_4!183 lt!406538)) #b00000000000000000000000000000000 lt!406537))))

(declare-fun b!265459 () Bool)

(assert (=> b!265459 (= e!185459 (arrayRangesEq!1019 (buf!6917 w2!580) (buf!6917 w1!584) (_1!12163 lt!406538) (_2!12163 lt!406538)))))

(declare-fun b!265460 () Bool)

(declare-fun e!185460 () Bool)

(assert (=> b!265460 (= e!185460 e!185457)))

(declare-fun res!221833 () Bool)

(assert (=> b!265460 (= res!221833 call!4128)))

(assert (=> b!265460 (=> (not res!221833) (not e!185457))))

(declare-fun b!265461 () Bool)

(assert (=> b!265461 (= e!185460 call!4128)))

(declare-fun d!89610 () Bool)

(declare-fun res!221834 () Bool)

(assert (=> d!89610 (=> res!221834 e!185455)))

(assert (=> d!89610 (= res!221834 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584))))))

(assert (=> d!89610 (= (arrayBitRangesEq!0 (buf!6917 w2!580) (buf!6917 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6449 (buf!6917 w1!584)) (currentByte!12799 w1!584) (currentBit!12794 w1!584))) e!185455)))

(declare-fun b!265457 () Bool)

(assert (=> b!265457 (= e!185456 e!185460)))

(assert (=> b!265457 (= c!12205 (= (_3!963 lt!406538) (_4!183 lt!406538)))))

(assert (= (and d!89610 (not res!221834)) b!265456))

(assert (= (and b!265456 (not res!221831)) b!265459))

(assert (= (and b!265456 res!221832) b!265457))

(assert (= (and b!265457 c!12205) b!265461))

(assert (= (and b!265457 (not c!12205)) b!265460))

(assert (= (and b!265460 res!221833) b!265455))

(assert (= (and b!265455 (not res!221835)) b!265458))

(assert (= (or b!265461 b!265460) bm!4125))

(assert (=> b!265456 m!396033))

(assert (=> b!265456 m!396143))

(declare-fun m!396169 () Bool)

(assert (=> bm!4125 m!396169))

(declare-fun m!396171 () Bool)

(assert (=> bm!4125 m!396171))

(assert (=> bm!4125 m!396169))

(assert (=> bm!4125 m!396171))

(declare-fun m!396173 () Bool)

(assert (=> bm!4125 m!396173))

(declare-fun m!396175 () Bool)

(assert (=> b!265458 m!396175))

(declare-fun m!396177 () Bool)

(assert (=> b!265458 m!396177))

(assert (=> b!265458 m!396175))

(assert (=> b!265458 m!396177))

(declare-fun m!396179 () Bool)

(assert (=> b!265458 m!396179))

(declare-fun m!396181 () Bool)

(assert (=> b!265459 m!396181))

(assert (=> b!265346 d!89610))

(assert (=> b!265346 d!89602))

(declare-fun d!89612 () Bool)

(assert (=> d!89612 (= (array_inv!6173 (buf!6917 w1!584)) (bvsge (size!6449 (buf!6917 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265344 d!89612))

(assert (=> b!265345 d!89602))

(declare-fun d!89614 () Bool)

(assert (=> d!89614 (arrayBitRangesEq!0 (buf!6917 w2!580) (buf!6917 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406434)))

(declare-fun lt!406548 () Unit!18875)

(declare-fun choose!8 (array!14785 array!14785 (_ BitVec 64) (_ BitVec 64)) Unit!18875)

(assert (=> d!89614 (= lt!406548 (choose!8 (buf!6917 w1!584) (buf!6917 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406434))))

(assert (=> d!89614 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406434))))

(assert (=> d!89614 (= (arrayBitRangesEqSymmetric!0 (buf!6917 w1!584) (buf!6917 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406434) lt!406548)))

(declare-fun bs!22743 () Bool)

(assert (= bs!22743 d!89614))

(assert (=> bs!22743 m!396037))

(declare-fun m!396183 () Bool)

(assert (=> bs!22743 m!396183))

(assert (=> b!265345 d!89614))

(declare-fun b!265476 () Bool)

(declare-fun res!221850 () Bool)

(declare-fun lt!406549 () (_ BitVec 32))

(assert (=> b!265476 (= res!221850 (= lt!406549 #b00000000000000000000000000000000))))

(declare-fun e!185476 () Bool)

(assert (=> b!265476 (=> res!221850 e!185476)))

(declare-fun e!185475 () Bool)

(assert (=> b!265476 (= e!185475 e!185476)))

(declare-fun b!265477 () Bool)

(declare-fun e!185473 () Bool)

(declare-fun e!185474 () Bool)

(assert (=> b!265477 (= e!185473 e!185474)))

(declare-fun res!221847 () Bool)

(assert (=> b!265477 (=> (not res!221847) (not e!185474))))

(declare-fun e!185477 () Bool)

(assert (=> b!265477 (= res!221847 e!185477)))

(declare-fun res!221846 () Bool)

(assert (=> b!265477 (=> res!221846 e!185477)))

(declare-fun lt!406550 () tuple4!366)

(assert (=> b!265477 (= res!221846 (bvsge (_1!12163 lt!406550) (_2!12163 lt!406550)))))

(assert (=> b!265477 (= lt!406549 ((_ extract 31 0) (bvsrem lt!406434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406551 () (_ BitVec 32))

(assert (=> b!265477 (= lt!406551 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265477 (= lt!406550 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!406434))))

(declare-fun call!4131 () Bool)

(declare-fun c!12208 () Bool)

(declare-fun bm!4128 () Bool)

(assert (=> bm!4128 (= call!4131 (byteRangesEq!0 (select (arr!7436 (buf!6917 w2!580)) (_3!963 lt!406550)) (select (arr!7436 (buf!6917 w1!584)) (_3!963 lt!406550)) lt!406551 (ite c!12208 lt!406549 #b00000000000000000000000000001000)))))

(declare-fun b!265479 () Bool)

(assert (=> b!265479 (= e!185476 (byteRangesEq!0 (select (arr!7436 (buf!6917 w2!580)) (_4!183 lt!406550)) (select (arr!7436 (buf!6917 w1!584)) (_4!183 lt!406550)) #b00000000000000000000000000000000 lt!406549))))

(declare-fun b!265480 () Bool)

(assert (=> b!265480 (= e!185477 (arrayRangesEq!1019 (buf!6917 w2!580) (buf!6917 w1!584) (_1!12163 lt!406550) (_2!12163 lt!406550)))))

(declare-fun b!265481 () Bool)

(declare-fun e!185478 () Bool)

(assert (=> b!265481 (= e!185478 e!185475)))

(declare-fun res!221848 () Bool)

(assert (=> b!265481 (= res!221848 call!4131)))

(assert (=> b!265481 (=> (not res!221848) (not e!185475))))

(declare-fun b!265482 () Bool)

(assert (=> b!265482 (= e!185478 call!4131)))

(declare-fun d!89616 () Bool)

(declare-fun res!221849 () Bool)

(assert (=> d!89616 (=> res!221849 e!185473)))

(assert (=> d!89616 (= res!221849 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!406434))))

(assert (=> d!89616 (= (arrayBitRangesEq!0 (buf!6917 w2!580) (buf!6917 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406434) e!185473)))

(declare-fun b!265478 () Bool)

(assert (=> b!265478 (= e!185474 e!185478)))

(assert (=> b!265478 (= c!12208 (= (_3!963 lt!406550) (_4!183 lt!406550)))))

(assert (= (and d!89616 (not res!221849)) b!265477))

(assert (= (and b!265477 (not res!221846)) b!265480))

(assert (= (and b!265477 res!221847) b!265478))

(assert (= (and b!265478 c!12208) b!265482))

(assert (= (and b!265478 (not c!12208)) b!265481))

(assert (= (and b!265481 res!221848) b!265476))

(assert (= (and b!265476 (not res!221850)) b!265479))

(assert (= (or b!265482 b!265481) bm!4128))

(declare-fun m!396185 () Bool)

(assert (=> b!265477 m!396185))

(declare-fun m!396187 () Bool)

(assert (=> bm!4128 m!396187))

(declare-fun m!396189 () Bool)

(assert (=> bm!4128 m!396189))

(assert (=> bm!4128 m!396187))

(assert (=> bm!4128 m!396189))

(declare-fun m!396191 () Bool)

(assert (=> bm!4128 m!396191))

(declare-fun m!396193 () Bool)

(assert (=> b!265479 m!396193))

(declare-fun m!396195 () Bool)

(assert (=> b!265479 m!396195))

(assert (=> b!265479 m!396193))

(assert (=> b!265479 m!396195))

(declare-fun m!396197 () Bool)

(assert (=> b!265479 m!396197))

(declare-fun m!396199 () Bool)

(assert (=> b!265480 m!396199))

(assert (=> b!265345 d!89616))

(check-sat (not b!265458) (not b!265459) (not b!265397) (not b!265441) (not d!89576) (not b!265479) (not b!265477) (not b!265456) (not b!265395) (not bm!4124) (not d!89570) (not d!89582) (not bm!4128) (not b!265391) (not d!89614) (not b!265389) (not b!265443) (not b!265480) (not b!265386) (not b!265398) (not d!89564) (not bm!4125) (not b!265394) (not b!265388) (not d!89602) (not b!265400) (not b!265439) (not b!265392) (not d!89572))
