; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20236 () Bool)

(assert start!20236)

(declare-fun res!83431 () Bool)

(declare-fun e!66396 () Bool)

(assert (=> start!20236 (=> (not res!83431) (not e!66396))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20236 (= res!83431 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20236 e!66396))

(assert (=> start!20236 true))

(declare-datatypes ((array!4767 0))(
  ( (array!4768 (arr!2769 (Array (_ BitVec 32) (_ BitVec 8))) (size!2176 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3826 0))(
  ( (BitStream!3827 (buf!2533 array!4767) (currentByte!5000 (_ BitVec 32)) (currentBit!4995 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3826)

(declare-fun e!66399 () Bool)

(declare-fun inv!12 (BitStream!3826) Bool)

(assert (=> start!20236 (and (inv!12 thiss!1305) e!66399)))

(declare-fun b!101529 () Bool)

(declare-fun e!66398 () Bool)

(declare-datatypes ((tuple2!8236 0))(
  ( (tuple2!8237 (_1!4373 BitStream!3826) (_2!4373 Bool)) )
))
(declare-fun lt!147324 () tuple2!8236)

(declare-fun lt!147336 () tuple2!8236)

(assert (=> b!101529 (= e!66398 (= (_2!4373 lt!147324) (_2!4373 lt!147336)))))

(declare-fun b!101530 () Bool)

(declare-fun res!83439 () Bool)

(declare-fun e!66401 () Bool)

(assert (=> b!101530 (=> (not res!83439) (not e!66401))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101530 (= res!83439 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101531 () Bool)

(declare-fun e!66395 () Bool)

(declare-fun e!66402 () Bool)

(assert (=> b!101531 (= e!66395 e!66402)))

(declare-fun res!83440 () Bool)

(assert (=> b!101531 (=> (not res!83440) (not e!66402))))

(declare-datatypes ((Unit!6224 0))(
  ( (Unit!6225) )
))
(declare-datatypes ((tuple2!8238 0))(
  ( (tuple2!8239 (_1!4374 Unit!6224) (_2!4374 BitStream!3826)) )
))
(declare-fun lt!147333 () tuple2!8238)

(declare-fun lt!147329 () Bool)

(declare-fun lt!147334 () tuple2!8236)

(assert (=> b!101531 (= res!83440 (and (= (_2!4373 lt!147334) lt!147329) (= (_1!4373 lt!147334) (_2!4374 lt!147333))))))

(declare-fun readBitPure!0 (BitStream!3826) tuple2!8236)

(declare-fun readerFrom!0 (BitStream!3826 (_ BitVec 32) (_ BitVec 32)) BitStream!3826)

(assert (=> b!101531 (= lt!147334 (readBitPure!0 (readerFrom!0 (_2!4374 lt!147333) (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305))))))

(declare-fun b!101532 () Bool)

(declare-fun res!83437 () Bool)

(assert (=> b!101532 (=> (not res!83437) (not e!66395))))

(declare-fun isPrefixOf!0 (BitStream!3826 BitStream!3826) Bool)

(assert (=> b!101532 (= res!83437 (isPrefixOf!0 thiss!1305 (_2!4374 lt!147333)))))

(declare-fun b!101533 () Bool)

(declare-fun lt!147330 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101533 (= e!66402 (= (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!147334))) (currentByte!5000 (_1!4373 lt!147334)) (currentBit!4995 (_1!4373 lt!147334))) lt!147330))))

(declare-fun b!101534 () Bool)

(declare-fun res!83441 () Bool)

(declare-fun e!66397 () Bool)

(assert (=> b!101534 (=> (not res!83441) (not e!66397))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101534 (= res!83441 (invariant!0 (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305) (size!2176 (buf!2533 (_2!4374 lt!147333)))))))

(declare-fun b!101535 () Bool)

(declare-fun lt!147323 () tuple2!8238)

(assert (=> b!101535 (= e!66397 (invariant!0 (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305) (size!2176 (buf!2533 (_2!4374 lt!147323)))))))

(declare-fun b!101536 () Bool)

(declare-fun res!83432 () Bool)

(assert (=> b!101536 (=> (not res!83432) (not e!66401))))

(assert (=> b!101536 (= res!83432 (bvslt i!615 nBits!396))))

(declare-fun b!101537 () Bool)

(declare-fun array_inv!1978 (array!4767) Bool)

(assert (=> b!101537 (= e!66399 (array_inv!1978 (buf!2533 thiss!1305)))))

(declare-fun b!101538 () Bool)

(declare-fun e!66394 () Bool)

(assert (=> b!101538 (= e!66394 e!66395)))

(declare-fun res!83433 () Bool)

(assert (=> b!101538 (=> (not res!83433) (not e!66395))))

(declare-fun lt!147328 () (_ BitVec 64))

(assert (=> b!101538 (= res!83433 (= lt!147330 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!147328)))))

(assert (=> b!101538 (= lt!147330 (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147333))) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333))))))

(assert (=> b!101538 (= lt!147328 (bitIndex!0 (size!2176 (buf!2533 thiss!1305)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305)))))

(declare-fun b!101539 () Bool)

(declare-datatypes ((tuple2!8240 0))(
  ( (tuple2!8241 (_1!4375 BitStream!3826) (_2!4375 BitStream!3826)) )
))
(declare-fun lt!147335 () tuple2!8240)

(declare-fun lt!147325 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101539 (= e!66401 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4375 lt!147335)))) ((_ sign_extend 32) (currentByte!5000 (_1!4375 lt!147335))) ((_ sign_extend 32) (currentBit!4995 (_1!4375 lt!147335))) lt!147325)))))

(assert (=> b!101539 (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147323)))) ((_ sign_extend 32) (currentByte!5000 thiss!1305)) ((_ sign_extend 32) (currentBit!4995 thiss!1305)) lt!147325)))

(declare-fun lt!147337 () Unit!6224)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3826 array!4767 (_ BitVec 64)) Unit!6224)

(assert (=> b!101539 (= lt!147337 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2533 (_2!4374 lt!147323)) lt!147325))))

(assert (=> b!101539 (= (_2!4373 (readBitPure!0 (_1!4375 lt!147335))) lt!147329)))

(declare-fun lt!147332 () tuple2!8240)

(declare-fun reader!0 (BitStream!3826 BitStream!3826) tuple2!8240)

(assert (=> b!101539 (= lt!147332 (reader!0 (_2!4374 lt!147333) (_2!4374 lt!147323)))))

(assert (=> b!101539 (= lt!147335 (reader!0 thiss!1305 (_2!4374 lt!147323)))))

(assert (=> b!101539 e!66398))

(declare-fun res!83434 () Bool)

(assert (=> b!101539 (=> (not res!83434) (not e!66398))))

(assert (=> b!101539 (= res!83434 (= (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!147324))) (currentByte!5000 (_1!4373 lt!147324)) (currentBit!4995 (_1!4373 lt!147324))) (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!147336))) (currentByte!5000 (_1!4373 lt!147336)) (currentBit!4995 (_1!4373 lt!147336)))))))

(declare-fun lt!147331 () Unit!6224)

(declare-fun lt!147327 () BitStream!3826)

(declare-fun readBitPrefixLemma!0 (BitStream!3826 BitStream!3826) Unit!6224)

(assert (=> b!101539 (= lt!147331 (readBitPrefixLemma!0 lt!147327 (_2!4374 lt!147323)))))

(assert (=> b!101539 (= lt!147336 (readBitPure!0 (BitStream!3827 (buf!2533 (_2!4374 lt!147323)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305))))))

(assert (=> b!101539 (= lt!147324 (readBitPure!0 lt!147327))))

(assert (=> b!101539 (= lt!147327 (BitStream!3827 (buf!2533 (_2!4374 lt!147333)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305)))))

(assert (=> b!101539 e!66397))

(declare-fun res!83436 () Bool)

(assert (=> b!101539 (=> (not res!83436) (not e!66397))))

(assert (=> b!101539 (= res!83436 (isPrefixOf!0 thiss!1305 (_2!4374 lt!147323)))))

(declare-fun lt!147326 () Unit!6224)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3826 BitStream!3826 BitStream!3826) Unit!6224)

