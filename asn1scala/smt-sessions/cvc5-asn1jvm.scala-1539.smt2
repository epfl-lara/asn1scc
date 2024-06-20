; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42972 () Bool)

(assert start!42972)

(declare-fun b!202552 () Bool)

(declare-fun res!169657 () Bool)

(declare-fun e!138869 () Bool)

(assert (=> b!202552 (=> (not res!169657) (not e!138869))))

(declare-datatypes ((array!10289 0))(
  ( (array!10290 (arr!5458 (Array (_ BitVec 32) (_ BitVec 8))) (size!4528 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8164 0))(
  ( (BitStream!8165 (buf!5033 array!10289) (currentByte!9473 (_ BitVec 32)) (currentBit!9468 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8164)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202552 (= res!169657 (invariant!0 (currentBit!9468 thiss!1204) (currentByte!9473 thiss!1204) (size!4528 (buf!5033 thiss!1204))))))

(declare-fun b!202553 () Bool)

(declare-fun e!138868 () Bool)

(declare-datatypes ((tuple2!17330 0))(
  ( (tuple2!17331 (_1!9317 BitStream!8164) (_2!9317 Bool)) )
))
(declare-fun lt!315614 () tuple2!17330)

(declare-fun lt!315619 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202553 (= e!138868 (= (bitIndex!0 (size!4528 (buf!5033 (_1!9317 lt!315614))) (currentByte!9473 (_1!9317 lt!315614)) (currentBit!9468 (_1!9317 lt!315614))) lt!315619))))

(declare-fun lt!315623 () (_ BitVec 64))

(declare-fun b!202554 () Bool)

(declare-fun lt!315620 () (_ BitVec 64))

(declare-fun e!138873 () Bool)

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!202554 (= e!138873 (or (not (= lt!315620 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!315620 (bvand (bvadd lt!315623 ((_ sign_extend 32) nBits!348)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!202554 (= lt!315620 (bvand lt!315623 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14382 0))(
  ( (Unit!14383) )
))
(declare-datatypes ((tuple2!17332 0))(
  ( (tuple2!17333 (_1!9318 Unit!14382) (_2!9318 BitStream!8164)) )
))
(declare-fun lt!315618 () tuple2!17332)

(declare-fun isPrefixOf!0 (BitStream!8164 BitStream!8164) Bool)

(assert (=> b!202554 (isPrefixOf!0 thiss!1204 (_2!9318 lt!315618))))

(declare-fun lt!315615 () tuple2!17332)

(declare-fun lt!315621 () Unit!14382)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8164 BitStream!8164 BitStream!8164) Unit!14382)

(assert (=> b!202554 (= lt!315621 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9318 lt!315615) (_2!9318 lt!315618)))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8164 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17332)

(assert (=> b!202554 (= lt!315618 (appendBitsLSBFirstLoopTR!0 (_2!9318 lt!315615) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202555 () Bool)

(declare-fun e!138871 () Bool)

(declare-fun e!138872 () Bool)

(assert (=> b!202555 (= e!138871 e!138872)))

(declare-fun res!169654 () Bool)

(assert (=> b!202555 (=> (not res!169654) (not e!138872))))

(declare-fun lt!315622 () (_ BitVec 64))

(assert (=> b!202555 (= res!169654 (= lt!315619 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!315622)))))

(assert (=> b!202555 (= lt!315619 (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!315615))) (currentByte!9473 (_2!9318 lt!315615)) (currentBit!9468 (_2!9318 lt!315615))))))

(assert (=> b!202555 (= lt!315622 (bitIndex!0 (size!4528 (buf!5033 thiss!1204)) (currentByte!9473 thiss!1204) (currentBit!9468 thiss!1204)))))

(declare-fun b!202556 () Bool)

(assert (=> b!202556 (= e!138869 (not e!138873))))

(declare-fun res!169656 () Bool)

(assert (=> b!202556 (=> res!169656 e!138873)))

(declare-fun lt!315616 () (_ BitVec 64))

(assert (=> b!202556 (= res!169656 (not (= lt!315623 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!315616))))))

(assert (=> b!202556 (= lt!315623 (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!315615))) (currentByte!9473 (_2!9318 lt!315615)) (currentBit!9468 (_2!9318 lt!315615))))))

(assert (=> b!202556 (= lt!315616 (bitIndex!0 (size!4528 (buf!5033 thiss!1204)) (currentByte!9473 thiss!1204) (currentBit!9468 thiss!1204)))))

(assert (=> b!202556 e!138871))

(declare-fun res!169653 () Bool)

(assert (=> b!202556 (=> (not res!169653) (not e!138871))))

(assert (=> b!202556 (= res!169653 (= (size!4528 (buf!5033 thiss!1204)) (size!4528 (buf!5033 (_2!9318 lt!315615)))))))

(declare-fun lt!315617 () Bool)

(declare-fun appendBit!0 (BitStream!8164 Bool) tuple2!17332)

(assert (=> b!202556 (= lt!315615 (appendBit!0 thiss!1204 lt!315617))))

