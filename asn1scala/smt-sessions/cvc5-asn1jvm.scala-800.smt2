; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23210 () Bool)

(assert start!23210)

(declare-fun b!117695 () Bool)

(declare-fun e!77131 () Bool)

(declare-datatypes ((array!5288 0))(
  ( (array!5289 (arr!2991 (Array (_ BitVec 32) (_ BitVec 8))) (size!2398 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4270 0))(
  ( (BitStream!4271 (buf!2814 array!5288) (currentByte!5463 (_ BitVec 32)) (currentBit!5458 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4270)

(declare-datatypes ((Unit!7243 0))(
  ( (Unit!7244) )
))
(declare-datatypes ((tuple2!9808 0))(
  ( (tuple2!9809 (_1!5169 Unit!7243) (_2!5169 BitStream!4270)) )
))
(declare-fun lt!180593 () tuple2!9808)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117695 (= e!77131 (invariant!0 (currentBit!5458 thiss!1305) (currentByte!5463 thiss!1305) (size!2398 (buf!2814 (_2!5169 lt!180593)))))))

(declare-fun b!117696 () Bool)

(declare-fun res!97364 () Bool)

(declare-fun e!77130 () Bool)

(assert (=> b!117696 (=> (not res!97364) (not e!77130))))

(declare-fun lt!180588 () tuple2!9808)

(declare-fun isPrefixOf!0 (BitStream!4270 BitStream!4270) Bool)

(assert (=> b!117696 (= res!97364 (isPrefixOf!0 thiss!1305 (_2!5169 lt!180588)))))

(declare-fun b!117697 () Bool)

(declare-fun e!77132 () Bool)

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!117697 (= e!77132 (not (or (not (= (bvand i!615 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!615 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)))))))

(declare-fun lt!180589 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117697 (validate_offset_bits!1 ((_ sign_extend 32) (size!2398 (buf!2814 (_2!5169 lt!180593)))) ((_ sign_extend 32) (currentByte!5463 (_2!5169 lt!180588))) ((_ sign_extend 32) (currentBit!5458 (_2!5169 lt!180588))) lt!180589)))

(declare-fun lt!180595 () Unit!7243)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4270 array!5288 (_ BitVec 64)) Unit!7243)

(assert (=> b!117697 (= lt!180595 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5169 lt!180588) (buf!2814 (_2!5169 lt!180593)) lt!180589))))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!117697 (= lt!180589 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9810 0))(
  ( (tuple2!9811 (_1!5170 BitStream!4270) (_2!5170 (_ BitVec 64))) )
))
(declare-fun lt!180590 () tuple2!9810)

(declare-datatypes ((tuple2!9812 0))(
  ( (tuple2!9813 (_1!5171 BitStream!4270) (_2!5171 BitStream!4270)) )
))
(declare-fun lt!180582 () tuple2!9812)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9810)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117697 (= lt!180590 (readNLeastSignificantBitsLoopPure!0 (_1!5171 lt!180582) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!180585 () (_ BitVec 64))

(assert (=> b!117697 (validate_offset_bits!1 ((_ sign_extend 32) (size!2398 (buf!2814 (_2!5169 lt!180593)))) ((_ sign_extend 32) (currentByte!5463 thiss!1305)) ((_ sign_extend 32) (currentBit!5458 thiss!1305)) lt!180585)))

(declare-fun lt!180587 () Unit!7243)

(assert (=> b!117697 (= lt!180587 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2814 (_2!5169 lt!180593)) lt!180585))))

(declare-fun lt!180594 () Bool)

(declare-datatypes ((tuple2!9814 0))(
  ( (tuple2!9815 (_1!5172 BitStream!4270) (_2!5172 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4270) tuple2!9814)

(assert (=> b!117697 (= (_2!5172 (readBitPure!0 (_1!5171 lt!180582))) lt!180594)))

(declare-fun lt!180584 () tuple2!9812)

(declare-fun reader!0 (BitStream!4270 BitStream!4270) tuple2!9812)

(assert (=> b!117697 (= lt!180584 (reader!0 (_2!5169 lt!180588) (_2!5169 lt!180593)))))

(assert (=> b!117697 (= lt!180582 (reader!0 thiss!1305 (_2!5169 lt!180593)))))

(declare-fun e!77136 () Bool)

(assert (=> b!117697 e!77136))

(declare-fun res!97363 () Bool)

(assert (=> b!117697 (=> (not res!97363) (not e!77136))))

(declare-fun lt!180597 () tuple2!9814)

(declare-fun lt!180581 () tuple2!9814)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117697 (= res!97363 (= (bitIndex!0 (size!2398 (buf!2814 (_1!5172 lt!180597))) (currentByte!5463 (_1!5172 lt!180597)) (currentBit!5458 (_1!5172 lt!180597))) (bitIndex!0 (size!2398 (buf!2814 (_1!5172 lt!180581))) (currentByte!5463 (_1!5172 lt!180581)) (currentBit!5458 (_1!5172 lt!180581)))))))

(declare-fun lt!180583 () Unit!7243)

(declare-fun lt!180596 () BitStream!4270)

(declare-fun readBitPrefixLemma!0 (BitStream!4270 BitStream!4270) Unit!7243)

(assert (=> b!117697 (= lt!180583 (readBitPrefixLemma!0 lt!180596 (_2!5169 lt!180593)))))

(assert (=> b!117697 (= lt!180581 (readBitPure!0 (BitStream!4271 (buf!2814 (_2!5169 lt!180593)) (currentByte!5463 thiss!1305) (currentBit!5458 thiss!1305))))))

(assert (=> b!117697 (= lt!180597 (readBitPure!0 lt!180596))))

(assert (=> b!117697 (= lt!180596 (BitStream!4271 (buf!2814 (_2!5169 lt!180588)) (currentByte!5463 thiss!1305) (currentBit!5458 thiss!1305)))))

(assert (=> b!117697 e!77131))

(declare-fun res!97356 () Bool)

(assert (=> b!117697 (=> (not res!97356) (not e!77131))))

(assert (=> b!117697 (= res!97356 (isPrefixOf!0 thiss!1305 (_2!5169 lt!180593)))))

(declare-fun lt!180586 () Unit!7243)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4270 BitStream!4270 BitStream!4270) Unit!7243)

