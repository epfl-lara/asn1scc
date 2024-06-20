; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43188 () Bool)

(assert start!43188)

(declare-fun b!203599 () Bool)

(declare-fun e!139500 () Bool)

(declare-datatypes ((array!10316 0))(
  ( (array!10317 (arr!5467 (Array (_ BitVec 32) (_ BitVec 8))) (size!4537 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8182 0))(
  ( (BitStream!8183 (buf!5042 array!10316) (currentByte!9509 (_ BitVec 32)) (currentBit!9504 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8182)

(declare-fun array_inv!4278 (array!10316) Bool)

(assert (=> b!203599 (= e!139500 (array_inv!4278 (buf!5042 thiss!1204)))))

(declare-fun b!203600 () Bool)

(declare-fun res!170574 () Bool)

(declare-fun e!139501 () Bool)

(assert (=> b!203600 (=> (not res!170574) (not e!139501))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203600 (= res!170574 (validate_offset_bits!1 ((_ sign_extend 32) (size!4537 (buf!5042 thiss!1204))) ((_ sign_extend 32) (currentByte!9509 thiss!1204)) ((_ sign_extend 32) (currentBit!9504 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun e!139506 () Bool)

(declare-datatypes ((Unit!14499 0))(
  ( (Unit!14500) )
))
(declare-datatypes ((tuple2!17420 0))(
  ( (tuple2!17421 (_1!9362 Unit!14499) (_2!9362 BitStream!8182)) )
))
(declare-fun lt!317846 () tuple2!17420)

(declare-fun lt!317850 () (_ BitVec 64))

(declare-fun b!203601 () Bool)

(assert (=> b!203601 (= e!139506 (or (not (= (size!4537 (buf!5042 (_2!9362 lt!317846))) (size!4537 (buf!5042 thiss!1204)))) (let ((bdg!12230 (bvand lt!317850 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!12230 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!12230 (bvand (bvadd lt!317850 ((_ sign_extend 32) nBits!348)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!203602 () Bool)

(declare-fun e!139505 () Bool)

(declare-fun e!139503 () Bool)

(assert (=> b!203602 (= e!139505 e!139503)))

(declare-fun res!170569 () Bool)

(assert (=> b!203602 (=> (not res!170569) (not e!139503))))

(declare-fun lt!317847 () (_ BitVec 64))

(declare-fun lt!317844 () (_ BitVec 64))

(assert (=> b!203602 (= res!170569 (= lt!317847 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317844)))))

(declare-fun lt!317851 () tuple2!17420)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203602 (= lt!317847 (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317851))) (currentByte!9509 (_2!9362 lt!317851)) (currentBit!9504 (_2!9362 lt!317851))))))

(assert (=> b!203602 (= lt!317844 (bitIndex!0 (size!4537 (buf!5042 thiss!1204)) (currentByte!9509 thiss!1204) (currentBit!9504 thiss!1204)))))

(declare-fun b!203603 () Bool)

(declare-fun res!170570 () Bool)

(assert (=> b!203603 (=> res!170570 e!139506)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!203603 (= res!170570 (not (invariant!0 (currentBit!9504 (_2!9362 lt!317846)) (currentByte!9509 (_2!9362 lt!317846)) (size!4537 (buf!5042 (_2!9362 lt!317846))))))))

(declare-fun b!203604 () Bool)

(declare-fun e!139502 () Bool)

(assert (=> b!203604 (= e!139501 (not e!139502))))

(declare-fun res!170566 () Bool)

(assert (=> b!203604 (=> res!170566 e!139502)))

(declare-fun lt!317845 () (_ BitVec 64))

(assert (=> b!203604 (= res!170566 (not (= lt!317845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317850))))))

(assert (=> b!203604 (= lt!317845 (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317851))) (currentByte!9509 (_2!9362 lt!317851)) (currentBit!9504 (_2!9362 lt!317851))))))

(assert (=> b!203604 (= lt!317850 (bitIndex!0 (size!4537 (buf!5042 thiss!1204)) (currentByte!9509 thiss!1204) (currentBit!9504 thiss!1204)))))

(assert (=> b!203604 e!139505))

(declare-fun res!170573 () Bool)

(assert (=> b!203604 (=> (not res!170573) (not e!139505))))

(assert (=> b!203604 (= res!170573 (= (size!4537 (buf!5042 thiss!1204)) (size!4537 (buf!5042 (_2!9362 lt!317851)))))))

(declare-fun lt!317848 () Bool)

(declare-fun appendBit!0 (BitStream!8182 Bool) tuple2!17420)

(assert (=> b!203604 (= lt!317851 (appendBit!0 thiss!1204 lt!317848))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!203604 (= lt!317848 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!203605 () Bool)

(declare-fun e!139504 () Bool)

(declare-datatypes ((tuple2!17422 0))(
  ( (tuple2!17423 (_1!9363 BitStream!8182) (_2!9363 Bool)) )
))
(declare-fun lt!317852 () tuple2!17422)

(assert (=> b!203605 (= e!139504 (= (bitIndex!0 (size!4537 (buf!5042 (_1!9363 lt!317852))) (currentByte!9509 (_1!9363 lt!317852)) (currentBit!9504 (_1!9363 lt!317852))) lt!317847))))

(declare-fun b!203606 () Bool)

(declare-fun res!170568 () Bool)

(assert (=> b!203606 (=> (not res!170568) (not e!139501))))

(assert (=> b!203606 (= res!170568 (not (= i!590 nBits!348)))))

(declare-fun res!170571 () Bool)

(assert (=> start!43188 (=> (not res!170571) (not e!139501))))

(assert (=> start!43188 (= res!170571 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43188 e!139501))

(assert (=> start!43188 true))

(declare-fun inv!12 (BitStream!8182) Bool)

(assert (=> start!43188 (and (inv!12 thiss!1204) e!139500)))

(declare-fun b!203607 () Bool)

(assert (=> b!203607 (= e!139502 e!139506)))

(declare-fun res!170576 () Bool)

(assert (=> b!203607 (=> res!170576 e!139506)))

(assert (=> b!203607 (= res!170576 (not (= (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317846))) (currentByte!9509 (_2!9362 lt!317846)) (currentBit!9504 (_2!9362 lt!317846))) (bvsub (bvsub (bvadd lt!317845 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun isPrefixOf!0 (BitStream!8182 BitStream!8182) Bool)

(assert (=> b!203607 (isPrefixOf!0 thiss!1204 (_2!9362 lt!317846))))

(declare-fun lt!317849 () Unit!14499)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8182 BitStream!8182 BitStream!8182) Unit!14499)

(assert (=> b!203607 (= lt!317849 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9362 lt!317851) (_2!9362 lt!317846)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8182 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17420)

(assert (=> b!203607 (= lt!317846 (appendBitsLSBFirstLoopTR!0 (_2!9362 lt!317851) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!203608 () Bool)

(assert (=> b!203608 (= e!139503 e!139504)))

(declare-fun res!170575 () Bool)

(assert (=> b!203608 (=> (not res!170575) (not e!139504))))

(assert (=> b!203608 (= res!170575 (and (= (_2!9363 lt!317852) lt!317848) (= (_1!9363 lt!317852) (_2!9362 lt!317851))))))

(declare-fun readBitPure!0 (BitStream!8182) tuple2!17422)

(declare-fun readerFrom!0 (BitStream!8182 (_ BitVec 32) (_ BitVec 32)) BitStream!8182)

(assert (=> b!203608 (= lt!317852 (readBitPure!0 (readerFrom!0 (_2!9362 lt!317851) (currentBit!9504 thiss!1204) (currentByte!9509 thiss!1204))))))

(declare-fun b!203609 () Bool)

(declare-fun res!170567 () Bool)

(assert (=> b!203609 (=> (not res!170567) (not e!139501))))

(assert (=> b!203609 (= res!170567 (invariant!0 (currentBit!9504 thiss!1204) (currentByte!9509 thiss!1204) (size!4537 (buf!5042 thiss!1204))))))

(declare-fun b!203610 () Bool)

(declare-fun res!170572 () Bool)

(assert (=> b!203610 (=> (not res!170572) (not e!139503))))

(assert (=> b!203610 (= res!170572 (isPrefixOf!0 thiss!1204 (_2!9362 lt!317851)))))

(assert (= (and start!43188 res!170571) b!203600))

(assert (= (and b!203600 res!170574) b!203609))

(assert (= (and b!203609 res!170567) b!203606))

(assert (= (and b!203606 res!170568) b!203604))

(assert (= (and b!203604 res!170573) b!203602))

(assert (= (and b!203602 res!170569) b!203610))

(assert (= (and b!203610 res!170572) b!203608))

(assert (= (and b!203608 res!170575) b!203605))

(assert (= (and b!203604 (not res!170566)) b!203607))

(assert (= (and b!203607 (not res!170576)) b!203603))

(assert (= (and b!203603 (not res!170570)) b!203601))

(assert (= start!43188 b!203599))

(declare-fun m!314523 () Bool)

(assert (=> b!203599 m!314523))

(declare-fun m!314525 () Bool)

(assert (=> b!203604 m!314525))

(declare-fun m!314527 () Bool)

(assert (=> b!203604 m!314527))

(declare-fun m!314529 () Bool)

(assert (=> b!203604 m!314529))

(declare-fun m!314531 () Bool)

(assert (=> b!203607 m!314531))

(declare-fun m!314533 () Bool)

(assert (=> b!203607 m!314533))

(declare-fun m!314535 () Bool)

(assert (=> b!203607 m!314535))

(declare-fun m!314537 () Bool)

(assert (=> b!203607 m!314537))

(declare-fun m!314539 () Bool)

(assert (=> b!203609 m!314539))

(declare-fun m!314541 () Bool)

(assert (=> b!203605 m!314541))

(declare-fun m!314543 () Bool)

(assert (=> b!203610 m!314543))

(assert (=> b!203602 m!314525))

(assert (=> b!203602 m!314527))

(declare-fun m!314545 () Bool)

(assert (=> b!203603 m!314545))

(declare-fun m!314547 () Bool)

(assert (=> start!43188 m!314547))

(declare-fun m!314549 () Bool)

(assert (=> b!203608 m!314549))

(assert (=> b!203608 m!314549))

(declare-fun m!314551 () Bool)

(assert (=> b!203608 m!314551))

(declare-fun m!314553 () Bool)

(assert (=> b!203600 m!314553))

(push 1)

(assert (not b!203600))

(assert (not b!203605))

(assert (not b!203604))

(assert (not b!203609))

(assert (not start!43188))

(assert (not b!203602))

(assert (not b!203599))

(assert (not b!203608))

(assert (not b!203607))

(assert (not b!203610))

(assert (not b!203603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69571 () Bool)

(declare-datatypes ((tuple2!17438 0))(
  ( (tuple2!17439 (_1!9371 Bool) (_2!9371 BitStream!8182)) )
))
(declare-fun lt!317960 () tuple2!17438)

(declare-fun readBit!0 (BitStream!8182) tuple2!17438)

(assert (=> d!69571 (= lt!317960 (readBit!0 (readerFrom!0 (_2!9362 lt!317851) (currentBit!9504 thiss!1204) (currentByte!9509 thiss!1204))))))

(assert (=> d!69571 (= (readBitPure!0 (readerFrom!0 (_2!9362 lt!317851) (currentBit!9504 thiss!1204) (currentByte!9509 thiss!1204))) (tuple2!17423 (_2!9371 lt!317960) (_1!9371 lt!317960)))))

(declare-fun bs!17142 () Bool)

(assert (= bs!17142 d!69571))

(assert (=> bs!17142 m!314549))

(declare-fun m!314651 () Bool)

(assert (=> bs!17142 m!314651))

(assert (=> b!203608 d!69571))

(declare-fun d!69573 () Bool)

(declare-fun e!139577 () Bool)

(assert (=> d!69573 e!139577))

(declare-fun res!170682 () Bool)

(assert (=> d!69573 (=> (not res!170682) (not e!139577))))

(assert (=> d!69573 (= res!170682 (invariant!0 (currentBit!9504 (_2!9362 lt!317851)) (currentByte!9509 (_2!9362 lt!317851)) (size!4537 (buf!5042 (_2!9362 lt!317851)))))))

(assert (=> d!69573 (= (readerFrom!0 (_2!9362 lt!317851) (currentBit!9504 thiss!1204) (currentByte!9509 thiss!1204)) (BitStream!8183 (buf!5042 (_2!9362 lt!317851)) (currentByte!9509 thiss!1204) (currentBit!9504 thiss!1204)))))

(declare-fun b!203722 () Bool)

(assert (=> b!203722 (= e!139577 (invariant!0 (currentBit!9504 thiss!1204) (currentByte!9509 thiss!1204) (size!4537 (buf!5042 (_2!9362 lt!317851)))))))

(assert (= (and d!69573 res!170682) b!203722))

(declare-fun m!314653 () Bool)

(assert (=> d!69573 m!314653))

(declare-fun m!314655 () Bool)

(assert (=> b!203722 m!314655))

(assert (=> b!203608 d!69573))

(declare-fun d!69575 () Bool)

(assert (=> d!69575 (= (invariant!0 (currentBit!9504 thiss!1204) (currentByte!9509 thiss!1204) (size!4537 (buf!5042 thiss!1204))) (and (bvsge (currentBit!9504 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9504 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9509 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9509 thiss!1204) (size!4537 (buf!5042 thiss!1204))) (and (= (currentBit!9504 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9509 thiss!1204) (size!4537 (buf!5042 thiss!1204)))))))))

(assert (=> b!203609 d!69575))

(declare-fun d!69577 () Bool)

(declare-fun res!170691 () Bool)

(declare-fun e!139583 () Bool)

(assert (=> d!69577 (=> (not res!170691) (not e!139583))))

(assert (=> d!69577 (= res!170691 (= (size!4537 (buf!5042 thiss!1204)) (size!4537 (buf!5042 (_2!9362 lt!317851)))))))

(assert (=> d!69577 (= (isPrefixOf!0 thiss!1204 (_2!9362 lt!317851)) e!139583)))

(declare-fun b!203729 () Bool)

(declare-fun res!170690 () Bool)

(assert (=> b!203729 (=> (not res!170690) (not e!139583))))

(assert (=> b!203729 (= res!170690 (bvsle (bitIndex!0 (size!4537 (buf!5042 thiss!1204)) (currentByte!9509 thiss!1204) (currentBit!9504 thiss!1204)) (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317851))) (currentByte!9509 (_2!9362 lt!317851)) (currentBit!9504 (_2!9362 lt!317851)))))))

(declare-fun b!203730 () Bool)

(declare-fun e!139582 () Bool)

(assert (=> b!203730 (= e!139583 e!139582)))

(declare-fun res!170689 () Bool)

(assert (=> b!203730 (=> res!170689 e!139582)))

(assert (=> b!203730 (= res!170689 (= (size!4537 (buf!5042 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203731 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10316 array!10316 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203731 (= e!139582 (arrayBitRangesEq!0 (buf!5042 thiss!1204) (buf!5042 (_2!9362 lt!317851)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4537 (buf!5042 thiss!1204)) (currentByte!9509 thiss!1204) (currentBit!9504 thiss!1204))))))

(assert (= (and d!69577 res!170691) b!203729))

(assert (= (and b!203729 res!170690) b!203730))

(assert (= (and b!203730 (not res!170689)) b!203731))

(assert (=> b!203729 m!314527))

(assert (=> b!203729 m!314525))

(assert (=> b!203731 m!314527))

(assert (=> b!203731 m!314527))

(declare-fun m!314657 () Bool)

(assert (=> b!203731 m!314657))

(assert (=> b!203610 d!69577))

(declare-fun d!69581 () Bool)

(assert (=> d!69581 (= (array_inv!4278 (buf!5042 thiss!1204)) (bvsge (size!4537 (buf!5042 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!203599 d!69581))

(declare-fun d!69583 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69583 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4537 (buf!5042 thiss!1204))) ((_ sign_extend 32) (currentByte!9509 thiss!1204)) ((_ sign_extend 32) (currentBit!9504 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4537 (buf!5042 thiss!1204))) ((_ sign_extend 32) (currentByte!9509 thiss!1204)) ((_ sign_extend 32) (currentBit!9504 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17143 () Bool)

(assert (= bs!17143 d!69583))

(declare-fun m!314659 () Bool)

(assert (=> bs!17143 m!314659))

(assert (=> b!203600 d!69583))

(declare-fun d!69585 () Bool)

(declare-fun e!139591 () Bool)

(assert (=> d!69585 e!139591))

(declare-fun res!170706 () Bool)

(assert (=> d!69585 (=> (not res!170706) (not e!139591))))

(declare-fun lt!318007 () (_ BitVec 64))

(declare-fun lt!318004 () (_ BitVec 64))

(declare-fun lt!318003 () (_ BitVec 64))

(assert (=> d!69585 (= res!170706 (= lt!318004 (bvsub lt!318003 lt!318007)))))

(assert (=> d!69585 (or (= (bvand lt!318003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318003 lt!318007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69585 (= lt!318007 (remainingBits!0 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!317851)))) ((_ sign_extend 32) (currentByte!9509 (_2!9362 lt!317851))) ((_ sign_extend 32) (currentBit!9504 (_2!9362 lt!317851)))))))

(declare-fun lt!318006 () (_ BitVec 64))

(declare-fun lt!318008 () (_ BitVec 64))

(assert (=> d!69585 (= lt!318003 (bvmul lt!318006 lt!318008))))

(assert (=> d!69585 (or (= lt!318006 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318008 (bvsdiv (bvmul lt!318006 lt!318008) lt!318006)))))

(assert (=> d!69585 (= lt!318008 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69585 (= lt!318006 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!317851)))))))

(assert (=> d!69585 (= lt!318004 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9509 (_2!9362 lt!317851))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9504 (_2!9362 lt!317851)))))))

(assert (=> d!69585 (invariant!0 (currentBit!9504 (_2!9362 lt!317851)) (currentByte!9509 (_2!9362 lt!317851)) (size!4537 (buf!5042 (_2!9362 lt!317851))))))

(assert (=> d!69585 (= (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317851))) (currentByte!9509 (_2!9362 lt!317851)) (currentBit!9504 (_2!9362 lt!317851))) lt!318004)))

(declare-fun b!203746 () Bool)

(declare-fun res!170707 () Bool)

(assert (=> b!203746 (=> (not res!170707) (not e!139591))))

(assert (=> b!203746 (= res!170707 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318004))))

(declare-fun b!203747 () Bool)

(declare-fun lt!318005 () (_ BitVec 64))

(assert (=> b!203747 (= e!139591 (bvsle lt!318004 (bvmul lt!318005 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203747 (or (= lt!318005 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318005 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318005)))))

(assert (=> b!203747 (= lt!318005 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!317851)))))))

(assert (= (and d!69585 res!170706) b!203746))

(assert (= (and b!203746 res!170707) b!203747))

(declare-fun m!314669 () Bool)

(assert (=> d!69585 m!314669))

(assert (=> d!69585 m!314653))

(assert (=> b!203602 d!69585))

(declare-fun d!69593 () Bool)

(declare-fun e!139592 () Bool)

(assert (=> d!69593 e!139592))

(declare-fun res!170708 () Bool)

(assert (=> d!69593 (=> (not res!170708) (not e!139592))))

(declare-fun lt!318010 () (_ BitVec 64))

(declare-fun lt!318013 () (_ BitVec 64))

(declare-fun lt!318009 () (_ BitVec 64))

(assert (=> d!69593 (= res!170708 (= lt!318010 (bvsub lt!318009 lt!318013)))))

(assert (=> d!69593 (or (= (bvand lt!318009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318009 lt!318013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69593 (= lt!318013 (remainingBits!0 ((_ sign_extend 32) (size!4537 (buf!5042 thiss!1204))) ((_ sign_extend 32) (currentByte!9509 thiss!1204)) ((_ sign_extend 32) (currentBit!9504 thiss!1204))))))

(declare-fun lt!318012 () (_ BitVec 64))

(declare-fun lt!318014 () (_ BitVec 64))

(assert (=> d!69593 (= lt!318009 (bvmul lt!318012 lt!318014))))

(assert (=> d!69593 (or (= lt!318012 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318014 (bvsdiv (bvmul lt!318012 lt!318014) lt!318012)))))

(assert (=> d!69593 (= lt!318014 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69593 (= lt!318012 ((_ sign_extend 32) (size!4537 (buf!5042 thiss!1204))))))

(assert (=> d!69593 (= lt!318010 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9509 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9504 thiss!1204))))))

(assert (=> d!69593 (invariant!0 (currentBit!9504 thiss!1204) (currentByte!9509 thiss!1204) (size!4537 (buf!5042 thiss!1204)))))

(assert (=> d!69593 (= (bitIndex!0 (size!4537 (buf!5042 thiss!1204)) (currentByte!9509 thiss!1204) (currentBit!9504 thiss!1204)) lt!318010)))

(declare-fun b!203748 () Bool)

(declare-fun res!170709 () Bool)

(assert (=> b!203748 (=> (not res!170709) (not e!139592))))

(assert (=> b!203748 (= res!170709 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318010))))

(declare-fun b!203749 () Bool)

(declare-fun lt!318011 () (_ BitVec 64))

(assert (=> b!203749 (= e!139592 (bvsle lt!318010 (bvmul lt!318011 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203749 (or (= lt!318011 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318011 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318011)))))

(assert (=> b!203749 (= lt!318011 ((_ sign_extend 32) (size!4537 (buf!5042 thiss!1204))))))

(assert (= (and d!69593 res!170708) b!203748))

(assert (= (and b!203748 res!170709) b!203749))

(assert (=> d!69593 m!314659))

(assert (=> d!69593 m!314539))

(assert (=> b!203602 d!69593))

(declare-fun d!69595 () Bool)

(assert (=> d!69595 (= (invariant!0 (currentBit!9504 (_2!9362 lt!317846)) (currentByte!9509 (_2!9362 lt!317846)) (size!4537 (buf!5042 (_2!9362 lt!317846)))) (and (bvsge (currentBit!9504 (_2!9362 lt!317846)) #b00000000000000000000000000000000) (bvslt (currentBit!9504 (_2!9362 lt!317846)) #b00000000000000000000000000001000) (bvsge (currentByte!9509 (_2!9362 lt!317846)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9509 (_2!9362 lt!317846)) (size!4537 (buf!5042 (_2!9362 lt!317846)))) (and (= (currentBit!9504 (_2!9362 lt!317846)) #b00000000000000000000000000000000) (= (currentByte!9509 (_2!9362 lt!317846)) (size!4537 (buf!5042 (_2!9362 lt!317846))))))))))

(assert (=> b!203603 d!69595))

(assert (=> b!203604 d!69585))

(assert (=> b!203604 d!69593))

(declare-fun b!203771 () Bool)

(declare-fun e!139603 () Bool)

(declare-fun lt!318027 () tuple2!17422)

(declare-fun lt!318029 () tuple2!17420)

(assert (=> b!203771 (= e!139603 (= (bitIndex!0 (size!4537 (buf!5042 (_1!9363 lt!318027))) (currentByte!9509 (_1!9363 lt!318027)) (currentBit!9504 (_1!9363 lt!318027))) (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!318029))) (currentByte!9509 (_2!9362 lt!318029)) (currentBit!9504 (_2!9362 lt!318029)))))))

(declare-fun d!69597 () Bool)

(declare-fun e!139604 () Bool)

(assert (=> d!69597 e!139604))

(declare-fun res!170727 () Bool)

(assert (=> d!69597 (=> (not res!170727) (not e!139604))))

(assert (=> d!69597 (= res!170727 (= (size!4537 (buf!5042 thiss!1204)) (size!4537 (buf!5042 (_2!9362 lt!318029)))))))

(declare-fun choose!16 (BitStream!8182 Bool) tuple2!17420)

(assert (=> d!69597 (= lt!318029 (choose!16 thiss!1204 lt!317848))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69597 (validate_offset_bit!0 ((_ sign_extend 32) (size!4537 (buf!5042 thiss!1204))) ((_ sign_extend 32) (currentByte!9509 thiss!1204)) ((_ sign_extend 32) (currentBit!9504 thiss!1204)))))

(assert (=> d!69597 (= (appendBit!0 thiss!1204 lt!317848) lt!318029)))

(declare-fun b!203769 () Bool)

(declare-fun res!170729 () Bool)

(assert (=> b!203769 (=> (not res!170729) (not e!139604))))

(assert (=> b!203769 (= res!170729 (isPrefixOf!0 thiss!1204 (_2!9362 lt!318029)))))

(declare-fun b!203770 () Bool)

(assert (=> b!203770 (= e!139604 e!139603)))

(declare-fun res!170728 () Bool)

(assert (=> b!203770 (=> (not res!170728) (not e!139603))))

(assert (=> b!203770 (= res!170728 (and (= (_2!9363 lt!318027) lt!317848) (= (_1!9363 lt!318027) (_2!9362 lt!318029))))))

(assert (=> b!203770 (= lt!318027 (readBitPure!0 (readerFrom!0 (_2!9362 lt!318029) (currentBit!9504 thiss!1204) (currentByte!9509 thiss!1204))))))

(declare-fun b!203768 () Bool)

(declare-fun res!170730 () Bool)

(assert (=> b!203768 (=> (not res!170730) (not e!139604))))

(declare-fun lt!318028 () (_ BitVec 64))

(declare-fun lt!318026 () (_ BitVec 64))

(assert (=> b!203768 (= res!170730 (= (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!318029))) (currentByte!9509 (_2!9362 lt!318029)) (currentBit!9504 (_2!9362 lt!318029))) (bvadd lt!318028 lt!318026)))))

(assert (=> b!203768 (or (not (= (bvand lt!318028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318026 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!318028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!318028 lt!318026) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203768 (= lt!318026 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!203768 (= lt!318028 (bitIndex!0 (size!4537 (buf!5042 thiss!1204)) (currentByte!9509 thiss!1204) (currentBit!9504 thiss!1204)))))

(assert (= (and d!69597 res!170727) b!203768))

(assert (= (and b!203768 res!170730) b!203769))

(assert (= (and b!203769 res!170729) b!203770))

(assert (= (and b!203770 res!170728) b!203771))

(declare-fun m!314675 () Bool)

(assert (=> b!203770 m!314675))

(assert (=> b!203770 m!314675))

(declare-fun m!314677 () Bool)

(assert (=> b!203770 m!314677))

(declare-fun m!314679 () Bool)

(assert (=> b!203768 m!314679))

(assert (=> b!203768 m!314527))

(declare-fun m!314681 () Bool)

(assert (=> b!203769 m!314681))

(declare-fun m!314683 () Bool)

(assert (=> d!69597 m!314683))

(declare-fun m!314685 () Bool)

(assert (=> d!69597 m!314685))

(declare-fun m!314687 () Bool)

(assert (=> b!203771 m!314687))

(assert (=> b!203771 m!314679))

(assert (=> b!203604 d!69597))

(declare-fun d!69603 () Bool)

(declare-fun e!139605 () Bool)

(assert (=> d!69603 e!139605))

(declare-fun res!170731 () Bool)

(assert (=> d!69603 (=> (not res!170731) (not e!139605))))

(declare-fun lt!318034 () (_ BitVec 64))

(declare-fun lt!318030 () (_ BitVec 64))

(declare-fun lt!318031 () (_ BitVec 64))

(assert (=> d!69603 (= res!170731 (= lt!318031 (bvsub lt!318030 lt!318034)))))

(assert (=> d!69603 (or (= (bvand lt!318030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318034 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318030 lt!318034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69603 (= lt!318034 (remainingBits!0 ((_ sign_extend 32) (size!4537 (buf!5042 (_1!9363 lt!317852)))) ((_ sign_extend 32) (currentByte!9509 (_1!9363 lt!317852))) ((_ sign_extend 32) (currentBit!9504 (_1!9363 lt!317852)))))))

(declare-fun lt!318033 () (_ BitVec 64))

(declare-fun lt!318035 () (_ BitVec 64))

(assert (=> d!69603 (= lt!318030 (bvmul lt!318033 lt!318035))))

(assert (=> d!69603 (or (= lt!318033 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318035 (bvsdiv (bvmul lt!318033 lt!318035) lt!318033)))))

(assert (=> d!69603 (= lt!318035 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69603 (= lt!318033 ((_ sign_extend 32) (size!4537 (buf!5042 (_1!9363 lt!317852)))))))

(assert (=> d!69603 (= lt!318031 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9509 (_1!9363 lt!317852))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9504 (_1!9363 lt!317852)))))))

(assert (=> d!69603 (invariant!0 (currentBit!9504 (_1!9363 lt!317852)) (currentByte!9509 (_1!9363 lt!317852)) (size!4537 (buf!5042 (_1!9363 lt!317852))))))

(assert (=> d!69603 (= (bitIndex!0 (size!4537 (buf!5042 (_1!9363 lt!317852))) (currentByte!9509 (_1!9363 lt!317852)) (currentBit!9504 (_1!9363 lt!317852))) lt!318031)))

(declare-fun b!203772 () Bool)

(declare-fun res!170732 () Bool)

(assert (=> b!203772 (=> (not res!170732) (not e!139605))))

(assert (=> b!203772 (= res!170732 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318031))))

(declare-fun b!203773 () Bool)

(declare-fun lt!318032 () (_ BitVec 64))

(assert (=> b!203773 (= e!139605 (bvsle lt!318031 (bvmul lt!318032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203773 (or (= lt!318032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318032)))))

(assert (=> b!203773 (= lt!318032 ((_ sign_extend 32) (size!4537 (buf!5042 (_1!9363 lt!317852)))))))

(assert (= (and d!69603 res!170731) b!203772))

(assert (= (and b!203772 res!170732) b!203773))

(declare-fun m!314689 () Bool)

(assert (=> d!69603 m!314689))

(declare-fun m!314691 () Bool)

(assert (=> d!69603 m!314691))

(assert (=> b!203605 d!69603))

(declare-fun d!69605 () Bool)

(assert (=> d!69605 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9504 thiss!1204) (currentByte!9509 thiss!1204) (size!4537 (buf!5042 thiss!1204))))))

(declare-fun bs!17145 () Bool)

(assert (= bs!17145 d!69605))

(assert (=> bs!17145 m!314539))

(assert (=> start!43188 d!69605))

(declare-fun d!69607 () Bool)

(declare-fun e!139606 () Bool)

(assert (=> d!69607 e!139606))

(declare-fun res!170733 () Bool)

(assert (=> d!69607 (=> (not res!170733) (not e!139606))))

(declare-fun lt!318036 () (_ BitVec 64))

(declare-fun lt!318040 () (_ BitVec 64))

(declare-fun lt!318037 () (_ BitVec 64))

(assert (=> d!69607 (= res!170733 (= lt!318037 (bvsub lt!318036 lt!318040)))))

(assert (=> d!69607 (or (= (bvand lt!318036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318040 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318036 lt!318040) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69607 (= lt!318040 (remainingBits!0 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!317846)))) ((_ sign_extend 32) (currentByte!9509 (_2!9362 lt!317846))) ((_ sign_extend 32) (currentBit!9504 (_2!9362 lt!317846)))))))

(declare-fun lt!318039 () (_ BitVec 64))

(declare-fun lt!318041 () (_ BitVec 64))

(assert (=> d!69607 (= lt!318036 (bvmul lt!318039 lt!318041))))

(assert (=> d!69607 (or (= lt!318039 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318041 (bvsdiv (bvmul lt!318039 lt!318041) lt!318039)))))

(assert (=> d!69607 (= lt!318041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69607 (= lt!318039 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!317846)))))))

(assert (=> d!69607 (= lt!318037 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9509 (_2!9362 lt!317846))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9504 (_2!9362 lt!317846)))))))

(assert (=> d!69607 (invariant!0 (currentBit!9504 (_2!9362 lt!317846)) (currentByte!9509 (_2!9362 lt!317846)) (size!4537 (buf!5042 (_2!9362 lt!317846))))))

(assert (=> d!69607 (= (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317846))) (currentByte!9509 (_2!9362 lt!317846)) (currentBit!9504 (_2!9362 lt!317846))) lt!318037)))