(assert (=> b!202556 (= lt!315617 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202557 () Bool)

(declare-fun e!138867 () Bool)

(declare-fun array_inv!4269 (array!10289) Bool)

(assert (=> b!202557 (= e!138867 (array_inv!4269 (buf!5033 thiss!1204)))))

(declare-fun b!202558 () Bool)

(assert (=> b!202558 (= e!138872 e!138868)))

(declare-fun res!169660 () Bool)

(assert (=> b!202558 (=> (not res!169660) (not e!138868))))

(assert (=> b!202558 (= res!169660 (and (= (_2!9317 lt!315614) lt!315617) (= (_1!9317 lt!315614) (_2!9318 lt!315615))))))

(declare-fun readBitPure!0 (BitStream!8164) tuple2!17330)

(declare-fun readerFrom!0 (BitStream!8164 (_ BitVec 32) (_ BitVec 32)) BitStream!8164)

(assert (=> b!202558 (= lt!315614 (readBitPure!0 (readerFrom!0 (_2!9318 lt!315615) (currentBit!9468 thiss!1204) (currentByte!9473 thiss!1204))))))

(declare-fun res!169655 () Bool)

(assert (=> start!42972 (=> (not res!169655) (not e!138869))))

(assert (=> start!42972 (= res!169655 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42972 e!138869))

(assert (=> start!42972 true))

(declare-fun inv!12 (BitStream!8164) Bool)

(assert (=> start!42972 (and (inv!12 thiss!1204) e!138867)))

(declare-fun b!202551 () Bool)

(declare-fun res!169659 () Bool)

(assert (=> b!202551 (=> (not res!169659) (not e!138872))))

(assert (=> b!202551 (= res!169659 (isPrefixOf!0 thiss!1204 (_2!9318 lt!315615)))))

(declare-fun b!202559 () Bool)

(declare-fun res!169661 () Bool)

(assert (=> b!202559 (=> (not res!169661) (not e!138869))))

(assert (=> b!202559 (= res!169661 (not (= i!590 nBits!348)))))

(declare-fun b!202560 () Bool)

(declare-fun res!169658 () Bool)

(assert (=> b!202560 (=> (not res!169658) (not e!138869))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202560 (= res!169658 (validate_offset_bits!1 ((_ sign_extend 32) (size!4528 (buf!5033 thiss!1204))) ((_ sign_extend 32) (currentByte!9473 thiss!1204)) ((_ sign_extend 32) (currentBit!9468 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!42972 res!169655) b!202560))

(assert (= (and b!202560 res!169658) b!202552))

(assert (= (and b!202552 res!169657) b!202559))

(assert (= (and b!202559 res!169661) b!202556))

(assert (= (and b!202556 res!169653) b!202555))

(assert (= (and b!202555 res!169654) b!202551))

(assert (= (and b!202551 res!169659) b!202558))

(assert (= (and b!202558 res!169660) b!202553))

(assert (= (and b!202556 (not res!169656)) b!202554))

(assert (= start!42972 b!202557))

(declare-fun m!313101 () Bool)

(assert (=> b!202560 m!313101))

(declare-fun m!313103 () Bool)

(assert (=> b!202558 m!313103))

(assert (=> b!202558 m!313103))

(declare-fun m!313105 () Bool)

(assert (=> b!202558 m!313105))

(declare-fun m!313107 () Bool)

(assert (=> b!202554 m!313107))

(declare-fun m!313109 () Bool)

(assert (=> b!202554 m!313109))

(declare-fun m!313111 () Bool)

(assert (=> b!202554 m!313111))

(declare-fun m!313113 () Bool)

(assert (=> b!202557 m!313113))

(declare-fun m!313115 () Bool)

(assert (=> start!42972 m!313115))

(declare-fun m!313117 () Bool)

(assert (=> b!202552 m!313117))

(declare-fun m!313119 () Bool)

(assert (=> b!202551 m!313119))

(declare-fun m!313121 () Bool)

(assert (=> b!202555 m!313121))

(declare-fun m!313123 () Bool)

(assert (=> b!202555 m!313123))

(declare-fun m!313125 () Bool)

(assert (=> b!202553 m!313125))

(assert (=> b!202556 m!313121))

(assert (=> b!202556 m!313123))

(declare-fun m!313127 () Bool)

(assert (=> b!202556 m!313127))

(push 1)

(assert (not b!202551))

(assert (not b!202555))

(assert (not b!202557))

(assert (not b!202556))

(assert (not b!202558))

(assert (not b!202552))

(assert (not start!42972))

(assert (not b!202560))

(assert (not b!202553))

(assert (not b!202554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69305 () Bool)

(declare-datatypes ((tuple2!17344 0))(
  ( (tuple2!17345 (_1!9324 Bool) (_2!9324 BitStream!8164)) )
))
(declare-fun lt!315713 () tuple2!17344)

(declare-fun readBit!0 (BitStream!8164) tuple2!17344)

(assert (=> d!69305 (= lt!315713 (readBit!0 (readerFrom!0 (_2!9318 lt!315615) (currentBit!9468 thiss!1204) (currentByte!9473 thiss!1204))))))

(assert (=> d!69305 (= (readBitPure!0 (readerFrom!0 (_2!9318 lt!315615) (currentBit!9468 thiss!1204) (currentByte!9473 thiss!1204))) (tuple2!17331 (_2!9324 lt!315713) (_1!9324 lt!315713)))))

(declare-fun bs!17096 () Bool)

(assert (= bs!17096 d!69305))

(assert (=> bs!17096 m!313103))

(declare-fun m!313195 () Bool)

(assert (=> bs!17096 m!313195))

(assert (=> b!202558 d!69305))

(declare-fun d!69307 () Bool)

(declare-fun e!138925 () Bool)

(assert (=> d!69307 e!138925))

(declare-fun res!169731 () Bool)

(assert (=> d!69307 (=> (not res!169731) (not e!138925))))

(assert (=> d!69307 (= res!169731 (invariant!0 (currentBit!9468 (_2!9318 lt!315615)) (currentByte!9473 (_2!9318 lt!315615)) (size!4528 (buf!5033 (_2!9318 lt!315615)))))))

(assert (=> d!69307 (= (readerFrom!0 (_2!9318 lt!315615) (currentBit!9468 thiss!1204) (currentByte!9473 thiss!1204)) (BitStream!8165 (buf!5033 (_2!9318 lt!315615)) (currentByte!9473 thiss!1204) (currentBit!9468 thiss!1204)))))

(declare-fun b!202634 () Bool)

(assert (=> b!202634 (= e!138925 (invariant!0 (currentBit!9468 thiss!1204) (currentByte!9473 thiss!1204) (size!4528 (buf!5033 (_2!9318 lt!315615)))))))

(assert (= (and d!69307 res!169731) b!202634))

(declare-fun m!313197 () Bool)

(assert (=> d!69307 m!313197))

(declare-fun m!313199 () Bool)

(assert (=> b!202634 m!313199))

(assert (=> b!202558 d!69307))

(declare-fun d!69309 () Bool)

(declare-fun e!138934 () Bool)

(assert (=> d!69309 e!138934))

(declare-fun res!169748 () Bool)

(assert (=> d!69309 (=> (not res!169748) (not e!138934))))

(declare-fun lt!315741 () (_ BitVec 64))

(declare-fun lt!315738 () (_ BitVec 64))

(declare-fun lt!315743 () (_ BitVec 64))

(assert (=> d!69309 (= res!169748 (= lt!315743 (bvsub lt!315741 lt!315738)))))

(assert (=> d!69309 (or (= (bvand lt!315741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315738 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315741 lt!315738) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69309 (= lt!315738 (remainingBits!0 ((_ sign_extend 32) (size!4528 (buf!5033 (_1!9317 lt!315614)))) ((_ sign_extend 32) (currentByte!9473 (_1!9317 lt!315614))) ((_ sign_extend 32) (currentBit!9468 (_1!9317 lt!315614)))))))

(declare-fun lt!315740 () (_ BitVec 64))

(declare-fun lt!315742 () (_ BitVec 64))

(assert (=> d!69309 (= lt!315741 (bvmul lt!315740 lt!315742))))

(assert (=> d!69309 (or (= lt!315740 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315742 (bvsdiv (bvmul lt!315740 lt!315742) lt!315740)))))

(assert (=> d!69309 (= lt!315742 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69309 (= lt!315740 ((_ sign_extend 32) (size!4528 (buf!5033 (_1!9317 lt!315614)))))))

(assert (=> d!69309 (= lt!315743 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9473 (_1!9317 lt!315614))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9468 (_1!9317 lt!315614)))))))

(assert (=> d!69309 (invariant!0 (currentBit!9468 (_1!9317 lt!315614)) (currentByte!9473 (_1!9317 lt!315614)) (size!4528 (buf!5033 (_1!9317 lt!315614))))))

(assert (=> d!69309 (= (bitIndex!0 (size!4528 (buf!5033 (_1!9317 lt!315614))) (currentByte!9473 (_1!9317 lt!315614)) (currentBit!9468 (_1!9317 lt!315614))) lt!315743)))

(declare-fun b!202652 () Bool)

(declare-fun res!169749 () Bool)

(assert (=> b!202652 (=> (not res!169749) (not e!138934))))

(assert (=> b!202652 (= res!169749 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315743))))

(declare-fun b!202653 () Bool)

(declare-fun lt!315739 () (_ BitVec 64))

(assert (=> b!202653 (= e!138934 (bvsle lt!315743 (bvmul lt!315739 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202653 (or (= lt!315739 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315739 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315739)))))

(assert (=> b!202653 (= lt!315739 ((_ sign_extend 32) (size!4528 (buf!5033 (_1!9317 lt!315614)))))))

(assert (= (and d!69309 res!169748) b!202652))

(assert (= (and b!202652 res!169749) b!202653))

(declare-fun m!313207 () Bool)

(assert (=> d!69309 m!313207))

(declare-fun m!313211 () Bool)

(assert (=> d!69309 m!313211))

(assert (=> b!202553 d!69309))

(declare-fun d!69315 () Bool)

(assert (=> d!69315 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9468 thiss!1204) (currentByte!9473 thiss!1204) (size!4528 (buf!5033 thiss!1204))))))

(declare-fun bs!17098 () Bool)

(assert (= bs!17098 d!69315))

(assert (=> bs!17098 m!313117))

(assert (=> start!42972 d!69315))

(declare-fun d!69319 () Bool)

(declare-fun res!169765 () Bool)

(declare-fun e!138946 () Bool)

(assert (=> d!69319 (=> (not res!169765) (not e!138946))))

(assert (=> d!69319 (= res!169765 (= (size!4528 (buf!5033 thiss!1204)) (size!4528 (buf!5033 (_2!9318 lt!315618)))))))

(assert (=> d!69319 (= (isPrefixOf!0 thiss!1204 (_2!9318 lt!315618)) e!138946)))

(declare-fun b!202669 () Bool)

(declare-fun res!169767 () Bool)

(assert (=> b!202669 (=> (not res!169767) (not e!138946))))

(assert (=> b!202669 (= res!169767 (bvsle (bitIndex!0 (size!4528 (buf!5033 thiss!1204)) (currentByte!9473 thiss!1204) (currentBit!9468 thiss!1204)) (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!315618))) (currentByte!9473 (_2!9318 lt!315618)) (currentBit!9468 (_2!9318 lt!315618)))))))

(declare-fun b!202670 () Bool)

(declare-fun e!138945 () Bool)

(assert (=> b!202670 (= e!138946 e!138945)))

(declare-fun res!169766 () Bool)

(assert (=> b!202670 (=> res!169766 e!138945)))

(assert (=> b!202670 (= res!169766 (= (size!4528 (buf!5033 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202671 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10289 array!10289 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202671 (= e!138945 (arrayBitRangesEq!0 (buf!5033 thiss!1204) (buf!5033 (_2!9318 lt!315618)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4528 (buf!5033 thiss!1204)) (currentByte!9473 thiss!1204) (currentBit!9468 thiss!1204))))))

(assert (= (and d!69319 res!169765) b!202669))

(assert (= (and b!202669 res!169767) b!202670))

(assert (= (and b!202670 (not res!169766)) b!202671))

(assert (=> b!202669 m!313123))

(declare-fun m!313223 () Bool)

(assert (=> b!202669 m!313223))

(assert (=> b!202671 m!313123))

(assert (=> b!202671 m!313123))

(declare-fun m!313225 () Bool)

(assert (=> b!202671 m!313225))

(assert (=> b!202554 d!69319))

(declare-fun d!69323 () Bool)

(assert (=> d!69323 (isPrefixOf!0 thiss!1204 (_2!9318 lt!315618))))

(declare-fun lt!315752 () Unit!14382)

(declare-fun choose!30 (BitStream!8164 BitStream!8164 BitStream!8164) Unit!14382)

(assert (=> d!69323 (= lt!315752 (choose!30 thiss!1204 (_2!9318 lt!315615) (_2!9318 lt!315618)))))

(assert (=> d!69323 (isPrefixOf!0 thiss!1204 (_2!9318 lt!315615))))

(assert (=> d!69323 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9318 lt!315615) (_2!9318 lt!315618)) lt!315752)))

(declare-fun bs!17100 () Bool)

(assert (= bs!17100 d!69323))

(assert (=> bs!17100 m!313107))

(declare-fun m!313235 () Bool)

(assert (=> bs!17100 m!313235))

(assert (=> bs!17100 m!313119))

(assert (=> b!202554 d!69323))

(declare-fun b!202776 () Bool)

(declare-fun e!139021 () Bool)

(declare-datatypes ((tuple2!17350 0))(
  ( (tuple2!17351 (_1!9327 BitStream!8164) (_2!9327 (_ BitVec 64))) )
))
(declare-fun lt!316061 () tuple2!17350)

(declare-datatypes ((tuple2!17352 0))(
  ( (tuple2!17353 (_1!9328 BitStream!8164) (_2!9328 BitStream!8164)) )
))
(declare-fun lt!316092 () tuple2!17352)

(assert (=> b!202776 (= e!139021 (= (_1!9327 lt!316061) (_2!9328 lt!316092)))))

(declare-fun b!202778 () Bool)

(declare-fun e!139012 () Bool)

(declare-fun lt!316048 () tuple2!17350)

(declare-fun lt!316104 () tuple2!17352)

(assert (=> b!202778 (= e!139012 (= (_1!9327 lt!316048) (_2!9328 lt!316104)))))

(declare-fun b!202779 () Bool)

(declare-fun e!139014 () tuple2!17332)

(declare-fun lt!316028 () tuple2!17332)

(assert (=> b!202779 (= e!139014 (tuple2!17333 (_1!9318 lt!316028) (_2!9318 lt!316028)))))

(declare-fun lt!316130 () Bool)

(assert (=> b!202779 (= lt!316130 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!316070 () tuple2!17332)

(assert (=> b!202779 (= lt!316070 (appendBit!0 (_2!9318 lt!315615) lt!316130))))

(declare-fun res!169859 () Bool)

(assert (=> b!202779 (= res!169859 (= (size!4528 (buf!5033 (_2!9318 lt!315615))) (size!4528 (buf!5033 (_2!9318 lt!316070)))))))

(declare-fun e!139017 () Bool)

(assert (=> b!202779 (=> (not res!169859) (not e!139017))))

(assert (=> b!202779 e!139017))

(declare-fun lt!316087 () tuple2!17332)

(assert (=> b!202779 (= lt!316087 lt!316070)))

(assert (=> b!202779 (= lt!316028 (appendBitsLSBFirstLoopTR!0 (_2!9318 lt!316087) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!316037 () Unit!14382)

(assert (=> b!202779 (= lt!316037 (lemmaIsPrefixTransitive!0 (_2!9318 lt!315615) (_2!9318 lt!316087) (_2!9318 lt!316028)))))

(assert (=> b!202779 (isPrefixOf!0 (_2!9318 lt!315615) (_2!9318 lt!316028))))

(declare-fun lt!316097 () Unit!14382)

(assert (=> b!202779 (= lt!316097 lt!316037)))

(assert (=> b!202779 (invariant!0 (currentBit!9468 (_2!9318 lt!315615)) (currentByte!9473 (_2!9318 lt!315615)) (size!4528 (buf!5033 (_2!9318 lt!316087))))))

(declare-fun lt!316075 () BitStream!8164)

(assert (=> b!202779 (= lt!316075 (BitStream!8165 (buf!5033 (_2!9318 lt!316087)) (currentByte!9473 (_2!9318 lt!315615)) (currentBit!9468 (_2!9318 lt!315615))))))

(assert (=> b!202779 (invariant!0 (currentBit!9468 lt!316075) (currentByte!9473 lt!316075) (size!4528 (buf!5033 (_2!9318 lt!316028))))))

(declare-fun lt!316095 () BitStream!8164)

(assert (=> b!202779 (= lt!316095 (BitStream!8165 (buf!5033 (_2!9318 lt!316028)) (currentByte!9473 lt!316075) (currentBit!9468 lt!316075)))))

(declare-fun lt!316110 () tuple2!17330)

(assert (=> b!202779 (= lt!316110 (readBitPure!0 lt!316075))))

(declare-fun lt!316059 () tuple2!17330)

(assert (=> b!202779 (= lt!316059 (readBitPure!0 lt!316095))))

(declare-fun lt!316086 () Unit!14382)

(declare-fun readBitPrefixLemma!0 (BitStream!8164 BitStream!8164) Unit!14382)

(assert (=> b!202779 (= lt!316086 (readBitPrefixLemma!0 lt!316075 (_2!9318 lt!316028)))))

(declare-fun res!169872 () Bool)

(assert (=> b!202779 (= res!169872 (= (bitIndex!0 (size!4528 (buf!5033 (_1!9317 lt!316110))) (currentByte!9473 (_1!9317 lt!316110)) (currentBit!9468 (_1!9317 lt!316110))) (bitIndex!0 (size!4528 (buf!5033 (_1!9317 lt!316059))) (currentByte!9473 (_1!9317 lt!316059)) (currentBit!9468 (_1!9317 lt!316059)))))))

(declare-fun e!139023 () Bool)

(assert (=> b!202779 (=> (not res!169872) (not e!139023))))

(assert (=> b!202779 e!139023))

(declare-fun lt!316122 () Unit!14382)

(assert (=> b!202779 (= lt!316122 lt!316086)))

(declare-fun lt!316124 () tuple2!17352)

(declare-fun reader!0 (BitStream!8164 BitStream!8164) tuple2!17352)

(assert (=> b!202779 (= lt!316124 (reader!0 (_2!9318 lt!315615) (_2!9318 lt!316028)))))

(declare-fun lt!316044 () tuple2!17352)

(assert (=> b!202779 (= lt!316044 (reader!0 (_2!9318 lt!316087) (_2!9318 lt!316028)))))

(declare-fun lt!316081 () tuple2!17330)

(assert (=> b!202779 (= lt!316081 (readBitPure!0 (_1!9328 lt!316124)))))

(assert (=> b!202779 (= (_2!9317 lt!316081) lt!316130)))

(declare-fun lt!316127 () Unit!14382)

(declare-fun Unit!14390 () Unit!14382)

(assert (=> b!202779 (= lt!316127 Unit!14390)))

(declare-fun lt!316084 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202779 (= lt!316084 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316137 () (_ BitVec 64))

(assert (=> b!202779 (= lt!316137 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316079 () Unit!14382)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8164 array!10289 (_ BitVec 64)) Unit!14382)

(assert (=> b!202779 (= lt!316079 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9318 lt!315615) (buf!5033 (_2!9318 lt!316028)) lt!316137))))

(assert (=> b!202779 (validate_offset_bits!1 ((_ sign_extend 32) (size!4528 (buf!5033 (_2!9318 lt!316028)))) ((_ sign_extend 32) (currentByte!9473 (_2!9318 lt!315615))) ((_ sign_extend 32) (currentBit!9468 (_2!9318 lt!315615))) lt!316137)))

(declare-fun lt!316047 () Unit!14382)

(assert (=> b!202779 (= lt!316047 lt!316079)))

(declare-fun lt!316031 () tuple2!17350)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17350)

(assert (=> b!202779 (= lt!316031 (readNBitsLSBFirstsLoopPure!0 (_1!9328 lt!316124) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316084))))

(declare-fun lt!316068 () (_ BitVec 64))

(assert (=> b!202779 (= lt!316068 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!316035 () Unit!14382)

(assert (=> b!202779 (= lt!316035 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9318 lt!316087) (buf!5033 (_2!9318 lt!316028)) lt!316068))))

(assert (=> b!202779 (validate_offset_bits!1 ((_ sign_extend 32) (size!4528 (buf!5033 (_2!9318 lt!316028)))) ((_ sign_extend 32) (currentByte!9473 (_2!9318 lt!316087))) ((_ sign_extend 32) (currentBit!9468 (_2!9318 lt!316087))) lt!316068)))

(declare-fun lt!316065 () Unit!14382)

(assert (=> b!202779 (= lt!316065 lt!316035)))

(declare-fun lt!316107 () tuple2!17350)

(assert (=> b!202779 (= lt!316107 (readNBitsLSBFirstsLoopPure!0 (_1!9328 lt!316044) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!316084 (ite (_2!9317 lt!316081) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!316038 () tuple2!17350)

(assert (=> b!202779 (= lt!316038 (readNBitsLSBFirstsLoopPure!0 (_1!9328 lt!316124) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316084))))

(declare-fun c!10053 () Bool)

(assert (=> b!202779 (= c!10053 (_2!9317 (readBitPure!0 (_1!9328 lt!316124))))))

(declare-fun lt!316117 () tuple2!17350)

(declare-fun e!139022 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8164 (_ BitVec 64)) BitStream!8164)

(assert (=> b!202779 (= lt!316117 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9328 lt!316124) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!316084 e!139022)))))

(declare-fun lt!316099 () Unit!14382)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14382)

(assert (=> b!202779 (= lt!316099 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9328 lt!316124) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316084))))

(assert (=> b!202779 (and (= (_2!9327 lt!316038) (_2!9327 lt!316117)) (= (_1!9327 lt!316038) (_1!9327 lt!316117)))))

(declare-fun lt!316033 () Unit!14382)

(assert (=> b!202779 (= lt!316033 lt!316099)))

(assert (=> b!202779 (= (_1!9328 lt!316124) (withMovedBitIndex!0 (_2!9328 lt!316124) (bvsub (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!315615))) (currentByte!9473 (_2!9318 lt!315615)) (currentBit!9468 (_2!9318 lt!315615))) (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!316028))) (currentByte!9473 (_2!9318 lt!316028)) (currentBit!9468 (_2!9318 lt!316028))))))))