(assert (=> b!101539 (= lt!147326 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4374 lt!147333) (_2!4374 lt!147323)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3826 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8238)

(assert (=> b!101539 (= lt!147323 (appendNLeastSignificantBitsLoop!0 (_2!4374 lt!147333) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!101539 e!66394))

(declare-fun res!83435 () Bool)

(assert (=> b!101539 (=> (not res!83435) (not e!66394))))

(assert (=> b!101539 (= res!83435 (= (size!2176 (buf!2533 thiss!1305)) (size!2176 (buf!2533 (_2!4374 lt!147333)))))))

(declare-fun appendBit!0 (BitStream!3826 Bool) tuple2!8238)

(assert (=> b!101539 (= lt!147333 (appendBit!0 thiss!1305 lt!147329))))

(assert (=> b!101539 (= lt!147329 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101540 () Bool)

(assert (=> b!101540 (= e!66396 e!66401)))

(declare-fun res!83438 () Bool)

(assert (=> b!101540 (=> (not res!83438) (not e!66401))))

(assert (=> b!101540 (= res!83438 (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 thiss!1305))) ((_ sign_extend 32) (currentByte!5000 thiss!1305)) ((_ sign_extend 32) (currentBit!4995 thiss!1305)) lt!147325))))

(assert (=> b!101540 (= lt!147325 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!20236 res!83431) b!101540))

(assert (= (and b!101540 res!83438) b!101530))

(assert (= (and b!101530 res!83439) b!101536))

(assert (= (and b!101536 res!83432) b!101539))

(assert (= (and b!101539 res!83435) b!101538))

(assert (= (and b!101538 res!83433) b!101532))

(assert (= (and b!101532 res!83437) b!101531))

(assert (= (and b!101531 res!83440) b!101533))

(assert (= (and b!101539 res!83436) b!101534))

(assert (= (and b!101534 res!83441) b!101535))

(assert (= (and b!101539 res!83434) b!101529))

(assert (= start!20236 b!101537))

(declare-fun m!147655 () Bool)

(assert (=> b!101532 m!147655))

(declare-fun m!147657 () Bool)

(assert (=> b!101530 m!147657))

(declare-fun m!147659 () Bool)

(assert (=> b!101535 m!147659))

(declare-fun m!147661 () Bool)

(assert (=> b!101537 m!147661))

(declare-fun m!147663 () Bool)

(assert (=> b!101534 m!147663))

(declare-fun m!147665 () Bool)

(assert (=> b!101531 m!147665))

(assert (=> b!101531 m!147665))

(declare-fun m!147667 () Bool)

(assert (=> b!101531 m!147667))

(declare-fun m!147669 () Bool)

(assert (=> b!101538 m!147669))

(declare-fun m!147671 () Bool)

(assert (=> b!101538 m!147671))

(declare-fun m!147673 () Bool)

(assert (=> b!101539 m!147673))

(declare-fun m!147675 () Bool)

(assert (=> b!101539 m!147675))

(declare-fun m!147677 () Bool)

(assert (=> b!101539 m!147677))

(declare-fun m!147679 () Bool)

(assert (=> b!101539 m!147679))

(declare-fun m!147681 () Bool)

(assert (=> b!101539 m!147681))

(declare-fun m!147683 () Bool)

(assert (=> b!101539 m!147683))

(declare-fun m!147685 () Bool)

(assert (=> b!101539 m!147685))

(declare-fun m!147687 () Bool)

(assert (=> b!101539 m!147687))

(declare-fun m!147689 () Bool)

(assert (=> b!101539 m!147689))

(declare-fun m!147691 () Bool)

(assert (=> b!101539 m!147691))

(declare-fun m!147693 () Bool)

(assert (=> b!101539 m!147693))

(declare-fun m!147695 () Bool)

(assert (=> b!101539 m!147695))

(declare-fun m!147697 () Bool)

(assert (=> b!101539 m!147697))

(declare-fun m!147699 () Bool)

(assert (=> b!101539 m!147699))

(declare-fun m!147701 () Bool)

(assert (=> b!101539 m!147701))

(declare-fun m!147703 () Bool)

(assert (=> b!101533 m!147703))

(declare-fun m!147705 () Bool)

(assert (=> start!20236 m!147705))

(declare-fun m!147707 () Bool)

(assert (=> b!101540 m!147707))

(push 1)

(assert (not b!101530))

(assert (not b!101535))

(assert (not b!101534))

(assert (not start!20236))

(assert (not b!101531))

(assert (not b!101539))

(assert (not b!101533))

(assert (not b!101537))

(assert (not b!101538))

(assert (not b!101540))

(assert (not b!101532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31690 () Bool)

(declare-datatypes ((tuple2!8258 0))(
  ( (tuple2!8259 (_1!4384 Bool) (_2!4384 BitStream!3826)) )
))
(declare-fun lt!147472 () tuple2!8258)

(declare-fun readBit!0 (BitStream!3826) tuple2!8258)

(assert (=> d!31690 (= lt!147472 (readBit!0 (readerFrom!0 (_2!4374 lt!147333) (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305))))))

(assert (=> d!31690 (= (readBitPure!0 (readerFrom!0 (_2!4374 lt!147333) (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305))) (tuple2!8237 (_2!4384 lt!147472) (_1!4384 lt!147472)))))

(declare-fun bs!7767 () Bool)

(assert (= bs!7767 d!31690))

(assert (=> bs!7767 m!147665))

(declare-fun m!147847 () Bool)

(assert (=> bs!7767 m!147847))

(assert (=> b!101531 d!31690))

(declare-fun d!31692 () Bool)

(declare-fun e!66475 () Bool)

(assert (=> d!31692 e!66475))

(declare-fun res!83540 () Bool)

(assert (=> d!31692 (=> (not res!83540) (not e!66475))))

(assert (=> d!31692 (= res!83540 (invariant!0 (currentBit!4995 (_2!4374 lt!147333)) (currentByte!5000 (_2!4374 lt!147333)) (size!2176 (buf!2533 (_2!4374 lt!147333)))))))

(assert (=> d!31692 (= (readerFrom!0 (_2!4374 lt!147333) (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305)) (BitStream!3827 (buf!2533 (_2!4374 lt!147333)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305)))))

(declare-fun b!101645 () Bool)

(assert (=> b!101645 (= e!66475 (invariant!0 (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305) (size!2176 (buf!2533 (_2!4374 lt!147333)))))))

(assert (= (and d!31692 res!83540) b!101645))

(declare-fun m!147849 () Bool)

(assert (=> d!31692 m!147849))

(assert (=> b!101645 m!147663))

(assert (=> b!101531 d!31692))

(declare-fun d!31694 () Bool)

(assert (=> d!31694 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305) (size!2176 (buf!2533 thiss!1305))))))

(declare-fun bs!7768 () Bool)

(assert (= bs!7768 d!31694))

(declare-fun m!147851 () Bool)

(assert (=> bs!7768 m!147851))

(assert (=> start!20236 d!31694))

(declare-fun d!31696 () Bool)

(assert (=> d!31696 (= (array_inv!1978 (buf!2533 thiss!1305)) (bvsge (size!2176 (buf!2533 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!101537 d!31696))

(declare-fun d!31698 () Bool)

(declare-fun res!83549 () Bool)

(declare-fun e!66480 () Bool)

(assert (=> d!31698 (=> (not res!83549) (not e!66480))))

(assert (=> d!31698 (= res!83549 (= (size!2176 (buf!2533 thiss!1305)) (size!2176 (buf!2533 (_2!4374 lt!147333)))))))

(assert (=> d!31698 (= (isPrefixOf!0 thiss!1305 (_2!4374 lt!147333)) e!66480)))

(declare-fun b!101652 () Bool)

(declare-fun res!83548 () Bool)

(assert (=> b!101652 (=> (not res!83548) (not e!66480))))

(assert (=> b!101652 (= res!83548 (bvsle (bitIndex!0 (size!2176 (buf!2533 thiss!1305)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305)) (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147333))) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333)))))))

(declare-fun b!101653 () Bool)

(declare-fun e!66481 () Bool)

(assert (=> b!101653 (= e!66480 e!66481)))

(declare-fun res!83547 () Bool)

(assert (=> b!101653 (=> res!83547 e!66481)))

(assert (=> b!101653 (= res!83547 (= (size!2176 (buf!2533 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!101654 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4767 array!4767 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101654 (= e!66481 (arrayBitRangesEq!0 (buf!2533 thiss!1305) (buf!2533 (_2!4374 lt!147333)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2176 (buf!2533 thiss!1305)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305))))))

(assert (= (and d!31698 res!83549) b!101652))

(assert (= (and b!101652 res!83548) b!101653))

(assert (= (and b!101653 (not res!83547)) b!101654))

(assert (=> b!101652 m!147671))

(assert (=> b!101652 m!147669))

(assert (=> b!101654 m!147671))

(assert (=> b!101654 m!147671))

(declare-fun m!147853 () Bool)

(assert (=> b!101654 m!147853))

(assert (=> b!101532 d!31698))

(declare-fun d!31700 () Bool)

(assert (=> d!31700 (= (invariant!0 (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305) (size!2176 (buf!2533 (_2!4374 lt!147323)))) (and (bvsge (currentBit!4995 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4995 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5000 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5000 thiss!1305) (size!2176 (buf!2533 (_2!4374 lt!147323)))) (and (= (currentBit!4995 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5000 thiss!1305) (size!2176 (buf!2533 (_2!4374 lt!147323))))))))))

(assert (=> b!101535 d!31700))

(declare-fun d!31702 () Bool)

(assert (=> d!31702 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!101530 d!31702))

(declare-fun d!31704 () Bool)

(declare-fun lt!147473 () tuple2!8258)

(assert (=> d!31704 (= lt!147473 (readBit!0 (_1!4375 lt!147335)))))

(assert (=> d!31704 (= (readBitPure!0 (_1!4375 lt!147335)) (tuple2!8237 (_2!4384 lt!147473) (_1!4384 lt!147473)))))

(declare-fun bs!7769 () Bool)

(assert (= bs!7769 d!31704))

(declare-fun m!147855 () Bool)

(assert (=> bs!7769 m!147855))

(assert (=> b!101539 d!31704))

(declare-fun b!101805 () Bool)

(declare-fun e!66568 () (_ BitVec 64))

(assert (=> b!101805 (= e!66568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!147972 () tuple2!8238)

(declare-fun bm!1267 () Bool)

(declare-fun lt!147932 () BitStream!3826)

(declare-fun c!6345 () Bool)

(declare-fun call!1270 () Bool)

(assert (=> bm!1267 (= call!1270 (isPrefixOf!0 (ite c!6345 (_2!4374 lt!147333) lt!147932) (ite c!6345 (_2!4374 lt!147972) lt!147932)))))

(declare-fun b!101806 () Bool)

(declare-fun res!83675 () Bool)

(declare-fun lt!147967 () tuple2!8238)

(assert (=> b!101806 (= res!83675 (isPrefixOf!0 (_2!4374 lt!147333) (_2!4374 lt!147967)))))

(declare-fun e!66565 () Bool)

(assert (=> b!101806 (=> (not res!83675) (not e!66565))))

(declare-fun b!101807 () Bool)

(declare-fun e!66564 () tuple2!8238)

(declare-fun lt!147961 () Unit!6224)

(assert (=> b!101807 (= e!66564 (tuple2!8239 lt!147961 (_2!4374 lt!147333)))))

(assert (=> b!101807 (= lt!147932 (_2!4374 lt!147333))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3826) Unit!6224)

(assert (=> b!101807 (= lt!147961 (lemmaIsPrefixRefl!0 lt!147932))))

(assert (=> b!101807 call!1270))

(declare-fun b!101808 () Bool)

(declare-fun res!83669 () Bool)

(declare-fun e!66567 () Bool)

(assert (=> b!101808 (=> (not res!83669) (not e!66567))))

(declare-fun lt!147934 () (_ BitVec 64))

(declare-fun lt!147933 () tuple2!8238)

(declare-fun lt!147935 () (_ BitVec 64))

(assert (=> b!101808 (= res!83669 (= (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147933))) (currentByte!5000 (_2!4374 lt!147933)) (currentBit!4995 (_2!4374 lt!147933))) (bvadd lt!147935 lt!147934)))))

(assert (=> b!101808 (or (not (= (bvand lt!147935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147934 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!147935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!147935 lt!147934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101808 (= lt!147934 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!101808 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!101808 (= lt!147935 (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147333))) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333))))))

(declare-fun b!101809 () Bool)

(assert (=> b!101809 (= e!66568 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!101810 () Bool)

(declare-fun res!83670 () Bool)

(assert (=> b!101810 (= res!83670 (= (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147967))) (currentByte!5000 (_2!4374 lt!147967)) (currentBit!4995 (_2!4374 lt!147967))) (bvadd (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147333))) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!101810 (=> (not res!83670) (not e!66565))))

(declare-fun b!101811 () Bool)

(declare-fun e!66563 () Bool)

(declare-fun lt!147946 () tuple2!8236)

(assert (=> b!101811 (= e!66563 (= (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!147946))) (currentByte!5000 (_1!4373 lt!147946)) (currentBit!4995 (_1!4373 lt!147946))) (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147967))) (currentByte!5000 (_2!4374 lt!147967)) (currentBit!4995 (_2!4374 lt!147967)))))))

