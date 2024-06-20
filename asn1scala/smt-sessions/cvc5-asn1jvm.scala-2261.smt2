; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57234 () Bool)

(assert start!57234)

(declare-fun b!262454 () Bool)

(declare-fun e!182718 () Bool)

(declare-fun e!182713 () Bool)

(assert (=> b!262454 (= e!182718 (not e!182713))))

(declare-fun res!219628 () Bool)

(assert (=> b!262454 (=> res!219628 e!182713)))

(declare-datatypes ((array!14630 0))(
  ( (array!14631 (arr!7375 (Array (_ BitVec 32) (_ BitVec 8))) (size!6388 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11590 0))(
  ( (BitStream!11591 (buf!6856 array!14630) (currentByte!12693 (_ BitVec 32)) (currentBit!12688 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11590)

(assert (=> b!262454 (= res!219628 (= (size!6388 (buf!6856 w1!584)) #b00000000000000000000000000000000))))

(declare-fun w2!580 () BitStream!11590)

(declare-fun isPrefixOf!0 (BitStream!11590 BitStream!11590) Bool)

(assert (=> b!262454 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18719 0))(
  ( (Unit!18720) )
))
(declare-fun lt!404096 () Unit!18719)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11590) Unit!18719)

(assert (=> b!262454 (= lt!404096 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404099 () BitStream!11590)

(assert (=> b!262454 (isPrefixOf!0 lt!404099 lt!404099)))

(declare-fun lt!404097 () Unit!18719)

(assert (=> b!262454 (= lt!404097 (lemmaIsPrefixRefl!0 lt!404099))))

(assert (=> b!262454 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404098 () Unit!18719)

(assert (=> b!262454 (= lt!404098 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262454 (= lt!404099 (BitStream!11591 (buf!6856 w2!580) (currentByte!12693 w1!584) (currentBit!12688 w1!584)))))

(declare-fun b!262457 () Bool)

(declare-fun e!182717 () Bool)

(declare-fun array_inv!6112 (array!14630) Bool)

(assert (=> b!262457 (= e!182717 (array_inv!6112 (buf!6856 w2!580)))))

(declare-fun b!262456 () Bool)

(declare-fun e!182716 () Bool)

(assert (=> b!262456 (= e!182716 (array_inv!6112 (buf!6856 w1!584)))))

(declare-fun b!262455 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262455 (= e!182713 (invariant!0 (currentBit!12688 w1!584) (currentByte!12693 w1!584) (size!6388 (buf!6856 w1!584))))))

(declare-fun res!219627 () Bool)

(assert (=> start!57234 (=> (not res!219627) (not e!182718))))

(assert (=> start!57234 (= res!219627 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57234 e!182718))

(declare-fun inv!12 (BitStream!11590) Bool)

(assert (=> start!57234 (and (inv!12 w1!584) e!182716)))

(assert (=> start!57234 (and (inv!12 w2!580) e!182717)))

(assert (= (and start!57234 res!219627) b!262454))

(assert (= (and b!262454 (not res!219628)) b!262455))

(assert (= start!57234 b!262456))

(assert (= start!57234 b!262457))

(declare-fun m!392501 () Bool)

(assert (=> b!262454 m!392501))

(declare-fun m!392503 () Bool)

(assert (=> b!262454 m!392503))

(declare-fun m!392505 () Bool)

(assert (=> b!262454 m!392505))

(declare-fun m!392507 () Bool)

(assert (=> b!262454 m!392507))

(declare-fun m!392509 () Bool)

(assert (=> b!262454 m!392509))

(declare-fun m!392511 () Bool)

(assert (=> b!262454 m!392511))

(declare-fun m!392513 () Bool)

(assert (=> b!262456 m!392513))

(declare-fun m!392515 () Bool)

(assert (=> b!262455 m!392515))

(declare-fun m!392517 () Bool)

(assert (=> b!262457 m!392517))

(declare-fun m!392519 () Bool)

(assert (=> start!57234 m!392519))

(declare-fun m!392521 () Bool)

(assert (=> start!57234 m!392521))

(declare-fun m!392523 () Bool)

(assert (=> start!57234 m!392523))

(push 1)

(assert (not b!262455))

(assert (not start!57234))

(assert (not b!262454))

(assert (not b!262457))

(assert (not b!262456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88480 () Bool)

(assert (=> d!88480 (= (array_inv!6112 (buf!6856 w2!580)) (bvsge (size!6388 (buf!6856 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262457 d!88480))

(declare-fun d!88482 () Bool)

(declare-fun res!219648 () Bool)

(declare-fun e!182760 () Bool)

(assert (=> d!88482 (=> (not res!219648) (not e!182760))))

(assert (=> d!88482 (= res!219648 (= (size!6388 (buf!6856 w1!584)) (size!6388 (buf!6856 w2!580))))))

(assert (=> d!88482 (= (isPrefixOf!0 w1!584 w2!580) e!182760)))

(declare-fun b!262488 () Bool)

(declare-fun res!219647 () Bool)

(assert (=> b!262488 (=> (not res!219647) (not e!182760))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262488 (= res!219647 (bvsle (bitIndex!0 (size!6388 (buf!6856 w1!584)) (currentByte!12693 w1!584) (currentBit!12688 w1!584)) (bitIndex!0 (size!6388 (buf!6856 w2!580)) (currentByte!12693 w2!580) (currentBit!12688 w2!580))))))

(declare-fun b!262489 () Bool)

(declare-fun e!182759 () Bool)

(assert (=> b!262489 (= e!182760 e!182759)))

(declare-fun res!219649 () Bool)

(assert (=> b!262489 (=> res!219649 e!182759)))

(assert (=> b!262489 (= res!219649 (= (size!6388 (buf!6856 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262490 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14630 array!14630 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262490 (= e!182759 (arrayBitRangesEq!0 (buf!6856 w1!584) (buf!6856 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6388 (buf!6856 w1!584)) (currentByte!12693 w1!584) (currentBit!12688 w1!584))))))

(assert (= (and d!88482 res!219648) b!262488))

(assert (= (and b!262488 res!219647) b!262489))

(assert (= (and b!262489 (not res!219649)) b!262490))

(declare-fun m!392579 () Bool)

(assert (=> b!262488 m!392579))

(declare-fun m!392581 () Bool)

(assert (=> b!262488 m!392581))

(assert (=> b!262490 m!392579))

(assert (=> b!262490 m!392579))

(declare-fun m!392583 () Bool)

(assert (=> b!262490 m!392583))

(assert (=> start!57234 d!88482))

(declare-fun d!88500 () Bool)

(assert (=> d!88500 (= (inv!12 w1!584) (invariant!0 (currentBit!12688 w1!584) (currentByte!12693 w1!584) (size!6388 (buf!6856 w1!584))))))

(declare-fun bs!22441 () Bool)

(assert (= bs!22441 d!88500))

(assert (=> bs!22441 m!392515))

(assert (=> start!57234 d!88500))

(declare-fun d!88502 () Bool)

(assert (=> d!88502 (= (inv!12 w2!580) (invariant!0 (currentBit!12688 w2!580) (currentByte!12693 w2!580) (size!6388 (buf!6856 w2!580))))))

(declare-fun bs!22442 () Bool)

(assert (= bs!22442 d!88502))

(declare-fun m!392585 () Bool)

(assert (=> bs!22442 m!392585))

(assert (=> start!57234 d!88502))

(declare-fun d!88504 () Bool)

(assert (=> d!88504 (= (array_inv!6112 (buf!6856 w1!584)) (bvsge (size!6388 (buf!6856 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262456 d!88504))

(declare-fun d!88506 () Bool)

(assert (=> d!88506 (= (invariant!0 (currentBit!12688 w1!584) (currentByte!12693 w1!584) (size!6388 (buf!6856 w1!584))) (and (bvsge (currentBit!12688 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12688 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12693 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12693 w1!584) (size!6388 (buf!6856 w1!584))) (and (= (currentBit!12688 w1!584) #b00000000000000000000000000000000) (= (currentByte!12693 w1!584) (size!6388 (buf!6856 w1!584)))))))))

(assert (=> b!262455 d!88506))

(declare-fun d!88508 () Bool)

(assert (=> d!88508 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404131 () Unit!18719)

(declare-fun choose!11 (BitStream!11590) Unit!18719)

(assert (=> d!88508 (= lt!404131 (choose!11 w2!580))))

(assert (=> d!88508 (= (lemmaIsPrefixRefl!0 w2!580) lt!404131)))

(declare-fun bs!22446 () Bool)

(assert (= bs!22446 d!88508))

(assert (=> bs!22446 m!392505))

(declare-fun m!392595 () Bool)

(assert (=> bs!22446 m!392595))

(assert (=> b!262454 d!88508))

(declare-fun d!88518 () Bool)

(assert (=> d!88518 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404132 () Unit!18719)

(assert (=> d!88518 (= lt!404132 (choose!11 w1!584))))

(assert (=> d!88518 (= (lemmaIsPrefixRefl!0 w1!584) lt!404132)))

(declare-fun bs!22447 () Bool)

(assert (= bs!22447 d!88518))

(assert (=> bs!22447 m!392503))

(declare-fun m!392597 () Bool)

(assert (=> bs!22447 m!392597))

(assert (=> b!262454 d!88518))

(declare-fun d!88520 () Bool)

(declare-fun res!219666 () Bool)

(declare-fun e!182772 () Bool)

(assert (=> d!88520 (=> (not res!219666) (not e!182772))))

(assert (=> d!88520 (= res!219666 (= (size!6388 (buf!6856 lt!404099)) (size!6388 (buf!6856 lt!404099))))))

(assert (=> d!88520 (= (isPrefixOf!0 lt!404099 lt!404099) e!182772)))

(declare-fun b!262506 () Bool)

(declare-fun res!219665 () Bool)

(assert (=> b!262506 (=> (not res!219665) (not e!182772))))

(assert (=> b!262506 (= res!219665 (bvsle (bitIndex!0 (size!6388 (buf!6856 lt!404099)) (currentByte!12693 lt!404099) (currentBit!12688 lt!404099)) (bitIndex!0 (size!6388 (buf!6856 lt!404099)) (currentByte!12693 lt!404099) (currentBit!12688 lt!404099))))))

(declare-fun b!262507 () Bool)

(declare-fun e!182771 () Bool)

(assert (=> b!262507 (= e!182772 e!182771)))

(declare-fun res!219667 () Bool)

(assert (=> b!262507 (=> res!219667 e!182771)))

(assert (=> b!262507 (= res!219667 (= (size!6388 (buf!6856 lt!404099)) #b00000000000000000000000000000000))))

(declare-fun b!262508 () Bool)

(assert (=> b!262508 (= e!182771 (arrayBitRangesEq!0 (buf!6856 lt!404099) (buf!6856 lt!404099) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6388 (buf!6856 lt!404099)) (currentByte!12693 lt!404099) (currentBit!12688 lt!404099))))))

(assert (= (and d!88520 res!219666) b!262506))

(assert (= (and b!262506 res!219665) b!262507))

(assert (= (and b!262507 (not res!219667)) b!262508))

(declare-fun m!392599 () Bool)

(assert (=> b!262506 m!392599))

(assert (=> b!262506 m!392599))

(assert (=> b!262508 m!392599))

(assert (=> b!262508 m!392599))

(declare-fun m!392601 () Bool)

(assert (=> b!262508 m!392601))

(assert (=> b!262454 d!88520))

(declare-fun d!88522 () Bool)

(assert (=> d!88522 (isPrefixOf!0 lt!404099 lt!404099)))

(declare-fun lt!404133 () Unit!18719)

(assert (=> d!88522 (= lt!404133 (choose!11 lt!404099))))

(assert (=> d!88522 (= (lemmaIsPrefixRefl!0 lt!404099) lt!404133)))

(declare-fun bs!22448 () Bool)

(assert (= bs!22448 d!88522))

(assert (=> bs!22448 m!392511))

(declare-fun m!392603 () Bool)

(assert (=> bs!22448 m!392603))

(assert (=> b!262454 d!88522))

(declare-fun d!88524 () Bool)

(declare-fun res!219669 () Bool)

(declare-fun e!182774 () Bool)

(assert (=> d!88524 (=> (not res!219669) (not e!182774))))

(assert (=> d!88524 (= res!219669 (= (size!6388 (buf!6856 w1!584)) (size!6388 (buf!6856 w1!584))))))

(assert (=> d!88524 (= (isPrefixOf!0 w1!584 w1!584) e!182774)))

(declare-fun b!262509 () Bool)

(declare-fun res!219668 () Bool)

(assert (=> b!262509 (=> (not res!219668) (not e!182774))))

(assert (=> b!262509 (= res!219668 (bvsle (bitIndex!0 (size!6388 (buf!6856 w1!584)) (currentByte!12693 w1!584) (currentBit!12688 w1!584)) (bitIndex!0 (size!6388 (buf!6856 w1!584)) (currentByte!12693 w1!584) (currentBit!12688 w1!584))))))

(declare-fun b!262510 () Bool)

(declare-fun e!182773 () Bool)

(assert (=> b!262510 (= e!182774 e!182773)))

(declare-fun res!219670 () Bool)

(assert (=> b!262510 (=> res!219670 e!182773)))

(assert (=> b!262510 (= res!219670 (= (size!6388 (buf!6856 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262511 () Bool)

(assert (=> b!262511 (= e!182773 (arrayBitRangesEq!0 (buf!6856 w1!584) (buf!6856 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6388 (buf!6856 w1!584)) (currentByte!12693 w1!584) (currentBit!12688 w1!584))))))

(assert (= (and d!88524 res!219669) b!262509))

(assert (= (and b!262509 res!219668) b!262510))

(assert (= (and b!262510 (not res!219670)) b!262511))

(assert (=> b!262509 m!392579))

(assert (=> b!262509 m!392579))

(assert (=> b!262511 m!392579))

(assert (=> b!262511 m!392579))

(declare-fun m!392607 () Bool)

(assert (=> b!262511 m!392607))

(assert (=> b!262454 d!88524))

(declare-fun d!88528 () Bool)

(declare-fun res!219675 () Bool)

(declare-fun e!182778 () Bool)

(assert (=> d!88528 (=> (not res!219675) (not e!182778))))

(assert (=> d!88528 (= res!219675 (= (size!6388 (buf!6856 w2!580)) (size!6388 (buf!6856 w2!580))))))

(assert (=> d!88528 (= (isPrefixOf!0 w2!580 w2!580) e!182778)))

(declare-fun b!262515 () Bool)

(declare-fun res!219674 () Bool)

(assert (=> b!262515 (=> (not res!219674) (not e!182778))))

(assert (=> b!262515 (= res!219674 (bvsle (bitIndex!0 (size!6388 (buf!6856 w2!580)) (currentByte!12693 w2!580) (currentBit!12688 w2!580)) (bitIndex!0 (size!6388 (buf!6856 w2!580)) (currentByte!12693 w2!580) (currentBit!12688 w2!580))))))

(declare-fun b!262516 () Bool)

(declare-fun e!182777 () Bool)

(assert (=> b!262516 (= e!182778 e!182777)))

(declare-fun res!219676 () Bool)

(assert (=> b!262516 (=> res!219676 e!182777)))

(assert (=> b!262516 (= res!219676 (= (size!6388 (buf!6856 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262517 () Bool)

(assert (=> b!262517 (= e!182777 (arrayBitRangesEq!0 (buf!6856 w2!580) (buf!6856 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6388 (buf!6856 w2!580)) (currentByte!12693 w2!580) (currentBit!12688 w2!580))))))

(assert (= (and d!88528 res!219675) b!262515))

(assert (= (and b!262515 res!219674) b!262516))

(assert (= (and b!262516 (not res!219676)) b!262517))

(assert (=> b!262515 m!392581))

(assert (=> b!262515 m!392581))

(assert (=> b!262517 m!392581))

(assert (=> b!262517 m!392581))

(declare-fun m!392613 () Bool)

(assert (=> b!262517 m!392613))

(assert (=> b!262454 d!88528))

(push 1)

(assert (not d!88502))

(assert (not d!88522))

(assert (not b!262509))

(assert (not b!262506))

(assert (not b!262490))

(assert (not d!88500))

(assert (not b!262511))

(assert (not b!262515))

(assert (not b!262488))

(assert (not b!262517))

(assert (not d!88518))

(assert (not d!88508))

(assert (not b!262508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

