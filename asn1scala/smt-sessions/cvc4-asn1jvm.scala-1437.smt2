; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39444 () Bool)

(assert start!39444)

(declare-fun b!177523 () Bool)

(declare-fun e!123706 () Bool)

(declare-fun e!123708 () Bool)

(assert (=> b!177523 (= e!123706 e!123708)))

(declare-fun res!147174 () Bool)

(assert (=> b!177523 (=> (not res!147174) (not e!123708))))

(declare-fun lt!272541 () (_ BitVec 64))

(declare-fun lt!272538 () (_ BitVec 64))

(assert (=> b!177523 (= res!147174 (= lt!272541 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272538)))))

(declare-datatypes ((array!9585 0))(
  ( (array!9586 (arr!5157 (Array (_ BitVec 32) (_ BitVec 8))) (size!4227 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7562 0))(
  ( (BitStream!7563 (buf!4670 array!9585) (currentByte!8850 (_ BitVec 32)) (currentBit!8845 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12768 0))(
  ( (Unit!12769) )
))
(declare-datatypes ((tuple2!15304 0))(
  ( (tuple2!15305 (_1!8297 Unit!12768) (_2!8297 BitStream!7562)) )
))
(declare-fun lt!272539 () tuple2!15304)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177523 (= lt!272541 (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272539))) (currentByte!8850 (_2!8297 lt!272539)) (currentBit!8845 (_2!8297 lt!272539))))))

(declare-fun thiss!1204 () BitStream!7562)

(assert (=> b!177523 (= lt!272538 (bitIndex!0 (size!4227 (buf!4670 thiss!1204)) (currentByte!8850 thiss!1204) (currentBit!8845 thiss!1204)))))

(declare-fun b!177524 () Bool)

(declare-fun e!123705 () Bool)

(declare-fun lt!272537 () tuple2!15304)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177524 (= e!123705 (invariant!0 (currentBit!8845 (_2!8297 lt!272537)) (currentByte!8850 (_2!8297 lt!272537)) (size!4227 (buf!4670 (_2!8297 lt!272537)))))))

(declare-fun isPrefixOf!0 (BitStream!7562 BitStream!7562) Bool)

(assert (=> b!177524 (isPrefixOf!0 thiss!1204 (_2!8297 lt!272537))))

(declare-fun lt!272540 () Unit!12768)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7562 BitStream!7562 BitStream!7562) Unit!12768)

(assert (=> b!177524 (= lt!272540 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8297 lt!272539) (_2!8297 lt!272537)))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7562 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15304)

