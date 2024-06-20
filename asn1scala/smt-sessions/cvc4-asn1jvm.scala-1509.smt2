; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41766 () Bool)

(assert start!41766)

(declare-fun b!196458 () Bool)

(declare-fun e!135019 () Bool)

(declare-fun e!135020 () Bool)

(assert (=> b!196458 (= e!135019 (not e!135020))))

(declare-fun res!164386 () Bool)

(assert (=> b!196458 (=> res!164386 e!135020)))

(declare-fun lt!305558 () (_ BitVec 64))

(declare-fun lt!305561 () (_ BitVec 64))

(assert (=> b!196458 (= res!164386 (not (= lt!305558 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!305561))))))

(declare-datatypes ((array!10077 0))(
  ( (array!10078 (arr!5373 (Array (_ BitVec 32) (_ BitVec 8))) (size!4443 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7994 0))(
  ( (BitStream!7995 (buf!4929 array!10077) (currentByte!9249 (_ BitVec 32)) (currentBit!9244 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13885 0))(
  ( (Unit!13886) )
))
(declare-datatypes ((tuple2!16996 0))(
  ( (tuple2!16997 (_1!9143 Unit!13885) (_2!9143 BitStream!7994)) )
))
(declare-fun lt!305557 () tuple2!16996)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196458 (= lt!305558 (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305557))) (currentByte!9249 (_2!9143 lt!305557)) (currentBit!9244 (_2!9143 lt!305557))))))

(declare-fun thiss!1204 () BitStream!7994)

(assert (=> b!196458 (= lt!305561 (bitIndex!0 (size!4443 (buf!4929 thiss!1204)) (currentByte!9249 thiss!1204) (currentBit!9244 thiss!1204)))))

(declare-fun e!135014 () Bool)

(assert (=> b!196458 e!135014))

(declare-fun res!164378 () Bool)

(assert (=> b!196458 (=> (not res!164378) (not e!135014))))

(assert (=> b!196458 (= res!164378 (= (size!4443 (buf!4929 thiss!1204)) (size!4443 (buf!4929 (_2!9143 lt!305557)))))))

(declare-fun lt!305559 () Bool)

(declare-fun appendBit!0 (BitStream!7994 Bool) tuple2!16996)