(assert (=> b!117697 (= lt!180586 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5169 lt!180588) (_2!5169 lt!180593)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4270 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9808)

(assert (=> b!117697 (= lt!180593 (appendNLeastSignificantBitsLoop!0 (_2!5169 lt!180588) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!77135 () Bool)

(assert (=> b!117697 e!77135))

(declare-fun res!97359 () Bool)

(assert (=> b!117697 (=> (not res!97359) (not e!77135))))

(assert (=> b!117697 (= res!97359 (= (size!2398 (buf!2814 thiss!1305)) (size!2398 (buf!2814 (_2!5169 lt!180588)))))))

(declare-fun appendBit!0 (BitStream!4270 Bool) tuple2!9808)

(assert (=> b!117697 (= lt!180588 (appendBit!0 thiss!1305 lt!180594))))

(assert (=> b!117697 (= lt!180594 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!117698 () Bool)

(declare-fun res!97355 () Bool)

(assert (=> b!117698 (=> (not res!97355) (not e!77132))))

(assert (=> b!117698 (= res!97355 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117699 () Bool)

(assert (=> b!117699 (= e!77136 (= (_2!5172 lt!180597) (_2!5172 lt!180581)))))

(declare-fun b!117700 () Bool)

(assert (=> b!117700 (= e!77135 e!77130)))

(declare-fun res!97365 () Bool)

(assert (=> b!117700 (=> (not res!97365) (not e!77130))))

(declare-fun lt!180580 () (_ BitVec 64))

(declare-fun lt!180591 () (_ BitVec 64))

(assert (=> b!117700 (= res!97365 (= lt!180580 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!180591)))))

(assert (=> b!117700 (= lt!180580 (bitIndex!0 (size!2398 (buf!2814 (_2!5169 lt!180588))) (currentByte!5463 (_2!5169 lt!180588)) (currentBit!5458 (_2!5169 lt!180588))))))

(assert (=> b!117700 (= lt!180591 (bitIndex!0 (size!2398 (buf!2814 thiss!1305)) (currentByte!5463 thiss!1305) (currentBit!5458 thiss!1305)))))

(declare-fun res!97360 () Bool)

(declare-fun e!77129 () Bool)

(assert (=> start!23210 (=> (not res!97360) (not e!77129))))

(assert (=> start!23210 (= res!97360 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23210 e!77129))

(assert (=> start!23210 true))

(declare-fun e!77128 () Bool)

(declare-fun inv!12 (BitStream!4270) Bool)

(assert (=> start!23210 (and (inv!12 thiss!1305) e!77128)))

(declare-fun b!117701 () Bool)

(declare-fun e!77134 () Bool)

(declare-fun lt!180592 () tuple2!9814)

(assert (=> b!117701 (= e!77134 (= (bitIndex!0 (size!2398 (buf!2814 (_1!5172 lt!180592))) (currentByte!5463 (_1!5172 lt!180592)) (currentBit!5458 (_1!5172 lt!180592))) lt!180580))))

(declare-fun b!117702 () Bool)

(assert (=> b!117702 (= e!77130 e!77134)))

(declare-fun res!97362 () Bool)

(assert (=> b!117702 (=> (not res!97362) (not e!77134))))

(assert (=> b!117702 (= res!97362 (and (= (_2!5172 lt!180592) lt!180594) (= (_1!5172 lt!180592) (_2!5169 lt!180588))))))

(declare-fun readerFrom!0 (BitStream!4270 (_ BitVec 32) (_ BitVec 32)) BitStream!4270)

(assert (=> b!117702 (= lt!180592 (readBitPure!0 (readerFrom!0 (_2!5169 lt!180588) (currentBit!5458 thiss!1305) (currentByte!5463 thiss!1305))))))

(declare-fun b!117703 () Bool)

(declare-fun res!97357 () Bool)

(assert (=> b!117703 (=> (not res!97357) (not e!77131))))

(assert (=> b!117703 (= res!97357 (invariant!0 (currentBit!5458 thiss!1305) (currentByte!5463 thiss!1305) (size!2398 (buf!2814 (_2!5169 lt!180588)))))))

(declare-fun b!117704 () Bool)

(declare-fun res!97358 () Bool)

(assert (=> b!117704 (=> (not res!97358) (not e!77132))))

(assert (=> b!117704 (= res!97358 (bvslt i!615 nBits!396))))

(declare-fun b!117705 () Bool)

(declare-fun array_inv!2200 (array!5288) Bool)

(assert (=> b!117705 (= e!77128 (array_inv!2200 (buf!2814 thiss!1305)))))

(declare-fun b!117706 () Bool)

(assert (=> b!117706 (= e!77129 e!77132)))

(declare-fun res!97361 () Bool)

(assert (=> b!117706 (=> (not res!97361) (not e!77132))))

(assert (=> b!117706 (= res!97361 (validate_offset_bits!1 ((_ sign_extend 32) (size!2398 (buf!2814 thiss!1305))) ((_ sign_extend 32) (currentByte!5463 thiss!1305)) ((_ sign_extend 32) (currentBit!5458 thiss!1305)) lt!180585))))

(assert (=> b!117706 (= lt!180585 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!23210 res!97360) b!117706))

(assert (= (and b!117706 res!97361) b!117698))

(assert (= (and b!117698 res!97355) b!117704))

(assert (= (and b!117704 res!97358) b!117697))

(assert (= (and b!117697 res!97359) b!117700))

(assert (= (and b!117700 res!97365) b!117696))

(assert (= (and b!117696 res!97364) b!117702))

(assert (= (and b!117702 res!97362) b!117701))

(assert (= (and b!117697 res!97356) b!117703))

(assert (= (and b!117703 res!97357) b!117695))

(assert (= (and b!117697 res!97363) b!117699))

(assert (= start!23210 b!117705))

(declare-fun m!176573 () Bool)

(assert (=> b!117695 m!176573))

(declare-fun m!176575 () Bool)

(assert (=> b!117698 m!176575))

(declare-fun m!176577 () Bool)

(assert (=> b!117697 m!176577))

(declare-fun m!176579 () Bool)

(assert (=> b!117697 m!176579))

(declare-fun m!176581 () Bool)

(assert (=> b!117697 m!176581))

(declare-fun m!176583 () Bool)

(assert (=> b!117697 m!176583))

(declare-fun m!176585 () Bool)

(assert (=> b!117697 m!176585))

(declare-fun m!176587 () Bool)

(assert (=> b!117697 m!176587))

(declare-fun m!176589 () Bool)

(assert (=> b!117697 m!176589))

(declare-fun m!176591 () Bool)

(assert (=> b!117697 m!176591))

(declare-fun m!176593 () Bool)

(assert (=> b!117697 m!176593))

(declare-fun m!176595 () Bool)

(assert (=> b!117697 m!176595))

(declare-fun m!176597 () Bool)

(assert (=> b!117697 m!176597))

(declare-fun m!176599 () Bool)

(assert (=> b!117697 m!176599))

(declare-fun m!176601 () Bool)

(assert (=> b!117697 m!176601))

(declare-fun m!176603 () Bool)

(assert (=> b!117697 m!176603))

(declare-fun m!176605 () Bool)

(assert (=> b!117697 m!176605))

(declare-fun m!176607 () Bool)

(assert (=> b!117697 m!176607))

(declare-fun m!176609 () Bool)

(assert (=> b!117697 m!176609))

(declare-fun m!176611 () Bool)

(assert (=> b!117697 m!176611))

(declare-fun m!176613 () Bool)

(assert (=> start!23210 m!176613))

(declare-fun m!176615 () Bool)

(assert (=> b!117703 m!176615))

(declare-fun m!176617 () Bool)

(assert (=> b!117696 m!176617))

(declare-fun m!176619 () Bool)

(assert (=> b!117706 m!176619))

(declare-fun m!176621 () Bool)

(assert (=> b!117701 m!176621))

(declare-fun m!176623 () Bool)

(assert (=> b!117702 m!176623))

(assert (=> b!117702 m!176623))

(declare-fun m!176625 () Bool)

(assert (=> b!117702 m!176625))

(declare-fun m!176627 () Bool)

(assert (=> b!117700 m!176627))

(declare-fun m!176629 () Bool)

(assert (=> b!117700 m!176629))

(declare-fun m!176631 () Bool)

(assert (=> b!117705 m!176631))

(push 1)

(assert (not b!117703))

(assert (not b!117695))

(assert (not b!117706))

(assert (not b!117696))

(assert (not b!117701))

(assert (not b!117705))

(assert (not b!117697))

(assert (not start!23210))

(assert (not b!117698))

(assert (not b!117702))

(assert (not b!117700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