(declare-fun lt!316118 () Unit!14382)

(declare-fun Unit!14400 () Unit!14382)

(assert (=> b!202779 (= lt!316118 Unit!14400)))

(assert (=> b!202779 (= (_1!9328 lt!316044) (withMovedBitIndex!0 (_2!9328 lt!316044) (bvsub (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!316087))) (currentByte!9473 (_2!9318 lt!316087)) (currentBit!9468 (_2!9318 lt!316087))) (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!316028))) (currentByte!9473 (_2!9318 lt!316028)) (currentBit!9468 (_2!9318 lt!316028))))))))

(declare-fun lt!316042 () Unit!14382)

(declare-fun Unit!14401 () Unit!14382)

(assert (=> b!202779 (= lt!316042 Unit!14401)))

(assert (=> b!202779 (= (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!315615))) (currentByte!9473 (_2!9318 lt!315615)) (currentBit!9468 (_2!9318 lt!315615))) (bvsub (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!316087))) (currentByte!9473 (_2!9318 lt!316087)) (currentBit!9468 (_2!9318 lt!316087))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!316040 () Unit!14382)

(declare-fun Unit!14402 () Unit!14382)

(assert (=> b!202779 (= lt!316040 Unit!14402)))

(assert (=> b!202779 (= (_2!9327 lt!316031) (_2!9327 lt!316107))))