(declare-fun b!101812 () Bool)

(declare-fun e!66566 () Bool)

(declare-fun lt!147944 () tuple2!8236)

(declare-fun lt!147951 () tuple2!8236)

(assert (=> b!101812 (= e!66566 (= (_2!4373 lt!147944) (_2!4373 lt!147951)))))

(declare-fun b!101813 () Bool)

(declare-fun res!83668 () Bool)

(assert (=> b!101813 (=> (not res!83668) (not e!66567))))

(assert (=> b!101813 (= res!83668 (isPrefixOf!0 (_2!4374 lt!147333) (_2!4374 lt!147933)))))

(declare-fun b!101814 () Bool)

(declare-fun e!66562 () Bool)

(declare-fun lt!147956 () (_ BitVec 64))

(assert (=> b!101814 (= e!66562 (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147333)))) ((_ sign_extend 32) (currentByte!5000 (_2!4374 lt!147333))) ((_ sign_extend 32) (currentBit!4995 (_2!4374 lt!147333))) lt!147956))))

(declare-fun lt!147930 () tuple2!8240)

(declare-fun b!101815 () Bool)

(declare-datatypes ((tuple2!8260 0))(
  ( (tuple2!8261 (_1!4385 BitStream!3826) (_2!4385 (_ BitVec 64))) )
))
(declare-fun lt!147938 () tuple2!8260)

(assert (=> b!101815 (= e!66567 (and (= (_2!4385 lt!147938) v!199) (= (_1!4385 lt!147938) (_2!4375 lt!147930))))))

(declare-fun lt!147940 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8260)

(assert (=> b!101815 (= lt!147938 (readNLeastSignificantBitsLoopPure!0 (_1!4375 lt!147930) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!147940))))

(declare-fun lt!147942 () Unit!6224)

(declare-fun lt!147960 () Unit!6224)

(assert (=> b!101815 (= lt!147942 lt!147960)))

(assert (=> b!101815 (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147933)))) ((_ sign_extend 32) (currentByte!5000 (_2!4374 lt!147333))) ((_ sign_extend 32) (currentBit!4995 (_2!4374 lt!147333))) lt!147956)))

(assert (=> b!101815 (= lt!147960 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4374 lt!147333) (buf!2533 (_2!4374 lt!147933)) lt!147956))))

(assert (=> b!101815 e!66562))

(declare-fun res!83667 () Bool)

(assert (=> b!101815 (=> (not res!83667) (not e!66562))))

(assert (=> b!101815 (= res!83667 (and (= (size!2176 (buf!2533 (_2!4374 lt!147333))) (size!2176 (buf!2533 (_2!4374 lt!147933)))) (bvsge lt!147956 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101815 (= lt!147956 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!101815 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!101815 (= lt!147940 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!101815 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!101815 (= lt!147930 (reader!0 (_2!4374 lt!147333) (_2!4374 lt!147933)))))

(declare-fun d!31706 () Bool)

(assert (=> d!31706 e!66567))

(declare-fun res!83673 () Bool)

(assert (=> d!31706 (=> (not res!83673) (not e!66567))))

(assert (=> d!31706 (= res!83673 (= (size!2176 (buf!2533 (_2!4374 lt!147333))) (size!2176 (buf!2533 (_2!4374 lt!147933)))))))

(assert (=> d!31706 (= lt!147933 e!66564)))

(assert (=> d!31706 (= c!6345 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31706 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31706 (= (appendNLeastSignificantBitsLoop!0 (_2!4374 lt!147333) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!147933)))

(declare-fun b!101816 () Bool)

(declare-fun Unit!6238 () Unit!6224)

(assert (=> b!101816 (= e!66564 (tuple2!8239 Unit!6238 (_2!4374 lt!147972)))))

(declare-fun lt!147958 () Bool)

(assert (=> b!101816 (= lt!147958 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101816 (= lt!147967 (appendBit!0 (_2!4374 lt!147333) lt!147958))))

(declare-fun res!83672 () Bool)

(assert (=> b!101816 (= res!83672 (= (size!2176 (buf!2533 (_2!4374 lt!147333))) (size!2176 (buf!2533 (_2!4374 lt!147967)))))))

(assert (=> b!101816 (=> (not res!83672) (not e!66565))))

(assert (=> b!101816 e!66565))

(declare-fun lt!147962 () tuple2!8238)

(assert (=> b!101816 (= lt!147962 lt!147967)))

(assert (=> b!101816 (= lt!147972 (appendNLeastSignificantBitsLoop!0 (_2!4374 lt!147962) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!147954 () Unit!6224)

(assert (=> b!101816 (= lt!147954 (lemmaIsPrefixTransitive!0 (_2!4374 lt!147333) (_2!4374 lt!147962) (_2!4374 lt!147972)))))

(assert (=> b!101816 call!1270))

(declare-fun lt!147929 () Unit!6224)

(assert (=> b!101816 (= lt!147929 lt!147954)))

(assert (=> b!101816 (invariant!0 (currentBit!4995 (_2!4374 lt!147333)) (currentByte!5000 (_2!4374 lt!147333)) (size!2176 (buf!2533 (_2!4374 lt!147962))))))

(declare-fun lt!147957 () BitStream!3826)

(assert (=> b!101816 (= lt!147957 (BitStream!3827 (buf!2533 (_2!4374 lt!147962)) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333))))))

(assert (=> b!101816 (invariant!0 (currentBit!4995 lt!147957) (currentByte!5000 lt!147957) (size!2176 (buf!2533 (_2!4374 lt!147972))))))

(declare-fun lt!147963 () BitStream!3826)

(assert (=> b!101816 (= lt!147963 (BitStream!3827 (buf!2533 (_2!4374 lt!147972)) (currentByte!5000 lt!147957) (currentBit!4995 lt!147957)))))

(assert (=> b!101816 (= lt!147944 (readBitPure!0 lt!147957))))

(assert (=> b!101816 (= lt!147951 (readBitPure!0 lt!147963))))

(declare-fun lt!147964 () Unit!6224)

(assert (=> b!101816 (= lt!147964 (readBitPrefixLemma!0 lt!147957 (_2!4374 lt!147972)))))

(declare-fun res!83671 () Bool)

(assert (=> b!101816 (= res!83671 (= (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!147944))) (currentByte!5000 (_1!4373 lt!147944)) (currentBit!4995 (_1!4373 lt!147944))) (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!147951))) (currentByte!5000 (_1!4373 lt!147951)) (currentBit!4995 (_1!4373 lt!147951)))))))

(assert (=> b!101816 (=> (not res!83671) (not e!66566))))

(assert (=> b!101816 e!66566))

(declare-fun lt!147937 () Unit!6224)

(assert (=> b!101816 (= lt!147937 lt!147964)))

(declare-fun lt!147945 () tuple2!8240)

(assert (=> b!101816 (= lt!147945 (reader!0 (_2!4374 lt!147333) (_2!4374 lt!147972)))))

(declare-fun lt!147928 () tuple2!8240)

(assert (=> b!101816 (= lt!147928 (reader!0 (_2!4374 lt!147962) (_2!4374 lt!147972)))))

(declare-fun lt!147965 () tuple2!8236)

(assert (=> b!101816 (= lt!147965 (readBitPure!0 (_1!4375 lt!147945)))))

(assert (=> b!101816 (= (_2!4373 lt!147965) lt!147958)))

(declare-fun lt!147968 () Unit!6224)

(declare-fun Unit!6239 () Unit!6224)

(assert (=> b!101816 (= lt!147968 Unit!6239)))

(declare-fun lt!147950 () (_ BitVec 64))

(assert (=> b!101816 (= lt!147950 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!147943 () (_ BitVec 64))

(assert (=> b!101816 (= lt!147943 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!147953 () Unit!6224)

(assert (=> b!101816 (= lt!147953 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4374 lt!147333) (buf!2533 (_2!4374 lt!147972)) lt!147943))))

(assert (=> b!101816 (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147972)))) ((_ sign_extend 32) (currentByte!5000 (_2!4374 lt!147333))) ((_ sign_extend 32) (currentBit!4995 (_2!4374 lt!147333))) lt!147943)))

(declare-fun lt!147971 () Unit!6224)

(assert (=> b!101816 (= lt!147971 lt!147953)))

(declare-fun lt!147936 () tuple2!8260)

(assert (=> b!101816 (= lt!147936 (readNLeastSignificantBitsLoopPure!0 (_1!4375 lt!147945) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!147950))))

(declare-fun lt!147970 () (_ BitVec 64))

(assert (=> b!101816 (= lt!147970 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!147955 () Unit!6224)

(assert (=> b!101816 (= lt!147955 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4374 lt!147962) (buf!2533 (_2!4374 lt!147972)) lt!147970))))

(assert (=> b!101816 (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147972)))) ((_ sign_extend 32) (currentByte!5000 (_2!4374 lt!147962))) ((_ sign_extend 32) (currentBit!4995 (_2!4374 lt!147962))) lt!147970)))

(declare-fun lt!147939 () Unit!6224)

(assert (=> b!101816 (= lt!147939 lt!147955)))

(declare-fun lt!147969 () tuple2!8260)

(assert (=> b!101816 (= lt!147969 (readNLeastSignificantBitsLoopPure!0 (_1!4375 lt!147928) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!147950 (ite (_2!4373 lt!147965) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!147959 () tuple2!8260)

(assert (=> b!101816 (= lt!147959 (readNLeastSignificantBitsLoopPure!0 (_1!4375 lt!147945) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!147950))))

(declare-fun c!6344 () Bool)

(assert (=> b!101816 (= c!6344 (_2!4373 (readBitPure!0 (_1!4375 lt!147945))))))

(declare-fun lt!147966 () tuple2!8260)

(declare-fun withMovedBitIndex!0 (BitStream!3826 (_ BitVec 64)) BitStream!3826)

(assert (=> b!101816 (= lt!147966 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4375 lt!147945) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!147950 e!66568)))))

(declare-fun lt!147931 () Unit!6224)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6224)

(assert (=> b!101816 (= lt!147931 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4375 lt!147945) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!147950))))

(assert (=> b!101816 (and (= (_2!4385 lt!147959) (_2!4385 lt!147966)) (= (_1!4385 lt!147959) (_1!4385 lt!147966)))))

(declare-fun lt!147949 () Unit!6224)

(assert (=> b!101816 (= lt!147949 lt!147931)))