(declare-fun b!203774 () Bool)

(declare-fun res!170734 () Bool)

(assert (=> b!203774 (=> (not res!170734) (not e!139606))))

(assert (=> b!203774 (= res!170734 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318037))))

(declare-fun b!203775 () Bool)

(declare-fun lt!318038 () (_ BitVec 64))

(assert (=> b!203775 (= e!139606 (bvsle lt!318037 (bvmul lt!318038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203775 (or (= lt!318038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318038)))))

(assert (=> b!203775 (= lt!318038 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!317846)))))))

(assert (= (and d!69607 res!170733) b!203774))

(assert (= (and b!203774 res!170734) b!203775))

(declare-fun m!314693 () Bool)

(assert (=> d!69607 m!314693))

(assert (=> d!69607 m!314545))

(assert (=> b!203607 d!69607))

(declare-fun d!69609 () Bool)

(declare-fun res!170737 () Bool)

(declare-fun e!139608 () Bool)

(assert (=> d!69609 (=> (not res!170737) (not e!139608))))

(assert (=> d!69609 (= res!170737 (= (size!4537 (buf!5042 thiss!1204)) (size!4537 (buf!5042 (_2!9362 lt!317846)))))))

(assert (=> d!69609 (= (isPrefixOf!0 thiss!1204 (_2!9362 lt!317846)) e!139608)))

