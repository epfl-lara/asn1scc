; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20240 () Bool)

(assert start!20240)

(declare-fun b!101601 () Bool)

(declare-fun e!66450 () Bool)

(declare-datatypes ((array!4771 0))(
  ( (array!4772 (arr!2771 (Array (_ BitVec 32) (_ BitVec 8))) (size!2178 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3830 0))(
  ( (BitStream!3831 (buf!2535 array!4771) (currentByte!5002 (_ BitVec 32)) (currentBit!4997 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8248 0))(
  ( (tuple2!8249 (_1!4379 BitStream!3830) (_2!4379 Bool)) )
))
(declare-fun lt!147425 () tuple2!8248)

(declare-fun lt!147420 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101601 (= e!66450 (= (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!147425))) (currentByte!5002 (_1!4379 lt!147425)) (currentBit!4997 (_1!4379 lt!147425))) lt!147420))))

(declare-fun b!101602 () Bool)

(declare-fun e!66454 () Bool)

(declare-fun thiss!1305 () BitStream!3830)

(declare-fun array_inv!1980 (array!4771) Bool)

(assert (=> b!101602 (= e!66454 (array_inv!1980 (buf!2535 thiss!1305)))))

(declare-fun res!83501 () Bool)

(declare-fun e!66452 () Bool)

(assert (=> start!20240 (=> (not res!83501) (not e!66452))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20240 (= res!83501 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20240 e!66452))

(assert (=> start!20240 true))

(declare-fun inv!12 (BitStream!3830) Bool)

(assert (=> start!20240 (and (inv!12 thiss!1305) e!66454)))

(declare-fun b!101603 () Bool)

(declare-fun e!66451 () Bool)

(declare-datatypes ((tuple2!8250 0))(
  ( (tuple2!8251 (_1!4380 BitStream!3830) (_2!4380 BitStream!3830)) )
))
(declare-fun lt!147417 () tuple2!8250)

(declare-fun lt!147426 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101603 (= e!66451 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4380 lt!147417)))) ((_ sign_extend 32) (currentByte!5002 (_1!4380 lt!147417))) ((_ sign_extend 32) (currentBit!4997 (_1!4380 lt!147417))) lt!147426)))))

(declare-datatypes ((Unit!6228 0))(
  ( (Unit!6229) )
))
(declare-datatypes ((tuple2!8252 0))(
  ( (tuple2!8253 (_1!4381 Unit!6228) (_2!4381 BitStream!3830)) )
))
(declare-fun lt!147414 () tuple2!8252)

(assert (=> b!101603 (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!147414)))) ((_ sign_extend 32) (currentByte!5002 thiss!1305)) ((_ sign_extend 32) (currentBit!4997 thiss!1305)) lt!147426)))

(declare-fun lt!147419 () Unit!6228)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3830 array!4771 (_ BitVec 64)) Unit!6228)

(assert (=> b!101603 (= lt!147419 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2535 (_2!4381 lt!147414)) lt!147426))))

(declare-fun lt!147421 () Bool)

(declare-fun readBitPure!0 (BitStream!3830) tuple2!8248)

(assert (=> b!101603 (= (_2!4379 (readBitPure!0 (_1!4380 lt!147417))) lt!147421)))

(declare-fun lt!147422 () tuple2!8250)

(declare-fun lt!147418 () tuple2!8252)

(declare-fun reader!0 (BitStream!3830 BitStream!3830) tuple2!8250)

(assert (=> b!101603 (= lt!147422 (reader!0 (_2!4381 lt!147418) (_2!4381 lt!147414)))))

(assert (=> b!101603 (= lt!147417 (reader!0 thiss!1305 (_2!4381 lt!147414)))))

(declare-fun e!66455 () Bool)

(assert (=> b!101603 e!66455))

(declare-fun res!83498 () Bool)

(assert (=> b!101603 (=> (not res!83498) (not e!66455))))

(declare-fun lt!147424 () tuple2!8248)

(declare-fun lt!147423 () tuple2!8248)

(assert (=> b!101603 (= res!83498 (= (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!147424))) (currentByte!5002 (_1!4379 lt!147424)) (currentBit!4997 (_1!4379 lt!147424))) (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!147423))) (currentByte!5002 (_1!4379 lt!147423)) (currentBit!4997 (_1!4379 lt!147423)))))))

(declare-fun lt!147413 () Unit!6228)

(declare-fun lt!147427 () BitStream!3830)

(declare-fun readBitPrefixLemma!0 (BitStream!3830 BitStream!3830) Unit!6228)

(assert (=> b!101603 (= lt!147413 (readBitPrefixLemma!0 lt!147427 (_2!4381 lt!147414)))))

(assert (=> b!101603 (= lt!147423 (readBitPure!0 (BitStream!3831 (buf!2535 (_2!4381 lt!147414)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305))))))

(assert (=> b!101603 (= lt!147424 (readBitPure!0 lt!147427))))

(assert (=> b!101603 (= lt!147427 (BitStream!3831 (buf!2535 (_2!4381 lt!147418)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305)))))

(declare-fun e!66453 () Bool)

(assert (=> b!101603 e!66453))

(declare-fun res!83506 () Bool)

(assert (=> b!101603 (=> (not res!83506) (not e!66453))))

(declare-fun isPrefixOf!0 (BitStream!3830 BitStream!3830) Bool)

(assert (=> b!101603 (= res!83506 (isPrefixOf!0 thiss!1305 (_2!4381 lt!147414)))))

(declare-fun lt!147416 () Unit!6228)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3830 BitStream!3830 BitStream!3830) Unit!6228)

(assert (=> b!101603 (= lt!147416 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4381 lt!147418) (_2!4381 lt!147414)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3830 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8252)

(assert (=> b!101603 (= lt!147414 (appendNLeastSignificantBitsLoop!0 (_2!4381 lt!147418) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66449 () Bool)

(assert (=> b!101603 e!66449))

(declare-fun res!83503 () Bool)

(assert (=> b!101603 (=> (not res!83503) (not e!66449))))

(assert (=> b!101603 (= res!83503 (= (size!2178 (buf!2535 thiss!1305)) (size!2178 (buf!2535 (_2!4381 lt!147418)))))))

(declare-fun appendBit!0 (BitStream!3830 Bool) tuple2!8252)

(assert (=> b!101603 (= lt!147418 (appendBit!0 thiss!1305 lt!147421))))

(assert (=> b!101603 (= lt!147421 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101604 () Bool)

(declare-fun res!83502 () Bool)

(assert (=> b!101604 (=> (not res!83502) (not e!66453))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101604 (= res!83502 (invariant!0 (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305) (size!2178 (buf!2535 (_2!4381 lt!147418)))))))

(declare-fun b!101605 () Bool)

(assert (=> b!101605 (= e!66453 (invariant!0 (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305) (size!2178 (buf!2535 (_2!4381 lt!147414)))))))

(declare-fun b!101606 () Bool)

(declare-fun e!66448 () Bool)

(assert (=> b!101606 (= e!66449 e!66448)))

(declare-fun res!83497 () Bool)

(assert (=> b!101606 (=> (not res!83497) (not e!66448))))

(declare-fun lt!147415 () (_ BitVec 64))

(assert (=> b!101606 (= res!83497 (= lt!147420 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!147415)))))

(assert (=> b!101606 (= lt!147420 (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147418))) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418))))))

(assert (=> b!101606 (= lt!147415 (bitIndex!0 (size!2178 (buf!2535 thiss!1305)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305)))))

(declare-fun b!101607 () Bool)

(declare-fun res!83499 () Bool)

(assert (=> b!101607 (=> (not res!83499) (not e!66448))))

(assert (=> b!101607 (= res!83499 (isPrefixOf!0 thiss!1305 (_2!4381 lt!147418)))))

(declare-fun b!101608 () Bool)

(declare-fun res!83500 () Bool)

(assert (=> b!101608 (=> (not res!83500) (not e!66451))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101608 (= res!83500 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101609 () Bool)

(declare-fun res!83507 () Bool)

(assert (=> b!101609 (=> (not res!83507) (not e!66451))))

(assert (=> b!101609 (= res!83507 (bvslt i!615 nBits!396))))

(declare-fun b!101610 () Bool)

(assert (=> b!101610 (= e!66455 (= (_2!4379 lt!147424) (_2!4379 lt!147423)))))

(declare-fun b!101611 () Bool)

(assert (=> b!101611 (= e!66448 e!66450)))

(declare-fun res!83505 () Bool)

(assert (=> b!101611 (=> (not res!83505) (not e!66450))))

(assert (=> b!101611 (= res!83505 (and (= (_2!4379 lt!147425) lt!147421) (= (_1!4379 lt!147425) (_2!4381 lt!147418))))))

(declare-fun readerFrom!0 (BitStream!3830 (_ BitVec 32) (_ BitVec 32)) BitStream!3830)

(assert (=> b!101611 (= lt!147425 (readBitPure!0 (readerFrom!0 (_2!4381 lt!147418) (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305))))))

(declare-fun b!101612 () Bool)

(assert (=> b!101612 (= e!66452 e!66451)))

(declare-fun res!83504 () Bool)

(assert (=> b!101612 (=> (not res!83504) (not e!66451))))

(assert (=> b!101612 (= res!83504 (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 thiss!1305))) ((_ sign_extend 32) (currentByte!5002 thiss!1305)) ((_ sign_extend 32) (currentBit!4997 thiss!1305)) lt!147426))))

(assert (=> b!101612 (= lt!147426 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!20240 res!83501) b!101612))

(assert (= (and b!101612 res!83504) b!101608))

(assert (= (and b!101608 res!83500) b!101609))

(assert (= (and b!101609 res!83507) b!101603))

(assert (= (and b!101603 res!83503) b!101606))

(assert (= (and b!101606 res!83497) b!101607))

(assert (= (and b!101607 res!83499) b!101611))

(assert (= (and b!101611 res!83505) b!101601))

(assert (= (and b!101603 res!83506) b!101604))

(assert (= (and b!101604 res!83502) b!101605))

(assert (= (and b!101603 res!83498) b!101610))

(assert (= start!20240 b!101602))

(declare-fun m!147763 () Bool)

(assert (=> b!101605 m!147763))

(declare-fun m!147765 () Bool)

(assert (=> b!101606 m!147765))

(declare-fun m!147767 () Bool)

(assert (=> b!101606 m!147767))

(declare-fun m!147769 () Bool)

(assert (=> start!20240 m!147769))

(declare-fun m!147771 () Bool)

(assert (=> b!101604 m!147771))

(declare-fun m!147773 () Bool)

(assert (=> b!101612 m!147773))