(assert (=> b!196458 (= lt!305557 (appendBit!0 thiss!1204 lt!305559))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!196458 (= lt!305559 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!196459 () Bool)

(declare-fun res!164382 () Bool)

(declare-fun e!135015 () Bool)

(assert (=> b!196459 (=> (not res!164382) (not e!135015))))

(declare-fun isPrefixOf!0 (BitStream!7994 BitStream!7994) Bool)

(assert (=> b!196459 (= res!164382 (isPrefixOf!0 thiss!1204 (_2!9143 lt!305557)))))

(declare-fun b!196460 () Bool)

(declare-fun e!135016 () Bool)

(assert (=> b!196460 (= e!135020 e!135016)))

(declare-fun res!164383 () Bool)

(assert (=> b!196460 (=> res!164383 e!135016)))

(declare-fun lt!305560 () tuple2!16996)

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!196460 (= res!164383 (not (= (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305560))) (currentByte!9249 (_2!9143 lt!305560)) (currentBit!9244 (_2!9143 lt!305560))) (bvsub (bvsub (bvadd lt!305558 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!196460 (isPrefixOf!0 thiss!1204 (_2!9143 lt!305560))))

(declare-fun lt!305555 () Unit!13885)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7994 BitStream!7994 BitStream!7994) Unit!13885)

(assert (=> b!196460 (= lt!305555 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9143 lt!305557) (_2!9143 lt!305560)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7994 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16996)

(assert (=> b!196460 (= lt!305560 (appendBitsLSBFirstLoopTR!0 (_2!9143 lt!305557) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!164384 () Bool)

(assert (=> start!41766 (=> (not res!164384) (not e!135019))))

(assert (=> start!41766 (= res!164384 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41766 e!135019))

(assert (=> start!41766 true))

(declare-fun e!135013 () Bool)

(declare-fun inv!12 (BitStream!7994) Bool)

(assert (=> start!41766 (and (inv!12 thiss!1204) e!135013)))

(declare-fun b!196461 () Bool)

(declare-fun e!135018 () Bool)

(assert (=> b!196461 (= e!135015 e!135018)))

(declare-fun res!164380 () Bool)

(assert (=> b!196461 (=> (not res!164380) (not e!135018))))

(declare-datatypes ((tuple2!16998 0))(
  ( (tuple2!16999 (_1!9144 BitStream!7994) (_2!9144 Bool)) )
))
(declare-fun lt!305556 () tuple2!16998)

(assert (=> b!196461 (= res!164380 (and (= (_2!9144 lt!305556) lt!305559) (= (_1!9144 lt!305556) (_2!9143 lt!305557))))))

(declare-fun readBitPure!0 (BitStream!7994) tuple2!16998)

(declare-fun readerFrom!0 (BitStream!7994 (_ BitVec 32) (_ BitVec 32)) BitStream!7994)

(assert (=> b!196461 (= lt!305556 (readBitPure!0 (readerFrom!0 (_2!9143 lt!305557) (currentBit!9244 thiss!1204) (currentByte!9249 thiss!1204))))))

(declare-fun b!196462 () Bool)

(assert (=> b!196462 (= e!135016 (= (size!4443 (buf!4929 (_2!9143 lt!305560))) (size!4443 (buf!4929 thiss!1204))))))

(declare-fun b!196463 () Bool)

(declare-fun res!164381 () Bool)

(assert (=> b!196463 (=> (not res!164381) (not e!135019))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196463 (= res!164381 (invariant!0 (currentBit!9244 thiss!1204) (currentByte!9249 thiss!1204) (size!4443 (buf!4929 thiss!1204))))))

(declare-fun b!196464 () Bool)

(assert (=> b!196464 (= e!135014 e!135015)))

(declare-fun res!164379 () Bool)

(assert (=> b!196464 (=> (not res!164379) (not e!135015))))

(declare-fun lt!305562 () (_ BitVec 64))

(declare-fun lt!305563 () (_ BitVec 64))

(assert (=> b!196464 (= res!164379 (= lt!305562 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!305563)))))

(assert (=> b!196464 (= lt!305562 (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305557))) (currentByte!9249 (_2!9143 lt!305557)) (currentBit!9244 (_2!9143 lt!305557))))))

(assert (=> b!196464 (= lt!305563 (bitIndex!0 (size!4443 (buf!4929 thiss!1204)) (currentByte!9249 thiss!1204) (currentBit!9244 thiss!1204)))))

(declare-fun b!196465 () Bool)

(declare-fun res!164388 () Bool)

(assert (=> b!196465 (=> (not res!164388) (not e!135019))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196465 (= res!164388 (validate_offset_bits!1 ((_ sign_extend 32) (size!4443 (buf!4929 thiss!1204))) ((_ sign_extend 32) (currentByte!9249 thiss!1204)) ((_ sign_extend 32) (currentBit!9244 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!196466 () Bool)

(declare-fun res!164385 () Bool)

(assert (=> b!196466 (=> (not res!164385) (not e!135019))))

(assert (=> b!196466 (= res!164385 (not (= i!590 nBits!348)))))

(declare-fun b!196467 () Bool)

(declare-fun array_inv!4184 (array!10077) Bool)

(assert (=> b!196467 (= e!135013 (array_inv!4184 (buf!4929 thiss!1204)))))

(declare-fun b!196468 () Bool)

(assert (=> b!196468 (= e!135018 (= (bitIndex!0 (size!4443 (buf!4929 (_1!9144 lt!305556))) (currentByte!9249 (_1!9144 lt!305556)) (currentBit!9244 (_1!9144 lt!305556))) lt!305562))))

(declare-fun b!196469 () Bool)

(declare-fun res!164387 () Bool)

(assert (=> b!196469 (=> res!164387 e!135016)))

(assert (=> b!196469 (= res!164387 (not (invariant!0 (currentBit!9244 (_2!9143 lt!305560)) (currentByte!9249 (_2!9143 lt!305560)) (size!4443 (buf!4929 (_2!9143 lt!305560))))))))

(assert (= (and start!41766 res!164384) b!196465))

(assert (= (and b!196465 res!164388) b!196463))

(assert (= (and b!196463 res!164381) b!196466))

(assert (= (and b!196466 res!164385) b!196458))

(assert (= (and b!196458 res!164378) b!196464))

(assert (= (and b!196464 res!164379) b!196459))

(assert (= (and b!196459 res!164382) b!196461))

(assert (= (and b!196461 res!164380) b!196468))

(assert (= (and b!196458 (not res!164386)) b!196460))

(assert (= (and b!196460 (not res!164383)) b!196469))

(assert (= (and b!196469 (not res!164387)) b!196462))

(assert (= start!41766 b!196467))

(declare-fun m!303861 () Bool)

(assert (=> b!196460 m!303861))

(declare-fun m!303863 () Bool)

(assert (=> b!196460 m!303863))

(declare-fun m!303865 () Bool)

(assert (=> b!196460 m!303865))

(declare-fun m!303867 () Bool)

(assert (=> b!196460 m!303867))

(declare-fun m!303869 () Bool)

(assert (=> b!196469 m!303869))

(declare-fun m!303871 () Bool)

(assert (=> start!41766 m!303871))

(declare-fun m!303873 () Bool)

(assert (=> b!196461 m!303873))

(assert (=> b!196461 m!303873))

(declare-fun m!303875 () Bool)

(assert (=> b!196461 m!303875))

(declare-fun m!303877 () Bool)

(assert (=> b!196459 m!303877))

(declare-fun m!303879 () Bool)

(assert (=> b!196458 m!303879))

(declare-fun m!303881 () Bool)

(assert (=> b!196458 m!303881))

(declare-fun m!303883 () Bool)

(assert (=> b!196458 m!303883))

(assert (=> b!196464 m!303879))

(assert (=> b!196464 m!303881))

(declare-fun m!303885 () Bool)

(assert (=> b!196463 m!303885))

(declare-fun m!303887 () Bool)

(assert (=> b!196465 m!303887))

(declare-fun m!303889 () Bool)

(assert (=> b!196467 m!303889))

(declare-fun m!303891 () Bool)

(assert (=> b!196468 m!303891))

(push 1)

(assert (not start!41766))

(assert (not b!196458))

(assert (not b!196469))

(assert (not b!196459))

(assert (not b!196464))

(assert (not b!196460))

(assert (not b!196465))

(assert (not b!196467))

(assert (not b!196461))

(assert (not b!196468))

(assert (not b!196463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66463 () Bool)

(declare-datatypes ((tuple2!17002 0))(
  ( (tuple2!17003 (_1!9146 Bool) (_2!9146 BitStream!7994)) )
))
(declare-fun lt!305617 () tuple2!17002)

(declare-fun readBit!0 (BitStream!7994) tuple2!17002)

(assert (=> d!66463 (= lt!305617 (readBit!0 (readerFrom!0 (_2!9143 lt!305557) (currentBit!9244 thiss!1204) (currentByte!9249 thiss!1204))))))

(assert (=> d!66463 (= (readBitPure!0 (readerFrom!0 (_2!9143 lt!305557) (currentBit!9244 thiss!1204) (currentByte!9249 thiss!1204))) (tuple2!16999 (_2!9146 lt!305617) (_1!9146 lt!305617)))))

(declare-fun bs!16513 () Bool)

(assert (= bs!16513 d!66463))

(assert (=> bs!16513 m!303873))

(declare-fun m!303911 () Bool)

(assert (=> bs!16513 m!303911))

(assert (=> b!196461 d!66463))

(declare-fun d!66467 () Bool)

(declare-fun e!135044 () Bool)

(assert (=> d!66467 e!135044))

(declare-fun res!164429 () Bool)

(assert (=> d!66467 (=> (not res!164429) (not e!135044))))

(assert (=> d!66467 (= res!164429 (invariant!0 (currentBit!9244 (_2!9143 lt!305557)) (currentByte!9249 (_2!9143 lt!305557)) (size!4443 (buf!4929 (_2!9143 lt!305557)))))))

(assert (=> d!66467 (= (readerFrom!0 (_2!9143 lt!305557) (currentBit!9244 thiss!1204) (currentByte!9249 thiss!1204)) (BitStream!7995 (buf!4929 (_2!9143 lt!305557)) (currentByte!9249 thiss!1204) (currentBit!9244 thiss!1204)))))

(declare-fun b!196509 () Bool)

(assert (=> b!196509 (= e!135044 (invariant!0 (currentBit!9244 thiss!1204) (currentByte!9249 thiss!1204) (size!4443 (buf!4929 (_2!9143 lt!305557)))))))

(assert (= (and d!66467 res!164429) b!196509))

(declare-fun m!303915 () Bool)

(assert (=> d!66467 m!303915))

(declare-fun m!303917 () Bool)

(assert (=> b!196509 m!303917))

(assert (=> b!196461 d!66467))

(declare-fun d!66471 () Bool)

(assert (=> d!66471 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9244 thiss!1204) (currentByte!9249 thiss!1204) (size!4443 (buf!4929 thiss!1204))))))

(declare-fun bs!16514 () Bool)

(assert (= bs!16514 d!66471))

(assert (=> bs!16514 m!303885))

(assert (=> start!41766 d!66471))

(declare-fun d!66473 () Bool)

(assert (=> d!66473 (= (array_inv!4184 (buf!4929 thiss!1204)) (bvsge (size!4443 (buf!4929 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!196467 d!66473))

(declare-fun d!66475 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66475 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4443 (buf!4929 thiss!1204))) ((_ sign_extend 32) (currentByte!9249 thiss!1204)) ((_ sign_extend 32) (currentBit!9244 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4443 (buf!4929 thiss!1204))) ((_ sign_extend 32) (currentByte!9249 thiss!1204)) ((_ sign_extend 32) (currentBit!9244 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16515 () Bool)

(assert (= bs!16515 d!66475))

(declare-fun m!303933 () Bool)

(assert (=> bs!16515 m!303933))

(assert (=> b!196465 d!66475))

(declare-fun d!66479 () Bool)

(declare-fun e!135057 () Bool)

(assert (=> d!66479 e!135057))

(declare-fun res!164450 () Bool)

(assert (=> d!66479 (=> (not res!164450) (not e!135057))))

(declare-fun lt!305659 () (_ BitVec 64))

(declare-fun lt!305654 () (_ BitVec 64))

(declare-fun lt!305655 () (_ BitVec 64))

(assert (=> d!66479 (= res!164450 (= lt!305659 (bvsub lt!305654 lt!305655)))))

(assert (=> d!66479 (or (= (bvand lt!305654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305655 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305654 lt!305655) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66479 (= lt!305655 (remainingBits!0 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!305560)))) ((_ sign_extend 32) (currentByte!9249 (_2!9143 lt!305560))) ((_ sign_extend 32) (currentBit!9244 (_2!9143 lt!305560)))))))

(declare-fun lt!305656 () (_ BitVec 64))

(declare-fun lt!305658 () (_ BitVec 64))

(assert (=> d!66479 (= lt!305654 (bvmul lt!305656 lt!305658))))

(assert (=> d!66479 (or (= lt!305656 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!305658 (bvsdiv (bvmul lt!305656 lt!305658) lt!305656)))))

(assert (=> d!66479 (= lt!305658 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66479 (= lt!305656 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!305560)))))))

(assert (=> d!66479 (= lt!305659 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9249 (_2!9143 lt!305560))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9244 (_2!9143 lt!305560)))))))