(declare-fun lt!316133 () Unit!14382)

(declare-fun Unit!14403 () Unit!14382)

(assert (=> b!202779 (= lt!316133 Unit!14403)))

(assert (=> b!202779 (invariant!0 (currentBit!9468 (_2!9318 lt!316028)) (currentByte!9473 (_2!9318 lt!316028)) (size!4528 (buf!5033 (_2!9318 lt!316028))))))

(declare-fun lt!316094 () Unit!14382)

(declare-fun Unit!14404 () Unit!14382)

(assert (=> b!202779 (= lt!316094 Unit!14404)))

(assert (=> b!202779 (= (size!4528 (buf!5033 (_2!9318 lt!315615))) (size!4528 (buf!5033 (_2!9318 lt!316028))))))

(declare-fun lt!316030 () Unit!14382)

(declare-fun Unit!14405 () Unit!14382)

(assert (=> b!202779 (= lt!316030 Unit!14405)))

(assert (=> b!202779 (= (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!316028))) (currentByte!9473 (_2!9318 lt!316028)) (currentBit!9468 (_2!9318 lt!316028))) (bvsub (bvadd (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!315615))) (currentByte!9473 (_2!9318 lt!315615)) (currentBit!9468 (_2!9318 lt!315615))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316054 () Unit!14382)

