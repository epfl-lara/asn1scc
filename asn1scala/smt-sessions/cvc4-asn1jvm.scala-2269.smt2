; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57418 () Bool)

(assert start!57418)

(declare-fun b!263222 () Bool)

(declare-fun e!183482 () Bool)

(declare-fun e!183481 () Bool)

(assert (=> b!263222 (= e!183482 e!183481)))

(declare-fun res!220205 () Bool)

(assert (=> b!263222 (=> res!220205 e!183481)))

(declare-datatypes ((array!14694 0))(
  ( (array!14695 (arr!7401 (Array (_ BitVec 32) (_ BitVec 8))) (size!6414 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11642 0))(
  ( (BitStream!11643 (buf!6882 array!14694) (currentByte!12734 (_ BitVec 32)) (currentBit!12729 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11642)

(assert (=> b!263222 (= res!220205 (= (size!6414 (buf!6882 w1!584)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18773 0))(
  ( (Unit!18774) )
))
(declare-fun lt!404741 () Unit!18773)

(declare-fun e!183476 () Unit!18773)

(assert (=> b!263222 (= lt!404741 e!183476)))

(declare-fun c!12012 () Bool)

(assert (=> b!263222 (= c!12012 (not (= (size!6414 (buf!6882 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263223 () Bool)

(declare-fun lt!404736 () Unit!18773)

(assert (=> b!263223 (= e!183476 lt!404736)))

(declare-fun lt!404738 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263223 (= lt!404738 (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584)))))

(declare-fun w2!580 () BitStream!11642)

(declare-fun arrayBitRangesEqSymmetric!0 (array!14694 array!14694 (_ BitVec 64) (_ BitVec 64)) Unit!18773)

(assert (=> b!263223 (= lt!404736 (arrayBitRangesEqSymmetric!0 (buf!6882 w1!584) (buf!6882 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404738))))

(declare-fun arrayBitRangesEq!0 (array!14694 array!14694 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!263223 (arrayBitRangesEq!0 (buf!6882 w2!580) (buf!6882 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404738)))

(declare-fun b!263224 () Bool)

(declare-fun e!183480 () Bool)

(assert (=> b!263224 (= e!183480 (not (arrayBitRangesEq!0 (buf!6882 w1!584) (buf!6882 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584)))))))

(declare-fun b!263225 () Bool)

(declare-fun e!183478 () Bool)

(assert (=> b!263225 (= e!183478 (not e!183482))))

(declare-fun res!220206 () Bool)

(assert (=> b!263225 (=> res!220206 e!183482)))

(assert (=> b!263225 (= res!220206 e!183480)))

(declare-fun res!220204 () Bool)

(assert (=> b!263225 (=> (not res!220204) (not e!183480))))

(assert (=> b!263225 (= res!220204 (not (= (size!6414 (buf!6882 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11642 BitStream!11642) Bool)

(assert (=> b!263225 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404740 () Unit!18773)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11642) Unit!18773)

(assert (=> b!263225 (= lt!404740 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404735 () BitStream!11642)

(assert (=> b!263225 (isPrefixOf!0 lt!404735 lt!404735)))

(declare-fun lt!404739 () Unit!18773)

(assert (=> b!263225 (= lt!404739 (lemmaIsPrefixRefl!0 lt!404735))))

(assert (=> b!263225 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404737 () Unit!18773)

(assert (=> b!263225 (= lt!404737 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263225 (= lt!404735 (BitStream!11643 (buf!6882 w2!580) (currentByte!12734 w1!584) (currentBit!12729 w1!584)))))

(declare-fun b!263226 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263226 (= e!183481 (invariant!0 (currentBit!12729 w1!584) (currentByte!12734 w1!584) (size!6414 (buf!6882 w1!584))))))

(declare-fun res!220207 () Bool)

(assert (=> start!57418 (=> (not res!220207) (not e!183478))))

(assert (=> start!57418 (= res!220207 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57418 e!183478))

(declare-fun e!183477 () Bool)

(declare-fun inv!12 (BitStream!11642) Bool)

(assert (=> start!57418 (and (inv!12 w1!584) e!183477)))

(declare-fun e!183479 () Bool)

(assert (=> start!57418 (and (inv!12 w2!580) e!183479)))

(declare-fun b!263221 () Bool)

(declare-fun array_inv!6138 (array!14694) Bool)

(assert (=> b!263221 (= e!183479 (array_inv!6138 (buf!6882 w2!580)))))

(declare-fun b!263227 () Bool)

(assert (=> b!263227 (= e!183477 (array_inv!6138 (buf!6882 w1!584)))))

(declare-fun b!263228 () Bool)

(declare-fun Unit!18775 () Unit!18773)

(assert (=> b!263228 (= e!183476 Unit!18775)))

(assert (= (and start!57418 res!220207) b!263225))

(assert (= (and b!263225 res!220204) b!263224))

(assert (= (and b!263225 (not res!220206)) b!263222))

(assert (= (and b!263222 c!12012) b!263223))

(assert (= (and b!263222 (not c!12012)) b!263228))

(assert (= (and b!263222 (not res!220205)) b!263226))

(assert (= start!57418 b!263227))

(assert (= start!57418 b!263221))

(declare-fun m!393495 () Bool)

(assert (=> b!263226 m!393495))

(declare-fun m!393497 () Bool)

(assert (=> b!263221 m!393497))

(declare-fun m!393499 () Bool)

(assert (=> b!263225 m!393499))

(declare-fun m!393501 () Bool)

(assert (=> b!263225 m!393501))

(declare-fun m!393503 () Bool)

(assert (=> b!263225 m!393503))

(declare-fun m!393505 () Bool)

(assert (=> b!263225 m!393505))

(declare-fun m!393507 () Bool)

(assert (=> b!263225 m!393507))

(declare-fun m!393509 () Bool)

(assert (=> b!263225 m!393509))

(declare-fun m!393511 () Bool)

(assert (=> start!57418 m!393511))

(declare-fun m!393513 () Bool)

(assert (=> start!57418 m!393513))

(declare-fun m!393515 () Bool)

(assert (=> start!57418 m!393515))

(declare-fun m!393517 () Bool)

(assert (=> b!263227 m!393517))

(declare-fun m!393519 () Bool)

(assert (=> b!263223 m!393519))

(declare-fun m!393521 () Bool)

(assert (=> b!263223 m!393521))

(declare-fun m!393523 () Bool)

(assert (=> b!263223 m!393523))

(assert (=> b!263224 m!393519))

(assert (=> b!263224 m!393519))

(declare-fun m!393525 () Bool)

(assert (=> b!263224 m!393525))

(push 1)

(assert (not b!263221))

(assert (not start!57418))

(assert (not b!263226))

(assert (not b!263227))

(assert (not b!263224))

(assert (not b!263225))

(assert (not b!263223))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!263261 () Bool)

(declare-fun e!183511 () Bool)

(declare-fun call!4037 () Bool)

(assert (=> b!263261 (= e!183511 call!4037)))

(declare-fun lt!404755 () (_ BitVec 32))

(declare-fun bm!4034 () Bool)

(declare-datatypes ((tuple4!324 0))(
  ( (tuple4!325 (_1!12142 (_ BitVec 32)) (_2!12142 (_ BitVec 32)) (_3!942 (_ BitVec 32)) (_4!162 (_ BitVec 32))) )
))
(declare-fun lt!404754 () tuple4!324)

(declare-fun c!12015 () Bool)

(declare-fun lt!404753 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4034 (= call!4037 (byteRangesEq!0 (select (arr!7401 (buf!6882 w1!584)) (_3!942 lt!404754)) (select (arr!7401 (buf!6882 w2!580)) (_3!942 lt!404754)) lt!404753 (ite c!12015 lt!404755 #b00000000000000000000000000001000)))))

(declare-fun b!263262 () Bool)

(declare-fun res!220239 () Bool)

(assert (=> b!263262 (= res!220239 (= lt!404755 #b00000000000000000000000000000000))))

(declare-fun e!183508 () Bool)

(assert (=> b!263262 (=> res!220239 e!183508)))

(declare-fun e!183512 () Bool)

(assert (=> b!263262 (= e!183512 e!183508)))

(declare-fun b!263263 () Bool)

(declare-fun e!183510 () Bool)

(assert (=> b!263263 (= e!183510 e!183511)))

(assert (=> b!263263 (= c!12015 (= (_3!942 lt!404754) (_4!162 lt!404754)))))

(declare-fun d!88796 () Bool)

(declare-fun res!220238 () Bool)

(declare-fun e!183509 () Bool)

(assert (=> d!88796 (=> res!220238 e!183509)))

(assert (=> d!88796 (= res!220238 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584))))))

(assert (=> d!88796 (= (arrayBitRangesEq!0 (buf!6882 w1!584) (buf!6882 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584))) e!183509)))

(declare-fun b!263264 () Bool)

(assert (=> b!263264 (= e!183511 e!183512)))

(declare-fun res!220236 () Bool)

(assert (=> b!263264 (= res!220236 call!4037)))

(assert (=> b!263264 (=> (not res!220236) (not e!183512))))

(declare-fun e!183513 () Bool)

(declare-fun b!263265 () Bool)

(declare-fun arrayRangesEq!999 (array!14694 array!14694 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263265 (= e!183513 (arrayRangesEq!999 (buf!6882 w1!584) (buf!6882 w2!580) (_1!12142 lt!404754) (_2!12142 lt!404754)))))

(declare-fun b!263266 () Bool)

(assert (=> b!263266 (= e!183508 (byteRangesEq!0 (select (arr!7401 (buf!6882 w1!584)) (_4!162 lt!404754)) (select (arr!7401 (buf!6882 w2!580)) (_4!162 lt!404754)) #b00000000000000000000000000000000 lt!404755))))

(declare-fun b!263267 () Bool)

(assert (=> b!263267 (= e!183509 e!183510)))

(declare-fun res!220237 () Bool)

(assert (=> b!263267 (=> (not res!220237) (not e!183510))))

(assert (=> b!263267 (= res!220237 e!183513)))

(declare-fun res!220240 () Bool)

(assert (=> b!263267 (=> res!220240 e!183513)))

(assert (=> b!263267 (= res!220240 (bvsge (_1!12142 lt!404754) (_2!12142 lt!404754)))))

(assert (=> b!263267 (= lt!404755 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263267 (= lt!404753 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!324)

(assert (=> b!263267 (= lt!404754 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584))))))

(assert (= (and d!88796 (not res!220238)) b!263267))

(assert (= (and b!263267 (not res!220240)) b!263265))

(assert (= (and b!263267 res!220237) b!263263))

(assert (= (and b!263263 c!12015) b!263261))

(assert (= (and b!263263 (not c!12015)) b!263264))

(assert (= (and b!263264 res!220236) b!263262))

(assert (= (and b!263262 (not res!220239)) b!263266))

(assert (= (or b!263261 b!263264) bm!4034))

(declare-fun m!393545 () Bool)

(assert (=> bm!4034 m!393545))

(declare-fun m!393547 () Bool)

(assert (=> bm!4034 m!393547))

(assert (=> bm!4034 m!393545))

(assert (=> bm!4034 m!393547))

(declare-fun m!393549 () Bool)

(assert (=> bm!4034 m!393549))

(declare-fun m!393551 () Bool)

(assert (=> b!263265 m!393551))

(declare-fun m!393553 () Bool)

(assert (=> b!263266 m!393553))

(declare-fun m!393555 () Bool)

(assert (=> b!263266 m!393555))

(assert (=> b!263266 m!393553))

(assert (=> b!263266 m!393555))

(declare-fun m!393557 () Bool)

(assert (=> b!263266 m!393557))

(assert (=> b!263267 m!393519))

(declare-fun m!393559 () Bool)

(assert (=> b!263267 m!393559))

(assert (=> b!263224 d!88796))

(declare-fun d!88824 () Bool)

(declare-fun e!183546 () Bool)

(assert (=> d!88824 e!183546))

(declare-fun res!220271 () Bool)

(assert (=> d!88824 (=> (not res!220271) (not e!183546))))

(declare-fun lt!404786 () (_ BitVec 64))

(declare-fun lt!404785 () (_ BitVec 64))

(declare-fun lt!404787 () (_ BitVec 64))

(assert (=> d!88824 (= res!220271 (= lt!404785 (bvsub lt!404786 lt!404787)))))

(assert (=> d!88824 (or (= (bvand lt!404786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404786 lt!404787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88824 (= lt!404787 (remainingBits!0 ((_ sign_extend 32) (size!6414 (buf!6882 w1!584))) ((_ sign_extend 32) (currentByte!12734 w1!584)) ((_ sign_extend 32) (currentBit!12729 w1!584))))))

(declare-fun lt!404788 () (_ BitVec 64))

(declare-fun lt!404783 () (_ BitVec 64))

(assert (=> d!88824 (= lt!404786 (bvmul lt!404788 lt!404783))))

(assert (=> d!88824 (or (= lt!404788 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404783 (bvsdiv (bvmul lt!404788 lt!404783) lt!404788)))))

(assert (=> d!88824 (= lt!404783 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88824 (= lt!404788 ((_ sign_extend 32) (size!6414 (buf!6882 w1!584))))))

(assert (=> d!88824 (= lt!404785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12734 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12729 w1!584))))))

(assert (=> d!88824 (invariant!0 (currentBit!12729 w1!584) (currentByte!12734 w1!584) (size!6414 (buf!6882 w1!584)))))

(assert (=> d!88824 (= (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584)) lt!404785)))

(declare-fun b!263307 () Bool)

(declare-fun res!220270 () Bool)

(assert (=> b!263307 (=> (not res!220270) (not e!183546))))

(assert (=> b!263307 (= res!220270 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404785))))

(declare-fun b!263308 () Bool)

(declare-fun lt!404784 () (_ BitVec 64))

(assert (=> b!263308 (= e!183546 (bvsle lt!404785 (bvmul lt!404784 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263308 (or (= lt!404784 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404784 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404784)))))

(assert (=> b!263308 (= lt!404784 ((_ sign_extend 32) (size!6414 (buf!6882 w1!584))))))

(assert (= (and d!88824 res!220271) b!263307))

(assert (= (and b!263307 res!220270) b!263308))

(declare-fun m!393577 () Bool)

(assert (=> d!88824 m!393577))

(assert (=> d!88824 m!393495))

(assert (=> b!263224 d!88824))

(declare-fun d!88828 () Bool)

(assert (=> d!88828 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404804 () Unit!18773)

(declare-fun choose!11 (BitStream!11642) Unit!18773)

(assert (=> d!88828 (= lt!404804 (choose!11 w2!580))))

(assert (=> d!88828 (= (lemmaIsPrefixRefl!0 w2!580) lt!404804)))

(declare-fun bs!22540 () Bool)

(assert (= bs!22540 d!88828))

(assert (=> bs!22540 m!393507))

(declare-fun m!393579 () Bool)

(assert (=> bs!22540 m!393579))

(assert (=> b!263225 d!88828))

(declare-fun d!88830 () Bool)

(declare-fun res!220296 () Bool)

(declare-fun e!183565 () Bool)

(assert (=> d!88830 (=> (not res!220296) (not e!183565))))

(assert (=> d!88830 (= res!220296 (= (size!6414 (buf!6882 lt!404735)) (size!6414 (buf!6882 lt!404735))))))

(assert (=> d!88830 (= (isPrefixOf!0 lt!404735 lt!404735) e!183565)))

(declare-fun b!263334 () Bool)

(declare-fun res!220295 () Bool)

(assert (=> b!263334 (=> (not res!220295) (not e!183565))))

(assert (=> b!263334 (= res!220295 (bvsle (bitIndex!0 (size!6414 (buf!6882 lt!404735)) (currentByte!12734 lt!404735) (currentBit!12729 lt!404735)) (bitIndex!0 (size!6414 (buf!6882 lt!404735)) (currentByte!12734 lt!404735) (currentBit!12729 lt!404735))))))

(declare-fun b!263335 () Bool)

(declare-fun e!183564 () Bool)

(assert (=> b!263335 (= e!183565 e!183564)))

(declare-fun res!220297 () Bool)

(assert (=> b!263335 (=> res!220297 e!183564)))

(assert (=> b!263335 (= res!220297 (= (size!6414 (buf!6882 lt!404735)) #b00000000000000000000000000000000))))

(declare-fun b!263336 () Bool)

(assert (=> b!263336 (= e!183564 (arrayBitRangesEq!0 (buf!6882 lt!404735) (buf!6882 lt!404735) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6414 (buf!6882 lt!404735)) (currentByte!12734 lt!404735) (currentBit!12729 lt!404735))))))

(assert (= (and d!88830 res!220296) b!263334))

(assert (= (and b!263334 res!220295) b!263335))

(assert (= (and b!263335 (not res!220297)) b!263336))

(declare-fun m!393599 () Bool)

(assert (=> b!263334 m!393599))

(assert (=> b!263334 m!393599))

(assert (=> b!263336 m!393599))

(assert (=> b!263336 m!393599))

(declare-fun m!393601 () Bool)

(assert (=> b!263336 m!393601))

(assert (=> b!263225 d!88830))

(declare-fun d!88836 () Bool)

(assert (=> d!88836 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404813 () Unit!18773)

(assert (=> d!88836 (= lt!404813 (choose!11 w1!584))))

(assert (=> d!88836 (= (lemmaIsPrefixRefl!0 w1!584) lt!404813)))

(declare-fun bs!22541 () Bool)

(assert (= bs!22541 d!88836))

(assert (=> bs!22541 m!393505))

(declare-fun m!393603 () Bool)

(assert (=> bs!22541 m!393603))

(assert (=> b!263225 d!88836))

(declare-fun d!88838 () Bool)

(assert (=> d!88838 (isPrefixOf!0 lt!404735 lt!404735)))

(declare-fun lt!404814 () Unit!18773)

(assert (=> d!88838 (= lt!404814 (choose!11 lt!404735))))

(assert (=> d!88838 (= (lemmaIsPrefixRefl!0 lt!404735) lt!404814)))

(declare-fun bs!22542 () Bool)

(assert (= bs!22542 d!88838))

(assert (=> bs!22542 m!393503))

(declare-fun m!393605 () Bool)

(assert (=> bs!22542 m!393605))

(assert (=> b!263225 d!88838))

(declare-fun d!88840 () Bool)

(declare-fun res!220302 () Bool)

(declare-fun e!183569 () Bool)

(assert (=> d!88840 (=> (not res!220302) (not e!183569))))

(assert (=> d!88840 (= res!220302 (= (size!6414 (buf!6882 w1!584)) (size!6414 (buf!6882 w1!584))))))

(assert (=> d!88840 (= (isPrefixOf!0 w1!584 w1!584) e!183569)))

(declare-fun b!263340 () Bool)

(declare-fun res!220301 () Bool)

(assert (=> b!263340 (=> (not res!220301) (not e!183569))))

(assert (=> b!263340 (= res!220301 (bvsle (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584)) (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584))))))

(declare-fun b!263341 () Bool)

(declare-fun e!183568 () Bool)

(assert (=> b!263341 (= e!183569 e!183568)))

(declare-fun res!220303 () Bool)

(assert (=> b!263341 (=> res!220303 e!183568)))

(assert (=> b!263341 (= res!220303 (= (size!6414 (buf!6882 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263342 () Bool)

(assert (=> b!263342 (= e!183568 (arrayBitRangesEq!0 (buf!6882 w1!584) (buf!6882 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584))))))

(assert (= (and d!88840 res!220302) b!263340))

(assert (= (and b!263340 res!220301) b!263341))

(assert (= (and b!263341 (not res!220303)) b!263342))

(assert (=> b!263340 m!393519))

(assert (=> b!263340 m!393519))

(assert (=> b!263342 m!393519))

(assert (=> b!263342 m!393519))

(declare-fun m!393609 () Bool)

(assert (=> b!263342 m!393609))

(assert (=> b!263225 d!88840))

(declare-fun d!88844 () Bool)

(declare-fun res!220305 () Bool)

(declare-fun e!183571 () Bool)

(assert (=> d!88844 (=> (not res!220305) (not e!183571))))

(assert (=> d!88844 (= res!220305 (= (size!6414 (buf!6882 w2!580)) (size!6414 (buf!6882 w2!580))))))

(assert (=> d!88844 (= (isPrefixOf!0 w2!580 w2!580) e!183571)))

(declare-fun b!263343 () Bool)

(declare-fun res!220304 () Bool)

(assert (=> b!263343 (=> (not res!220304) (not e!183571))))

(assert (=> b!263343 (= res!220304 (bvsle (bitIndex!0 (size!6414 (buf!6882 w2!580)) (currentByte!12734 w2!580) (currentBit!12729 w2!580)) (bitIndex!0 (size!6414 (buf!6882 w2!580)) (currentByte!12734 w2!580) (currentBit!12729 w2!580))))))

(declare-fun b!263344 () Bool)

(declare-fun e!183570 () Bool)

(assert (=> b!263344 (= e!183571 e!183570)))

(declare-fun res!220306 () Bool)

(assert (=> b!263344 (=> res!220306 e!183570)))

(assert (=> b!263344 (= res!220306 (= (size!6414 (buf!6882 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!263345 () Bool)

(assert (=> b!263345 (= e!183570 (arrayBitRangesEq!0 (buf!6882 w2!580) (buf!6882 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6414 (buf!6882 w2!580)) (currentByte!12734 w2!580) (currentBit!12729 w2!580))))))

(assert (= (and d!88844 res!220305) b!263343))

(assert (= (and b!263343 res!220304) b!263344))

(assert (= (and b!263344 (not res!220306)) b!263345))

(declare-fun m!393611 () Bool)

(assert (=> b!263343 m!393611))

(assert (=> b!263343 m!393611))

(assert (=> b!263345 m!393611))

(assert (=> b!263345 m!393611))

(declare-fun m!393613 () Bool)

(assert (=> b!263345 m!393613))

(assert (=> b!263225 d!88844))

(declare-fun d!88848 () Bool)

(assert (=> d!88848 (= (invariant!0 (currentBit!12729 w1!584) (currentByte!12734 w1!584) (size!6414 (buf!6882 w1!584))) (and (bvsge (currentBit!12729 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12729 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12734 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12734 w1!584) (size!6414 (buf!6882 w1!584))) (and (= (currentBit!12729 w1!584) #b00000000000000000000000000000000) (= (currentByte!12734 w1!584) (size!6414 (buf!6882 w1!584)))))))))

(assert (=> b!263226 d!88848))

(declare-fun d!88854 () Bool)

(assert (=> d!88854 (= (array_inv!6138 (buf!6882 w2!580)) (bvsge (size!6414 (buf!6882 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!263221 d!88854))

(declare-fun d!88856 () Bool)

(declare-fun res!220308 () Bool)

(declare-fun e!183573 () Bool)

(assert (=> d!88856 (=> (not res!220308) (not e!183573))))

(assert (=> d!88856 (= res!220308 (= (size!6414 (buf!6882 w1!584)) (size!6414 (buf!6882 w2!580))))))

(assert (=> d!88856 (= (isPrefixOf!0 w1!584 w2!580) e!183573)))

(declare-fun b!263346 () Bool)

(declare-fun res!220307 () Bool)

(assert (=> b!263346 (=> (not res!220307) (not e!183573))))

(assert (=> b!263346 (= res!220307 (bvsle (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584)) (bitIndex!0 (size!6414 (buf!6882 w2!580)) (currentByte!12734 w2!580) (currentBit!12729 w2!580))))))

(declare-fun b!263347 () Bool)

(declare-fun e!183572 () Bool)

(assert (=> b!263347 (= e!183573 e!183572)))

(declare-fun res!220309 () Bool)

(assert (=> b!263347 (=> res!220309 e!183572)))

(assert (=> b!263347 (= res!220309 (= (size!6414 (buf!6882 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263348 () Bool)

(assert (=> b!263348 (= e!183572 (arrayBitRangesEq!0 (buf!6882 w1!584) (buf!6882 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6414 (buf!6882 w1!584)) (currentByte!12734 w1!584) (currentBit!12729 w1!584))))))

(assert (= (and d!88856 res!220308) b!263346))

(assert (= (and b!263346 res!220307) b!263347))

(assert (= (and b!263347 (not res!220309)) b!263348))

(assert (=> b!263346 m!393519))

(assert (=> b!263346 m!393611))

(assert (=> b!263348 m!393519))

(assert (=> b!263348 m!393519))

(assert (=> b!263348 m!393525))

(assert (=> start!57418 d!88856))

(declare-fun d!88860 () Bool)

(assert (=> d!88860 (= (inv!12 w1!584) (invariant!0 (currentBit!12729 w1!584) (currentByte!12734 w1!584) (size!6414 (buf!6882 w1!584))))))

(declare-fun bs!22549 () Bool)

(assert (= bs!22549 d!88860))

(assert (=> bs!22549 m!393495))

(assert (=> start!57418 d!88860))

(declare-fun d!88868 () Bool)

(assert (=> d!88868 (= (inv!12 w2!580) (invariant!0 (currentBit!12729 w2!580) (currentByte!12734 w2!580) (size!6414 (buf!6882 w2!580))))))

(declare-fun bs!22550 () Bool)

(assert (= bs!22550 d!88868))

(declare-fun m!393627 () Bool)

(assert (=> bs!22550 m!393627))

(assert (=> start!57418 d!88868))

(declare-fun d!88870 () Bool)

(assert (=> d!88870 (= (array_inv!6138 (buf!6882 w1!584)) (bvsge (size!6414 (buf!6882 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!263227 d!88870))

(assert (=> b!263223 d!88824))

(declare-fun d!88872 () Bool)

(assert (=> d!88872 (arrayBitRangesEq!0 (buf!6882 w2!580) (buf!6882 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404738)))

(declare-fun lt!404840 () Unit!18773)

(declare-fun choose!8 (array!14694 array!14694 (_ BitVec 64) (_ BitVec 64)) Unit!18773)

(assert (=> d!88872 (= lt!404840 (choose!8 (buf!6882 w1!584) (buf!6882 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404738))))

(assert (=> d!88872 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404738))))

(assert (=> d!88872 (= (arrayBitRangesEqSymmetric!0 (buf!6882 w1!584) (buf!6882 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404738) lt!404840)))

(declare-fun bs!22551 () Bool)

(assert (= bs!22551 d!88872))

(assert (=> bs!22551 m!393523))

(declare-fun m!393635 () Bool)

(assert (=> bs!22551 m!393635))

(assert (=> b!263223 d!88872))

(declare-fun b!263364 () Bool)

(declare-fun e!183586 () Bool)

(declare-fun call!4044 () Bool)

(assert (=> b!263364 (= e!183586 call!4044)))

(declare-fun c!12022 () Bool)

(declare-fun lt!404842 () tuple4!324)

(declare-fun lt!404841 () (_ BitVec 32))

(declare-fun bm!4041 () Bool)

(declare-fun lt!404843 () (_ BitVec 32))

(assert (=> bm!4041 (= call!4044 (byteRangesEq!0 (select (arr!7401 (buf!6882 w2!580)) (_3!942 lt!404842)) (select (arr!7401 (buf!6882 w1!584)) (_3!942 lt!404842)) lt!404841 (ite c!12022 lt!404843 #b00000000000000000000000000001000)))))

(declare-fun b!263365 () Bool)

(declare-fun res!220328 () Bool)

(assert (=> b!263365 (= res!220328 (= lt!404843 #b00000000000000000000000000000000))))

(declare-fun e!183583 () Bool)

(assert (=> b!263365 (=> res!220328 e!183583)))

(declare-fun e!183587 () Bool)

(assert (=> b!263365 (= e!183587 e!183583)))

(declare-fun b!263366 () Bool)

(declare-fun e!183585 () Bool)

(assert (=> b!263366 (= e!183585 e!183586)))

(assert (=> b!263366 (= c!12022 (= (_3!942 lt!404842) (_4!162 lt!404842)))))

(declare-fun d!88884 () Bool)

(declare-fun res!220327 () Bool)

(declare-fun e!183584 () Bool)

(assert (=> d!88884 (=> res!220327 e!183584)))

(assert (=> d!88884 (= res!220327 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!404738))))

(assert (=> d!88884 (= (arrayBitRangesEq!0 (buf!6882 w2!580) (buf!6882 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404738) e!183584)))

(declare-fun b!263367 () Bool)

(assert (=> b!263367 (= e!183586 e!183587)))

(declare-fun res!220325 () Bool)

(assert (=> b!263367 (= res!220325 call!4044)))

(assert (=> b!263367 (=> (not res!220325) (not e!183587))))

(declare-fun b!263368 () Bool)

(declare-fun e!183588 () Bool)

(assert (=> b!263368 (= e!183588 (arrayRangesEq!999 (buf!6882 w2!580) (buf!6882 w1!584) (_1!12142 lt!404842) (_2!12142 lt!404842)))))

(declare-fun b!263369 () Bool)

(assert (=> b!263369 (= e!183583 (byteRangesEq!0 (select (arr!7401 (buf!6882 w2!580)) (_4!162 lt!404842)) (select (arr!7401 (buf!6882 w1!584)) (_4!162 lt!404842)) #b00000000000000000000000000000000 lt!404843))))

(declare-fun b!263370 () Bool)

(assert (=> b!263370 (= e!183584 e!183585)))

(declare-fun res!220326 () Bool)

(assert (=> b!263370 (=> (not res!220326) (not e!183585))))

(assert (=> b!263370 (= res!220326 e!183588)))

(declare-fun res!220329 () Bool)

(assert (=> b!263370 (=> res!220329 e!183588)))

(assert (=> b!263370 (= res!220329 (bvsge (_1!12142 lt!404842) (_2!12142 lt!404842)))))

(assert (=> b!263370 (= lt!404843 ((_ extract 31 0) (bvsrem lt!404738 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263370 (= lt!404841 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263370 (= lt!404842 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!404738))))

(assert (= (and d!88884 (not res!220327)) b!263370))

(assert (= (and b!263370 (not res!220329)) b!263368))

(assert (= (and b!263370 res!220326) b!263366))

(assert (= (and b!263366 c!12022) b!263364))

(assert (= (and b!263366 (not c!12022)) b!263367))

(assert (= (and b!263367 res!220325) b!263365))

(assert (= (and b!263365 (not res!220328)) b!263369))

(assert (= (or b!263364 b!263367) bm!4041))

(declare-fun m!393637 () Bool)

(assert (=> bm!4041 m!393637))

(declare-fun m!393639 () Bool)

(assert (=> bm!4041 m!393639))

(assert (=> bm!4041 m!393637))

(assert (=> bm!4041 m!393639))

(declare-fun m!393641 () Bool)

(assert (=> bm!4041 m!393641))

(declare-fun m!393643 () Bool)

(assert (=> b!263368 m!393643))

(declare-fun m!393645 () Bool)

(assert (=> b!263369 m!393645))

(declare-fun m!393647 () Bool)

(assert (=> b!263369 m!393647))

(assert (=> b!263369 m!393645))

(assert (=> b!263369 m!393647))

(declare-fun m!393649 () Bool)

(assert (=> b!263369 m!393649))

(declare-fun m!393651 () Bool)

(assert (=> b!263370 m!393651))

(assert (=> b!263223 d!88884))

(push 1)