(assert (=> d!66479 (invariant!0 (currentBit!9244 (_2!9143 lt!305560)) (currentByte!9249 (_2!9143 lt!305560)) (size!4443 (buf!4929 (_2!9143 lt!305560))))))

(assert (=> d!66479 (= (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305560))) (currentByte!9249 (_2!9143 lt!305560)) (currentBit!9244 (_2!9143 lt!305560))) lt!305659)))

(declare-fun b!196529 () Bool)

(declare-fun res!164451 () Bool)

(assert (=> b!196529 (=> (not res!164451) (not e!135057))))

(assert (=> b!196529 (= res!164451 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!305659))))

(declare-fun b!196530 () Bool)

(declare-fun lt!305657 () (_ BitVec 64))

(assert (=> b!196530 (= e!135057 (bvsle lt!305659 (bvmul lt!305657 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196530 (or (= lt!305657 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!305657 #b0000000000000000000000000000000000000000000000000000000000001000) lt!305657)))))

(assert (=> b!196530 (= lt!305657 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!305560)))))))

(assert (= (and d!66479 res!164450) b!196529))

(assert (= (and b!196529 res!164451) b!196530))

(declare-fun m!303943 () Bool)

(assert (=> d!66479 m!303943))

(assert (=> d!66479 m!303869))

(assert (=> b!196460 d!66479))

(declare-fun d!66493 () Bool)

(declare-fun res!164461 () Bool)

(declare-fun e!135065 () Bool)

(assert (=> d!66493 (=> (not res!164461) (not e!135065))))

(assert (=> d!66493 (= res!164461 (= (size!4443 (buf!4929 thiss!1204)) (size!4443 (buf!4929 (_2!9143 lt!305560)))))))

(assert (=> d!66493 (= (isPrefixOf!0 thiss!1204 (_2!9143 lt!305560)) e!135065)))

(declare-fun b!196540 () Bool)

(declare-fun res!164463 () Bool)

(assert (=> b!196540 (=> (not res!164463) (not e!135065))))

(assert (=> b!196540 (= res!164463 (bvsle (bitIndex!0 (size!4443 (buf!4929 thiss!1204)) (currentByte!9249 thiss!1204) (currentBit!9244 thiss!1204)) (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305560))) (currentByte!9249 (_2!9143 lt!305560)) (currentBit!9244 (_2!9143 lt!305560)))))))

(declare-fun b!196541 () Bool)

(declare-fun e!135064 () Bool)

(assert (=> b!196541 (= e!135065 e!135064)))

(declare-fun res!164462 () Bool)

(assert (=> b!196541 (=> res!164462 e!135064)))

(assert (=> b!196541 (= res!164462 (= (size!4443 (buf!4929 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196542 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10077 array!10077 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196542 (= e!135064 (arrayBitRangesEq!0 (buf!4929 thiss!1204) (buf!4929 (_2!9143 lt!305560)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4443 (buf!4929 thiss!1204)) (currentByte!9249 thiss!1204) (currentBit!9244 thiss!1204))))))

(assert (= (and d!66493 res!164461) b!196540))

(assert (= (and b!196540 res!164463) b!196541))

(assert (= (and b!196541 (not res!164462)) b!196542))

(assert (=> b!196540 m!303881))

(assert (=> b!196540 m!303861))

(assert (=> b!196542 m!303881))

(assert (=> b!196542 m!303881))

(declare-fun m!303949 () Bool)

(assert (=> b!196542 m!303949))

(assert (=> b!196460 d!66493))

(declare-fun d!66499 () Bool)

(assert (=> d!66499 (isPrefixOf!0 thiss!1204 (_2!9143 lt!305560))))

(declare-fun lt!305665 () Unit!13885)

(declare-fun choose!30 (BitStream!7994 BitStream!7994 BitStream!7994) Unit!13885)

(assert (=> d!66499 (= lt!305665 (choose!30 thiss!1204 (_2!9143 lt!305557) (_2!9143 lt!305560)))))

(assert (=> d!66499 (isPrefixOf!0 thiss!1204 (_2!9143 lt!305557))))

(assert (=> d!66499 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9143 lt!305557) (_2!9143 lt!305560)) lt!305665)))

(declare-fun bs!16520 () Bool)

(assert (= bs!16520 d!66499))

(assert (=> bs!16520 m!303863))

(declare-fun m!303951 () Bool)

(assert (=> bs!16520 m!303951))

(assert (=> bs!16520 m!303877))

(assert (=> b!196460 d!66499))

(declare-fun b!196644 () Bool)

(declare-fun res!164545 () Bool)

(declare-fun call!3089 () Bool)

(assert (=> b!196644 (= res!164545 call!3089)))

(declare-fun e!135131 () Bool)

(assert (=> b!196644 (=> (not res!164545) (not e!135131))))

(declare-fun b!196645 () Bool)

(declare-fun e!135128 () tuple2!16996)

(declare-fun lt!306009 () tuple2!16996)

(assert (=> b!196645 (= e!135128 (tuple2!16997 (_1!9143 lt!306009) (_2!9143 lt!306009)))))

(declare-fun lt!306003 () Bool)

