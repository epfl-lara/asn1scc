; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57472 () Bool)

(assert start!57472)

(declare-fun b!263449 () Bool)

(declare-datatypes ((Unit!18782 0))(
  ( (Unit!18783) )
))
(declare-fun e!183673 () Unit!18782)

(declare-fun lt!404921 () Unit!18782)

(assert (=> b!263449 (= e!183673 lt!404921)))

(declare-fun lt!404924 () (_ BitVec 64))

(declare-datatypes ((array!14703 0))(
  ( (array!14704 (arr!7404 (Array (_ BitVec 32) (_ BitVec 8))) (size!6417 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11648 0))(
  ( (BitStream!11649 (buf!6885 array!14703) (currentByte!12743 (_ BitVec 32)) (currentBit!12738 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11648)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263449 (= lt!404924 (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584)))))

(declare-fun w2!580 () BitStream!11648)

(declare-fun arrayBitRangesEqSymmetric!0 (array!14703 array!14703 (_ BitVec 64) (_ BitVec 64)) Unit!18782)

(assert (=> b!263449 (= lt!404921 (arrayBitRangesEqSymmetric!0 (buf!6885 w1!584) (buf!6885 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404924))))

(declare-fun arrayBitRangesEq!0 (array!14703 array!14703 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!263449 (arrayBitRangesEq!0 (buf!6885 w2!580) (buf!6885 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404924)))

(declare-fun b!263450 () Bool)

(declare-fun e!183678 () Bool)

(assert (=> b!263450 (= e!183678 (bvsle (size!6417 (buf!6885 w2!580)) (size!6417 (buf!6885 w1!584))))))

(declare-fun lt!404920 () (_ BitVec 64))

(assert (=> b!263450 (= lt!404920 (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584)))))

(declare-fun b!263451 () Bool)

(declare-fun e!183679 () Bool)

(declare-fun e!183676 () Bool)

(assert (=> b!263451 (= e!183679 (not e!183676))))

(declare-fun res!220373 () Bool)

(assert (=> b!263451 (=> res!220373 e!183676)))

(declare-fun e!183680 () Bool)

(assert (=> b!263451 (= res!220373 e!183680)))

(declare-fun res!220374 () Bool)

(assert (=> b!263451 (=> (not res!220374) (not e!183680))))

(assert (=> b!263451 (= res!220374 (not (= (size!6417 (buf!6885 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11648 BitStream!11648) Bool)

(assert (=> b!263451 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404925 () Unit!18782)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11648) Unit!18782)

(assert (=> b!263451 (= lt!404925 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404926 () BitStream!11648)

(assert (=> b!263451 (isPrefixOf!0 lt!404926 lt!404926)))

(declare-fun lt!404927 () Unit!18782)

(assert (=> b!263451 (= lt!404927 (lemmaIsPrefixRefl!0 lt!404926))))

(assert (=> b!263451 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404923 () Unit!18782)

(assert (=> b!263451 (= lt!404923 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263451 (= lt!404926 (BitStream!11649 (buf!6885 w2!580) (currentByte!12743 w1!584) (currentBit!12738 w1!584)))))

(declare-fun res!220375 () Bool)

(assert (=> start!57472 (=> (not res!220375) (not e!183679))))

(assert (=> start!57472 (= res!220375 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57472 e!183679))

(declare-fun e!183675 () Bool)

(declare-fun inv!12 (BitStream!11648) Bool)

(assert (=> start!57472 (and (inv!12 w1!584) e!183675)))

(declare-fun e!183681 () Bool)

(assert (=> start!57472 (and (inv!12 w2!580) e!183681)))

(declare-fun b!263452 () Bool)

(assert (=> b!263452 (= e!183680 (not (arrayBitRangesEq!0 (buf!6885 w1!584) (buf!6885 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584)))))))

(declare-fun b!263453 () Bool)

(declare-fun array_inv!6141 (array!14703) Bool)

(assert (=> b!263453 (= e!183675 (array_inv!6141 (buf!6885 w1!584)))))

(declare-fun b!263454 () Bool)

(declare-fun Unit!18784 () Unit!18782)

(assert (=> b!263454 (= e!183673 Unit!18784)))

(declare-fun b!263455 () Bool)

(assert (=> b!263455 (= e!183681 (array_inv!6141 (buf!6885 w2!580)))))

(declare-fun b!263456 () Bool)

(assert (=> b!263456 (= e!183676 e!183678)))

(declare-fun res!220372 () Bool)

(assert (=> b!263456 (=> res!220372 e!183678)))

(assert (=> b!263456 (= res!220372 (= (size!6417 (buf!6885 w1!584)) #b00000000000000000000000000000000))))

(declare-fun lt!404922 () Unit!18782)

(assert (=> b!263456 (= lt!404922 e!183673)))

(declare-fun c!12033 () Bool)

(assert (=> b!263456 (= c!12033 (not (= (size!6417 (buf!6885 w1!584)) #b00000000000000000000000000000000)))))

(assert (= (and start!57472 res!220375) b!263451))

(assert (= (and b!263451 res!220374) b!263452))

(assert (= (and b!263451 (not res!220373)) b!263456))

(assert (= (and b!263456 c!12033) b!263449))

(assert (= (and b!263456 (not c!12033)) b!263454))

(assert (= (and b!263456 (not res!220372)) b!263450))

(assert (= start!57472 b!263453))

(assert (= start!57472 b!263455))

(declare-fun m!393749 () Bool)

(assert (=> b!263455 m!393749))

(declare-fun m!393751 () Bool)

(assert (=> b!263453 m!393751))

(declare-fun m!393753 () Bool)

(assert (=> start!57472 m!393753))

(declare-fun m!393755 () Bool)

(assert (=> start!57472 m!393755))

(declare-fun m!393757 () Bool)

(assert (=> start!57472 m!393757))

(declare-fun m!393759 () Bool)

(assert (=> b!263451 m!393759))

(declare-fun m!393761 () Bool)

(assert (=> b!263451 m!393761))

(declare-fun m!393763 () Bool)

(assert (=> b!263451 m!393763))

(declare-fun m!393765 () Bool)

(assert (=> b!263451 m!393765))

(declare-fun m!393767 () Bool)

(assert (=> b!263451 m!393767))

(declare-fun m!393769 () Bool)

(assert (=> b!263451 m!393769))

(declare-fun m!393771 () Bool)

(assert (=> b!263450 m!393771))

(assert (=> b!263452 m!393771))

(assert (=> b!263452 m!393771))

(declare-fun m!393773 () Bool)

(assert (=> b!263452 m!393773))

(assert (=> b!263449 m!393771))

(declare-fun m!393775 () Bool)

(assert (=> b!263449 m!393775))

(declare-fun m!393777 () Bool)

(assert (=> b!263449 m!393777))

(push 1)

(assert (not b!263455))

(assert (not b!263450))

(assert (not b!263453))

(assert (not b!263449))

(assert (not start!57472))

(assert (not b!263452))

(assert (not b!263451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88896 () Bool)

(assert (=> d!88896 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404930 () Unit!18782)

(declare-fun choose!11 (BitStream!11648) Unit!18782)

(assert (=> d!88896 (= lt!404930 (choose!11 w2!580))))

(assert (=> d!88896 (= (lemmaIsPrefixRefl!0 w2!580) lt!404930)))

(declare-fun bs!22558 () Bool)

(assert (= bs!22558 d!88896))

(assert (=> bs!22558 m!393767))

(declare-fun m!393779 () Bool)

(assert (=> bs!22558 m!393779))

(assert (=> b!263451 d!88896))

(declare-fun d!88902 () Bool)

(declare-fun res!220383 () Bool)

(declare-fun e!183687 () Bool)

(assert (=> d!88902 (=> (not res!220383) (not e!183687))))

(assert (=> d!88902 (= res!220383 (= (size!6417 (buf!6885 lt!404926)) (size!6417 (buf!6885 lt!404926))))))

(assert (=> d!88902 (= (isPrefixOf!0 lt!404926 lt!404926) e!183687)))

(declare-fun b!263463 () Bool)

(declare-fun res!220382 () Bool)

(assert (=> b!263463 (=> (not res!220382) (not e!183687))))

(assert (=> b!263463 (= res!220382 (bvsle (bitIndex!0 (size!6417 (buf!6885 lt!404926)) (currentByte!12743 lt!404926) (currentBit!12738 lt!404926)) (bitIndex!0 (size!6417 (buf!6885 lt!404926)) (currentByte!12743 lt!404926) (currentBit!12738 lt!404926))))))

(declare-fun b!263464 () Bool)

(declare-fun e!183686 () Bool)

(assert (=> b!263464 (= e!183687 e!183686)))

(declare-fun res!220384 () Bool)

(assert (=> b!263464 (=> res!220384 e!183686)))

(assert (=> b!263464 (= res!220384 (= (size!6417 (buf!6885 lt!404926)) #b00000000000000000000000000000000))))

(declare-fun b!263465 () Bool)

(assert (=> b!263465 (= e!183686 (arrayBitRangesEq!0 (buf!6885 lt!404926) (buf!6885 lt!404926) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6417 (buf!6885 lt!404926)) (currentByte!12743 lt!404926) (currentBit!12738 lt!404926))))))

(assert (= (and d!88902 res!220383) b!263463))

(assert (= (and b!263463 res!220382) b!263464))

(assert (= (and b!263464 (not res!220384)) b!263465))

(declare-fun m!393783 () Bool)

(assert (=> b!263463 m!393783))

(assert (=> b!263463 m!393783))

(assert (=> b!263465 m!393783))

(assert (=> b!263465 m!393783))

(declare-fun m!393785 () Bool)

(assert (=> b!263465 m!393785))

(assert (=> b!263451 d!88902))

(declare-fun d!88906 () Bool)

(assert (=> d!88906 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404934 () Unit!18782)

(assert (=> d!88906 (= lt!404934 (choose!11 w1!584))))

(assert (=> d!88906 (= (lemmaIsPrefixRefl!0 w1!584) lt!404934)))

(declare-fun bs!22561 () Bool)

(assert (= bs!22561 d!88906))

(assert (=> bs!22561 m!393763))

(declare-fun m!393787 () Bool)

(assert (=> bs!22561 m!393787))

(assert (=> b!263451 d!88906))

(declare-fun d!88908 () Bool)

(assert (=> d!88908 (isPrefixOf!0 lt!404926 lt!404926)))

(declare-fun lt!404935 () Unit!18782)

(assert (=> d!88908 (= lt!404935 (choose!11 lt!404926))))

(assert (=> d!88908 (= (lemmaIsPrefixRefl!0 lt!404926) lt!404935)))

(declare-fun bs!22562 () Bool)

(assert (= bs!22562 d!88908))

(assert (=> bs!22562 m!393769))

(declare-fun m!393789 () Bool)

(assert (=> bs!22562 m!393789))

(assert (=> b!263451 d!88908))

(declare-fun d!88910 () Bool)

(declare-fun res!220392 () Bool)

(declare-fun e!183693 () Bool)

(assert (=> d!88910 (=> (not res!220392) (not e!183693))))

(assert (=> d!88910 (= res!220392 (= (size!6417 (buf!6885 w1!584)) (size!6417 (buf!6885 w1!584))))))

(assert (=> d!88910 (= (isPrefixOf!0 w1!584 w1!584) e!183693)))

(declare-fun b!263472 () Bool)

(declare-fun res!220391 () Bool)

(assert (=> b!263472 (=> (not res!220391) (not e!183693))))

(assert (=> b!263472 (= res!220391 (bvsle (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584)) (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584))))))

(declare-fun b!263473 () Bool)

(declare-fun e!183692 () Bool)

(assert (=> b!263473 (= e!183693 e!183692)))

(declare-fun res!220393 () Bool)

(assert (=> b!263473 (=> res!220393 e!183692)))

(assert (=> b!263473 (= res!220393 (= (size!6417 (buf!6885 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263474 () Bool)

(assert (=> b!263474 (= e!183692 (arrayBitRangesEq!0 (buf!6885 w1!584) (buf!6885 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584))))))

(assert (= (and d!88910 res!220392) b!263472))

(assert (= (and b!263472 res!220391) b!263473))

(assert (= (and b!263473 (not res!220393)) b!263474))

(assert (=> b!263472 m!393771))

(assert (=> b!263472 m!393771))

(assert (=> b!263474 m!393771))

(assert (=> b!263474 m!393771))

(declare-fun m!393791 () Bool)

(assert (=> b!263474 m!393791))

(assert (=> b!263451 d!88910))

(declare-fun d!88912 () Bool)

(declare-fun res!220397 () Bool)

(declare-fun e!183697 () Bool)

(assert (=> d!88912 (=> (not res!220397) (not e!183697))))

(assert (=> d!88912 (= res!220397 (= (size!6417 (buf!6885 w2!580)) (size!6417 (buf!6885 w2!580))))))

(assert (=> d!88912 (= (isPrefixOf!0 w2!580 w2!580) e!183697)))

(declare-fun b!263475 () Bool)

(declare-fun res!220396 () Bool)

(assert (=> b!263475 (=> (not res!220396) (not e!183697))))

(assert (=> b!263475 (= res!220396 (bvsle (bitIndex!0 (size!6417 (buf!6885 w2!580)) (currentByte!12743 w2!580) (currentBit!12738 w2!580)) (bitIndex!0 (size!6417 (buf!6885 w2!580)) (currentByte!12743 w2!580) (currentBit!12738 w2!580))))))

(declare-fun b!263476 () Bool)

(declare-fun e!183696 () Bool)

(assert (=> b!263476 (= e!183697 e!183696)))

(declare-fun res!220398 () Bool)

(assert (=> b!263476 (=> res!220398 e!183696)))

(assert (=> b!263476 (= res!220398 (= (size!6417 (buf!6885 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!263477 () Bool)

(assert (=> b!263477 (= e!183696 (arrayBitRangesEq!0 (buf!6885 w2!580) (buf!6885 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6417 (buf!6885 w2!580)) (currentByte!12743 w2!580) (currentBit!12738 w2!580))))))

(assert (= (and d!88912 res!220397) b!263475))

(assert (= (and b!263475 res!220396) b!263476))

(assert (= (and b!263476 (not res!220398)) b!263477))

(declare-fun m!393793 () Bool)

(assert (=> b!263475 m!393793))

(assert (=> b!263475 m!393793))

(assert (=> b!263477 m!393793))

(assert (=> b!263477 m!393793))

(declare-fun m!393795 () Bool)

(assert (=> b!263477 m!393795))

(assert (=> b!263451 d!88912))

(declare-fun d!88914 () Bool)

(declare-fun res!220402 () Bool)

(declare-fun e!183699 () Bool)

(assert (=> d!88914 (=> (not res!220402) (not e!183699))))

(assert (=> d!88914 (= res!220402 (= (size!6417 (buf!6885 w1!584)) (size!6417 (buf!6885 w2!580))))))

(assert (=> d!88914 (= (isPrefixOf!0 w1!584 w2!580) e!183699)))

(declare-fun b!263482 () Bool)

(declare-fun res!220401 () Bool)

(assert (=> b!263482 (=> (not res!220401) (not e!183699))))

(assert (=> b!263482 (= res!220401 (bvsle (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584)) (bitIndex!0 (size!6417 (buf!6885 w2!580)) (currentByte!12743 w2!580) (currentBit!12738 w2!580))))))

(declare-fun b!263483 () Bool)

(declare-fun e!183698 () Bool)

(assert (=> b!263483 (= e!183699 e!183698)))

(declare-fun res!220403 () Bool)

(assert (=> b!263483 (=> res!220403 e!183698)))

(assert (=> b!263483 (= res!220403 (= (size!6417 (buf!6885 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263484 () Bool)

(assert (=> b!263484 (= e!183698 (arrayBitRangesEq!0 (buf!6885 w1!584) (buf!6885 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584))))))

(assert (= (and d!88914 res!220402) b!263482))

(assert (= (and b!263482 res!220401) b!263483))

(assert (= (and b!263483 (not res!220403)) b!263484))

(assert (=> b!263482 m!393771))

(assert (=> b!263482 m!393793))

(assert (=> b!263484 m!393771))

(assert (=> b!263484 m!393771))

(assert (=> b!263484 m!393773))

(assert (=> start!57472 d!88914))

(declare-fun d!88916 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88916 (= (inv!12 w1!584) (invariant!0 (currentBit!12738 w1!584) (currentByte!12743 w1!584) (size!6417 (buf!6885 w1!584))))))

(declare-fun bs!22565 () Bool)

(assert (= bs!22565 d!88916))

(declare-fun m!393805 () Bool)

(assert (=> bs!22565 m!393805))

(assert (=> start!57472 d!88916))

(declare-fun d!88924 () Bool)

(assert (=> d!88924 (= (inv!12 w2!580) (invariant!0 (currentBit!12738 w2!580) (currentByte!12743 w2!580) (size!6417 (buf!6885 w2!580))))))

(declare-fun bs!22566 () Bool)

(assert (= bs!22566 d!88924))

(declare-fun m!393809 () Bool)

(assert (=> bs!22566 m!393809))

(assert (=> start!57472 d!88924))

(declare-fun d!88928 () Bool)

(declare-fun res!220445 () Bool)

(declare-fun e!183734 () Bool)

(assert (=> d!88928 (=> res!220445 e!183734)))

(assert (=> d!88928 (= res!220445 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584))))))

(assert (=> d!88928 (= (arrayBitRangesEq!0 (buf!6885 w1!584) (buf!6885 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584))) e!183734)))

(declare-fun b!263530 () Bool)

(declare-fun e!183739 () Bool)

(assert (=> b!263530 (= e!183734 e!183739)))

(declare-fun res!220442 () Bool)

(assert (=> b!263530 (=> (not res!220442) (not e!183739))))

(declare-fun e!183738 () Bool)

(assert (=> b!263530 (= res!220442 e!183738)))

(declare-fun res!220444 () Bool)

(assert (=> b!263530 (=> res!220444 e!183738)))

(declare-datatypes ((tuple4!334 0))(
  ( (tuple4!335 (_1!12147 (_ BitVec 32)) (_2!12147 (_ BitVec 32)) (_3!947 (_ BitVec 32)) (_4!167 (_ BitVec 32))) )
))
(declare-fun lt!404991 () tuple4!334)

(assert (=> b!263530 (= res!220444 (bvsge (_1!12147 lt!404991) (_2!12147 lt!404991)))))

(declare-fun lt!404990 () (_ BitVec 32))

(assert (=> b!263530 (= lt!404990 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!404989 () (_ BitVec 32))

(assert (=> b!263530 (= lt!404989 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!334)

(assert (=> b!263530 (= lt!404991 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584))))))

(declare-fun b!263531 () Bool)

(declare-fun arrayRangesEq!1003 (array!14703 array!14703 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263531 (= e!183738 (arrayRangesEq!1003 (buf!6885 w1!584) (buf!6885 w2!580) (_1!12147 lt!404991) (_2!12147 lt!404991)))))

(declare-fun b!263532 () Bool)

(declare-fun e!183737 () Bool)

(declare-fun call!4051 () Bool)

(assert (=> b!263532 (= e!183737 call!4051)))

(declare-fun bm!4048 () Bool)

(declare-fun c!12038 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4048 (= call!4051 (byteRangesEq!0 (ite c!12038 (select (arr!7404 (buf!6885 w1!584)) (_3!947 lt!404991)) (select (arr!7404 (buf!6885 w1!584)) (_4!167 lt!404991))) (ite c!12038 (select (arr!7404 (buf!6885 w2!580)) (_3!947 lt!404991)) (select (arr!7404 (buf!6885 w2!580)) (_4!167 lt!404991))) (ite c!12038 lt!404989 #b00000000000000000000000000000000) lt!404990))))

(declare-fun b!263533 () Bool)

(declare-fun e!183736 () Bool)

(assert (=> b!263533 (= e!183739 e!183736)))

(assert (=> b!263533 (= c!12038 (= (_3!947 lt!404991) (_4!167 lt!404991)))))

(declare-fun b!263534 () Bool)

(declare-fun res!220443 () Bool)

(assert (=> b!263534 (= res!220443 (= lt!404990 #b00000000000000000000000000000000))))

(assert (=> b!263534 (=> res!220443 e!183737)))

(declare-fun e!183735 () Bool)

(assert (=> b!263534 (= e!183735 e!183737)))

(declare-fun b!263535 () Bool)

(assert (=> b!263535 (= e!183736 e!183735)))

(declare-fun res!220441 () Bool)

(assert (=> b!263535 (= res!220441 (byteRangesEq!0 (select (arr!7404 (buf!6885 w1!584)) (_3!947 lt!404991)) (select (arr!7404 (buf!6885 w2!580)) (_3!947 lt!404991)) lt!404989 #b00000000000000000000000000001000))))

(assert (=> b!263535 (=> (not res!220441) (not e!183735))))

(declare-fun b!263536 () Bool)

(assert (=> b!263536 (= e!183736 call!4051)))

(assert (= (and d!88928 (not res!220445)) b!263530))

(assert (= (and b!263530 (not res!220444)) b!263531))

(assert (= (and b!263530 res!220442) b!263533))

(assert (= (and b!263533 c!12038) b!263536))

(assert (= (and b!263533 (not c!12038)) b!263535))

(assert (= (and b!263535 res!220441) b!263534))

(assert (= (and b!263534 (not res!220443)) b!263532))

(assert (= (or b!263536 b!263532) bm!4048))

(assert (=> b!263530 m!393771))

(declare-fun m!393825 () Bool)

(assert (=> b!263530 m!393825))

(declare-fun m!393827 () Bool)

(assert (=> b!263531 m!393827))

(declare-fun m!393829 () Bool)

(assert (=> bm!4048 m!393829))

(declare-fun m!393831 () Bool)

(assert (=> bm!4048 m!393831))

(declare-fun m!393833 () Bool)

(assert (=> bm!4048 m!393833))

(declare-fun m!393835 () Bool)

(assert (=> bm!4048 m!393835))

(declare-fun m!393837 () Bool)

(assert (=> bm!4048 m!393837))

(assert (=> b!263535 m!393835))

(assert (=> b!263535 m!393831))

(assert (=> b!263535 m!393835))

(assert (=> b!263535 m!393831))

(declare-fun m!393839 () Bool)

(assert (=> b!263535 m!393839))

(assert (=> b!263452 d!88928))

(declare-fun d!88940 () Bool)

(declare-fun e!183782 () Bool)

(assert (=> d!88940 e!183782))

(declare-fun res!220491 () Bool)

(assert (=> d!88940 (=> (not res!220491) (not e!183782))))

(declare-fun lt!405028 () (_ BitVec 64))

(declare-fun lt!405030 () (_ BitVec 64))

(declare-fun lt!405026 () (_ BitVec 64))

(assert (=> d!88940 (= res!220491 (= lt!405030 (bvsub lt!405028 lt!405026)))))

(assert (=> d!88940 (or (= (bvand lt!405028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!405026 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!405028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!405028 lt!405026) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88940 (= lt!405026 (remainingBits!0 ((_ sign_extend 32) (size!6417 (buf!6885 w1!584))) ((_ sign_extend 32) (currentByte!12743 w1!584)) ((_ sign_extend 32) (currentBit!12738 w1!584))))))

(declare-fun lt!405031 () (_ BitVec 64))

(declare-fun lt!405027 () (_ BitVec 64))

(assert (=> d!88940 (= lt!405028 (bvmul lt!405031 lt!405027))))

(assert (=> d!88940 (or (= lt!405031 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!405027 (bvsdiv (bvmul lt!405031 lt!405027) lt!405031)))))

(assert (=> d!88940 (= lt!405027 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88940 (= lt!405031 ((_ sign_extend 32) (size!6417 (buf!6885 w1!584))))))

(assert (=> d!88940 (= lt!405030 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12743 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12738 w1!584))))))

(assert (=> d!88940 (invariant!0 (currentBit!12738 w1!584) (currentByte!12743 w1!584) (size!6417 (buf!6885 w1!584)))))

(assert (=> d!88940 (= (bitIndex!0 (size!6417 (buf!6885 w1!584)) (currentByte!12743 w1!584) (currentBit!12738 w1!584)) lt!405030)))

(declare-fun b!263591 () Bool)

(declare-fun res!220490 () Bool)

(assert (=> b!263591 (=> (not res!220490) (not e!183782))))

(assert (=> b!263591 (= res!220490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405030))))

(declare-fun b!263592 () Bool)

(declare-fun lt!405029 () (_ BitVec 64))

(assert (=> b!263592 (= e!183782 (bvsle lt!405030 (bvmul lt!405029 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263592 (or (= lt!405029 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!405029 #b0000000000000000000000000000000000000000000000000000000000001000) lt!405029)))))

(assert (=> b!263592 (= lt!405029 ((_ sign_extend 32) (size!6417 (buf!6885 w1!584))))))

(assert (= (and d!88940 res!220491) b!263591))

(assert (= (and b!263591 res!220490) b!263592))

(declare-fun m!393903 () Bool)

(assert (=> d!88940 m!393903))

(assert (=> d!88940 m!393805))

(assert (=> b!263452 d!88940))

(declare-fun d!88968 () Bool)

(assert (=> d!88968 (= (array_inv!6141 (buf!6885 w1!584)) (bvsge (size!6417 (buf!6885 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!263453 d!88968))

(assert (=> b!263449 d!88940))

(declare-fun d!88974 () Bool)

(assert (=> d!88974 (arrayBitRangesEq!0 (buf!6885 w2!580) (buf!6885 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404924)))

(declare-fun lt!405038 () Unit!18782)

(declare-fun choose!8 (array!14703 array!14703 (_ BitVec 64) (_ BitVec 64)) Unit!18782)

(assert (=> d!88974 (= lt!405038 (choose!8 (buf!6885 w1!584) (buf!6885 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404924))))

(assert (=> d!88974 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404924))))

(assert (=> d!88974 (= (arrayBitRangesEqSymmetric!0 (buf!6885 w1!584) (buf!6885 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404924) lt!405038)))

(declare-fun bs!22577 () Bool)

(assert (= bs!22577 d!88974))

(assert (=> bs!22577 m!393777))

(declare-fun m!393929 () Bool)

(assert (=> bs!22577 m!393929))

(assert (=> b!263449 d!88974))

(declare-fun d!88980 () Bool)

(declare-fun res!220507 () Bool)

(declare-fun e!183793 () Bool)

(assert (=> d!88980 (=> res!220507 e!183793)))

(assert (=> d!88980 (= res!220507 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!404924))))

(assert (=> d!88980 (= (arrayBitRangesEq!0 (buf!6885 w2!580) (buf!6885 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404924) e!183793)))

(declare-fun b!263606 () Bool)

(declare-fun e!183798 () Bool)

(assert (=> b!263606 (= e!183793 e!183798)))

(declare-fun res!220504 () Bool)

(assert (=> b!263606 (=> (not res!220504) (not e!183798))))

(declare-fun e!183797 () Bool)

(assert (=> b!263606 (= res!220504 e!183797)))

(declare-fun res!220506 () Bool)

(assert (=> b!263606 (=> res!220506 e!183797)))

(declare-fun lt!405041 () tuple4!334)

(assert (=> b!263606 (= res!220506 (bvsge (_1!12147 lt!405041) (_2!12147 lt!405041)))))

(declare-fun lt!405040 () (_ BitVec 32))

(assert (=> b!263606 (= lt!405040 ((_ extract 31 0) (bvsrem lt!404924 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405039 () (_ BitVec 32))

(assert (=> b!263606 (= lt!405039 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263606 (= lt!405041 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!404924))))

(declare-fun b!263607 () Bool)

(assert (=> b!263607 (= e!183797 (arrayRangesEq!1003 (buf!6885 w2!580) (buf!6885 w1!584) (_1!12147 lt!405041) (_2!12147 lt!405041)))))

(declare-fun b!263608 () Bool)

(declare-fun e!183796 () Bool)

(declare-fun call!4058 () Bool)

(assert (=> b!263608 (= e!183796 call!4058)))

(declare-fun c!12045 () Bool)

(declare-fun bm!4055 () Bool)

(assert (=> bm!4055 (= call!4058 (byteRangesEq!0 (ite c!12045 (select (arr!7404 (buf!6885 w2!580)) (_3!947 lt!405041)) (select (arr!7404 (buf!6885 w2!580)) (_4!167 lt!405041))) (ite c!12045 (select (arr!7404 (buf!6885 w1!584)) (_3!947 lt!405041)) (select (arr!7404 (buf!6885 w1!584)) (_4!167 lt!405041))) (ite c!12045 lt!405039 #b00000000000000000000000000000000) lt!405040))))

(declare-fun b!263609 () Bool)

(declare-fun e!183795 () Bool)

(assert (=> b!263609 (= e!183798 e!183795)))

(assert (=> b!263609 (= c!12045 (= (_3!947 lt!405041) (_4!167 lt!405041)))))

(declare-fun b!263610 () Bool)

(declare-fun res!220505 () Bool)

(assert (=> b!263610 (= res!220505 (= lt!405040 #b00000000000000000000000000000000))))

(assert (=> b!263610 (=> res!220505 e!183796)))

(declare-fun e!183794 () Bool)

(assert (=> b!263610 (= e!183794 e!183796)))

(declare-fun b!263611 () Bool)

(assert (=> b!263611 (= e!183795 e!183794)))

(declare-fun res!220503 () Bool)

(assert (=> b!263611 (= res!220503 (byteRangesEq!0 (select (arr!7404 (buf!6885 w2!580)) (_3!947 lt!405041)) (select (arr!7404 (buf!6885 w1!584)) (_3!947 lt!405041)) lt!405039 #b00000000000000000000000000001000))))

(assert (=> b!263611 (=> (not res!220503) (not e!183794))))

(declare-fun b!263612 () Bool)

(assert (=> b!263612 (= e!183795 call!4058)))

(assert (= (and d!88980 (not res!220507)) b!263606))

(assert (= (and b!263606 (not res!220506)) b!263607))

(assert (= (and b!263606 res!220504) b!263609))

(assert (= (and b!263609 c!12045) b!263612))

(assert (= (and b!263609 (not c!12045)) b!263611))

(assert (= (and b!263611 res!220503) b!263610))

(assert (= (and b!263610 (not res!220505)) b!263608))

(assert (= (or b!263612 b!263608) bm!4055))

(declare-fun m!393931 () Bool)

(assert (=> b!263606 m!393931))

(declare-fun m!393933 () Bool)

(assert (=> b!263607 m!393933))

(declare-fun m!393935 () Bool)

(assert (=> bm!4055 m!393935))

(declare-fun m!393937 () Bool)

(assert (=> bm!4055 m!393937))

(declare-fun m!393939 () Bool)

(assert (=> bm!4055 m!393939))

(declare-fun m!393941 () Bool)

(assert (=> bm!4055 m!393941))

(declare-fun m!393943 () Bool)

(assert (=> bm!4055 m!393943))

(assert (=> b!263611 m!393941))

(assert (=> b!263611 m!393937))

(assert (=> b!263611 m!393941))

(assert (=> b!263611 m!393937))

(declare-fun m!393945 () Bool)

(assert (=> b!263611 m!393945))

(assert (=> b!263449 d!88980))

(declare-fun d!88982 () Bool)

(assert (=> d!88982 (= (array_inv!6141 (buf!6885 w2!580)) (bvsge (size!6417 (buf!6885 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!263455 d!88982))

(assert (=> b!263450 d!88940))

(push 1)

(assert (not b!263607))

(assert (not d!88916))

(assert (not b!263531))

(assert (not d!88924))

(assert (not d!88974))

(assert (not d!88908))

(assert (not b!263463))

(assert (not d!88896))

(assert (not b!263475))

(assert (not d!88940))

(assert (not b!263611))

(assert (not b!263530))

(assert (not b!263465))

(assert (not b!263474))

(assert (not b!263484))

(assert (not bm!4048))

(assert (not b!263477))

(assert (not b!263482))

(assert (not b!263472))

(assert (not d!88906))

(assert (not b!263535))

(assert (not bm!4055))

(assert (not b!263606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