(assert (=> b!101816 (= (_1!4375 lt!147945) (withMovedBitIndex!0 (_2!4375 lt!147945) (bvsub (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147333))) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333))) (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147972))) (currentByte!5000 (_2!4374 lt!147972)) (currentBit!4995 (_2!4374 lt!147972))))))))

(declare-fun lt!147948 () Unit!6224)

(declare-fun Unit!6240 () Unit!6224)

(assert (=> b!101816 (= lt!147948 Unit!6240)))

(assert (=> b!101816 (= (_1!4375 lt!147928) (withMovedBitIndex!0 (_2!4375 lt!147928) (bvsub (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147962))) (currentByte!5000 (_2!4374 lt!147962)) (currentBit!4995 (_2!4374 lt!147962))) (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147972))) (currentByte!5000 (_2!4374 lt!147972)) (currentBit!4995 (_2!4374 lt!147972))))))))

(declare-fun lt!147952 () Unit!6224)

(declare-fun Unit!6241 () Unit!6224)

(assert (=> b!101816 (= lt!147952 Unit!6241)))

(assert (=> b!101816 (= (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147333))) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333))) (bvsub (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147962))) (currentByte!5000 (_2!4374 lt!147962)) (currentBit!4995 (_2!4374 lt!147962))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!147941 () Unit!6224)

(declare-fun Unit!6242 () Unit!6224)

(assert (=> b!101816 (= lt!147941 Unit!6242)))

(assert (=> b!101816 (= (_2!4385 lt!147936) (_2!4385 lt!147969))))

(declare-fun lt!147947 () Unit!6224)

(declare-fun Unit!6243 () Unit!6224)

(assert (=> b!101816 (= lt!147947 Unit!6243)))

(assert (=> b!101816 (= (_1!4385 lt!147936) (_2!4375 lt!147945))))

(declare-fun b!101817 () Bool)

(assert (=> b!101817 (= lt!147946 (readBitPure!0 (readerFrom!0 (_2!4374 lt!147967) (currentBit!4995 (_2!4374 lt!147333)) (currentByte!5000 (_2!4374 lt!147333)))))))

(declare-fun res!83674 () Bool)

(assert (=> b!101817 (= res!83674 (and (= (_2!4373 lt!147946) lt!147958) (= (_1!4373 lt!147946) (_2!4374 lt!147967))))))

(assert (=> b!101817 (=> (not res!83674) (not e!66563))))

(assert (=> b!101817 (= e!66565 e!66563)))

(assert (= (and d!31706 c!6345) b!101816))

(assert (= (and d!31706 (not c!6345)) b!101807))

(assert (= (and b!101816 res!83672) b!101810))

(assert (= (and b!101810 res!83670) b!101806))

(assert (= (and b!101806 res!83675) b!101817))

(assert (= (and b!101817 res!83674) b!101811))

(assert (= (and b!101816 res!83671) b!101812))

(assert (= (and b!101816 c!6344) b!101809))

(assert (= (and b!101816 (not c!6344)) b!101805))

(assert (= (or b!101816 b!101807) bm!1267))

(assert (= (and d!31706 res!83673) b!101808))

(assert (= (and b!101808 res!83669) b!101813))

(assert (= (and b!101813 res!83668) b!101815))

(assert (= (and b!101815 res!83667) b!101814))

(declare-fun m!148103 () Bool)

(assert (=> b!101808 m!148103))

(assert (=> b!101808 m!147669))

(declare-fun m!148105 () Bool)

(assert (=> b!101810 m!148105))

(assert (=> b!101810 m!147669))

(declare-fun m!148107 () Bool)

(assert (=> b!101815 m!148107))

(declare-fun m!148109 () Bool)

(assert (=> b!101815 m!148109))

(declare-fun m!148111 () Bool)

(assert (=> b!101815 m!148111))

(declare-fun m!148113 () Bool)

(assert (=> b!101815 m!148113))

(declare-fun m!148115 () Bool)

(assert (=> b!101815 m!148115))

(declare-fun m!148117 () Bool)

(assert (=> b!101813 m!148117))

(declare-fun m!148119 () Bool)

(assert (=> b!101806 m!148119))

(declare-fun m!148121 () Bool)

(assert (=> b!101816 m!148121))

(declare-fun m!148123 () Bool)

(assert (=> b!101816 m!148123))

(assert (=> b!101816 m!148107))

(declare-fun m!148125 () Bool)

(assert (=> b!101816 m!148125))

(declare-fun m!148127 () Bool)

(assert (=> b!101816 m!148127))

(declare-fun m!148129 () Bool)

(assert (=> b!101816 m!148129))

(declare-fun m!148131 () Bool)

(assert (=> b!101816 m!148131))

(declare-fun m!148133 () Bool)

(assert (=> b!101816 m!148133))

(declare-fun m!148135 () Bool)

(assert (=> b!101816 m!148135))

(declare-fun m!148137 () Bool)

(assert (=> b!101816 m!148137))

(declare-fun m!148139 () Bool)

(assert (=> b!101816 m!148139))

(assert (=> b!101816 m!148131))

(declare-fun m!148141 () Bool)

(assert (=> b!101816 m!148141))

(declare-fun m!148143 () Bool)

(assert (=> b!101816 m!148143))

(declare-fun m!148145 () Bool)

(assert (=> b!101816 m!148145))

(declare-fun m!148147 () Bool)

(assert (=> b!101816 m!148147))

(declare-fun m!148149 () Bool)

(assert (=> b!101816 m!148149))

(declare-fun m!148151 () Bool)

(assert (=> b!101816 m!148151))

(declare-fun m!148153 () Bool)

(assert (=> b!101816 m!148153))

(declare-fun m!148155 () Bool)

(assert (=> b!101816 m!148155))

(declare-fun m!148157 () Bool)

(assert (=> b!101816 m!148157))

(declare-fun m!148159 () Bool)

(assert (=> b!101816 m!148159))

(declare-fun m!148161 () Bool)

(assert (=> b!101816 m!148161))

(assert (=> b!101816 m!147669))

(declare-fun m!148163 () Bool)

(assert (=> b!101816 m!148163))

(declare-fun m!148165 () Bool)

(assert (=> b!101816 m!148165))

(declare-fun m!148167 () Bool)

(assert (=> b!101816 m!148167))

(declare-fun m!148169 () Bool)

(assert (=> b!101816 m!148169))

(declare-fun m!148171 () Bool)

(assert (=> b!101816 m!148171))

(declare-fun m!148173 () Bool)

(assert (=> b!101817 m!148173))

(assert (=> b!101817 m!148173))

(declare-fun m!148175 () Bool)

(assert (=> b!101817 m!148175))

(declare-fun m!148177 () Bool)

(assert (=> bm!1267 m!148177))

(declare-fun m!148179 () Bool)

(assert (=> b!101807 m!148179))

(declare-fun m!148181 () Bool)

(assert (=> b!101814 m!148181))

(declare-fun m!148183 () Bool)

(assert (=> b!101811 m!148183))

(assert (=> b!101811 m!148105))

(assert (=> b!101539 d!31706))

(declare-fun d!31784 () Bool)

(declare-fun e!66571 () Bool)

(assert (=> d!31784 e!66571))

(declare-fun res!83680 () Bool)

(assert (=> d!31784 (=> (not res!83680) (not e!66571))))

(declare-fun lt!147987 () (_ BitVec 64))

(declare-fun lt!147989 () (_ BitVec 64))

(declare-fun lt!147990 () (_ BitVec 64))

(assert (=> d!31784 (= res!83680 (= lt!147990 (bvsub lt!147989 lt!147987)))))

(assert (=> d!31784 (or (= (bvand lt!147989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!147987 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!147989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!147989 lt!147987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31784 (= lt!147987 (remainingBits!0 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4373 lt!147336)))) ((_ sign_extend 32) (currentByte!5000 (_1!4373 lt!147336))) ((_ sign_extend 32) (currentBit!4995 (_1!4373 lt!147336)))))))

(declare-fun lt!147988 () (_ BitVec 64))

(declare-fun lt!147986 () (_ BitVec 64))

(assert (=> d!31784 (= lt!147989 (bvmul lt!147988 lt!147986))))

(assert (=> d!31784 (or (= lt!147988 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!147986 (bvsdiv (bvmul lt!147988 lt!147986) lt!147988)))))

(assert (=> d!31784 (= lt!147986 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31784 (= lt!147988 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4373 lt!147336)))))))

(assert (=> d!31784 (= lt!147990 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5000 (_1!4373 lt!147336))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4995 (_1!4373 lt!147336)))))))

(assert (=> d!31784 (invariant!0 (currentBit!4995 (_1!4373 lt!147336)) (currentByte!5000 (_1!4373 lt!147336)) (size!2176 (buf!2533 (_1!4373 lt!147336))))))

(assert (=> d!31784 (= (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!147336))) (currentByte!5000 (_1!4373 lt!147336)) (currentBit!4995 (_1!4373 lt!147336))) lt!147990)))

(declare-fun b!101822 () Bool)

(declare-fun res!83681 () Bool)

(assert (=> b!101822 (=> (not res!83681) (not e!66571))))

(assert (=> b!101822 (= res!83681 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!147990))))

(declare-fun b!101823 () Bool)

(declare-fun lt!147985 () (_ BitVec 64))

(assert (=> b!101823 (= e!66571 (bvsle lt!147990 (bvmul lt!147985 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101823 (or (= lt!147985 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!147985 #b0000000000000000000000000000000000000000000000000000000000001000) lt!147985)))))

(assert (=> b!101823 (= lt!147985 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4373 lt!147336)))))))

(assert (= (and d!31784 res!83680) b!101822))

(assert (= (and b!101822 res!83681) b!101823))

(declare-fun m!148185 () Bool)

(assert (=> d!31784 m!148185))

(declare-fun m!148187 () Bool)

(assert (=> d!31784 m!148187))

(assert (=> b!101539 d!31784))

(declare-fun d!31786 () Bool)

(declare-fun res!83684 () Bool)

(declare-fun e!66572 () Bool)

(assert (=> d!31786 (=> (not res!83684) (not e!66572))))

(assert (=> d!31786 (= res!83684 (= (size!2176 (buf!2533 thiss!1305)) (size!2176 (buf!2533 (_2!4374 lt!147323)))))))

(assert (=> d!31786 (= (isPrefixOf!0 thiss!1305 (_2!4374 lt!147323)) e!66572)))

(declare-fun b!101824 () Bool)

(declare-fun res!83683 () Bool)

(assert (=> b!101824 (=> (not res!83683) (not e!66572))))

(assert (=> b!101824 (= res!83683 (bvsle (bitIndex!0 (size!2176 (buf!2533 thiss!1305)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305)) (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147323))) (currentByte!5000 (_2!4374 lt!147323)) (currentBit!4995 (_2!4374 lt!147323)))))))

