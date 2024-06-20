; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57768 () Bool)

(assert start!57768)

(declare-fun b!265064 () Bool)

(declare-fun e!185092 () Bool)

(declare-fun e!185097 () Bool)

(assert (=> b!265064 (= e!185092 (not e!185097))))

(declare-fun res!221551 () Bool)

(assert (=> b!265064 (=> res!221551 e!185097)))

(declare-datatypes ((array!14768 0))(
  ( (array!14769 (arr!7429 (Array (_ BitVec 32) (_ BitVec 8))) (size!6442 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11698 0))(
  ( (BitStream!11699 (buf!6910 array!14768) (currentByte!12789 (_ BitVec 32)) (currentBit!12784 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11698)

(assert (=> b!265064 (= res!221551 (= (size!6442 (buf!6910 w1!584)) #b00000000000000000000000000000000))))

(declare-fun w2!580 () BitStream!11698)

(declare-fun isPrefixOf!0 (BitStream!11698 BitStream!11698) Bool)

(assert (=> b!265064 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18857 0))(
  ( (Unit!18858) )
))
(declare-fun lt!406211 () Unit!18857)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11698) Unit!18857)

(assert (=> b!265064 (= lt!406211 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406210 () BitStream!11698)

(assert (=> b!265064 (isPrefixOf!0 lt!406210 lt!406210)))

(declare-fun lt!406209 () Unit!18857)

(assert (=> b!265064 (= lt!406209 (lemmaIsPrefixRefl!0 lt!406210))))

(assert (=> b!265064 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406208 () Unit!18857)

(assert (=> b!265064 (= lt!406208 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265064 (= lt!406210 (BitStream!11699 (buf!6910 w2!580) (currentByte!12789 w1!584) (currentBit!12784 w1!584)))))

(declare-fun b!265065 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14768 array!14768 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265065 (= e!185097 (arrayBitRangesEq!0 (buf!6910 w1!584) (buf!6910 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584))))))

(declare-fun b!265067 () Bool)

(declare-fun e!185095 () Bool)

(declare-fun array_inv!6166 (array!14768) Bool)

(assert (=> b!265067 (= e!185095 (array_inv!6166 (buf!6910 w2!580)))))

(declare-fun res!221550 () Bool)

(assert (=> start!57768 (=> (not res!221550) (not e!185092))))

(assert (=> start!57768 (= res!221550 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57768 e!185092))

(declare-fun e!185094 () Bool)

(declare-fun inv!12 (BitStream!11698) Bool)

(assert (=> start!57768 (and (inv!12 w1!584) e!185094)))

(assert (=> start!57768 (and (inv!12 w2!580) e!185095)))

(declare-fun b!265066 () Bool)

(assert (=> b!265066 (= e!185094 (array_inv!6166 (buf!6910 w1!584)))))

(assert (= (and start!57768 res!221550) b!265064))

(assert (= (and b!265064 (not res!221551)) b!265065))

(assert (= start!57768 b!265066))

(assert (= start!57768 b!265067))

(declare-fun m!395711 () Bool)

(assert (=> b!265064 m!395711))

(declare-fun m!395713 () Bool)

(assert (=> b!265064 m!395713))

(declare-fun m!395715 () Bool)

(assert (=> b!265064 m!395715))

(declare-fun m!395717 () Bool)

(assert (=> b!265064 m!395717))

(declare-fun m!395719 () Bool)

(assert (=> b!265064 m!395719))

(declare-fun m!395721 () Bool)

(assert (=> b!265064 m!395721))

(declare-fun m!395723 () Bool)

(assert (=> b!265065 m!395723))

(assert (=> b!265065 m!395723))

(declare-fun m!395725 () Bool)

(assert (=> b!265065 m!395725))

(declare-fun m!395727 () Bool)

(assert (=> b!265067 m!395727))

(declare-fun m!395729 () Bool)

(assert (=> b!265066 m!395729))

(declare-fun m!395731 () Bool)

(assert (=> start!57768 m!395731))

(declare-fun m!395733 () Bool)

(assert (=> start!57768 m!395733))

(declare-fun m!395735 () Bool)

(assert (=> start!57768 m!395735))

(push 1)

(assert (not b!265064))

(assert (not b!265067))

(assert (not b!265065))

(assert (not start!57768))

(assert (not b!265066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89482 () Bool)

(declare-fun res!221579 () Bool)

(declare-fun e!185145 () Bool)

(assert (=> d!89482 (=> (not res!221579) (not e!185145))))

(assert (=> d!89482 (= res!221579 (= (size!6442 (buf!6910 w1!584)) (size!6442 (buf!6910 w2!580))))))

(assert (=> d!89482 (= (isPrefixOf!0 w1!584 w2!580) e!185145)))

(declare-fun b!265107 () Bool)

(declare-fun res!221580 () Bool)

(assert (=> b!265107 (=> (not res!221580) (not e!185145))))

(assert (=> b!265107 (= res!221580 (bvsle (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584)) (bitIndex!0 (size!6442 (buf!6910 w2!580)) (currentByte!12789 w2!580) (currentBit!12784 w2!580))))))

(declare-fun b!265108 () Bool)

(declare-fun e!185144 () Bool)

(assert (=> b!265108 (= e!185145 e!185144)))

(declare-fun res!221581 () Bool)

(assert (=> b!265108 (=> res!221581 e!185144)))

(assert (=> b!265108 (= res!221581 (= (size!6442 (buf!6910 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265109 () Bool)

(assert (=> b!265109 (= e!185144 (arrayBitRangesEq!0 (buf!6910 w1!584) (buf!6910 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584))))))

(assert (= (and d!89482 res!221579) b!265107))

(assert (= (and b!265107 res!221580) b!265108))

(assert (= (and b!265108 (not res!221581)) b!265109))

(assert (=> b!265107 m!395723))

(declare-fun m!395795 () Bool)

(assert (=> b!265107 m!395795))

(assert (=> b!265109 m!395723))

(assert (=> b!265109 m!395723))

(assert (=> b!265109 m!395725))

(assert (=> start!57768 d!89482))

(declare-fun d!89490 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89490 (= (inv!12 w1!584) (invariant!0 (currentBit!12784 w1!584) (currentByte!12789 w1!584) (size!6442 (buf!6910 w1!584))))))

(declare-fun bs!22712 () Bool)

(assert (= bs!22712 d!89490))

(declare-fun m!395801 () Bool)

(assert (=> bs!22712 m!395801))

(assert (=> start!57768 d!89490))

(declare-fun d!89496 () Bool)

(assert (=> d!89496 (= (inv!12 w2!580) (invariant!0 (currentBit!12784 w2!580) (currentByte!12789 w2!580) (size!6442 (buf!6910 w2!580))))))

(declare-fun bs!22713 () Bool)

(assert (= bs!22713 d!89496))

(declare-fun m!395803 () Bool)

(assert (=> bs!22713 m!395803))

(assert (=> start!57768 d!89496))

(declare-fun d!89500 () Bool)

(assert (=> d!89500 (= (array_inv!6166 (buf!6910 w2!580)) (bvsge (size!6442 (buf!6910 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265067 d!89500))

(declare-fun d!89502 () Bool)

(assert (=> d!89502 (= (array_inv!6166 (buf!6910 w1!584)) (bvsge (size!6442 (buf!6910 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265066 d!89502))

(declare-fun d!89504 () Bool)

(declare-fun res!221629 () Bool)

(declare-fun e!185195 () Bool)

(assert (=> d!89504 (=> res!221629 e!185195)))

(assert (=> d!89504 (= res!221629 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584))))))

(assert (=> d!89504 (= (arrayBitRangesEq!0 (buf!6910 w1!584) (buf!6910 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584))) e!185195)))

(declare-fun b!265165 () Bool)

(declare-fun e!185194 () Bool)

(declare-fun call!4121 () Bool)

(assert (=> b!265165 (= e!185194 call!4121)))

(declare-fun b!265166 () Bool)

(declare-fun e!185190 () Bool)

(assert (=> b!265166 (= e!185190 call!4121)))

(declare-fun c!12180 () Bool)

(declare-fun bm!4118 () Bool)

(declare-fun lt!406263 () (_ BitVec 32))

(declare-fun lt!406264 () (_ BitVec 32))

(declare-datatypes ((tuple4!360 0))(
  ( (tuple4!361 (_1!12160 (_ BitVec 32)) (_2!12160 (_ BitVec 32)) (_3!960 (_ BitVec 32)) (_4!180 (_ BitVec 32))) )
))
(declare-fun lt!406262 () tuple4!360)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4118 (= call!4121 (byteRangesEq!0 (ite c!12180 (select (arr!7429 (buf!6910 w1!584)) (_3!960 lt!406262)) (select (arr!7429 (buf!6910 w1!584)) (_4!180 lt!406262))) (ite c!12180 (select (arr!7429 (buf!6910 w2!580)) (_3!960 lt!406262)) (select (arr!7429 (buf!6910 w2!580)) (_4!180 lt!406262))) (ite c!12180 lt!406263 #b00000000000000000000000000000000) lt!406264))))

(declare-fun b!265167 () Bool)

(declare-fun e!185192 () Bool)

(declare-fun arrayRangesEq!1016 (array!14768 array!14768 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265167 (= e!185192 (arrayRangesEq!1016 (buf!6910 w1!584) (buf!6910 w2!580) (_1!12160 lt!406262) (_2!12160 lt!406262)))))

(declare-fun b!265168 () Bool)

(declare-fun e!185193 () Bool)

(assert (=> b!265168 (= e!185193 e!185190)))

(assert (=> b!265168 (= c!12180 (= (_3!960 lt!406262) (_4!180 lt!406262)))))

(declare-fun b!265169 () Bool)

(assert (=> b!265169 (= e!185195 e!185193)))

(declare-fun res!221631 () Bool)

(assert (=> b!265169 (=> (not res!221631) (not e!185193))))

(assert (=> b!265169 (= res!221631 e!185192)))

(declare-fun res!221627 () Bool)

(assert (=> b!265169 (=> res!221627 e!185192)))

(assert (=> b!265169 (= res!221627 (bvsge (_1!12160 lt!406262) (_2!12160 lt!406262)))))

(assert (=> b!265169 (= lt!406264 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265169 (= lt!406263 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!360)

(assert (=> b!265169 (= lt!406262 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584))))))

(declare-fun b!265170 () Bool)

(declare-fun e!185191 () Bool)

(assert (=> b!265170 (= e!185190 e!185191)))

(declare-fun res!221630 () Bool)

(assert (=> b!265170 (= res!221630 (byteRangesEq!0 (select (arr!7429 (buf!6910 w1!584)) (_3!960 lt!406262)) (select (arr!7429 (buf!6910 w2!580)) (_3!960 lt!406262)) lt!406263 #b00000000000000000000000000001000))))

(assert (=> b!265170 (=> (not res!221630) (not e!185191))))

(declare-fun b!265171 () Bool)

(declare-fun res!221628 () Bool)

(assert (=> b!265171 (= res!221628 (= lt!406264 #b00000000000000000000000000000000))))

(assert (=> b!265171 (=> res!221628 e!185194)))

(assert (=> b!265171 (= e!185191 e!185194)))

(assert (= (and d!89504 (not res!221629)) b!265169))

(assert (= (and b!265169 (not res!221627)) b!265167))

(assert (= (and b!265169 res!221631) b!265168))

(assert (= (and b!265168 c!12180) b!265166))

(assert (= (and b!265168 (not c!12180)) b!265170))

(assert (= (and b!265170 res!221630) b!265171))

(assert (= (and b!265171 (not res!221628)) b!265165))

(assert (= (or b!265166 b!265165) bm!4118))

(declare-fun m!395837 () Bool)

(assert (=> bm!4118 m!395837))

(declare-fun m!395839 () Bool)

(assert (=> bm!4118 m!395839))

(declare-fun m!395841 () Bool)

(assert (=> bm!4118 m!395841))

(declare-fun m!395843 () Bool)

(assert (=> bm!4118 m!395843))

(declare-fun m!395845 () Bool)

(assert (=> bm!4118 m!395845))

(declare-fun m!395847 () Bool)

(assert (=> b!265167 m!395847))

(assert (=> b!265169 m!395723))

(declare-fun m!395849 () Bool)

(assert (=> b!265169 m!395849))

(assert (=> b!265170 m!395843))

(assert (=> b!265170 m!395845))

(assert (=> b!265170 m!395843))

(assert (=> b!265170 m!395845))

(declare-fun m!395851 () Bool)

(assert (=> b!265170 m!395851))

(assert (=> b!265065 d!89504))

(declare-fun d!89526 () Bool)

(declare-fun e!185217 () Bool)

(assert (=> d!89526 e!185217))

(declare-fun res!221655 () Bool)

(assert (=> d!89526 (=> (not res!221655) (not e!185217))))

(declare-fun lt!406303 () (_ BitVec 64))

(declare-fun lt!406300 () (_ BitVec 64))

(declare-fun lt!406302 () (_ BitVec 64))

(assert (=> d!89526 (= res!221655 (= lt!406300 (bvsub lt!406302 lt!406303)))))

(assert (=> d!89526 (or (= (bvand lt!406302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406302 lt!406303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89526 (= lt!406303 (remainingBits!0 ((_ sign_extend 32) (size!6442 (buf!6910 w1!584))) ((_ sign_extend 32) (currentByte!12789 w1!584)) ((_ sign_extend 32) (currentBit!12784 w1!584))))))

(declare-fun lt!406301 () (_ BitVec 64))

(declare-fun lt!406299 () (_ BitVec 64))

(assert (=> d!89526 (= lt!406302 (bvmul lt!406301 lt!406299))))

(assert (=> d!89526 (or (= lt!406301 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406299 (bvsdiv (bvmul lt!406301 lt!406299) lt!406301)))))

(assert (=> d!89526 (= lt!406299 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89526 (= lt!406301 ((_ sign_extend 32) (size!6442 (buf!6910 w1!584))))))

(assert (=> d!89526 (= lt!406300 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12789 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12784 w1!584))))))

(assert (=> d!89526 (invariant!0 (currentBit!12784 w1!584) (currentByte!12789 w1!584) (size!6442 (buf!6910 w1!584)))))

(assert (=> d!89526 (= (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584)) lt!406300)))

(declare-fun b!265201 () Bool)

(declare-fun res!221656 () Bool)

(assert (=> b!265201 (=> (not res!221656) (not e!185217))))

(assert (=> b!265201 (= res!221656 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406300))))

(declare-fun b!265202 () Bool)

(declare-fun lt!406298 () (_ BitVec 64))

(assert (=> b!265202 (= e!185217 (bvsle lt!406300 (bvmul lt!406298 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265202 (or (= lt!406298 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406298 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406298)))))

(assert (=> b!265202 (= lt!406298 ((_ sign_extend 32) (size!6442 (buf!6910 w1!584))))))

(assert (= (and d!89526 res!221655) b!265201))

(assert (= (and b!265201 res!221656) b!265202))

(declare-fun m!395871 () Bool)

(assert (=> d!89526 m!395871))

(assert (=> d!89526 m!395801))

(assert (=> b!265065 d!89526))

(declare-fun d!89532 () Bool)

(assert (=> d!89532 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406321 () Unit!18857)

(declare-fun choose!11 (BitStream!11698) Unit!18857)

(assert (=> d!89532 (= lt!406321 (choose!11 w2!580))))

(assert (=> d!89532 (= (lemmaIsPrefixRefl!0 w2!580) lt!406321)))

(declare-fun bs!22720 () Bool)

(assert (= bs!22720 d!89532))

(assert (=> bs!22720 m!395719))

(declare-fun m!395877 () Bool)

(assert (=> bs!22720 m!395877))

(assert (=> b!265064 d!89532))

(declare-fun d!89536 () Bool)

(declare-fun res!221664 () Bool)

(declare-fun e!185223 () Bool)

(assert (=> d!89536 (=> (not res!221664) (not e!185223))))

(assert (=> d!89536 (= res!221664 (= (size!6442 (buf!6910 lt!406210)) (size!6442 (buf!6910 lt!406210))))))

(assert (=> d!89536 (= (isPrefixOf!0 lt!406210 lt!406210) e!185223)))

(declare-fun b!265210 () Bool)

(declare-fun res!221665 () Bool)

(assert (=> b!265210 (=> (not res!221665) (not e!185223))))

(assert (=> b!265210 (= res!221665 (bvsle (bitIndex!0 (size!6442 (buf!6910 lt!406210)) (currentByte!12789 lt!406210) (currentBit!12784 lt!406210)) (bitIndex!0 (size!6442 (buf!6910 lt!406210)) (currentByte!12789 lt!406210) (currentBit!12784 lt!406210))))))

(declare-fun b!265211 () Bool)

(declare-fun e!185222 () Bool)

(assert (=> b!265211 (= e!185223 e!185222)))

(declare-fun res!221666 () Bool)

(assert (=> b!265211 (=> res!221666 e!185222)))

(assert (=> b!265211 (= res!221666 (= (size!6442 (buf!6910 lt!406210)) #b00000000000000000000000000000000))))

(declare-fun b!265212 () Bool)

(assert (=> b!265212 (= e!185222 (arrayBitRangesEq!0 (buf!6910 lt!406210) (buf!6910 lt!406210) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6442 (buf!6910 lt!406210)) (currentByte!12789 lt!406210) (currentBit!12784 lt!406210))))))

(assert (= (and d!89536 res!221664) b!265210))

(assert (= (and b!265210 res!221665) b!265211))

(assert (= (and b!265211 (not res!221666)) b!265212))

(declare-fun m!395885 () Bool)

(assert (=> b!265210 m!395885))

(assert (=> b!265210 m!395885))

(assert (=> b!265212 m!395885))

(assert (=> b!265212 m!395885))

(declare-fun m!395887 () Bool)

(assert (=> b!265212 m!395887))

(assert (=> b!265064 d!89536))

(declare-fun d!89544 () Bool)

(assert (=> d!89544 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406324 () Unit!18857)

(assert (=> d!89544 (= lt!406324 (choose!11 w1!584))))

(assert (=> d!89544 (= (lemmaIsPrefixRefl!0 w1!584) lt!406324)))

(declare-fun bs!22723 () Bool)

(assert (= bs!22723 d!89544))

(assert (=> bs!22723 m!395717))

(declare-fun m!395889 () Bool)

(assert (=> bs!22723 m!395889))

(assert (=> b!265064 d!89544))

(declare-fun d!89546 () Bool)

(assert (=> d!89546 (isPrefixOf!0 lt!406210 lt!406210)))

(declare-fun lt!406325 () Unit!18857)

(assert (=> d!89546 (= lt!406325 (choose!11 lt!406210))))

(assert (=> d!89546 (= (lemmaIsPrefixRefl!0 lt!406210) lt!406325)))

(declare-fun bs!22724 () Bool)

(assert (= bs!22724 d!89546))

(assert (=> bs!22724 m!395715))

(declare-fun m!395893 () Bool)

(assert (=> bs!22724 m!395893))

(assert (=> b!265064 d!89546))

(declare-fun d!89550 () Bool)

(declare-fun res!221673 () Bool)

(declare-fun e!185229 () Bool)

(assert (=> d!89550 (=> (not res!221673) (not e!185229))))

(assert (=> d!89550 (= res!221673 (= (size!6442 (buf!6910 w1!584)) (size!6442 (buf!6910 w1!584))))))

(assert (=> d!89550 (= (isPrefixOf!0 w1!584 w1!584) e!185229)))

(declare-fun b!265219 () Bool)

(declare-fun res!221674 () Bool)

(assert (=> b!265219 (=> (not res!221674) (not e!185229))))

(assert (=> b!265219 (= res!221674 (bvsle (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584)) (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584))))))

(declare-fun b!265220 () Bool)

(declare-fun e!185228 () Bool)

(assert (=> b!265220 (= e!185229 e!185228)))

(declare-fun res!221675 () Bool)

(assert (=> b!265220 (=> res!221675 e!185228)))

(assert (=> b!265220 (= res!221675 (= (size!6442 (buf!6910 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265221 () Bool)

(assert (=> b!265221 (= e!185228 (arrayBitRangesEq!0 (buf!6910 w1!584) (buf!6910 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6442 (buf!6910 w1!584)) (currentByte!12789 w1!584) (currentBit!12784 w1!584))))))

(assert (= (and d!89550 res!221673) b!265219))

(assert (= (and b!265219 res!221674) b!265220))

(assert (= (and b!265220 (not res!221675)) b!265221))

(assert (=> b!265219 m!395723))

(assert (=> b!265219 m!395723))

(assert (=> b!265221 m!395723))

(assert (=> b!265221 m!395723))

(declare-fun m!395897 () Bool)

(assert (=> b!265221 m!395897))

(assert (=> b!265064 d!89550))

(declare-fun d!89552 () Bool)

(declare-fun res!221678 () Bool)

(declare-fun e!185232 () Bool)

(assert (=> d!89552 (=> (not res!221678) (not e!185232))))

(assert (=> d!89552 (= res!221678 (= (size!6442 (buf!6910 w2!580)) (size!6442 (buf!6910 w2!580))))))

(assert (=> d!89552 (= (isPrefixOf!0 w2!580 w2!580) e!185232)))

(declare-fun b!265224 () Bool)

(declare-fun res!221679 () Bool)

(assert (=> b!265224 (=> (not res!221679) (not e!185232))))

(assert (=> b!265224 (= res!221679 (bvsle (bitIndex!0 (size!6442 (buf!6910 w2!580)) (currentByte!12789 w2!580) (currentBit!12784 w2!580)) (bitIndex!0 (size!6442 (buf!6910 w2!580)) (currentByte!12789 w2!580) (currentBit!12784 w2!580))))))

(declare-fun b!265225 () Bool)

(declare-fun e!185231 () Bool)

(assert (=> b!265225 (= e!185232 e!185231)))

(declare-fun res!221680 () Bool)

(assert (=> b!265225 (=> res!221680 e!185231)))

(assert (=> b!265225 (= res!221680 (= (size!6442 (buf!6910 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!265226 () Bool)

(assert (=> b!265226 (= e!185231 (arrayBitRangesEq!0 (buf!6910 w2!580) (buf!6910 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6442 (buf!6910 w2!580)) (currentByte!12789 w2!580) (currentBit!12784 w2!580))))))

(assert (= (and d!89552 res!221678) b!265224))

(assert (= (and b!265224 res!221679) b!265225))

(assert (= (and b!265225 (not res!221680)) b!265226))

(assert (=> b!265224 m!395795))

(assert (=> b!265224 m!395795))

(assert (=> b!265226 m!395795))

(assert (=> b!265226 m!395795))

(declare-fun m!395901 () Bool)

(assert (=> b!265226 m!395901))

(assert (=> b!265064 d!89552))

(push 1)

(assert (not b!265221))

(assert (not d!89496))

(assert (not b!265170))

(assert (not bm!4118))

(assert (not d!89532))

(assert (not b!265212))

(assert (not d!89546))

(assert (not d!89544))

(assert (not b!265219))

(assert (not b!265226))

(assert (not b!265224))

(assert (not d!89526))

(assert (not b!265169))

(assert (not b!265210))

(assert (not b!265109))

(assert (not d!89490))

(assert (not b!265107))

(assert (not b!265167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

