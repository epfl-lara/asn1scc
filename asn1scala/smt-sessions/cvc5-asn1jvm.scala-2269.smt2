; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57414 () Bool)

(assert start!57414)

(declare-fun b!263173 () Bool)

(declare-fun e!183428 () Bool)

(declare-fun e!183424 () Bool)

(assert (=> b!263173 (= e!183428 (not e!183424))))

(declare-fun res!220180 () Bool)

(assert (=> b!263173 (=> res!220180 e!183424)))

(declare-fun e!183422 () Bool)

(assert (=> b!263173 (= res!220180 e!183422)))

(declare-fun res!220182 () Bool)

(assert (=> b!263173 (=> (not res!220182) (not e!183422))))

(declare-datatypes ((array!14690 0))(
  ( (array!14691 (arr!7399 (Array (_ BitVec 32) (_ BitVec 8))) (size!6412 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11638 0))(
  ( (BitStream!11639 (buf!6880 array!14690) (currentByte!12732 (_ BitVec 32)) (currentBit!12727 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11638)

(assert (=> b!263173 (= res!220182 (not (= (size!6412 (buf!6880 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11638)

(declare-fun isPrefixOf!0 (BitStream!11638 BitStream!11638) Bool)

(assert (=> b!263173 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18767 0))(
  ( (Unit!18768) )
))
(declare-fun lt!404699 () Unit!18767)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11638) Unit!18767)

(assert (=> b!263173 (= lt!404699 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404695 () BitStream!11638)

(assert (=> b!263173 (isPrefixOf!0 lt!404695 lt!404695)))

(declare-fun lt!404697 () Unit!18767)

(assert (=> b!263173 (= lt!404697 (lemmaIsPrefixRefl!0 lt!404695))))

(assert (=> b!263173 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404694 () Unit!18767)

(assert (=> b!263173 (= lt!404694 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263173 (= lt!404695 (BitStream!11639 (buf!6880 w2!580) (currentByte!12732 w1!584) (currentBit!12727 w1!584)))))

(declare-fun res!220181 () Bool)

(assert (=> start!57414 (=> (not res!220181) (not e!183428))))

(assert (=> start!57414 (= res!220181 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57414 e!183428))

(declare-fun e!183425 () Bool)

(declare-fun inv!12 (BitStream!11638) Bool)

(assert (=> start!57414 (and (inv!12 w1!584) e!183425)))

(declare-fun e!183427 () Bool)

(assert (=> start!57414 (and (inv!12 w2!580) e!183427)))

(declare-fun b!263174 () Bool)

(declare-fun array_inv!6136 (array!14690) Bool)

(assert (=> b!263174 (= e!183427 (array_inv!6136 (buf!6880 w2!580)))))

(declare-fun b!263175 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14690 array!14690 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263175 (= e!183422 (not (arrayBitRangesEq!0 (buf!6880 w1!584) (buf!6880 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584)))))))

(declare-fun b!263176 () Bool)

(declare-fun e!183426 () Unit!18767)

(declare-fun lt!404696 () Unit!18767)

(assert (=> b!263176 (= e!183426 lt!404696)))

(declare-fun lt!404693 () (_ BitVec 64))

(assert (=> b!263176 (= lt!404693 (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14690 array!14690 (_ BitVec 64) (_ BitVec 64)) Unit!18767)

(assert (=> b!263176 (= lt!404696 (arrayBitRangesEqSymmetric!0 (buf!6880 w1!584) (buf!6880 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404693))))

(assert (=> b!263176 (arrayBitRangesEq!0 (buf!6880 w2!580) (buf!6880 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404693)))

(declare-fun b!263177 () Bool)

(declare-fun Unit!18769 () Unit!18767)

(assert (=> b!263177 (= e!183426 Unit!18769)))

(declare-fun b!263178 () Bool)

(declare-fun e!183429 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263178 (= e!183429 (invariant!0 (currentBit!12727 w1!584) (currentByte!12732 w1!584) (size!6412 (buf!6880 w1!584))))))

(declare-fun b!263179 () Bool)

(assert (=> b!263179 (= e!183424 e!183429)))

(declare-fun res!220183 () Bool)

(assert (=> b!263179 (=> res!220183 e!183429)))

(assert (=> b!263179 (= res!220183 (= (size!6412 (buf!6880 w1!584)) #b00000000000000000000000000000000))))

(declare-fun lt!404698 () Unit!18767)

(assert (=> b!263179 (= lt!404698 e!183426)))

(declare-fun c!12006 () Bool)

(assert (=> b!263179 (= c!12006 (not (= (size!6412 (buf!6880 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263180 () Bool)

(assert (=> b!263180 (= e!183425 (array_inv!6136 (buf!6880 w1!584)))))

(assert (= (and start!57414 res!220181) b!263173))

(assert (= (and b!263173 res!220182) b!263175))

(assert (= (and b!263173 (not res!220180)) b!263179))

(assert (= (and b!263179 c!12006) b!263176))

(assert (= (and b!263179 (not c!12006)) b!263177))

(assert (= (and b!263179 (not res!220183)) b!263178))

(assert (= start!57414 b!263180))

(assert (= start!57414 b!263174))

(declare-fun m!393431 () Bool)

(assert (=> b!263176 m!393431))

(declare-fun m!393433 () Bool)

(assert (=> b!263176 m!393433))

(declare-fun m!393435 () Bool)

(assert (=> b!263176 m!393435))

(assert (=> b!263175 m!393431))

(assert (=> b!263175 m!393431))

(declare-fun m!393437 () Bool)

(assert (=> b!263175 m!393437))

(declare-fun m!393439 () Bool)

(assert (=> start!57414 m!393439))

(declare-fun m!393441 () Bool)

(assert (=> start!57414 m!393441))

(declare-fun m!393443 () Bool)

(assert (=> start!57414 m!393443))

(declare-fun m!393445 () Bool)

(assert (=> b!263178 m!393445))

(declare-fun m!393447 () Bool)

(assert (=> b!263173 m!393447))

(declare-fun m!393449 () Bool)

(assert (=> b!263173 m!393449))

(declare-fun m!393451 () Bool)

(assert (=> b!263173 m!393451))

(declare-fun m!393453 () Bool)

(assert (=> b!263173 m!393453))

(declare-fun m!393455 () Bool)

(assert (=> b!263173 m!393455))

(declare-fun m!393457 () Bool)

(assert (=> b!263173 m!393457))

(declare-fun m!393459 () Bool)

(assert (=> b!263174 m!393459))

(declare-fun m!393461 () Bool)

(assert (=> b!263180 m!393461))

(push 1)

(assert (not b!263176))

(assert (not b!263175))

(assert (not start!57414))

(assert (not b!263174))

(assert (not b!263180))

(assert (not b!263173))

(assert (not b!263178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88798 () Bool)

(assert (=> d!88798 (= (invariant!0 (currentBit!12727 w1!584) (currentByte!12732 w1!584) (size!6412 (buf!6880 w1!584))) (and (bvsge (currentBit!12727 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12727 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12732 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12732 w1!584) (size!6412 (buf!6880 w1!584))) (and (= (currentBit!12727 w1!584) #b00000000000000000000000000000000) (= (currentByte!12732 w1!584) (size!6412 (buf!6880 w1!584)))))))))

(assert (=> b!263178 d!88798))

(declare-fun d!88800 () Bool)

(assert (=> d!88800 (= (array_inv!6136 (buf!6880 w2!580)) (bvsge (size!6412 (buf!6880 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!263174 d!88800))

(declare-fun d!88802 () Bool)

(assert (=> d!88802 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404744 () Unit!18767)

(declare-fun choose!11 (BitStream!11638) Unit!18767)

(assert (=> d!88802 (= lt!404744 (choose!11 w2!580))))

(assert (=> d!88802 (= (lemmaIsPrefixRefl!0 w2!580) lt!404744)))

(declare-fun bs!22534 () Bool)

(assert (= bs!22534 d!88802))

(assert (=> bs!22534 m!393455))

(declare-fun m!393527 () Bool)

(assert (=> bs!22534 m!393527))

(assert (=> b!263173 d!88802))

(declare-fun d!88806 () Bool)

(assert (=> d!88806 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404745 () Unit!18767)

(assert (=> d!88806 (= lt!404745 (choose!11 w1!584))))

(assert (=> d!88806 (= (lemmaIsPrefixRefl!0 w1!584) lt!404745)))

(declare-fun bs!22535 () Bool)

(assert (= bs!22535 d!88806))

(assert (=> bs!22535 m!393453))

(declare-fun m!393529 () Bool)

(assert (=> bs!22535 m!393529))

(assert (=> b!263173 d!88806))

(declare-fun d!88808 () Bool)

(assert (=> d!88808 (isPrefixOf!0 lt!404695 lt!404695)))

(declare-fun lt!404746 () Unit!18767)

(assert (=> d!88808 (= lt!404746 (choose!11 lt!404695))))

(assert (=> d!88808 (= (lemmaIsPrefixRefl!0 lt!404695) lt!404746)))

(declare-fun bs!22536 () Bool)

(assert (= bs!22536 d!88808))

(assert (=> bs!22536 m!393451))

(declare-fun m!393531 () Bool)

(assert (=> bs!22536 m!393531))

(assert (=> b!263173 d!88808))

(declare-fun d!88810 () Bool)

(declare-fun res!220218 () Bool)

(declare-fun e!183491 () Bool)

(assert (=> d!88810 (=> (not res!220218) (not e!183491))))

(assert (=> d!88810 (= res!220218 (= (size!6412 (buf!6880 lt!404695)) (size!6412 (buf!6880 lt!404695))))))

(assert (=> d!88810 (= (isPrefixOf!0 lt!404695 lt!404695) e!183491)))

(declare-fun b!263237 () Bool)

(declare-fun res!220216 () Bool)

(assert (=> b!263237 (=> (not res!220216) (not e!183491))))

(assert (=> b!263237 (= res!220216 (bvsle (bitIndex!0 (size!6412 (buf!6880 lt!404695)) (currentByte!12732 lt!404695) (currentBit!12727 lt!404695)) (bitIndex!0 (size!6412 (buf!6880 lt!404695)) (currentByte!12732 lt!404695) (currentBit!12727 lt!404695))))))

(declare-fun b!263238 () Bool)

(declare-fun e!183490 () Bool)

(assert (=> b!263238 (= e!183491 e!183490)))

(declare-fun res!220217 () Bool)

(assert (=> b!263238 (=> res!220217 e!183490)))

(assert (=> b!263238 (= res!220217 (= (size!6412 (buf!6880 lt!404695)) #b00000000000000000000000000000000))))

(declare-fun b!263239 () Bool)

(assert (=> b!263239 (= e!183490 (arrayBitRangesEq!0 (buf!6880 lt!404695) (buf!6880 lt!404695) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6412 (buf!6880 lt!404695)) (currentByte!12732 lt!404695) (currentBit!12727 lt!404695))))))

(assert (= (and d!88810 res!220218) b!263237))

(assert (= (and b!263237 res!220216) b!263238))

(assert (= (and b!263238 (not res!220217)) b!263239))

(declare-fun m!393533 () Bool)

(assert (=> b!263237 m!393533))

(assert (=> b!263237 m!393533))

(assert (=> b!263239 m!393533))

(assert (=> b!263239 m!393533))

(declare-fun m!393535 () Bool)

(assert (=> b!263239 m!393535))

(assert (=> b!263173 d!88810))

(declare-fun d!88812 () Bool)

(declare-fun res!220227 () Bool)

(declare-fun e!183501 () Bool)

(assert (=> d!88812 (=> (not res!220227) (not e!183501))))

(assert (=> d!88812 (= res!220227 (= (size!6412 (buf!6880 w1!584)) (size!6412 (buf!6880 w1!584))))))

(assert (=> d!88812 (= (isPrefixOf!0 w1!584 w1!584) e!183501)))

(declare-fun b!263250 () Bool)

(declare-fun res!220225 () Bool)

(assert (=> b!263250 (=> (not res!220225) (not e!183501))))

(assert (=> b!263250 (= res!220225 (bvsle (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584)) (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584))))))

(declare-fun b!263251 () Bool)

(declare-fun e!183500 () Bool)

(assert (=> b!263251 (= e!183501 e!183500)))

(declare-fun res!220226 () Bool)

(assert (=> b!263251 (=> res!220226 e!183500)))

(assert (=> b!263251 (= res!220226 (= (size!6412 (buf!6880 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263252 () Bool)

(assert (=> b!263252 (= e!183500 (arrayBitRangesEq!0 (buf!6880 w1!584) (buf!6880 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584))))))

(assert (= (and d!88812 res!220227) b!263250))

(assert (= (and b!263250 res!220225) b!263251))

(assert (= (and b!263251 (not res!220226)) b!263252))

(assert (=> b!263250 m!393431))

(assert (=> b!263250 m!393431))

(assert (=> b!263252 m!393431))

(assert (=> b!263252 m!393431))

(declare-fun m!393537 () Bool)

(assert (=> b!263252 m!393537))

(assert (=> b!263173 d!88812))

(declare-fun d!88814 () Bool)

(declare-fun res!220232 () Bool)

(declare-fun e!183505 () Bool)

(assert (=> d!88814 (=> (not res!220232) (not e!183505))))

(assert (=> d!88814 (= res!220232 (= (size!6412 (buf!6880 w2!580)) (size!6412 (buf!6880 w2!580))))))

(assert (=> d!88814 (= (isPrefixOf!0 w2!580 w2!580) e!183505)))

(declare-fun b!263255 () Bool)

(declare-fun res!220230 () Bool)

(assert (=> b!263255 (=> (not res!220230) (not e!183505))))

(assert (=> b!263255 (= res!220230 (bvsle (bitIndex!0 (size!6412 (buf!6880 w2!580)) (currentByte!12732 w2!580) (currentBit!12727 w2!580)) (bitIndex!0 (size!6412 (buf!6880 w2!580)) (currentByte!12732 w2!580) (currentBit!12727 w2!580))))))

(declare-fun b!263256 () Bool)

(declare-fun e!183504 () Bool)

(assert (=> b!263256 (= e!183505 e!183504)))

(declare-fun res!220231 () Bool)

(assert (=> b!263256 (=> res!220231 e!183504)))

(assert (=> b!263256 (= res!220231 (= (size!6412 (buf!6880 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!263257 () Bool)

(assert (=> b!263257 (= e!183504 (arrayBitRangesEq!0 (buf!6880 w2!580) (buf!6880 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6412 (buf!6880 w2!580)) (currentByte!12732 w2!580) (currentBit!12727 w2!580))))))

(assert (= (and d!88814 res!220232) b!263255))

(assert (= (and b!263255 res!220230) b!263256))

(assert (= (and b!263256 (not res!220231)) b!263257))

(declare-fun m!393539 () Bool)

(assert (=> b!263255 m!393539))

(assert (=> b!263255 m!393539))

(assert (=> b!263257 m!393539))

(assert (=> b!263257 m!393539))

(declare-fun m!393541 () Bool)

(assert (=> b!263257 m!393541))

(assert (=> b!263173 d!88814))

(declare-fun d!88816 () Bool)

(declare-fun res!220235 () Bool)

(declare-fun e!183507 () Bool)

(assert (=> d!88816 (=> (not res!220235) (not e!183507))))

(assert (=> d!88816 (= res!220235 (= (size!6412 (buf!6880 w1!584)) (size!6412 (buf!6880 w2!580))))))

(assert (=> d!88816 (= (isPrefixOf!0 w1!584 w2!580) e!183507)))

(declare-fun b!263258 () Bool)

(declare-fun res!220233 () Bool)

(assert (=> b!263258 (=> (not res!220233) (not e!183507))))

(assert (=> b!263258 (= res!220233 (bvsle (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584)) (bitIndex!0 (size!6412 (buf!6880 w2!580)) (currentByte!12732 w2!580) (currentBit!12727 w2!580))))))

(declare-fun b!263259 () Bool)

(declare-fun e!183506 () Bool)

(assert (=> b!263259 (= e!183507 e!183506)))

(declare-fun res!220234 () Bool)

(assert (=> b!263259 (=> res!220234 e!183506)))

(assert (=> b!263259 (= res!220234 (= (size!6412 (buf!6880 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263260 () Bool)

(assert (=> b!263260 (= e!183506 (arrayBitRangesEq!0 (buf!6880 w1!584) (buf!6880 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584))))))

(assert (= (and d!88816 res!220235) b!263258))

(assert (= (and b!263258 res!220233) b!263259))

(assert (= (and b!263259 (not res!220234)) b!263260))

(assert (=> b!263258 m!393431))

(assert (=> b!263258 m!393539))

(assert (=> b!263260 m!393431))

(assert (=> b!263260 m!393431))

(assert (=> b!263260 m!393437))

(assert (=> start!57414 d!88816))

(declare-fun d!88818 () Bool)

(assert (=> d!88818 (= (inv!12 w1!584) (invariant!0 (currentBit!12727 w1!584) (currentByte!12732 w1!584) (size!6412 (buf!6880 w1!584))))))

(declare-fun bs!22537 () Bool)

(assert (= bs!22537 d!88818))

(assert (=> bs!22537 m!393445))

(assert (=> start!57414 d!88818))

(declare-fun d!88820 () Bool)

(assert (=> d!88820 (= (inv!12 w2!580) (invariant!0 (currentBit!12727 w2!580) (currentByte!12732 w2!580) (size!6412 (buf!6880 w2!580))))))

(declare-fun bs!22538 () Bool)

(assert (= bs!22538 d!88820))

(declare-fun m!393543 () Bool)

(assert (=> bs!22538 m!393543))

(assert (=> start!57414 d!88820))

(declare-fun b!263309 () Bool)

(declare-fun e!183548 () Bool)

(declare-fun call!4043 () Bool)

(assert (=> b!263309 (= e!183548 call!4043)))

(declare-datatypes ((tuple4!328 0))(
  ( (tuple4!329 (_1!12144 (_ BitVec 32)) (_2!12144 (_ BitVec 32)) (_3!944 (_ BitVec 32)) (_4!164 (_ BitVec 32))) )
))
(declare-fun lt!404792 () tuple4!328)

(declare-fun bm!4040 () Bool)

(declare-fun c!12021 () Bool)

(declare-fun lt!404791 () (_ BitVec 32))

(declare-fun lt!404793 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4040 (= call!4043 (byteRangesEq!0 (ite c!12021 (select (arr!7399 (buf!6880 w1!584)) (_3!944 lt!404792)) (select (arr!7399 (buf!6880 w1!584)) (_4!164 lt!404792))) (ite c!12021 (select (arr!7399 (buf!6880 w2!580)) (_3!944 lt!404792)) (select (arr!7399 (buf!6880 w2!580)) (_4!164 lt!404792))) (ite c!12021 lt!404791 #b00000000000000000000000000000000) lt!404793))))

(declare-fun b!263310 () Bool)

(declare-fun e!183552 () Bool)

(declare-fun e!183547 () Bool)

(assert (=> b!263310 (= e!183552 e!183547)))

(declare-fun res!220272 () Bool)

(assert (=> b!263310 (= res!220272 (byteRangesEq!0 (select (arr!7399 (buf!6880 w1!584)) (_3!944 lt!404792)) (select (arr!7399 (buf!6880 w2!580)) (_3!944 lt!404792)) lt!404791 #b00000000000000000000000000001000))))

(assert (=> b!263310 (=> (not res!220272) (not e!183547))))

(declare-fun b!263311 () Bool)

(declare-fun e!183550 () Bool)

(assert (=> b!263311 (= e!183550 e!183552)))

(assert (=> b!263311 (= c!12021 (= (_3!944 lt!404792) (_4!164 lt!404792)))))

(declare-fun d!88822 () Bool)

(declare-fun res!220276 () Bool)

(declare-fun e!183551 () Bool)

(assert (=> d!88822 (=> res!220276 e!183551)))

(assert (=> d!88822 (= res!220276 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584))))))

(assert (=> d!88822 (= (arrayBitRangesEq!0 (buf!6880 w1!584) (buf!6880 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584))) e!183551)))

(declare-fun b!263312 () Bool)

(assert (=> b!263312 (= e!183551 e!183550)))

(declare-fun res!220274 () Bool)

(assert (=> b!263312 (=> (not res!220274) (not e!183550))))

(declare-fun e!183549 () Bool)

(assert (=> b!263312 (= res!220274 e!183549)))

(declare-fun res!220275 () Bool)

(assert (=> b!263312 (=> res!220275 e!183549)))

(assert (=> b!263312 (= res!220275 (bvsge (_1!12144 lt!404792) (_2!12144 lt!404792)))))

(assert (=> b!263312 (= lt!404793 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263312 (= lt!404791 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!328)

(assert (=> b!263312 (= lt!404792 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584))))))

(declare-fun b!263313 () Bool)

(assert (=> b!263313 (= e!183552 call!4043)))

(declare-fun b!263314 () Bool)

(declare-fun arrayRangesEq!1000 (array!14690 array!14690 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263314 (= e!183549 (arrayRangesEq!1000 (buf!6880 w1!584) (buf!6880 w2!580) (_1!12144 lt!404792) (_2!12144 lt!404792)))))

(declare-fun b!263315 () Bool)

(declare-fun res!220273 () Bool)

(assert (=> b!263315 (= res!220273 (= lt!404793 #b00000000000000000000000000000000))))

(assert (=> b!263315 (=> res!220273 e!183548)))

(assert (=> b!263315 (= e!183547 e!183548)))

(assert (= (and d!88822 (not res!220276)) b!263312))

(assert (= (and b!263312 (not res!220275)) b!263314))

(assert (= (and b!263312 res!220274) b!263311))

(assert (= (and b!263311 c!12021) b!263313))

(assert (= (and b!263311 (not c!12021)) b!263310))

(assert (= (and b!263310 res!220272) b!263315))

(assert (= (and b!263315 (not res!220273)) b!263309))

(assert (= (or b!263313 b!263309) bm!4040))

(declare-fun m!393581 () Bool)

(assert (=> bm!4040 m!393581))

(declare-fun m!393583 () Bool)

(assert (=> bm!4040 m!393583))

(declare-fun m!393585 () Bool)

(assert (=> bm!4040 m!393585))

(declare-fun m!393587 () Bool)

(assert (=> bm!4040 m!393587))

(declare-fun m!393589 () Bool)

(assert (=> bm!4040 m!393589))

(assert (=> b!263310 m!393589))

(assert (=> b!263310 m!393585))

(assert (=> b!263310 m!393589))

(assert (=> b!263310 m!393585))

(declare-fun m!393591 () Bool)

(assert (=> b!263310 m!393591))

(assert (=> b!263312 m!393431))

(declare-fun m!393593 () Bool)

(assert (=> b!263312 m!393593))

(declare-fun m!393595 () Bool)

(assert (=> b!263314 m!393595))

(assert (=> b!263175 d!88822))

(declare-fun d!88832 () Bool)

(declare-fun e!183582 () Bool)

(assert (=> d!88832 e!183582))

(declare-fun res!220323 () Bool)

(assert (=> d!88832 (=> (not res!220323) (not e!183582))))

(declare-fun lt!404837 () (_ BitVec 64))

(declare-fun lt!404832 () (_ BitVec 64))

(declare-fun lt!404833 () (_ BitVec 64))

(assert (=> d!88832 (= res!220323 (= lt!404833 (bvsub lt!404832 lt!404837)))))

(assert (=> d!88832 (or (= (bvand lt!404832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404837 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404832 lt!404837) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88832 (= lt!404837 (remainingBits!0 ((_ sign_extend 32) (size!6412 (buf!6880 w1!584))) ((_ sign_extend 32) (currentByte!12732 w1!584)) ((_ sign_extend 32) (currentBit!12727 w1!584))))))

(declare-fun lt!404835 () (_ BitVec 64))

(declare-fun lt!404834 () (_ BitVec 64))

(assert (=> d!88832 (= lt!404832 (bvmul lt!404835 lt!404834))))

(assert (=> d!88832 (or (= lt!404835 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404834 (bvsdiv (bvmul lt!404835 lt!404834) lt!404835)))))

(assert (=> d!88832 (= lt!404834 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88832 (= lt!404835 ((_ sign_extend 32) (size!6412 (buf!6880 w1!584))))))

(assert (=> d!88832 (= lt!404833 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12732 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12727 w1!584))))))

(assert (=> d!88832 (invariant!0 (currentBit!12727 w1!584) (currentByte!12732 w1!584) (size!6412 (buf!6880 w1!584)))))

(assert (=> d!88832 (= (bitIndex!0 (size!6412 (buf!6880 w1!584)) (currentByte!12732 w1!584) (currentBit!12727 w1!584)) lt!404833)))

(declare-fun b!263362 () Bool)

(declare-fun res!220324 () Bool)

(assert (=> b!263362 (=> (not res!220324) (not e!183582))))

(assert (=> b!263362 (= res!220324 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404833))))

(declare-fun b!263363 () Bool)

(declare-fun lt!404836 () (_ BitVec 64))

(assert (=> b!263363 (= e!183582 (bvsle lt!404833 (bvmul lt!404836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263363 (or (= lt!404836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404836)))))

(assert (=> b!263363 (= lt!404836 ((_ sign_extend 32) (size!6412 (buf!6880 w1!584))))))

(assert (= (and d!88832 res!220323) b!263362))

(assert (= (and b!263362 res!220324) b!263363))

(declare-fun m!393633 () Bool)

(assert (=> d!88832 m!393633))

(assert (=> d!88832 m!393445))

(assert (=> b!263175 d!88832))

(declare-fun d!88880 () Bool)

(assert (=> d!88880 (= (array_inv!6136 (buf!6880 w1!584)) (bvsge (size!6412 (buf!6880 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!263180 d!88880))

(assert (=> b!263176 d!88832))

(declare-fun d!88882 () Bool)

(assert (=> d!88882 (arrayBitRangesEq!0 (buf!6880 w2!580) (buf!6880 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404693)))

(declare-fun lt!404852 () Unit!18767)

(declare-fun choose!8 (array!14690 array!14690 (_ BitVec 64) (_ BitVec 64)) Unit!18767)

(assert (=> d!88882 (= lt!404852 (choose!8 (buf!6880 w1!584) (buf!6880 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404693))))

(assert (=> d!88882 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404693))))

(assert (=> d!88882 (= (arrayBitRangesEqSymmetric!0 (buf!6880 w1!584) (buf!6880 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404693) lt!404852)))

(declare-fun bs!22553 () Bool)

(assert (= bs!22553 d!88882))

(assert (=> bs!22553 m!393435))

(declare-fun m!393661 () Bool)

(assert (=> bs!22553 m!393661))

(assert (=> b!263176 d!88882))

(declare-fun b!263378 () Bool)

(declare-fun e!183596 () Bool)

(declare-fun call!4046 () Bool)

(assert (=> b!263378 (= e!183596 call!4046)))

(declare-fun lt!404855 () (_ BitVec 32))

(declare-fun c!12024 () Bool)

(declare-fun bm!4043 () Bool)

(declare-fun lt!404854 () tuple4!328)

(declare-fun lt!404853 () (_ BitVec 32))

(assert (=> bm!4043 (= call!4046 (byteRangesEq!0 (ite c!12024 (select (arr!7399 (buf!6880 w2!580)) (_3!944 lt!404854)) (select (arr!7399 (buf!6880 w2!580)) (_4!164 lt!404854))) (ite c!12024 (select (arr!7399 (buf!6880 w1!584)) (_3!944 lt!404854)) (select (arr!7399 (buf!6880 w1!584)) (_4!164 lt!404854))) (ite c!12024 lt!404853 #b00000000000000000000000000000000) lt!404855))))

(declare-fun b!263379 () Bool)

(declare-fun e!183600 () Bool)

(declare-fun e!183595 () Bool)

(assert (=> b!263379 (= e!183600 e!183595)))

(declare-fun res!220335 () Bool)

(assert (=> b!263379 (= res!220335 (byteRangesEq!0 (select (arr!7399 (buf!6880 w2!580)) (_3!944 lt!404854)) (select (arr!7399 (buf!6880 w1!584)) (_3!944 lt!404854)) lt!404853 #b00000000000000000000000000001000))))

(assert (=> b!263379 (=> (not res!220335) (not e!183595))))

(declare-fun b!263380 () Bool)

(declare-fun e!183598 () Bool)

(assert (=> b!263380 (= e!183598 e!183600)))

(assert (=> b!263380 (= c!12024 (= (_3!944 lt!404854) (_4!164 lt!404854)))))

(declare-fun d!88888 () Bool)

(declare-fun res!220339 () Bool)

(declare-fun e!183599 () Bool)

(assert (=> d!88888 (=> res!220339 e!183599)))

(assert (=> d!88888 (= res!220339 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!404693))))

(assert (=> d!88888 (= (arrayBitRangesEq!0 (buf!6880 w2!580) (buf!6880 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404693) e!183599)))

(declare-fun b!263381 () Bool)

(assert (=> b!263381 (= e!183599 e!183598)))

(declare-fun res!220337 () Bool)

(assert (=> b!263381 (=> (not res!220337) (not e!183598))))

(declare-fun e!183597 () Bool)

(assert (=> b!263381 (= res!220337 e!183597)))

(declare-fun res!220338 () Bool)

(assert (=> b!263381 (=> res!220338 e!183597)))

(assert (=> b!263381 (= res!220338 (bvsge (_1!12144 lt!404854) (_2!12144 lt!404854)))))

(assert (=> b!263381 (= lt!404855 ((_ extract 31 0) (bvsrem lt!404693 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263381 (= lt!404853 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263381 (= lt!404854 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!404693))))

(declare-fun b!263382 () Bool)

(assert (=> b!263382 (= e!183600 call!4046)))

(declare-fun b!263383 () Bool)

(assert (=> b!263383 (= e!183597 (arrayRangesEq!1000 (buf!6880 w2!580) (buf!6880 w1!584) (_1!12144 lt!404854) (_2!12144 lt!404854)))))

(declare-fun b!263384 () Bool)

(declare-fun res!220336 () Bool)

(assert (=> b!263384 (= res!220336 (= lt!404855 #b00000000000000000000000000000000))))

(assert (=> b!263384 (=> res!220336 e!183596)))

(assert (=> b!263384 (= e!183595 e!183596)))

(assert (= (and d!88888 (not res!220339)) b!263381))

(assert (= (and b!263381 (not res!220338)) b!263383))

(assert (= (and b!263381 res!220337) b!263380))

(assert (= (and b!263380 c!12024) b!263382))

(assert (= (and b!263380 (not c!12024)) b!263379))

(assert (= (and b!263379 res!220335) b!263384))

(assert (= (and b!263384 (not res!220336)) b!263378))

(assert (= (or b!263382 b!263378) bm!4043))

(declare-fun m!393673 () Bool)

(assert (=> bm!4043 m!393673))

(declare-fun m!393675 () Bool)

(assert (=> bm!4043 m!393675))

(declare-fun m!393677 () Bool)

(assert (=> bm!4043 m!393677))

(declare-fun m!393679 () Bool)

(assert (=> bm!4043 m!393679))

(declare-fun m!393681 () Bool)

(assert (=> bm!4043 m!393681))

(assert (=> b!263379 m!393681))

(assert (=> b!263379 m!393677))

(assert (=> b!263379 m!393681))

(assert (=> b!263379 m!393677))

(declare-fun m!393683 () Bool)

(assert (=> b!263379 m!393683))

(declare-fun m!393685 () Bool)

(assert (=> b!263381 m!393685))

(declare-fun m!393687 () Bool)

(assert (=> b!263383 m!393687))

(assert (=> b!263176 d!88888))

(push 1)

(assert (not d!88832))

(assert (not b!263312))

(assert (not b!263239))

(assert (not b!263255))

(assert (not b!263250))

(assert (not b!263257))

(assert (not b!263379))

(assert (not b!263258))

(assert (not d!88806))

(assert (not bm!4043))

(assert (not b!263237))

(assert (not bm!4040))

(assert (not d!88808))

(assert (not d!88818))

(assert (not b!263383))

(assert (not b!263252))

(assert (not b!263310))

(assert (not b!263381))

(assert (not d!88820))

(assert (not d!88802))

(assert (not d!88882))

(assert (not b!263260))

(assert (not b!263314))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