(declare-fun b!101825 () Bool)

(declare-fun e!66573 () Bool)

(assert (=> b!101825 (= e!66572 e!66573)))

(declare-fun res!83682 () Bool)

(assert (=> b!101825 (=> res!83682 e!66573)))

(assert (=> b!101825 (= res!83682 (= (size!2176 (buf!2533 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!101826 () Bool)

(assert (=> b!101826 (= e!66573 (arrayBitRangesEq!0 (buf!2533 thiss!1305) (buf!2533 (_2!4374 lt!147323)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2176 (buf!2533 thiss!1305)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305))))))

(assert (= (and d!31786 res!83684) b!101824))

(assert (= (and b!101824 res!83683) b!101825))

(assert (= (and b!101825 (not res!83682)) b!101826))

(assert (=> b!101824 m!147671))

(declare-fun m!148189 () Bool)

(assert (=> b!101824 m!148189))

(assert (=> b!101826 m!147671))

(assert (=> b!101826 m!147671))

(declare-fun m!148191 () Bool)

(assert (=> b!101826 m!148191))

(assert (=> b!101539 d!31786))

(declare-fun lt!148040 () (_ BitVec 64))

(declare-fun b!101837 () Bool)

(declare-fun e!66579 () Bool)

(declare-fun lt!148048 () tuple2!8240)

(declare-fun lt!148049 () (_ BitVec 64))

(assert (=> b!101837 (= e!66579 (= (_1!4375 lt!148048) (withMovedBitIndex!0 (_2!4375 lt!148048) (bvsub lt!148049 lt!148040))))))

(assert (=> b!101837 (or (= (bvand lt!148049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148040 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!148049 lt!148040) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101837 (= lt!148040 (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147323))) (currentByte!5000 (_2!4374 lt!147323)) (currentBit!4995 (_2!4374 lt!147323))))))

(assert (=> b!101837 (= lt!148049 (bitIndex!0 (size!2176 (buf!2533 thiss!1305)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305)))))

(declare-fun b!101838 () Bool)

(declare-fun e!66578 () Unit!6224)

(declare-fun Unit!6245 () Unit!6224)

(assert (=> b!101838 (= e!66578 Unit!6245)))

(declare-fun b!101839 () Bool)

(declare-fun res!83691 () Bool)

(assert (=> b!101839 (=> (not res!83691) (not e!66579))))

(assert (=> b!101839 (= res!83691 (isPrefixOf!0 (_2!4375 lt!148048) (_2!4374 lt!147323)))))

(declare-fun b!101841 () Bool)

(declare-fun res!83693 () Bool)

(assert (=> b!101841 (=> (not res!83693) (not e!66579))))

(assert (=> b!101841 (= res!83693 (isPrefixOf!0 (_1!4375 lt!148048) thiss!1305))))

(declare-fun b!101840 () Bool)

(declare-fun lt!148033 () Unit!6224)

(assert (=> b!101840 (= e!66578 lt!148033)))

(declare-fun lt!148045 () (_ BitVec 64))

(assert (=> b!101840 (= lt!148045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!148032 () (_ BitVec 64))

(assert (=> b!101840 (= lt!148032 (bitIndex!0 (size!2176 (buf!2533 thiss!1305)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4767 array!4767 (_ BitVec 64) (_ BitVec 64)) Unit!6224)

(assert (=> b!101840 (= lt!148033 (arrayBitRangesEqSymmetric!0 (buf!2533 thiss!1305) (buf!2533 (_2!4374 lt!147323)) lt!148045 lt!148032))))

(assert (=> b!101840 (arrayBitRangesEq!0 (buf!2533 (_2!4374 lt!147323)) (buf!2533 thiss!1305) lt!148045 lt!148032)))

(declare-fun d!31788 () Bool)

(assert (=> d!31788 e!66579))

(declare-fun res!83692 () Bool)

(assert (=> d!31788 (=> (not res!83692) (not e!66579))))

(assert (=> d!31788 (= res!83692 (isPrefixOf!0 (_1!4375 lt!148048) (_2!4375 lt!148048)))))

(declare-fun lt!148039 () BitStream!3826)

(assert (=> d!31788 (= lt!148048 (tuple2!8241 lt!148039 (_2!4374 lt!147323)))))

(declare-fun lt!148041 () Unit!6224)

(declare-fun lt!148050 () Unit!6224)

(assert (=> d!31788 (= lt!148041 lt!148050)))

(assert (=> d!31788 (isPrefixOf!0 lt!148039 (_2!4374 lt!147323))))

(assert (=> d!31788 (= lt!148050 (lemmaIsPrefixTransitive!0 lt!148039 (_2!4374 lt!147323) (_2!4374 lt!147323)))))

(declare-fun lt!148046 () Unit!6224)

(declare-fun lt!148037 () Unit!6224)

(assert (=> d!31788 (= lt!148046 lt!148037)))

(assert (=> d!31788 (isPrefixOf!0 lt!148039 (_2!4374 lt!147323))))

(assert (=> d!31788 (= lt!148037 (lemmaIsPrefixTransitive!0 lt!148039 thiss!1305 (_2!4374 lt!147323)))))

(declare-fun lt!148047 () Unit!6224)

(assert (=> d!31788 (= lt!148047 e!66578)))

(declare-fun c!6348 () Bool)

(assert (=> d!31788 (= c!6348 (not (= (size!2176 (buf!2533 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!148038 () Unit!6224)

(declare-fun lt!148036 () Unit!6224)

(assert (=> d!31788 (= lt!148038 lt!148036)))

(assert (=> d!31788 (isPrefixOf!0 (_2!4374 lt!147323) (_2!4374 lt!147323))))

(assert (=> d!31788 (= lt!148036 (lemmaIsPrefixRefl!0 (_2!4374 lt!147323)))))

(declare-fun lt!148034 () Unit!6224)

(declare-fun lt!148031 () Unit!6224)

(assert (=> d!31788 (= lt!148034 lt!148031)))

(assert (=> d!31788 (= lt!148031 (lemmaIsPrefixRefl!0 (_2!4374 lt!147323)))))

(declare-fun lt!148042 () Unit!6224)

(declare-fun lt!148035 () Unit!6224)

(assert (=> d!31788 (= lt!148042 lt!148035)))

(assert (=> d!31788 (isPrefixOf!0 lt!148039 lt!148039)))

(assert (=> d!31788 (= lt!148035 (lemmaIsPrefixRefl!0 lt!148039))))

(declare-fun lt!148044 () Unit!6224)

(declare-fun lt!148043 () Unit!6224)

(assert (=> d!31788 (= lt!148044 lt!148043)))

(assert (=> d!31788 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31788 (= lt!148043 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31788 (= lt!148039 (BitStream!3827 (buf!2533 (_2!4374 lt!147323)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305)))))

(assert (=> d!31788 (isPrefixOf!0 thiss!1305 (_2!4374 lt!147323))))

(assert (=> d!31788 (= (reader!0 thiss!1305 (_2!4374 lt!147323)) lt!148048)))

(assert (= (and d!31788 c!6348) b!101840))

(assert (= (and d!31788 (not c!6348)) b!101838))

(assert (= (and d!31788 res!83692) b!101841))

(assert (= (and b!101841 res!83693) b!101839))

(assert (= (and b!101839 res!83691) b!101837))

(assert (=> b!101840 m!147671))

(declare-fun m!148193 () Bool)

(assert (=> b!101840 m!148193))

(declare-fun m!148195 () Bool)

(assert (=> b!101840 m!148195))

(declare-fun m!148197 () Bool)

(assert (=> b!101837 m!148197))

(assert (=> b!101837 m!148189))

(assert (=> b!101837 m!147671))

(declare-fun m!148199 () Bool)

(assert (=> b!101841 m!148199))

(declare-fun m!148201 () Bool)

(assert (=> d!31788 m!148201))

(declare-fun m!148203 () Bool)

(assert (=> d!31788 m!148203))

(declare-fun m!148205 () Bool)

(assert (=> d!31788 m!148205))

(declare-fun m!148207 () Bool)

(assert (=> d!31788 m!148207))

(declare-fun m!148209 () Bool)

(assert (=> d!31788 m!148209))

(declare-fun m!148211 () Bool)

(assert (=> d!31788 m!148211))

(declare-fun m!148213 () Bool)

(assert (=> d!31788 m!148213))

(declare-fun m!148215 () Bool)

(assert (=> d!31788 m!148215))

(assert (=> d!31788 m!147681))

(declare-fun m!148217 () Bool)

(assert (=> d!31788 m!148217))

(declare-fun m!148219 () Bool)

(assert (=> d!31788 m!148219))

(declare-fun m!148221 () Bool)

(assert (=> b!101839 m!148221))

(assert (=> b!101539 d!31788))

(declare-fun lt!148068 () tuple2!8240)

(declare-fun b!101842 () Bool)

(declare-fun e!66581 () Bool)

(declare-fun lt!148060 () (_ BitVec 64))

(declare-fun lt!148069 () (_ BitVec 64))

(assert (=> b!101842 (= e!66581 (= (_1!4375 lt!148068) (withMovedBitIndex!0 (_2!4375 lt!148068) (bvsub lt!148069 lt!148060))))))

(assert (=> b!101842 (or (= (bvand lt!148069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148060 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!148069 lt!148060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101842 (= lt!148060 (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147323))) (currentByte!5000 (_2!4374 lt!147323)) (currentBit!4995 (_2!4374 lt!147323))))))

(assert (=> b!101842 (= lt!148069 (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147333))) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333))))))

(declare-fun b!101843 () Bool)

(declare-fun e!66580 () Unit!6224)

(declare-fun Unit!6246 () Unit!6224)

(assert (=> b!101843 (= e!66580 Unit!6246)))

(declare-fun b!101844 () Bool)

(declare-fun res!83694 () Bool)

(assert (=> b!101844 (=> (not res!83694) (not e!66581))))

(assert (=> b!101844 (= res!83694 (isPrefixOf!0 (_2!4375 lt!148068) (_2!4374 lt!147323)))))

(declare-fun b!101846 () Bool)

(declare-fun res!83696 () Bool)

(assert (=> b!101846 (=> (not res!83696) (not e!66581))))

(assert (=> b!101846 (= res!83696 (isPrefixOf!0 (_1!4375 lt!148068) (_2!4374 lt!147333)))))

(declare-fun b!101845 () Bool)

(declare-fun lt!148053 () Unit!6224)

(assert (=> b!101845 (= e!66580 lt!148053)))

(declare-fun lt!148065 () (_ BitVec 64))

(assert (=> b!101845 (= lt!148065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!148052 () (_ BitVec 64))

(assert (=> b!101845 (= lt!148052 (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147333))) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333))))))

(assert (=> b!101845 (= lt!148053 (arrayBitRangesEqSymmetric!0 (buf!2533 (_2!4374 lt!147333)) (buf!2533 (_2!4374 lt!147323)) lt!148065 lt!148052))))

(assert (=> b!101845 (arrayBitRangesEq!0 (buf!2533 (_2!4374 lt!147323)) (buf!2533 (_2!4374 lt!147333)) lt!148065 lt!148052)))

(declare-fun d!31790 () Bool)

(assert (=> d!31790 e!66581))

(declare-fun res!83695 () Bool)

(assert (=> d!31790 (=> (not res!83695) (not e!66581))))

(assert (=> d!31790 (= res!83695 (isPrefixOf!0 (_1!4375 lt!148068) (_2!4375 lt!148068)))))

(declare-fun lt!148059 () BitStream!3826)

(assert (=> d!31790 (= lt!148068 (tuple2!8241 lt!148059 (_2!4374 lt!147323)))))

(declare-fun lt!148061 () Unit!6224)

(declare-fun lt!148070 () Unit!6224)

(assert (=> d!31790 (= lt!148061 lt!148070)))

(assert (=> d!31790 (isPrefixOf!0 lt!148059 (_2!4374 lt!147323))))

(assert (=> d!31790 (= lt!148070 (lemmaIsPrefixTransitive!0 lt!148059 (_2!4374 lt!147323) (_2!4374 lt!147323)))))

(declare-fun lt!148066 () Unit!6224)

(declare-fun lt!148057 () Unit!6224)

(assert (=> d!31790 (= lt!148066 lt!148057)))

(assert (=> d!31790 (isPrefixOf!0 lt!148059 (_2!4374 lt!147323))))

(assert (=> d!31790 (= lt!148057 (lemmaIsPrefixTransitive!0 lt!148059 (_2!4374 lt!147333) (_2!4374 lt!147323)))))

(declare-fun lt!148067 () Unit!6224)

(assert (=> d!31790 (= lt!148067 e!66580)))

(declare-fun c!6349 () Bool)

(assert (=> d!31790 (= c!6349 (not (= (size!2176 (buf!2533 (_2!4374 lt!147333))) #b00000000000000000000000000000000)))))

(declare-fun lt!148058 () Unit!6224)

(declare-fun lt!148056 () Unit!6224)

(assert (=> d!31790 (= lt!148058 lt!148056)))

(assert (=> d!31790 (isPrefixOf!0 (_2!4374 lt!147323) (_2!4374 lt!147323))))

(assert (=> d!31790 (= lt!148056 (lemmaIsPrefixRefl!0 (_2!4374 lt!147323)))))

(declare-fun lt!148054 () Unit!6224)

(declare-fun lt!148051 () Unit!6224)

(assert (=> d!31790 (= lt!148054 lt!148051)))

(assert (=> d!31790 (= lt!148051 (lemmaIsPrefixRefl!0 (_2!4374 lt!147323)))))

(declare-fun lt!148062 () Unit!6224)

(declare-fun lt!148055 () Unit!6224)

(assert (=> d!31790 (= lt!148062 lt!148055)))

(assert (=> d!31790 (isPrefixOf!0 lt!148059 lt!148059)))

(assert (=> d!31790 (= lt!148055 (lemmaIsPrefixRefl!0 lt!148059))))

(declare-fun lt!148064 () Unit!6224)

(declare-fun lt!148063 () Unit!6224)

(assert (=> d!31790 (= lt!148064 lt!148063)))

(assert (=> d!31790 (isPrefixOf!0 (_2!4374 lt!147333) (_2!4374 lt!147333))))

(assert (=> d!31790 (= lt!148063 (lemmaIsPrefixRefl!0 (_2!4374 lt!147333)))))

(assert (=> d!31790 (= lt!148059 (BitStream!3827 (buf!2533 (_2!4374 lt!147323)) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333))))))

(assert (=> d!31790 (isPrefixOf!0 (_2!4374 lt!147333) (_2!4374 lt!147323))))

(assert (=> d!31790 (= (reader!0 (_2!4374 lt!147333) (_2!4374 lt!147323)) lt!148068)))

(assert (= (and d!31790 c!6349) b!101845))

(assert (= (and d!31790 (not c!6349)) b!101843))

(assert (= (and d!31790 res!83695) b!101846))

(assert (= (and b!101846 res!83696) b!101844))

(assert (= (and b!101844 res!83694) b!101842))

(assert (=> b!101845 m!147669))

(declare-fun m!148223 () Bool)

(assert (=> b!101845 m!148223))

(declare-fun m!148225 () Bool)

(assert (=> b!101845 m!148225))

(declare-fun m!148227 () Bool)

(assert (=> b!101842 m!148227))

(assert (=> b!101842 m!148189))

(assert (=> b!101842 m!147669))

(declare-fun m!148229 () Bool)

(assert (=> b!101846 m!148229))

(declare-fun m!148231 () Bool)

(assert (=> d!31790 m!148231))

(declare-fun m!148233 () Bool)

(assert (=> d!31790 m!148233))

(assert (=> d!31790 m!148205))

(declare-fun m!148235 () Bool)

(assert (=> d!31790 m!148235))

(declare-fun m!148237 () Bool)

(assert (=> d!31790 m!148237))

(assert (=> d!31790 m!148211))

(declare-fun m!148239 () Bool)

(assert (=> d!31790 m!148239))

(declare-fun m!148241 () Bool)

(assert (=> d!31790 m!148241))

(declare-fun m!148243 () Bool)

(assert (=> d!31790 m!148243))

(declare-fun m!148245 () Bool)

(assert (=> d!31790 m!148245))

(declare-fun m!148247 () Bool)

(assert (=> d!31790 m!148247))

(declare-fun m!148249 () Bool)

(assert (=> b!101844 m!148249))

(assert (=> b!101539 d!31790))

(declare-fun d!31792 () Bool)

(declare-fun lt!148071 () tuple2!8258)

(assert (=> d!31792 (= lt!148071 (readBit!0 lt!147327))))

(assert (=> d!31792 (= (readBitPure!0 lt!147327) (tuple2!8237 (_2!4384 lt!148071) (_1!4384 lt!148071)))))

(declare-fun bs!7785 () Bool)

(assert (= bs!7785 d!31792))

(declare-fun m!148251 () Bool)

(assert (=> bs!7785 m!148251))

(assert (=> b!101539 d!31792))

(declare-fun d!31794 () Bool)

(declare-fun e!66596 () Bool)

(assert (=> d!31794 e!66596))

(declare-fun res!83716 () Bool)

(assert (=> d!31794 (=> (not res!83716) (not e!66596))))

(declare-fun lt!148154 () tuple2!8238)

(assert (=> d!31794 (= res!83716 (= (size!2176 (buf!2533 thiss!1305)) (size!2176 (buf!2533 (_2!4374 lt!148154)))))))

(declare-fun choose!16 (BitStream!3826 Bool) tuple2!8238)

(assert (=> d!31794 (= lt!148154 (choose!16 thiss!1305 lt!147329))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31794 (validate_offset_bit!0 ((_ sign_extend 32) (size!2176 (buf!2533 thiss!1305))) ((_ sign_extend 32) (currentByte!5000 thiss!1305)) ((_ sign_extend 32) (currentBit!4995 thiss!1305)))))

(assert (=> d!31794 (= (appendBit!0 thiss!1305 lt!147329) lt!148154)))

(declare-fun b!101877 () Bool)

(declare-fun e!66597 () Bool)

(declare-fun lt!148156 () tuple2!8236)

(assert (=> b!101877 (= e!66597 (= (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!148156))) (currentByte!5000 (_1!4373 lt!148156)) (currentBit!4995 (_1!4373 lt!148156))) (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!148154))) (currentByte!5000 (_2!4374 lt!148154)) (currentBit!4995 (_2!4374 lt!148154)))))))

(declare-fun b!101875 () Bool)

(declare-fun res!83717 () Bool)

(assert (=> b!101875 (=> (not res!83717) (not e!66596))))

(assert (=> b!101875 (= res!83717 (isPrefixOf!0 thiss!1305 (_2!4374 lt!148154)))))

(declare-fun b!101876 () Bool)

(assert (=> b!101876 (= e!66596 e!66597)))

(declare-fun res!83718 () Bool)

(assert (=> b!101876 (=> (not res!83718) (not e!66597))))

(assert (=> b!101876 (= res!83718 (and (= (_2!4373 lt!148156) lt!147329) (= (_1!4373 lt!148156) (_2!4374 lt!148154))))))

(assert (=> b!101876 (= lt!148156 (readBitPure!0 (readerFrom!0 (_2!4374 lt!148154) (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305))))))

(declare-fun b!101874 () Bool)

(declare-fun res!83715 () Bool)

(assert (=> b!101874 (=> (not res!83715) (not e!66596))))

(declare-fun lt!148155 () (_ BitVec 64))

(declare-fun lt!148157 () (_ BitVec 64))

(assert (=> b!101874 (= res!83715 (= (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!148154))) (currentByte!5000 (_2!4374 lt!148154)) (currentBit!4995 (_2!4374 lt!148154))) (bvadd lt!148155 lt!148157)))))

(assert (=> b!101874 (or (not (= (bvand lt!148155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148157 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!148155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!148155 lt!148157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101874 (= lt!148157 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!101874 (= lt!148155 (bitIndex!0 (size!2176 (buf!2533 thiss!1305)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305)))))

(assert (= (and d!31794 res!83716) b!101874))

(assert (= (and b!101874 res!83715) b!101875))

(assert (= (and b!101875 res!83717) b!101876))

(assert (= (and b!101876 res!83718) b!101877))

(declare-fun m!148253 () Bool)

(assert (=> b!101877 m!148253))

(declare-fun m!148255 () Bool)

(assert (=> b!101877 m!148255))

(declare-fun m!148257 () Bool)

(assert (=> b!101875 m!148257))

(assert (=> b!101874 m!148255))

(assert (=> b!101874 m!147671))

(declare-fun m!148259 () Bool)

(assert (=> d!31794 m!148259))

(declare-fun m!148261 () Bool)

(assert (=> d!31794 m!148261))

(declare-fun m!148263 () Bool)

(assert (=> b!101876 m!148263))

(assert (=> b!101876 m!148263))

(declare-fun m!148265 () Bool)

(assert (=> b!101876 m!148265))

(assert (=> b!101539 d!31794))

(declare-fun d!31796 () Bool)

(assert (=> d!31796 (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147323)))) ((_ sign_extend 32) (currentByte!5000 thiss!1305)) ((_ sign_extend 32) (currentBit!4995 thiss!1305)) lt!147325)))

(declare-fun lt!148164 () Unit!6224)

(declare-fun choose!9 (BitStream!3826 array!4767 (_ BitVec 64) BitStream!3826) Unit!6224)

(assert (=> d!31796 (= lt!148164 (choose!9 thiss!1305 (buf!2533 (_2!4374 lt!147323)) lt!147325 (BitStream!3827 (buf!2533 (_2!4374 lt!147323)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305))))))

(assert (=> d!31796 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2533 (_2!4374 lt!147323)) lt!147325) lt!148164)))