(assert (=> b!196645 (= lt!306003 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!306041 () tuple2!16996)

(assert (=> b!196645 (= lt!306041 (appendBit!0 (_2!9143 lt!305557) lt!306003))))

(declare-fun res!164551 () Bool)

(assert (=> b!196645 (= res!164551 (= (size!4443 (buf!4929 (_2!9143 lt!305557))) (size!4443 (buf!4929 (_2!9143 lt!306041)))))))

(assert (=> b!196645 (=> (not res!164551) (not e!135131))))

(assert (=> b!196645 e!135131))

(declare-fun lt!306016 () tuple2!16996)

(assert (=> b!196645 (= lt!306016 lt!306041)))

(assert (=> b!196645 (= lt!306009 (appendBitsLSBFirstLoopTR!0 (_2!9143 lt!306016) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!305992 () Unit!13885)

(assert (=> b!196645 (= lt!305992 (lemmaIsPrefixTransitive!0 (_2!9143 lt!305557) (_2!9143 lt!306016) (_2!9143 lt!306009)))))

(assert (=> b!196645 (isPrefixOf!0 (_2!9143 lt!305557) (_2!9143 lt!306009))))

(declare-fun lt!306019 () Unit!13885)

(assert (=> b!196645 (= lt!306019 lt!305992)))

(assert (=> b!196645 (invariant!0 (currentBit!9244 (_2!9143 lt!305557)) (currentByte!9249 (_2!9143 lt!305557)) (size!4443 (buf!4929 (_2!9143 lt!306016))))))

(declare-fun lt!306039 () BitStream!7994)

(assert (=> b!196645 (= lt!306039 (BitStream!7995 (buf!4929 (_2!9143 lt!306016)) (currentByte!9249 (_2!9143 lt!305557)) (currentBit!9244 (_2!9143 lt!305557))))))

(assert (=> b!196645 (invariant!0 (currentBit!9244 lt!306039) (currentByte!9249 lt!306039) (size!4443 (buf!4929 (_2!9143 lt!306009))))))

(declare-fun lt!306025 () BitStream!7994)

(assert (=> b!196645 (= lt!306025 (BitStream!7995 (buf!4929 (_2!9143 lt!306009)) (currentByte!9249 lt!306039) (currentBit!9244 lt!306039)))))

(declare-fun lt!306032 () tuple2!16998)

(assert (=> b!196645 (= lt!306032 (readBitPure!0 lt!306039))))

(declare-fun lt!305994 () tuple2!16998)

(assert (=> b!196645 (= lt!305994 (readBitPure!0 lt!306025))))

(declare-fun lt!306004 () Unit!13885)

(declare-fun readBitPrefixLemma!0 (BitStream!7994 BitStream!7994) Unit!13885)

(assert (=> b!196645 (= lt!306004 (readBitPrefixLemma!0 lt!306039 (_2!9143 lt!306009)))))

(declare-fun res!164546 () Bool)

(assert (=> b!196645 (= res!164546 (= (bitIndex!0 (size!4443 (buf!4929 (_1!9144 lt!306032))) (currentByte!9249 (_1!9144 lt!306032)) (currentBit!9244 (_1!9144 lt!306032))) (bitIndex!0 (size!4443 (buf!4929 (_1!9144 lt!305994))) (currentByte!9249 (_1!9144 lt!305994)) (currentBit!9244 (_1!9144 lt!305994)))))))

(declare-fun e!135124 () Bool)

(assert (=> b!196645 (=> (not res!164546) (not e!135124))))

(assert (=> b!196645 e!135124))

(declare-fun lt!306037 () Unit!13885)

(assert (=> b!196645 (= lt!306037 lt!306004)))

(declare-datatypes ((tuple2!17010 0))(
  ( (tuple2!17011 (_1!9150 BitStream!7994) (_2!9150 BitStream!7994)) )
))
(declare-fun lt!306046 () tuple2!17010)

(declare-fun reader!0 (BitStream!7994 BitStream!7994) tuple2!17010)

(assert (=> b!196645 (= lt!306046 (reader!0 (_2!9143 lt!305557) (_2!9143 lt!306009)))))

(declare-fun lt!306024 () tuple2!17010)

(assert (=> b!196645 (= lt!306024 (reader!0 (_2!9143 lt!306016) (_2!9143 lt!306009)))))

(declare-fun lt!306008 () tuple2!16998)

(assert (=> b!196645 (= lt!306008 (readBitPure!0 (_1!9150 lt!306046)))))

(assert (=> b!196645 (= (_2!9144 lt!306008) lt!306003)))

(declare-fun lt!305999 () Unit!13885)

(declare-fun Unit!13898 () Unit!13885)

(assert (=> b!196645 (= lt!305999 Unit!13898)))

(declare-fun lt!305993 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196645 (= lt!305993 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305997 () (_ BitVec 64))

(assert (=> b!196645 (= lt!305997 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305998 () Unit!13885)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7994 array!10077 (_ BitVec 64)) Unit!13885)

(assert (=> b!196645 (= lt!305998 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9143 lt!305557) (buf!4929 (_2!9143 lt!306009)) lt!305997))))

(assert (=> b!196645 (validate_offset_bits!1 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!306009)))) ((_ sign_extend 32) (currentByte!9249 (_2!9143 lt!305557))) ((_ sign_extend 32) (currentBit!9244 (_2!9143 lt!305557))) lt!305997)))

(declare-fun lt!306036 () Unit!13885)

(assert (=> b!196645 (= lt!306036 lt!305998)))

(declare-datatypes ((tuple2!17012 0))(
  ( (tuple2!17013 (_1!9151 BitStream!7994) (_2!9151 (_ BitVec 64))) )
))
(declare-fun lt!306040 () tuple2!17012)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17012)

(assert (=> b!196645 (= lt!306040 (readNBitsLSBFirstsLoopPure!0 (_1!9150 lt!306046) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305993))))

(declare-fun lt!306044 () (_ BitVec 64))

(assert (=> b!196645 (= lt!306044 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!306022 () Unit!13885)

(assert (=> b!196645 (= lt!306022 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9143 lt!306016) (buf!4929 (_2!9143 lt!306009)) lt!306044))))

(assert (=> b!196645 (validate_offset_bits!1 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!306009)))) ((_ sign_extend 32) (currentByte!9249 (_2!9143 lt!306016))) ((_ sign_extend 32) (currentBit!9244 (_2!9143 lt!306016))) lt!306044)))

(declare-fun lt!306012 () Unit!13885)

(assert (=> b!196645 (= lt!306012 lt!306022)))

(declare-fun lt!305996 () tuple2!17012)

(assert (=> b!196645 (= lt!305996 (readNBitsLSBFirstsLoopPure!0 (_1!9150 lt!306024) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!305993 (ite (_2!9144 lt!306008) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!306027 () tuple2!17012)

(assert (=> b!196645 (= lt!306027 (readNBitsLSBFirstsLoopPure!0 (_1!9150 lt!306046) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305993))))

(declare-fun c!9789 () Bool)

(assert (=> b!196645 (= c!9789 (_2!9144 (readBitPure!0 (_1!9150 lt!306046))))))

(declare-fun lt!306034 () tuple2!17012)

(declare-fun e!135126 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7994 (_ BitVec 64)) BitStream!7994)

(assert (=> b!196645 (= lt!306034 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9150 lt!306046) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!305993 e!135126)))))

(declare-fun lt!306018 () Unit!13885)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13885)

(assert (=> b!196645 (= lt!306018 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9150 lt!306046) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305993))))

(assert (=> b!196645 (and (= (_2!9151 lt!306027) (_2!9151 lt!306034)) (= (_1!9151 lt!306027) (_1!9151 lt!306034)))))

(declare-fun lt!306015 () Unit!13885)

(assert (=> b!196645 (= lt!306015 lt!306018)))

(assert (=> b!196645 (= (_1!9150 lt!306046) (withMovedBitIndex!0 (_2!9150 lt!306046) (bvsub (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305557))) (currentByte!9249 (_2!9143 lt!305557)) (currentBit!9244 (_2!9143 lt!305557))) (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!306009))) (currentByte!9249 (_2!9143 lt!306009)) (currentBit!9244 (_2!9143 lt!306009))))))))

(declare-fun lt!306011 () Unit!13885)

(declare-fun Unit!13899 () Unit!13885)

(assert (=> b!196645 (= lt!306011 Unit!13899)))

(assert (=> b!196645 (= (_1!9150 lt!306024) (withMovedBitIndex!0 (_2!9150 lt!306024) (bvsub (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!306016))) (currentByte!9249 (_2!9143 lt!306016)) (currentBit!9244 (_2!9143 lt!306016))) (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!306009))) (currentByte!9249 (_2!9143 lt!306009)) (currentBit!9244 (_2!9143 lt!306009))))))))

(declare-fun lt!306010 () Unit!13885)

(declare-fun Unit!13900 () Unit!13885)

(assert (=> b!196645 (= lt!306010 Unit!13900)))

(assert (=> b!196645 (= (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305557))) (currentByte!9249 (_2!9143 lt!305557)) (currentBit!9244 (_2!9143 lt!305557))) (bvsub (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!306016))) (currentByte!9249 (_2!9143 lt!306016)) (currentBit!9244 (_2!9143 lt!306016))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!306021 () Unit!13885)

(declare-fun Unit!13901 () Unit!13885)

(assert (=> b!196645 (= lt!306021 Unit!13901)))

(assert (=> b!196645 (= (_2!9151 lt!306040) (_2!9151 lt!305996))))

