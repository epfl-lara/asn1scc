; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57236 () Bool)

(assert start!57236)

(declare-fun b!262469 () Bool)

(declare-fun e!182733 () Bool)

(declare-datatypes ((array!14632 0))(
  ( (array!14633 (arr!7376 (Array (_ BitVec 32) (_ BitVec 8))) (size!6389 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11592 0))(
  ( (BitStream!11593 (buf!6857 array!14632) (currentByte!12694 (_ BitVec 32)) (currentBit!12689 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11592)

(declare-fun array_inv!6113 (array!14632) Bool)

(assert (=> b!262469 (= e!182733 (array_inv!6113 (buf!6857 w2!580)))))

(declare-fun res!219633 () Bool)

(declare-fun e!182734 () Bool)

(assert (=> start!57236 (=> (not res!219633) (not e!182734))))

(declare-fun w1!584 () BitStream!11592)

(declare-fun isPrefixOf!0 (BitStream!11592 BitStream!11592) Bool)

(assert (=> start!57236 (= res!219633 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57236 e!182734))

(declare-fun e!182736 () Bool)

(declare-fun inv!12 (BitStream!11592) Bool)

(assert (=> start!57236 (and (inv!12 w1!584) e!182736)))

(assert (=> start!57236 (and (inv!12 w2!580) e!182733)))

(declare-fun b!262467 () Bool)

(declare-fun e!182732 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262467 (= e!182732 (invariant!0 (currentBit!12689 w1!584) (currentByte!12694 w1!584) (size!6389 (buf!6857 w1!584))))))

(declare-fun b!262468 () Bool)

(assert (=> b!262468 (= e!182736 (array_inv!6113 (buf!6857 w1!584)))))

(declare-fun b!262466 () Bool)

(assert (=> b!262466 (= e!182734 (not e!182732))))

(declare-fun res!219634 () Bool)

(assert (=> b!262466 (=> res!219634 e!182732)))

(assert (=> b!262466 (= res!219634 (= (size!6389 (buf!6857 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262466 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18721 0))(
  ( (Unit!18722) )
))
(declare-fun lt!404109 () Unit!18721)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11592) Unit!18721)

(assert (=> b!262466 (= lt!404109 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404111 () BitStream!11592)

(assert (=> b!262466 (isPrefixOf!0 lt!404111 lt!404111)))

(declare-fun lt!404108 () Unit!18721)

(assert (=> b!262466 (= lt!404108 (lemmaIsPrefixRefl!0 lt!404111))))

(assert (=> b!262466 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404110 () Unit!18721)

(assert (=> b!262466 (= lt!404110 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262466 (= lt!404111 (BitStream!11593 (buf!6857 w2!580) (currentByte!12694 w1!584) (currentBit!12689 w1!584)))))

(assert (= (and start!57236 res!219633) b!262466))

(assert (= (and b!262466 (not res!219634)) b!262467))

(assert (= start!57236 b!262468))

(assert (= start!57236 b!262469))

(declare-fun m!392525 () Bool)

(assert (=> b!262468 m!392525))

(declare-fun m!392527 () Bool)

(assert (=> b!262469 m!392527))

(declare-fun m!392529 () Bool)

(assert (=> start!57236 m!392529))

(declare-fun m!392531 () Bool)

(assert (=> start!57236 m!392531))

(declare-fun m!392533 () Bool)

(assert (=> start!57236 m!392533))

(declare-fun m!392535 () Bool)

(assert (=> b!262466 m!392535))

(declare-fun m!392537 () Bool)

(assert (=> b!262466 m!392537))

(declare-fun m!392539 () Bool)

(assert (=> b!262466 m!392539))

(declare-fun m!392541 () Bool)

(assert (=> b!262466 m!392541))

(declare-fun m!392543 () Bool)

(assert (=> b!262466 m!392543))

(declare-fun m!392545 () Bool)

(assert (=> b!262466 m!392545))

(declare-fun m!392547 () Bool)

(assert (=> b!262467 m!392547))

(check-sat (not b!262468) (not b!262467) (not b!262466) (not start!57236) (not b!262469))
(check-sat)
(get-model)

(declare-fun d!88488 () Bool)

(assert (=> d!88488 (= (array_inv!6113 (buf!6857 w2!580)) (bvsge (size!6389 (buf!6857 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262469 d!88488))

(declare-fun d!88490 () Bool)

(declare-fun res!219657 () Bool)

(declare-fun e!182766 () Bool)

(assert (=> d!88490 (=> (not res!219657) (not e!182766))))

(assert (=> d!88490 (= res!219657 (= (size!6389 (buf!6857 w1!584)) (size!6389 (buf!6857 w2!580))))))

(assert (=> d!88490 (= (isPrefixOf!0 w1!584 w2!580) e!182766)))

(declare-fun b!262497 () Bool)

(declare-fun res!219658 () Bool)

(assert (=> b!262497 (=> (not res!219658) (not e!182766))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262497 (= res!219658 (bvsle (bitIndex!0 (size!6389 (buf!6857 w1!584)) (currentByte!12694 w1!584) (currentBit!12689 w1!584)) (bitIndex!0 (size!6389 (buf!6857 w2!580)) (currentByte!12694 w2!580) (currentBit!12689 w2!580))))))

(declare-fun b!262498 () Bool)

(declare-fun e!182765 () Bool)

(assert (=> b!262498 (= e!182766 e!182765)))

(declare-fun res!219656 () Bool)

(assert (=> b!262498 (=> res!219656 e!182765)))

(assert (=> b!262498 (= res!219656 (= (size!6389 (buf!6857 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262499 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14632 array!14632 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262499 (= e!182765 (arrayBitRangesEq!0 (buf!6857 w1!584) (buf!6857 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6389 (buf!6857 w1!584)) (currentByte!12694 w1!584) (currentBit!12689 w1!584))))))

(assert (= (and d!88490 res!219657) b!262497))

(assert (= (and b!262497 res!219658) b!262498))

(assert (= (and b!262498 (not res!219656)) b!262499))

(declare-fun m!392587 () Bool)

(assert (=> b!262497 m!392587))

(declare-fun m!392589 () Bool)

(assert (=> b!262497 m!392589))

(assert (=> b!262499 m!392587))

(assert (=> b!262499 m!392587))

(declare-fun m!392591 () Bool)

(assert (=> b!262499 m!392591))

(assert (=> start!57236 d!88490))

(declare-fun d!88510 () Bool)

(assert (=> d!88510 (= (inv!12 w1!584) (invariant!0 (currentBit!12689 w1!584) (currentByte!12694 w1!584) (size!6389 (buf!6857 w1!584))))))

(declare-fun bs!22444 () Bool)

(assert (= bs!22444 d!88510))

(assert (=> bs!22444 m!392547))

(assert (=> start!57236 d!88510))

(declare-fun d!88512 () Bool)

(assert (=> d!88512 (= (inv!12 w2!580) (invariant!0 (currentBit!12689 w2!580) (currentByte!12694 w2!580) (size!6389 (buf!6857 w2!580))))))

(declare-fun bs!22445 () Bool)

(assert (= bs!22445 d!88512))

(declare-fun m!392593 () Bool)

(assert (=> bs!22445 m!392593))

(assert (=> start!57236 d!88512))

(declare-fun d!88514 () Bool)

(assert (=> d!88514 (= (array_inv!6113 (buf!6857 w1!584)) (bvsge (size!6389 (buf!6857 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262468 d!88514))

(declare-fun d!88516 () Bool)

(assert (=> d!88516 (= (invariant!0 (currentBit!12689 w1!584) (currentByte!12694 w1!584) (size!6389 (buf!6857 w1!584))) (and (bvsge (currentBit!12689 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12689 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12694 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12694 w1!584) (size!6389 (buf!6857 w1!584))) (and (= (currentBit!12689 w1!584) #b00000000000000000000000000000000) (= (currentByte!12694 w1!584) (size!6389 (buf!6857 w1!584)))))))))

(assert (=> b!262467 d!88516))

(declare-fun d!88526 () Bool)

(assert (=> d!88526 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404136 () Unit!18721)

(declare-fun choose!11 (BitStream!11592) Unit!18721)

(assert (=> d!88526 (= lt!404136 (choose!11 w2!580))))

(assert (=> d!88526 (= (lemmaIsPrefixRefl!0 w2!580) lt!404136)))

(declare-fun bs!22450 () Bool)

(assert (= bs!22450 d!88526))

(assert (=> bs!22450 m!392543))

(declare-fun m!392623 () Bool)

(assert (=> bs!22450 m!392623))

(assert (=> b!262466 d!88526))

(declare-fun d!88538 () Bool)

(declare-fun res!219687 () Bool)

(declare-fun e!182786 () Bool)

(assert (=> d!88538 (=> (not res!219687) (not e!182786))))

(assert (=> d!88538 (= res!219687 (= (size!6389 (buf!6857 lt!404111)) (size!6389 (buf!6857 lt!404111))))))

(assert (=> d!88538 (= (isPrefixOf!0 lt!404111 lt!404111) e!182786)))

(declare-fun b!262527 () Bool)

(declare-fun res!219688 () Bool)

(assert (=> b!262527 (=> (not res!219688) (not e!182786))))

(assert (=> b!262527 (= res!219688 (bvsle (bitIndex!0 (size!6389 (buf!6857 lt!404111)) (currentByte!12694 lt!404111) (currentBit!12689 lt!404111)) (bitIndex!0 (size!6389 (buf!6857 lt!404111)) (currentByte!12694 lt!404111) (currentBit!12689 lt!404111))))))

(declare-fun b!262528 () Bool)

(declare-fun e!182785 () Bool)

(assert (=> b!262528 (= e!182786 e!182785)))

(declare-fun res!219686 () Bool)

(assert (=> b!262528 (=> res!219686 e!182785)))

(assert (=> b!262528 (= res!219686 (= (size!6389 (buf!6857 lt!404111)) #b00000000000000000000000000000000))))

(declare-fun b!262529 () Bool)

(assert (=> b!262529 (= e!182785 (arrayBitRangesEq!0 (buf!6857 lt!404111) (buf!6857 lt!404111) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6389 (buf!6857 lt!404111)) (currentByte!12694 lt!404111) (currentBit!12689 lt!404111))))))

(assert (= (and d!88538 res!219687) b!262527))

(assert (= (and b!262527 res!219688) b!262528))

(assert (= (and b!262528 (not res!219686)) b!262529))

(declare-fun m!392625 () Bool)

(assert (=> b!262527 m!392625))

(assert (=> b!262527 m!392625))

(assert (=> b!262529 m!392625))

(assert (=> b!262529 m!392625))

(declare-fun m!392627 () Bool)

(assert (=> b!262529 m!392627))

(assert (=> b!262466 d!88538))

(declare-fun d!88540 () Bool)

(assert (=> d!88540 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404137 () Unit!18721)

(assert (=> d!88540 (= lt!404137 (choose!11 w1!584))))

(assert (=> d!88540 (= (lemmaIsPrefixRefl!0 w1!584) lt!404137)))

(declare-fun bs!22452 () Bool)

(assert (= bs!22452 d!88540))

(assert (=> bs!22452 m!392539))

(declare-fun m!392629 () Bool)

(assert (=> bs!22452 m!392629))

(assert (=> b!262466 d!88540))

(declare-fun d!88544 () Bool)

(declare-fun res!219690 () Bool)

(declare-fun e!182788 () Bool)

(assert (=> d!88544 (=> (not res!219690) (not e!182788))))

(assert (=> d!88544 (= res!219690 (= (size!6389 (buf!6857 w1!584)) (size!6389 (buf!6857 w1!584))))))

(assert (=> d!88544 (= (isPrefixOf!0 w1!584 w1!584) e!182788)))

(declare-fun b!262530 () Bool)

(declare-fun res!219691 () Bool)

(assert (=> b!262530 (=> (not res!219691) (not e!182788))))

(assert (=> b!262530 (= res!219691 (bvsle (bitIndex!0 (size!6389 (buf!6857 w1!584)) (currentByte!12694 w1!584) (currentBit!12689 w1!584)) (bitIndex!0 (size!6389 (buf!6857 w1!584)) (currentByte!12694 w1!584) (currentBit!12689 w1!584))))))

(declare-fun b!262531 () Bool)

(declare-fun e!182787 () Bool)

(assert (=> b!262531 (= e!182788 e!182787)))

(declare-fun res!219689 () Bool)

(assert (=> b!262531 (=> res!219689 e!182787)))

(assert (=> b!262531 (= res!219689 (= (size!6389 (buf!6857 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262532 () Bool)

(assert (=> b!262532 (= e!182787 (arrayBitRangesEq!0 (buf!6857 w1!584) (buf!6857 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6389 (buf!6857 w1!584)) (currentByte!12694 w1!584) (currentBit!12689 w1!584))))))

(assert (= (and d!88544 res!219690) b!262530))

(assert (= (and b!262530 res!219691) b!262531))

(assert (= (and b!262531 (not res!219689)) b!262532))

(assert (=> b!262530 m!392587))

(assert (=> b!262530 m!392587))

(assert (=> b!262532 m!392587))

(assert (=> b!262532 m!392587))

(declare-fun m!392633 () Bool)

(assert (=> b!262532 m!392633))

(assert (=> b!262466 d!88544))

(declare-fun d!88548 () Bool)

(assert (=> d!88548 (isPrefixOf!0 lt!404111 lt!404111)))

(declare-fun lt!404138 () Unit!18721)

(assert (=> d!88548 (= lt!404138 (choose!11 lt!404111))))

(assert (=> d!88548 (= (lemmaIsPrefixRefl!0 lt!404111) lt!404138)))

(declare-fun bs!22454 () Bool)

(assert (= bs!22454 d!88548))

(assert (=> bs!22454 m!392545))

(declare-fun m!392635 () Bool)

(assert (=> bs!22454 m!392635))

(assert (=> b!262466 d!88548))

(declare-fun d!88550 () Bool)

(declare-fun res!219693 () Bool)

(declare-fun e!182790 () Bool)

(assert (=> d!88550 (=> (not res!219693) (not e!182790))))

(assert (=> d!88550 (= res!219693 (= (size!6389 (buf!6857 w2!580)) (size!6389 (buf!6857 w2!580))))))

(assert (=> d!88550 (= (isPrefixOf!0 w2!580 w2!580) e!182790)))

(declare-fun b!262533 () Bool)

(declare-fun res!219694 () Bool)

(assert (=> b!262533 (=> (not res!219694) (not e!182790))))

(assert (=> b!262533 (= res!219694 (bvsle (bitIndex!0 (size!6389 (buf!6857 w2!580)) (currentByte!12694 w2!580) (currentBit!12689 w2!580)) (bitIndex!0 (size!6389 (buf!6857 w2!580)) (currentByte!12694 w2!580) (currentBit!12689 w2!580))))))

(declare-fun b!262534 () Bool)

(declare-fun e!182789 () Bool)

(assert (=> b!262534 (= e!182790 e!182789)))

(declare-fun res!219692 () Bool)

(assert (=> b!262534 (=> res!219692 e!182789)))

(assert (=> b!262534 (= res!219692 (= (size!6389 (buf!6857 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262535 () Bool)

(assert (=> b!262535 (= e!182789 (arrayBitRangesEq!0 (buf!6857 w2!580) (buf!6857 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6389 (buf!6857 w2!580)) (currentByte!12694 w2!580) (currentBit!12689 w2!580))))))

(assert (= (and d!88550 res!219693) b!262533))

(assert (= (and b!262533 res!219694) b!262534))

(assert (= (and b!262534 (not res!219692)) b!262535))

(assert (=> b!262533 m!392589))

(assert (=> b!262533 m!392589))

(assert (=> b!262535 m!392589))

(assert (=> b!262535 m!392589))

(declare-fun m!392637 () Bool)

(assert (=> b!262535 m!392637))

(assert (=> b!262466 d!88550))

(check-sat (not b!262535) (not d!88510) (not d!88540) (not b!262527) (not b!262532) (not b!262497) (not d!88548) (not b!262529) (not b!262499) (not d!88526) (not b!262530) (not d!88512) (not b!262533))
(check-sat)