(declare-fun bs!7786 () Bool)

(assert (= bs!7786 d!31796))

(assert (=> bs!7786 m!147691))

(declare-fun m!148267 () Bool)

(assert (=> bs!7786 m!148267))

(assert (=> b!101539 d!31796))

(declare-fun d!31798 () Bool)

(assert (=> d!31798 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147323)))) ((_ sign_extend 32) (currentByte!5000 thiss!1305)) ((_ sign_extend 32) (currentBit!4995 thiss!1305)) lt!147325) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147323)))) ((_ sign_extend 32) (currentByte!5000 thiss!1305)) ((_ sign_extend 32) (currentBit!4995 thiss!1305))) lt!147325))))

(declare-fun bs!7787 () Bool)

(assert (= bs!7787 d!31798))

(declare-fun m!148269 () Bool)

(assert (=> bs!7787 m!148269))

(assert (=> b!101539 d!31798))

(declare-fun d!31800 () Bool)

(declare-fun lt!148177 () tuple2!8258)

(assert (=> d!31800 (= lt!148177 (readBit!0 (BitStream!3827 (buf!2533 (_2!4374 lt!147323)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305))))))

(assert (=> d!31800 (= (readBitPure!0 (BitStream!3827 (buf!2533 (_2!4374 lt!147323)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305))) (tuple2!8237 (_2!4384 lt!148177) (_1!4384 lt!148177)))))

