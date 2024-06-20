; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57470 () Bool)

(assert start!57470)

(declare-fun b!263425 () Bool)

(declare-fun e!183646 () Bool)

(declare-fun e!183651 () Bool)

(assert (=> b!263425 (= e!183646 (not e!183651))))

(declare-fun res!220363 () Bool)

(assert (=> b!263425 (=> res!220363 e!183651)))

(declare-fun e!183654 () Bool)

(assert (=> b!263425 (= res!220363 e!183654)))

(declare-fun res!220362 () Bool)

(assert (=> b!263425 (=> (not res!220362) (not e!183654))))

(declare-datatypes ((array!14701 0))(
  ( (array!14702 (arr!7403 (Array (_ BitVec 32) (_ BitVec 8))) (size!6416 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11646 0))(
  ( (BitStream!11647 (buf!6884 array!14701) (currentByte!12742 (_ BitVec 32)) (currentBit!12737 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11646)

(assert (=> b!263425 (= res!220362 (not (= (size!6416 (buf!6884 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11646)

(declare-fun isPrefixOf!0 (BitStream!11646 BitStream!11646) Bool)

(assert (=> b!263425 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18779 0))(
  ( (Unit!18780) )
))
(declare-fun lt!404903 () Unit!18779)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11646) Unit!18779)

(assert (=> b!263425 (= lt!404903 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404899 () BitStream!11646)

(assert (=> b!263425 (isPrefixOf!0 lt!404899 lt!404899)))

(declare-fun lt!404898 () Unit!18779)

(assert (=> b!263425 (= lt!404898 (lemmaIsPrefixRefl!0 lt!404899))))

(assert (=> b!263425 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404897 () Unit!18779)

(assert (=> b!263425 (= lt!404897 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263425 (= lt!404899 (BitStream!11647 (buf!6884 w2!580) (currentByte!12742 w1!584) (currentBit!12737 w1!584)))))

(declare-fun b!263426 () Bool)

(declare-fun e!183652 () Bool)

(declare-fun array_inv!6140 (array!14701) Bool)

(assert (=> b!263426 (= e!183652 (array_inv!6140 (buf!6884 w1!584)))))

(declare-fun b!263427 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14701 array!14701 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263427 (= e!183654 (not (arrayBitRangesEq!0 (buf!6884 w1!584) (buf!6884 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584)))))))

(declare-fun b!263428 () Bool)

(declare-fun e!183653 () Unit!18779)

(declare-fun lt!404896 () Unit!18779)

(assert (=> b!263428 (= e!183653 lt!404896)))

(declare-fun lt!404901 () (_ BitVec 64))

(assert (=> b!263428 (= lt!404901 (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14701 array!14701 (_ BitVec 64) (_ BitVec 64)) Unit!18779)

(assert (=> b!263428 (= lt!404896 (arrayBitRangesEqSymmetric!0 (buf!6884 w1!584) (buf!6884 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404901))))

(assert (=> b!263428 (arrayBitRangesEq!0 (buf!6884 w2!580) (buf!6884 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404901)))

(declare-fun b!263429 () Bool)

(declare-fun Unit!18781 () Unit!18779)

(assert (=> b!263429 (= e!183653 Unit!18781)))

(declare-fun b!263430 () Bool)

(declare-fun e!183648 () Bool)

(assert (=> b!263430 (= e!183648 (array_inv!6140 (buf!6884 w2!580)))))

(declare-fun res!220360 () Bool)

(assert (=> start!57470 (=> (not res!220360) (not e!183646))))

(assert (=> start!57470 (= res!220360 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57470 e!183646))

(declare-fun inv!12 (BitStream!11646) Bool)

(assert (=> start!57470 (and (inv!12 w1!584) e!183652)))

(assert (=> start!57470 (and (inv!12 w2!580) e!183648)))

(declare-fun b!263431 () Bool)

(declare-fun e!183647 () Bool)

(assert (=> b!263431 (= e!183651 e!183647)))

(declare-fun res!220361 () Bool)

(assert (=> b!263431 (=> res!220361 e!183647)))

(assert (=> b!263431 (= res!220361 (= (size!6416 (buf!6884 w1!584)) #b00000000000000000000000000000000))))

(declare-fun lt!404900 () Unit!18779)

(assert (=> b!263431 (= lt!404900 e!183653)))

(declare-fun c!12030 () Bool)

(assert (=> b!263431 (= c!12030 (not (= (size!6416 (buf!6884 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263432 () Bool)

(assert (=> b!263432 (= e!183647 (bvsle (size!6416 (buf!6884 w2!580)) (size!6416 (buf!6884 w1!584))))))

(declare-fun lt!404902 () (_ BitVec 64))

(assert (=> b!263432 (= lt!404902 (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584)))))

(assert (= (and start!57470 res!220360) b!263425))

(assert (= (and b!263425 res!220362) b!263427))

(assert (= (and b!263425 (not res!220363)) b!263431))

(assert (= (and b!263431 c!12030) b!263428))

(assert (= (and b!263431 (not c!12030)) b!263429))

(assert (= (and b!263431 (not res!220361)) b!263432))

(assert (= start!57470 b!263426))

(assert (= start!57470 b!263430))

(declare-fun m!393719 () Bool)

(assert (=> b!263430 m!393719))

(declare-fun m!393721 () Bool)

(assert (=> b!263428 m!393721))

(declare-fun m!393723 () Bool)

(assert (=> b!263428 m!393723))

(declare-fun m!393725 () Bool)

(assert (=> b!263428 m!393725))

(declare-fun m!393727 () Bool)

(assert (=> b!263426 m!393727))

(assert (=> b!263427 m!393721))

(assert (=> b!263427 m!393721))

(declare-fun m!393729 () Bool)

(assert (=> b!263427 m!393729))

(assert (=> b!263432 m!393721))

(declare-fun m!393731 () Bool)

(assert (=> start!57470 m!393731))

(declare-fun m!393733 () Bool)

(assert (=> start!57470 m!393733))

(declare-fun m!393735 () Bool)

(assert (=> start!57470 m!393735))

(declare-fun m!393737 () Bool)

(assert (=> b!263425 m!393737))

(declare-fun m!393739 () Bool)

(assert (=> b!263425 m!393739))

(declare-fun m!393741 () Bool)

(assert (=> b!263425 m!393741))

(declare-fun m!393743 () Bool)

(assert (=> b!263425 m!393743))

(declare-fun m!393745 () Bool)

(assert (=> b!263425 m!393745))

(declare-fun m!393747 () Bool)

(assert (=> b!263425 m!393747))

(check-sat (not b!263427) (not b!263430) (not b!263425) (not b!263432) (not b!263426) (not b!263428) (not start!57470))
(check-sat)
(get-model)

(declare-fun d!88898 () Bool)

(assert (=> d!88898 (= (array_inv!6140 (buf!6884 w2!580)) (bvsge (size!6416 (buf!6884 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!263430 d!88898))

(declare-fun d!88900 () Bool)

(assert (=> d!88900 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404933 () Unit!18779)

(declare-fun choose!11 (BitStream!11646) Unit!18779)

(assert (=> d!88900 (= lt!404933 (choose!11 w1!584))))

(assert (=> d!88900 (= (lemmaIsPrefixRefl!0 w1!584) lt!404933)))

(declare-fun bs!22560 () Bool)

(assert (= bs!22560 d!88900))

(assert (=> bs!22560 m!393741))

(declare-fun m!393781 () Bool)

(assert (=> bs!22560 m!393781))

(assert (=> b!263425 d!88900))

(declare-fun d!88904 () Bool)

(declare-fun res!220405 () Bool)

(declare-fun e!183701 () Bool)

(assert (=> d!88904 (=> (not res!220405) (not e!183701))))

(assert (=> d!88904 (= res!220405 (= (size!6416 (buf!6884 lt!404899)) (size!6416 (buf!6884 lt!404899))))))

(assert (=> d!88904 (= (isPrefixOf!0 lt!404899 lt!404899) e!183701)))

(declare-fun b!263485 () Bool)

(declare-fun res!220406 () Bool)

(assert (=> b!263485 (=> (not res!220406) (not e!183701))))

(assert (=> b!263485 (= res!220406 (bvsle (bitIndex!0 (size!6416 (buf!6884 lt!404899)) (currentByte!12742 lt!404899) (currentBit!12737 lt!404899)) (bitIndex!0 (size!6416 (buf!6884 lt!404899)) (currentByte!12742 lt!404899) (currentBit!12737 lt!404899))))))

(declare-fun b!263486 () Bool)

(declare-fun e!183700 () Bool)

(assert (=> b!263486 (= e!183701 e!183700)))

(declare-fun res!220404 () Bool)

(assert (=> b!263486 (=> res!220404 e!183700)))

(assert (=> b!263486 (= res!220404 (= (size!6416 (buf!6884 lt!404899)) #b00000000000000000000000000000000))))

(declare-fun b!263487 () Bool)

(assert (=> b!263487 (= e!183700 (arrayBitRangesEq!0 (buf!6884 lt!404899) (buf!6884 lt!404899) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6416 (buf!6884 lt!404899)) (currentByte!12742 lt!404899) (currentBit!12737 lt!404899))))))

(assert (= (and d!88904 res!220405) b!263485))

(assert (= (and b!263485 res!220406) b!263486))

(assert (= (and b!263486 (not res!220404)) b!263487))

(declare-fun m!393797 () Bool)

(assert (=> b!263485 m!393797))

(assert (=> b!263485 m!393797))

(assert (=> b!263487 m!393797))

(assert (=> b!263487 m!393797))

(declare-fun m!393799 () Bool)

(assert (=> b!263487 m!393799))

(assert (=> b!263425 d!88904))

(declare-fun d!88918 () Bool)

(assert (=> d!88918 (isPrefixOf!0 lt!404899 lt!404899)))

(declare-fun lt!404948 () Unit!18779)

(assert (=> d!88918 (= lt!404948 (choose!11 lt!404899))))

(assert (=> d!88918 (= (lemmaIsPrefixRefl!0 lt!404899) lt!404948)))

(declare-fun bs!22563 () Bool)

(assert (= bs!22563 d!88918))

(assert (=> bs!22563 m!393739))

(declare-fun m!393801 () Bool)

(assert (=> bs!22563 m!393801))

(assert (=> b!263425 d!88918))

(declare-fun d!88920 () Bool)

(assert (=> d!88920 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404949 () Unit!18779)

(assert (=> d!88920 (= lt!404949 (choose!11 w2!580))))

(assert (=> d!88920 (= (lemmaIsPrefixRefl!0 w2!580) lt!404949)))

(declare-fun bs!22564 () Bool)

(assert (= bs!22564 d!88920))

(assert (=> bs!22564 m!393743))

(declare-fun m!393803 () Bool)

(assert (=> bs!22564 m!393803))

(assert (=> b!263425 d!88920))

(declare-fun d!88922 () Bool)

(declare-fun res!220408 () Bool)

(declare-fun e!183703 () Bool)

(assert (=> d!88922 (=> (not res!220408) (not e!183703))))

(assert (=> d!88922 (= res!220408 (= (size!6416 (buf!6884 w1!584)) (size!6416 (buf!6884 w1!584))))))

(assert (=> d!88922 (= (isPrefixOf!0 w1!584 w1!584) e!183703)))

(declare-fun b!263488 () Bool)

(declare-fun res!220409 () Bool)

(assert (=> b!263488 (=> (not res!220409) (not e!183703))))

(assert (=> b!263488 (= res!220409 (bvsle (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584)) (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584))))))

(declare-fun b!263489 () Bool)

(declare-fun e!183702 () Bool)

(assert (=> b!263489 (= e!183703 e!183702)))

(declare-fun res!220407 () Bool)

(assert (=> b!263489 (=> res!220407 e!183702)))

(assert (=> b!263489 (= res!220407 (= (size!6416 (buf!6884 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263490 () Bool)

(assert (=> b!263490 (= e!183702 (arrayBitRangesEq!0 (buf!6884 w1!584) (buf!6884 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584))))))

(assert (= (and d!88922 res!220408) b!263488))

(assert (= (and b!263488 res!220409) b!263489))

(assert (= (and b!263489 (not res!220407)) b!263490))

(assert (=> b!263488 m!393721))

(assert (=> b!263488 m!393721))

(assert (=> b!263490 m!393721))

(assert (=> b!263490 m!393721))

(declare-fun m!393807 () Bool)

(assert (=> b!263490 m!393807))

(assert (=> b!263425 d!88922))

(declare-fun d!88926 () Bool)

(declare-fun res!220413 () Bool)

(declare-fun e!183706 () Bool)

(assert (=> d!88926 (=> (not res!220413) (not e!183706))))

(assert (=> d!88926 (= res!220413 (= (size!6416 (buf!6884 w2!580)) (size!6416 (buf!6884 w2!580))))))

(assert (=> d!88926 (= (isPrefixOf!0 w2!580 w2!580) e!183706)))

(declare-fun b!263493 () Bool)

(declare-fun res!220414 () Bool)

(assert (=> b!263493 (=> (not res!220414) (not e!183706))))

(assert (=> b!263493 (= res!220414 (bvsle (bitIndex!0 (size!6416 (buf!6884 w2!580)) (currentByte!12742 w2!580) (currentBit!12737 w2!580)) (bitIndex!0 (size!6416 (buf!6884 w2!580)) (currentByte!12742 w2!580) (currentBit!12737 w2!580))))))

(declare-fun b!263494 () Bool)

(declare-fun e!183705 () Bool)

(assert (=> b!263494 (= e!183706 e!183705)))

(declare-fun res!220412 () Bool)

(assert (=> b!263494 (=> res!220412 e!183705)))

(assert (=> b!263494 (= res!220412 (= (size!6416 (buf!6884 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!263495 () Bool)

(assert (=> b!263495 (= e!183705 (arrayBitRangesEq!0 (buf!6884 w2!580) (buf!6884 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6416 (buf!6884 w2!580)) (currentByte!12742 w2!580) (currentBit!12737 w2!580))))))

(assert (= (and d!88926 res!220413) b!263493))

(assert (= (and b!263493 res!220414) b!263494))

(assert (= (and b!263494 (not res!220412)) b!263495))

(declare-fun m!393815 () Bool)

(assert (=> b!263493 m!393815))

(assert (=> b!263493 m!393815))

(assert (=> b!263495 m!393815))

(assert (=> b!263495 m!393815))

(declare-fun m!393817 () Bool)

(assert (=> b!263495 m!393817))

(assert (=> b!263425 d!88926))

(declare-fun d!88932 () Bool)

(assert (=> d!88932 (= (array_inv!6140 (buf!6884 w1!584)) (bvsge (size!6416 (buf!6884 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!263426 d!88932))

(declare-fun d!88934 () Bool)

(declare-fun e!183709 () Bool)

(assert (=> d!88934 e!183709))

(declare-fun res!220420 () Bool)

(assert (=> d!88934 (=> (not res!220420) (not e!183709))))

(declare-fun lt!404973 () (_ BitVec 64))

(declare-fun lt!404971 () (_ BitVec 64))

(declare-fun lt!404976 () (_ BitVec 64))

(assert (=> d!88934 (= res!220420 (= lt!404976 (bvsub lt!404973 lt!404971)))))

(assert (=> d!88934 (or (= (bvand lt!404973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404971 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404973 lt!404971) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88934 (= lt!404971 (remainingBits!0 ((_ sign_extend 32) (size!6416 (buf!6884 w1!584))) ((_ sign_extend 32) (currentByte!12742 w1!584)) ((_ sign_extend 32) (currentBit!12737 w1!584))))))

(declare-fun lt!404972 () (_ BitVec 64))

(declare-fun lt!404974 () (_ BitVec 64))

(assert (=> d!88934 (= lt!404973 (bvmul lt!404972 lt!404974))))

(assert (=> d!88934 (or (= lt!404972 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404974 (bvsdiv (bvmul lt!404972 lt!404974) lt!404972)))))

(assert (=> d!88934 (= lt!404974 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88934 (= lt!404972 ((_ sign_extend 32) (size!6416 (buf!6884 w1!584))))))

(assert (=> d!88934 (= lt!404976 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12742 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12737 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88934 (invariant!0 (currentBit!12737 w1!584) (currentByte!12742 w1!584) (size!6416 (buf!6884 w1!584)))))

(assert (=> d!88934 (= (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584)) lt!404976)))

(declare-fun b!263500 () Bool)

(declare-fun res!220419 () Bool)

(assert (=> b!263500 (=> (not res!220419) (not e!183709))))

(assert (=> b!263500 (= res!220419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404976))))

(declare-fun b!263501 () Bool)

(declare-fun lt!404975 () (_ BitVec 64))

(assert (=> b!263501 (= e!183709 (bvsle lt!404976 (bvmul lt!404975 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263501 (or (= lt!404975 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404975 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404975)))))

(assert (=> b!263501 (= lt!404975 ((_ sign_extend 32) (size!6416 (buf!6884 w1!584))))))

(assert (= (and d!88934 res!220420) b!263500))

(assert (= (and b!263500 res!220419) b!263501))

(declare-fun m!393821 () Bool)

(assert (=> d!88934 m!393821))

(declare-fun m!393823 () Bool)

(assert (=> d!88934 m!393823))

(assert (=> b!263432 d!88934))

(declare-fun b!263564 () Bool)

(declare-fun e!183766 () Bool)

(declare-fun e!183764 () Bool)

(assert (=> b!263564 (= e!183766 e!183764)))

(declare-datatypes ((tuple4!332 0))(
  ( (tuple4!333 (_1!12146 (_ BitVec 32)) (_2!12146 (_ BitVec 32)) (_3!946 (_ BitVec 32)) (_4!166 (_ BitVec 32))) )
))
(declare-fun lt!405003 () tuple4!332)

(declare-fun lt!405001 () (_ BitVec 32))

(declare-fun res!220468 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263564 (= res!220468 (byteRangesEq!0 (select (arr!7403 (buf!6884 w1!584)) (_3!946 lt!405003)) (select (arr!7403 (buf!6884 w2!580)) (_3!946 lt!405003)) lt!405001 #b00000000000000000000000000001000))))

(assert (=> b!263564 (=> (not res!220468) (not e!183764))))

(declare-fun b!263565 () Bool)

(declare-fun e!183765 () Bool)

(declare-fun call!4055 () Bool)

(assert (=> b!263565 (= e!183765 call!4055)))

(declare-fun b!263566 () Bool)

(assert (=> b!263566 (= e!183766 call!4055)))

(declare-fun b!263567 () Bool)

(declare-fun e!183763 () Bool)

(assert (=> b!263567 (= e!183763 e!183766)))

(declare-fun c!12042 () Bool)

(assert (=> b!263567 (= c!12042 (= (_3!946 lt!405003) (_4!166 lt!405003)))))

(declare-fun b!263568 () Bool)

(declare-fun e!183762 () Bool)

(assert (=> b!263568 (= e!183762 e!183763)))

(declare-fun res!220467 () Bool)

(assert (=> b!263568 (=> (not res!220467) (not e!183763))))

(declare-fun e!183767 () Bool)

(assert (=> b!263568 (= res!220467 e!183767)))

(declare-fun res!220469 () Bool)

(assert (=> b!263568 (=> res!220469 e!183767)))

(assert (=> b!263568 (= res!220469 (bvsge (_1!12146 lt!405003) (_2!12146 lt!405003)))))

(declare-fun lt!405002 () (_ BitVec 32))

(assert (=> b!263568 (= lt!405002 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263568 (= lt!405001 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!332)

(assert (=> b!263568 (= lt!405003 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584))))))

(declare-fun d!88938 () Bool)

(declare-fun res!220471 () Bool)

(assert (=> d!88938 (=> res!220471 e!183762)))

(assert (=> d!88938 (= res!220471 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584))))))

(assert (=> d!88938 (= (arrayBitRangesEq!0 (buf!6884 w1!584) (buf!6884 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584))) e!183762)))

(declare-fun bm!4052 () Bool)

(assert (=> bm!4052 (= call!4055 (byteRangesEq!0 (ite c!12042 (select (arr!7403 (buf!6884 w1!584)) (_3!946 lt!405003)) (select (arr!7403 (buf!6884 w1!584)) (_4!166 lt!405003))) (ite c!12042 (select (arr!7403 (buf!6884 w2!580)) (_3!946 lt!405003)) (select (arr!7403 (buf!6884 w2!580)) (_4!166 lt!405003))) (ite c!12042 lt!405001 #b00000000000000000000000000000000) lt!405002))))

(declare-fun b!263569 () Bool)

(declare-fun arrayRangesEq!1002 (array!14701 array!14701 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263569 (= e!183767 (arrayRangesEq!1002 (buf!6884 w1!584) (buf!6884 w2!580) (_1!12146 lt!405003) (_2!12146 lt!405003)))))

(declare-fun b!263570 () Bool)

(declare-fun res!220470 () Bool)

(assert (=> b!263570 (= res!220470 (= lt!405002 #b00000000000000000000000000000000))))

(assert (=> b!263570 (=> res!220470 e!183765)))

(assert (=> b!263570 (= e!183764 e!183765)))

(assert (= (and d!88938 (not res!220471)) b!263568))

(assert (= (and b!263568 (not res!220469)) b!263569))

(assert (= (and b!263568 res!220467) b!263567))

(assert (= (and b!263567 c!12042) b!263566))

(assert (= (and b!263567 (not c!12042)) b!263564))

(assert (= (and b!263564 res!220468) b!263570))

(assert (= (and b!263570 (not res!220470)) b!263565))

(assert (= (or b!263566 b!263565) bm!4052))

(declare-fun m!393857 () Bool)

(assert (=> b!263564 m!393857))

(declare-fun m!393859 () Bool)

(assert (=> b!263564 m!393859))

(assert (=> b!263564 m!393857))

(assert (=> b!263564 m!393859))

(declare-fun m!393861 () Bool)

(assert (=> b!263564 m!393861))

(assert (=> b!263568 m!393721))

(declare-fun m!393863 () Bool)

(assert (=> b!263568 m!393863))

(declare-fun m!393865 () Bool)

(assert (=> bm!4052 m!393865))

(declare-fun m!393867 () Bool)

(assert (=> bm!4052 m!393867))

(assert (=> bm!4052 m!393859))

(assert (=> bm!4052 m!393857))

(declare-fun m!393869 () Bool)

(assert (=> bm!4052 m!393869))

(declare-fun m!393871 () Bool)

(assert (=> b!263569 m!393871))

(assert (=> b!263427 d!88938))

(assert (=> b!263427 d!88934))

(declare-fun d!88946 () Bool)

(declare-fun res!220473 () Bool)

(declare-fun e!183769 () Bool)

(assert (=> d!88946 (=> (not res!220473) (not e!183769))))

(assert (=> d!88946 (= res!220473 (= (size!6416 (buf!6884 w1!584)) (size!6416 (buf!6884 w2!580))))))

(assert (=> d!88946 (= (isPrefixOf!0 w1!584 w2!580) e!183769)))

(declare-fun b!263571 () Bool)

(declare-fun res!220474 () Bool)

(assert (=> b!263571 (=> (not res!220474) (not e!183769))))

(assert (=> b!263571 (= res!220474 (bvsle (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584)) (bitIndex!0 (size!6416 (buf!6884 w2!580)) (currentByte!12742 w2!580) (currentBit!12737 w2!580))))))

(declare-fun b!263572 () Bool)

(declare-fun e!183768 () Bool)

(assert (=> b!263572 (= e!183769 e!183768)))

(declare-fun res!220472 () Bool)

(assert (=> b!263572 (=> res!220472 e!183768)))

(assert (=> b!263572 (= res!220472 (= (size!6416 (buf!6884 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263573 () Bool)

(assert (=> b!263573 (= e!183768 (arrayBitRangesEq!0 (buf!6884 w1!584) (buf!6884 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6416 (buf!6884 w1!584)) (currentByte!12742 w1!584) (currentBit!12737 w1!584))))))

(assert (= (and d!88946 res!220473) b!263571))

(assert (= (and b!263571 res!220474) b!263572))

(assert (= (and b!263572 (not res!220472)) b!263573))

(assert (=> b!263571 m!393721))

(assert (=> b!263571 m!393815))

(assert (=> b!263573 m!393721))

(assert (=> b!263573 m!393721))

(assert (=> b!263573 m!393729))

(assert (=> start!57470 d!88946))

(declare-fun d!88948 () Bool)

(assert (=> d!88948 (= (inv!12 w1!584) (invariant!0 (currentBit!12737 w1!584) (currentByte!12742 w1!584) (size!6416 (buf!6884 w1!584))))))

(declare-fun bs!22568 () Bool)

(assert (= bs!22568 d!88948))

(assert (=> bs!22568 m!393823))

(assert (=> start!57470 d!88948))

(declare-fun d!88952 () Bool)

(assert (=> d!88952 (= (inv!12 w2!580) (invariant!0 (currentBit!12737 w2!580) (currentByte!12742 w2!580) (size!6416 (buf!6884 w2!580))))))

(declare-fun bs!22569 () Bool)

(assert (= bs!22569 d!88952))

(declare-fun m!393875 () Bool)

(assert (=> bs!22569 m!393875))

(assert (=> start!57470 d!88952))

(assert (=> b!263428 d!88934))

(declare-fun d!88954 () Bool)

(assert (=> d!88954 (arrayBitRangesEq!0 (buf!6884 w2!580) (buf!6884 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404901)))

(declare-fun lt!405018 () Unit!18779)

(declare-fun choose!8 (array!14701 array!14701 (_ BitVec 64) (_ BitVec 64)) Unit!18779)

(assert (=> d!88954 (= lt!405018 (choose!8 (buf!6884 w1!584) (buf!6884 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404901))))

(assert (=> d!88954 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404901))))

(assert (=> d!88954 (= (arrayBitRangesEqSymmetric!0 (buf!6884 w1!584) (buf!6884 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404901) lt!405018)))

(declare-fun bs!22572 () Bool)

(assert (= bs!22572 d!88954))

(assert (=> bs!22572 m!393725))

(declare-fun m!393879 () Bool)

(assert (=> bs!22572 m!393879))

(assert (=> b!263428 d!88954))

(declare-fun b!263581 () Bool)

(declare-fun e!183778 () Bool)

(declare-fun e!183776 () Bool)

(assert (=> b!263581 (= e!183778 e!183776)))

(declare-fun lt!405023 () tuple4!332)

(declare-fun res!220483 () Bool)

(declare-fun lt!405021 () (_ BitVec 32))

(assert (=> b!263581 (= res!220483 (byteRangesEq!0 (select (arr!7403 (buf!6884 w2!580)) (_3!946 lt!405023)) (select (arr!7403 (buf!6884 w1!584)) (_3!946 lt!405023)) lt!405021 #b00000000000000000000000000001000))))

(assert (=> b!263581 (=> (not res!220483) (not e!183776))))

(declare-fun b!263582 () Bool)

(declare-fun e!183777 () Bool)

(declare-fun call!4056 () Bool)

(assert (=> b!263582 (= e!183777 call!4056)))

(declare-fun b!263583 () Bool)

(assert (=> b!263583 (= e!183778 call!4056)))

(declare-fun b!263584 () Bool)

(declare-fun e!183775 () Bool)

(assert (=> b!263584 (= e!183775 e!183778)))

(declare-fun c!12043 () Bool)

(assert (=> b!263584 (= c!12043 (= (_3!946 lt!405023) (_4!166 lt!405023)))))

(declare-fun b!263585 () Bool)

(declare-fun e!183774 () Bool)

(assert (=> b!263585 (= e!183774 e!183775)))

(declare-fun res!220482 () Bool)

(assert (=> b!263585 (=> (not res!220482) (not e!183775))))

(declare-fun e!183779 () Bool)

(assert (=> b!263585 (= res!220482 e!183779)))

(declare-fun res!220484 () Bool)

(assert (=> b!263585 (=> res!220484 e!183779)))

(assert (=> b!263585 (= res!220484 (bvsge (_1!12146 lt!405023) (_2!12146 lt!405023)))))

(declare-fun lt!405022 () (_ BitVec 32))

(assert (=> b!263585 (= lt!405022 ((_ extract 31 0) (bvsrem lt!404901 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263585 (= lt!405021 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263585 (= lt!405023 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!404901))))

(declare-fun d!88962 () Bool)

(declare-fun res!220486 () Bool)

(assert (=> d!88962 (=> res!220486 e!183774)))

(assert (=> d!88962 (= res!220486 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!404901))))

(assert (=> d!88962 (= (arrayBitRangesEq!0 (buf!6884 w2!580) (buf!6884 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404901) e!183774)))

(declare-fun bm!4053 () Bool)

(assert (=> bm!4053 (= call!4056 (byteRangesEq!0 (ite c!12043 (select (arr!7403 (buf!6884 w2!580)) (_3!946 lt!405023)) (select (arr!7403 (buf!6884 w2!580)) (_4!166 lt!405023))) (ite c!12043 (select (arr!7403 (buf!6884 w1!584)) (_3!946 lt!405023)) (select (arr!7403 (buf!6884 w1!584)) (_4!166 lt!405023))) (ite c!12043 lt!405021 #b00000000000000000000000000000000) lt!405022))))

(declare-fun b!263586 () Bool)

(assert (=> b!263586 (= e!183779 (arrayRangesEq!1002 (buf!6884 w2!580) (buf!6884 w1!584) (_1!12146 lt!405023) (_2!12146 lt!405023)))))

(declare-fun b!263587 () Bool)

(declare-fun res!220485 () Bool)

(assert (=> b!263587 (= res!220485 (= lt!405022 #b00000000000000000000000000000000))))

(assert (=> b!263587 (=> res!220485 e!183777)))

(assert (=> b!263587 (= e!183776 e!183777)))

(assert (= (and d!88962 (not res!220486)) b!263585))

(assert (= (and b!263585 (not res!220484)) b!263586))

(assert (= (and b!263585 res!220482) b!263584))

(assert (= (and b!263584 c!12043) b!263583))

(assert (= (and b!263584 (not c!12043)) b!263581))

(assert (= (and b!263581 res!220483) b!263587))

(assert (= (and b!263587 (not res!220485)) b!263582))

(assert (= (or b!263583 b!263582) bm!4053))

(declare-fun m!393885 () Bool)

(assert (=> b!263581 m!393885))

(declare-fun m!393887 () Bool)

(assert (=> b!263581 m!393887))

(assert (=> b!263581 m!393885))

(assert (=> b!263581 m!393887))

(declare-fun m!393889 () Bool)

(assert (=> b!263581 m!393889))

(declare-fun m!393891 () Bool)

(assert (=> b!263585 m!393891))

(declare-fun m!393893 () Bool)

(assert (=> bm!4053 m!393893))

(declare-fun m!393895 () Bool)

(assert (=> bm!4053 m!393895))

(assert (=> bm!4053 m!393887))

(assert (=> bm!4053 m!393885))

(declare-fun m!393897 () Bool)

(assert (=> bm!4053 m!393897))

(declare-fun m!393901 () Bool)

(assert (=> b!263586 m!393901))

(assert (=> b!263428 d!88962))

(check-sat (not d!88948) (not bm!4052) (not d!88918) (not b!263488) (not b!263581) (not b!263585) (not b!263573) (not d!88952) (not b!263495) (not b!263493) (not d!88954) (not bm!4053) (not b!263490) (not b!263569) (not b!263586) (not b!263568) (not d!88900) (not b!263487) (not d!88934) (not b!263564) (not b!263571) (not b!263485) (not d!88920))
(check-sat)