(declare-fun Unit!14406 () Unit!14382)

(assert (=> b!202779 (= lt!316054 Unit!14406)))

(declare-fun lt!316063 () Unit!14382)

(declare-fun Unit!14407 () Unit!14382)

(assert (=> b!202779 (= lt!316063 Unit!14407)))

(assert (=> b!202779 (= lt!316104 (reader!0 (_2!9318 lt!315615) (_2!9318 lt!316028)))))

(declare-fun lt!316058 () (_ BitVec 64))

(assert (=> b!202779 (= lt!316058 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316120 () Unit!14382)

(assert (=> b!202779 (= lt!316120 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9318 lt!315615) (buf!5033 (_2!9318 lt!316028)) lt!316058))))

(assert (=> b!202779 (validate_offset_bits!1 ((_ sign_extend 32) (size!4528 (buf!5033 (_2!9318 lt!316028)))) ((_ sign_extend 32) (currentByte!9473 (_2!9318 lt!315615))) ((_ sign_extend 32) (currentBit!9468 (_2!9318 lt!315615))) lt!316058)))

(declare-fun lt!316135 () Unit!14382)

(assert (=> b!202779 (= lt!316135 lt!316120)))

(assert (=> b!202779 (= lt!316048 (readNBitsLSBFirstsLoopPure!0 (_1!9328 lt!316104) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!169861 () Bool)

(assert (=> b!202779 (= res!169861 (= (_2!9327 lt!316048) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!202779 (=> (not res!169861) (not e!139012))))

(assert (=> b!202779 e!139012))

(declare-fun lt!316066 () Unit!14382)

(declare-fun Unit!14408 () Unit!14382)

(assert (=> b!202779 (= lt!316066 Unit!14408)))

(declare-fun b!202781 () Bool)

(declare-fun e!139019 () Bool)

(assert (=> b!202781 (= e!139019 e!139021)))

(declare-fun res!169874 () Bool)

(assert (=> b!202781 (=> (not res!169874) (not e!139021))))

(assert (=> b!202781 (= res!169874 (= (_2!9327 lt!316061) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!202781 (= lt!316061 (readNBitsLSBFirstsLoopPure!0 (_1!9328 lt!316092) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!316103 () Unit!14382)

(declare-fun lt!316128 () Unit!14382)

(assert (=> b!202781 (= lt!316103 lt!316128)))

(declare-fun lt!316055 () tuple2!17332)

(declare-fun lt!316101 () (_ BitVec 64))

(assert (=> b!202781 (validate_offset_bits!1 ((_ sign_extend 32) (size!4528 (buf!5033 (_2!9318 lt!316055)))) ((_ sign_extend 32) (currentByte!9473 (_2!9318 lt!315615))) ((_ sign_extend 32) (currentBit!9468 (_2!9318 lt!315615))) lt!316101)))

(assert (=> b!202781 (= lt!316128 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9318 lt!315615) (buf!5033 (_2!9318 lt!316055)) lt!316101))))

(declare-fun e!139015 () Bool)

(assert (=> b!202781 e!139015))

(declare-fun res!169857 () Bool)

(assert (=> b!202781 (=> (not res!169857) (not e!139015))))

(assert (=> b!202781 (= res!169857 (and (= (size!4528 (buf!5033 (_2!9318 lt!315615))) (size!4528 (buf!5033 (_2!9318 lt!316055)))) (bvsge lt!316101 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202781 (= lt!316101 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!202781 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!202781 (= lt!316092 (reader!0 (_2!9318 lt!315615) (_2!9318 lt!316055)))))

(declare-fun b!202783 () Bool)

(declare-fun res!169862 () Bool)

(assert (=> b!202783 (=> (not res!169862) (not e!139019))))

(declare-fun lt!316112 () (_ BitVec 64))

(declare-fun lt!316045 () (_ BitVec 64))

(assert (=> b!202783 (= res!169862 (= (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!316055))) (currentByte!9473 (_2!9318 lt!316055)) (currentBit!9468 (_2!9318 lt!316055))) (bvsub lt!316112 lt!316045)))))

(assert (=> b!202783 (or (= (bvand lt!316112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316045 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316112 lt!316045) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202783 (= lt!316045 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!316080 () (_ BitVec 64))

(declare-fun lt!316072 () (_ BitVec 64))

(assert (=> b!202783 (= lt!316112 (bvadd lt!316080 lt!316072))))

(assert (=> b!202783 (or (not (= (bvand lt!316080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316072 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!316080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!316080 lt!316072) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202783 (= lt!316072 ((_ sign_extend 32) nBits!348))))

(assert (=> b!202783 (= lt!316080 (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!315615))) (currentByte!9473 (_2!9318 lt!315615)) (currentBit!9468 (_2!9318 lt!315615))))))

(declare-fun b!202785 () Bool)

(assert (=> b!202785 (= e!139022 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!202787 () Bool)

(declare-fun res!169870 () Bool)

(assert (=> b!202787 (=> (not res!169870) (not e!139019))))

(assert (=> b!202787 (= res!169870 (= (size!4528 (buf!5033 (_2!9318 lt!315615))) (size!4528 (buf!5033 (_2!9318 lt!316055)))))))

(declare-fun b!202789 () Bool)

(assert (=> b!202789 (= e!139023 (= (_2!9317 lt!316110) (_2!9317 lt!316059)))))

(declare-fun b!202791 () Bool)

(assert (=> b!202791 (= e!139022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!202793 () Bool)

(declare-fun Unit!14409 () Unit!14382)

(assert (=> b!202793 (= e!139014 (tuple2!17333 Unit!14409 (_2!9318 lt!315615)))))

(declare-fun lt!316051 () Unit!14382)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8164) Unit!14382)

(assert (=> b!202793 (= lt!316051 (lemmaIsPrefixRefl!0 (_2!9318 lt!315615)))))

(declare-fun call!3194 () Bool)

(assert (=> b!202793 call!3194))

(declare-fun lt!316131 () Unit!14382)

(assert (=> b!202793 (= lt!316131 lt!316051)))

(declare-fun b!202795 () Bool)

(assert (=> b!202795 (= e!139015 (validate_offset_bits!1 ((_ sign_extend 32) (size!4528 (buf!5033 (_2!9318 lt!315615)))) ((_ sign_extend 32) (currentByte!9473 (_2!9318 lt!315615))) ((_ sign_extend 32) (currentBit!9468 (_2!9318 lt!315615))) lt!316101))))

(declare-fun b!202797 () Bool)

(declare-fun res!169866 () Bool)

(assert (=> b!202797 (= res!169866 (= (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!316070))) (currentByte!9473 (_2!9318 lt!316070)) (currentBit!9468 (_2!9318 lt!316070))) (bvadd (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!315615))) (currentByte!9473 (_2!9318 lt!315615)) (currentBit!9468 (_2!9318 lt!315615))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!202797 (=> (not res!169866) (not e!139017))))

(declare-fun b!202799 () Bool)

(declare-fun res!169873 () Bool)

(assert (=> b!202799 (= res!169873 call!3194)))

(assert (=> b!202799 (=> (not res!169873) (not e!139017))))

(declare-fun bm!3192 () Bool)

(declare-fun c!10055 () Bool)

(assert (=> bm!3192 (= call!3194 (isPrefixOf!0 (_2!9318 lt!315615) (ite c!10055 (_2!9318 lt!315615) (_2!9318 lt!316070))))))

(declare-fun b!202802 () Bool)

(declare-fun lt!316077 () tuple2!17330)

(assert (=> b!202802 (= lt!316077 (readBitPure!0 (readerFrom!0 (_2!9318 lt!316070) (currentBit!9468 (_2!9318 lt!315615)) (currentByte!9473 (_2!9318 lt!315615)))))))

(declare-fun res!169858 () Bool)

(assert (=> b!202802 (= res!169858 (and (= (_2!9317 lt!316077) lt!316130) (= (_1!9317 lt!316077) (_2!9318 lt!316070))))))

(declare-fun e!139018 () Bool)

(assert (=> b!202802 (=> (not res!169858) (not e!139018))))

(assert (=> b!202802 (= e!139017 e!139018)))

(declare-fun b!202804 () Bool)

(assert (=> b!202804 (= e!139018 (= (bitIndex!0 (size!4528 (buf!5033 (_1!9317 lt!316077))) (currentByte!9473 (_1!9317 lt!316077)) (currentBit!9468 (_1!9317 lt!316077))) (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!316070))) (currentByte!9473 (_2!9318 lt!316070)) (currentBit!9468 (_2!9318 lt!316070)))))))

(declare-fun b!202806 () Bool)

(declare-fun res!169863 () Bool)

(assert (=> b!202806 (=> (not res!169863) (not e!139019))))

(assert (=> b!202806 (= res!169863 (isPrefixOf!0 (_2!9318 lt!315615) (_2!9318 lt!316055)))))

(declare-fun d!69331 () Bool)

(assert (=> d!69331 e!139019))

(declare-fun res!169867 () Bool)

(assert (=> d!69331 (=> (not res!169867) (not e!139019))))

(assert (=> d!69331 (= res!169867 (invariant!0 (currentBit!9468 (_2!9318 lt!316055)) (currentByte!9473 (_2!9318 lt!316055)) (size!4528 (buf!5033 (_2!9318 lt!316055)))))))

(assert (=> d!69331 (= lt!316055 e!139014)))

(assert (=> d!69331 (= c!10055 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69331 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69331 (= (appendBitsLSBFirstLoopTR!0 (_2!9318 lt!315615) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!316055)))

(assert (= (and d!69331 c!10055) b!202793))

(assert (= (and d!69331 (not c!10055)) b!202779))

(assert (= (and b!202779 res!169859) b!202797))

(assert (= (and b!202797 res!169866) b!202799))

(assert (= (and b!202799 res!169873) b!202802))

(assert (= (and b!202802 res!169858) b!202804))

(assert (= (and b!202779 res!169872) b!202789))

(assert (= (and b!202779 c!10053) b!202785))

(assert (= (and b!202779 (not c!10053)) b!202791))

(assert (= (and b!202779 res!169861) b!202778))

(assert (= (or b!202793 b!202799) bm!3192))

(assert (= (and d!69331 res!169867) b!202787))

(assert (= (and b!202787 res!169870) b!202783))

(assert (= (and b!202783 res!169862) b!202806))

(assert (= (and b!202806 res!169863) b!202781))

(assert (= (and b!202781 res!169857) b!202795))

(assert (= (and b!202781 res!169874) b!202776))

(declare-fun m!313271 () Bool)

(assert (=> b!202793 m!313271))

(declare-fun m!313277 () Bool)

(assert (=> b!202804 m!313277))

(declare-fun m!313281 () Bool)

(assert (=> b!202804 m!313281))

(declare-fun m!313285 () Bool)

(assert (=> bm!3192 m!313285))

(declare-fun m!313287 () Bool)

(assert (=> b!202806 m!313287))

(declare-fun m!313295 () Bool)

(assert (=> d!69331 m!313295))

(declare-fun m!313299 () Bool)

(assert (=> b!202802 m!313299))

(assert (=> b!202802 m!313299))

(declare-fun m!313303 () Bool)

(assert (=> b!202802 m!313303))

(assert (=> b!202797 m!313281))

(assert (=> b!202797 m!313121))

(declare-fun m!313311 () Bool)

(assert (=> b!202779 m!313311))

(declare-fun m!313313 () Bool)

(assert (=> b!202779 m!313313))

(declare-fun m!313317 () Bool)

(assert (=> b!202779 m!313317))

(declare-fun m!313321 () Bool)

(assert (=> b!202779 m!313321))

(declare-fun m!313327 () Bool)

(assert (=> b!202779 m!313327))

(declare-fun m!313331 () Bool)

(assert (=> b!202779 m!313331))

(declare-fun m!313333 () Bool)

(assert (=> b!202779 m!313333))

(declare-fun m!313339 () Bool)

(assert (=> b!202779 m!313339))

(declare-fun m!313341 () Bool)

(assert (=> b!202779 m!313341))

(declare-fun m!313349 () Bool)

(assert (=> b!202779 m!313349))

(declare-fun m!313353 () Bool)

(assert (=> b!202779 m!313353))

(declare-fun m!313357 () Bool)

(assert (=> b!202779 m!313357))

(declare-fun m!313361 () Bool)

(assert (=> b!202779 m!313361))

(declare-fun m!313363 () Bool)

(assert (=> b!202779 m!313363))

(declare-fun m!313365 () Bool)

(assert (=> b!202779 m!313365))

(declare-fun m!313371 () Bool)

(assert (=> b!202779 m!313371))

(declare-fun m!313373 () Bool)

(assert (=> b!202779 m!313373))

(declare-fun m!313375 () Bool)

(assert (=> b!202779 m!313375))

(assert (=> b!202779 m!313339))

(declare-fun m!313381 () Bool)

(assert (=> b!202779 m!313381))

(declare-fun m!313385 () Bool)

(assert (=> b!202779 m!313385))

(declare-fun m!313389 () Bool)

(assert (=> b!202779 m!313389))

(declare-fun m!313395 () Bool)

(assert (=> b!202779 m!313395))

(declare-fun m!313399 () Bool)

(assert (=> b!202779 m!313399))

(declare-fun m!313403 () Bool)

(assert (=> b!202779 m!313403))

(declare-fun m!313405 () Bool)

(assert (=> b!202779 m!313405))

(assert (=> b!202779 m!313121))

(declare-fun m!313407 () Bool)

(assert (=> b!202779 m!313407))

(declare-fun m!313411 () Bool)

(assert (=> b!202779 m!313411))

(declare-fun m!313415 () Bool)

(assert (=> b!202779 m!313415))

(declare-fun m!313419 () Bool)

(assert (=> b!202779 m!313419))

(declare-fun m!313421 () Bool)

(assert (=> b!202779 m!313421))

(declare-fun m!313425 () Bool)

(assert (=> b!202779 m!313425))

(declare-fun m!313429 () Bool)

(assert (=> b!202779 m!313429))

(declare-fun m!313431 () Bool)

(assert (=> b!202779 m!313431))

(declare-fun m!313435 () Bool)

(assert (=> b!202783 m!313435))

(assert (=> b!202783 m!313121))

(assert (=> b!202781 m!313375))

(declare-fun m!313439 () Bool)

(assert (=> b!202781 m!313439))

(declare-fun m!313443 () Bool)

(assert (=> b!202781 m!313443))

(declare-fun m!313445 () Bool)

(assert (=> b!202781 m!313445))

(assert (=> b!202781 m!313407))

(declare-fun m!313453 () Bool)

(assert (=> b!202781 m!313453))

(declare-fun m!313457 () Bool)

(assert (=> b!202795 m!313457))

(assert (=> b!202554 d!69331))

(declare-fun d!69357 () Bool)

(assert (=> d!69357 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4528 (buf!5033 thiss!1204))) ((_ sign_extend 32) (currentByte!9473 thiss!1204)) ((_ sign_extend 32) (currentBit!9468 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4528 (buf!5033 thiss!1204))) ((_ sign_extend 32) (currentByte!9473 thiss!1204)) ((_ sign_extend 32) (currentBit!9468 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17105 () Bool)

(assert (= bs!17105 d!69357))

(declare-fun m!313459 () Bool)

(assert (=> bs!17105 m!313459))

(assert (=> b!202560 d!69357))

(declare-fun d!69359 () Bool)

(declare-fun e!139024 () Bool)

(assert (=> d!69359 e!139024))

(declare-fun res!169880 () Bool)

(assert (=> d!69359 (=> (not res!169880) (not e!139024))))

(declare-fun lt!316140 () (_ BitVec 64))

(declare-fun lt!316143 () (_ BitVec 64))

(declare-fun lt!316145 () (_ BitVec 64))

(assert (=> d!69359 (= res!169880 (= lt!316145 (bvsub lt!316143 lt!316140)))))

(assert (=> d!69359 (or (= (bvand lt!316143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316143 lt!316140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69359 (= lt!316140 (remainingBits!0 ((_ sign_extend 32) (size!4528 (buf!5033 (_2!9318 lt!315615)))) ((_ sign_extend 32) (currentByte!9473 (_2!9318 lt!315615))) ((_ sign_extend 32) (currentBit!9468 (_2!9318 lt!315615)))))))

(declare-fun lt!316142 () (_ BitVec 64))

(declare-fun lt!316144 () (_ BitVec 64))

(assert (=> d!69359 (= lt!316143 (bvmul lt!316142 lt!316144))))

(assert (=> d!69359 (or (= lt!316142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316144 (bvsdiv (bvmul lt!316142 lt!316144) lt!316142)))))

(assert (=> d!69359 (= lt!316144 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69359 (= lt!316142 ((_ sign_extend 32) (size!4528 (buf!5033 (_2!9318 lt!315615)))))))

(assert (=> d!69359 (= lt!316145 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9473 (_2!9318 lt!315615))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9468 (_2!9318 lt!315615)))))))

(assert (=> d!69359 (invariant!0 (currentBit!9468 (_2!9318 lt!315615)) (currentByte!9473 (_2!9318 lt!315615)) (size!4528 (buf!5033 (_2!9318 lt!315615))))))

(assert (=> d!69359 (= (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!315615))) (currentByte!9473 (_2!9318 lt!315615)) (currentBit!9468 (_2!9318 lt!315615))) lt!316145)))

(declare-fun b!202808 () Bool)

(declare-fun res!169881 () Bool)

(assert (=> b!202808 (=> (not res!169881) (not e!139024))))

(assert (=> b!202808 (= res!169881 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316145))))

(declare-fun b!202809 () Bool)

(declare-fun lt!316141 () (_ BitVec 64))

(assert (=> b!202809 (= e!139024 (bvsle lt!316145 (bvmul lt!316141 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202809 (or (= lt!316141 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316141 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316141)))))

(assert (=> b!202809 (= lt!316141 ((_ sign_extend 32) (size!4528 (buf!5033 (_2!9318 lt!315615)))))))

(assert (= (and d!69359 res!169880) b!202808))

(assert (= (and b!202808 res!169881) b!202809))

(declare-fun m!313461 () Bool)

(assert (=> d!69359 m!313461))

(assert (=> d!69359 m!313197))

(assert (=> b!202555 d!69359))

(declare-fun d!69361 () Bool)

(declare-fun e!139025 () Bool)

(assert (=> d!69361 e!139025))

(declare-fun res!169882 () Bool)

(assert (=> d!69361 (=> (not res!169882) (not e!139025))))

(declare-fun lt!316149 () (_ BitVec 64))

(declare-fun lt!316146 () (_ BitVec 64))

(declare-fun lt!316151 () (_ BitVec 64))

(assert (=> d!69361 (= res!169882 (= lt!316151 (bvsub lt!316149 lt!316146)))))

(assert (=> d!69361 (or (= (bvand lt!316149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316146 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316149 lt!316146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69361 (= lt!316146 (remainingBits!0 ((_ sign_extend 32) (size!4528 (buf!5033 thiss!1204))) ((_ sign_extend 32) (currentByte!9473 thiss!1204)) ((_ sign_extend 32) (currentBit!9468 thiss!1204))))))

(declare-fun lt!316148 () (_ BitVec 64))

(declare-fun lt!316150 () (_ BitVec 64))

(assert (=> d!69361 (= lt!316149 (bvmul lt!316148 lt!316150))))

(assert (=> d!69361 (or (= lt!316148 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316150 (bvsdiv (bvmul lt!316148 lt!316150) lt!316148)))))

(assert (=> d!69361 (= lt!316150 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69361 (= lt!316148 ((_ sign_extend 32) (size!4528 (buf!5033 thiss!1204))))))

(assert (=> d!69361 (= lt!316151 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9473 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9468 thiss!1204))))))

(assert (=> d!69361 (invariant!0 (currentBit!9468 thiss!1204) (currentByte!9473 thiss!1204) (size!4528 (buf!5033 thiss!1204)))))

(assert (=> d!69361 (= (bitIndex!0 (size!4528 (buf!5033 thiss!1204)) (currentByte!9473 thiss!1204) (currentBit!9468 thiss!1204)) lt!316151)))

(declare-fun b!202810 () Bool)

(declare-fun res!169883 () Bool)

(assert (=> b!202810 (=> (not res!169883) (not e!139025))))

(assert (=> b!202810 (= res!169883 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316151))))

(declare-fun b!202811 () Bool)

(declare-fun lt!316147 () (_ BitVec 64))

(assert (=> b!202811 (= e!139025 (bvsle lt!316151 (bvmul lt!316147 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202811 (or (= lt!316147 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316147 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316147)))))

(assert (=> b!202811 (= lt!316147 ((_ sign_extend 32) (size!4528 (buf!5033 thiss!1204))))))

(assert (= (and d!69361 res!169882) b!202810))

(assert (= (and b!202810 res!169883) b!202811))

(assert (=> d!69361 m!313459))

(assert (=> d!69361 m!313117))

(assert (=> b!202555 d!69361))

(assert (=> b!202556 d!69359))

(assert (=> b!202556 d!69361))

(declare-fun d!69363 () Bool)

(declare-fun e!139031 () Bool)

(assert (=> d!69363 e!139031))

(declare-fun res!169894 () Bool)

(assert (=> d!69363 (=> (not res!169894) (not e!139031))))

(declare-fun lt!316161 () tuple2!17332)

(assert (=> d!69363 (= res!169894 (= (size!4528 (buf!5033 thiss!1204)) (size!4528 (buf!5033 (_2!9318 lt!316161)))))))

(declare-fun choose!16 (BitStream!8164 Bool) tuple2!17332)

(assert (=> d!69363 (= lt!316161 (choose!16 thiss!1204 lt!315617))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69363 (validate_offset_bit!0 ((_ sign_extend 32) (size!4528 (buf!5033 thiss!1204))) ((_ sign_extend 32) (currentByte!9473 thiss!1204)) ((_ sign_extend 32) (currentBit!9468 thiss!1204)))))

(assert (=> d!69363 (= (appendBit!0 thiss!1204 lt!315617) lt!316161)))

(declare-fun b!202822 () Bool)

(declare-fun res!169892 () Bool)

(assert (=> b!202822 (=> (not res!169892) (not e!139031))))

(assert (=> b!202822 (= res!169892 (isPrefixOf!0 thiss!1204 (_2!9318 lt!316161)))))

(declare-fun b!202823 () Bool)

(declare-fun e!139030 () Bool)

(assert (=> b!202823 (= e!139031 e!139030)))

(declare-fun res!169895 () Bool)

(assert (=> b!202823 (=> (not res!169895) (not e!139030))))

(declare-fun lt!316163 () tuple2!17330)

(assert (=> b!202823 (= res!169895 (and (= (_2!9317 lt!316163) lt!315617) (= (_1!9317 lt!316163) (_2!9318 lt!316161))))))

(assert (=> b!202823 (= lt!316163 (readBitPure!0 (readerFrom!0 (_2!9318 lt!316161) (currentBit!9468 thiss!1204) (currentByte!9473 thiss!1204))))))

(declare-fun b!202821 () Bool)

(declare-fun res!169893 () Bool)

(assert (=> b!202821 (=> (not res!169893) (not e!139031))))

(declare-fun lt!316160 () (_ BitVec 64))

(declare-fun lt!316162 () (_ BitVec 64))

(assert (=> b!202821 (= res!169893 (= (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!316161))) (currentByte!9473 (_2!9318 lt!316161)) (currentBit!9468 (_2!9318 lt!316161))) (bvadd lt!316160 lt!316162)))))

(assert (=> b!202821 (or (not (= (bvand lt!316160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316162 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!316160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!316160 lt!316162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202821 (= lt!316162 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!202821 (= lt!316160 (bitIndex!0 (size!4528 (buf!5033 thiss!1204)) (currentByte!9473 thiss!1204) (currentBit!9468 thiss!1204)))))

(declare-fun b!202824 () Bool)

(assert (=> b!202824 (= e!139030 (= (bitIndex!0 (size!4528 (buf!5033 (_1!9317 lt!316163))) (currentByte!9473 (_1!9317 lt!316163)) (currentBit!9468 (_1!9317 lt!316163))) (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!316161))) (currentByte!9473 (_2!9318 lt!316161)) (currentBit!9468 (_2!9318 lt!316161)))))))

(assert (= (and d!69363 res!169894) b!202821))

(assert (= (and b!202821 res!169893) b!202822))

(assert (= (and b!202822 res!169892) b!202823))

(assert (= (and b!202823 res!169895) b!202824))

(declare-fun m!313463 () Bool)

(assert (=> b!202821 m!313463))

(assert (=> b!202821 m!313123))

(declare-fun m!313465 () Bool)

(assert (=> d!69363 m!313465))

(declare-fun m!313467 () Bool)

(assert (=> d!69363 m!313467))

(declare-fun m!313469 () Bool)

(assert (=> b!202822 m!313469))

(declare-fun m!313471 () Bool)

(assert (=> b!202823 m!313471))

(assert (=> b!202823 m!313471))

(declare-fun m!313473 () Bool)

(assert (=> b!202823 m!313473))

(declare-fun m!313475 () Bool)

(assert (=> b!202824 m!313475))

(assert (=> b!202824 m!313463))

(assert (=> b!202556 d!69363))

(declare-fun d!69365 () Bool)

(declare-fun res!169896 () Bool)

(declare-fun e!139033 () Bool)

(assert (=> d!69365 (=> (not res!169896) (not e!139033))))

(assert (=> d!69365 (= res!169896 (= (size!4528 (buf!5033 thiss!1204)) (size!4528 (buf!5033 (_2!9318 lt!315615)))))))

(assert (=> d!69365 (= (isPrefixOf!0 thiss!1204 (_2!9318 lt!315615)) e!139033)))

(declare-fun b!202825 () Bool)

(declare-fun res!169898 () Bool)

(assert (=> b!202825 (=> (not res!169898) (not e!139033))))

(assert (=> b!202825 (= res!169898 (bvsle (bitIndex!0 (size!4528 (buf!5033 thiss!1204)) (currentByte!9473 thiss!1204) (currentBit!9468 thiss!1204)) (bitIndex!0 (size!4528 (buf!5033 (_2!9318 lt!315615))) (currentByte!9473 (_2!9318 lt!315615)) (currentBit!9468 (_2!9318 lt!315615)))))))

(declare-fun b!202826 () Bool)

(declare-fun e!139032 () Bool)

(assert (=> b!202826 (= e!139033 e!139032)))

(declare-fun res!169897 () Bool)

(assert (=> b!202826 (=> res!169897 e!139032)))

(assert (=> b!202826 (= res!169897 (= (size!4528 (buf!5033 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202827 () Bool)

(assert (=> b!202827 (= e!139032 (arrayBitRangesEq!0 (buf!5033 thiss!1204) (buf!5033 (_2!9318 lt!315615)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4528 (buf!5033 thiss!1204)) (currentByte!9473 thiss!1204) (currentBit!9468 thiss!1204))))))

(assert (= (and d!69365 res!169896) b!202825))

(assert (= (and b!202825 res!169898) b!202826))

(assert (= (and b!202826 (not res!169897)) b!202827))

(assert (=> b!202825 m!313123))

(assert (=> b!202825 m!313121))

(assert (=> b!202827 m!313123))

(assert (=> b!202827 m!313123))

(declare-fun m!313477 () Bool)

(assert (=> b!202827 m!313477))

(assert (=> b!202551 d!69365))

(declare-fun d!69367 () Bool)

(assert (=> d!69367 (= (array_inv!4269 (buf!5033 thiss!1204)) (bvsge (size!4528 (buf!5033 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!202557 d!69367))

(declare-fun d!69369 () Bool)

(assert (=> d!69369 (= (invariant!0 (currentBit!9468 thiss!1204) (currentByte!9473 thiss!1204) (size!4528 (buf!5033 thiss!1204))) (and (bvsge (currentBit!9468 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9468 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9473 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9473 thiss!1204) (size!4528 (buf!5033 thiss!1204))) (and (= (currentBit!9468 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9473 thiss!1204) (size!4528 (buf!5033 thiss!1204)))))))))

(assert (=> b!202552 d!69369))

(push 1)

(assert (not b!202634))

(assert (not b!202669))

(assert (not d!69315))

(assert (not b!202793))

(assert (not d!69307))

(assert (not b!202822))

(assert (not b!202671))

(assert (not b!202795))

(assert (not b!202806))

(assert (not b!202821))

(assert (not d!69305))

(assert (not b!202783))

(assert (not b!202802))

(assert (not d!69309))

(assert (not b!202781))

(assert (not d!69359))

(assert (not d!69331))

(assert (not b!202823))

(assert (not d!69361))

(assert (not d!69363))

(assert (not d!69357))

(assert (not b!202804))

(assert (not b!202825))

(assert (not b!202779))

(assert (not b!202827))

(assert (not b!202797))

(assert (not b!202824))

(assert (not bm!3192))

(assert (not d!69323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