(declare-fun lt!306000 () Unit!13885)

(declare-fun Unit!13902 () Unit!13885)

(assert (=> b!196645 (= lt!306000 Unit!13902)))

(assert (=> b!196645 (invariant!0 (currentBit!9244 (_2!9143 lt!306009)) (currentByte!9249 (_2!9143 lt!306009)) (size!4443 (buf!4929 (_2!9143 lt!306009))))))

(declare-fun lt!306038 () Unit!13885)

(declare-fun Unit!13903 () Unit!13885)

(assert (=> b!196645 (= lt!306038 Unit!13903)))

(assert (=> b!196645 (= (size!4443 (buf!4929 (_2!9143 lt!305557))) (size!4443 (buf!4929 (_2!9143 lt!306009))))))

(declare-fun lt!306006 () Unit!13885)

(declare-fun Unit!13904 () Unit!13885)

(assert (=> b!196645 (= lt!306006 Unit!13904)))

(assert (=> b!196645 (= (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!306009))) (currentByte!9249 (_2!9143 lt!306009)) (currentBit!9244 (_2!9143 lt!306009))) (bvsub (bvadd (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305557))) (currentByte!9249 (_2!9143 lt!305557)) (currentBit!9244 (_2!9143 lt!305557))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306030 () Unit!13885)

(declare-fun Unit!13905 () Unit!13885)

(assert (=> b!196645 (= lt!306030 Unit!13905)))

(declare-fun lt!306031 () Unit!13885)

(declare-fun Unit!13906 () Unit!13885)

(assert (=> b!196645 (= lt!306031 Unit!13906)))

(declare-fun lt!306047 () tuple2!17010)

(assert (=> b!196645 (= lt!306047 (reader!0 (_2!9143 lt!305557) (_2!9143 lt!306009)))))

(declare-fun lt!306007 () (_ BitVec 64))

(assert (=> b!196645 (= lt!306007 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306033 () Unit!13885)

(assert (=> b!196645 (= lt!306033 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9143 lt!305557) (buf!4929 (_2!9143 lt!306009)) lt!306007))))

(assert (=> b!196645 (validate_offset_bits!1 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!306009)))) ((_ sign_extend 32) (currentByte!9249 (_2!9143 lt!305557))) ((_ sign_extend 32) (currentBit!9244 (_2!9143 lt!305557))) lt!306007)))

(declare-fun lt!306035 () Unit!13885)

(assert (=> b!196645 (= lt!306035 lt!306033)))

(declare-fun lt!306002 () tuple2!17012)