(declare-fun m!147775 () Bool)

(assert (=> b!101601 m!147775))

(declare-fun m!147777 () Bool)

(assert (=> b!101611 m!147777))

(assert (=> b!101611 m!147777))

(declare-fun m!147779 () Bool)

(assert (=> b!101611 m!147779))

(declare-fun m!147781 () Bool)

(assert (=> b!101608 m!147781))

(declare-fun m!147783 () Bool)

(assert (=> b!101602 m!147783))

(declare-fun m!147785 () Bool)

(assert (=> b!101607 m!147785))

(declare-fun m!147787 () Bool)

(assert (=> b!101603 m!147787))

(declare-fun m!147789 () Bool)

(assert (=> b!101603 m!147789))

(declare-fun m!147791 () Bool)

(assert (=> b!101603 m!147791))

(declare-fun m!147793 () Bool)

(assert (=> b!101603 m!147793))

(declare-fun m!147795 () Bool)

(assert (=> b!101603 m!147795))

(declare-fun m!147797 () Bool)

(assert (=> b!101603 m!147797))

(declare-fun m!147799 () Bool)

(assert (=> b!101603 m!147799))

(declare-fun m!147801 () Bool)

(assert (=> b!101603 m!147801))

(declare-fun m!147803 () Bool)

(assert (=> b!101603 m!147803))

(declare-fun m!147805 () Bool)

(assert (=> b!101603 m!147805))

(declare-fun m!147807 () Bool)

(assert (=> b!101603 m!147807))

(declare-fun m!147809 () Bool)

(assert (=> b!101603 m!147809))

(declare-fun m!147811 () Bool)

(assert (=> b!101603 m!147811))

(declare-fun m!147813 () Bool)

(assert (=> b!101603 m!147813))

(declare-fun m!147815 () Bool)

(assert (=> b!101603 m!147815))

(push 1)

(assert (not b!101605))

(assert (not b!101606))

(assert (not b!101611))

(assert (not b!101608))

(assert (not b!101612))

(assert (not b!101601))

(assert (not start!20240))

(assert (not b!101604))

(assert (not b!101603))

(assert (not b!101607))

(assert (not b!101602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31708 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31708 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 thiss!1305))) ((_ sign_extend 32) (currentByte!5002 thiss!1305)) ((_ sign_extend 32) (currentBit!4997 thiss!1305)) lt!147426) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2178 (buf!2535 thiss!1305))) ((_ sign_extend 32) (currentByte!5002 thiss!1305)) ((_ sign_extend 32) (currentBit!4997 thiss!1305))) lt!147426))))

(declare-fun bs!7770 () Bool)

(assert (= bs!7770 d!31708))

(declare-fun m!147857 () Bool)

(assert (=> bs!7770 m!147857))

(assert (=> b!101612 d!31708))

(declare-fun d!31710 () Bool)

(declare-fun e!66484 () Bool)

(assert (=> d!31710 e!66484))

(declare-fun res!83555 () Bool)

(assert (=> d!31710 (=> (not res!83555) (not e!66484))))

(declare-fun lt!147490 () (_ BitVec 64))

(declare-fun lt!147491 () (_ BitVec 64))

(declare-fun lt!147486 () (_ BitVec 64))

(assert (=> d!31710 (= res!83555 (= lt!147490 (bvsub lt!147486 lt!147491)))))

(assert (=> d!31710 (or (= (bvand lt!147486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147491 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147486 lt!147491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31710 (= lt!147491 (remainingBits!0 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4379 lt!147425)))) ((_ sign_extend 32) (currentByte!5002 (_1!4379 lt!147425))) ((_ sign_extend 32) (currentBit!4997 (_1!4379 lt!147425)))))))

(declare-fun lt!147487 () (_ BitVec 64))

(declare-fun lt!147488 () (_ BitVec 64))

(assert (=> d!31710 (= lt!147486 (bvmul lt!147487 lt!147488))))

(assert (=> d!31710 (or (= lt!147487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!147488 (bvsdiv (bvmul lt!147487 lt!147488) lt!147487)))))

(assert (=> d!31710 (= lt!147488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31710 (= lt!147487 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4379 lt!147425)))))))

(assert (=> d!31710 (= lt!147490 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5002 (_1!4379 lt!147425))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4997 (_1!4379 lt!147425)))))))

(assert (=> d!31710 (invariant!0 (currentBit!4997 (_1!4379 lt!147425)) (currentByte!5002 (_1!4379 lt!147425)) (size!2178 (buf!2535 (_1!4379 lt!147425))))))

(assert (=> d!31710 (= (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!147425))) (currentByte!5002 (_1!4379 lt!147425)) (currentBit!4997 (_1!4379 lt!147425))) lt!147490)))

(declare-fun b!101659 () Bool)

(declare-fun res!83554 () Bool)

(assert (=> b!101659 (=> (not res!83554) (not e!66484))))

(assert (=> b!101659 (= res!83554 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!147490))))

(declare-fun b!101660 () Bool)

(declare-fun lt!147489 () (_ BitVec 64))

(assert (=> b!101660 (= e!66484 (bvsle lt!147490 (bvmul lt!147489 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101660 (or (= lt!147489 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!147489 #b0000000000000000000000000000000000000000000000000000000000001000) lt!147489)))))

(assert (=> b!101660 (= lt!147489 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4379 lt!147425)))))))

(assert (= (and d!31710 res!83555) b!101659))

(assert (= (and b!101659 res!83554) b!101660))

(declare-fun m!147859 () Bool)

(assert (=> d!31710 m!147859))

(declare-fun m!147861 () Bool)

(assert (=> d!31710 m!147861))

(assert (=> b!101601 d!31710))

(declare-fun d!31712 () Bool)

(declare-fun e!66485 () Bool)

(assert (=> d!31712 e!66485))

(declare-fun res!83557 () Bool)

(assert (=> d!31712 (=> (not res!83557) (not e!66485))))

(declare-fun lt!147496 () (_ BitVec 64))

(declare-fun lt!147497 () (_ BitVec 64))

(declare-fun lt!147492 () (_ BitVec 64))

(assert (=> d!31712 (= res!83557 (= lt!147496 (bvsub lt!147492 lt!147497)))))

(assert (=> d!31712 (or (= (bvand lt!147492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147497 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147492 lt!147497) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31712 (= lt!147497 (remainingBits!0 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!147418)))) ((_ sign_extend 32) (currentByte!5002 (_2!4381 lt!147418))) ((_ sign_extend 32) (currentBit!4997 (_2!4381 lt!147418)))))))

(declare-fun lt!147493 () (_ BitVec 64))

(declare-fun lt!147494 () (_ BitVec 64))

(assert (=> d!31712 (= lt!147492 (bvmul lt!147493 lt!147494))))

(assert (=> d!31712 (or (= lt!147493 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!147494 (bvsdiv (bvmul lt!147493 lt!147494) lt!147493)))))

(assert (=> d!31712 (= lt!147494 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31712 (= lt!147493 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!147418)))))))

(assert (=> d!31712 (= lt!147496 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5002 (_2!4381 lt!147418))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4997 (_2!4381 lt!147418)))))))

(assert (=> d!31712 (invariant!0 (currentBit!4997 (_2!4381 lt!147418)) (currentByte!5002 (_2!4381 lt!147418)) (size!2178 (buf!2535 (_2!4381 lt!147418))))))

(assert (=> d!31712 (= (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147418))) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418))) lt!147496)))

(declare-fun b!101661 () Bool)

(declare-fun res!83556 () Bool)

(assert (=> b!101661 (=> (not res!83556) (not e!66485))))

(assert (=> b!101661 (= res!83556 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!147496))))

(declare-fun b!101662 () Bool)

(declare-fun lt!147495 () (_ BitVec 64))

(assert (=> b!101662 (= e!66485 (bvsle lt!147496 (bvmul lt!147495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101662 (or (= lt!147495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!147495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!147495)))))

(assert (=> b!101662 (= lt!147495 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!147418)))))))

(assert (= (and d!31712 res!83557) b!101661))

(assert (= (and b!101661 res!83556) b!101662))

(declare-fun m!147863 () Bool)

(assert (=> d!31712 m!147863))

(declare-fun m!147865 () Bool)

(assert (=> d!31712 m!147865))

(assert (=> b!101606 d!31712))

(declare-fun d!31714 () Bool)

(declare-fun e!66486 () Bool)

(assert (=> d!31714 e!66486))

(declare-fun res!83559 () Bool)

(assert (=> d!31714 (=> (not res!83559) (not e!66486))))

(declare-fun lt!147503 () (_ BitVec 64))

(declare-fun lt!147502 () (_ BitVec 64))

(declare-fun lt!147498 () (_ BitVec 64))

(assert (=> d!31714 (= res!83559 (= lt!147502 (bvsub lt!147498 lt!147503)))))

(assert (=> d!31714 (or (= (bvand lt!147498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147503 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147498 lt!147503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31714 (= lt!147503 (remainingBits!0 ((_ sign_extend 32) (size!2178 (buf!2535 thiss!1305))) ((_ sign_extend 32) (currentByte!5002 thiss!1305)) ((_ sign_extend 32) (currentBit!4997 thiss!1305))))))

(declare-fun lt!147499 () (_ BitVec 64))

(declare-fun lt!147500 () (_ BitVec 64))

(assert (=> d!31714 (= lt!147498 (bvmul lt!147499 lt!147500))))

(assert (=> d!31714 (or (= lt!147499 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!147500 (bvsdiv (bvmul lt!147499 lt!147500) lt!147499)))))

(assert (=> d!31714 (= lt!147500 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31714 (= lt!147499 ((_ sign_extend 32) (size!2178 (buf!2535 thiss!1305))))))

(assert (=> d!31714 (= lt!147502 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5002 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4997 thiss!1305))))))

(assert (=> d!31714 (invariant!0 (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305) (size!2178 (buf!2535 thiss!1305)))))

(assert (=> d!31714 (= (bitIndex!0 (size!2178 (buf!2535 thiss!1305)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305)) lt!147502)))

(declare-fun b!101663 () Bool)

(declare-fun res!83558 () Bool)

(assert (=> b!101663 (=> (not res!83558) (not e!66486))))

(assert (=> b!101663 (= res!83558 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!147502))))

(declare-fun b!101664 () Bool)

(declare-fun lt!147501 () (_ BitVec 64))