(declare-fun b!203776 () Bool)

(declare-fun res!170736 () Bool)

(assert (=> b!203776 (=> (not res!170736) (not e!139608))))

(assert (=> b!203776 (= res!170736 (bvsle (bitIndex!0 (size!4537 (buf!5042 thiss!1204)) (currentByte!9509 thiss!1204) (currentBit!9504 thiss!1204)) (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317846))) (currentByte!9509 (_2!9362 lt!317846)) (currentBit!9504 (_2!9362 lt!317846)))))))

(declare-fun b!203777 () Bool)

(declare-fun e!139607 () Bool)

(assert (=> b!203777 (= e!139608 e!139607)))

(declare-fun res!170735 () Bool)

(assert (=> b!203777 (=> res!170735 e!139607)))

(assert (=> b!203777 (= res!170735 (= (size!4537 (buf!5042 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203778 () Bool)

(assert (=> b!203778 (= e!139607 (arrayBitRangesEq!0 (buf!5042 thiss!1204) (buf!5042 (_2!9362 lt!317846)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4537 (buf!5042 thiss!1204)) (currentByte!9509 thiss!1204) (currentBit!9504 thiss!1204))))))

(assert (= (and d!69609 res!170737) b!203776))

(assert (= (and b!203776 res!170736) b!203777))

(assert (= (and b!203777 (not res!170735)) b!203778))

(assert (=> b!203776 m!314527))

(assert (=> b!203776 m!314531))

(assert (=> b!203778 m!314527))

(assert (=> b!203778 m!314527))

(declare-fun m!314695 () Bool)

(assert (=> b!203778 m!314695))

(assert (=> b!203607 d!69609))

(declare-fun d!69611 () Bool)

(assert (=> d!69611 (isPrefixOf!0 thiss!1204 (_2!9362 lt!317846))))

(declare-fun lt!318044 () Unit!14499)

(declare-fun choose!30 (BitStream!8182 BitStream!8182 BitStream!8182) Unit!14499)

(assert (=> d!69611 (= lt!318044 (choose!30 thiss!1204 (_2!9362 lt!317851) (_2!9362 lt!317846)))))

(assert (=> d!69611 (isPrefixOf!0 thiss!1204 (_2!9362 lt!317851))))

(assert (=> d!69611 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9362 lt!317851) (_2!9362 lt!317846)) lt!318044)))

(declare-fun bs!17146 () Bool)

(assert (= bs!17146 d!69611))

(assert (=> bs!17146 m!314533))

(declare-fun m!314697 () Bool)

(assert (=> bs!17146 m!314697))

(assert (=> bs!17146 m!314543))

(assert (=> b!203607 d!69611))

(declare-fun b!203931 () Bool)

(declare-fun e!139704 () tuple2!17420)

(declare-fun Unit!14522 () Unit!14499)

(assert (=> b!203931 (= e!139704 (tuple2!17421 Unit!14522 (_2!9362 lt!317851)))))

(declare-fun lt!318526 () Unit!14499)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8182) Unit!14499)