(assert (=> b!177524 (= lt!272537 (appendBitsLSBFirstLoopTR!0 (_2!8297 lt!272539) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!177525 () Bool)

(declare-fun res!147170 () Bool)

(declare-fun e!123707 () Bool)

(assert (=> b!177525 (=> (not res!147170) (not e!123707))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177525 (= res!147170 (validate_offset_bits!1 ((_ sign_extend 32) (size!4227 (buf!4670 thiss!1204))) ((_ sign_extend 32) (currentByte!8850 thiss!1204)) ((_ sign_extend 32) (currentBit!8845 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177526 () Bool)

(declare-fun res!147175 () Bool)

(assert (=> b!177526 (=> (not res!147175) (not e!123707))))

(assert (=> b!177526 (= res!147175 (not (= i!590 nBits!348)))))

(declare-fun b!177527 () Bool)

(declare-fun e!123704 () Bool)

(declare-datatypes ((tuple2!15306 0))(
  ( (tuple2!15307 (_1!8298 BitStream!7562) (_2!8298 Bool)) )
))
(declare-fun lt!272542 () tuple2!15306)

(assert (=> b!177527 (= e!123704 (= (bitIndex!0 (size!4227 (buf!4670 (_1!8298 lt!272542))) (currentByte!8850 (_1!8298 lt!272542)) (currentBit!8845 (_1!8298 lt!272542))) lt!272541))))

(declare-fun b!177528 () Bool)

(assert (=> b!177528 (= e!123708 e!123704)))

(declare-fun res!147176 () Bool)

(assert (=> b!177528 (=> (not res!147176) (not e!123704))))

(declare-fun lt!272543 () Bool)

(assert (=> b!177528 (= res!147176 (and (= (_2!8298 lt!272542) lt!272543) (= (_1!8298 lt!272542) (_2!8297 lt!272539))))))

(declare-fun readBitPure!0 (BitStream!7562) tuple2!15306)

(declare-fun readerFrom!0 (BitStream!7562 (_ BitVec 32) (_ BitVec 32)) BitStream!7562)

(assert (=> b!177528 (= lt!272542 (readBitPure!0 (readerFrom!0 (_2!8297 lt!272539) (currentBit!8845 thiss!1204) (currentByte!8850 thiss!1204))))))

(declare-fun b!177529 () Bool)

(declare-fun res!147172 () Bool)

(assert (=> b!177529 (=> (not res!147172) (not e!123707))))

(assert (=> b!177529 (= res!147172 (invariant!0 (currentBit!8845 thiss!1204) (currentByte!8850 thiss!1204) (size!4227 (buf!4670 thiss!1204))))))

(declare-fun b!177522 () Bool)

(declare-fun e!123703 () Bool)

(declare-fun array_inv!3968 (array!9585) Bool)

(assert (=> b!177522 (= e!123703 (array_inv!3968 (buf!4670 thiss!1204)))))

(declare-fun res!147171 () Bool)

(assert (=> start!39444 (=> (not res!147171) (not e!123707))))

(assert (=> start!39444 (= res!147171 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39444 e!123707))

(assert (=> start!39444 true))

(declare-fun inv!12 (BitStream!7562) Bool)

(assert (=> start!39444 (and (inv!12 thiss!1204) e!123703)))

(declare-fun b!177530 () Bool)

(declare-fun res!147173 () Bool)

(assert (=> b!177530 (=> (not res!147173) (not e!123708))))

(assert (=> b!177530 (= res!147173 (isPrefixOf!0 thiss!1204 (_2!8297 lt!272539)))))

(declare-fun b!177531 () Bool)

(assert (=> b!177531 (= e!123707 (not e!123705))))

(declare-fun res!147177 () Bool)

(assert (=> b!177531 (=> res!147177 e!123705)))

(assert (=> b!177531 (= res!147177 (not (= (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272539))) (currentByte!8850 (_2!8297 lt!272539)) (currentBit!8845 (_2!8297 lt!272539))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4227 (buf!4670 thiss!1204)) (currentByte!8850 thiss!1204) (currentBit!8845 thiss!1204))))))))

(assert (=> b!177531 e!123706))

(declare-fun res!147169 () Bool)

(assert (=> b!177531 (=> (not res!147169) (not e!123706))))

(assert (=> b!177531 (= res!147169 (= (size!4227 (buf!4670 thiss!1204)) (size!4227 (buf!4670 (_2!8297 lt!272539)))))))

(declare-fun appendBit!0 (BitStream!7562 Bool) tuple2!15304)

(assert (=> b!177531 (= lt!272539 (appendBit!0 thiss!1204 lt!272543))))

(assert (=> b!177531 (= lt!272543 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39444 res!147171) b!177525))

(assert (= (and b!177525 res!147170) b!177529))

(assert (= (and b!177529 res!147172) b!177526))

(assert (= (and b!177526 res!147175) b!177531))

(assert (= (and b!177531 res!147169) b!177523))

(assert (= (and b!177523 res!147174) b!177530))

(assert (= (and b!177530 res!147173) b!177528))

(assert (= (and b!177528 res!147176) b!177527))

(assert (= (and b!177531 (not res!147177)) b!177524))

(assert (= start!39444 b!177522))

(declare-fun m!277417 () Bool)

(assert (=> b!177527 m!277417))

(declare-fun m!277419 () Bool)

(assert (=> b!177529 m!277419))

(declare-fun m!277421 () Bool)

(assert (=> start!39444 m!277421))

(declare-fun m!277423 () Bool)

(assert (=> b!177530 m!277423))

(declare-fun m!277425 () Bool)

(assert (=> b!177531 m!277425))

(declare-fun m!277427 () Bool)

(assert (=> b!177531 m!277427))

(declare-fun m!277429 () Bool)

(assert (=> b!177531 m!277429))

(declare-fun m!277431 () Bool)

(assert (=> b!177522 m!277431))

(declare-fun m!277433 () Bool)

(assert (=> b!177525 m!277433))

(assert (=> b!177523 m!277425))

(assert (=> b!177523 m!277427))

(declare-fun m!277435 () Bool)

(assert (=> b!177524 m!277435))

(declare-fun m!277437 () Bool)

(assert (=> b!177524 m!277437))

(declare-fun m!277439 () Bool)

(assert (=> b!177524 m!277439))

(declare-fun m!277441 () Bool)

(assert (=> b!177524 m!277441))

(declare-fun m!277443 () Bool)

(assert (=> b!177528 m!277443))

(assert (=> b!177528 m!277443))

(declare-fun m!277445 () Bool)

(assert (=> b!177528 m!277445))

(push 1)

(assert (not b!177522))

(assert (not b!177530))

(assert (not b!177524))

(assert (not b!177523))

(assert (not b!177528))

(assert (not b!177527))

(assert (not b!177529))

(assert (not b!177531))

(assert (not b!177525))

(assert (not start!39444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62471 () Bool)

(assert (=> d!62471 (= (array_inv!3968 (buf!4670 thiss!1204)) (bvsge (size!4227 (buf!4670 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!177522 d!62471))

(declare-fun d!62473 () Bool)

(declare-fun e!123741 () Bool)

(assert (=> d!62473 e!123741))

(declare-fun res!147231 () Bool)

(assert (=> d!62473 (=> (not res!147231) (not e!123741))))

(declare-fun lt!272610 () (_ BitVec 64))

(declare-fun lt!272614 () (_ BitVec 64))

(declare-fun lt!272611 () (_ BitVec 64))

(assert (=> d!62473 (= res!147231 (= lt!272611 (bvsub lt!272610 lt!272614)))))

(assert (=> d!62473 (or (= (bvand lt!272610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272614 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272610 lt!272614) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62473 (= lt!272614 (remainingBits!0 ((_ sign_extend 32) (size!4227 (buf!4670 (_1!8298 lt!272542)))) ((_ sign_extend 32) (currentByte!8850 (_1!8298 lt!272542))) ((_ sign_extend 32) (currentBit!8845 (_1!8298 lt!272542)))))))

(declare-fun lt!272612 () (_ BitVec 64))

(declare-fun lt!272615 () (_ BitVec 64))

(assert (=> d!62473 (= lt!272610 (bvmul lt!272612 lt!272615))))

(assert (=> d!62473 (or (= lt!272612 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272615 (bvsdiv (bvmul lt!272612 lt!272615) lt!272612)))))

(assert (=> d!62473 (= lt!272615 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62473 (= lt!272612 ((_ sign_extend 32) (size!4227 (buf!4670 (_1!8298 lt!272542)))))))

(assert (=> d!62473 (= lt!272611 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8850 (_1!8298 lt!272542))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8845 (_1!8298 lt!272542)))))))

(assert (=> d!62473 (invariant!0 (currentBit!8845 (_1!8298 lt!272542)) (currentByte!8850 (_1!8298 lt!272542)) (size!4227 (buf!4670 (_1!8298 lt!272542))))))

(assert (=> d!62473 (= (bitIndex!0 (size!4227 (buf!4670 (_1!8298 lt!272542))) (currentByte!8850 (_1!8298 lt!272542)) (currentBit!8845 (_1!8298 lt!272542))) lt!272611)))

(declare-fun b!177585 () Bool)

(declare-fun res!147232 () Bool)

(assert (=> b!177585 (=> (not res!147232) (not e!123741))))

(assert (=> b!177585 (= res!147232 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272611))))

(declare-fun b!177586 () Bool)

(declare-fun lt!272613 () (_ BitVec 64))

(assert (=> b!177586 (= e!123741 (bvsle lt!272611 (bvmul lt!272613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177586 (or (= lt!272613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272613)))))

(assert (=> b!177586 (= lt!272613 ((_ sign_extend 32) (size!4227 (buf!4670 (_1!8298 lt!272542)))))))

(assert (= (and d!62473 res!147231) b!177585))

(assert (= (and b!177585 res!147232) b!177586))

(declare-fun m!277483 () Bool)

(assert (=> d!62473 m!277483))

(declare-fun m!277485 () Bool)

(assert (=> d!62473 m!277485))

(assert (=> b!177527 d!62473))

(declare-fun d!62479 () Bool)

(assert (=> d!62479 (= (invariant!0 (currentBit!8845 thiss!1204) (currentByte!8850 thiss!1204) (size!4227 (buf!4670 thiss!1204))) (and (bvsge (currentBit!8845 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8845 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8850 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8850 thiss!1204) (size!4227 (buf!4670 thiss!1204))) (and (= (currentBit!8845 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8850 thiss!1204) (size!4227 (buf!4670 thiss!1204)))))))))

(assert (=> b!177529 d!62479))

(declare-fun d!62485 () Bool)

(declare-datatypes ((tuple2!15308 0))(
  ( (tuple2!15309 (_1!8299 Bool) (_2!8299 BitStream!7562)) )
))
(declare-fun lt!272624 () tuple2!15308)

(declare-fun readBit!0 (BitStream!7562) tuple2!15308)

(assert (=> d!62485 (= lt!272624 (readBit!0 (readerFrom!0 (_2!8297 lt!272539) (currentBit!8845 thiss!1204) (currentByte!8850 thiss!1204))))))

(assert (=> d!62485 (= (readBitPure!0 (readerFrom!0 (_2!8297 lt!272539) (currentBit!8845 thiss!1204) (currentByte!8850 thiss!1204))) (tuple2!15307 (_2!8299 lt!272624) (_1!8299 lt!272624)))))

(declare-fun bs!15579 () Bool)

(assert (= bs!15579 d!62485))

(assert (=> bs!15579 m!277443))

(declare-fun m!277495 () Bool)

(assert (=> bs!15579 m!277495))

(assert (=> b!177528 d!62485))

(declare-fun d!62489 () Bool)

(declare-fun e!123747 () Bool)

(assert (=> d!62489 e!123747))

(declare-fun res!147241 () Bool)

(assert (=> d!62489 (=> (not res!147241) (not e!123747))))

(assert (=> d!62489 (= res!147241 (invariant!0 (currentBit!8845 (_2!8297 lt!272539)) (currentByte!8850 (_2!8297 lt!272539)) (size!4227 (buf!4670 (_2!8297 lt!272539)))))))

(assert (=> d!62489 (= (readerFrom!0 (_2!8297 lt!272539) (currentBit!8845 thiss!1204) (currentByte!8850 thiss!1204)) (BitStream!7563 (buf!4670 (_2!8297 lt!272539)) (currentByte!8850 thiss!1204) (currentBit!8845 thiss!1204)))))

(declare-fun b!177594 () Bool)

(assert (=> b!177594 (= e!123747 (invariant!0 (currentBit!8845 thiss!1204) (currentByte!8850 thiss!1204) (size!4227 (buf!4670 (_2!8297 lt!272539)))))))

(assert (= (and d!62489 res!147241) b!177594))

(declare-fun m!277499 () Bool)

(assert (=> d!62489 m!277499))

(declare-fun m!277501 () Bool)

(assert (=> b!177594 m!277501))

(assert (=> b!177528 d!62489))

(declare-fun d!62493 () Bool)

(assert (=> d!62493 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8845 thiss!1204) (currentByte!8850 thiss!1204) (size!4227 (buf!4670 thiss!1204))))))

(declare-fun bs!15581 () Bool)

(assert (= bs!15581 d!62493))

(assert (=> bs!15581 m!277419))

(assert (=> start!39444 d!62493))

(declare-fun d!62495 () Bool)

(declare-fun e!123748 () Bool)

(assert (=> d!62495 e!123748))

(declare-fun res!147242 () Bool)

(assert (=> d!62495 (=> (not res!147242) (not e!123748))))

(declare-fun lt!272632 () (_ BitVec 64))

(declare-fun lt!272628 () (_ BitVec 64))

(declare-fun lt!272629 () (_ BitVec 64))

(assert (=> d!62495 (= res!147242 (= lt!272629 (bvsub lt!272628 lt!272632)))))

(assert (=> d!62495 (or (= (bvand lt!272628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272632 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272628 lt!272632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62495 (= lt!272632 (remainingBits!0 ((_ sign_extend 32) (size!4227 (buf!4670 (_2!8297 lt!272539)))) ((_ sign_extend 32) (currentByte!8850 (_2!8297 lt!272539))) ((_ sign_extend 32) (currentBit!8845 (_2!8297 lt!272539)))))))

(declare-fun lt!272630 () (_ BitVec 64))

(declare-fun lt!272633 () (_ BitVec 64))

(assert (=> d!62495 (= lt!272628 (bvmul lt!272630 lt!272633))))

(assert (=> d!62495 (or (= lt!272630 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272633 (bvsdiv (bvmul lt!272630 lt!272633) lt!272630)))))

(assert (=> d!62495 (= lt!272633 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62495 (= lt!272630 ((_ sign_extend 32) (size!4227 (buf!4670 (_2!8297 lt!272539)))))))

(assert (=> d!62495 (= lt!272629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8850 (_2!8297 lt!272539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8845 (_2!8297 lt!272539)))))))

(assert (=> d!62495 (invariant!0 (currentBit!8845 (_2!8297 lt!272539)) (currentByte!8850 (_2!8297 lt!272539)) (size!4227 (buf!4670 (_2!8297 lt!272539))))))

(assert (=> d!62495 (= (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272539))) (currentByte!8850 (_2!8297 lt!272539)) (currentBit!8845 (_2!8297 lt!272539))) lt!272629)))

(declare-fun b!177595 () Bool)

(declare-fun res!147243 () Bool)

(assert (=> b!177595 (=> (not res!147243) (not e!123748))))

(assert (=> b!177595 (= res!147243 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272629))))

(declare-fun b!177596 () Bool)

(declare-fun lt!272631 () (_ BitVec 64))

(assert (=> b!177596 (= e!123748 (bvsle lt!272629 (bvmul lt!272631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177596 (or (= lt!272631 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272631 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272631)))))

(assert (=> b!177596 (= lt!272631 ((_ sign_extend 32) (size!4227 (buf!4670 (_2!8297 lt!272539)))))))

(assert (= (and d!62495 res!147242) b!177595))

(assert (= (and b!177595 res!147243) b!177596))

(declare-fun m!277503 () Bool)

(assert (=> d!62495 m!277503))

(assert (=> d!62495 m!277499))

(assert (=> b!177523 d!62495))

(declare-fun d!62497 () Bool)

(declare-fun e!123749 () Bool)

(assert (=> d!62497 e!123749))

(declare-fun res!147244 () Bool)

(assert (=> d!62497 (=> (not res!147244) (not e!123749))))

(declare-fun lt!272638 () (_ BitVec 64))

(declare-fun lt!272635 () (_ BitVec 64))

(declare-fun lt!272634 () (_ BitVec 64))

(assert (=> d!62497 (= res!147244 (= lt!272635 (bvsub lt!272634 lt!272638)))))

(assert (=> d!62497 (or (= (bvand lt!272634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272638 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272634 lt!272638) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62497 (= lt!272638 (remainingBits!0 ((_ sign_extend 32) (size!4227 (buf!4670 thiss!1204))) ((_ sign_extend 32) (currentByte!8850 thiss!1204)) ((_ sign_extend 32) (currentBit!8845 thiss!1204))))))

(declare-fun lt!272636 () (_ BitVec 64))

(declare-fun lt!272639 () (_ BitVec 64))

(assert (=> d!62497 (= lt!272634 (bvmul lt!272636 lt!272639))))

(assert (=> d!62497 (or (= lt!272636 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272639 (bvsdiv (bvmul lt!272636 lt!272639) lt!272636)))))

(assert (=> d!62497 (= lt!272639 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62497 (= lt!272636 ((_ sign_extend 32) (size!4227 (buf!4670 thiss!1204))))))

(assert (=> d!62497 (= lt!272635 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8850 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8845 thiss!1204))))))

(assert (=> d!62497 (invariant!0 (currentBit!8845 thiss!1204) (currentByte!8850 thiss!1204) (size!4227 (buf!4670 thiss!1204)))))

(assert (=> d!62497 (= (bitIndex!0 (size!4227 (buf!4670 thiss!1204)) (currentByte!8850 thiss!1204) (currentBit!8845 thiss!1204)) lt!272635)))

(declare-fun b!177597 () Bool)

(declare-fun res!147245 () Bool)

(assert (=> b!177597 (=> (not res!147245) (not e!123749))))

(assert (=> b!177597 (= res!147245 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272635))))

(declare-fun b!177598 () Bool)

(declare-fun lt!272637 () (_ BitVec 64))

(assert (=> b!177598 (= e!123749 (bvsle lt!272635 (bvmul lt!272637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177598 (or (= lt!272637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272637)))))

(assert (=> b!177598 (= lt!272637 ((_ sign_extend 32) (size!4227 (buf!4670 thiss!1204))))))

(assert (= (and d!62497 res!147244) b!177597))

(assert (= (and b!177597 res!147245) b!177598))

(declare-fun m!277505 () Bool)

(assert (=> d!62497 m!277505))

(assert (=> d!62497 m!277419))

(assert (=> b!177523 d!62497))

(declare-fun d!62499 () Bool)

(declare-fun res!147254 () Bool)

(declare-fun e!123755 () Bool)

(assert (=> d!62499 (=> (not res!147254) (not e!123755))))

(assert (=> d!62499 (= res!147254 (= (size!4227 (buf!4670 thiss!1204)) (size!4227 (buf!4670 (_2!8297 lt!272539)))))))

(assert (=> d!62499 (= (isPrefixOf!0 thiss!1204 (_2!8297 lt!272539)) e!123755)))

(declare-fun b!177605 () Bool)

(declare-fun res!147252 () Bool)

(assert (=> b!177605 (=> (not res!147252) (not e!123755))))

(assert (=> b!177605 (= res!147252 (bvsle (bitIndex!0 (size!4227 (buf!4670 thiss!1204)) (currentByte!8850 thiss!1204) (currentBit!8845 thiss!1204)) (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272539))) (currentByte!8850 (_2!8297 lt!272539)) (currentBit!8845 (_2!8297 lt!272539)))))))

(declare-fun b!177606 () Bool)

(declare-fun e!123754 () Bool)

(assert (=> b!177606 (= e!123755 e!123754)))

(declare-fun res!147253 () Bool)

(assert (=> b!177606 (=> res!147253 e!123754)))

(assert (=> b!177606 (= res!147253 (= (size!4227 (buf!4670 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177607 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9585 array!9585 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177607 (= e!123754 (arrayBitRangesEq!0 (buf!4670 thiss!1204) (buf!4670 (_2!8297 lt!272539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4227 (buf!4670 thiss!1204)) (currentByte!8850 thiss!1204) (currentBit!8845 thiss!1204))))))

(assert (= (and d!62499 res!147254) b!177605))

(assert (= (and b!177605 res!147252) b!177606))

(assert (= (and b!177606 (not res!147253)) b!177607))

(assert (=> b!177605 m!277427))

(assert (=> b!177605 m!277425))

(assert (=> b!177607 m!277427))

(assert (=> b!177607 m!277427))

(declare-fun m!277507 () Bool)

(assert (=> b!177607 m!277507))

(assert (=> b!177530 d!62499))

(declare-fun d!62501 () Bool)

(assert (=> d!62501 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4227 (buf!4670 thiss!1204))) ((_ sign_extend 32) (currentByte!8850 thiss!1204)) ((_ sign_extend 32) (currentBit!8845 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4227 (buf!4670 thiss!1204))) ((_ sign_extend 32) (currentByte!8850 thiss!1204)) ((_ sign_extend 32) (currentBit!8845 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15582 () Bool)

(assert (= bs!15582 d!62501))

(assert (=> bs!15582 m!277505))

(assert (=> b!177525 d!62501))

(declare-fun d!62503 () Bool)

(assert (=> d!62503 (= (invariant!0 (currentBit!8845 (_2!8297 lt!272537)) (currentByte!8850 (_2!8297 lt!272537)) (size!4227 (buf!4670 (_2!8297 lt!272537)))) (and (bvsge (currentBit!8845 (_2!8297 lt!272537)) #b00000000000000000000000000000000) (bvslt (currentBit!8845 (_2!8297 lt!272537)) #b00000000000000000000000000001000) (bvsge (currentByte!8850 (_2!8297 lt!272537)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8850 (_2!8297 lt!272537)) (size!4227 (buf!4670 (_2!8297 lt!272537)))) (and (= (currentBit!8845 (_2!8297 lt!272537)) #b00000000000000000000000000000000) (= (currentByte!8850 (_2!8297 lt!272537)) (size!4227 (buf!4670 (_2!8297 lt!272537))))))))))

(assert (=> b!177524 d!62503))

(declare-fun d!62505 () Bool)

(declare-fun res!147257 () Bool)

(declare-fun e!123757 () Bool)

(assert (=> d!62505 (=> (not res!147257) (not e!123757))))

(assert (=> d!62505 (= res!147257 (= (size!4227 (buf!4670 thiss!1204)) (size!4227 (buf!4670 (_2!8297 lt!272537)))))))

(assert (=> d!62505 (= (isPrefixOf!0 thiss!1204 (_2!8297 lt!272537)) e!123757)))

(declare-fun b!177608 () Bool)

(declare-fun res!147255 () Bool)

(assert (=> b!177608 (=> (not res!147255) (not e!123757))))

(assert (=> b!177608 (= res!147255 (bvsle (bitIndex!0 (size!4227 (buf!4670 thiss!1204)) (currentByte!8850 thiss!1204) (currentBit!8845 thiss!1204)) (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272537))) (currentByte!8850 (_2!8297 lt!272537)) (currentBit!8845 (_2!8297 lt!272537)))))))

(declare-fun b!177609 () Bool)

(declare-fun e!123756 () Bool)

(assert (=> b!177609 (= e!123757 e!123756)))

(declare-fun res!147256 () Bool)

(assert (=> b!177609 (=> res!147256 e!123756)))

(assert (=> b!177609 (= res!147256 (= (size!4227 (buf!4670 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177610 () Bool)

(assert (=> b!177610 (= e!123756 (arrayBitRangesEq!0 (buf!4670 thiss!1204) (buf!4670 (_2!8297 lt!272537)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4227 (buf!4670 thiss!1204)) (currentByte!8850 thiss!1204) (currentBit!8845 thiss!1204))))))

(assert (= (and d!62505 res!147257) b!177608))

(assert (= (and b!177608 res!147255) b!177609))

(assert (= (and b!177609 (not res!147256)) b!177610))

(assert (=> b!177608 m!277427))

(declare-fun m!277509 () Bool)

(assert (=> b!177608 m!277509))

(assert (=> b!177610 m!277427))

(assert (=> b!177610 m!277427))

(declare-fun m!277511 () Bool)

(assert (=> b!177610 m!277511))

(assert (=> b!177524 d!62505))

(declare-fun d!62507 () Bool)

(assert (=> d!62507 (isPrefixOf!0 thiss!1204 (_2!8297 lt!272537))))

(declare-fun lt!272642 () Unit!12768)

(declare-fun choose!30 (BitStream!7562 BitStream!7562 BitStream!7562) Unit!12768)

(assert (=> d!62507 (= lt!272642 (choose!30 thiss!1204 (_2!8297 lt!272539) (_2!8297 lt!272537)))))

(assert (=> d!62507 (isPrefixOf!0 thiss!1204 (_2!8297 lt!272539))))

(assert (=> d!62507 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8297 lt!272539) (_2!8297 lt!272537)) lt!272642)))

(declare-fun bs!15583 () Bool)

(assert (= bs!15583 d!62507))

(assert (=> bs!15583 m!277437))

(declare-fun m!277513 () Bool)

(assert (=> bs!15583 m!277513))

(assert (=> bs!15583 m!277423))

(assert (=> b!177524 d!62507))

(declare-fun b!177675 () Bool)

(declare-fun e!123798 () Bool)

(declare-fun lt!272883 () (_ BitVec 64))

(assert (=> b!177675 (= e!123798 (validate_offset_bits!1 ((_ sign_extend 32) (size!4227 (buf!4670 (_2!8297 lt!272539)))) ((_ sign_extend 32) (currentByte!8850 (_2!8297 lt!272539))) ((_ sign_extend 32) (currentBit!8845 (_2!8297 lt!272539))) lt!272883))))

(declare-fun b!177676 () Bool)

(declare-fun e!123801 () (_ BitVec 64))

(assert (=> b!177676 (= e!123801 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!177677 () Bool)

(declare-fun lt!272919 () tuple2!15306)

(declare-fun lt!272913 () tuple2!15304)

(assert (=> b!177677 (= lt!272919 (readBitPure!0 (readerFrom!0 (_2!8297 lt!272913) (currentBit!8845 (_2!8297 lt!272539)) (currentByte!8850 (_2!8297 lt!272539)))))))

(declare-fun res!147311 () Bool)

(declare-fun lt!272879 () Bool)

(assert (=> b!177677 (= res!147311 (and (= (_2!8298 lt!272919) lt!272879) (= (_1!8298 lt!272919) (_2!8297 lt!272913))))))

(declare-fun e!123794 () Bool)

(assert (=> b!177677 (=> (not res!147311) (not e!123794))))

(declare-fun e!123795 () Bool)

(assert (=> b!177677 (= e!123795 e!123794)))

(declare-fun b!177678 () Bool)

(assert (=> b!177678 (= e!123794 (= (bitIndex!0 (size!4227 (buf!4670 (_1!8298 lt!272919))) (currentByte!8850 (_1!8298 lt!272919)) (currentBit!8845 (_1!8298 lt!272919))) (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272913))) (currentByte!8850 (_2!8297 lt!272913)) (currentBit!8845 (_2!8297 lt!272913)))))))

(declare-fun b!177679 () Bool)

(declare-fun e!123796 () tuple2!15304)

(declare-fun Unit!12771 () Unit!12768)

(assert (=> b!177679 (= e!123796 (tuple2!15305 Unit!12771 (_2!8297 lt!272539)))))

(declare-fun lt!272898 () Unit!12768)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7562) Unit!12768)

(assert (=> b!177679 (= lt!272898 (lemmaIsPrefixRefl!0 (_2!8297 lt!272539)))))

(declare-fun call!2914 () Bool)

(assert (=> b!177679 call!2914))

(declare-fun lt!272897 () Unit!12768)

(assert (=> b!177679 (= lt!272897 lt!272898)))

(declare-fun b!177680 () Bool)

(declare-fun res!147307 () Bool)

(declare-fun e!123802 () Bool)

(assert (=> b!177680 (=> (not res!147307) (not e!123802))))

(declare-fun lt!272922 () tuple2!15304)

(assert (=> b!177680 (= res!147307 (= (size!4227 (buf!4670 (_2!8297 lt!272539))) (size!4227 (buf!4670 (_2!8297 lt!272922)))))))

(declare-fun bm!2911 () Bool)

(declare-fun c!9249 () Bool)

(assert (=> bm!2911 (= call!2914 (isPrefixOf!0 (_2!8297 lt!272539) (ite c!9249 (_2!8297 lt!272539) (_2!8297 lt!272913))))))

(declare-fun b!177682 () Bool)

(declare-fun e!123797 () Bool)

(declare-fun lt!272902 () tuple2!15306)

(declare-fun lt!272906 () tuple2!15306)

(assert (=> b!177682 (= e!123797 (= (_2!8298 lt!272902) (_2!8298 lt!272906)))))

(declare-fun b!177683 () Bool)

(declare-fun res!147315 () Bool)

(assert (=> b!177683 (= res!147315 call!2914)))

(assert (=> b!177683 (=> (not res!147315) (not e!123795))))

(declare-fun b!177684 () Bool)

(declare-fun res!147317 () Bool)

(assert (=> b!177684 (=> (not res!147317) (not e!123802))))

(assert (=> b!177684 (= res!147317 (isPrefixOf!0 (_2!8297 lt!272539) (_2!8297 lt!272922)))))

(declare-fun b!177685 () Bool)

(declare-fun e!123799 () Bool)

(declare-datatypes ((tuple2!15316 0))(
  ( (tuple2!15317 (_1!8303 BitStream!7562) (_2!8303 (_ BitVec 64))) )
))
(declare-fun lt!272916 () tuple2!15316)

(declare-datatypes ((tuple2!15318 0))(
  ( (tuple2!15319 (_1!8304 BitStream!7562) (_2!8304 BitStream!7562)) )
))
(declare-fun lt!272872 () tuple2!15318)

(assert (=> b!177685 (= e!123799 (= (_1!8303 lt!272916) (_2!8304 lt!272872)))))

(declare-fun b!177686 () Bool)

(declare-fun lt!272890 () tuple2!15304)

(assert (=> b!177686 (= e!123796 (tuple2!15305 (_1!8297 lt!272890) (_2!8297 lt!272890)))))

(assert (=> b!177686 (= lt!272879 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177686 (= lt!272913 (appendBit!0 (_2!8297 lt!272539) lt!272879))))

(declare-fun res!147306 () Bool)

(assert (=> b!177686 (= res!147306 (= (size!4227 (buf!4670 (_2!8297 lt!272539))) (size!4227 (buf!4670 (_2!8297 lt!272913)))))))

(assert (=> b!177686 (=> (not res!147306) (not e!123795))))

(assert (=> b!177686 e!123795))

(declare-fun lt!272915 () tuple2!15304)

(assert (=> b!177686 (= lt!272915 lt!272913)))

(assert (=> b!177686 (= lt!272890 (appendBitsLSBFirstLoopTR!0 (_2!8297 lt!272915) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!272920 () Unit!12768)

(assert (=> b!177686 (= lt!272920 (lemmaIsPrefixTransitive!0 (_2!8297 lt!272539) (_2!8297 lt!272915) (_2!8297 lt!272890)))))

(assert (=> b!177686 (isPrefixOf!0 (_2!8297 lt!272539) (_2!8297 lt!272890))))

(declare-fun lt!272889 () Unit!12768)

(assert (=> b!177686 (= lt!272889 lt!272920)))

(assert (=> b!177686 (invariant!0 (currentBit!8845 (_2!8297 lt!272539)) (currentByte!8850 (_2!8297 lt!272539)) (size!4227 (buf!4670 (_2!8297 lt!272915))))))

(declare-fun lt!272910 () BitStream!7562)

(assert (=> b!177686 (= lt!272910 (BitStream!7563 (buf!4670 (_2!8297 lt!272915)) (currentByte!8850 (_2!8297 lt!272539)) (currentBit!8845 (_2!8297 lt!272539))))))

(assert (=> b!177686 (invariant!0 (currentBit!8845 lt!272910) (currentByte!8850 lt!272910) (size!4227 (buf!4670 (_2!8297 lt!272890))))))

(declare-fun lt!272888 () BitStream!7562)

(assert (=> b!177686 (= lt!272888 (BitStream!7563 (buf!4670 (_2!8297 lt!272890)) (currentByte!8850 lt!272910) (currentBit!8845 lt!272910)))))

(assert (=> b!177686 (= lt!272902 (readBitPure!0 lt!272910))))

(assert (=> b!177686 (= lt!272906 (readBitPure!0 lt!272888))))

(declare-fun lt!272921 () Unit!12768)

(declare-fun readBitPrefixLemma!0 (BitStream!7562 BitStream!7562) Unit!12768)

(assert (=> b!177686 (= lt!272921 (readBitPrefixLemma!0 lt!272910 (_2!8297 lt!272890)))))

(declare-fun res!147313 () Bool)

(assert (=> b!177686 (= res!147313 (= (bitIndex!0 (size!4227 (buf!4670 (_1!8298 lt!272902))) (currentByte!8850 (_1!8298 lt!272902)) (currentBit!8845 (_1!8298 lt!272902))) (bitIndex!0 (size!4227 (buf!4670 (_1!8298 lt!272906))) (currentByte!8850 (_1!8298 lt!272906)) (currentBit!8845 (_1!8298 lt!272906)))))))

(assert (=> b!177686 (=> (not res!147313) (not e!123797))))

(assert (=> b!177686 e!123797))

(declare-fun lt!272875 () Unit!12768)

(assert (=> b!177686 (= lt!272875 lt!272921)))

(declare-fun lt!272896 () tuple2!15318)

(declare-fun reader!0 (BitStream!7562 BitStream!7562) tuple2!15318)

(assert (=> b!177686 (= lt!272896 (reader!0 (_2!8297 lt!272539) (_2!8297 lt!272890)))))

(declare-fun lt!272907 () tuple2!15318)

(assert (=> b!177686 (= lt!272907 (reader!0 (_2!8297 lt!272915) (_2!8297 lt!272890)))))

(declare-fun lt!272914 () tuple2!15306)

(assert (=> b!177686 (= lt!272914 (readBitPure!0 (_1!8304 lt!272896)))))

(assert (=> b!177686 (= (_2!8298 lt!272914) lt!272879)))

(declare-fun lt!272895 () Unit!12768)

(declare-fun Unit!12773 () Unit!12768)

(assert (=> b!177686 (= lt!272895 Unit!12773)))

(declare-fun lt!272918 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177686 (= lt!272918 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!272905 () (_ BitVec 64))

(assert (=> b!177686 (= lt!272905 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!272909 () Unit!12768)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7562 array!9585 (_ BitVec 64)) Unit!12768)

(assert (=> b!177686 (= lt!272909 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8297 lt!272539) (buf!4670 (_2!8297 lt!272890)) lt!272905))))

(assert (=> b!177686 (validate_offset_bits!1 ((_ sign_extend 32) (size!4227 (buf!4670 (_2!8297 lt!272890)))) ((_ sign_extend 32) (currentByte!8850 (_2!8297 lt!272539))) ((_ sign_extend 32) (currentBit!8845 (_2!8297 lt!272539))) lt!272905)))

(declare-fun lt!272871 () Unit!12768)

(assert (=> b!177686 (= lt!272871 lt!272909)))

(declare-fun lt!272869 () tuple2!15316)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15316)

(assert (=> b!177686 (= lt!272869 (readNBitsLSBFirstsLoopPure!0 (_1!8304 lt!272896) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!272918))))

(declare-fun lt!272887 () (_ BitVec 64))

(assert (=> b!177686 (= lt!272887 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!272891 () Unit!12768)

(assert (=> b!177686 (= lt!272891 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8297 lt!272915) (buf!4670 (_2!8297 lt!272890)) lt!272887))))

(assert (=> b!177686 (validate_offset_bits!1 ((_ sign_extend 32) (size!4227 (buf!4670 (_2!8297 lt!272890)))) ((_ sign_extend 32) (currentByte!8850 (_2!8297 lt!272915))) ((_ sign_extend 32) (currentBit!8845 (_2!8297 lt!272915))) lt!272887)))

(declare-fun lt!272904 () Unit!12768)

(assert (=> b!177686 (= lt!272904 lt!272891)))

(declare-fun lt!272894 () tuple2!15316)

(assert (=> b!177686 (= lt!272894 (readNBitsLSBFirstsLoopPure!0 (_1!8304 lt!272907) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!272918 (ite (_2!8298 lt!272914) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!272917 () tuple2!15316)

(assert (=> b!177686 (= lt!272917 (readNBitsLSBFirstsLoopPure!0 (_1!8304 lt!272896) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!272918))))

(declare-fun c!9250 () Bool)

(assert (=> b!177686 (= c!9250 (_2!8298 (readBitPure!0 (_1!8304 lt!272896))))))

(declare-fun lt!272867 () tuple2!15316)

(declare-fun withMovedBitIndex!0 (BitStream!7562 (_ BitVec 64)) BitStream!7562)

(assert (=> b!177686 (= lt!272867 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8304 lt!272896) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!272918 e!123801)))))

(declare-fun lt!272884 () Unit!12768)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12768)

(assert (=> b!177686 (= lt!272884 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8304 lt!272896) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!272918))))

(assert (=> b!177686 (and (= (_2!8303 lt!272917) (_2!8303 lt!272867)) (= (_1!8303 lt!272917) (_1!8303 lt!272867)))))

(declare-fun lt!272901 () Unit!12768)

(assert (=> b!177686 (= lt!272901 lt!272884)))

(assert (=> b!177686 (= (_1!8304 lt!272896) (withMovedBitIndex!0 (_2!8304 lt!272896) (bvsub (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272539))) (currentByte!8850 (_2!8297 lt!272539)) (currentBit!8845 (_2!8297 lt!272539))) (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272890))) (currentByte!8850 (_2!8297 lt!272890)) (currentBit!8845 (_2!8297 lt!272890))))))))

(declare-fun lt!272880 () Unit!12768)

(declare-fun Unit!12784 () Unit!12768)

(assert (=> b!177686 (= lt!272880 Unit!12784)))

(assert (=> b!177686 (= (_1!8304 lt!272907) (withMovedBitIndex!0 (_2!8304 lt!272907) (bvsub (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272915))) (currentByte!8850 (_2!8297 lt!272915)) (currentBit!8845 (_2!8297 lt!272915))) (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272890))) (currentByte!8850 (_2!8297 lt!272890)) (currentBit!8845 (_2!8297 lt!272890))))))))

