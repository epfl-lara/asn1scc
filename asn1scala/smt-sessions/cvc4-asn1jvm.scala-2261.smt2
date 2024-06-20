; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57238 () Bool)

(assert start!57238)

(declare-fun res!219640 () Bool)

(declare-fun e!182751 () Bool)

(assert (=> start!57238 (=> (not res!219640) (not e!182751))))

(declare-datatypes ((array!14634 0))(
  ( (array!14635 (arr!7377 (Array (_ BitVec 32) (_ BitVec 8))) (size!6390 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11594 0))(
  ( (BitStream!11595 (buf!6858 array!14634) (currentByte!12695 (_ BitVec 32)) (currentBit!12690 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11594)

(declare-fun w2!580 () BitStream!11594)

(declare-fun isPrefixOf!0 (BitStream!11594 BitStream!11594) Bool)

(assert (=> start!57238 (= res!219640 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57238 e!182751))

(declare-fun e!182754 () Bool)

(declare-fun inv!12 (BitStream!11594) Bool)

(assert (=> start!57238 (and (inv!12 w1!584) e!182754)))

(declare-fun e!182753 () Bool)

(assert (=> start!57238 (and (inv!12 w2!580) e!182753)))

(declare-fun b!262478 () Bool)

(declare-fun e!182752 () Bool)

(assert (=> b!262478 (= e!182751 (not e!182752))))

(declare-fun res!219639 () Bool)

(assert (=> b!262478 (=> res!219639 e!182752)))

(assert (=> b!262478 (= res!219639 (= (size!6390 (buf!6858 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262478 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18723 0))(
  ( (Unit!18724) )
))
(declare-fun lt!404123 () Unit!18723)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11594) Unit!18723)

(assert (=> b!262478 (= lt!404123 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404122 () BitStream!11594)

(assert (=> b!262478 (isPrefixOf!0 lt!404122 lt!404122)))

(declare-fun lt!404121 () Unit!18723)

(assert (=> b!262478 (= lt!404121 (lemmaIsPrefixRefl!0 lt!404122))))

(assert (=> b!262478 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404120 () Unit!18723)

(assert (=> b!262478 (= lt!404120 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262478 (= lt!404122 (BitStream!11595 (buf!6858 w2!580) (currentByte!12695 w1!584) (currentBit!12690 w1!584)))))

(declare-fun b!262480 () Bool)

(declare-fun array_inv!6114 (array!14634) Bool)

(assert (=> b!262480 (= e!182754 (array_inv!6114 (buf!6858 w1!584)))))

(declare-fun b!262479 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262479 (= e!182752 (invariant!0 (currentBit!12690 w1!584) (currentByte!12695 w1!584) (size!6390 (buf!6858 w1!584))))))

(declare-fun b!262481 () Bool)

(assert (=> b!262481 (= e!182753 (array_inv!6114 (buf!6858 w2!580)))))

(assert (= (and start!57238 res!219640) b!262478))

(assert (= (and b!262478 (not res!219639)) b!262479))

(assert (= start!57238 b!262480))

(assert (= start!57238 b!262481))

(declare-fun m!392549 () Bool)

(assert (=> start!57238 m!392549))

(declare-fun m!392551 () Bool)

(assert (=> start!57238 m!392551))

(declare-fun m!392553 () Bool)

(assert (=> start!57238 m!392553))

(declare-fun m!392555 () Bool)

(assert (=> b!262478 m!392555))

(declare-fun m!392557 () Bool)

(assert (=> b!262478 m!392557))

(declare-fun m!392559 () Bool)

(assert (=> b!262478 m!392559))

(declare-fun m!392561 () Bool)

(assert (=> b!262478 m!392561))

(declare-fun m!392563 () Bool)

(assert (=> b!262478 m!392563))

(declare-fun m!392565 () Bool)

(assert (=> b!262478 m!392565))

(declare-fun m!392567 () Bool)

(assert (=> b!262480 m!392567))

(declare-fun m!392569 () Bool)

(assert (=> b!262479 m!392569))

(declare-fun m!392571 () Bool)

(assert (=> b!262481 m!392571))

(push 1)

(assert (not b!262478))

(assert (not b!262480))

(assert (not start!57238))

(assert (not b!262481))

(assert (not b!262479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88484 () Bool)

(assert (=> d!88484 (= (array_inv!6114 (buf!6858 w1!584)) (bvsge (size!6390 (buf!6858 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262480 d!88484))

(declare-fun d!88486 () Bool)

(assert (=> d!88486 (= (invariant!0 (currentBit!12690 w1!584) (currentByte!12695 w1!584) (size!6390 (buf!6858 w1!584))) (and (bvsge (currentBit!12690 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12690 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12695 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12695 w1!584) (size!6390 (buf!6858 w1!584))) (and (= (currentBit!12690 w1!584) #b00000000000000000000000000000000) (= (currentByte!12695 w1!584) (size!6390 (buf!6858 w1!584)))))))))

(assert (=> b!262479 d!88486))

(declare-fun d!88492 () Bool)

(assert (=> d!88492 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404126 () Unit!18723)

(declare-fun choose!11 (BitStream!11594) Unit!18723)

(assert (=> d!88492 (= lt!404126 (choose!11 w2!580))))

(assert (=> d!88492 (= (lemmaIsPrefixRefl!0 w2!580) lt!404126)))

(declare-fun bs!22438 () Bool)

(assert (= bs!22438 d!88492))

(assert (=> bs!22438 m!392563))

(declare-fun m!392573 () Bool)

(assert (=> bs!22438 m!392573))

(assert (=> b!262478 d!88492))

(declare-fun d!88494 () Bool)

(assert (=> d!88494 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404127 () Unit!18723)

(assert (=> d!88494 (= lt!404127 (choose!11 w1!584))))

(assert (=> d!88494 (= (lemmaIsPrefixRefl!0 w1!584) lt!404127)))

(declare-fun bs!22439 () Bool)

(assert (= bs!22439 d!88494))

(assert (=> bs!22439 m!392561))

(declare-fun m!392575 () Bool)

(assert (=> bs!22439 m!392575))

(assert (=> b!262478 d!88494))

(declare-fun d!88496 () Bool)

(assert (=> d!88496 (isPrefixOf!0 lt!404122 lt!404122)))

(declare-fun lt!404128 () Unit!18723)

(assert (=> d!88496 (= lt!404128 (choose!11 lt!404122))))

(assert (=> d!88496 (= (lemmaIsPrefixRefl!0 lt!404122) lt!404128)))

(declare-fun bs!22440 () Bool)

(assert (= bs!22440 d!88496))

(assert (=> bs!22440 m!392555))

(declare-fun m!392577 () Bool)

(assert (=> bs!22440 m!392577))

(assert (=> b!262478 d!88496))

(declare-fun d!88498 () Bool)

(declare-fun res!219672 () Bool)

(declare-fun e!182775 () Bool)

(assert (=> d!88498 (=> (not res!219672) (not e!182775))))

(assert (=> d!88498 (= res!219672 (= (size!6390 (buf!6858 lt!404122)) (size!6390 (buf!6858 lt!404122))))))

(assert (=> d!88498 (= (isPrefixOf!0 lt!404122 lt!404122) e!182775)))

(declare-fun b!262512 () Bool)

(declare-fun res!219671 () Bool)

(assert (=> b!262512 (=> (not res!219671) (not e!182775))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262512 (= res!219671 (bvsle (bitIndex!0 (size!6390 (buf!6858 lt!404122)) (currentByte!12695 lt!404122) (currentBit!12690 lt!404122)) (bitIndex!0 (size!6390 (buf!6858 lt!404122)) (currentByte!12695 lt!404122) (currentBit!12690 lt!404122))))))

(declare-fun b!262513 () Bool)

(declare-fun e!182776 () Bool)

(assert (=> b!262513 (= e!182775 e!182776)))

(declare-fun res!219673 () Bool)

(assert (=> b!262513 (=> res!219673 e!182776)))

(assert (=> b!262513 (= res!219673 (= (size!6390 (buf!6858 lt!404122)) #b00000000000000000000000000000000))))

(declare-fun b!262514 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14634 array!14634 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262514 (= e!182776 (arrayBitRangesEq!0 (buf!6858 lt!404122) (buf!6858 lt!404122) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6390 (buf!6858 lt!404122)) (currentByte!12695 lt!404122) (currentBit!12690 lt!404122))))))

(assert (= (and d!88498 res!219672) b!262512))

(assert (= (and b!262512 res!219671) b!262513))

(assert (= (and b!262513 (not res!219673)) b!262514))

(declare-fun m!392605 () Bool)

(assert (=> b!262512 m!392605))

(assert (=> b!262512 m!392605))

(assert (=> b!262514 m!392605))

(assert (=> b!262514 m!392605))

(declare-fun m!392609 () Bool)

(assert (=> b!262514 m!392609))

(assert (=> b!262478 d!88498))

(declare-fun d!88530 () Bool)

(declare-fun res!219678 () Bool)

(declare-fun e!182779 () Bool)

(assert (=> d!88530 (=> (not res!219678) (not e!182779))))

(assert (=> d!88530 (= res!219678 (= (size!6390 (buf!6858 w1!584)) (size!6390 (buf!6858 w1!584))))))

(assert (=> d!88530 (= (isPrefixOf!0 w1!584 w1!584) e!182779)))

(declare-fun b!262518 () Bool)

(declare-fun res!219677 () Bool)

(assert (=> b!262518 (=> (not res!219677) (not e!182779))))

(assert (=> b!262518 (= res!219677 (bvsle (bitIndex!0 (size!6390 (buf!6858 w1!584)) (currentByte!12695 w1!584) (currentBit!12690 w1!584)) (bitIndex!0 (size!6390 (buf!6858 w1!584)) (currentByte!12695 w1!584) (currentBit!12690 w1!584))))))

(declare-fun b!262519 () Bool)

(declare-fun e!182780 () Bool)

(assert (=> b!262519 (= e!182779 e!182780)))

(declare-fun res!219679 () Bool)

(assert (=> b!262519 (=> res!219679 e!182780)))

(assert (=> b!262519 (= res!219679 (= (size!6390 (buf!6858 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262520 () Bool)

(assert (=> b!262520 (= e!182780 (arrayBitRangesEq!0 (buf!6858 w1!584) (buf!6858 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6390 (buf!6858 w1!584)) (currentByte!12695 w1!584) (currentBit!12690 w1!584))))))

(assert (= (and d!88530 res!219678) b!262518))

(assert (= (and b!262518 res!219677) b!262519))

(assert (= (and b!262519 (not res!219679)) b!262520))

(declare-fun m!392611 () Bool)

(assert (=> b!262518 m!392611))

(assert (=> b!262518 m!392611))

(assert (=> b!262520 m!392611))

(assert (=> b!262520 m!392611))

(declare-fun m!392615 () Bool)

(assert (=> b!262520 m!392615))

(assert (=> b!262478 d!88530))

(declare-fun d!88532 () Bool)

(declare-fun res!219681 () Bool)

(declare-fun e!182781 () Bool)

(assert (=> d!88532 (=> (not res!219681) (not e!182781))))

(assert (=> d!88532 (= res!219681 (= (size!6390 (buf!6858 w2!580)) (size!6390 (buf!6858 w2!580))))))

(assert (=> d!88532 (= (isPrefixOf!0 w2!580 w2!580) e!182781)))

(declare-fun b!262521 () Bool)

(declare-fun res!219680 () Bool)

(assert (=> b!262521 (=> (not res!219680) (not e!182781))))

(assert (=> b!262521 (= res!219680 (bvsle (bitIndex!0 (size!6390 (buf!6858 w2!580)) (currentByte!12695 w2!580) (currentBit!12690 w2!580)) (bitIndex!0 (size!6390 (buf!6858 w2!580)) (currentByte!12695 w2!580) (currentBit!12690 w2!580))))))

(declare-fun b!262522 () Bool)

(declare-fun e!182782 () Bool)

(assert (=> b!262522 (= e!182781 e!182782)))

(declare-fun res!219682 () Bool)

(assert (=> b!262522 (=> res!219682 e!182782)))

(assert (=> b!262522 (= res!219682 (= (size!6390 (buf!6858 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262523 () Bool)

(assert (=> b!262523 (= e!182782 (arrayBitRangesEq!0 (buf!6858 w2!580) (buf!6858 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6390 (buf!6858 w2!580)) (currentByte!12695 w2!580) (currentBit!12690 w2!580))))))

(assert (= (and d!88532 res!219681) b!262521))

(assert (= (and b!262521 res!219680) b!262522))

(assert (= (and b!262522 (not res!219682)) b!262523))

(declare-fun m!392617 () Bool)

(assert (=> b!262521 m!392617))

(assert (=> b!262521 m!392617))

(assert (=> b!262523 m!392617))

(assert (=> b!262523 m!392617))

(declare-fun m!392619 () Bool)

(assert (=> b!262523 m!392619))

(assert (=> b!262478 d!88532))

(declare-fun d!88534 () Bool)

(declare-fun res!219684 () Bool)

(declare-fun e!182783 () Bool)

(assert (=> d!88534 (=> (not res!219684) (not e!182783))))