(assert (=> b!203931 (= lt!318526 (lemmaIsPrefixRefl!0 (_2!9362 lt!317851)))))

(declare-fun call!3225 () Bool)

(assert (=> b!203931 call!3225))

(declare-fun lt!318565 () Unit!14499)

(assert (=> b!203931 (= lt!318565 lt!318526)))

(declare-fun b!203932 () Bool)

(declare-fun e!139697 () (_ BitVec 64))

(assert (=> b!203932 (= e!139697 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!203933 () Bool)

(declare-fun e!139701 () Bool)

(declare-fun e!139698 () Bool)

(assert (=> b!203933 (= e!139701 e!139698)))

(declare-fun res!170860 () Bool)

(assert (=> b!203933 (=> (not res!170860) (not e!139698))))

(declare-datatypes ((tuple2!17444 0))(
  ( (tuple2!17445 (_1!9374 BitStream!8182) (_2!9374 (_ BitVec 64))) )
))
(declare-fun lt!318572 () tuple2!17444)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203933 (= res!170860 (= (_2!9374 lt!318572) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!17446 0))(
  ( (tuple2!17447 (_1!9375 BitStream!8182) (_2!9375 BitStream!8182)) )
))
(declare-fun lt!318524 () tuple2!17446)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17444)

(assert (=> b!203933 (= lt!318572 (readNBitsLSBFirstsLoopPure!0 (_1!9375 lt!318524) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!318571 () Unit!14499)

(declare-fun lt!318538 () Unit!14499)

(assert (=> b!203933 (= lt!318571 lt!318538)))

(declare-fun lt!318557 () tuple2!17420)

(declare-fun lt!318556 () (_ BitVec 64))

(assert (=> b!203933 (validate_offset_bits!1 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!318557)))) ((_ sign_extend 32) (currentByte!9509 (_2!9362 lt!317851))) ((_ sign_extend 32) (currentBit!9504 (_2!9362 lt!317851))) lt!318556)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8182 array!10316 (_ BitVec 64)) Unit!14499)