(declare-fun lt!272912 () Unit!12768)

(declare-fun Unit!12785 () Unit!12768)

(assert (=> b!177686 (= lt!272912 Unit!12785)))

(assert (=> b!177686 (= (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272539))) (currentByte!8850 (_2!8297 lt!272539)) (currentBit!8845 (_2!8297 lt!272539))) (bvsub (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272915))) (currentByte!8850 (_2!8297 lt!272915)) (currentBit!8845 (_2!8297 lt!272915))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!272877 () Unit!12768)

(declare-fun Unit!12786 () Unit!12768)

(assert (=> b!177686 (= lt!272877 Unit!12786)))

(assert (=> b!177686 (= (_2!8303 lt!272869) (_2!8303 lt!272894))))

(declare-fun lt!272878 () Unit!12768)

(declare-fun Unit!12787 () Unit!12768)

(assert (=> b!177686 (= lt!272878 Unit!12787)))

(assert (=> b!177686 (invariant!0 (currentBit!8845 (_2!8297 lt!272890)) (currentByte!8850 (_2!8297 lt!272890)) (size!4227 (buf!4670 (_2!8297 lt!272890))))))

(declare-fun lt!272886 () Unit!12768)

(declare-fun Unit!12788 () Unit!12768)

(assert (=> b!177686 (= lt!272886 Unit!12788)))