(assert (=> b!101664 (= e!66486 (bvsle lt!147502 (bvmul lt!147501 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101664 (or (= lt!147501 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!147501 #b0000000000000000000000000000000000000000000000000000000000001000) lt!147501)))))

(assert (=> b!101664 (= lt!147501 ((_ sign_extend 32) (size!2178 (buf!2535 thiss!1305))))))

(assert (= (and d!31714 res!83559) b!101663))

(assert (= (and b!101663 res!83558) b!101664))

(assert (=> d!31714 m!147857))

(declare-fun m!147867 () Bool)

(assert (=> d!31714 m!147867))

(assert (=> b!101606 d!31714))

(declare-fun d!31716 () Bool)

(declare-datatypes ((tuple2!8262 0))(
  ( (tuple2!8263 (_1!4386 Bool) (_2!4386 BitStream!3830)) )
))
(declare-fun lt!147506 () tuple2!8262)

(declare-fun readBit!0 (BitStream!3830) tuple2!8262)

(assert (=> d!31716 (= lt!147506 (readBit!0 (readerFrom!0 (_2!4381 lt!147418) (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305))))))

(assert (=> d!31716 (= (readBitPure!0 (readerFrom!0 (_2!4381 lt!147418) (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305))) (tuple2!8249 (_2!4386 lt!147506) (_1!4386 lt!147506)))))

(declare-fun bs!7771 () Bool)

(assert (= bs!7771 d!31716))

(assert (=> bs!7771 m!147777))

(declare-fun m!147869 () Bool)

(assert (=> bs!7771 m!147869))

(assert (=> b!101611 d!31716))

(declare-fun d!31718 () Bool)

(declare-fun e!66489 () Bool)

(assert (=> d!31718 e!66489))

(declare-fun res!83563 () Bool)

(assert (=> d!31718 (=> (not res!83563) (not e!66489))))

(assert (=> d!31718 (= res!83563 (invariant!0 (currentBit!4997 (_2!4381 lt!147418)) (currentByte!5002 (_2!4381 lt!147418)) (size!2178 (buf!2535 (_2!4381 lt!147418)))))))

(assert (=> d!31718 (= (readerFrom!0 (_2!4381 lt!147418) (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305)) (BitStream!3831 (buf!2535 (_2!4381 lt!147418)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305)))))

(declare-fun b!101667 () Bool)

(assert (=> b!101667 (= e!66489 (invariant!0 (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305) (size!2178 (buf!2535 (_2!4381 lt!147418)))))))

(assert (= (and d!31718 res!83563) b!101667))

(assert (=> d!31718 m!147865))

(assert (=> b!101667 m!147771))

(assert (=> b!101611 d!31718))

(declare-fun d!31720 () Bool)

(assert (=> d!31720 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!101608 d!31720))

(declare-fun d!31722 () Bool)

(assert (=> d!31722 (= (array_inv!1980 (buf!2535 thiss!1305)) (bvsge (size!2178 (buf!2535 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!101602 d!31722))

(declare-fun d!31724 () Bool)

(declare-fun res!83571 () Bool)

(declare-fun e!66494 () Bool)

(assert (=> d!31724 (=> (not res!83571) (not e!66494))))

(assert (=> d!31724 (= res!83571 (= (size!2178 (buf!2535 thiss!1305)) (size!2178 (buf!2535 (_2!4381 lt!147418)))))))

(assert (=> d!31724 (= (isPrefixOf!0 thiss!1305 (_2!4381 lt!147418)) e!66494)))

(declare-fun b!101674 () Bool)

(declare-fun res!83572 () Bool)

(assert (=> b!101674 (=> (not res!83572) (not e!66494))))

(assert (=> b!101674 (= res!83572 (bvsle (bitIndex!0 (size!2178 (buf!2535 thiss!1305)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305)) (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147418))) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418)))))))

(declare-fun b!101675 () Bool)

(declare-fun e!66495 () Bool)

(assert (=> b!101675 (= e!66494 e!66495)))

(declare-fun res!83570 () Bool)

(assert (=> b!101675 (=> res!83570 e!66495)))

(assert (=> b!101675 (= res!83570 (= (size!2178 (buf!2535 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!101676 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4771 array!4771 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101676 (= e!66495 (arrayBitRangesEq!0 (buf!2535 thiss!1305) (buf!2535 (_2!4381 lt!147418)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2178 (buf!2535 thiss!1305)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305))))))

(assert (= (and d!31724 res!83571) b!101674))

(assert (= (and b!101674 res!83572) b!101675))

(assert (= (and b!101675 (not res!83570)) b!101676))

(assert (=> b!101674 m!147767))

(assert (=> b!101674 m!147765))

(assert (=> b!101676 m!147767))

(assert (=> b!101676 m!147767))

(declare-fun m!147871 () Bool)

(assert (=> b!101676 m!147871))

(assert (=> b!101607 d!31724))

(declare-fun d!31726 () Bool)

(assert (=> d!31726 (= (invariant!0 (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305) (size!2178 (buf!2535 (_2!4381 lt!147418)))) (and (bvsge (currentBit!4997 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4997 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5002 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5002 thiss!1305) (size!2178 (buf!2535 (_2!4381 lt!147418)))) (and (= (currentBit!4997 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5002 thiss!1305) (size!2178 (buf!2535 (_2!4381 lt!147418))))))))))

(assert (=> b!101604 d!31726))

(declare-fun d!31728 () Bool)

(assert (=> d!31728 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305) (size!2178 (buf!2535 thiss!1305))))))

(declare-fun bs!7772 () Bool)

(assert (= bs!7772 d!31728))

(assert (=> bs!7772 m!147867))

(assert (=> start!20240 d!31728))

(declare-fun b!101687 () Bool)

(declare-fun res!83579 () Bool)

(declare-fun e!66500 () Bool)

(assert (=> b!101687 (=> (not res!83579) (not e!66500))))

(declare-fun lt!147548 () tuple2!8250)

(assert (=> b!101687 (= res!83579 (isPrefixOf!0 (_2!4380 lt!147548) (_2!4381 lt!147414)))))

(declare-fun b!101688 () Bool)

(declare-fun lt!147555 () (_ BitVec 64))

(declare-fun lt!147553 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3830 (_ BitVec 64)) BitStream!3830)

(assert (=> b!101688 (= e!66500 (= (_1!4380 lt!147548) (withMovedBitIndex!0 (_2!4380 lt!147548) (bvsub lt!147555 lt!147553))))))

(assert (=> b!101688 (or (= (bvand lt!147555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147555 lt!147553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101688 (= lt!147553 (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147414))) (currentByte!5002 (_2!4381 lt!147414)) (currentBit!4997 (_2!4381 lt!147414))))))

(assert (=> b!101688 (= lt!147555 (bitIndex!0 (size!2178 (buf!2535 thiss!1305)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305)))))

(declare-fun b!101689 () Bool)

(declare-fun res!83580 () Bool)

(assert (=> b!101689 (=> (not res!83580) (not e!66500))))

(assert (=> b!101689 (= res!83580 (isPrefixOf!0 (_1!4380 lt!147548) thiss!1305))))

(declare-fun b!101690 () Bool)

(declare-fun e!66501 () Unit!6228)

(declare-fun Unit!6244 () Unit!6228)

(assert (=> b!101690 (= e!66501 Unit!6244)))

(declare-fun d!31730 () Bool)

(assert (=> d!31730 e!66500))

(declare-fun res!83581 () Bool)

(assert (=> d!31730 (=> (not res!83581) (not e!66500))))

(assert (=> d!31730 (= res!83581 (isPrefixOf!0 (_1!4380 lt!147548) (_2!4380 lt!147548)))))

(declare-fun lt!147561 () BitStream!3830)

(assert (=> d!31730 (= lt!147548 (tuple2!8251 lt!147561 (_2!4381 lt!147414)))))

(declare-fun lt!147565 () Unit!6228)

(declare-fun lt!147552 () Unit!6228)

(assert (=> d!31730 (= lt!147565 lt!147552)))

(assert (=> d!31730 (isPrefixOf!0 lt!147561 (_2!4381 lt!147414))))

(assert (=> d!31730 (= lt!147552 (lemmaIsPrefixTransitive!0 lt!147561 (_2!4381 lt!147414) (_2!4381 lt!147414)))))

(declare-fun lt!147547 () Unit!6228)

(declare-fun lt!147564 () Unit!6228)

(assert (=> d!31730 (= lt!147547 lt!147564)))

(assert (=> d!31730 (isPrefixOf!0 lt!147561 (_2!4381 lt!147414))))

(assert (=> d!31730 (= lt!147564 (lemmaIsPrefixTransitive!0 lt!147561 thiss!1305 (_2!4381 lt!147414)))))

(declare-fun lt!147559 () Unit!6228)

(assert (=> d!31730 (= lt!147559 e!66501)))

(declare-fun c!6329 () Bool)

(assert (=> d!31730 (= c!6329 (not (= (size!2178 (buf!2535 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!147549 () Unit!6228)

(declare-fun lt!147554 () Unit!6228)

(assert (=> d!31730 (= lt!147549 lt!147554)))

(assert (=> d!31730 (isPrefixOf!0 (_2!4381 lt!147414) (_2!4381 lt!147414))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3830) Unit!6228)

(assert (=> d!31730 (= lt!147554 (lemmaIsPrefixRefl!0 (_2!4381 lt!147414)))))

(declare-fun lt!147560 () Unit!6228)

(declare-fun lt!147556 () Unit!6228)

(assert (=> d!31730 (= lt!147560 lt!147556)))

(assert (=> d!31730 (= lt!147556 (lemmaIsPrefixRefl!0 (_2!4381 lt!147414)))))

(declare-fun lt!147562 () Unit!6228)

(declare-fun lt!147551 () Unit!6228)

(assert (=> d!31730 (= lt!147562 lt!147551)))

(assert (=> d!31730 (isPrefixOf!0 lt!147561 lt!147561)))

(assert (=> d!31730 (= lt!147551 (lemmaIsPrefixRefl!0 lt!147561))))

(declare-fun lt!147566 () Unit!6228)

(declare-fun lt!147563 () Unit!6228)

(assert (=> d!31730 (= lt!147566 lt!147563)))

(assert (=> d!31730 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31730 (= lt!147563 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31730 (= lt!147561 (BitStream!3831 (buf!2535 (_2!4381 lt!147414)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305)))))

(assert (=> d!31730 (isPrefixOf!0 thiss!1305 (_2!4381 lt!147414))))

(assert (=> d!31730 (= (reader!0 thiss!1305 (_2!4381 lt!147414)) lt!147548)))

(declare-fun b!101691 () Bool)

(declare-fun lt!147558 () Unit!6228)

(assert (=> b!101691 (= e!66501 lt!147558)))

(declare-fun lt!147550 () (_ BitVec 64))

(assert (=> b!101691 (= lt!147550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!147557 () (_ BitVec 64))

(assert (=> b!101691 (= lt!147557 (bitIndex!0 (size!2178 (buf!2535 thiss!1305)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4771 array!4771 (_ BitVec 64) (_ BitVec 64)) Unit!6228)

(assert (=> b!101691 (= lt!147558 (arrayBitRangesEqSymmetric!0 (buf!2535 thiss!1305) (buf!2535 (_2!4381 lt!147414)) lt!147550 lt!147557))))

(assert (=> b!101691 (arrayBitRangesEq!0 (buf!2535 (_2!4381 lt!147414)) (buf!2535 thiss!1305) lt!147550 lt!147557)))

(assert (= (and d!31730 c!6329) b!101691))

(assert (= (and d!31730 (not c!6329)) b!101690))

(assert (= (and d!31730 res!83581) b!101689))

(assert (= (and b!101689 res!83580) b!101687))

(assert (= (and b!101687 res!83579) b!101688))

(declare-fun m!147873 () Bool)

(assert (=> b!101687 m!147873))

(assert (=> b!101691 m!147767))

(declare-fun m!147875 () Bool)

(assert (=> b!101691 m!147875))

(declare-fun m!147877 () Bool)

(assert (=> b!101691 m!147877))

(declare-fun m!147879 () Bool)

(assert (=> b!101688 m!147879))

(declare-fun m!147881 () Bool)

(assert (=> b!101688 m!147881))

(assert (=> b!101688 m!147767))

(declare-fun m!147883 () Bool)

(assert (=> b!101689 m!147883))

(declare-fun m!147885 () Bool)

(assert (=> d!31730 m!147885))

(declare-fun m!147887 () Bool)

(assert (=> d!31730 m!147887))

(declare-fun m!147889 () Bool)

(assert (=> d!31730 m!147889))

(declare-fun m!147891 () Bool)

(assert (=> d!31730 m!147891))

(declare-fun m!147893 () Bool)

(assert (=> d!31730 m!147893))

(declare-fun m!147895 () Bool)

(assert (=> d!31730 m!147895))

(declare-fun m!147897 () Bool)

(assert (=> d!31730 m!147897))

(declare-fun m!147899 () Bool)

(assert (=> d!31730 m!147899))

(declare-fun m!147901 () Bool)

(assert (=> d!31730 m!147901))

(assert (=> d!31730 m!147793))

(declare-fun m!147903 () Bool)

(assert (=> d!31730 m!147903))

(assert (=> b!101603 d!31730))

(declare-fun d!31732 () Bool)

(assert (=> d!31732 (isPrefixOf!0 thiss!1305 (_2!4381 lt!147414))))

(declare-fun lt!147569 () Unit!6228)

(declare-fun choose!30 (BitStream!3830 BitStream!3830 BitStream!3830) Unit!6228)

(assert (=> d!31732 (= lt!147569 (choose!30 thiss!1305 (_2!4381 lt!147418) (_2!4381 lt!147414)))))

(assert (=> d!31732 (isPrefixOf!0 thiss!1305 (_2!4381 lt!147418))))

(assert (=> d!31732 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4381 lt!147418) (_2!4381 lt!147414)) lt!147569)))

(declare-fun bs!7773 () Bool)

(assert (= bs!7773 d!31732))

(assert (=> bs!7773 m!147793))

(declare-fun m!147905 () Bool)

(assert (=> bs!7773 m!147905))

(assert (=> bs!7773 m!147785))

(assert (=> b!101603 d!31732))

(declare-fun d!31734 () Bool)

(assert (=> d!31734 (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!147414)))) ((_ sign_extend 32) (currentByte!5002 thiss!1305)) ((_ sign_extend 32) (currentBit!4997 thiss!1305)) lt!147426)))

(declare-fun lt!147572 () Unit!6228)

(declare-fun choose!9 (BitStream!3830 array!4771 (_ BitVec 64) BitStream!3830) Unit!6228)

(assert (=> d!31734 (= lt!147572 (choose!9 thiss!1305 (buf!2535 (_2!4381 lt!147414)) lt!147426 (BitStream!3831 (buf!2535 (_2!4381 lt!147414)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305))))))

(assert (=> d!31734 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2535 (_2!4381 lt!147414)) lt!147426) lt!147572)))

(declare-fun bs!7774 () Bool)

(assert (= bs!7774 d!31734))

(assert (=> bs!7774 m!147797))

(declare-fun m!147907 () Bool)

(assert (=> bs!7774 m!147907))

(assert (=> b!101603 d!31734))

(declare-fun d!31736 () Bool)

(declare-fun lt!147573 () tuple2!8262)

(assert (=> d!31736 (= lt!147573 (readBit!0 lt!147427))))

(assert (=> d!31736 (= (readBitPure!0 lt!147427) (tuple2!8249 (_2!4386 lt!147573) (_1!4386 lt!147573)))))

(declare-fun bs!7775 () Bool)

(assert (= bs!7775 d!31736))

(declare-fun m!147909 () Bool)

(assert (=> bs!7775 m!147909))

(assert (=> b!101603 d!31736))

(declare-fun d!31738 () Bool)

(declare-fun lt!147574 () tuple2!8262)

(assert (=> d!31738 (= lt!147574 (readBit!0 (_1!4380 lt!147417)))))

(assert (=> d!31738 (= (readBitPure!0 (_1!4380 lt!147417)) (tuple2!8249 (_2!4386 lt!147574) (_1!4386 lt!147574)))))

(declare-fun bs!7776 () Bool)

(assert (= bs!7776 d!31738))

(declare-fun m!147911 () Bool)

(assert (=> bs!7776 m!147911))

(assert (=> b!101603 d!31738))

(declare-fun b!101704 () Bool)

(declare-fun e!66507 () Bool)

(declare-fun lt!147585 () tuple2!8248)

(declare-fun lt!147583 () tuple2!8252)

(assert (=> b!101704 (= e!66507 (= (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!147585))) (currentByte!5002 (_1!4379 lt!147585)) (currentBit!4997 (_1!4379 lt!147585))) (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147583))) (currentByte!5002 (_2!4381 lt!147583)) (currentBit!4997 (_2!4381 lt!147583)))))))