(declare-fun bs!7788 () Bool)

(assert (= bs!7788 d!31800))

(declare-fun m!148271 () Bool)

(assert (=> bs!7788 m!148271))

(assert (=> b!101539 d!31800))

(declare-fun d!31802 () Bool)

(assert (=> d!31802 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4375 lt!147335)))) ((_ sign_extend 32) (currentByte!5000 (_1!4375 lt!147335))) ((_ sign_extend 32) (currentBit!4995 (_1!4375 lt!147335))) lt!147325) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4375 lt!147335)))) ((_ sign_extend 32) (currentByte!5000 (_1!4375 lt!147335))) ((_ sign_extend 32) (currentBit!4995 (_1!4375 lt!147335)))) lt!147325))))

(declare-fun bs!7789 () Bool)

(assert (= bs!7789 d!31802))

(declare-fun m!148273 () Bool)

(assert (=> bs!7789 m!148273))

(assert (=> b!101539 d!31802))

(declare-fun d!31804 () Bool)

(declare-fun e!66604 () Bool)

(assert (=> d!31804 e!66604))

(declare-fun res!83729 () Bool)

(assert (=> d!31804 (=> (not res!83729) (not e!66604))))

(declare-fun lt!148189 () tuple2!8236)

(declare-fun lt!148187 () tuple2!8236)

(assert (=> d!31804 (= res!83729 (= (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!148189))) (currentByte!5000 (_1!4373 lt!148189)) (currentBit!4995 (_1!4373 lt!148189))) (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!148187))) (currentByte!5000 (_1!4373 lt!148187)) (currentBit!4995 (_1!4373 lt!148187)))))))

(declare-fun lt!148188 () Unit!6224)

(declare-fun lt!148186 () BitStream!3826)

(declare-fun choose!50 (BitStream!3826 BitStream!3826 BitStream!3826 tuple2!8236 tuple2!8236 BitStream!3826 Bool tuple2!8236 tuple2!8236 BitStream!3826 Bool) Unit!6224)

(assert (=> d!31804 (= lt!148188 (choose!50 lt!147327 (_2!4374 lt!147323) lt!148186 lt!148189 (tuple2!8237 (_1!4373 lt!148189) (_2!4373 lt!148189)) (_1!4373 lt!148189) (_2!4373 lt!148189) lt!148187 (tuple2!8237 (_1!4373 lt!148187) (_2!4373 lt!148187)) (_1!4373 lt!148187) (_2!4373 lt!148187)))))

(assert (=> d!31804 (= lt!148187 (readBitPure!0 lt!148186))))

(assert (=> d!31804 (= lt!148189 (readBitPure!0 lt!147327))))

(assert (=> d!31804 (= lt!148186 (BitStream!3827 (buf!2533 (_2!4374 lt!147323)) (currentByte!5000 lt!147327) (currentBit!4995 lt!147327)))))

(assert (=> d!31804 (invariant!0 (currentBit!4995 lt!147327) (currentByte!5000 lt!147327) (size!2176 (buf!2533 (_2!4374 lt!147323))))))

(assert (=> d!31804 (= (readBitPrefixLemma!0 lt!147327 (_2!4374 lt!147323)) lt!148188)))

(declare-fun b!101888 () Bool)

(assert (=> b!101888 (= e!66604 (= (_2!4373 lt!148189) (_2!4373 lt!148187)))))

(assert (= (and d!31804 res!83729) b!101888))

(declare-fun m!148275 () Bool)

(assert (=> d!31804 m!148275))

(assert (=> d!31804 m!147699))

(declare-fun m!148277 () Bool)

(assert (=> d!31804 m!148277))

(declare-fun m!148279 () Bool)

(assert (=> d!31804 m!148279))

(declare-fun m!148281 () Bool)

(assert (=> d!31804 m!148281))

(declare-fun m!148283 () Bool)

(assert (=> d!31804 m!148283))

(assert (=> b!101539 d!31804))

(declare-fun d!31806 () Bool)

(declare-fun e!66605 () Bool)

(assert (=> d!31806 e!66605))

(declare-fun res!83730 () Bool)

(assert (=> d!31806 (=> (not res!83730) (not e!66605))))

(declare-fun lt!148194 () (_ BitVec 64))

(declare-fun lt!148195 () (_ BitVec 64))

(declare-fun lt!148192 () (_ BitVec 64))

(assert (=> d!31806 (= res!83730 (= lt!148195 (bvsub lt!148194 lt!148192)))))

(assert (=> d!31806 (or (= (bvand lt!148194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148192 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!148194 lt!148192) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31806 (= lt!148192 (remainingBits!0 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4373 lt!147324)))) ((_ sign_extend 32) (currentByte!5000 (_1!4373 lt!147324))) ((_ sign_extend 32) (currentBit!4995 (_1!4373 lt!147324)))))))

(declare-fun lt!148193 () (_ BitVec 64))

(declare-fun lt!148191 () (_ BitVec 64))

(assert (=> d!31806 (= lt!148194 (bvmul lt!148193 lt!148191))))

(assert (=> d!31806 (or (= lt!148193 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!148191 (bvsdiv (bvmul lt!148193 lt!148191) lt!148193)))))

(assert (=> d!31806 (= lt!148191 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31806 (= lt!148193 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4373 lt!147324)))))))

(assert (=> d!31806 (= lt!148195 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5000 (_1!4373 lt!147324))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4995 (_1!4373 lt!147324)))))))

(assert (=> d!31806 (invariant!0 (currentBit!4995 (_1!4373 lt!147324)) (currentByte!5000 (_1!4373 lt!147324)) (size!2176 (buf!2533 (_1!4373 lt!147324))))))

(assert (=> d!31806 (= (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!147324))) (currentByte!5000 (_1!4373 lt!147324)) (currentBit!4995 (_1!4373 lt!147324))) lt!148195)))

(declare-fun b!101889 () Bool)

(declare-fun res!83731 () Bool)

(assert (=> b!101889 (=> (not res!83731) (not e!66605))))

(assert (=> b!101889 (= res!83731 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!148195))))

(declare-fun b!101890 () Bool)

(declare-fun lt!148190 () (_ BitVec 64))

(assert (=> b!101890 (= e!66605 (bvsle lt!148195 (bvmul lt!148190 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101890 (or (= lt!148190 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!148190 #b0000000000000000000000000000000000000000000000000000000000001000) lt!148190)))))

(assert (=> b!101890 (= lt!148190 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4373 lt!147324)))))))

(assert (= (and d!31806 res!83730) b!101889))

(assert (= (and b!101889 res!83731) b!101890))

(declare-fun m!148285 () Bool)

(assert (=> d!31806 m!148285))

(declare-fun m!148287 () Bool)

(assert (=> d!31806 m!148287))

(assert (=> b!101539 d!31806))

(declare-fun d!31808 () Bool)

(assert (=> d!31808 (isPrefixOf!0 thiss!1305 (_2!4374 lt!147323))))

(declare-fun lt!148243 () Unit!6224)

(declare-fun choose!30 (BitStream!3826 BitStream!3826 BitStream!3826) Unit!6224)

(assert (=> d!31808 (= lt!148243 (choose!30 thiss!1305 (_2!4374 lt!147333) (_2!4374 lt!147323)))))

(assert (=> d!31808 (isPrefixOf!0 thiss!1305 (_2!4374 lt!147333))))

(assert (=> d!31808 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4374 lt!147333) (_2!4374 lt!147323)) lt!148243)))

(declare-fun bs!7790 () Bool)

(assert (= bs!7790 d!31808))

(assert (=> bs!7790 m!147681))

(declare-fun m!148289 () Bool)

(assert (=> bs!7790 m!148289))

(assert (=> bs!7790 m!147655))

(assert (=> b!101539 d!31808))

(declare-fun d!31810 () Bool)

(assert (=> d!31810 (= (invariant!0 (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305) (size!2176 (buf!2533 (_2!4374 lt!147333)))) (and (bvsge (currentBit!4995 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4995 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5000 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5000 thiss!1305) (size!2176 (buf!2533 (_2!4374 lt!147333)))) (and (= (currentBit!4995 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5000 thiss!1305) (size!2176 (buf!2533 (_2!4374 lt!147333))))))))))

(assert (=> b!101534 d!31810))

(declare-fun d!31812 () Bool)