(assert (=> b!177686 (= (size!4227 (buf!4670 (_2!8297 lt!272539))) (size!4227 (buf!4670 (_2!8297 lt!272890))))))

(declare-fun lt!272903 () Unit!12768)

(declare-fun Unit!12790 () Unit!12768)

(assert (=> b!177686 (= lt!272903 Unit!12790)))

(assert (=> b!177686 (= (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272890))) (currentByte!8850 (_2!8297 lt!272890)) (currentBit!8845 (_2!8297 lt!272890))) (bvsub (bvadd (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272539))) (currentByte!8850 (_2!8297 lt!272539)) (currentBit!8845 (_2!8297 lt!272539))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!272870 () Unit!12768)

(declare-fun Unit!12791 () Unit!12768)

(assert (=> b!177686 (= lt!272870 Unit!12791)))

(declare-fun lt!272868 () Unit!12768)

(declare-fun Unit!12792 () Unit!12768)

(assert (=> b!177686 (= lt!272868 Unit!12792)))

(assert (=> b!177686 (= lt!272872 (reader!0 (_2!8297 lt!272539) (_2!8297 lt!272890)))))

(declare-fun lt!272874 () (_ BitVec 64))

(assert (=> b!177686 (= lt!272874 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!272899 () Unit!12768)

(assert (=> b!177686 (= lt!272899 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8297 lt!272539) (buf!4670 (_2!8297 lt!272890)) lt!272874))))