(assert (=> b!203933 (= lt!318538 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9362 lt!317851) (buf!5042 (_2!9362 lt!318557)) lt!318556))))

(declare-fun e!139700 () Bool)

(assert (=> b!203933 e!139700))

(declare-fun res!170866 () Bool)

(assert (=> b!203933 (=> (not res!170866) (not e!139700))))

(assert (=> b!203933 (= res!170866 (and (= (size!4537 (buf!5042 (_2!9362 lt!317851))) (size!4537 (buf!5042 (_2!9362 lt!318557)))) (bvsge lt!318556 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203933 (= lt!318556 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!203933 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8182 BitStream!8182) tuple2!17446)

(assert (=> b!203933 (= lt!318524 (reader!0 (_2!9362 lt!317851) (_2!9362 lt!318557)))))

(declare-fun b!203934 () Bool)

(declare-fun e!139696 () Bool)

(declare-fun lt!318525 () tuple2!17422)

(declare-fun lt!318552 () tuple2!17422)

(assert (=> b!203934 (= e!139696 (= (_2!9363 lt!318525) (_2!9363 lt!318552)))))

(declare-fun d!69613 () Bool)

(assert (=> d!69613 e!139701))

(declare-fun res!170867 () Bool)

(assert (=> d!69613 (=> (not res!170867) (not e!139701))))

(assert (=> d!69613 (= res!170867 (invariant!0 (currentBit!9504 (_2!9362 lt!318557)) (currentByte!9509 (_2!9362 lt!318557)) (size!4537 (buf!5042 (_2!9362 lt!318557)))))))

(assert (=> d!69613 (= lt!318557 e!139704)))

(declare-fun c!10115 () Bool)

(assert (=> d!69613 (= c!10115 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69613 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69613 (= (appendBitsLSBFirstLoopTR!0 (_2!9362 lt!317851) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!318557)))

(declare-fun b!203935 () Bool)

(declare-fun res!170859 () Bool)

(assert (=> b!203935 (=> (not res!170859) (not e!139701))))

(assert (=> b!203935 (= res!170859 (= (size!4537 (buf!5042 (_2!9362 lt!317851))) (size!4537 (buf!5042 (_2!9362 lt!318557)))))))

(declare-fun b!203936 () Bool)

(declare-fun lt!318523 () tuple2!17420)

(assert (=> b!203936 (= e!139704 (tuple2!17421 (_1!9362 lt!318523) (_2!9362 lt!318523)))))

(declare-fun lt!318544 () Bool)

(assert (=> b!203936 (= lt!318544 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!318534 () tuple2!17420)

(assert (=> b!203936 (= lt!318534 (appendBit!0 (_2!9362 lt!317851) lt!318544))))

(declare-fun res!170861 () Bool)

(assert (=> b!203936 (= res!170861 (= (size!4537 (buf!5042 (_2!9362 lt!317851))) (size!4537 (buf!5042 (_2!9362 lt!318534)))))))

(declare-fun e!139703 () Bool)

(assert (=> b!203936 (=> (not res!170861) (not e!139703))))

(assert (=> b!203936 e!139703))

(declare-fun lt!318543 () tuple2!17420)

(assert (=> b!203936 (= lt!318543 lt!318534)))

(assert (=> b!203936 (= lt!318523 (appendBitsLSBFirstLoopTR!0 (_2!9362 lt!318543) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!318558 () Unit!14499)

(assert (=> b!203936 (= lt!318558 (lemmaIsPrefixTransitive!0 (_2!9362 lt!317851) (_2!9362 lt!318543) (_2!9362 lt!318523)))))

(assert (=> b!203936 (isPrefixOf!0 (_2!9362 lt!317851) (_2!9362 lt!318523))))

(declare-fun lt!318537 () Unit!14499)

(assert (=> b!203936 (= lt!318537 lt!318558)))

(assert (=> b!203936 (invariant!0 (currentBit!9504 (_2!9362 lt!317851)) (currentByte!9509 (_2!9362 lt!317851)) (size!4537 (buf!5042 (_2!9362 lt!318543))))))

(declare-fun lt!318528 () BitStream!8182)

(assert (=> b!203936 (= lt!318528 (BitStream!8183 (buf!5042 (_2!9362 lt!318543)) (currentByte!9509 (_2!9362 lt!317851)) (currentBit!9504 (_2!9362 lt!317851))))))

(assert (=> b!203936 (invariant!0 (currentBit!9504 lt!318528) (currentByte!9509 lt!318528) (size!4537 (buf!5042 (_2!9362 lt!318523))))))

(declare-fun lt!318566 () BitStream!8182)

(assert (=> b!203936 (= lt!318566 (BitStream!8183 (buf!5042 (_2!9362 lt!318523)) (currentByte!9509 lt!318528) (currentBit!9504 lt!318528)))))

(assert (=> b!203936 (= lt!318525 (readBitPure!0 lt!318528))))

(assert (=> b!203936 (= lt!318552 (readBitPure!0 lt!318566))))

(declare-fun lt!318520 () Unit!14499)

(declare-fun readBitPrefixLemma!0 (BitStream!8182 BitStream!8182) Unit!14499)

(assert (=> b!203936 (= lt!318520 (readBitPrefixLemma!0 lt!318528 (_2!9362 lt!318523)))))

(declare-fun res!170863 () Bool)

(assert (=> b!203936 (= res!170863 (= (bitIndex!0 (size!4537 (buf!5042 (_1!9363 lt!318525))) (currentByte!9509 (_1!9363 lt!318525)) (currentBit!9504 (_1!9363 lt!318525))) (bitIndex!0 (size!4537 (buf!5042 (_1!9363 lt!318552))) (currentByte!9509 (_1!9363 lt!318552)) (currentBit!9504 (_1!9363 lt!318552)))))))

(assert (=> b!203936 (=> (not res!170863) (not e!139696))))

(assert (=> b!203936 e!139696))

(declare-fun lt!318549 () Unit!14499)

(assert (=> b!203936 (= lt!318549 lt!318520)))

(declare-fun lt!318530 () tuple2!17446)

(assert (=> b!203936 (= lt!318530 (reader!0 (_2!9362 lt!317851) (_2!9362 lt!318523)))))

(declare-fun lt!318559 () tuple2!17446)

(assert (=> b!203936 (= lt!318559 (reader!0 (_2!9362 lt!318543) (_2!9362 lt!318523)))))

(declare-fun lt!318529 () tuple2!17422)

(assert (=> b!203936 (= lt!318529 (readBitPure!0 (_1!9375 lt!318530)))))

(assert (=> b!203936 (= (_2!9363 lt!318529) lt!318544)))

(declare-fun lt!318541 () Unit!14499)

(declare-fun Unit!14528 () Unit!14499)

(assert (=> b!203936 (= lt!318541 Unit!14528)))

(declare-fun lt!318535 () (_ BitVec 64))

(assert (=> b!203936 (= lt!318535 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318517 () (_ BitVec 64))

(assert (=> b!203936 (= lt!318517 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318518 () Unit!14499)

(assert (=> b!203936 (= lt!318518 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9362 lt!317851) (buf!5042 (_2!9362 lt!318523)) lt!318517))))

(assert (=> b!203936 (validate_offset_bits!1 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!318523)))) ((_ sign_extend 32) (currentByte!9509 (_2!9362 lt!317851))) ((_ sign_extend 32) (currentBit!9504 (_2!9362 lt!317851))) lt!318517)))

(declare-fun lt!318563 () Unit!14499)

(assert (=> b!203936 (= lt!318563 lt!318518)))

(declare-fun lt!318545 () tuple2!17444)

(assert (=> b!203936 (= lt!318545 (readNBitsLSBFirstsLoopPure!0 (_1!9375 lt!318530) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!318535))))

(declare-fun lt!318564 () (_ BitVec 64))

(assert (=> b!203936 (= lt!318564 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!318550 () Unit!14499)

(assert (=> b!203936 (= lt!318550 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9362 lt!318543) (buf!5042 (_2!9362 lt!318523)) lt!318564))))

(assert (=> b!203936 (validate_offset_bits!1 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!318523)))) ((_ sign_extend 32) (currentByte!9509 (_2!9362 lt!318543))) ((_ sign_extend 32) (currentBit!9504 (_2!9362 lt!318543))) lt!318564)))

(declare-fun lt!318531 () Unit!14499)

(assert (=> b!203936 (= lt!318531 lt!318550)))

(declare-fun lt!318560 () tuple2!17444)

(assert (=> b!203936 (= lt!318560 (readNBitsLSBFirstsLoopPure!0 (_1!9375 lt!318559) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!318535 (ite (_2!9363 lt!318529) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!318547 () tuple2!17444)

(assert (=> b!203936 (= lt!318547 (readNBitsLSBFirstsLoopPure!0 (_1!9375 lt!318530) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!318535))))

(declare-fun c!10114 () Bool)

(assert (=> b!203936 (= c!10114 (_2!9363 (readBitPure!0 (_1!9375 lt!318530))))))

(declare-fun lt!318546 () tuple2!17444)

(declare-fun withMovedBitIndex!0 (BitStream!8182 (_ BitVec 64)) BitStream!8182)

(assert (=> b!203936 (= lt!318546 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9375 lt!318530) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!318535 e!139697)))))

(declare-fun lt!318536 () Unit!14499)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14499)

(assert (=> b!203936 (= lt!318536 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9375 lt!318530) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!318535))))

(assert (=> b!203936 (and (= (_2!9374 lt!318547) (_2!9374 lt!318546)) (= (_1!9374 lt!318547) (_1!9374 lt!318546)))))

(declare-fun lt!318522 () Unit!14499)

(assert (=> b!203936 (= lt!318522 lt!318536)))

(assert (=> b!203936 (= (_1!9375 lt!318530) (withMovedBitIndex!0 (_2!9375 lt!318530) (bvsub (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317851))) (currentByte!9509 (_2!9362 lt!317851)) (currentBit!9504 (_2!9362 lt!317851))) (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!318523))) (currentByte!9509 (_2!9362 lt!318523)) (currentBit!9504 (_2!9362 lt!318523))))))))