(declare-fun d!31740 () Bool)

(declare-fun e!66506 () Bool)

(assert (=> d!31740 e!66506))

(declare-fun res!83590 () Bool)

(assert (=> d!31740 (=> (not res!83590) (not e!66506))))

(assert (=> d!31740 (= res!83590 (= (size!2178 (buf!2535 thiss!1305)) (size!2178 (buf!2535 (_2!4381 lt!147583)))))))

(declare-fun choose!16 (BitStream!3830 Bool) tuple2!8252)

(assert (=> d!31740 (= lt!147583 (choose!16 thiss!1305 lt!147421))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31740 (validate_offset_bit!0 ((_ sign_extend 32) (size!2178 (buf!2535 thiss!1305))) ((_ sign_extend 32) (currentByte!5002 thiss!1305)) ((_ sign_extend 32) (currentBit!4997 thiss!1305)))))

(assert (=> d!31740 (= (appendBit!0 thiss!1305 lt!147421) lt!147583)))

(declare-fun b!101701 () Bool)

(declare-fun res!83591 () Bool)

(assert (=> b!101701 (=> (not res!83591) (not e!66506))))

(declare-fun lt!147584 () (_ BitVec 64))

(declare-fun lt!147586 () (_ BitVec 64))

(assert (=> b!101701 (= res!83591 (= (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147583))) (currentByte!5002 (_2!4381 lt!147583)) (currentBit!4997 (_2!4381 lt!147583))) (bvadd lt!147584 lt!147586)))))