(assert (=> b!177686 (validate_offset_bits!1 ((_ sign_extend 32) (size!4227 (buf!4670 (_2!8297 lt!272890)))) ((_ sign_extend 32) (currentByte!8850 (_2!8297 lt!272539))) ((_ sign_extend 32) (currentBit!8845 (_2!8297 lt!272539))) lt!272874)))

(declare-fun lt!272885 () Unit!12768)

(assert (=> b!177686 (= lt!272885 lt!272899)))

(assert (=> b!177686 (= lt!272916 (readNBitsLSBFirstsLoopPure!0 (_1!8304 lt!272872) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!147309 () Bool)

(assert (=> b!177686 (= res!147309 (= (_2!8303 lt!272916) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!177686 (=> (not res!147309) (not e!123799))))

(assert (=> b!177686 e!123799))

(declare-fun lt!272873 () Unit!12768)

(declare-fun Unit!12793 () Unit!12768)

(assert (=> b!177686 (= lt!272873 Unit!12793)))

(declare-fun b!177687 () Bool)

(declare-fun e!123800 () Bool)

(declare-fun lt!272893 () tuple2!15316)

(declare-fun lt!272882 () tuple2!15318)

(assert (=> b!177687 (= e!123800 (= (_1!8303 lt!272893) (_2!8304 lt!272882)))))

(declare-fun b!177688 () Bool)

(assert (=> b!177688 (= e!123802 e!123800)))

(declare-fun res!147316 () Bool)

(assert (=> b!177688 (=> (not res!147316) (not e!123800))))

(assert (=> b!177688 (= res!147316 (= (_2!8303 lt!272893) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!177688 (= lt!272893 (readNBitsLSBFirstsLoopPure!0 (_1!8304 lt!272882) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!272876 () Unit!12768)

(declare-fun lt!272881 () Unit!12768)

(assert (=> b!177688 (= lt!272876 lt!272881)))

(assert (=> b!177688 (validate_offset_bits!1 ((_ sign_extend 32) (size!4227 (buf!4670 (_2!8297 lt!272922)))) ((_ sign_extend 32) (currentByte!8850 (_2!8297 lt!272539))) ((_ sign_extend 32) (currentBit!8845 (_2!8297 lt!272539))) lt!272883)))

(assert (=> b!177688 (= lt!272881 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8297 lt!272539) (buf!4670 (_2!8297 lt!272922)) lt!272883))))

(assert (=> b!177688 e!123798))

(declare-fun res!147312 () Bool)

(assert (=> b!177688 (=> (not res!147312) (not e!123798))))

(assert (=> b!177688 (= res!147312 (and (= (size!4227 (buf!4670 (_2!8297 lt!272539))) (size!4227 (buf!4670 (_2!8297 lt!272922)))) (bvsge lt!272883 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177688 (= lt!272883 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!177688 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!177688 (= lt!272882 (reader!0 (_2!8297 lt!272539) (_2!8297 lt!272922)))))

(declare-fun b!177689 () Bool)

(declare-fun res!147314 () Bool)

(assert (=> b!177689 (= res!147314 (= (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272913))) (currentByte!8850 (_2!8297 lt!272913)) (currentBit!8845 (_2!8297 lt!272913))) (bvadd (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272539))) (currentByte!8850 (_2!8297 lt!272539)) (currentBit!8845 (_2!8297 lt!272539))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!177689 (=> (not res!147314) (not e!123795))))

(declare-fun b!177690 () Bool)

(assert (=> b!177690 (= e!123801 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!62509 () Bool)

(assert (=> d!62509 e!123802))

(declare-fun res!147308 () Bool)

(assert (=> d!62509 (=> (not res!147308) (not e!123802))))

(assert (=> d!62509 (= res!147308 (invariant!0 (currentBit!8845 (_2!8297 lt!272922)) (currentByte!8850 (_2!8297 lt!272922)) (size!4227 (buf!4670 (_2!8297 lt!272922)))))))

(assert (=> d!62509 (= lt!272922 e!123796)))

(assert (=> d!62509 (= c!9249 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62509 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62509 (= (appendBitsLSBFirstLoopTR!0 (_2!8297 lt!272539) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!272922)))

(declare-fun b!177681 () Bool)

(declare-fun res!147310 () Bool)

(assert (=> b!177681 (=> (not res!147310) (not e!123802))))

(declare-fun lt!272911 () (_ BitVec 64))

(declare-fun lt!272892 () (_ BitVec 64))

(assert (=> b!177681 (= res!147310 (= (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272922))) (currentByte!8850 (_2!8297 lt!272922)) (currentBit!8845 (_2!8297 lt!272922))) (bvsub lt!272892 lt!272911)))))

(assert (=> b!177681 (or (= (bvand lt!272892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272892 lt!272911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177681 (= lt!272911 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!272900 () (_ BitVec 64))

(declare-fun lt!272908 () (_ BitVec 64))

(assert (=> b!177681 (= lt!272892 (bvadd lt!272900 lt!272908))))

(assert (=> b!177681 (or (not (= (bvand lt!272900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272908 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!272900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!272900 lt!272908) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177681 (= lt!272908 ((_ sign_extend 32) nBits!348))))

(assert (=> b!177681 (= lt!272900 (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!272539))) (currentByte!8850 (_2!8297 lt!272539)) (currentBit!8845 (_2!8297 lt!272539))))))

(assert (= (and d!62509 c!9249) b!177679))

(assert (= (and d!62509 (not c!9249)) b!177686))

(assert (= (and b!177686 res!147306) b!177689))

(assert (= (and b!177689 res!147314) b!177683))

(assert (= (and b!177683 res!147315) b!177677))

(assert (= (and b!177677 res!147311) b!177678))

(assert (= (and b!177686 res!147313) b!177682))

(assert (= (and b!177686 c!9250) b!177676))

(assert (= (and b!177686 (not c!9250)) b!177690))

(assert (= (and b!177686 res!147309) b!177685))

(assert (= (or b!177679 b!177683) bm!2911))

(assert (= (and d!62509 res!147308) b!177680))

(assert (= (and b!177680 res!147307) b!177681))

(assert (= (and b!177681 res!147310) b!177684))

(assert (= (and b!177684 res!147317) b!177688))

(assert (= (and b!177688 res!147312) b!177675))

(assert (= (and b!177688 res!147316) b!177687))

(declare-fun m!277515 () Bool)

(assert (=> b!177677 m!277515))

(assert (=> b!177677 m!277515))

(declare-fun m!277517 () Bool)

(assert (=> b!177677 m!277517))

(declare-fun m!277519 () Bool)

(assert (=> b!177689 m!277519))

(assert (=> b!177689 m!277425))

(declare-fun m!277521 () Bool)

(assert (=> b!177686 m!277521))

(declare-fun m!277523 () Bool)

(assert (=> b!177686 m!277523))

(declare-fun m!277525 () Bool)

(assert (=> b!177686 m!277525))

(declare-fun m!277527 () Bool)

(assert (=> b!177686 m!277527))

(declare-fun m!277529 () Bool)

(assert (=> b!177686 m!277529))

(declare-fun m!277531 () Bool)

(assert (=> b!177686 m!277531))

(declare-fun m!277533 () Bool)

(assert (=> b!177686 m!277533))

(declare-fun m!277535 () Bool)

(assert (=> b!177686 m!277535))

(declare-fun m!277537 () Bool)

(assert (=> b!177686 m!277537))

(assert (=> b!177686 m!277425))

(declare-fun m!277539 () Bool)

(assert (=> b!177686 m!277539))

(declare-fun m!277541 () Bool)

(assert (=> b!177686 m!277541))

(declare-fun m!277543 () Bool)

(assert (=> b!177686 m!277543))

(declare-fun m!277545 () Bool)

(assert (=> b!177686 m!277545))

(declare-fun m!277547 () Bool)

(assert (=> b!177686 m!277547))

(declare-fun m!277549 () Bool)

(assert (=> b!177686 m!277549))

(declare-fun m!277551 () Bool)

(assert (=> b!177686 m!277551))

(declare-fun m!277553 () Bool)

(assert (=> b!177686 m!277553))

(declare-fun m!277555 () Bool)

(assert (=> b!177686 m!277555))

(declare-fun m!277557 () Bool)

(assert (=> b!177686 m!277557))

(assert (=> b!177686 m!277523))

(declare-fun m!277559 () Bool)

(assert (=> b!177686 m!277559))

(declare-fun m!277561 () Bool)

(assert (=> b!177686 m!277561))

(declare-fun m!277563 () Bool)

(assert (=> b!177686 m!277563))

(declare-fun m!277565 () Bool)

(assert (=> b!177686 m!277565))

(declare-fun m!277567 () Bool)

(assert (=> b!177686 m!277567))

(declare-fun m!277569 () Bool)

(assert (=> b!177686 m!277569))

(declare-fun m!277571 () Bool)

(assert (=> b!177686 m!277571))

(declare-fun m!277573 () Bool)

(assert (=> b!177686 m!277573))

(declare-fun m!277575 () Bool)

(assert (=> b!177686 m!277575))

(declare-fun m!277577 () Bool)

(assert (=> b!177686 m!277577))

(declare-fun m!277579 () Bool)

(assert (=> b!177686 m!277579))

(declare-fun m!277581 () Bool)

(assert (=> b!177686 m!277581))

(declare-fun m!277583 () Bool)

(assert (=> b!177686 m!277583))

(declare-fun m!277585 () Bool)

(assert (=> b!177686 m!277585))

(declare-fun m!277587 () Bool)

(assert (=> b!177675 m!277587))

(declare-fun m!277589 () Bool)

(assert (=> b!177681 m!277589))

(assert (=> b!177681 m!277425))

(declare-fun m!277591 () Bool)

(assert (=> b!177688 m!277591))

(declare-fun m!277593 () Bool)

(assert (=> b!177688 m!277593))

(assert (=> b!177688 m!277521))

(declare-fun m!277595 () Bool)

(assert (=> b!177688 m!277595))

(declare-fun m!277597 () Bool)

(assert (=> b!177688 m!277597))

(assert (=> b!177688 m!277577))

(declare-fun m!277599 () Bool)

(assert (=> d!62509 m!277599))

(declare-fun m!277601 () Bool)

(assert (=> b!177679 m!277601))

(declare-fun m!277603 () Bool)

(assert (=> b!177684 m!277603))

(declare-fun m!277605 () Bool)

(assert (=> b!177678 m!277605))

(assert (=> b!177678 m!277519))

(declare-fun m!277607 () Bool)

(assert (=> bm!2911 m!277607))

(assert (=> b!177524 d!62509))

(assert (=> b!177531 d!62495))

(assert (=> b!177531 d!62497))

(declare-fun b!177739 () Bool)

(declare-fun res!147354 () Bool)

(declare-fun e!123828 () Bool)

(assert (=> b!177739 (=> (not res!147354) (not e!123828))))

(declare-fun lt!273072 () tuple2!15304)

(assert (=> b!177739 (= res!147354 (isPrefixOf!0 thiss!1204 (_2!8297 lt!273072)))))

(declare-fun d!62511 () Bool)

(assert (=> d!62511 e!123828))

(declare-fun res!147352 () Bool)

(assert (=> d!62511 (=> (not res!147352) (not e!123828))))

(assert (=> d!62511 (= res!147352 (= (size!4227 (buf!4670 thiss!1204)) (size!4227 (buf!4670 (_2!8297 lt!273072)))))))

(declare-fun choose!16 (BitStream!7562 Bool) tuple2!15304)

(assert (=> d!62511 (= lt!273072 (choose!16 thiss!1204 lt!272543))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62511 (validate_offset_bit!0 ((_ sign_extend 32) (size!4227 (buf!4670 thiss!1204))) ((_ sign_extend 32) (currentByte!8850 thiss!1204)) ((_ sign_extend 32) (currentBit!8845 thiss!1204)))))

(assert (=> d!62511 (= (appendBit!0 thiss!1204 lt!272543) lt!273072)))

(declare-fun b!177740 () Bool)

(declare-fun e!123829 () Bool)

(assert (=> b!177740 (= e!123828 e!123829)))

(declare-fun res!147353 () Bool)

(assert (=> b!177740 (=> (not res!147353) (not e!123829))))

(declare-fun lt!273071 () tuple2!15306)

(assert (=> b!177740 (= res!147353 (and (= (_2!8298 lt!273071) lt!272543) (= (_1!8298 lt!273071) (_2!8297 lt!273072))))))

(assert (=> b!177740 (= lt!273071 (readBitPure!0 (readerFrom!0 (_2!8297 lt!273072) (currentBit!8845 thiss!1204) (currentByte!8850 thiss!1204))))))

(declare-fun b!177741 () Bool)

(assert (=> b!177741 (= e!123829 (= (bitIndex!0 (size!4227 (buf!4670 (_1!8298 lt!273071))) (currentByte!8850 (_1!8298 lt!273071)) (currentBit!8845 (_1!8298 lt!273071))) (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!273072))) (currentByte!8850 (_2!8297 lt!273072)) (currentBit!8845 (_2!8297 lt!273072)))))))

(declare-fun b!177738 () Bool)

(declare-fun res!147355 () Bool)

(assert (=> b!177738 (=> (not res!147355) (not e!123828))))

(declare-fun lt!273073 () (_ BitVec 64))

(declare-fun lt!273074 () (_ BitVec 64))

(assert (=> b!177738 (= res!147355 (= (bitIndex!0 (size!4227 (buf!4670 (_2!8297 lt!273072))) (currentByte!8850 (_2!8297 lt!273072)) (currentBit!8845 (_2!8297 lt!273072))) (bvadd lt!273074 lt!273073)))))

(assert (=> b!177738 (or (not (= (bvand lt!273074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273073 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!273074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!273074 lt!273073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177738 (= lt!273073 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!177738 (= lt!273074 (bitIndex!0 (size!4227 (buf!4670 thiss!1204)) (currentByte!8850 thiss!1204) (currentBit!8845 thiss!1204)))))

(assert (= (and d!62511 res!147352) b!177738))

(assert (= (and b!177738 res!147355) b!177739))

(assert (= (and b!177739 res!147354) b!177740))

(assert (= (and b!177740 res!147353) b!177741))

(declare-fun m!277707 () Bool)

(assert (=> d!62511 m!277707))

(declare-fun m!277709 () Bool)

(assert (=> d!62511 m!277709))

(declare-fun m!277711 () Bool)

(assert (=> b!177740 m!277711))

(assert (=> b!177740 m!277711))

(declare-fun m!277713 () Bool)

(assert (=> b!177740 m!277713))

(declare-fun m!277715 () Bool)

(assert (=> b!177741 m!277715))

(declare-fun m!277717 () Bool)

(assert (=> b!177741 m!277717))

(assert (=> b!177738 m!277717))

(assert (=> b!177738 m!277427))

(declare-fun m!277719 () Bool)

(assert (=> b!177739 m!277719))

(assert (=> b!177531 d!62511))

(push 1)