(declare-fun lt!318548 () Unit!14499)

(declare-fun Unit!14529 () Unit!14499)

(assert (=> b!203936 (= lt!318548 Unit!14529)))

(assert (=> b!203936 (= (_1!9375 lt!318559) (withMovedBitIndex!0 (_2!9375 lt!318559) (bvsub (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!318543))) (currentByte!9509 (_2!9362 lt!318543)) (currentBit!9504 (_2!9362 lt!318543))) (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!318523))) (currentByte!9509 (_2!9362 lt!318523)) (currentBit!9504 (_2!9362 lt!318523))))))))

(declare-fun lt!318569 () Unit!14499)

(declare-fun Unit!14530 () Unit!14499)

(assert (=> b!203936 (= lt!318569 Unit!14530)))

(assert (=> b!203936 (= (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317851))) (currentByte!9509 (_2!9362 lt!317851)) (currentBit!9504 (_2!9362 lt!317851))) (bvsub (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!318543))) (currentByte!9509 (_2!9362 lt!318543)) (currentBit!9504 (_2!9362 lt!318543))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!318554 () Unit!14499)

(declare-fun Unit!14531 () Unit!14499)

(assert (=> b!203936 (= lt!318554 Unit!14531)))

(assert (=> b!203936 (= (_2!9374 lt!318545) (_2!9374 lt!318560))))