(assert (=> b!101701 (or (not (= (bvand lt!147584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147586 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!147584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!147584 lt!147586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101701 (= lt!147586 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!101701 (= lt!147584 (bitIndex!0 (size!2178 (buf!2535 thiss!1305)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305)))))

(declare-fun b!101702 () Bool)

(declare-fun res!83593 () Bool)

(assert (=> b!101702 (=> (not res!83593) (not e!66506))))

(assert (=> b!101702 (= res!83593 (isPrefixOf!0 thiss!1305 (_2!4381 lt!147583)))))

(declare-fun b!101703 () Bool)

(assert (=> b!101703 (= e!66506 e!66507)))

(declare-fun res!83592 () Bool)

(assert (=> b!101703 (=> (not res!83592) (not e!66507))))

(assert (=> b!101703 (= res!83592 (and (= (_2!4379 lt!147585) lt!147421) (= (_1!4379 lt!147585) (_2!4381 lt!147583))))))

(assert (=> b!101703 (= lt!147585 (readBitPure!0 (readerFrom!0 (_2!4381 lt!147583) (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305))))))

(assert (= (and d!31740 res!83590) b!101701))

(assert (= (and b!101701 res!83591) b!101702))

(assert (= (and b!101702 res!83593) b!101703))

(assert (= (and b!101703 res!83592) b!101704))

(declare-fun m!147913 () Bool)

(assert (=> b!101703 m!147913))

(assert (=> b!101703 m!147913))

(declare-fun m!147915 () Bool)

(assert (=> b!101703 m!147915))

(declare-fun m!147917 () Bool)

(assert (=> b!101702 m!147917))

(declare-fun m!147919 () Bool)

(assert (=> b!101704 m!147919))

(declare-fun m!147921 () Bool)

(assert (=> b!101704 m!147921))

(assert (=> b!101701 m!147921))

(assert (=> b!101701 m!147767))

(declare-fun m!147923 () Bool)

(assert (=> d!31740 m!147923))

(declare-fun m!147925 () Bool)

(assert (=> d!31740 m!147925))

(assert (=> b!101603 d!31740))

(declare-fun b!101892 () Bool)

(declare-fun e!66606 () (_ BitVec 64))

(assert (=> b!101892 (= e!66606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!101893 () Bool)

(declare-fun res!83734 () Bool)

(declare-fun e!66612 () Bool)

(assert (=> b!101893 (=> (not res!83734) (not e!66612))))

(declare-fun lt!148221 () tuple2!8252)

(declare-fun lt!148233 () (_ BitVec 64))

(declare-fun lt!148224 () (_ BitVec 64))

(assert (=> b!101893 (= res!83734 (= (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!148221))) (currentByte!5002 (_2!4381 lt!148221)) (currentBit!4997 (_2!4381 lt!148221))) (bvadd lt!148233 lt!148224)))))

(assert (=> b!101893 (or (not (= (bvand lt!148233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148224 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!148233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!148233 lt!148224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101893 (= lt!148224 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!101893 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!101893 (= lt!148233 (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147418))) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418))))))

(declare-fun b!101894 () Bool)

(declare-fun e!66607 () tuple2!8252)

(declare-fun lt!148213 () tuple2!8252)

(declare-fun Unit!6247 () Unit!6228)

(assert (=> b!101894 (= e!66607 (tuple2!8253 Unit!6247 (_2!4381 lt!148213)))))

(declare-fun lt!148212 () Bool)

(assert (=> b!101894 (= lt!148212 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!148207 () tuple2!8252)

(assert (=> b!101894 (= lt!148207 (appendBit!0 (_2!4381 lt!147418) lt!148212))))

(declare-fun res!83736 () Bool)

(assert (=> b!101894 (= res!83736 (= (size!2178 (buf!2535 (_2!4381 lt!147418))) (size!2178 (buf!2535 (_2!4381 lt!148207)))))))

(declare-fun e!66608 () Bool)

(assert (=> b!101894 (=> (not res!83736) (not e!66608))))

(assert (=> b!101894 e!66608))

(declare-fun lt!148210 () tuple2!8252)

(assert (=> b!101894 (= lt!148210 lt!148207)))

(assert (=> b!101894 (= lt!148213 (appendNLeastSignificantBitsLoop!0 (_2!4381 lt!148210) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!148234 () Unit!6228)

(assert (=> b!101894 (= lt!148234 (lemmaIsPrefixTransitive!0 (_2!4381 lt!147418) (_2!4381 lt!148210) (_2!4381 lt!148213)))))

(assert (=> b!101894 (isPrefixOf!0 (_2!4381 lt!147418) (_2!4381 lt!148213))))

(declare-fun lt!148203 () Unit!6228)

(assert (=> b!101894 (= lt!148203 lt!148234)))

(assert (=> b!101894 (invariant!0 (currentBit!4997 (_2!4381 lt!147418)) (currentByte!5002 (_2!4381 lt!147418)) (size!2178 (buf!2535 (_2!4381 lt!148210))))))

(declare-fun lt!148237 () BitStream!3830)

(assert (=> b!101894 (= lt!148237 (BitStream!3831 (buf!2535 (_2!4381 lt!148210)) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418))))))

(assert (=> b!101894 (invariant!0 (currentBit!4997 lt!148237) (currentByte!5002 lt!148237) (size!2178 (buf!2535 (_2!4381 lt!148213))))))

(declare-fun lt!148216 () BitStream!3830)

(assert (=> b!101894 (= lt!148216 (BitStream!3831 (buf!2535 (_2!4381 lt!148213)) (currentByte!5002 lt!148237) (currentBit!4997 lt!148237)))))

(declare-fun lt!148201 () tuple2!8248)

(assert (=> b!101894 (= lt!148201 (readBitPure!0 lt!148237))))

(declare-fun lt!148217 () tuple2!8248)

(assert (=> b!101894 (= lt!148217 (readBitPure!0 lt!148216))))

(declare-fun lt!148226 () Unit!6228)

(assert (=> b!101894 (= lt!148226 (readBitPrefixLemma!0 lt!148237 (_2!4381 lt!148213)))))

(declare-fun res!83737 () Bool)

(assert (=> b!101894 (= res!83737 (= (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!148201))) (currentByte!5002 (_1!4379 lt!148201)) (currentBit!4997 (_1!4379 lt!148201))) (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!148217))) (currentByte!5002 (_1!4379 lt!148217)) (currentBit!4997 (_1!4379 lt!148217)))))))

(declare-fun e!66610 () Bool)

(assert (=> b!101894 (=> (not res!83737) (not e!66610))))

(assert (=> b!101894 e!66610))

(declare-fun lt!148225 () Unit!6228)

(assert (=> b!101894 (= lt!148225 lt!148226)))

(declare-fun lt!148219 () tuple2!8250)

(assert (=> b!101894 (= lt!148219 (reader!0 (_2!4381 lt!147418) (_2!4381 lt!148213)))))

(declare-fun lt!148205 () tuple2!8250)

(assert (=> b!101894 (= lt!148205 (reader!0 (_2!4381 lt!148210) (_2!4381 lt!148213)))))

(declare-fun lt!148206 () tuple2!8248)

(assert (=> b!101894 (= lt!148206 (readBitPure!0 (_1!4380 lt!148219)))))

(assert (=> b!101894 (= (_2!4379 lt!148206) lt!148212)))

(declare-fun lt!148214 () Unit!6228)

(declare-fun Unit!6248 () Unit!6228)

(assert (=> b!101894 (= lt!148214 Unit!6248)))

(declare-fun lt!148239 () (_ BitVec 64))

(assert (=> b!101894 (= lt!148239 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!148229 () (_ BitVec 64))

(assert (=> b!101894 (= lt!148229 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!148209 () Unit!6228)

(assert (=> b!101894 (= lt!148209 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4381 lt!147418) (buf!2535 (_2!4381 lt!148213)) lt!148229))))

(assert (=> b!101894 (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!148213)))) ((_ sign_extend 32) (currentByte!5002 (_2!4381 lt!147418))) ((_ sign_extend 32) (currentBit!4997 (_2!4381 lt!147418))) lt!148229)))

(declare-fun lt!148208 () Unit!6228)

(assert (=> b!101894 (= lt!148208 lt!148209)))

(declare-datatypes ((tuple2!8264 0))(
  ( (tuple2!8265 (_1!4387 BitStream!3830) (_2!4387 (_ BitVec 64))) )
))
(declare-fun lt!148227 () tuple2!8264)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8264)

(assert (=> b!101894 (= lt!148227 (readNLeastSignificantBitsLoopPure!0 (_1!4380 lt!148219) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!148239))))

(declare-fun lt!148238 () (_ BitVec 64))

(assert (=> b!101894 (= lt!148238 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!148223 () Unit!6228)

(assert (=> b!101894 (= lt!148223 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4381 lt!148210) (buf!2535 (_2!4381 lt!148213)) lt!148238))))

(assert (=> b!101894 (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!148213)))) ((_ sign_extend 32) (currentByte!5002 (_2!4381 lt!148210))) ((_ sign_extend 32) (currentBit!4997 (_2!4381 lt!148210))) lt!148238)))

(declare-fun lt!148235 () Unit!6228)

(assert (=> b!101894 (= lt!148235 lt!148223)))

(declare-fun lt!148231 () tuple2!8264)

(assert (=> b!101894 (= lt!148231 (readNLeastSignificantBitsLoopPure!0 (_1!4380 lt!148205) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!148239 (ite (_2!4379 lt!148206) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!148218 () tuple2!8264)

(assert (=> b!101894 (= lt!148218 (readNLeastSignificantBitsLoopPure!0 (_1!4380 lt!148219) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!148239))))

(declare-fun c!6354 () Bool)

(assert (=> b!101894 (= c!6354 (_2!4379 (readBitPure!0 (_1!4380 lt!148219))))))

(declare-fun lt!148220 () tuple2!8264)

(assert (=> b!101894 (= lt!148220 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4380 lt!148219) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!148239 e!66606)))))

(declare-fun lt!148240 () Unit!6228)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6228)

(assert (=> b!101894 (= lt!148240 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4380 lt!148219) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!148239))))

(assert (=> b!101894 (and (= (_2!4387 lt!148218) (_2!4387 lt!148220)) (= (_1!4387 lt!148218) (_1!4387 lt!148220)))))

(declare-fun lt!148232 () Unit!6228)

(assert (=> b!101894 (= lt!148232 lt!148240)))

(assert (=> b!101894 (= (_1!4380 lt!148219) (withMovedBitIndex!0 (_2!4380 lt!148219) (bvsub (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147418))) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418))) (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!148213))) (currentByte!5002 (_2!4381 lt!148213)) (currentBit!4997 (_2!4381 lt!148213))))))))

(declare-fun lt!148200 () Unit!6228)

(declare-fun Unit!6249 () Unit!6228)

(assert (=> b!101894 (= lt!148200 Unit!6249)))

(assert (=> b!101894 (= (_1!4380 lt!148205) (withMovedBitIndex!0 (_2!4380 lt!148205) (bvsub (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!148210))) (currentByte!5002 (_2!4381 lt!148210)) (currentBit!4997 (_2!4381 lt!148210))) (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!148213))) (currentByte!5002 (_2!4381 lt!148213)) (currentBit!4997 (_2!4381 lt!148213))))))))

(declare-fun lt!148198 () Unit!6228)

(declare-fun Unit!6250 () Unit!6228)

(assert (=> b!101894 (= lt!148198 Unit!6250)))

(assert (=> b!101894 (= (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147418))) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418))) (bvsub (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!148210))) (currentByte!5002 (_2!4381 lt!148210)) (currentBit!4997 (_2!4381 lt!148210))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!148242 () Unit!6228)

(declare-fun Unit!6251 () Unit!6228)

(assert (=> b!101894 (= lt!148242 Unit!6251)))

(assert (=> b!101894 (= (_2!4387 lt!148227) (_2!4387 lt!148231))))

(declare-fun lt!148222 () Unit!6228)

(declare-fun Unit!6252 () Unit!6228)

(assert (=> b!101894 (= lt!148222 Unit!6252)))

(assert (=> b!101894 (= (_1!4387 lt!148227) (_2!4380 lt!148219))))

(declare-fun b!101895 () Bool)

(declare-fun lt!148211 () Unit!6228)

(assert (=> b!101895 (= e!66607 (tuple2!8253 lt!148211 (_2!4381 lt!147418)))))

(declare-fun lt!148199 () BitStream!3830)

(assert (=> b!101895 (= lt!148199 (_2!4381 lt!147418))))

(assert (=> b!101895 (= lt!148211 (lemmaIsPrefixRefl!0 lt!148199))))

(declare-fun call!1273 () Bool)

(assert (=> b!101895 call!1273))

(declare-fun b!101896 () Bool)

(declare-fun e!66609 () Bool)

(declare-fun lt!148230 () tuple2!8248)

(assert (=> b!101896 (= e!66609 (= (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!148230))) (currentByte!5002 (_1!4379 lt!148230)) (currentBit!4997 (_1!4379 lt!148230))) (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!148207))) (currentByte!5002 (_2!4381 lt!148207)) (currentBit!4997 (_2!4381 lt!148207)))))))

(declare-fun b!101897 () Bool)

(assert (=> b!101897 (= e!66610 (= (_2!4379 lt!148201) (_2!4379 lt!148217)))))

(declare-fun b!101898 () Bool)

(declare-fun res!83733 () Bool)