(assert (=> d!31812 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2176 (buf!2533 thiss!1305))) ((_ sign_extend 32) (currentByte!5000 thiss!1305)) ((_ sign_extend 32) (currentBit!4995 thiss!1305)) lt!147325) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2176 (buf!2533 thiss!1305))) ((_ sign_extend 32) (currentByte!5000 thiss!1305)) ((_ sign_extend 32) (currentBit!4995 thiss!1305))) lt!147325))))

(declare-fun bs!7791 () Bool)

(assert (= bs!7791 d!31812))

(declare-fun m!148291 () Bool)

(assert (=> bs!7791 m!148291))

(assert (=> b!101540 d!31812))

(declare-fun d!31814 () Bool)

(declare-fun e!66613 () Bool)

(assert (=> d!31814 e!66613))

(declare-fun res!83741 () Bool)

(assert (=> d!31814 (=> (not res!83741) (not e!66613))))

(declare-fun lt!148249 () (_ BitVec 64))

(declare-fun lt!148248 () (_ BitVec 64))

(declare-fun lt!148246 () (_ BitVec 64))

(assert (=> d!31814 (= res!83741 (= lt!148249 (bvsub lt!148248 lt!148246)))))

(assert (=> d!31814 (or (= (bvand lt!148248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148246 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!148248 lt!148246) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31814 (= lt!148246 (remainingBits!0 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147333)))) ((_ sign_extend 32) (currentByte!5000 (_2!4374 lt!147333))) ((_ sign_extend 32) (currentBit!4995 (_2!4374 lt!147333)))))))

(declare-fun lt!148247 () (_ BitVec 64))

(declare-fun lt!148245 () (_ BitVec 64))

(assert (=> d!31814 (= lt!148248 (bvmul lt!148247 lt!148245))))

(assert (=> d!31814 (or (= lt!148247 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!148245 (bvsdiv (bvmul lt!148247 lt!148245) lt!148247)))))

(assert (=> d!31814 (= lt!148245 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31814 (= lt!148247 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147333)))))))

(assert (=> d!31814 (= lt!148249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5000 (_2!4374 lt!147333))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4995 (_2!4374 lt!147333)))))))

(assert (=> d!31814 (invariant!0 (currentBit!4995 (_2!4374 lt!147333)) (currentByte!5000 (_2!4374 lt!147333)) (size!2176 (buf!2533 (_2!4374 lt!147333))))))

(assert (=> d!31814 (= (bitIndex!0 (size!2176 (buf!2533 (_2!4374 lt!147333))) (currentByte!5000 (_2!4374 lt!147333)) (currentBit!4995 (_2!4374 lt!147333))) lt!148249)))

(declare-fun b!101904 () Bool)

(declare-fun res!83742 () Bool)

(assert (=> b!101904 (=> (not res!83742) (not e!66613))))

(assert (=> b!101904 (= res!83742 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!148249))))

(declare-fun b!101905 () Bool)

(declare-fun lt!148244 () (_ BitVec 64))

(assert (=> b!101905 (= e!66613 (bvsle lt!148249 (bvmul lt!148244 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101905 (or (= lt!148244 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!148244 #b0000000000000000000000000000000000000000000000000000000000001000) lt!148244)))))

(assert (=> b!101905 (= lt!148244 ((_ sign_extend 32) (size!2176 (buf!2533 (_2!4374 lt!147333)))))))

(assert (= (and d!31814 res!83741) b!101904))

(assert (= (and b!101904 res!83742) b!101905))

(declare-fun m!148293 () Bool)

(assert (=> d!31814 m!148293))

(assert (=> d!31814 m!147849))

(assert (=> b!101538 d!31814))

(declare-fun d!31816 () Bool)

(declare-fun e!66614 () Bool)

(assert (=> d!31816 e!66614))

(declare-fun res!83743 () Bool)

(assert (=> d!31816 (=> (not res!83743) (not e!66614))))

(declare-fun lt!148252 () (_ BitVec 64))

(declare-fun lt!148254 () (_ BitVec 64))

(declare-fun lt!148255 () (_ BitVec 64))

(assert (=> d!31816 (= res!83743 (= lt!148255 (bvsub lt!148254 lt!148252)))))

(assert (=> d!31816 (or (= (bvand lt!148254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148252 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!148254 lt!148252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31816 (= lt!148252 (remainingBits!0 ((_ sign_extend 32) (size!2176 (buf!2533 thiss!1305))) ((_ sign_extend 32) (currentByte!5000 thiss!1305)) ((_ sign_extend 32) (currentBit!4995 thiss!1305))))))

(declare-fun lt!148253 () (_ BitVec 64))

(declare-fun lt!148251 () (_ BitVec 64))

(assert (=> d!31816 (= lt!148254 (bvmul lt!148253 lt!148251))))

(assert (=> d!31816 (or (= lt!148253 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!148251 (bvsdiv (bvmul lt!148253 lt!148251) lt!148253)))))

(assert (=> d!31816 (= lt!148251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31816 (= lt!148253 ((_ sign_extend 32) (size!2176 (buf!2533 thiss!1305))))))

(assert (=> d!31816 (= lt!148255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5000 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4995 thiss!1305))))))

(assert (=> d!31816 (invariant!0 (currentBit!4995 thiss!1305) (currentByte!5000 thiss!1305) (size!2176 (buf!2533 thiss!1305)))))

(assert (=> d!31816 (= (bitIndex!0 (size!2176 (buf!2533 thiss!1305)) (currentByte!5000 thiss!1305) (currentBit!4995 thiss!1305)) lt!148255)))

(declare-fun b!101906 () Bool)

(declare-fun res!83744 () Bool)

(assert (=> b!101906 (=> (not res!83744) (not e!66614))))

(assert (=> b!101906 (= res!83744 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!148255))))

(declare-fun b!101907 () Bool)

(declare-fun lt!148250 () (_ BitVec 64))

(assert (=> b!101907 (= e!66614 (bvsle lt!148255 (bvmul lt!148250 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101907 (or (= lt!148250 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!148250 #b0000000000000000000000000000000000000000000000000000000000001000) lt!148250)))))

(assert (=> b!101907 (= lt!148250 ((_ sign_extend 32) (size!2176 (buf!2533 thiss!1305))))))

(assert (= (and d!31816 res!83743) b!101906))

(assert (= (and b!101906 res!83744) b!101907))

(assert (=> d!31816 m!148291))

(assert (=> d!31816 m!147851))

(assert (=> b!101538 d!31816))

(declare-fun d!31818 () Bool)

(declare-fun e!66615 () Bool)

(assert (=> d!31818 e!66615))

(declare-fun res!83745 () Bool)

(assert (=> d!31818 (=> (not res!83745) (not e!66615))))

(declare-fun lt!148260 () (_ BitVec 64))

(declare-fun lt!148261 () (_ BitVec 64))

(declare-fun lt!148258 () (_ BitVec 64))

(assert (=> d!31818 (= res!83745 (= lt!148261 (bvsub lt!148260 lt!148258)))))

(assert (=> d!31818 (or (= (bvand lt!148260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!148258 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!148260 lt!148258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31818 (= lt!148258 (remainingBits!0 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4373 lt!147334)))) ((_ sign_extend 32) (currentByte!5000 (_1!4373 lt!147334))) ((_ sign_extend 32) (currentBit!4995 (_1!4373 lt!147334)))))))

(declare-fun lt!148259 () (_ BitVec 64))

(declare-fun lt!148257 () (_ BitVec 64))

(assert (=> d!31818 (= lt!148260 (bvmul lt!148259 lt!148257))))

(assert (=> d!31818 (or (= lt!148259 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!148257 (bvsdiv (bvmul lt!148259 lt!148257) lt!148259)))))

(assert (=> d!31818 (= lt!148257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31818 (= lt!148259 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4373 lt!147334)))))))

(assert (=> d!31818 (= lt!148261 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5000 (_1!4373 lt!147334))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4995 (_1!4373 lt!147334)))))))

(assert (=> d!31818 (invariant!0 (currentBit!4995 (_1!4373 lt!147334)) (currentByte!5000 (_1!4373 lt!147334)) (size!2176 (buf!2533 (_1!4373 lt!147334))))))

(assert (=> d!31818 (= (bitIndex!0 (size!2176 (buf!2533 (_1!4373 lt!147334))) (currentByte!5000 (_1!4373 lt!147334)) (currentBit!4995 (_1!4373 lt!147334))) lt!148261)))

(declare-fun b!101908 () Bool)

(declare-fun res!83746 () Bool)

(assert (=> b!101908 (=> (not res!83746) (not e!66615))))

(assert (=> b!101908 (= res!83746 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!148261))))

(declare-fun b!101909 () Bool)

(declare-fun lt!148256 () (_ BitVec 64))

(assert (=> b!101909 (= e!66615 (bvsle lt!148261 (bvmul lt!148256 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!101909 (or (= lt!148256 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!148256 #b0000000000000000000000000000000000000000000000000000000000001000) lt!148256)))))

(assert (=> b!101909 (= lt!148256 ((_ sign_extend 32) (size!2176 (buf!2533 (_1!4373 lt!147334)))))))

(assert (= (and d!31818 res!83745) b!101908))

(assert (= (and b!101908 res!83746) b!101909))

(declare-fun m!148295 () Bool)

(assert (=> d!31818 m!148295))

(declare-fun m!148297 () Bool)

(assert (=> d!31818 m!148297))

(assert (=> b!101533 d!31818))

(push 1)

(assert (not b!101844))

(assert (not b!101810))

(assert (not d!31808))

(assert (not d!31788))

(assert (not b!101875))

(assert (not d!31784))

(assert (not d!31802))

(assert (not d!31818))

(assert (not b!101839))

(assert (not d!31804))

(assert (not b!101815))

(assert (not d!31790))

(assert (not bm!1267))

(assert (not b!101846))

(assert (not b!101876))

(assert (not b!101817))

(assert (not d!31792))

(assert (not b!101808))

(assert (not b!101845))

(assert (not d!31800))

(assert (not b!101826))

(assert (not b!101840))

(assert (not d!31692))

(assert (not b!101877))

(assert (not d!31794))

(assert (not b!101652))

(assert (not b!101841))

(assert (not b!101837))

(assert (not b!101824))

(assert (not d!31812))

(assert (not b!101814))

(assert (not b!101874))

(assert (not d!31814))

(assert (not d!31798))

(assert (not b!101645))

(assert (not d!31690))

(assert (not d!31816))

(assert (not d!31694))

(assert (not b!101842))

(assert (not b!101816))

(assert (not b!101806))

(assert (not d!31796))

(assert (not b!101654))

(assert (not b!101813))

(assert (not b!101811))

(assert (not b!101807))

(assert (not d!31704))

(assert (not d!31806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