(declare-fun lt!318540 () Unit!14499)

(declare-fun Unit!14532 () Unit!14499)

(assert (=> b!203936 (= lt!318540 Unit!14532)))

(assert (=> b!203936 (invariant!0 (currentBit!9504 (_2!9362 lt!318523)) (currentByte!9509 (_2!9362 lt!318523)) (size!4537 (buf!5042 (_2!9362 lt!318523))))))

(declare-fun lt!318561 () Unit!14499)

(declare-fun Unit!14533 () Unit!14499)

(assert (=> b!203936 (= lt!318561 Unit!14533)))

(assert (=> b!203936 (= (size!4537 (buf!5042 (_2!9362 lt!317851))) (size!4537 (buf!5042 (_2!9362 lt!318523))))))

(declare-fun lt!318553 () Unit!14499)

(declare-fun Unit!14534 () Unit!14499)

(assert (=> b!203936 (= lt!318553 Unit!14534)))

(assert (=> b!203936 (= (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!318523))) (currentByte!9509 (_2!9362 lt!318523)) (currentBit!9504 (_2!9362 lt!318523))) (bvsub (bvadd (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317851))) (currentByte!9509 (_2!9362 lt!317851)) (currentBit!9504 (_2!9362 lt!317851))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318562 () Unit!14499)

(declare-fun Unit!14535 () Unit!14499)

(assert (=> b!203936 (= lt!318562 Unit!14535)))

(declare-fun lt!318533 () Unit!14499)

(declare-fun Unit!14536 () Unit!14499)

(assert (=> b!203936 (= lt!318533 Unit!14536)))

(declare-fun lt!318542 () tuple2!17446)

(assert (=> b!203936 (= lt!318542 (reader!0 (_2!9362 lt!317851) (_2!9362 lt!318523)))))

(declare-fun lt!318551 () (_ BitVec 64))

(assert (=> b!203936 (= lt!318551 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318555 () Unit!14499)

(assert (=> b!203936 (= lt!318555 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9362 lt!317851) (buf!5042 (_2!9362 lt!318523)) lt!318551))))

(assert (=> b!203936 (validate_offset_bits!1 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!318523)))) ((_ sign_extend 32) (currentByte!9509 (_2!9362 lt!317851))) ((_ sign_extend 32) (currentBit!9504 (_2!9362 lt!317851))) lt!318551)))

(declare-fun lt!318519 () Unit!14499)

(assert (=> b!203936 (= lt!318519 lt!318555)))

(declare-fun lt!318532 () tuple2!17444)

(assert (=> b!203936 (= lt!318532 (readNBitsLSBFirstsLoopPure!0 (_1!9375 lt!318542) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!170864 () Bool)

(assert (=> b!203936 (= res!170864 (= (_2!9374 lt!318532) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!139702 () Bool)

(assert (=> b!203936 (=> (not res!170864) (not e!139702))))

(assert (=> b!203936 e!139702))

(declare-fun lt!318570 () Unit!14499)

(declare-fun Unit!14537 () Unit!14499)

(assert (=> b!203936 (= lt!318570 Unit!14537)))

(declare-fun bm!3222 () Bool)

(assert (=> bm!3222 (= call!3225 (isPrefixOf!0 (_2!9362 lt!317851) (ite c!10115 (_2!9362 lt!317851) (_2!9362 lt!318534))))))

(declare-fun b!203937 () Bool)

(declare-fun e!139699 () Bool)

(declare-fun lt!318568 () tuple2!17422)

(assert (=> b!203937 (= e!139699 (= (bitIndex!0 (size!4537 (buf!5042 (_1!9363 lt!318568))) (currentByte!9509 (_1!9363 lt!318568)) (currentBit!9504 (_1!9363 lt!318568))) (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!318534))) (currentByte!9509 (_2!9362 lt!318534)) (currentBit!9504 (_2!9362 lt!318534)))))))

(declare-fun b!203938 () Bool)

(declare-fun res!170868 () Bool)

(assert (=> b!203938 (= res!170868 (= (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!318534))) (currentByte!9509 (_2!9362 lt!318534)) (currentBit!9504 (_2!9362 lt!318534))) (bvadd (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317851))) (currentByte!9509 (_2!9362 lt!317851)) (currentBit!9504 (_2!9362 lt!317851))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!203938 (=> (not res!170868) (not e!139703))))

(declare-fun b!203939 () Bool)

(assert (=> b!203939 (= e!139702 (= (_1!9374 lt!318532) (_2!9375 lt!318542)))))

(declare-fun b!203940 () Bool)

(declare-fun res!170870 () Bool)

(assert (=> b!203940 (=> (not res!170870) (not e!139701))))

(declare-fun lt!318527 () (_ BitVec 64))

(declare-fun lt!318567 () (_ BitVec 64))

(assert (=> b!203940 (= res!170870 (= (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!318557))) (currentByte!9509 (_2!9362 lt!318557)) (currentBit!9504 (_2!9362 lt!318557))) (bvsub lt!318527 lt!318567)))))