(assert (=> b!101898 (= res!83733 (= (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!148207))) (currentByte!5002 (_2!4381 lt!148207)) (currentBit!4997 (_2!4381 lt!148207))) (bvadd (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147418))) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!101898 (=> (not res!83733) (not e!66608))))

(declare-fun b!101899 () Bool)

(declare-fun res!83739 () Bool)

(assert (=> b!101899 (= res!83739 call!1273)))

(assert (=> b!101899 (=> (not res!83739) (not e!66608))))

(declare-fun b!101900 () Bool)

(assert (=> b!101900 (= e!66606 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!101901 () Bool)

(assert (=> b!101901 (= lt!148230 (readBitPure!0 (readerFrom!0 (_2!4381 lt!148207) (currentBit!4997 (_2!4381 lt!147418)) (currentByte!5002 (_2!4381 lt!147418)))))))

(declare-fun res!83732 () Bool)

(assert (=> b!101901 (= res!83732 (and (= (_2!4379 lt!148230) lt!148212) (= (_1!4379 lt!148230) (_2!4381 lt!148207))))))

(assert (=> b!101901 (=> (not res!83732) (not e!66609))))

(assert (=> b!101901 (= e!66608 e!66609)))

(declare-fun c!6355 () Bool)

(declare-fun bm!1270 () Bool)

(assert (=> bm!1270 (= call!1273 (isPrefixOf!0 (ite c!6355 (_2!4381 lt!147418) lt!148199) (ite c!6355 (_2!4381 lt!148207) lt!148199)))))

(declare-fun d!31742 () Bool)

(assert (=> d!31742 e!66612))

(declare-fun res!83735 () Bool)

(assert (=> d!31742 (=> (not res!83735) (not e!66612))))

(assert (=> d!31742 (= res!83735 (= (size!2178 (buf!2535 (_2!4381 lt!147418))) (size!2178 (buf!2535 (_2!4381 lt!148221)))))))

(assert (=> d!31742 (= lt!148221 e!66607)))

(assert (=> d!31742 (= c!6355 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31742 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31742 (= (appendNLeastSignificantBitsLoop!0 (_2!4381 lt!147418) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!148221)))

(declare-fun lt!148204 () tuple2!8264)

(declare-fun lt!148228 () tuple2!8250)

(declare-fun b!101891 () Bool)

(assert (=> b!101891 (= e!66612 (and (= (_2!4387 lt!148204) v!199) (= (_1!4387 lt!148204) (_2!4380 lt!148228))))))

(declare-fun lt!148215 () (_ BitVec 64))

(assert (=> b!101891 (= lt!148204 (readNLeastSignificantBitsLoopPure!0 (_1!4380 lt!148228) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!148215))))

(declare-fun lt!148241 () Unit!6228)

(declare-fun lt!148236 () Unit!6228)

(assert (=> b!101891 (= lt!148241 lt!148236)))

(declare-fun lt!148202 () (_ BitVec 64))

(assert (=> b!101891 (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!148221)))) ((_ sign_extend 32) (currentByte!5002 (_2!4381 lt!147418))) ((_ sign_extend 32) (currentBit!4997 (_2!4381 lt!147418))) lt!148202)))

(assert (=> b!101891 (= lt!148236 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4381 lt!147418) (buf!2535 (_2!4381 lt!148221)) lt!148202))))

(declare-fun e!66611 () Bool)

(assert (=> b!101891 e!66611))

(declare-fun res!83738 () Bool)

(assert (=> b!101891 (=> (not res!83738) (not e!66611))))

(assert (=> b!101891 (= res!83738 (and (= (size!2178 (buf!2535 (_2!4381 lt!147418))) (size!2178 (buf!2535 (_2!4381 lt!148221)))) (bvsge lt!148202 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101891 (= lt!148202 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!101891 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!101891 (= lt!148215 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!101891 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!101891 (= lt!148228 (reader!0 (_2!4381 lt!147418) (_2!4381 lt!148221)))))

(declare-fun b!101902 () Bool)

(assert (=> b!101902 (= e!66611 (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!147418)))) ((_ sign_extend 32) (currentByte!5002 (_2!4381 lt!147418))) ((_ sign_extend 32) (currentBit!4997 (_2!4381 lt!147418))) lt!148202))))

(declare-fun b!101903 () Bool)

(declare-fun res!83740 () Bool)

(assert (=> b!101903 (=> (not res!83740) (not e!66612))))

(assert (=> b!101903 (= res!83740 (isPrefixOf!0 (_2!4381 lt!147418) (_2!4381 lt!148221)))))

(assert (= (and d!31742 c!6355) b!101894))

(assert (= (and d!31742 (not c!6355)) b!101895))

(assert (= (and b!101894 res!83736) b!101898))

(assert (= (and b!101898 res!83733) b!101899))

(assert (= (and b!101899 res!83739) b!101901))

(assert (= (and b!101901 res!83732) b!101896))

(assert (= (and b!101894 res!83737) b!101897))

(assert (= (and b!101894 c!6354) b!101900))

(assert (= (and b!101894 (not c!6354)) b!101892))

(assert (= (or b!101899 b!101895) bm!1270))

(assert (= (and d!31742 res!83735) b!101893))

(assert (= (and b!101893 res!83734) b!101903))

(assert (= (and b!101903 res!83740) b!101891))

(assert (= (and b!101891 res!83738) b!101902))

(declare-fun m!148299 () Bool)

(assert (=> b!101893 m!148299))

(assert (=> b!101893 m!147765))

(declare-fun m!148301 () Bool)

(assert (=> b!101903 m!148301))

(declare-fun m!148303 () Bool)

(assert (=> b!101894 m!148303))

(declare-fun m!148305 () Bool)

(assert (=> b!101894 m!148305))

(declare-fun m!148307 () Bool)

(assert (=> b!101894 m!148307))

(declare-fun m!148309 () Bool)

(assert (=> b!101894 m!148309))

(declare-fun m!148311 () Bool)

(assert (=> b!101894 m!148311))

(declare-fun m!148313 () Bool)

(assert (=> b!101894 m!148313))

(declare-fun m!148315 () Bool)

(assert (=> b!101894 m!148315))

(declare-fun m!148317 () Bool)

(assert (=> b!101894 m!148317))

(declare-fun m!148319 () Bool)

(assert (=> b!101894 m!148319))

(declare-fun m!148321 () Bool)

(assert (=> b!101894 m!148321))

(declare-fun m!148323 () Bool)

(assert (=> b!101894 m!148323))

(declare-fun m!148325 () Bool)

(assert (=> b!101894 m!148325))

(declare-fun m!148327 () Bool)

(assert (=> b!101894 m!148327))

(declare-fun m!148329 () Bool)

(assert (=> b!101894 m!148329))

(declare-fun m!148331 () Bool)

(assert (=> b!101894 m!148331))

(declare-fun m!148333 () Bool)

(assert (=> b!101894 m!148333))

(declare-fun m!148335 () Bool)

(assert (=> b!101894 m!148335))

(declare-fun m!148337 () Bool)

(assert (=> b!101894 m!148337))

(declare-fun m!148339 () Bool)

(assert (=> b!101894 m!148339))

(assert (=> b!101894 m!148325))

(declare-fun m!148341 () Bool)

(assert (=> b!101894 m!148341))

(declare-fun m!148343 () Bool)

(assert (=> b!101894 m!148343))

(declare-fun m!148345 () Bool)

(assert (=> b!101894 m!148345))

(declare-fun m!148347 () Bool)

(assert (=> b!101894 m!148347))

(declare-fun m!148349 () Bool)

(assert (=> b!101894 m!148349))

(assert (=> b!101894 m!147765))

(declare-fun m!148351 () Bool)

(assert (=> b!101894 m!148351))

(declare-fun m!148353 () Bool)

(assert (=> b!101894 m!148353))

(declare-fun m!148355 () Bool)

(assert (=> b!101894 m!148355))

(declare-fun m!148357 () Bool)

(assert (=> b!101894 m!148357))

(declare-fun m!148359 () Bool)

(assert (=> b!101902 m!148359))

(declare-fun m!148361 () Bool)

(assert (=> b!101898 m!148361))

(assert (=> b!101898 m!147765))

(declare-fun m!148363 () Bool)

(assert (=> b!101895 m!148363))

(declare-fun m!148365 () Bool)

(assert (=> b!101896 m!148365))

(assert (=> b!101896 m!148361))

(declare-fun m!148367 () Bool)

(assert (=> b!101901 m!148367))

(assert (=> b!101901 m!148367))

(declare-fun m!148369 () Bool)

(assert (=> b!101901 m!148369))

(declare-fun m!148371 () Bool)

(assert (=> bm!1270 m!148371))

(declare-fun m!148373 () Bool)

(assert (=> b!101891 m!148373))

(declare-fun m!148375 () Bool)

(assert (=> b!101891 m!148375))

(declare-fun m!148377 () Bool)

(assert (=> b!101891 m!148377))

(assert (=> b!101891 m!148349))

(declare-fun m!148379 () Bool)

(assert (=> b!101891 m!148379))

(assert (=> b!101603 d!31742))

(declare-fun d!31820 () Bool)

(declare-fun e!66616 () Bool)

(assert (=> d!31820 e!66616))

(declare-fun res!83748 () Bool)

(assert (=> d!31820 (=> (not res!83748) (not e!66616))))

(declare-fun lt!148266 () (_ BitVec 64))

(declare-fun lt!148267 () (_ BitVec 64))

(declare-fun lt!148262 () (_ BitVec 64))

(assert (=> d!31820 (= res!83748 (= lt!148266 (bvsub lt!148262 lt!148267)))))

(assert (=> d!31820 (or (= (bvand lt!148262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148267 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!148262 lt!148267) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31820 (= lt!148267 (remainingBits!0 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4379 lt!147423)))) ((_ sign_extend 32) (currentByte!5002 (_1!4379 lt!147423))) ((_ sign_extend 32) (currentBit!4997 (_1!4379 lt!147423)))))))

(declare-fun lt!148263 () (_ BitVec 64))

(declare-fun lt!148264 () (_ BitVec 64))

(assert (=> d!31820 (= lt!148262 (bvmul lt!148263 lt!148264))))

(assert (=> d!31820 (or (= lt!148263 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!148264 (bvsdiv (bvmul lt!148263 lt!148264) lt!148263)))))

(assert (=> d!31820 (= lt!148264 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31820 (= lt!148263 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4379 lt!147423)))))))

(assert (=> d!31820 (= lt!148266 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5002 (_1!4379 lt!147423))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4997 (_1!4379 lt!147423)))))))

(assert (=> d!31820 (invariant!0 (currentBit!4997 (_1!4379 lt!147423)) (currentByte!5002 (_1!4379 lt!147423)) (size!2178 (buf!2535 (_1!4379 lt!147423))))))

