; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57710 () Bool)

(assert start!57710)

(declare-fun b!264803 () Bool)

(declare-datatypes ((Unit!18851 0))(
  ( (Unit!18852) )
))
(declare-fun e!184883 () Unit!18851)

(declare-fun lt!406006 () Unit!18851)

(assert (=> b!264803 (= e!184883 lt!406006)))

(declare-fun lt!406007 () (_ BitVec 64))

(declare-datatypes ((array!14761 0))(
  ( (array!14762 (arr!7427 (Array (_ BitVec 32) (_ BitVec 8))) (size!6440 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11694 0))(
  ( (BitStream!11695 (buf!6908 array!14761) (currentByte!12784 (_ BitVec 32)) (currentBit!12779 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11694)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264803 (= lt!406007 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)))))

(declare-fun w2!580 () BitStream!11694)

(declare-fun arrayBitRangesEqSymmetric!0 (array!14761 array!14761 (_ BitVec 64) (_ BitVec 64)) Unit!18851)

(assert (=> b!264803 (= lt!406006 (arrayBitRangesEqSymmetric!0 (buf!6908 w1!584) (buf!6908 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406007))))

(declare-fun arrayBitRangesEq!0 (array!14761 array!14761 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!264803 (arrayBitRangesEq!0 (buf!6908 w2!580) (buf!6908 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406007)))

(declare-fun b!264804 () Bool)

(declare-fun res!221345 () Bool)

(declare-fun e!184890 () Bool)

(assert (=> b!264804 (=> res!221345 e!184890)))

(declare-fun lt!406005 () BitStream!11694)

(declare-fun isPrefixOf!0 (BitStream!11694 BitStream!11694) Bool)

(assert (=> b!264804 (= res!221345 (not (isPrefixOf!0 lt!406005 w1!584)))))

(declare-fun b!264805 () Bool)

(declare-fun e!184885 () Bool)

(assert (=> b!264805 (= e!184885 e!184890)))

(declare-fun res!221343 () Bool)

(assert (=> b!264805 (=> res!221343 e!184890)))

(declare-fun e!184886 () Bool)

(assert (=> b!264805 (= res!221343 e!184886)))

(declare-fun res!221342 () Bool)

(assert (=> b!264805 (=> (not res!221342) (not e!184886))))

(assert (=> b!264805 (= res!221342 (not (= (size!6440 (buf!6908 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!406003 () Unit!18851)

(assert (=> b!264805 (= lt!406003 e!184883)))

(declare-fun c!12156 () Bool)

(assert (=> b!264805 (= c!12156 (not (= (size!6440 (buf!6908 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!264806 () Bool)

(declare-fun e!184881 () Bool)

(assert (=> b!264806 (= e!184881 (not (arrayBitRangesEq!0 (buf!6908 w1!584) (buf!6908 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)))))))

(declare-fun b!264807 () Bool)

(declare-fun e!184884 () Bool)

(declare-fun array_inv!6164 (array!14761) Bool)

(assert (=> b!264807 (= e!184884 (array_inv!6164 (buf!6908 w1!584)))))

(declare-fun b!264809 () Bool)

(declare-fun Unit!18853 () Unit!18851)

(assert (=> b!264809 (= e!184883 Unit!18853)))

(declare-fun b!264810 () Bool)

(declare-fun e!184888 () Bool)

(assert (=> b!264810 (= e!184888 (array_inv!6164 (buf!6908 w2!580)))))

(declare-fun b!264811 () Bool)

(declare-fun e!184887 () Bool)

(assert (=> b!264811 (= e!184887 (not e!184885))))

(declare-fun res!221344 () Bool)

(assert (=> b!264811 (=> res!221344 e!184885)))

(assert (=> b!264811 (= res!221344 e!184881)))

(declare-fun res!221347 () Bool)

(assert (=> b!264811 (=> (not res!221347) (not e!184881))))

(assert (=> b!264811 (= res!221347 (not (= (size!6440 (buf!6908 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264811 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406008 () Unit!18851)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11694) Unit!18851)

(assert (=> b!264811 (= lt!406008 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!264811 (isPrefixOf!0 lt!406005 lt!406005)))

(declare-fun lt!406004 () Unit!18851)

(assert (=> b!264811 (= lt!406004 (lemmaIsPrefixRefl!0 lt!406005))))

(assert (=> b!264811 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406010 () Unit!18851)

(assert (=> b!264811 (= lt!406010 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264811 (= lt!406005 (BitStream!11695 (buf!6908 w2!580) (currentByte!12784 w1!584) (currentBit!12779 w1!584)))))

(declare-fun b!264812 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!11694 (_ BitVec 64)) Bool)

(assert (=> b!264812 (= e!184890 (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)) (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580)))))))

(declare-fun lt!406002 () Unit!18851)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11694 BitStream!11694 BitStream!11694) Unit!18851)

(assert (=> b!264812 (= lt!406002 (lemmaIsPrefixTransitive!0 lt!406005 w2!580 w2!580))))

(assert (=> b!264812 (isPrefixOf!0 lt!406005 w2!580)))

(declare-fun lt!406009 () Unit!18851)

(assert (=> b!264812 (= lt!406009 (lemmaIsPrefixTransitive!0 lt!406005 w1!584 w2!580))))

(declare-fun res!221346 () Bool)

(assert (=> start!57710 (=> (not res!221346) (not e!184887))))

(assert (=> start!57710 (= res!221346 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57710 e!184887))

(declare-fun inv!12 (BitStream!11694) Bool)

(assert (=> start!57710 (and (inv!12 w1!584) e!184884)))

(assert (=> start!57710 (and (inv!12 w2!580) e!184888)))

(declare-fun b!264808 () Bool)

(assert (=> b!264808 (= e!184886 (not (arrayBitRangesEq!0 (buf!6908 w2!580) (buf!6908 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)))))))

(assert (= (and start!57710 res!221346) b!264811))

(assert (= (and b!264811 res!221347) b!264806))

(assert (= (and b!264811 (not res!221344)) b!264805))

(assert (= (and b!264805 c!12156) b!264803))

(assert (= (and b!264805 (not c!12156)) b!264809))

(assert (= (and b!264805 res!221342) b!264808))

(assert (= (and b!264805 (not res!221343)) b!264804))

(assert (= (and b!264804 (not res!221345)) b!264812))

(assert (= start!57710 b!264807))

(assert (= start!57710 b!264810))

(declare-fun m!395389 () Bool)

(assert (=> b!264811 m!395389))

(declare-fun m!395391 () Bool)

(assert (=> b!264811 m!395391))

(declare-fun m!395393 () Bool)

(assert (=> b!264811 m!395393))

(declare-fun m!395395 () Bool)

(assert (=> b!264811 m!395395))

(declare-fun m!395397 () Bool)

(assert (=> b!264811 m!395397))

(declare-fun m!395399 () Bool)

(assert (=> b!264811 m!395399))

(declare-fun m!395401 () Bool)

(assert (=> b!264803 m!395401))

(declare-fun m!395403 () Bool)

(assert (=> b!264803 m!395403))

(declare-fun m!395405 () Bool)

(assert (=> b!264803 m!395405))

(declare-fun m!395407 () Bool)

(assert (=> b!264810 m!395407))

(assert (=> b!264806 m!395401))

(assert (=> b!264806 m!395401))

(declare-fun m!395409 () Bool)

(assert (=> b!264806 m!395409))

(declare-fun m!395411 () Bool)

(assert (=> b!264804 m!395411))

(assert (=> b!264808 m!395401))

(assert (=> b!264808 m!395401))

(declare-fun m!395413 () Bool)

(assert (=> b!264808 m!395413))

(assert (=> b!264812 m!395401))

(declare-fun m!395415 () Bool)

(assert (=> b!264812 m!395415))

(declare-fun m!395417 () Bool)

(assert (=> b!264812 m!395417))

(declare-fun m!395419 () Bool)

(assert (=> b!264812 m!395419))

(declare-fun m!395421 () Bool)

(assert (=> b!264812 m!395421))

(declare-fun m!395423 () Bool)

(assert (=> b!264812 m!395423))

(declare-fun m!395425 () Bool)

(assert (=> b!264807 m!395425))

(declare-fun m!395427 () Bool)

(assert (=> start!57710 m!395427))

(declare-fun m!395429 () Bool)

(assert (=> start!57710 m!395429))

(declare-fun m!395431 () Bool)

(assert (=> start!57710 m!395431))

(check-sat (not start!57710) (not b!264808) (not b!264803) (not b!264806) (not b!264810) (not b!264807) (not b!264804) (not b!264812) (not b!264811))
(check-sat)
(get-model)

(declare-fun d!89342 () Bool)

(assert (=> d!89342 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406040 () Unit!18851)

(declare-fun choose!11 (BitStream!11694) Unit!18851)

(assert (=> d!89342 (= lt!406040 (choose!11 w2!580))))

(assert (=> d!89342 (= (lemmaIsPrefixRefl!0 w2!580) lt!406040)))

(declare-fun bs!22678 () Bool)

(assert (= bs!22678 d!89342))

(assert (=> bs!22678 m!395397))

(declare-fun m!395477 () Bool)

(assert (=> bs!22678 m!395477))

(assert (=> b!264811 d!89342))

(declare-fun d!89344 () Bool)

(assert (=> d!89344 (isPrefixOf!0 lt!406005 lt!406005)))

(declare-fun lt!406041 () Unit!18851)

(assert (=> d!89344 (= lt!406041 (choose!11 lt!406005))))

(assert (=> d!89344 (= (lemmaIsPrefixRefl!0 lt!406005) lt!406041)))

(declare-fun bs!22679 () Bool)

(assert (= bs!22679 d!89344))

(assert (=> bs!22679 m!395395))

(declare-fun m!395479 () Bool)

(assert (=> bs!22679 m!395479))

(assert (=> b!264811 d!89344))

(declare-fun d!89346 () Bool)

(assert (=> d!89346 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406042 () Unit!18851)

(assert (=> d!89346 (= lt!406042 (choose!11 w1!584))))

(assert (=> d!89346 (= (lemmaIsPrefixRefl!0 w1!584) lt!406042)))

(declare-fun bs!22680 () Bool)

(assert (= bs!22680 d!89346))

(assert (=> bs!22680 m!395393))

(declare-fun m!395481 () Bool)

(assert (=> bs!22680 m!395481))

(assert (=> b!264811 d!89346))

(declare-fun d!89348 () Bool)

(declare-fun res!221372 () Bool)

(declare-fun e!184925 () Bool)

(assert (=> d!89348 (=> (not res!221372) (not e!184925))))

(assert (=> d!89348 (= res!221372 (= (size!6440 (buf!6908 lt!406005)) (size!6440 (buf!6908 lt!406005))))))

(assert (=> d!89348 (= (isPrefixOf!0 lt!406005 lt!406005) e!184925)))

(declare-fun b!264849 () Bool)

(declare-fun res!221374 () Bool)

(assert (=> b!264849 (=> (not res!221374) (not e!184925))))

(assert (=> b!264849 (= res!221374 (bvsle (bitIndex!0 (size!6440 (buf!6908 lt!406005)) (currentByte!12784 lt!406005) (currentBit!12779 lt!406005)) (bitIndex!0 (size!6440 (buf!6908 lt!406005)) (currentByte!12784 lt!406005) (currentBit!12779 lt!406005))))))

(declare-fun b!264850 () Bool)

(declare-fun e!184926 () Bool)

(assert (=> b!264850 (= e!184925 e!184926)))

(declare-fun res!221373 () Bool)

(assert (=> b!264850 (=> res!221373 e!184926)))

(assert (=> b!264850 (= res!221373 (= (size!6440 (buf!6908 lt!406005)) #b00000000000000000000000000000000))))

(declare-fun b!264851 () Bool)

(assert (=> b!264851 (= e!184926 (arrayBitRangesEq!0 (buf!6908 lt!406005) (buf!6908 lt!406005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 lt!406005)) (currentByte!12784 lt!406005) (currentBit!12779 lt!406005))))))

(assert (= (and d!89348 res!221372) b!264849))

(assert (= (and b!264849 res!221374) b!264850))

(assert (= (and b!264850 (not res!221373)) b!264851))

(declare-fun m!395483 () Bool)

(assert (=> b!264849 m!395483))

(assert (=> b!264849 m!395483))

(assert (=> b!264851 m!395483))

(assert (=> b!264851 m!395483))

(declare-fun m!395485 () Bool)

(assert (=> b!264851 m!395485))

(assert (=> b!264811 d!89348))

(declare-fun d!89354 () Bool)

(declare-fun res!221375 () Bool)

(declare-fun e!184927 () Bool)

(assert (=> d!89354 (=> (not res!221375) (not e!184927))))

(assert (=> d!89354 (= res!221375 (= (size!6440 (buf!6908 w1!584)) (size!6440 (buf!6908 w1!584))))))

(assert (=> d!89354 (= (isPrefixOf!0 w1!584 w1!584) e!184927)))

(declare-fun b!264852 () Bool)

(declare-fun res!221377 () Bool)

(assert (=> b!264852 (=> (not res!221377) (not e!184927))))

(assert (=> b!264852 (= res!221377 (bvsle (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)) (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584))))))

(declare-fun b!264853 () Bool)

(declare-fun e!184928 () Bool)

(assert (=> b!264853 (= e!184927 e!184928)))

(declare-fun res!221376 () Bool)

(assert (=> b!264853 (=> res!221376 e!184928)))

(assert (=> b!264853 (= res!221376 (= (size!6440 (buf!6908 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264854 () Bool)

(assert (=> b!264854 (= e!184928 (arrayBitRangesEq!0 (buf!6908 w1!584) (buf!6908 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584))))))

(assert (= (and d!89354 res!221375) b!264852))

(assert (= (and b!264852 res!221377) b!264853))

(assert (= (and b!264853 (not res!221376)) b!264854))

(assert (=> b!264852 m!395401))

(assert (=> b!264852 m!395401))

(assert (=> b!264854 m!395401))

(assert (=> b!264854 m!395401))

(declare-fun m!395487 () Bool)

(assert (=> b!264854 m!395487))

(assert (=> b!264811 d!89354))

(declare-fun d!89356 () Bool)

(declare-fun res!221378 () Bool)

(declare-fun e!184929 () Bool)

(assert (=> d!89356 (=> (not res!221378) (not e!184929))))

(assert (=> d!89356 (= res!221378 (= (size!6440 (buf!6908 w2!580)) (size!6440 (buf!6908 w2!580))))))

(assert (=> d!89356 (= (isPrefixOf!0 w2!580 w2!580) e!184929)))

(declare-fun b!264855 () Bool)

(declare-fun res!221380 () Bool)

(assert (=> b!264855 (=> (not res!221380) (not e!184929))))

(assert (=> b!264855 (= res!221380 (bvsle (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580)) (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580))))))

(declare-fun b!264856 () Bool)

(declare-fun e!184930 () Bool)

(assert (=> b!264856 (= e!184929 e!184930)))

(declare-fun res!221379 () Bool)

(assert (=> b!264856 (=> res!221379 e!184930)))

(assert (=> b!264856 (= res!221379 (= (size!6440 (buf!6908 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!264857 () Bool)

(assert (=> b!264857 (= e!184930 (arrayBitRangesEq!0 (buf!6908 w2!580) (buf!6908 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580))))))

(assert (= (and d!89356 res!221378) b!264855))

(assert (= (and b!264855 res!221380) b!264856))

(assert (= (and b!264856 (not res!221379)) b!264857))

(assert (=> b!264855 m!395415))

(assert (=> b!264855 m!395415))

(assert (=> b!264857 m!395415))

(assert (=> b!264857 m!395415))

(declare-fun m!395489 () Bool)

(assert (=> b!264857 m!395489))

(assert (=> b!264811 d!89356))

(declare-fun b!264911 () Bool)

(declare-fun e!184975 () Bool)

(declare-fun e!184977 () Bool)

(assert (=> b!264911 (= e!184975 e!184977)))

(declare-fun c!12165 () Bool)

(declare-datatypes ((tuple4!356 0))(
  ( (tuple4!357 (_1!12158 (_ BitVec 32)) (_2!12158 (_ BitVec 32)) (_3!958 (_ BitVec 32)) (_4!178 (_ BitVec 32))) )
))
(declare-fun lt!406063 () tuple4!356)

(assert (=> b!264911 (= c!12165 (= (_3!958 lt!406063) (_4!178 lt!406063)))))

(declare-fun b!264912 () Bool)

(declare-fun e!184976 () Bool)

(declare-fun call!4106 () Bool)

(assert (=> b!264912 (= e!184976 call!4106)))

(declare-fun d!89358 () Bool)

(declare-fun res!221426 () Bool)

(declare-fun e!184974 () Bool)

(assert (=> d!89358 (=> res!221426 e!184974)))

(assert (=> d!89358 (= res!221426 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584))))))

(assert (=> d!89358 (= (arrayBitRangesEq!0 (buf!6908 w1!584) (buf!6908 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584))) e!184974)))

(declare-fun b!264913 () Bool)

(assert (=> b!264913 (= e!184974 e!184975)))

(declare-fun res!221428 () Bool)

(assert (=> b!264913 (=> (not res!221428) (not e!184975))))

(declare-fun e!184973 () Bool)

(assert (=> b!264913 (= res!221428 e!184973)))

(declare-fun res!221427 () Bool)

(assert (=> b!264913 (=> res!221427 e!184973)))

(assert (=> b!264913 (= res!221427 (bvsge (_1!12158 lt!406063) (_2!12158 lt!406063)))))

(declare-fun lt!406064 () (_ BitVec 32))

(assert (=> b!264913 (= lt!406064 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406065 () (_ BitVec 32))

(assert (=> b!264913 (= lt!406065 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!356)

(assert (=> b!264913 (= lt!406063 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584))))))

(declare-fun b!264914 () Bool)

(declare-fun e!184978 () Bool)

(assert (=> b!264914 (= e!184977 e!184978)))

(declare-fun res!221425 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264914 (= res!221425 (byteRangesEq!0 (select (arr!7427 (buf!6908 w1!584)) (_3!958 lt!406063)) (select (arr!7427 (buf!6908 w2!580)) (_3!958 lt!406063)) lt!406065 #b00000000000000000000000000001000))))

(assert (=> b!264914 (=> (not res!221425) (not e!184978))))

(declare-fun bm!4103 () Bool)

(assert (=> bm!4103 (= call!4106 (byteRangesEq!0 (ite c!12165 (select (arr!7427 (buf!6908 w1!584)) (_3!958 lt!406063)) (select (arr!7427 (buf!6908 w1!584)) (_4!178 lt!406063))) (ite c!12165 (select (arr!7427 (buf!6908 w2!580)) (_3!958 lt!406063)) (select (arr!7427 (buf!6908 w2!580)) (_4!178 lt!406063))) (ite c!12165 lt!406065 #b00000000000000000000000000000000) lt!406064))))

(declare-fun b!264915 () Bool)

(assert (=> b!264915 (= e!184977 call!4106)))

(declare-fun b!264916 () Bool)

(declare-fun res!221424 () Bool)

(assert (=> b!264916 (= res!221424 (= lt!406064 #b00000000000000000000000000000000))))

(assert (=> b!264916 (=> res!221424 e!184976)))

(assert (=> b!264916 (= e!184978 e!184976)))

(declare-fun b!264917 () Bool)

(declare-fun arrayRangesEq!1014 (array!14761 array!14761 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264917 (= e!184973 (arrayRangesEq!1014 (buf!6908 w1!584) (buf!6908 w2!580) (_1!12158 lt!406063) (_2!12158 lt!406063)))))

(assert (= (and d!89358 (not res!221426)) b!264913))

(assert (= (and b!264913 (not res!221427)) b!264917))

(assert (= (and b!264913 res!221428) b!264911))

(assert (= (and b!264911 c!12165) b!264915))

(assert (= (and b!264911 (not c!12165)) b!264914))

(assert (= (and b!264914 res!221425) b!264916))

(assert (= (and b!264916 (not res!221424)) b!264912))

(assert (= (or b!264915 b!264912) bm!4103))

(assert (=> b!264913 m!395401))

(declare-fun m!395525 () Bool)

(assert (=> b!264913 m!395525))

(declare-fun m!395527 () Bool)

(assert (=> b!264914 m!395527))

(declare-fun m!395529 () Bool)

(assert (=> b!264914 m!395529))

(assert (=> b!264914 m!395527))

(assert (=> b!264914 m!395529))

(declare-fun m!395531 () Bool)

(assert (=> b!264914 m!395531))

(declare-fun m!395533 () Bool)

(assert (=> bm!4103 m!395533))

(assert (=> bm!4103 m!395527))

(assert (=> bm!4103 m!395529))

(declare-fun m!395535 () Bool)

(assert (=> bm!4103 m!395535))

(declare-fun m!395537 () Bool)

(assert (=> bm!4103 m!395537))

(declare-fun m!395539 () Bool)

(assert (=> b!264917 m!395539))

(assert (=> b!264806 d!89358))

(declare-fun d!89384 () Bool)

(declare-fun e!184984 () Bool)

(assert (=> d!89384 e!184984))

(declare-fun res!221440 () Bool)

(assert (=> d!89384 (=> (not res!221440) (not e!184984))))

(declare-fun lt!406101 () (_ BitVec 64))

(declare-fun lt!406100 () (_ BitVec 64))

(declare-fun lt!406096 () (_ BitVec 64))

(assert (=> d!89384 (= res!221440 (= lt!406100 (bvsub lt!406096 lt!406101)))))

(assert (=> d!89384 (or (= (bvand lt!406096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406096 lt!406101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89384 (= lt!406101 (remainingBits!0 ((_ sign_extend 32) (size!6440 (buf!6908 w1!584))) ((_ sign_extend 32) (currentByte!12784 w1!584)) ((_ sign_extend 32) (currentBit!12779 w1!584))))))

(declare-fun lt!406097 () (_ BitVec 64))

(declare-fun lt!406099 () (_ BitVec 64))

(assert (=> d!89384 (= lt!406096 (bvmul lt!406097 lt!406099))))

(assert (=> d!89384 (or (= lt!406097 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406099 (bvsdiv (bvmul lt!406097 lt!406099) lt!406097)))))

(assert (=> d!89384 (= lt!406099 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89384 (= lt!406097 ((_ sign_extend 32) (size!6440 (buf!6908 w1!584))))))

(assert (=> d!89384 (= lt!406100 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12784 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12779 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89384 (invariant!0 (currentBit!12779 w1!584) (currentByte!12784 w1!584) (size!6440 (buf!6908 w1!584)))))

(assert (=> d!89384 (= (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)) lt!406100)))

(declare-fun b!264928 () Bool)

(declare-fun res!221439 () Bool)

(assert (=> b!264928 (=> (not res!221439) (not e!184984))))

(assert (=> b!264928 (= res!221439 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406100))))

(declare-fun b!264929 () Bool)

(declare-fun lt!406098 () (_ BitVec 64))

(assert (=> b!264929 (= e!184984 (bvsle lt!406100 (bvmul lt!406098 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264929 (or (= lt!406098 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406098 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406098)))))

(assert (=> b!264929 (= lt!406098 ((_ sign_extend 32) (size!6440 (buf!6908 w1!584))))))

(assert (= (and d!89384 res!221440) b!264928))

(assert (= (and b!264928 res!221439) b!264929))

(declare-fun m!395545 () Bool)

(assert (=> d!89384 m!395545))

(declare-fun m!395547 () Bool)

(assert (=> d!89384 m!395547))

(assert (=> b!264806 d!89384))

(declare-fun d!89388 () Bool)

(declare-fun res!221459 () Bool)

(declare-fun e!185003 () Bool)

(assert (=> d!89388 (=> (not res!221459) (not e!185003))))

(assert (=> d!89388 (= res!221459 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6440 (buf!6908 w2!580)))) (bvsub (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)) (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580)))) (bvsle (bvsub (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)) (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6440 (buf!6908 w2!580)))))))))

(assert (=> d!89388 (= (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)) (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580)))) e!185003)))

(declare-fun b!264953 () Bool)

(declare-fun lt!406113 () (_ BitVec 64))

(assert (=> b!264953 (= e!185003 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406113) (bvsle lt!406113 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6440 (buf!6908 w2!580)))))))))

(assert (=> b!264953 (= lt!406113 (bvadd (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580)) (bvsub (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)) (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580)))))))

(assert (= (and d!89388 res!221459) b!264953))

(assert (=> b!264953 m!395415))

(assert (=> b!264812 d!89388))

(declare-fun d!89392 () Bool)

(declare-fun res!221463 () Bool)

(declare-fun e!185006 () Bool)

(assert (=> d!89392 (=> (not res!221463) (not e!185006))))

(assert (=> d!89392 (= res!221463 (= (size!6440 (buf!6908 lt!406005)) (size!6440 (buf!6908 w2!580))))))

(assert (=> d!89392 (= (isPrefixOf!0 lt!406005 w2!580) e!185006)))

(declare-fun b!264957 () Bool)

(declare-fun res!221465 () Bool)

(assert (=> b!264957 (=> (not res!221465) (not e!185006))))

(assert (=> b!264957 (= res!221465 (bvsle (bitIndex!0 (size!6440 (buf!6908 lt!406005)) (currentByte!12784 lt!406005) (currentBit!12779 lt!406005)) (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580))))))

(declare-fun b!264958 () Bool)

(declare-fun e!185007 () Bool)

(assert (=> b!264958 (= e!185006 e!185007)))

(declare-fun res!221464 () Bool)

(assert (=> b!264958 (=> res!221464 e!185007)))

(assert (=> b!264958 (= res!221464 (= (size!6440 (buf!6908 lt!406005)) #b00000000000000000000000000000000))))

(declare-fun b!264959 () Bool)

(assert (=> b!264959 (= e!185007 (arrayBitRangesEq!0 (buf!6908 lt!406005) (buf!6908 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 lt!406005)) (currentByte!12784 lt!406005) (currentBit!12779 lt!406005))))))

(assert (= (and d!89392 res!221463) b!264957))

(assert (= (and b!264957 res!221465) b!264958))

(assert (= (and b!264958 (not res!221464)) b!264959))

(assert (=> b!264957 m!395483))

(assert (=> b!264957 m!395415))

(assert (=> b!264959 m!395483))

(assert (=> b!264959 m!395483))

(declare-fun m!395555 () Bool)

(assert (=> b!264959 m!395555))

(assert (=> b!264812 d!89392))

(declare-fun d!89396 () Bool)

(assert (=> d!89396 (isPrefixOf!0 lt!406005 w2!580)))

(declare-fun lt!406121 () Unit!18851)

(declare-fun choose!30 (BitStream!11694 BitStream!11694 BitStream!11694) Unit!18851)

(assert (=> d!89396 (= lt!406121 (choose!30 lt!406005 w2!580 w2!580))))

(assert (=> d!89396 (isPrefixOf!0 lt!406005 w2!580)))

(assert (=> d!89396 (= (lemmaIsPrefixTransitive!0 lt!406005 w2!580 w2!580) lt!406121)))

(declare-fun bs!22691 () Bool)

(assert (= bs!22691 d!89396))

(assert (=> bs!22691 m!395419))

(declare-fun m!395581 () Bool)

(assert (=> bs!22691 m!395581))

(assert (=> bs!22691 m!395419))

(assert (=> b!264812 d!89396))

(declare-fun d!89410 () Bool)

(declare-fun e!185018 () Bool)

(assert (=> d!89410 e!185018))

(declare-fun res!221478 () Bool)

(assert (=> d!89410 (=> (not res!221478) (not e!185018))))

(declare-fun lt!406127 () (_ BitVec 64))

(declare-fun lt!406122 () (_ BitVec 64))

(declare-fun lt!406126 () (_ BitVec 64))

(assert (=> d!89410 (= res!221478 (= lt!406126 (bvsub lt!406122 lt!406127)))))

(assert (=> d!89410 (or (= (bvand lt!406122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406127 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406122 lt!406127) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!89410 (= lt!406127 (remainingBits!0 ((_ sign_extend 32) (size!6440 (buf!6908 w2!580))) ((_ sign_extend 32) (currentByte!12784 w2!580)) ((_ sign_extend 32) (currentBit!12779 w2!580))))))

(declare-fun lt!406123 () (_ BitVec 64))

(declare-fun lt!406125 () (_ BitVec 64))

(assert (=> d!89410 (= lt!406122 (bvmul lt!406123 lt!406125))))

(assert (=> d!89410 (or (= lt!406123 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406125 (bvsdiv (bvmul lt!406123 lt!406125) lt!406123)))))

(assert (=> d!89410 (= lt!406125 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89410 (= lt!406123 ((_ sign_extend 32) (size!6440 (buf!6908 w2!580))))))

(assert (=> d!89410 (= lt!406126 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12784 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12779 w2!580))))))

(assert (=> d!89410 (invariant!0 (currentBit!12779 w2!580) (currentByte!12784 w2!580) (size!6440 (buf!6908 w2!580)))))

(assert (=> d!89410 (= (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580)) lt!406126)))

(declare-fun b!264973 () Bool)

(declare-fun res!221477 () Bool)

(assert (=> b!264973 (=> (not res!221477) (not e!185018))))

(assert (=> b!264973 (= res!221477 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406126))))

(declare-fun b!264974 () Bool)

(declare-fun lt!406124 () (_ BitVec 64))

(assert (=> b!264974 (= e!185018 (bvsle lt!406126 (bvmul lt!406124 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264974 (or (= lt!406124 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406124 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406124)))))

(assert (=> b!264974 (= lt!406124 ((_ sign_extend 32) (size!6440 (buf!6908 w2!580))))))

(assert (= (and d!89410 res!221478) b!264973))

(assert (= (and b!264973 res!221477) b!264974))

(declare-fun m!395583 () Bool)

(assert (=> d!89410 m!395583))

(declare-fun m!395585 () Bool)

(assert (=> d!89410 m!395585))

(assert (=> b!264812 d!89410))

(assert (=> b!264812 d!89384))

(declare-fun d!89412 () Bool)

(assert (=> d!89412 (isPrefixOf!0 lt!406005 w2!580)))

(declare-fun lt!406128 () Unit!18851)

(assert (=> d!89412 (= lt!406128 (choose!30 lt!406005 w1!584 w2!580))))

(assert (=> d!89412 (isPrefixOf!0 lt!406005 w1!584)))

(assert (=> d!89412 (= (lemmaIsPrefixTransitive!0 lt!406005 w1!584 w2!580) lt!406128)))

(declare-fun bs!22692 () Bool)

(assert (= bs!22692 d!89412))

(assert (=> bs!22692 m!395419))

(declare-fun m!395587 () Bool)

(assert (=> bs!22692 m!395587))

(assert (=> bs!22692 m!395411))

(assert (=> b!264812 d!89412))

(declare-fun d!89414 () Bool)

(assert (=> d!89414 (= (array_inv!6164 (buf!6908 w1!584)) (bvsge (size!6440 (buf!6908 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!264807 d!89414))

(declare-fun b!264975 () Bool)

(declare-fun e!185021 () Bool)

(declare-fun e!185023 () Bool)

(assert (=> b!264975 (= e!185021 e!185023)))

(declare-fun c!12169 () Bool)

(declare-fun lt!406131 () tuple4!356)

(assert (=> b!264975 (= c!12169 (= (_3!958 lt!406131) (_4!178 lt!406131)))))

(declare-fun b!264976 () Bool)

(declare-fun e!185022 () Bool)

(declare-fun call!4110 () Bool)

(assert (=> b!264976 (= e!185022 call!4110)))

(declare-fun d!89416 () Bool)

(declare-fun res!221481 () Bool)

(declare-fun e!185020 () Bool)

(assert (=> d!89416 (=> res!221481 e!185020)))

(assert (=> d!89416 (= res!221481 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584))))))

(assert (=> d!89416 (= (arrayBitRangesEq!0 (buf!6908 w2!580) (buf!6908 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584))) e!185020)))

(declare-fun b!264977 () Bool)

(assert (=> b!264977 (= e!185020 e!185021)))

(declare-fun res!221483 () Bool)

(assert (=> b!264977 (=> (not res!221483) (not e!185021))))

(declare-fun e!185019 () Bool)

(assert (=> b!264977 (= res!221483 e!185019)))

(declare-fun res!221482 () Bool)

(assert (=> b!264977 (=> res!221482 e!185019)))

(assert (=> b!264977 (= res!221482 (bvsge (_1!12158 lt!406131) (_2!12158 lt!406131)))))

(declare-fun lt!406132 () (_ BitVec 32))

(assert (=> b!264977 (= lt!406132 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406133 () (_ BitVec 32))

(assert (=> b!264977 (= lt!406133 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264977 (= lt!406131 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584))))))

(declare-fun b!264978 () Bool)

(declare-fun e!185024 () Bool)

(assert (=> b!264978 (= e!185023 e!185024)))

(declare-fun res!221480 () Bool)

(assert (=> b!264978 (= res!221480 (byteRangesEq!0 (select (arr!7427 (buf!6908 w2!580)) (_3!958 lt!406131)) (select (arr!7427 (buf!6908 w1!584)) (_3!958 lt!406131)) lt!406133 #b00000000000000000000000000001000))))

(assert (=> b!264978 (=> (not res!221480) (not e!185024))))

(declare-fun bm!4107 () Bool)

(assert (=> bm!4107 (= call!4110 (byteRangesEq!0 (ite c!12169 (select (arr!7427 (buf!6908 w2!580)) (_3!958 lt!406131)) (select (arr!7427 (buf!6908 w2!580)) (_4!178 lt!406131))) (ite c!12169 (select (arr!7427 (buf!6908 w1!584)) (_3!958 lt!406131)) (select (arr!7427 (buf!6908 w1!584)) (_4!178 lt!406131))) (ite c!12169 lt!406133 #b00000000000000000000000000000000) lt!406132))))

(declare-fun b!264979 () Bool)

(assert (=> b!264979 (= e!185023 call!4110)))

(declare-fun b!264980 () Bool)

(declare-fun res!221479 () Bool)

(assert (=> b!264980 (= res!221479 (= lt!406132 #b00000000000000000000000000000000))))

(assert (=> b!264980 (=> res!221479 e!185022)))

(assert (=> b!264980 (= e!185024 e!185022)))

(declare-fun b!264981 () Bool)

(assert (=> b!264981 (= e!185019 (arrayRangesEq!1014 (buf!6908 w2!580) (buf!6908 w1!584) (_1!12158 lt!406131) (_2!12158 lt!406131)))))

(assert (= (and d!89416 (not res!221481)) b!264977))

(assert (= (and b!264977 (not res!221482)) b!264981))

(assert (= (and b!264977 res!221483) b!264975))

(assert (= (and b!264975 c!12169) b!264979))

(assert (= (and b!264975 (not c!12169)) b!264978))

(assert (= (and b!264978 res!221480) b!264980))

(assert (= (and b!264980 (not res!221479)) b!264976))

(assert (= (or b!264979 b!264976) bm!4107))

(assert (=> b!264977 m!395401))

(assert (=> b!264977 m!395525))

(declare-fun m!395591 () Bool)

(assert (=> b!264978 m!395591))

(declare-fun m!395593 () Bool)

(assert (=> b!264978 m!395593))

(assert (=> b!264978 m!395591))

(assert (=> b!264978 m!395593))

(declare-fun m!395595 () Bool)

(assert (=> b!264978 m!395595))

(declare-fun m!395597 () Bool)

(assert (=> bm!4107 m!395597))

(assert (=> bm!4107 m!395591))

(assert (=> bm!4107 m!395593))

(declare-fun m!395599 () Bool)

(assert (=> bm!4107 m!395599))

(declare-fun m!395601 () Bool)

(assert (=> bm!4107 m!395601))

(declare-fun m!395603 () Bool)

(assert (=> b!264981 m!395603))

(assert (=> b!264808 d!89416))

(assert (=> b!264808 d!89384))

(assert (=> b!264803 d!89384))

(declare-fun d!89420 () Bool)

(assert (=> d!89420 (arrayBitRangesEq!0 (buf!6908 w2!580) (buf!6908 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406007)))

(declare-fun lt!406140 () Unit!18851)

(declare-fun choose!8 (array!14761 array!14761 (_ BitVec 64) (_ BitVec 64)) Unit!18851)

(assert (=> d!89420 (= lt!406140 (choose!8 (buf!6908 w1!584) (buf!6908 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406007))))

(assert (=> d!89420 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406007))))

(assert (=> d!89420 (= (arrayBitRangesEqSymmetric!0 (buf!6908 w1!584) (buf!6908 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406007) lt!406140)))

(declare-fun bs!22696 () Bool)

(assert (= bs!22696 d!89420))

(assert (=> bs!22696 m!395405))

(declare-fun m!395623 () Bool)

(assert (=> bs!22696 m!395623))

(assert (=> b!264803 d!89420))

(declare-fun b!264992 () Bool)

(declare-fun e!185035 () Bool)

(declare-fun e!185037 () Bool)

(assert (=> b!264992 (= e!185035 e!185037)))

(declare-fun c!12171 () Bool)

(declare-fun lt!406141 () tuple4!356)

(assert (=> b!264992 (= c!12171 (= (_3!958 lt!406141) (_4!178 lt!406141)))))

(declare-fun b!264993 () Bool)

(declare-fun e!185036 () Bool)

(declare-fun call!4112 () Bool)

(assert (=> b!264993 (= e!185036 call!4112)))

(declare-fun d!89430 () Bool)

(declare-fun res!221494 () Bool)

(declare-fun e!185034 () Bool)

(assert (=> d!89430 (=> res!221494 e!185034)))

(assert (=> d!89430 (= res!221494 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!406007))))

(assert (=> d!89430 (= (arrayBitRangesEq!0 (buf!6908 w2!580) (buf!6908 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406007) e!185034)))

(declare-fun b!264994 () Bool)

(assert (=> b!264994 (= e!185034 e!185035)))

(declare-fun res!221496 () Bool)

(assert (=> b!264994 (=> (not res!221496) (not e!185035))))

(declare-fun e!185033 () Bool)

(assert (=> b!264994 (= res!221496 e!185033)))

(declare-fun res!221495 () Bool)

(assert (=> b!264994 (=> res!221495 e!185033)))

(assert (=> b!264994 (= res!221495 (bvsge (_1!12158 lt!406141) (_2!12158 lt!406141)))))

(declare-fun lt!406142 () (_ BitVec 32))

(assert (=> b!264994 (= lt!406142 ((_ extract 31 0) (bvsrem lt!406007 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406143 () (_ BitVec 32))

(assert (=> b!264994 (= lt!406143 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264994 (= lt!406141 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!406007))))

(declare-fun b!264995 () Bool)

(declare-fun e!185038 () Bool)

(assert (=> b!264995 (= e!185037 e!185038)))

(declare-fun res!221493 () Bool)

(assert (=> b!264995 (= res!221493 (byteRangesEq!0 (select (arr!7427 (buf!6908 w2!580)) (_3!958 lt!406141)) (select (arr!7427 (buf!6908 w1!584)) (_3!958 lt!406141)) lt!406143 #b00000000000000000000000000001000))))

(assert (=> b!264995 (=> (not res!221493) (not e!185038))))

(declare-fun bm!4109 () Bool)

(assert (=> bm!4109 (= call!4112 (byteRangesEq!0 (ite c!12171 (select (arr!7427 (buf!6908 w2!580)) (_3!958 lt!406141)) (select (arr!7427 (buf!6908 w2!580)) (_4!178 lt!406141))) (ite c!12171 (select (arr!7427 (buf!6908 w1!584)) (_3!958 lt!406141)) (select (arr!7427 (buf!6908 w1!584)) (_4!178 lt!406141))) (ite c!12171 lt!406143 #b00000000000000000000000000000000) lt!406142))))

(declare-fun b!264996 () Bool)

(assert (=> b!264996 (= e!185037 call!4112)))

(declare-fun b!264997 () Bool)

(declare-fun res!221492 () Bool)

(assert (=> b!264997 (= res!221492 (= lt!406142 #b00000000000000000000000000000000))))

(assert (=> b!264997 (=> res!221492 e!185036)))

(assert (=> b!264997 (= e!185038 e!185036)))

(declare-fun b!264998 () Bool)

(assert (=> b!264998 (= e!185033 (arrayRangesEq!1014 (buf!6908 w2!580) (buf!6908 w1!584) (_1!12158 lt!406141) (_2!12158 lt!406141)))))

(assert (= (and d!89430 (not res!221494)) b!264994))

(assert (= (and b!264994 (not res!221495)) b!264998))

(assert (= (and b!264994 res!221496) b!264992))

(assert (= (and b!264992 c!12171) b!264996))

(assert (= (and b!264992 (not c!12171)) b!264995))

(assert (= (and b!264995 res!221493) b!264997))

(assert (= (and b!264997 (not res!221492)) b!264993))

(assert (= (or b!264996 b!264993) bm!4109))

(declare-fun m!395625 () Bool)

(assert (=> b!264994 m!395625))

(declare-fun m!395627 () Bool)

(assert (=> b!264995 m!395627))

(declare-fun m!395629 () Bool)

(assert (=> b!264995 m!395629))

(assert (=> b!264995 m!395627))

(assert (=> b!264995 m!395629))

(declare-fun m!395631 () Bool)

(assert (=> b!264995 m!395631))

(declare-fun m!395633 () Bool)

(assert (=> bm!4109 m!395633))

(assert (=> bm!4109 m!395627))

(assert (=> bm!4109 m!395629))

(declare-fun m!395635 () Bool)

(assert (=> bm!4109 m!395635))

(declare-fun m!395637 () Bool)

(assert (=> bm!4109 m!395637))

(declare-fun m!395639 () Bool)

(assert (=> b!264998 m!395639))

(assert (=> b!264803 d!89430))

(declare-fun d!89432 () Bool)

(declare-fun res!221497 () Bool)

(declare-fun e!185039 () Bool)

(assert (=> d!89432 (=> (not res!221497) (not e!185039))))

(assert (=> d!89432 (= res!221497 (= (size!6440 (buf!6908 lt!406005)) (size!6440 (buf!6908 w1!584))))))

(assert (=> d!89432 (= (isPrefixOf!0 lt!406005 w1!584) e!185039)))

(declare-fun b!264999 () Bool)

(declare-fun res!221499 () Bool)

(assert (=> b!264999 (=> (not res!221499) (not e!185039))))

(assert (=> b!264999 (= res!221499 (bvsle (bitIndex!0 (size!6440 (buf!6908 lt!406005)) (currentByte!12784 lt!406005) (currentBit!12779 lt!406005)) (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584))))))

(declare-fun b!265000 () Bool)

(declare-fun e!185040 () Bool)

(assert (=> b!265000 (= e!185039 e!185040)))

(declare-fun res!221498 () Bool)

(assert (=> b!265000 (=> res!221498 e!185040)))

(assert (=> b!265000 (= res!221498 (= (size!6440 (buf!6908 lt!406005)) #b00000000000000000000000000000000))))

(declare-fun b!265001 () Bool)

(assert (=> b!265001 (= e!185040 (arrayBitRangesEq!0 (buf!6908 lt!406005) (buf!6908 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 lt!406005)) (currentByte!12784 lt!406005) (currentBit!12779 lt!406005))))))

(assert (= (and d!89432 res!221497) b!264999))

(assert (= (and b!264999 res!221499) b!265000))

(assert (= (and b!265000 (not res!221498)) b!265001))

(assert (=> b!264999 m!395483))

(assert (=> b!264999 m!395401))

(assert (=> b!265001 m!395483))

(assert (=> b!265001 m!395483))

(declare-fun m!395641 () Bool)

(assert (=> b!265001 m!395641))

(assert (=> b!264804 d!89432))

(declare-fun d!89434 () Bool)

(assert (=> d!89434 (= (array_inv!6164 (buf!6908 w2!580)) (bvsge (size!6440 (buf!6908 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!264810 d!89434))

(declare-fun d!89436 () Bool)

(declare-fun res!221500 () Bool)

(declare-fun e!185041 () Bool)

(assert (=> d!89436 (=> (not res!221500) (not e!185041))))

(assert (=> d!89436 (= res!221500 (= (size!6440 (buf!6908 w1!584)) (size!6440 (buf!6908 w2!580))))))

(assert (=> d!89436 (= (isPrefixOf!0 w1!584 w2!580) e!185041)))

(declare-fun b!265002 () Bool)

(declare-fun res!221502 () Bool)

(assert (=> b!265002 (=> (not res!221502) (not e!185041))))

(assert (=> b!265002 (= res!221502 (bvsle (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584)) (bitIndex!0 (size!6440 (buf!6908 w2!580)) (currentByte!12784 w2!580) (currentBit!12779 w2!580))))))

(declare-fun b!265003 () Bool)

(declare-fun e!185042 () Bool)

(assert (=> b!265003 (= e!185041 e!185042)))

(declare-fun res!221501 () Bool)

(assert (=> b!265003 (=> res!221501 e!185042)))

(assert (=> b!265003 (= res!221501 (= (size!6440 (buf!6908 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265004 () Bool)

(assert (=> b!265004 (= e!185042 (arrayBitRangesEq!0 (buf!6908 w1!584) (buf!6908 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6440 (buf!6908 w1!584)) (currentByte!12784 w1!584) (currentBit!12779 w1!584))))))

(assert (= (and d!89436 res!221500) b!265002))

(assert (= (and b!265002 res!221502) b!265003))

(assert (= (and b!265003 (not res!221501)) b!265004))

(assert (=> b!265002 m!395401))

(assert (=> b!265002 m!395415))

(assert (=> b!265004 m!395401))

(assert (=> b!265004 m!395401))

(assert (=> b!265004 m!395409))

(assert (=> start!57710 d!89436))

(declare-fun d!89438 () Bool)

(assert (=> d!89438 (= (inv!12 w1!584) (invariant!0 (currentBit!12779 w1!584) (currentByte!12784 w1!584) (size!6440 (buf!6908 w1!584))))))

(declare-fun bs!22697 () Bool)

(assert (= bs!22697 d!89438))

(assert (=> bs!22697 m!395547))

(assert (=> start!57710 d!89438))

(declare-fun d!89440 () Bool)

(assert (=> d!89440 (= (inv!12 w2!580) (invariant!0 (currentBit!12779 w2!580) (currentByte!12784 w2!580) (size!6440 (buf!6908 w2!580))))))

(declare-fun bs!22698 () Bool)

(assert (= bs!22698 d!89440))

(assert (=> bs!22698 m!395585))

(assert (=> start!57710 d!89440))

(check-sat (not b!265002) (not b!264998) (not b!264854) (not b!265001) (not b!265004) (not d!89438) (not d!89420) (not b!264959) (not b!264917) (not b!264994) (not b!264851) (not b!264981) (not b!264957) (not d!89344) (not d!89396) (not b!264855) (not b!264999) (not b!264849) (not d!89342) (not d!89346) (not b!264995) (not d!89384) (not b!264977) (not bm!4109) (not d!89440) (not b!264978) (not bm!4103) (not d!89412) (not d!89410) (not b!264852) (not b!264913) (not b!264953) (not bm!4107) (not b!264914) (not b!264857))
(check-sat)