(assert (=> b!203940 (or (= (bvand lt!318527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318567 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318527 lt!318567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203940 (= lt!318567 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!318521 () (_ BitVec 64))

(declare-fun lt!318539 () (_ BitVec 64))

(assert (=> b!203940 (= lt!318527 (bvadd lt!318521 lt!318539))))

(assert (=> b!203940 (or (not (= (bvand lt!318521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318539 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!318521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!318521 lt!318539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203940 (= lt!318539 ((_ sign_extend 32) nBits!348))))

(assert (=> b!203940 (= lt!318521 (bitIndex!0 (size!4537 (buf!5042 (_2!9362 lt!317851))) (currentByte!9509 (_2!9362 lt!317851)) (currentBit!9504 (_2!9362 lt!317851))))))

(declare-fun b!203941 () Bool)

(assert (=> b!203941 (= lt!318568 (readBitPure!0 (readerFrom!0 (_2!9362 lt!318534) (currentBit!9504 (_2!9362 lt!317851)) (currentByte!9509 (_2!9362 lt!317851)))))))

(declare-fun res!170869 () Bool)

(assert (=> b!203941 (= res!170869 (and (= (_2!9363 lt!318568) lt!318544) (= (_1!9363 lt!318568) (_2!9362 lt!318534))))))

(assert (=> b!203941 (=> (not res!170869) (not e!139699))))

(assert (=> b!203941 (= e!139703 e!139699)))

(declare-fun b!203942 () Bool)

(assert (=> b!203942 (= e!139697 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!203943 () Bool)

(assert (=> b!203943 (= e!139698 (= (_1!9374 lt!318572) (_2!9375 lt!318524)))))

(declare-fun b!203944 () Bool)

(declare-fun res!170865 () Bool)

(assert (=> b!203944 (=> (not res!170865) (not e!139701))))

(assert (=> b!203944 (= res!170865 (isPrefixOf!0 (_2!9362 lt!317851) (_2!9362 lt!318557)))))

(declare-fun b!203945 () Bool)

(assert (=> b!203945 (= e!139700 (validate_offset_bits!1 ((_ sign_extend 32) (size!4537 (buf!5042 (_2!9362 lt!317851)))) ((_ sign_extend 32) (currentByte!9509 (_2!9362 lt!317851))) ((_ sign_extend 32) (currentBit!9504 (_2!9362 lt!317851))) lt!318556))))

(declare-fun b!203946 () Bool)

(declare-fun res!170862 () Bool)

(assert (=> b!203946 (= res!170862 call!3225)))

(assert (=> b!203946 (=> (not res!170862) (not e!139703))))

(assert (= (and d!69613 c!10115) b!203931))

(assert (= (and d!69613 (not c!10115)) b!203936))

(assert (= (and b!203936 res!170861) b!203938))

(assert (= (and b!203938 res!170868) b!203946))

(assert (= (and b!203946 res!170862) b!203941))

(assert (= (and b!203941 res!170869) b!203937))

(assert (= (and b!203936 res!170863) b!203934))

(assert (= (and b!203936 c!10114) b!203932))

(assert (= (and b!203936 (not c!10114)) b!203942))

(assert (= (and b!203936 res!170864) b!203939))

(assert (= (or b!203931 b!203946) bm!3222))

(assert (= (and d!69613 res!170867) b!203935))

(assert (= (and b!203935 res!170859) b!203940))

(assert (= (and b!203940 res!170870) b!203944))

(assert (= (and b!203944 res!170865) b!203933))

(assert (= (and b!203933 res!170866) b!203945))

(assert (= (and b!203933 res!170860) b!203943))

(declare-fun m!314915 () Bool)

(assert (=> b!203944 m!314915))

(declare-fun m!314917 () Bool)

(assert (=> b!203937 m!314917))

(declare-fun m!314919 () Bool)

(assert (=> b!203937 m!314919))

(declare-fun m!314921 () Bool)

(assert (=> b!203936 m!314921))

(declare-fun m!314923 () Bool)

(assert (=> b!203936 m!314923))

(declare-fun m!314925 () Bool)

(assert (=> b!203936 m!314925))

(declare-fun m!314927 () Bool)

(assert (=> b!203936 m!314927))

(declare-fun m!314929 () Bool)

(assert (=> b!203936 m!314929))

(declare-fun m!314931 () Bool)

(assert (=> b!203936 m!314931))

(declare-fun m!314933 () Bool)

(assert (=> b!203936 m!314933))

(declare-fun m!314935 () Bool)

(assert (=> b!203936 m!314935))

(declare-fun m!314937 () Bool)

(assert (=> b!203936 m!314937))

(declare-fun m!314939 () Bool)

(assert (=> b!203936 m!314939))

(declare-fun m!314941 () Bool)

(assert (=> b!203936 m!314941))

(declare-fun m!314943 () Bool)

(assert (=> b!203936 m!314943))

(declare-fun m!314945 () Bool)

(assert (=> b!203936 m!314945))

(declare-fun m!314947 () Bool)

(assert (=> b!203936 m!314947))

(declare-fun m!314949 () Bool)

(assert (=> b!203936 m!314949))

(declare-fun m!314951 () Bool)

(assert (=> b!203936 m!314951))

(declare-fun m!314953 () Bool)

(assert (=> b!203936 m!314953))

(declare-fun m!314955 () Bool)

(assert (=> b!203936 m!314955))

(declare-fun m!314957 () Bool)

(assert (=> b!203936 m!314957))

(assert (=> b!203936 m!314525))

(declare-fun m!314959 () Bool)

(assert (=> b!203936 m!314959))

(declare-fun m!314961 () Bool)

(assert (=> b!203936 m!314961))

(declare-fun m!314963 () Bool)

(assert (=> b!203936 m!314963))

(declare-fun m!314965 () Bool)

(assert (=> b!203936 m!314965))

(declare-fun m!314967 () Bool)

(assert (=> b!203936 m!314967))

(assert (=> b!203936 m!314947))

(declare-fun m!314969 () Bool)

(assert (=> b!203936 m!314969))

(declare-fun m!314971 () Bool)

(assert (=> b!203936 m!314971))

(declare-fun m!314973 () Bool)

(assert (=> b!203936 m!314973))

(declare-fun m!314975 () Bool)

(assert (=> b!203936 m!314975))

(declare-fun m!314977 () Bool)

(assert (=> b!203936 m!314977))

(declare-fun m!314979 () Bool)

(assert (=> b!203936 m!314979))

(declare-fun m!314981 () Bool)

(assert (=> b!203936 m!314981))

(declare-fun m!314983 () Bool)

(assert (=> b!203936 m!314983))

(declare-fun m!314985 () Bool)

(assert (=> b!203936 m!314985))

(declare-fun m!314987 () Bool)

(assert (=> b!203945 m!314987))

(declare-fun m!314989 () Bool)

(assert (=> d!69613 m!314989))

(declare-fun m!314991 () Bool)

(assert (=> bm!3222 m!314991))

(assert (=> b!203938 m!314919))

(assert (=> b!203938 m!314525))

(declare-fun m!314993 () Bool)

(assert (=> b!203941 m!314993))

(assert (=> b!203941 m!314993))

(declare-fun m!314995 () Bool)

(assert (=> b!203941 m!314995))

(declare-fun m!314997 () Bool)

(assert (=> b!203933 m!314997))

(declare-fun m!314999 () Bool)

(assert (=> b!203933 m!314999))

(assert (=> b!203933 m!314951))

(assert (=> b!203933 m!314931))

(declare-fun m!315001 () Bool)

(assert (=> b!203933 m!315001))

(declare-fun m!315003 () Bool)

(assert (=> b!203933 m!315003))

(declare-fun m!315005 () Bool)

(assert (=> b!203940 m!315005))

(assert (=> b!203940 m!314525))

(declare-fun m!315007 () Bool)

(assert (=> b!203931 m!315007))

(assert (=> b!203607 d!69613))

(push 1)

(assert (not d!69603))

(assert (not b!203936))

(assert (not d!69611))

(assert (not b!203771))

(assert (not b!203729))

(assert (not b!203931))

(assert (not d!69605))

(assert (not d!69571))

(assert (not d!69607))

(assert (not b!203945))

(assert (not b!203778))

(assert (not b!203941))

(assert (not d!69583))

(assert (not bm!3222))

(assert (not b!203770))

(assert (not b!203933))

(assert (not b!203940))

(assert (not d!69613))

(assert (not b!203722))

(assert (not d!69585))

(assert (not b!203731))

(assert (not b!203938))

(assert (not d!69597))

(assert (not b!203769))

(assert (not b!203944))

(assert (not d!69593))

(assert (not d!69573))

(assert (not b!203768))

(assert (not b!203776))

(assert (not b!203937))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