(assert (=> d!31820 (= (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!147423))) (currentByte!5002 (_1!4379 lt!147423)) (currentBit!4997 (_1!4379 lt!147423))) lt!148266)))

(declare-fun b!101910 () Bool)

(declare-fun res!83747 () Bool)

(assert (=> b!101910 (=> (not res!83747) (not e!66616))))

(assert (=> b!101910 (= res!83747 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!148266))))

(declare-fun b!101911 () Bool)

(declare-fun lt!148265 () (_ BitVec 64))

(assert (=> b!101911 (= e!66616 (bvsle lt!148266 (bvmul lt!148265 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101911 (or (= lt!148265 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!148265 #b0000000000000000000000000000000000000000000000000000000000001000) lt!148265)))))

(assert (=> b!101911 (= lt!148265 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4379 lt!147423)))))))

(assert (= (and d!31820 res!83748) b!101910))

(assert (= (and b!101910 res!83747) b!101911))

(declare-fun m!148381 () Bool)

(assert (=> d!31820 m!148381))

(declare-fun m!148383 () Bool)

(assert (=> d!31820 m!148383))

(assert (=> b!101603 d!31820))

(declare-fun d!31822 () Bool)

(declare-fun e!66617 () Bool)

(assert (=> d!31822 e!66617))

(declare-fun res!83750 () Bool)

(assert (=> d!31822 (=> (not res!83750) (not e!66617))))

(declare-fun lt!148272 () (_ BitVec 64))

(declare-fun lt!148273 () (_ BitVec 64))

(declare-fun lt!148268 () (_ BitVec 64))

(assert (=> d!31822 (= res!83750 (= lt!148272 (bvsub lt!148268 lt!148273)))))

(assert (=> d!31822 (or (= (bvand lt!148268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148273 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!148268 lt!148273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31822 (= lt!148273 (remainingBits!0 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4379 lt!147424)))) ((_ sign_extend 32) (currentByte!5002 (_1!4379 lt!147424))) ((_ sign_extend 32) (currentBit!4997 (_1!4379 lt!147424)))))))

(declare-fun lt!148269 () (_ BitVec 64))

(declare-fun lt!148270 () (_ BitVec 64))

(assert (=> d!31822 (= lt!148268 (bvmul lt!148269 lt!148270))))

(assert (=> d!31822 (or (= lt!148269 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!148270 (bvsdiv (bvmul lt!148269 lt!148270) lt!148269)))))

(assert (=> d!31822 (= lt!148270 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31822 (= lt!148269 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4379 lt!147424)))))))

(assert (=> d!31822 (= lt!148272 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5002 (_1!4379 lt!147424))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4997 (_1!4379 lt!147424)))))))

(assert (=> d!31822 (invariant!0 (currentBit!4997 (_1!4379 lt!147424)) (currentByte!5002 (_1!4379 lt!147424)) (size!2178 (buf!2535 (_1!4379 lt!147424))))))

(assert (=> d!31822 (= (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!147424))) (currentByte!5002 (_1!4379 lt!147424)) (currentBit!4997 (_1!4379 lt!147424))) lt!148272)))

(declare-fun b!101912 () Bool)

(declare-fun res!83749 () Bool)

(assert (=> b!101912 (=> (not res!83749) (not e!66617))))

(assert (=> b!101912 (= res!83749 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!148272))))

(declare-fun b!101913 () Bool)

(declare-fun lt!148271 () (_ BitVec 64))

(assert (=> b!101913 (= e!66617 (bvsle lt!148272 (bvmul lt!148271 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101913 (or (= lt!148271 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!148271 #b0000000000000000000000000000000000000000000000000000000000001000) lt!148271)))))

(assert (=> b!101913 (= lt!148271 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4379 lt!147424)))))))

(assert (= (and d!31822 res!83750) b!101912))

(assert (= (and b!101912 res!83749) b!101913))

(declare-fun m!148385 () Bool)

(assert (=> d!31822 m!148385))

(declare-fun m!148387 () Bool)

(assert (=> d!31822 m!148387))

(assert (=> b!101603 d!31822))

(declare-fun d!31824 () Bool)

(declare-fun lt!148274 () tuple2!8262)

(assert (=> d!31824 (= lt!148274 (readBit!0 (BitStream!3831 (buf!2535 (_2!4381 lt!147414)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305))))))

(assert (=> d!31824 (= (readBitPure!0 (BitStream!3831 (buf!2535 (_2!4381 lt!147414)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305))) (tuple2!8249 (_2!4386 lt!148274) (_1!4386 lt!148274)))))

(declare-fun bs!7792 () Bool)

(assert (= bs!7792 d!31824))

(declare-fun m!148389 () Bool)

(assert (=> bs!7792 m!148389))

(assert (=> b!101603 d!31824))

(declare-fun d!31826 () Bool)

(assert (=> d!31826 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!147414)))) ((_ sign_extend 32) (currentByte!5002 thiss!1305)) ((_ sign_extend 32) (currentBit!4997 thiss!1305)) lt!147426) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2178 (buf!2535 (_2!4381 lt!147414)))) ((_ sign_extend 32) (currentByte!5002 thiss!1305)) ((_ sign_extend 32) (currentBit!4997 thiss!1305))) lt!147426))))

(declare-fun bs!7793 () Bool)

(assert (= bs!7793 d!31826))

(declare-fun m!148391 () Bool)

(assert (=> bs!7793 m!148391))

(assert (=> b!101603 d!31826))

(declare-fun b!101914 () Bool)

(declare-fun res!83751 () Bool)

(declare-fun e!66618 () Bool)

(assert (=> b!101914 (=> (not res!83751) (not e!66618))))

(declare-fun lt!148276 () tuple2!8250)

(assert (=> b!101914 (= res!83751 (isPrefixOf!0 (_2!4380 lt!148276) (_2!4381 lt!147414)))))

(declare-fun lt!148281 () (_ BitVec 64))

(declare-fun b!101915 () Bool)

(declare-fun lt!148283 () (_ BitVec 64))

(assert (=> b!101915 (= e!66618 (= (_1!4380 lt!148276) (withMovedBitIndex!0 (_2!4380 lt!148276) (bvsub lt!148283 lt!148281))))))

(assert (=> b!101915 (or (= (bvand lt!148283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148281 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!148283 lt!148281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101915 (= lt!148281 (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147414))) (currentByte!5002 (_2!4381 lt!147414)) (currentBit!4997 (_2!4381 lt!147414))))))

(assert (=> b!101915 (= lt!148283 (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147418))) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418))))))

(declare-fun b!101916 () Bool)

(declare-fun res!83752 () Bool)

(assert (=> b!101916 (=> (not res!83752) (not e!66618))))

(assert (=> b!101916 (= res!83752 (isPrefixOf!0 (_1!4380 lt!148276) (_2!4381 lt!147418)))))

(declare-fun b!101917 () Bool)

(declare-fun e!66619 () Unit!6228)

(declare-fun Unit!6253 () Unit!6228)

(assert (=> b!101917 (= e!66619 Unit!6253)))

(declare-fun d!31828 () Bool)

(assert (=> d!31828 e!66618))

(declare-fun res!83753 () Bool)

(assert (=> d!31828 (=> (not res!83753) (not e!66618))))

(assert (=> d!31828 (= res!83753 (isPrefixOf!0 (_1!4380 lt!148276) (_2!4380 lt!148276)))))

(declare-fun lt!148289 () BitStream!3830)

(assert (=> d!31828 (= lt!148276 (tuple2!8251 lt!148289 (_2!4381 lt!147414)))))

(declare-fun lt!148293 () Unit!6228)

(declare-fun lt!148280 () Unit!6228)

(assert (=> d!31828 (= lt!148293 lt!148280)))

(assert (=> d!31828 (isPrefixOf!0 lt!148289 (_2!4381 lt!147414))))

(assert (=> d!31828 (= lt!148280 (lemmaIsPrefixTransitive!0 lt!148289 (_2!4381 lt!147414) (_2!4381 lt!147414)))))

(declare-fun lt!148275 () Unit!6228)

(declare-fun lt!148292 () Unit!6228)

(assert (=> d!31828 (= lt!148275 lt!148292)))

(assert (=> d!31828 (isPrefixOf!0 lt!148289 (_2!4381 lt!147414))))

(assert (=> d!31828 (= lt!148292 (lemmaIsPrefixTransitive!0 lt!148289 (_2!4381 lt!147418) (_2!4381 lt!147414)))))

(declare-fun lt!148287 () Unit!6228)

(assert (=> d!31828 (= lt!148287 e!66619)))

(declare-fun c!6356 () Bool)