(assert (=> b!196645 (= lt!306002 (readNBitsLSBFirstsLoopPure!0 (_1!9150 lt!306047) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!164548 () Bool)

(assert (=> b!196645 (= res!164548 (= (_2!9151 lt!306002) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!135127 () Bool)

(assert (=> b!196645 (=> (not res!164548) (not e!135127))))

(assert (=> b!196645 e!135127))

(declare-fun lt!306045 () Unit!13885)

(declare-fun Unit!13908 () Unit!13885)

(assert (=> b!196645 (= lt!306045 Unit!13908)))

(declare-fun c!9788 () Bool)

(declare-fun bm!3086 () Bool)

(assert (=> bm!3086 (= call!3089 (isPrefixOf!0 (_2!9143 lt!305557) (ite c!9788 (_2!9143 lt!305557) (_2!9143 lt!306041))))))

(declare-fun b!196646 () Bool)

(declare-fun e!135130 () Bool)

(declare-fun lt!305995 () tuple2!16998)

(assert (=> b!196646 (= e!135130 (= (bitIndex!0 (size!4443 (buf!4929 (_1!9144 lt!305995))) (currentByte!9249 (_1!9144 lt!305995)) (currentBit!9244 (_1!9144 lt!305995))) (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!306041))) (currentByte!9249 (_2!9143 lt!306041)) (currentBit!9244 (_2!9143 lt!306041)))))))

(declare-fun b!196647 () Bool)

(declare-fun e!135125 () Bool)

(declare-fun e!135129 () Bool)

(assert (=> b!196647 (= e!135125 e!135129)))

(declare-fun res!164550 () Bool)

(assert (=> b!196647 (=> (not res!164550) (not e!135129))))

(declare-fun lt!306029 () tuple2!17012)

(assert (=> b!196647 (= res!164550 (= (_2!9151 lt!306029) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!306014 () tuple2!17010)

(assert (=> b!196647 (= lt!306029 (readNBitsLSBFirstsLoopPure!0 (_1!9150 lt!306014) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!306013 () Unit!13885)

(declare-fun lt!306005 () Unit!13885)

(assert (=> b!196647 (= lt!306013 lt!306005)))

(declare-fun lt!306017 () tuple2!16996)

(declare-fun lt!306026 () (_ BitVec 64))

(assert (=> b!196647 (validate_offset_bits!1 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!306017)))) ((_ sign_extend 32) (currentByte!9249 (_2!9143 lt!305557))) ((_ sign_extend 32) (currentBit!9244 (_2!9143 lt!305557))) lt!306026)))

(assert (=> b!196647 (= lt!306005 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9143 lt!305557) (buf!4929 (_2!9143 lt!306017)) lt!306026))))

(declare-fun e!135123 () Bool)

(assert (=> b!196647 e!135123))

(declare-fun res!164543 () Bool)

(assert (=> b!196647 (=> (not res!164543) (not e!135123))))

(assert (=> b!196647 (= res!164543 (and (= (size!4443 (buf!4929 (_2!9143 lt!305557))) (size!4443 (buf!4929 (_2!9143 lt!306017)))) (bvsge lt!306026 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196647 (= lt!306026 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!196647 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!196647 (= lt!306014 (reader!0 (_2!9143 lt!305557) (_2!9143 lt!306017)))))

(declare-fun b!196648 () Bool)

(declare-fun res!164541 () Bool)

(assert (=> b!196648 (=> (not res!164541) (not e!135125))))

(assert (=> b!196648 (= res!164541 (= (size!4443 (buf!4929 (_2!9143 lt!305557))) (size!4443 (buf!4929 (_2!9143 lt!306017)))))))

(declare-fun b!196649 () Bool)

(declare-fun Unit!13910 () Unit!13885)

(assert (=> b!196649 (= e!135128 (tuple2!16997 Unit!13910 (_2!9143 lt!305557)))))

(declare-fun lt!306020 () Unit!13885)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7994) Unit!13885)

(assert (=> b!196649 (= lt!306020 (lemmaIsPrefixRefl!0 (_2!9143 lt!305557)))))

(assert (=> b!196649 call!3089))

(declare-fun lt!306042 () Unit!13885)

(assert (=> b!196649 (= lt!306042 lt!306020)))

(declare-fun b!196650 () Bool)

(assert (=> b!196650 (= e!135127 (= (_1!9151 lt!306002) (_2!9150 lt!306047)))))

(declare-fun b!196651 () Bool)

(assert (=> b!196651 (= e!135126 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!196652 () Bool)

(assert (=> b!196652 (= lt!305995 (readBitPure!0 (readerFrom!0 (_2!9143 lt!306041) (currentBit!9244 (_2!9143 lt!305557)) (currentByte!9249 (_2!9143 lt!305557)))))))

(declare-fun res!164547 () Bool)

(assert (=> b!196652 (= res!164547 (and (= (_2!9144 lt!305995) lt!306003) (= (_1!9144 lt!305995) (_2!9143 lt!306041))))))

(assert (=> b!196652 (=> (not res!164547) (not e!135130))))

(assert (=> b!196652 (= e!135131 e!135130)))

(declare-fun b!196653 () Bool)

(declare-fun res!164544 () Bool)

(assert (=> b!196653 (= res!164544 (= (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!306041))) (currentByte!9249 (_2!9143 lt!306041)) (currentBit!9244 (_2!9143 lt!306041))) (bvadd (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305557))) (currentByte!9249 (_2!9143 lt!305557)) (currentBit!9244 (_2!9143 lt!305557))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!196653 (=> (not res!164544) (not e!135131))))

(declare-fun b!196654 () Bool)

(assert (=> b!196654 (= e!135124 (= (_2!9144 lt!306032) (_2!9144 lt!305994)))))

(declare-fun b!196655 () Bool)

(declare-fun res!164552 () Bool)

(assert (=> b!196655 (=> (not res!164552) (not e!135125))))

(assert (=> b!196655 (= res!164552 (isPrefixOf!0 (_2!9143 lt!305557) (_2!9143 lt!306017)))))

(declare-fun b!196656 () Bool)

(assert (=> b!196656 (= e!135129 (= (_1!9151 lt!306029) (_2!9150 lt!306014)))))

(declare-fun b!196657 () Bool)

(assert (=> b!196657 (= e!135126 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!196658 () Bool)

(assert (=> b!196658 (= e!135123 (validate_offset_bits!1 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!305557)))) ((_ sign_extend 32) (currentByte!9249 (_2!9143 lt!305557))) ((_ sign_extend 32) (currentBit!9244 (_2!9143 lt!305557))) lt!306026))))

(declare-fun d!66501 () Bool)

(assert (=> d!66501 e!135125))

(declare-fun res!164542 () Bool)

(assert (=> d!66501 (=> (not res!164542) (not e!135125))))

(assert (=> d!66501 (= res!164542 (invariant!0 (currentBit!9244 (_2!9143 lt!306017)) (currentByte!9249 (_2!9143 lt!306017)) (size!4443 (buf!4929 (_2!9143 lt!306017)))))))

(assert (=> d!66501 (= lt!306017 e!135128)))

(assert (=> d!66501 (= c!9788 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66501 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66501 (= (appendBitsLSBFirstLoopTR!0 (_2!9143 lt!305557) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!306017)))

(declare-fun b!196659 () Bool)

(declare-fun res!164549 () Bool)

(assert (=> b!196659 (=> (not res!164549) (not e!135125))))

(declare-fun lt!306043 () (_ BitVec 64))

(declare-fun lt!306001 () (_ BitVec 64))

(assert (=> b!196659 (= res!164549 (= (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!306017))) (currentByte!9249 (_2!9143 lt!306017)) (currentBit!9244 (_2!9143 lt!306017))) (bvsub lt!306001 lt!306043)))))

(assert (=> b!196659 (or (= (bvand lt!306001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306043 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306001 lt!306043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196659 (= lt!306043 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!306028 () (_ BitVec 64))

(declare-fun lt!306023 () (_ BitVec 64))

(assert (=> b!196659 (= lt!306001 (bvadd lt!306028 lt!306023))))

(assert (=> b!196659 (or (not (= (bvand lt!306028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306023 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!306028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!306028 lt!306023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196659 (= lt!306023 ((_ sign_extend 32) nBits!348))))

(assert (=> b!196659 (= lt!306028 (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305557))) (currentByte!9249 (_2!9143 lt!305557)) (currentBit!9244 (_2!9143 lt!305557))))))

(assert (= (and d!66501 c!9788) b!196649))

(assert (= (and d!66501 (not c!9788)) b!196645))

(assert (= (and b!196645 res!164551) b!196653))

(assert (= (and b!196653 res!164544) b!196644))

(assert (= (and b!196644 res!164545) b!196652))

(assert (= (and b!196652 res!164547) b!196646))

(assert (= (and b!196645 res!164546) b!196654))

(assert (= (and b!196645 c!9789) b!196651))

(assert (= (and b!196645 (not c!9789)) b!196657))

(assert (= (and b!196645 res!164548) b!196650))

(assert (= (or b!196649 b!196644) bm!3086))

(assert (= (and d!66501 res!164542) b!196648))

(assert (= (and b!196648 res!164541) b!196659))

(assert (= (and b!196659 res!164549) b!196655))

(assert (= (and b!196655 res!164552) b!196647))

(assert (= (and b!196647 res!164543) b!196658))

(assert (= (and b!196647 res!164550) b!196656))

(declare-fun m!304053 () Bool)

(assert (=> b!196649 m!304053))

(declare-fun m!304055 () Bool)

(assert (=> b!196659 m!304055))

(assert (=> b!196659 m!303879))

(declare-fun m!304057 () Bool)

(assert (=> bm!3086 m!304057))

(declare-fun m!304059 () Bool)

(assert (=> b!196658 m!304059))

(declare-fun m!304061 () Bool)

(assert (=> b!196645 m!304061))

(declare-fun m!304063 () Bool)

(assert (=> b!196645 m!304063))

(declare-fun m!304065 () Bool)

(assert (=> b!196645 m!304065))

(declare-fun m!304067 () Bool)

(assert (=> b!196645 m!304067))

(declare-fun m!304069 () Bool)

(assert (=> b!196645 m!304069))

(declare-fun m!304071 () Bool)

(assert (=> b!196645 m!304071))

(declare-fun m!304073 () Bool)

(assert (=> b!196645 m!304073))

(declare-fun m!304075 () Bool)

(assert (=> b!196645 m!304075))

(declare-fun m!304077 () Bool)

(assert (=> b!196645 m!304077))

(declare-fun m!304079 () Bool)

(assert (=> b!196645 m!304079))

(declare-fun m!304081 () Bool)

(assert (=> b!196645 m!304081))

(declare-fun m!304083 () Bool)

(assert (=> b!196645 m!304083))

(declare-fun m!304085 () Bool)

(assert (=> b!196645 m!304085))

(declare-fun m!304087 () Bool)

(assert (=> b!196645 m!304087))

(declare-fun m!304089 () Bool)

(assert (=> b!196645 m!304089))

(declare-fun m!304091 () Bool)

(assert (=> b!196645 m!304091))

(declare-fun m!304093 () Bool)

(assert (=> b!196645 m!304093))

(declare-fun m!304095 () Bool)

(assert (=> b!196645 m!304095))

(declare-fun m!304097 () Bool)

(assert (=> b!196645 m!304097))

(assert (=> b!196645 m!303879))

(declare-fun m!304099 () Bool)

(assert (=> b!196645 m!304099))

(declare-fun m!304101 () Bool)

(assert (=> b!196645 m!304101))

(declare-fun m!304103 () Bool)

(assert (=> b!196645 m!304103))

(declare-fun m!304105 () Bool)

(assert (=> b!196645 m!304105))

(declare-fun m!304107 () Bool)

(assert (=> b!196645 m!304107))

(declare-fun m!304109 () Bool)

(assert (=> b!196645 m!304109))

(declare-fun m!304111 () Bool)

(assert (=> b!196645 m!304111))

(declare-fun m!304113 () Bool)

(assert (=> b!196645 m!304113))

(declare-fun m!304115 () Bool)

(assert (=> b!196645 m!304115))

(assert (=> b!196645 m!304063))

(declare-fun m!304117 () Bool)

(assert (=> b!196645 m!304117))

(declare-fun m!304119 () Bool)

(assert (=> b!196645 m!304119))

(declare-fun m!304121 () Bool)

(assert (=> b!196645 m!304121))

(declare-fun m!304123 () Bool)

(assert (=> b!196645 m!304123))

(declare-fun m!304125 () Bool)

(assert (=> b!196645 m!304125))

(declare-fun m!304127 () Bool)

(assert (=> b!196646 m!304127))

(declare-fun m!304129 () Bool)

(assert (=> b!196646 m!304129))

(assert (=> b!196653 m!304129))

(assert (=> b!196653 m!303879))

(declare-fun m!304131 () Bool)

(assert (=> d!66501 m!304131))

(declare-fun m!304133 () Bool)

(assert (=> b!196655 m!304133))

(declare-fun m!304135 () Bool)

(assert (=> b!196652 m!304135))

(assert (=> b!196652 m!304135))

(declare-fun m!304137 () Bool)

(assert (=> b!196652 m!304137))

(declare-fun m!304139 () Bool)

(assert (=> b!196647 m!304139))

(declare-fun m!304141 () Bool)

(assert (=> b!196647 m!304141))

(declare-fun m!304143 () Bool)

(assert (=> b!196647 m!304143))

(assert (=> b!196647 m!304095))

(declare-fun m!304145 () Bool)

(assert (=> b!196647 m!304145))

(assert (=> b!196647 m!304075))

(assert (=> b!196460 d!66501))

(declare-fun d!66511 () Bool)

(assert (=> d!66511 (= (invariant!0 (currentBit!9244 (_2!9143 lt!305560)) (currentByte!9249 (_2!9143 lt!305560)) (size!4443 (buf!4929 (_2!9143 lt!305560)))) (and (bvsge (currentBit!9244 (_2!9143 lt!305560)) #b00000000000000000000000000000000) (bvslt (currentBit!9244 (_2!9143 lt!305560)) #b00000000000000000000000000001000) (bvsge (currentByte!9249 (_2!9143 lt!305560)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9249 (_2!9143 lt!305560)) (size!4443 (buf!4929 (_2!9143 lt!305560)))) (and (= (currentBit!9244 (_2!9143 lt!305560)) #b00000000000000000000000000000000) (= (currentByte!9249 (_2!9143 lt!305560)) (size!4443 (buf!4929 (_2!9143 lt!305560))))))))))

(assert (=> b!196469 d!66511))

(declare-fun d!66513 () Bool)

(declare-fun e!135140 () Bool)

(assert (=> d!66513 e!135140))

(declare-fun res!164563 () Bool)

(assert (=> d!66513 (=> (not res!164563) (not e!135140))))

(declare-fun lt!306117 () (_ BitVec 64))

(declare-fun lt!306116 () (_ BitVec 64))

(declare-fun lt!306121 () (_ BitVec 64))

(assert (=> d!66513 (= res!164563 (= lt!306121 (bvsub lt!306116 lt!306117)))))

(assert (=> d!66513 (or (= (bvand lt!306116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306117 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306116 lt!306117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66513 (= lt!306117 (remainingBits!0 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!305557)))) ((_ sign_extend 32) (currentByte!9249 (_2!9143 lt!305557))) ((_ sign_extend 32) (currentBit!9244 (_2!9143 lt!305557)))))))

(declare-fun lt!306118 () (_ BitVec 64))

(declare-fun lt!306120 () (_ BitVec 64))

(assert (=> d!66513 (= lt!306116 (bvmul lt!306118 lt!306120))))

(assert (=> d!66513 (or (= lt!306118 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306120 (bvsdiv (bvmul lt!306118 lt!306120) lt!306118)))))

(assert (=> d!66513 (= lt!306120 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66513 (= lt!306118 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!305557)))))))

(assert (=> d!66513 (= lt!306121 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9249 (_2!9143 lt!305557))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9244 (_2!9143 lt!305557)))))))

(assert (=> d!66513 (invariant!0 (currentBit!9244 (_2!9143 lt!305557)) (currentByte!9249 (_2!9143 lt!305557)) (size!4443 (buf!4929 (_2!9143 lt!305557))))))

(assert (=> d!66513 (= (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305557))) (currentByte!9249 (_2!9143 lt!305557)) (currentBit!9244 (_2!9143 lt!305557))) lt!306121)))

(declare-fun b!196675 () Bool)

(declare-fun res!164564 () Bool)

(assert (=> b!196675 (=> (not res!164564) (not e!135140))))

(assert (=> b!196675 (= res!164564 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306121))))

(declare-fun b!196676 () Bool)

(declare-fun lt!306119 () (_ BitVec 64))

(assert (=> b!196676 (= e!135140 (bvsle lt!306121 (bvmul lt!306119 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196676 (or (= lt!306119 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306119 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306119)))))

(assert (=> b!196676 (= lt!306119 ((_ sign_extend 32) (size!4443 (buf!4929 (_2!9143 lt!305557)))))))

(assert (= (and d!66513 res!164563) b!196675))

(assert (= (and b!196675 res!164564) b!196676))

(declare-fun m!304147 () Bool)

(assert (=> d!66513 m!304147))

(assert (=> d!66513 m!303915))

(assert (=> b!196464 d!66513))

(declare-fun d!66515 () Bool)

(declare-fun e!135141 () Bool)

(assert (=> d!66515 e!135141))

(declare-fun res!164565 () Bool)

(assert (=> d!66515 (=> (not res!164565) (not e!135141))))

(declare-fun lt!306123 () (_ BitVec 64))

(declare-fun lt!306122 () (_ BitVec 64))

(declare-fun lt!306127 () (_ BitVec 64))

(assert (=> d!66515 (= res!164565 (= lt!306127 (bvsub lt!306122 lt!306123)))))

(assert (=> d!66515 (or (= (bvand lt!306122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306123 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306122 lt!306123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66515 (= lt!306123 (remainingBits!0 ((_ sign_extend 32) (size!4443 (buf!4929 thiss!1204))) ((_ sign_extend 32) (currentByte!9249 thiss!1204)) ((_ sign_extend 32) (currentBit!9244 thiss!1204))))))

(declare-fun lt!306124 () (_ BitVec 64))

(declare-fun lt!306126 () (_ BitVec 64))

(assert (=> d!66515 (= lt!306122 (bvmul lt!306124 lt!306126))))

(assert (=> d!66515 (or (= lt!306124 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306126 (bvsdiv (bvmul lt!306124 lt!306126) lt!306124)))))

(assert (=> d!66515 (= lt!306126 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66515 (= lt!306124 ((_ sign_extend 32) (size!4443 (buf!4929 thiss!1204))))))

(assert (=> d!66515 (= lt!306127 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9249 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9244 thiss!1204))))))

(assert (=> d!66515 (invariant!0 (currentBit!9244 thiss!1204) (currentByte!9249 thiss!1204) (size!4443 (buf!4929 thiss!1204)))))

(assert (=> d!66515 (= (bitIndex!0 (size!4443 (buf!4929 thiss!1204)) (currentByte!9249 thiss!1204) (currentBit!9244 thiss!1204)) lt!306127)))

(declare-fun b!196677 () Bool)

(declare-fun res!164566 () Bool)

(assert (=> b!196677 (=> (not res!164566) (not e!135141))))

(assert (=> b!196677 (= res!164566 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306127))))

(declare-fun b!196678 () Bool)

(declare-fun lt!306125 () (_ BitVec 64))

(assert (=> b!196678 (= e!135141 (bvsle lt!306127 (bvmul lt!306125 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196678 (or (= lt!306125 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306125 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306125)))))

(assert (=> b!196678 (= lt!306125 ((_ sign_extend 32) (size!4443 (buf!4929 thiss!1204))))))

(assert (= (and d!66515 res!164565) b!196677))

(assert (= (and b!196677 res!164566) b!196678))

(assert (=> d!66515 m!303933))

(assert (=> d!66515 m!303885))

(assert (=> b!196464 d!66515))

(declare-fun d!66517 () Bool)

(declare-fun res!164567 () Bool)

(declare-fun e!135143 () Bool)

(assert (=> d!66517 (=> (not res!164567) (not e!135143))))

(assert (=> d!66517 (= res!164567 (= (size!4443 (buf!4929 thiss!1204)) (size!4443 (buf!4929 (_2!9143 lt!305557)))))))

(assert (=> d!66517 (= (isPrefixOf!0 thiss!1204 (_2!9143 lt!305557)) e!135143)))

(declare-fun b!196679 () Bool)

(declare-fun res!164569 () Bool)

(assert (=> b!196679 (=> (not res!164569) (not e!135143))))

(assert (=> b!196679 (= res!164569 (bvsle (bitIndex!0 (size!4443 (buf!4929 thiss!1204)) (currentByte!9249 thiss!1204) (currentBit!9244 thiss!1204)) (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!305557))) (currentByte!9249 (_2!9143 lt!305557)) (currentBit!9244 (_2!9143 lt!305557)))))))

(declare-fun b!196680 () Bool)

(declare-fun e!135142 () Bool)

(assert (=> b!196680 (= e!135143 e!135142)))

(declare-fun res!164568 () Bool)

(assert (=> b!196680 (=> res!164568 e!135142)))

(assert (=> b!196680 (= res!164568 (= (size!4443 (buf!4929 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196681 () Bool)

(assert (=> b!196681 (= e!135142 (arrayBitRangesEq!0 (buf!4929 thiss!1204) (buf!4929 (_2!9143 lt!305557)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4443 (buf!4929 thiss!1204)) (currentByte!9249 thiss!1204) (currentBit!9244 thiss!1204))))))

(assert (= (and d!66517 res!164567) b!196679))

(assert (= (and b!196679 res!164569) b!196680))

(assert (= (and b!196680 (not res!164568)) b!196681))

(assert (=> b!196679 m!303881))

(assert (=> b!196679 m!303879))

(assert (=> b!196681 m!303881))

(assert (=> b!196681 m!303881))

(declare-fun m!304149 () Bool)

(assert (=> b!196681 m!304149))

(assert (=> b!196459 d!66517))

(declare-fun d!66519 () Bool)

(declare-fun e!135146 () Bool)

(assert (=> d!66519 e!135146))

(declare-fun res!164576 () Bool)

(assert (=> d!66519 (=> (not res!164576) (not e!135146))))

(declare-fun lt!306133 () (_ BitVec 64))

(declare-fun lt!306137 () (_ BitVec 64))

(declare-fun lt!306130 () (_ BitVec 64))

(assert (=> d!66519 (= res!164576 (= lt!306137 (bvsub lt!306130 lt!306133)))))

(assert (=> d!66519 (or (= (bvand lt!306130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306133 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306130 lt!306133) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66519 (= lt!306133 (remainingBits!0 ((_ sign_extend 32) (size!4443 (buf!4929 (_1!9144 lt!305556)))) ((_ sign_extend 32) (currentByte!9249 (_1!9144 lt!305556))) ((_ sign_extend 32) (currentBit!9244 (_1!9144 lt!305556)))))))

(declare-fun lt!306134 () (_ BitVec 64))

(declare-fun lt!306136 () (_ BitVec 64))

(assert (=> d!66519 (= lt!306130 (bvmul lt!306134 lt!306136))))

(assert (=> d!66519 (or (= lt!306134 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306136 (bvsdiv (bvmul lt!306134 lt!306136) lt!306134)))))

(assert (=> d!66519 (= lt!306136 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66519 (= lt!306134 ((_ sign_extend 32) (size!4443 (buf!4929 (_1!9144 lt!305556)))))))

(assert (=> d!66519 (= lt!306137 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9249 (_1!9144 lt!305556))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9244 (_1!9144 lt!305556)))))))

(assert (=> d!66519 (invariant!0 (currentBit!9244 (_1!9144 lt!305556)) (currentByte!9249 (_1!9144 lt!305556)) (size!4443 (buf!4929 (_1!9144 lt!305556))))))

(assert (=> d!66519 (= (bitIndex!0 (size!4443 (buf!4929 (_1!9144 lt!305556))) (currentByte!9249 (_1!9144 lt!305556)) (currentBit!9244 (_1!9144 lt!305556))) lt!306137)))

(declare-fun b!196686 () Bool)

(declare-fun res!164577 () Bool)

(assert (=> b!196686 (=> (not res!164577) (not e!135146))))

(assert (=> b!196686 (= res!164577 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306137))))

(declare-fun b!196687 () Bool)

(declare-fun lt!306135 () (_ BitVec 64))

(assert (=> b!196687 (= e!135146 (bvsle lt!306137 (bvmul lt!306135 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196687 (or (= lt!306135 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306135 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306135)))))

(assert (=> b!196687 (= lt!306135 ((_ sign_extend 32) (size!4443 (buf!4929 (_1!9144 lt!305556)))))))

(assert (= (and d!66519 res!164576) b!196686))

(assert (= (and b!196686 res!164577) b!196687))

(declare-fun m!304151 () Bool)

(assert (=> d!66519 m!304151))

(declare-fun m!304153 () Bool)

(assert (=> d!66519 m!304153))

(assert (=> b!196468 d!66519))

(declare-fun d!66521 () Bool)

(assert (=> d!66521 (= (invariant!0 (currentBit!9244 thiss!1204) (currentByte!9249 thiss!1204) (size!4443 (buf!4929 thiss!1204))) (and (bvsge (currentBit!9244 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9244 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9249 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9249 thiss!1204) (size!4443 (buf!4929 thiss!1204))) (and (= (currentBit!9244 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9249 thiss!1204) (size!4443 (buf!4929 thiss!1204)))))))))

(assert (=> b!196463 d!66521))

(assert (=> b!196458 d!66513))

(assert (=> b!196458 d!66515))

(declare-fun b!196728 () Bool)

(declare-fun res!164613 () Bool)

(declare-fun e!135168 () Bool)

(assert (=> b!196728 (=> (not res!164613) (not e!135168))))

(declare-fun lt!306226 () tuple2!16996)

(assert (=> b!196728 (= res!164613 (isPrefixOf!0 thiss!1204 (_2!9143 lt!306226)))))

(declare-fun b!196730 () Bool)

(declare-fun e!135167 () Bool)

(declare-fun lt!306227 () tuple2!16998)

(assert (=> b!196730 (= e!135167 (= (bitIndex!0 (size!4443 (buf!4929 (_1!9144 lt!306227))) (currentByte!9249 (_1!9144 lt!306227)) (currentBit!9244 (_1!9144 lt!306227))) (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!306226))) (currentByte!9249 (_2!9143 lt!306226)) (currentBit!9244 (_2!9143 lt!306226)))))))

(declare-fun b!196727 () Bool)

(declare-fun res!164612 () Bool)

(assert (=> b!196727 (=> (not res!164612) (not e!135168))))

(declare-fun lt!306229 () (_ BitVec 64))

(declare-fun lt!306228 () (_ BitVec 64))

(assert (=> b!196727 (= res!164612 (= (bitIndex!0 (size!4443 (buf!4929 (_2!9143 lt!306226))) (currentByte!9249 (_2!9143 lt!306226)) (currentBit!9244 (_2!9143 lt!306226))) (bvadd lt!306229 lt!306228)))))

(assert (=> b!196727 (or (not (= (bvand lt!306229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306228 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!306229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!306229 lt!306228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