(assert (=> d!31828 (= c!6356 (not (= (size!2178 (buf!2535 (_2!4381 lt!147418))) #b00000000000000000000000000000000)))))

(declare-fun lt!148277 () Unit!6228)

(declare-fun lt!148282 () Unit!6228)

(assert (=> d!31828 (= lt!148277 lt!148282)))

(assert (=> d!31828 (isPrefixOf!0 (_2!4381 lt!147414) (_2!4381 lt!147414))))

(assert (=> d!31828 (= lt!148282 (lemmaIsPrefixRefl!0 (_2!4381 lt!147414)))))

(declare-fun lt!148288 () Unit!6228)

(declare-fun lt!148284 () Unit!6228)

(assert (=> d!31828 (= lt!148288 lt!148284)))

(assert (=> d!31828 (= lt!148284 (lemmaIsPrefixRefl!0 (_2!4381 lt!147414)))))

(declare-fun lt!148290 () Unit!6228)

(declare-fun lt!148279 () Unit!6228)

(assert (=> d!31828 (= lt!148290 lt!148279)))

(assert (=> d!31828 (isPrefixOf!0 lt!148289 lt!148289)))

(assert (=> d!31828 (= lt!148279 (lemmaIsPrefixRefl!0 lt!148289))))

(declare-fun lt!148294 () Unit!6228)

(declare-fun lt!148291 () Unit!6228)

(assert (=> d!31828 (= lt!148294 lt!148291)))

(assert (=> d!31828 (isPrefixOf!0 (_2!4381 lt!147418) (_2!4381 lt!147418))))

(assert (=> d!31828 (= lt!148291 (lemmaIsPrefixRefl!0 (_2!4381 lt!147418)))))

(assert (=> d!31828 (= lt!148289 (BitStream!3831 (buf!2535 (_2!4381 lt!147414)) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418))))))

(assert (=> d!31828 (isPrefixOf!0 (_2!4381 lt!147418) (_2!4381 lt!147414))))

(assert (=> d!31828 (= (reader!0 (_2!4381 lt!147418) (_2!4381 lt!147414)) lt!148276)))

(declare-fun b!101918 () Bool)

(declare-fun lt!148286 () Unit!6228)

(assert (=> b!101918 (= e!66619 lt!148286)))

(declare-fun lt!148278 () (_ BitVec 64))

(assert (=> b!101918 (= lt!148278 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!148285 () (_ BitVec 64))

(assert (=> b!101918 (= lt!148285 (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147418))) (currentByte!5002 (_2!4381 lt!147418)) (currentBit!4997 (_2!4381 lt!147418))))))

(assert (=> b!101918 (= lt!148286 (arrayBitRangesEqSymmetric!0 (buf!2535 (_2!4381 lt!147418)) (buf!2535 (_2!4381 lt!147414)) lt!148278 lt!148285))))

(assert (=> b!101918 (arrayBitRangesEq!0 (buf!2535 (_2!4381 lt!147414)) (buf!2535 (_2!4381 lt!147418)) lt!148278 lt!148285)))

(assert (= (and d!31828 c!6356) b!101918))

(assert (= (and d!31828 (not c!6356)) b!101917))

(assert (= (and d!31828 res!83753) b!101916))

(assert (= (and b!101916 res!83752) b!101914))

(assert (= (and b!101914 res!83751) b!101915))

(declare-fun m!148393 () Bool)

(assert (=> b!101914 m!148393))

(assert (=> b!101918 m!147765))

(declare-fun m!148395 () Bool)

(assert (=> b!101918 m!148395))

(declare-fun m!148397 () Bool)

(assert (=> b!101918 m!148397))

(declare-fun m!148399 () Bool)

(assert (=> b!101915 m!148399))

(assert (=> b!101915 m!147881))

(assert (=> b!101915 m!147765))

(declare-fun m!148401 () Bool)

(assert (=> b!101916 m!148401))

(declare-fun m!148403 () Bool)

(assert (=> d!31828 m!148403))

(declare-fun m!148405 () Bool)

(assert (=> d!31828 m!148405))

(declare-fun m!148407 () Bool)

(assert (=> d!31828 m!148407))

(declare-fun m!148409 () Bool)

(assert (=> d!31828 m!148409))

(declare-fun m!148411 () Bool)

(assert (=> d!31828 m!148411))

(declare-fun m!148413 () Bool)

(assert (=> d!31828 m!148413))

(declare-fun m!148415 () Bool)

(assert (=> d!31828 m!148415))

(declare-fun m!148417 () Bool)

(assert (=> d!31828 m!148417))

(assert (=> d!31828 m!147901))

(declare-fun m!148419 () Bool)

(assert (=> d!31828 m!148419))

(assert (=> d!31828 m!147903))

(assert (=> b!101603 d!31828))

(declare-fun d!31830 () Bool)

(declare-fun res!83755 () Bool)

(declare-fun e!66620 () Bool)

(assert (=> d!31830 (=> (not res!83755) (not e!66620))))

(assert (=> d!31830 (= res!83755 (= (size!2178 (buf!2535 thiss!1305)) (size!2178 (buf!2535 (_2!4381 lt!147414)))))))

(assert (=> d!31830 (= (isPrefixOf!0 thiss!1305 (_2!4381 lt!147414)) e!66620)))

(declare-fun b!101919 () Bool)

(declare-fun res!83756 () Bool)

(assert (=> b!101919 (=> (not res!83756) (not e!66620))))

(assert (=> b!101919 (= res!83756 (bvsle (bitIndex!0 (size!2178 (buf!2535 thiss!1305)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305)) (bitIndex!0 (size!2178 (buf!2535 (_2!4381 lt!147414))) (currentByte!5002 (_2!4381 lt!147414)) (currentBit!4997 (_2!4381 lt!147414)))))))

(declare-fun b!101920 () Bool)

(declare-fun e!66621 () Bool)

(assert (=> b!101920 (= e!66620 e!66621)))

(declare-fun res!83754 () Bool)

(assert (=> b!101920 (=> res!83754 e!66621)))

(assert (=> b!101920 (= res!83754 (= (size!2178 (buf!2535 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!101921 () Bool)

(assert (=> b!101921 (= e!66621 (arrayBitRangesEq!0 (buf!2535 thiss!1305) (buf!2535 (_2!4381 lt!147414)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2178 (buf!2535 thiss!1305)) (currentByte!5002 thiss!1305) (currentBit!4997 thiss!1305))))))

(assert (= (and d!31830 res!83755) b!101919))

(assert (= (and b!101919 res!83756) b!101920))

(assert (= (and b!101920 (not res!83754)) b!101921))

(assert (=> b!101919 m!147767))

(assert (=> b!101919 m!147881))

(assert (=> b!101921 m!147767))

(assert (=> b!101921 m!147767))

(declare-fun m!148421 () Bool)

(assert (=> b!101921 m!148421))

(assert (=> b!101603 d!31830))

(declare-fun d!31832 () Bool)

(assert (=> d!31832 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4380 lt!147417)))) ((_ sign_extend 32) (currentByte!5002 (_1!4380 lt!147417))) ((_ sign_extend 32) (currentBit!4997 (_1!4380 lt!147417))) lt!147426) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2178 (buf!2535 (_1!4380 lt!147417)))) ((_ sign_extend 32) (currentByte!5002 (_1!4380 lt!147417))) ((_ sign_extend 32) (currentBit!4997 (_1!4380 lt!147417)))) lt!147426))))

(declare-fun bs!7794 () Bool)

(assert (= bs!7794 d!31832))

(declare-fun m!148423 () Bool)

(assert (=> bs!7794 m!148423))

(assert (=> b!101603 d!31832))

(declare-fun d!31834 () Bool)

(declare-fun e!66624 () Bool)

(assert (=> d!31834 e!66624))

(declare-fun res!83759 () Bool)

(assert (=> d!31834 (=> (not res!83759) (not e!66624))))

(declare-fun lt!148306 () tuple2!8248)

(declare-fun lt!148305 () tuple2!8248)

(assert (=> d!31834 (= res!83759 (= (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!148306))) (currentByte!5002 (_1!4379 lt!148306)) (currentBit!4997 (_1!4379 lt!148306))) (bitIndex!0 (size!2178 (buf!2535 (_1!4379 lt!148305))) (currentByte!5002 (_1!4379 lt!148305)) (currentBit!4997 (_1!4379 lt!148305)))))))

(declare-fun lt!148304 () BitStream!3830)

(declare-fun lt!148303 () Unit!6228)

(declare-fun choose!50 (BitStream!3830 BitStream!3830 BitStream!3830 tuple2!8248 tuple2!8248 BitStream!3830 Bool tuple2!8248 tuple2!8248 BitStream!3830 Bool) Unit!6228)

(assert (=> d!31834 (= lt!148303 (choose!50 lt!147427 (_2!4381 lt!147414) lt!148304 lt!148306 (tuple2!8249 (_1!4379 lt!148306) (_2!4379 lt!148306)) (_1!4379 lt!148306) (_2!4379 lt!148306) lt!148305 (tuple2!8249 (_1!4379 lt!148305) (_2!4379 lt!148305)) (_1!4379 lt!148305) (_2!4379 lt!148305)))))

(assert (=> d!31834 (= lt!148305 (readBitPure!0 lt!148304))))

(assert (=> d!31834 (= lt!148306 (readBitPure!0 lt!147427))))

(assert (=> d!31834 (= lt!148304 (BitStream!3831 (buf!2535 (_2!4381 lt!147414)) (currentByte!5002 lt!147427) (currentBit!4997 lt!147427)))))

(assert (=> d!31834 (invariant!0 (currentBit!4997 lt!147427) (currentByte!5002 lt!147427) (size!2178 (buf!2535 (_2!4381 lt!147414))))))

(assert (=> d!31834 (= (readBitPrefixLemma!0 lt!147427 (_2!4381 lt!147414)) lt!148303)))

(declare-fun b!101924 () Bool)

(assert (=> b!101924 (= e!66624 (= (_2!4379 lt!148306) (_2!4379 lt!148305)))))

(assert (= (and d!31834 res!83759) b!101924))

(assert (=> d!31834 m!147789))

(declare-fun m!148425 () Bool)

(assert (=> d!31834 m!148425))

(declare-fun m!148427 () Bool)

(assert (=> d!31834 m!148427))

(declare-fun m!148429 () Bool)

(assert (=> d!31834 m!148429))

(declare-fun m!148431 () Bool)

(assert (=> d!31834 m!148431))

(declare-fun m!148433 () Bool)

(assert (=> d!31834 m!148433))

(assert (=> b!101603 d!31834))

(declare-fun d!31836 () Bool)

(assert (=> d!31836 (= (invariant!0 (currentBit!4997 thiss!1305) (currentByte!5002 thiss!1305) (size!2178 (buf!2535 (_2!4381 lt!147414)))) (and (bvsge (currentBit!4997 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4997 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5002 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5002 thiss!1305) (size!2178 (buf!2535 (_2!4381 lt!147414)))) (and (= (currentBit!4997 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5002 thiss!1305) (size!2178 (buf!2535 (_2!4381 lt!147414))))))))))

(assert (=> b!101605 d!31836))

(push 1)

(assert (not b!101914))

(assert (not b!101702))

(assert (not d!31718))

(assert (not b!101674))

(assert (not b!101902))

(assert (not d!31822))

(assert (not b!101915))

(assert (not b!101919))

(assert (not bm!1270))

(assert (not d!31820))

(assert (not b!101688))

(assert (not d!31828))

(assert (not b!101676))

(assert (not b!101903))

(assert (not b!101703))

(assert (not d!31740))

(assert (not b!101704))

(assert (not d!31716))

(assert (not d!31708))

(assert (not b!101891))

(assert (not b!101894))

(assert (not d!31824))

(assert (not d!31714))

(assert (not b!101687))

(assert (not b!101689))

(assert (not d!31734))

(assert (not b!101893))

(assert (not b!101667))

(assert (not d!31834))

(assert (not b!101896))

(assert (not d!31730))

(assert (not d!31826))

(assert (not d!31732))

(assert (not b!101691))

(assert (not b!101916))

(assert (not d!31738))

(assert (not d!31710))

(assert (not d!31712))

(assert (not d!31832))

(assert (not b!101901))

(assert (not d!31736))

(assert (not b!101898))

(assert (not b!101895))

(assert (not d!31728))

(assert (not b!101701))

(assert (not b!101918))

(assert (not b!101921))

(check-sat)

(pop 1)

(push 1)

(check-sat)

