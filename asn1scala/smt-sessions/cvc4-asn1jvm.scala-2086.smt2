; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52776 () Bool)

(assert start!52776)

(declare-fun b!244671 () Bool)

(declare-fun res!204532 () Bool)

(declare-fun e!169601 () Bool)

(assert (=> b!244671 (=> (not res!204532) (not e!169601))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!244671 (= res!204532 (bvslt from!289 nBits!297))))

(declare-fun b!244672 () Bool)

(declare-fun res!204529 () Bool)

(declare-fun e!169594 () Bool)

(assert (=> b!244672 (=> (not res!204529) (not e!169594))))

(declare-datatypes ((array!13395 0))(
  ( (array!13396 (arr!6861 (Array (_ BitVec 32) (_ BitVec 8))) (size!5874 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10670 0))(
  ( (BitStream!10671 (buf!6346 array!13395) (currentByte!11724 (_ BitVec 32)) (currentBit!11719 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17843 0))(
  ( (Unit!17844) )
))
(declare-datatypes ((tuple2!21006 0))(
  ( (tuple2!21007 (_1!11425 Unit!17843) (_2!11425 BitStream!10670)) )
))
(declare-fun lt!381303 () tuple2!21006)

(declare-fun lt!381301 () tuple2!21006)

(declare-fun isPrefixOf!0 (BitStream!10670 BitStream!10670) Bool)

(assert (=> b!244672 (= res!204529 (isPrefixOf!0 (_2!11425 lt!381303) (_2!11425 lt!381301)))))

(declare-fun b!244673 () Bool)

(declare-fun res!204531 () Bool)

(declare-fun e!169600 () Bool)

(assert (=> b!244673 (=> (not res!204531) (not e!169600))))

(declare-fun thiss!1005 () BitStream!10670)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244673 (= res!204531 (invariant!0 (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005) (size!5874 (buf!6346 (_2!11425 lt!381303)))))))

(declare-fun b!244674 () Bool)

(assert (=> b!244674 (= e!169600 (invariant!0 (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005) (size!5874 (buf!6346 (_2!11425 lt!381301)))))))

(declare-fun b!244675 () Bool)

(declare-fun e!169596 () Bool)

(declare-fun e!169593 () Bool)

(assert (=> b!244675 (= e!169596 e!169593)))

(declare-fun res!204527 () Bool)

(assert (=> b!244675 (=> (not res!204527) (not e!169593))))

(declare-fun lt!381288 () (_ BitVec 64))

(declare-fun lt!381293 () (_ BitVec 64))

(assert (=> b!244675 (= res!204527 (= lt!381288 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!381293)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244675 (= lt!381288 (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381303))) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303))))))

(assert (=> b!244675 (= lt!381293 (bitIndex!0 (size!5874 (buf!6346 thiss!1005)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005)))))

(declare-fun b!244676 () Bool)

(declare-fun e!169599 () Bool)

(assert (=> b!244676 (= e!169593 e!169599)))

(declare-fun res!204528 () Bool)

(assert (=> b!244676 (=> (not res!204528) (not e!169599))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21008 0))(
  ( (tuple2!21009 (_1!11426 BitStream!10670) (_2!11426 Bool)) )
))
(declare-fun lt!381302 () tuple2!21008)

(assert (=> b!244676 (= res!204528 (and (= (_2!11426 lt!381302) bit!26) (= (_1!11426 lt!381302) (_2!11425 lt!381303))))))

(declare-fun readBitPure!0 (BitStream!10670) tuple2!21008)

(declare-fun readerFrom!0 (BitStream!10670 (_ BitVec 32) (_ BitVec 32)) BitStream!10670)

(assert (=> b!244676 (= lt!381302 (readBitPure!0 (readerFrom!0 (_2!11425 lt!381303) (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005))))))

(declare-fun b!244677 () Bool)

(declare-fun lt!381283 () tuple2!21008)

(declare-datatypes ((tuple2!21010 0))(
  ( (tuple2!21011 (_1!11427 BitStream!10670) (_2!11427 BitStream!10670)) )
))
(declare-fun lt!381295 () tuple2!21010)

(assert (=> b!244677 (= e!169594 (not (or (not (_2!11426 lt!381283)) (not (= (_1!11426 lt!381283) (_2!11427 lt!381295))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10670 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21008)

(assert (=> b!244677 (= lt!381283 (checkBitsLoopPure!0 (_1!11427 lt!381295) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!381289 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244677 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) lt!381289)))

(declare-fun lt!381300 () Unit!17843)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10670 array!13395 (_ BitVec 64)) Unit!17843)

(assert (=> b!244677 (= lt!381300 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11425 lt!381303) (buf!6346 (_2!11425 lt!381301)) lt!381289))))

(declare-fun reader!0 (BitStream!10670 BitStream!10670) tuple2!21010)

(assert (=> b!244677 (= lt!381295 (reader!0 (_2!11425 lt!381303) (_2!11425 lt!381301)))))

(declare-fun res!204522 () Bool)

(assert (=> start!52776 (=> (not res!204522) (not e!169601))))

(assert (=> start!52776 (= res!204522 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52776 e!169601))

(assert (=> start!52776 true))

(declare-fun e!169597 () Bool)

(declare-fun inv!12 (BitStream!10670) Bool)

(assert (=> start!52776 (and (inv!12 thiss!1005) e!169597)))

(declare-fun b!244678 () Bool)

(declare-fun res!204534 () Bool)

(assert (=> b!244678 (=> (not res!204534) (not e!169601))))

(assert (=> b!244678 (= res!204534 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 thiss!1005))) ((_ sign_extend 32) (currentByte!11724 thiss!1005)) ((_ sign_extend 32) (currentBit!11719 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244679 () Bool)

(declare-fun e!169592 () Bool)

(assert (=> b!244679 (= e!169601 (not e!169592))))

(declare-fun res!204533 () Bool)

(assert (=> b!244679 (=> res!204533 e!169592)))

(assert (=> b!244679 (= res!204533 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!381296 () (_ BitVec 64))

(assert (=> b!244679 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) lt!381296)))

(declare-fun lt!381284 () Unit!17843)

(assert (=> b!244679 (= lt!381284 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11425 lt!381303) (buf!6346 (_2!11425 lt!381301)) lt!381296))))

(declare-fun lt!381298 () tuple2!21010)

(declare-fun lt!381292 () tuple2!21008)

(assert (=> b!244679 (= lt!381292 (checkBitsLoopPure!0 (_1!11427 lt!381298) nBits!297 bit!26 from!289))))

(assert (=> b!244679 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 thiss!1005)) ((_ sign_extend 32) (currentBit!11719 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!381285 () Unit!17843)

(assert (=> b!244679 (= lt!381285 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6346 (_2!11425 lt!381301)) (bvsub nBits!297 from!289)))))

(assert (=> b!244679 (= (_2!11426 (readBitPure!0 (_1!11427 lt!381298))) bit!26)))

(declare-fun lt!381287 () tuple2!21010)

(assert (=> b!244679 (= lt!381287 (reader!0 (_2!11425 lt!381303) (_2!11425 lt!381301)))))

(assert (=> b!244679 (= lt!381298 (reader!0 thiss!1005 (_2!11425 lt!381301)))))

(declare-fun e!169595 () Bool)

(assert (=> b!244679 e!169595))

(declare-fun res!204524 () Bool)

(assert (=> b!244679 (=> (not res!204524) (not e!169595))))

(declare-fun lt!381291 () tuple2!21008)

(declare-fun lt!381286 () tuple2!21008)

(assert (=> b!244679 (= res!204524 (= (bitIndex!0 (size!5874 (buf!6346 (_1!11426 lt!381291))) (currentByte!11724 (_1!11426 lt!381291)) (currentBit!11719 (_1!11426 lt!381291))) (bitIndex!0 (size!5874 (buf!6346 (_1!11426 lt!381286))) (currentByte!11724 (_1!11426 lt!381286)) (currentBit!11719 (_1!11426 lt!381286)))))))

(declare-fun lt!381294 () Unit!17843)

(declare-fun lt!381299 () BitStream!10670)

(declare-fun readBitPrefixLemma!0 (BitStream!10670 BitStream!10670) Unit!17843)

(assert (=> b!244679 (= lt!381294 (readBitPrefixLemma!0 lt!381299 (_2!11425 lt!381301)))))

(assert (=> b!244679 (= lt!381286 (readBitPure!0 (BitStream!10671 (buf!6346 (_2!11425 lt!381301)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005))))))

(assert (=> b!244679 (= lt!381291 (readBitPure!0 lt!381299))))

(assert (=> b!244679 (= lt!381299 (BitStream!10671 (buf!6346 (_2!11425 lt!381303)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005)))))

(assert (=> b!244679 e!169600))

(declare-fun res!204530 () Bool)

(assert (=> b!244679 (=> (not res!204530) (not e!169600))))

(assert (=> b!244679 (= res!204530 (isPrefixOf!0 thiss!1005 (_2!11425 lt!381301)))))

(declare-fun lt!381297 () Unit!17843)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10670 BitStream!10670 BitStream!10670) Unit!17843)

(assert (=> b!244679 (= lt!381297 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11425 lt!381303) (_2!11425 lt!381301)))))

(declare-fun e!169591 () Bool)

(assert (=> b!244679 e!169591))

(declare-fun res!204521 () Bool)

(assert (=> b!244679 (=> (not res!204521) (not e!169591))))

(assert (=> b!244679 (= res!204521 (= (size!5874 (buf!6346 (_2!11425 lt!381303))) (size!5874 (buf!6346 (_2!11425 lt!381301)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10670 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21006)

(assert (=> b!244679 (= lt!381301 (appendNBitsLoop!0 (_2!11425 lt!381303) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244679 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381303)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) lt!381296)))

(assert (=> b!244679 (= lt!381296 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!381290 () Unit!17843)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10670 BitStream!10670 (_ BitVec 64) (_ BitVec 64)) Unit!17843)

(assert (=> b!244679 (= lt!381290 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11425 lt!381303) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!244679 e!169596))

(declare-fun res!204526 () Bool)

(assert (=> b!244679 (=> (not res!204526) (not e!169596))))

(assert (=> b!244679 (= res!204526 (= (size!5874 (buf!6346 thiss!1005)) (size!5874 (buf!6346 (_2!11425 lt!381303)))))))

(declare-fun appendBit!0 (BitStream!10670 Bool) tuple2!21006)

(assert (=> b!244679 (= lt!381303 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244680 () Bool)

(assert (=> b!244680 (= e!169591 e!169594)))

(declare-fun res!204523 () Bool)

(assert (=> b!244680 (=> (not res!204523) (not e!169594))))

(assert (=> b!244680 (= res!204523 (= (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381301))) (currentByte!11724 (_2!11425 lt!381301)) (currentBit!11719 (_2!11425 lt!381301))) (bvadd (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381303))) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303))) lt!381289)))))

(assert (=> b!244680 (= lt!381289 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244681 () Bool)

(assert (=> b!244681 (= e!169592 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11427 lt!381287)))) ((_ sign_extend 32) (currentByte!11724 (_1!11427 lt!381287))) ((_ sign_extend 32) (currentBit!11719 (_1!11427 lt!381287))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun b!244682 () Bool)

(assert (=> b!244682 (= e!169599 (= (bitIndex!0 (size!5874 (buf!6346 (_1!11426 lt!381302))) (currentByte!11724 (_1!11426 lt!381302)) (currentBit!11719 (_1!11426 lt!381302))) lt!381288))))

(declare-fun b!244683 () Bool)

(declare-fun array_inv!5615 (array!13395) Bool)

(assert (=> b!244683 (= e!169597 (array_inv!5615 (buf!6346 thiss!1005)))))

(declare-fun b!244684 () Bool)

(declare-fun res!204525 () Bool)

(assert (=> b!244684 (=> (not res!204525) (not e!169593))))

(assert (=> b!244684 (= res!204525 (isPrefixOf!0 thiss!1005 (_2!11425 lt!381303)))))

(declare-fun b!244685 () Bool)

(assert (=> b!244685 (= e!169595 (= (_2!11426 lt!381291) (_2!11426 lt!381286)))))

(assert (= (and start!52776 res!204522) b!244678))

(assert (= (and b!244678 res!204534) b!244671))

(assert (= (and b!244671 res!204532) b!244679))

(assert (= (and b!244679 res!204526) b!244675))

(assert (= (and b!244675 res!204527) b!244684))

(assert (= (and b!244684 res!204525) b!244676))

(assert (= (and b!244676 res!204528) b!244682))

(assert (= (and b!244679 res!204521) b!244680))

(assert (= (and b!244680 res!204523) b!244672))

(assert (= (and b!244672 res!204529) b!244677))

(assert (= (and b!244679 res!204530) b!244673))

(assert (= (and b!244673 res!204531) b!244674))

(assert (= (and b!244679 res!204524) b!244685))

(assert (= (and b!244679 (not res!204533)) b!244681))

(assert (= start!52776 b!244683))

(declare-fun m!368783 () Bool)

(assert (=> b!244681 m!368783))

(declare-fun m!368785 () Bool)

(assert (=> b!244680 m!368785))

(declare-fun m!368787 () Bool)

(assert (=> b!244680 m!368787))

(declare-fun m!368789 () Bool)

(assert (=> b!244678 m!368789))

(declare-fun m!368791 () Bool)

(assert (=> b!244673 m!368791))

(declare-fun m!368793 () Bool)

(assert (=> start!52776 m!368793))

(declare-fun m!368795 () Bool)

(assert (=> b!244677 m!368795))

(declare-fun m!368797 () Bool)

(assert (=> b!244677 m!368797))

(declare-fun m!368799 () Bool)

(assert (=> b!244677 m!368799))

(declare-fun m!368801 () Bool)

(assert (=> b!244677 m!368801))

(declare-fun m!368803 () Bool)

(assert (=> b!244684 m!368803))

(declare-fun m!368805 () Bool)

(assert (=> b!244672 m!368805))

(declare-fun m!368807 () Bool)

(assert (=> b!244679 m!368807))

(declare-fun m!368809 () Bool)

(assert (=> b!244679 m!368809))

(declare-fun m!368811 () Bool)

(assert (=> b!244679 m!368811))

(declare-fun m!368813 () Bool)

(assert (=> b!244679 m!368813))

(declare-fun m!368815 () Bool)

(assert (=> b!244679 m!368815))

(declare-fun m!368817 () Bool)

(assert (=> b!244679 m!368817))

(declare-fun m!368819 () Bool)

(assert (=> b!244679 m!368819))

(declare-fun m!368821 () Bool)

(assert (=> b!244679 m!368821))

(assert (=> b!244679 m!368801))

(declare-fun m!368823 () Bool)

(assert (=> b!244679 m!368823))

(declare-fun m!368825 () Bool)

(assert (=> b!244679 m!368825))

(declare-fun m!368827 () Bool)

(assert (=> b!244679 m!368827))

(declare-fun m!368829 () Bool)

(assert (=> b!244679 m!368829))

(declare-fun m!368831 () Bool)

(assert (=> b!244679 m!368831))

(declare-fun m!368833 () Bool)

(assert (=> b!244679 m!368833))

(declare-fun m!368835 () Bool)

(assert (=> b!244679 m!368835))

(declare-fun m!368837 () Bool)

(assert (=> b!244679 m!368837))

(declare-fun m!368839 () Bool)

(assert (=> b!244679 m!368839))

(declare-fun m!368841 () Bool)

(assert (=> b!244679 m!368841))

(declare-fun m!368843 () Bool)

(assert (=> b!244683 m!368843))

(declare-fun m!368845 () Bool)

(assert (=> b!244674 m!368845))

(declare-fun m!368847 () Bool)

(assert (=> b!244682 m!368847))

(declare-fun m!368849 () Bool)

(assert (=> b!244676 m!368849))

(assert (=> b!244676 m!368849))

(declare-fun m!368851 () Bool)

(assert (=> b!244676 m!368851))

(assert (=> b!244675 m!368787))

(declare-fun m!368853 () Bool)

(assert (=> b!244675 m!368853))

(push 1)

(assert (not b!244676))

(assert (not b!244678))

(assert (not start!52776))

(assert (not b!244675))

(assert (not b!244680))

(assert (not b!244677))

(assert (not b!244679))

(assert (not b!244672))

(assert (not b!244682))

(assert (not b!244683))

(assert (not b!244673))

(assert (not b!244681))

(assert (not b!244684))

(assert (not b!244674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82000 () Bool)

(assert (=> d!82000 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) lt!381296)))

(declare-fun lt!381533 () Unit!17843)

(declare-fun choose!9 (BitStream!10670 array!13395 (_ BitVec 64) BitStream!10670) Unit!17843)

(assert (=> d!82000 (= lt!381533 (choose!9 (_2!11425 lt!381303) (buf!6346 (_2!11425 lt!381301)) lt!381296 (BitStream!10671 (buf!6346 (_2!11425 lt!381301)) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303)))))))

(assert (=> d!82000 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11425 lt!381303) (buf!6346 (_2!11425 lt!381301)) lt!381296) lt!381533)))

(declare-fun bs!20750 () Bool)

(assert (= bs!20750 d!82000))

(assert (=> bs!20750 m!368809))

(declare-fun m!369023 () Bool)

(assert (=> bs!20750 m!369023))

(assert (=> b!244679 d!82000))

(declare-fun d!82010 () Bool)

(declare-fun e!169664 () Bool)

(assert (=> d!82010 e!169664))

(declare-fun res!204639 () Bool)

(assert (=> d!82010 (=> (not res!204639) (not e!169664))))

(declare-fun lt!381555 () (_ BitVec 64))

(declare-fun lt!381560 () (_ BitVec 64))

(declare-fun lt!381558 () (_ BitVec 64))

(assert (=> d!82010 (= res!204639 (= lt!381560 (bvsub lt!381555 lt!381558)))))

(assert (=> d!82010 (or (= (bvand lt!381555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381558 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381555 lt!381558) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82010 (= lt!381558 (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11426 lt!381286)))) ((_ sign_extend 32) (currentByte!11724 (_1!11426 lt!381286))) ((_ sign_extend 32) (currentBit!11719 (_1!11426 lt!381286)))))))

(declare-fun lt!381559 () (_ BitVec 64))

(declare-fun lt!381556 () (_ BitVec 64))

(assert (=> d!82010 (= lt!381555 (bvmul lt!381559 lt!381556))))

(assert (=> d!82010 (or (= lt!381559 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381556 (bvsdiv (bvmul lt!381559 lt!381556) lt!381559)))))

(assert (=> d!82010 (= lt!381556 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82010 (= lt!381559 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11426 lt!381286)))))))

(assert (=> d!82010 (= lt!381560 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11724 (_1!11426 lt!381286))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11719 (_1!11426 lt!381286)))))))

(assert (=> d!82010 (invariant!0 (currentBit!11719 (_1!11426 lt!381286)) (currentByte!11724 (_1!11426 lt!381286)) (size!5874 (buf!6346 (_1!11426 lt!381286))))))

(assert (=> d!82010 (= (bitIndex!0 (size!5874 (buf!6346 (_1!11426 lt!381286))) (currentByte!11724 (_1!11426 lt!381286)) (currentBit!11719 (_1!11426 lt!381286))) lt!381560)))

(declare-fun b!244796 () Bool)

(declare-fun res!204638 () Bool)

(assert (=> b!244796 (=> (not res!204638) (not e!169664))))

(assert (=> b!244796 (= res!204638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381560))))

(declare-fun b!244797 () Bool)

(declare-fun lt!381557 () (_ BitVec 64))

(assert (=> b!244797 (= e!169664 (bvsle lt!381560 (bvmul lt!381557 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244797 (or (= lt!381557 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381557 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381557)))))

(assert (=> b!244797 (= lt!381557 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11426 lt!381286)))))))

(assert (= (and d!82010 res!204639) b!244796))

(assert (= (and b!244796 res!204638) b!244797))

(declare-fun m!369031 () Bool)

(assert (=> d!82010 m!369031))

(declare-fun m!369033 () Bool)

(assert (=> d!82010 m!369033))

(assert (=> b!244679 d!82010))

(declare-fun d!82022 () Bool)

(declare-fun e!169671 () Bool)

(assert (=> d!82022 e!169671))

(declare-fun res!204649 () Bool)

(assert (=> d!82022 (=> (not res!204649) (not e!169671))))

(declare-fun lt!381617 () tuple2!21010)

(assert (=> d!82022 (= res!204649 (isPrefixOf!0 (_1!11427 lt!381617) (_2!11427 lt!381617)))))

(declare-fun lt!381607 () BitStream!10670)

(assert (=> d!82022 (= lt!381617 (tuple2!21011 lt!381607 (_2!11425 lt!381301)))))

(declare-fun lt!381621 () Unit!17843)

(declare-fun lt!381619 () Unit!17843)

(assert (=> d!82022 (= lt!381621 lt!381619)))

(assert (=> d!82022 (isPrefixOf!0 lt!381607 (_2!11425 lt!381301))))

(assert (=> d!82022 (= lt!381619 (lemmaIsPrefixTransitive!0 lt!381607 (_2!11425 lt!381301) (_2!11425 lt!381301)))))

(declare-fun lt!381609 () Unit!17843)

(declare-fun lt!381611 () Unit!17843)

(assert (=> d!82022 (= lt!381609 lt!381611)))

(assert (=> d!82022 (isPrefixOf!0 lt!381607 (_2!11425 lt!381301))))

(assert (=> d!82022 (= lt!381611 (lemmaIsPrefixTransitive!0 lt!381607 thiss!1005 (_2!11425 lt!381301)))))

(declare-fun lt!381608 () Unit!17843)

(declare-fun e!169672 () Unit!17843)

(assert (=> d!82022 (= lt!381608 e!169672)))

(declare-fun c!11471 () Bool)

(assert (=> d!82022 (= c!11471 (not (= (size!5874 (buf!6346 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!381618 () Unit!17843)

(declare-fun lt!381614 () Unit!17843)

(assert (=> d!82022 (= lt!381618 lt!381614)))

(assert (=> d!82022 (isPrefixOf!0 (_2!11425 lt!381301) (_2!11425 lt!381301))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10670) Unit!17843)

(assert (=> d!82022 (= lt!381614 (lemmaIsPrefixRefl!0 (_2!11425 lt!381301)))))

(declare-fun lt!381623 () Unit!17843)

(declare-fun lt!381615 () Unit!17843)

(assert (=> d!82022 (= lt!381623 lt!381615)))

(assert (=> d!82022 (= lt!381615 (lemmaIsPrefixRefl!0 (_2!11425 lt!381301)))))

(declare-fun lt!381622 () Unit!17843)

(declare-fun lt!381626 () Unit!17843)

(assert (=> d!82022 (= lt!381622 lt!381626)))

(assert (=> d!82022 (isPrefixOf!0 lt!381607 lt!381607)))

(assert (=> d!82022 (= lt!381626 (lemmaIsPrefixRefl!0 lt!381607))))

(declare-fun lt!381610 () Unit!17843)

(declare-fun lt!381625 () Unit!17843)

(assert (=> d!82022 (= lt!381610 lt!381625)))

(assert (=> d!82022 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82022 (= lt!381625 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82022 (= lt!381607 (BitStream!10671 (buf!6346 (_2!11425 lt!381301)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005)))))

(assert (=> d!82022 (isPrefixOf!0 thiss!1005 (_2!11425 lt!381301))))

(assert (=> d!82022 (= (reader!0 thiss!1005 (_2!11425 lt!381301)) lt!381617)))

(declare-fun b!244811 () Bool)

(declare-fun lt!381613 () Unit!17843)

(assert (=> b!244811 (= e!169672 lt!381613)))

(declare-fun lt!381612 () (_ BitVec 64))

(assert (=> b!244811 (= lt!381612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!381616 () (_ BitVec 64))

(assert (=> b!244811 (= lt!381616 (bitIndex!0 (size!5874 (buf!6346 thiss!1005)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13395 array!13395 (_ BitVec 64) (_ BitVec 64)) Unit!17843)

(assert (=> b!244811 (= lt!381613 (arrayBitRangesEqSymmetric!0 (buf!6346 thiss!1005) (buf!6346 (_2!11425 lt!381301)) lt!381612 lt!381616))))

(declare-fun arrayBitRangesEq!0 (array!13395 array!13395 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244811 (arrayBitRangesEq!0 (buf!6346 (_2!11425 lt!381301)) (buf!6346 thiss!1005) lt!381612 lt!381616)))

(declare-fun lt!381624 () (_ BitVec 64))

(declare-fun lt!381620 () (_ BitVec 64))

(declare-fun b!244812 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10670 (_ BitVec 64)) BitStream!10670)

(assert (=> b!244812 (= e!169671 (= (_1!11427 lt!381617) (withMovedBitIndex!0 (_2!11427 lt!381617) (bvsub lt!381620 lt!381624))))))

(assert (=> b!244812 (or (= (bvand lt!381620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381624 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381620 lt!381624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244812 (= lt!381624 (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381301))) (currentByte!11724 (_2!11425 lt!381301)) (currentBit!11719 (_2!11425 lt!381301))))))

(assert (=> b!244812 (= lt!381620 (bitIndex!0 (size!5874 (buf!6346 thiss!1005)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005)))))

(declare-fun b!244813 () Bool)

(declare-fun res!204650 () Bool)

(assert (=> b!244813 (=> (not res!204650) (not e!169671))))

(assert (=> b!244813 (= res!204650 (isPrefixOf!0 (_1!11427 lt!381617) thiss!1005))))

(declare-fun b!244814 () Bool)

(declare-fun Unit!17847 () Unit!17843)

(assert (=> b!244814 (= e!169672 Unit!17847)))

(declare-fun b!244815 () Bool)

(declare-fun res!204651 () Bool)

(assert (=> b!244815 (=> (not res!204651) (not e!169671))))

(assert (=> b!244815 (= res!204651 (isPrefixOf!0 (_2!11427 lt!381617) (_2!11425 lt!381301)))))

(assert (= (and d!82022 c!11471) b!244811))

(assert (= (and d!82022 (not c!11471)) b!244814))

(assert (= (and d!82022 res!204649) b!244813))

(assert (= (and b!244813 res!204650) b!244815))

(assert (= (and b!244815 res!204651) b!244812))

(assert (=> b!244811 m!368853))

(declare-fun m!369043 () Bool)

(assert (=> b!244811 m!369043))

(declare-fun m!369045 () Bool)

(assert (=> b!244811 m!369045))

(declare-fun m!369047 () Bool)

(assert (=> b!244815 m!369047))

(declare-fun m!369049 () Bool)

(assert (=> d!82022 m!369049))

(declare-fun m!369051 () Bool)

(assert (=> d!82022 m!369051))

(declare-fun m!369053 () Bool)

(assert (=> d!82022 m!369053))

(declare-fun m!369055 () Bool)

(assert (=> d!82022 m!369055))

(assert (=> d!82022 m!368813))

(declare-fun m!369057 () Bool)

(assert (=> d!82022 m!369057))

(declare-fun m!369059 () Bool)

(assert (=> d!82022 m!369059))

(declare-fun m!369061 () Bool)

(assert (=> d!82022 m!369061))

(declare-fun m!369063 () Bool)

(assert (=> d!82022 m!369063))

(declare-fun m!369065 () Bool)

(assert (=> d!82022 m!369065))

(declare-fun m!369067 () Bool)

(assert (=> d!82022 m!369067))

(declare-fun m!369069 () Bool)

(assert (=> b!244812 m!369069))

(assert (=> b!244812 m!368785))

(assert (=> b!244812 m!368853))

(declare-fun m!369071 () Bool)

(assert (=> b!244813 m!369071))

(assert (=> b!244679 d!82022))

(declare-fun d!82034 () Bool)

(declare-fun res!204659 () Bool)

(declare-fun e!169678 () Bool)

(assert (=> d!82034 (=> (not res!204659) (not e!169678))))

(assert (=> d!82034 (= res!204659 (= (size!5874 (buf!6346 thiss!1005)) (size!5874 (buf!6346 (_2!11425 lt!381301)))))))

(assert (=> d!82034 (= (isPrefixOf!0 thiss!1005 (_2!11425 lt!381301)) e!169678)))

(declare-fun b!244822 () Bool)

(declare-fun res!204658 () Bool)

(assert (=> b!244822 (=> (not res!204658) (not e!169678))))

(assert (=> b!244822 (= res!204658 (bvsle (bitIndex!0 (size!5874 (buf!6346 thiss!1005)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005)) (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381301))) (currentByte!11724 (_2!11425 lt!381301)) (currentBit!11719 (_2!11425 lt!381301)))))))

(declare-fun b!244823 () Bool)

(declare-fun e!169677 () Bool)

(assert (=> b!244823 (= e!169678 e!169677)))

(declare-fun res!204660 () Bool)

(assert (=> b!244823 (=> res!204660 e!169677)))

(assert (=> b!244823 (= res!204660 (= (size!5874 (buf!6346 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!244824 () Bool)

(assert (=> b!244824 (= e!169677 (arrayBitRangesEq!0 (buf!6346 thiss!1005) (buf!6346 (_2!11425 lt!381301)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5874 (buf!6346 thiss!1005)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005))))))

(assert (= (and d!82034 res!204659) b!244822))

(assert (= (and b!244822 res!204658) b!244823))

(assert (= (and b!244823 (not res!204660)) b!244824))

(assert (=> b!244822 m!368853))

(assert (=> b!244822 m!368785))

(assert (=> b!244824 m!368853))

(assert (=> b!244824 m!368853))

(declare-fun m!369073 () Bool)

(assert (=> b!244824 m!369073))

(assert (=> b!244679 d!82034))

(declare-fun d!82036 () Bool)

(declare-fun e!169679 () Bool)

(assert (=> d!82036 e!169679))

(declare-fun res!204661 () Bool)

(assert (=> d!82036 (=> (not res!204661) (not e!169679))))

(declare-fun lt!381637 () tuple2!21010)

(assert (=> d!82036 (= res!204661 (isPrefixOf!0 (_1!11427 lt!381637) (_2!11427 lt!381637)))))

(declare-fun lt!381627 () BitStream!10670)

(assert (=> d!82036 (= lt!381637 (tuple2!21011 lt!381627 (_2!11425 lt!381301)))))

(declare-fun lt!381641 () Unit!17843)

(declare-fun lt!381639 () Unit!17843)

(assert (=> d!82036 (= lt!381641 lt!381639)))

(assert (=> d!82036 (isPrefixOf!0 lt!381627 (_2!11425 lt!381301))))

(assert (=> d!82036 (= lt!381639 (lemmaIsPrefixTransitive!0 lt!381627 (_2!11425 lt!381301) (_2!11425 lt!381301)))))

(declare-fun lt!381629 () Unit!17843)

(declare-fun lt!381631 () Unit!17843)

(assert (=> d!82036 (= lt!381629 lt!381631)))

(assert (=> d!82036 (isPrefixOf!0 lt!381627 (_2!11425 lt!381301))))

(assert (=> d!82036 (= lt!381631 (lemmaIsPrefixTransitive!0 lt!381627 (_2!11425 lt!381303) (_2!11425 lt!381301)))))

(declare-fun lt!381628 () Unit!17843)

(declare-fun e!169680 () Unit!17843)

(assert (=> d!82036 (= lt!381628 e!169680)))

(declare-fun c!11472 () Bool)

(assert (=> d!82036 (= c!11472 (not (= (size!5874 (buf!6346 (_2!11425 lt!381303))) #b00000000000000000000000000000000)))))

(declare-fun lt!381638 () Unit!17843)

(declare-fun lt!381634 () Unit!17843)

(assert (=> d!82036 (= lt!381638 lt!381634)))

(assert (=> d!82036 (isPrefixOf!0 (_2!11425 lt!381301) (_2!11425 lt!381301))))

(assert (=> d!82036 (= lt!381634 (lemmaIsPrefixRefl!0 (_2!11425 lt!381301)))))

(declare-fun lt!381643 () Unit!17843)

(declare-fun lt!381635 () Unit!17843)

(assert (=> d!82036 (= lt!381643 lt!381635)))

(assert (=> d!82036 (= lt!381635 (lemmaIsPrefixRefl!0 (_2!11425 lt!381301)))))

(declare-fun lt!381642 () Unit!17843)

(declare-fun lt!381646 () Unit!17843)

(assert (=> d!82036 (= lt!381642 lt!381646)))

(assert (=> d!82036 (isPrefixOf!0 lt!381627 lt!381627)))

(assert (=> d!82036 (= lt!381646 (lemmaIsPrefixRefl!0 lt!381627))))

(declare-fun lt!381630 () Unit!17843)

(declare-fun lt!381645 () Unit!17843)

(assert (=> d!82036 (= lt!381630 lt!381645)))

(assert (=> d!82036 (isPrefixOf!0 (_2!11425 lt!381303) (_2!11425 lt!381303))))

(assert (=> d!82036 (= lt!381645 (lemmaIsPrefixRefl!0 (_2!11425 lt!381303)))))

(assert (=> d!82036 (= lt!381627 (BitStream!10671 (buf!6346 (_2!11425 lt!381301)) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303))))))

(assert (=> d!82036 (isPrefixOf!0 (_2!11425 lt!381303) (_2!11425 lt!381301))))

(assert (=> d!82036 (= (reader!0 (_2!11425 lt!381303) (_2!11425 lt!381301)) lt!381637)))

(declare-fun b!244825 () Bool)

(declare-fun lt!381633 () Unit!17843)

(assert (=> b!244825 (= e!169680 lt!381633)))

(declare-fun lt!381632 () (_ BitVec 64))

(assert (=> b!244825 (= lt!381632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!381636 () (_ BitVec 64))

(assert (=> b!244825 (= lt!381636 (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381303))) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303))))))

(assert (=> b!244825 (= lt!381633 (arrayBitRangesEqSymmetric!0 (buf!6346 (_2!11425 lt!381303)) (buf!6346 (_2!11425 lt!381301)) lt!381632 lt!381636))))

(assert (=> b!244825 (arrayBitRangesEq!0 (buf!6346 (_2!11425 lt!381301)) (buf!6346 (_2!11425 lt!381303)) lt!381632 lt!381636)))

(declare-fun lt!381644 () (_ BitVec 64))

(declare-fun lt!381640 () (_ BitVec 64))

(declare-fun b!244826 () Bool)

(assert (=> b!244826 (= e!169679 (= (_1!11427 lt!381637) (withMovedBitIndex!0 (_2!11427 lt!381637) (bvsub lt!381640 lt!381644))))))

(assert (=> b!244826 (or (= (bvand lt!381640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381644 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381640 lt!381644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244826 (= lt!381644 (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381301))) (currentByte!11724 (_2!11425 lt!381301)) (currentBit!11719 (_2!11425 lt!381301))))))

(assert (=> b!244826 (= lt!381640 (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381303))) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303))))))

(declare-fun b!244827 () Bool)

(declare-fun res!204662 () Bool)

(assert (=> b!244827 (=> (not res!204662) (not e!169679))))

(assert (=> b!244827 (= res!204662 (isPrefixOf!0 (_1!11427 lt!381637) (_2!11425 lt!381303)))))

(declare-fun b!244828 () Bool)

(declare-fun Unit!17848 () Unit!17843)

(assert (=> b!244828 (= e!169680 Unit!17848)))

(declare-fun b!244829 () Bool)

(declare-fun res!204663 () Bool)

(assert (=> b!244829 (=> (not res!204663) (not e!169679))))

(assert (=> b!244829 (= res!204663 (isPrefixOf!0 (_2!11427 lt!381637) (_2!11425 lt!381301)))))

(assert (= (and d!82036 c!11472) b!244825))

(assert (= (and d!82036 (not c!11472)) b!244828))

(assert (= (and d!82036 res!204661) b!244827))

(assert (= (and b!244827 res!204662) b!244829))

(assert (= (and b!244829 res!204663) b!244826))

(assert (=> b!244825 m!368787))

(declare-fun m!369075 () Bool)

(assert (=> b!244825 m!369075))

(declare-fun m!369077 () Bool)

(assert (=> b!244825 m!369077))

(declare-fun m!369079 () Bool)

(assert (=> b!244829 m!369079))

(declare-fun m!369081 () Bool)

(assert (=> d!82036 m!369081))

(declare-fun m!369083 () Bool)

(assert (=> d!82036 m!369083))

(declare-fun m!369085 () Bool)

(assert (=> d!82036 m!369085))

(declare-fun m!369087 () Bool)

(assert (=> d!82036 m!369087))

(assert (=> d!82036 m!368805))

(assert (=> d!82036 m!369057))

(declare-fun m!369089 () Bool)

(assert (=> d!82036 m!369089))

(declare-fun m!369091 () Bool)

(assert (=> d!82036 m!369091))

(assert (=> d!82036 m!369063))

(declare-fun m!369093 () Bool)

(assert (=> d!82036 m!369093))

(declare-fun m!369095 () Bool)

(assert (=> d!82036 m!369095))

(declare-fun m!369097 () Bool)

(assert (=> b!244826 m!369097))

(assert (=> b!244826 m!368785))

(assert (=> b!244826 m!368787))

(declare-fun m!369099 () Bool)

(assert (=> b!244827 m!369099))

(assert (=> b!244679 d!82036))

(declare-fun d!82038 () Bool)

(declare-fun e!169683 () Bool)

(assert (=> d!82038 e!169683))

(declare-fun res!204666 () Bool)

(assert (=> d!82038 (=> (not res!204666) (not e!169683))))

(assert (=> d!82038 (= res!204666 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!381649 () Unit!17843)

(declare-fun choose!27 (BitStream!10670 BitStream!10670 (_ BitVec 64) (_ BitVec 64)) Unit!17843)

(assert (=> d!82038 (= lt!381649 (choose!27 thiss!1005 (_2!11425 lt!381303) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82038 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82038 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11425 lt!381303) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!381649)))

(declare-fun b!244832 () Bool)

(assert (=> b!244832 (= e!169683 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381303)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82038 res!204666) b!244832))

(declare-fun m!369101 () Bool)

(assert (=> d!82038 m!369101))

(declare-fun m!369103 () Bool)

(assert (=> b!244832 m!369103))

(assert (=> b!244679 d!82038))

(declare-fun d!82040 () Bool)

(declare-fun e!169684 () Bool)

(assert (=> d!82040 e!169684))

(declare-fun res!204668 () Bool)

(assert (=> d!82040 (=> (not res!204668) (not e!169684))))

(declare-fun lt!381653 () (_ BitVec 64))

(declare-fun lt!381650 () (_ BitVec 64))

(declare-fun lt!381655 () (_ BitVec 64))

(assert (=> d!82040 (= res!204668 (= lt!381655 (bvsub lt!381650 lt!381653)))))

(assert (=> d!82040 (or (= (bvand lt!381650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381650 lt!381653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82040 (= lt!381653 (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11426 lt!381291)))) ((_ sign_extend 32) (currentByte!11724 (_1!11426 lt!381291))) ((_ sign_extend 32) (currentBit!11719 (_1!11426 lt!381291)))))))

(declare-fun lt!381654 () (_ BitVec 64))

(declare-fun lt!381651 () (_ BitVec 64))

(assert (=> d!82040 (= lt!381650 (bvmul lt!381654 lt!381651))))

(assert (=> d!82040 (or (= lt!381654 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381651 (bvsdiv (bvmul lt!381654 lt!381651) lt!381654)))))

(assert (=> d!82040 (= lt!381651 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82040 (= lt!381654 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11426 lt!381291)))))))

(assert (=> d!82040 (= lt!381655 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11724 (_1!11426 lt!381291))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11719 (_1!11426 lt!381291)))))))

(assert (=> d!82040 (invariant!0 (currentBit!11719 (_1!11426 lt!381291)) (currentByte!11724 (_1!11426 lt!381291)) (size!5874 (buf!6346 (_1!11426 lt!381291))))))

(assert (=> d!82040 (= (bitIndex!0 (size!5874 (buf!6346 (_1!11426 lt!381291))) (currentByte!11724 (_1!11426 lt!381291)) (currentBit!11719 (_1!11426 lt!381291))) lt!381655)))

(declare-fun b!244833 () Bool)

(declare-fun res!204667 () Bool)

(assert (=> b!244833 (=> (not res!204667) (not e!169684))))

(assert (=> b!244833 (= res!204667 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381655))))

(declare-fun b!244834 () Bool)

(declare-fun lt!381652 () (_ BitVec 64))

(assert (=> b!244834 (= e!169684 (bvsle lt!381655 (bvmul lt!381652 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244834 (or (= lt!381652 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381652 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381652)))))

(assert (=> b!244834 (= lt!381652 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11426 lt!381291)))))))

(assert (= (and d!82040 res!204668) b!244833))

(assert (= (and b!244833 res!204667) b!244834))

(declare-fun m!369105 () Bool)

(assert (=> d!82040 m!369105))

(declare-fun m!369107 () Bool)

(assert (=> d!82040 m!369107))

(assert (=> b!244679 d!82040))

(declare-fun d!82042 () Bool)

(declare-datatypes ((tuple2!21016 0))(
  ( (tuple2!21017 (_1!11430 Bool) (_2!11430 BitStream!10670)) )
))
(declare-fun lt!381658 () tuple2!21016)

(declare-fun readBit!0 (BitStream!10670) tuple2!21016)

(assert (=> d!82042 (= lt!381658 (readBit!0 (BitStream!10671 (buf!6346 (_2!11425 lt!381301)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005))))))

(assert (=> d!82042 (= (readBitPure!0 (BitStream!10671 (buf!6346 (_2!11425 lt!381301)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005))) (tuple2!21009 (_2!11430 lt!381658) (_1!11430 lt!381658)))))

(declare-fun bs!20757 () Bool)

(assert (= bs!20757 d!82042))

(declare-fun m!369109 () Bool)

(assert (=> bs!20757 m!369109))

(assert (=> b!244679 d!82042))

(declare-fun b!244861 () Bool)

(declare-fun res!204697 () Bool)

(declare-fun e!169700 () Bool)

(assert (=> b!244861 (=> (not res!204697) (not e!169700))))

(declare-fun lt!381712 () (_ BitVec 64))

(declare-fun lt!381713 () (_ BitVec 64))

(declare-fun lt!381714 () tuple2!21006)

(assert (=> b!244861 (= res!204697 (= (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381714))) (currentByte!11724 (_2!11425 lt!381714)) (currentBit!11719 (_2!11425 lt!381714))) (bvadd lt!381713 lt!381712)))))

(assert (=> b!244861 (or (not (= (bvand lt!381713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381712 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!381713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!381713 lt!381712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244861 (= lt!381712 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!244861 (= lt!381713 (bitIndex!0 (size!5874 (buf!6346 thiss!1005)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005)))))

(declare-fun d!82044 () Bool)

(assert (=> d!82044 e!169700))

(declare-fun res!204694 () Bool)

(assert (=> d!82044 (=> (not res!204694) (not e!169700))))

(assert (=> d!82044 (= res!204694 (= (size!5874 (buf!6346 thiss!1005)) (size!5874 (buf!6346 (_2!11425 lt!381714)))))))

(declare-fun choose!16 (BitStream!10670 Bool) tuple2!21006)

(assert (=> d!82044 (= lt!381714 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82044 (validate_offset_bit!0 ((_ sign_extend 32) (size!5874 (buf!6346 thiss!1005))) ((_ sign_extend 32) (currentByte!11724 thiss!1005)) ((_ sign_extend 32) (currentBit!11719 thiss!1005)))))

(assert (=> d!82044 (= (appendBit!0 thiss!1005 bit!26) lt!381714)))

(declare-fun b!244863 () Bool)

(declare-fun e!169699 () Bool)

(assert (=> b!244863 (= e!169700 e!169699)))

(declare-fun res!204695 () Bool)

(assert (=> b!244863 (=> (not res!204695) (not e!169699))))

(declare-fun lt!381715 () tuple2!21008)

(assert (=> b!244863 (= res!204695 (and (= (_2!11426 lt!381715) bit!26) (= (_1!11426 lt!381715) (_2!11425 lt!381714))))))

(assert (=> b!244863 (= lt!381715 (readBitPure!0 (readerFrom!0 (_2!11425 lt!381714) (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005))))))

(declare-fun b!244864 () Bool)

(assert (=> b!244864 (= e!169699 (= (bitIndex!0 (size!5874 (buf!6346 (_1!11426 lt!381715))) (currentByte!11724 (_1!11426 lt!381715)) (currentBit!11719 (_1!11426 lt!381715))) (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381714))) (currentByte!11724 (_2!11425 lt!381714)) (currentBit!11719 (_2!11425 lt!381714)))))))

(declare-fun b!244862 () Bool)

(declare-fun res!204696 () Bool)

(assert (=> b!244862 (=> (not res!204696) (not e!169700))))

(assert (=> b!244862 (= res!204696 (isPrefixOf!0 thiss!1005 (_2!11425 lt!381714)))))

(assert (= (and d!82044 res!204694) b!244861))

(assert (= (and b!244861 res!204697) b!244862))

(assert (= (and b!244862 res!204696) b!244863))

(assert (= (and b!244863 res!204695) b!244864))

(declare-fun m!369149 () Bool)

(assert (=> d!82044 m!369149))

(declare-fun m!369151 () Bool)

(assert (=> d!82044 m!369151))

(declare-fun m!369153 () Bool)

(assert (=> b!244862 m!369153))

(declare-fun m!369155 () Bool)

(assert (=> b!244863 m!369155))

(assert (=> b!244863 m!369155))

(declare-fun m!369157 () Bool)

(assert (=> b!244863 m!369157))

(declare-fun m!369159 () Bool)

(assert (=> b!244861 m!369159))

(assert (=> b!244861 m!368853))

(declare-fun m!369161 () Bool)

(assert (=> b!244864 m!369161))

(assert (=> b!244864 m!369159))

(assert (=> b!244679 d!82044))

(declare-fun d!82062 () Bool)

(declare-fun lt!381716 () tuple2!21016)

(assert (=> d!82062 (= lt!381716 (readBit!0 lt!381299))))

(assert (=> d!82062 (= (readBitPure!0 lt!381299) (tuple2!21009 (_2!11430 lt!381716) (_1!11430 lt!381716)))))

(declare-fun bs!20763 () Bool)

(assert (= bs!20763 d!82062))

(declare-fun m!369163 () Bool)

(assert (=> bs!20763 m!369163))

(assert (=> b!244679 d!82062))

(declare-fun b!244897 () Bool)

(declare-fun res!204725 () Bool)

(declare-fun e!169716 () Bool)

(assert (=> b!244897 (=> (not res!204725) (not e!169716))))

(declare-fun lt!381786 () tuple2!21006)

(assert (=> b!244897 (= res!204725 (isPrefixOf!0 (_2!11425 lt!381303) (_2!11425 lt!381786)))))

(declare-fun b!244899 () Bool)

(declare-fun e!169715 () Bool)

(declare-fun lt!381789 () (_ BitVec 64))

(assert (=> b!244899 (= e!169715 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381303)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) lt!381789))))

(declare-fun d!82064 () Bool)

(assert (=> d!82064 e!169716))

(declare-fun res!204724 () Bool)

(assert (=> d!82064 (=> (not res!204724) (not e!169716))))

(assert (=> d!82064 (= res!204724 (= (size!5874 (buf!6346 (_2!11425 lt!381303))) (size!5874 (buf!6346 (_2!11425 lt!381786)))))))

(declare-fun choose!51 (BitStream!10670 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21006)

(assert (=> d!82064 (= lt!381786 (choose!51 (_2!11425 lt!381303) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82064 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82064 (= (appendNBitsLoop!0 (_2!11425 lt!381303) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!381786)))

(declare-fun b!244898 () Bool)

(declare-fun lt!381790 () tuple2!21008)

(declare-fun lt!381785 () tuple2!21010)

(assert (=> b!244898 (= e!169716 (and (_2!11426 lt!381790) (= (_1!11426 lt!381790) (_2!11427 lt!381785))))))

(assert (=> b!244898 (= lt!381790 (checkBitsLoopPure!0 (_1!11427 lt!381785) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!381787 () Unit!17843)

(declare-fun lt!381788 () Unit!17843)

(assert (=> b!244898 (= lt!381787 lt!381788)))

(assert (=> b!244898 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381786)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) lt!381789)))

(assert (=> b!244898 (= lt!381788 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11425 lt!381303) (buf!6346 (_2!11425 lt!381786)) lt!381789))))

(assert (=> b!244898 e!169715))

(declare-fun res!204727 () Bool)

(assert (=> b!244898 (=> (not res!204727) (not e!169715))))

(assert (=> b!244898 (= res!204727 (and (= (size!5874 (buf!6346 (_2!11425 lt!381303))) (size!5874 (buf!6346 (_2!11425 lt!381786)))) (bvsge lt!381789 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244898 (= lt!381789 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244898 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244898 (= lt!381785 (reader!0 (_2!11425 lt!381303) (_2!11425 lt!381786)))))

(declare-fun b!244896 () Bool)

(declare-fun res!204726 () Bool)

(assert (=> b!244896 (=> (not res!204726) (not e!169716))))

(declare-fun lt!381791 () (_ BitVec 64))

(declare-fun lt!381792 () (_ BitVec 64))

(assert (=> b!244896 (= res!204726 (= (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381786))) (currentByte!11724 (_2!11425 lt!381786)) (currentBit!11719 (_2!11425 lt!381786))) (bvadd lt!381792 lt!381791)))))

(assert (=> b!244896 (or (not (= (bvand lt!381792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381791 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!381792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!381792 lt!381791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244896 (= lt!381791 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244896 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244896 (= lt!381792 (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381303))) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303))))))

(assert (= (and d!82064 res!204724) b!244896))

(assert (= (and b!244896 res!204726) b!244897))

(assert (= (and b!244897 res!204725) b!244898))

(assert (= (and b!244898 res!204727) b!244899))

(declare-fun m!369179 () Bool)

(assert (=> b!244896 m!369179))

(assert (=> b!244896 m!368787))

(declare-fun m!369181 () Bool)

(assert (=> b!244897 m!369181))

(declare-fun m!369183 () Bool)

(assert (=> b!244899 m!369183))

(declare-fun m!369185 () Bool)

(assert (=> d!82064 m!369185))

(declare-fun m!369187 () Bool)

(assert (=> b!244898 m!369187))

(declare-fun m!369189 () Bool)

(assert (=> b!244898 m!369189))

(declare-fun m!369191 () Bool)

(assert (=> b!244898 m!369191))

(declare-fun m!369193 () Bool)

(assert (=> b!244898 m!369193))

(assert (=> b!244679 d!82064))

(declare-fun d!82068 () Bool)

(declare-fun e!169727 () Bool)

(assert (=> d!82068 e!169727))

(declare-fun res!204741 () Bool)

(assert (=> d!82068 (=> (not res!204741) (not e!169727))))

(declare-fun lt!381833 () tuple2!21008)

(declare-fun lt!381832 () tuple2!21008)

(assert (=> d!82068 (= res!204741 (= (bitIndex!0 (size!5874 (buf!6346 (_1!11426 lt!381833))) (currentByte!11724 (_1!11426 lt!381833)) (currentBit!11719 (_1!11426 lt!381833))) (bitIndex!0 (size!5874 (buf!6346 (_1!11426 lt!381832))) (currentByte!11724 (_1!11426 lt!381832)) (currentBit!11719 (_1!11426 lt!381832)))))))

(declare-fun lt!381831 () BitStream!10670)

(declare-fun lt!381834 () Unit!17843)

(declare-fun choose!50 (BitStream!10670 BitStream!10670 BitStream!10670 tuple2!21008 tuple2!21008 BitStream!10670 Bool tuple2!21008 tuple2!21008 BitStream!10670 Bool) Unit!17843)

(assert (=> d!82068 (= lt!381834 (choose!50 lt!381299 (_2!11425 lt!381301) lt!381831 lt!381833 (tuple2!21009 (_1!11426 lt!381833) (_2!11426 lt!381833)) (_1!11426 lt!381833) (_2!11426 lt!381833) lt!381832 (tuple2!21009 (_1!11426 lt!381832) (_2!11426 lt!381832)) (_1!11426 lt!381832) (_2!11426 lt!381832)))))

(assert (=> d!82068 (= lt!381832 (readBitPure!0 lt!381831))))

(assert (=> d!82068 (= lt!381833 (readBitPure!0 lt!381299))))

(assert (=> d!82068 (= lt!381831 (BitStream!10671 (buf!6346 (_2!11425 lt!381301)) (currentByte!11724 lt!381299) (currentBit!11719 lt!381299)))))

(assert (=> d!82068 (invariant!0 (currentBit!11719 lt!381299) (currentByte!11724 lt!381299) (size!5874 (buf!6346 (_2!11425 lt!381301))))))

(assert (=> d!82068 (= (readBitPrefixLemma!0 lt!381299 (_2!11425 lt!381301)) lt!381834)))

(declare-fun b!244915 () Bool)

(assert (=> b!244915 (= e!169727 (= (_2!11426 lt!381833) (_2!11426 lt!381832)))))

(assert (= (and d!82068 res!204741) b!244915))

(declare-fun m!369239 () Bool)

(assert (=> d!82068 m!369239))

(assert (=> d!82068 m!368819))

(declare-fun m!369241 () Bool)

(assert (=> d!82068 m!369241))

(declare-fun m!369243 () Bool)

(assert (=> d!82068 m!369243))

(declare-fun m!369245 () Bool)

(assert (=> d!82068 m!369245))

(declare-fun m!369247 () Bool)

(assert (=> d!82068 m!369247))

(assert (=> b!244679 d!82068))

(declare-fun d!82082 () Bool)

(assert (=> d!82082 (isPrefixOf!0 thiss!1005 (_2!11425 lt!381301))))

(declare-fun lt!381857 () Unit!17843)

(declare-fun choose!30 (BitStream!10670 BitStream!10670 BitStream!10670) Unit!17843)

(assert (=> d!82082 (= lt!381857 (choose!30 thiss!1005 (_2!11425 lt!381303) (_2!11425 lt!381301)))))

(assert (=> d!82082 (isPrefixOf!0 thiss!1005 (_2!11425 lt!381303))))

(assert (=> d!82082 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11425 lt!381303) (_2!11425 lt!381301)) lt!381857)))

(declare-fun bs!20766 () Bool)

(assert (= bs!20766 d!82082))

(assert (=> bs!20766 m!368813))

(declare-fun m!369275 () Bool)

(assert (=> bs!20766 m!369275))

(assert (=> bs!20766 m!368803))

(assert (=> b!244679 d!82082))

(declare-fun d!82086 () Bool)

(declare-fun lt!381858 () tuple2!21016)

(assert (=> d!82086 (= lt!381858 (readBit!0 (_1!11427 lt!381298)))))

(assert (=> d!82086 (= (readBitPure!0 (_1!11427 lt!381298)) (tuple2!21009 (_2!11430 lt!381858) (_1!11430 lt!381858)))))

(declare-fun bs!20767 () Bool)

(assert (= bs!20767 d!82086))

(declare-fun m!369277 () Bool)

(assert (=> bs!20767 m!369277))

(assert (=> b!244679 d!82086))

(declare-fun d!82088 () Bool)

(assert (=> d!82088 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 thiss!1005)) ((_ sign_extend 32) (currentBit!11719 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!381859 () Unit!17843)

(assert (=> d!82088 (= lt!381859 (choose!9 thiss!1005 (buf!6346 (_2!11425 lt!381301)) (bvsub nBits!297 from!289) (BitStream!10671 (buf!6346 (_2!11425 lt!381301)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005))))))

(assert (=> d!82088 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6346 (_2!11425 lt!381301)) (bvsub nBits!297 from!289)) lt!381859)))

(declare-fun bs!20768 () Bool)

(assert (= bs!20768 d!82088))

(assert (=> bs!20768 m!368817))

(declare-fun m!369279 () Bool)

(assert (=> bs!20768 m!369279))

(assert (=> b!244679 d!82088))

(declare-fun d!82090 () Bool)

(declare-fun lt!381867 () tuple2!21016)

(declare-fun checkBitsLoop!0 (BitStream!10670 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21016)

(assert (=> d!82090 (= lt!381867 (checkBitsLoop!0 (_1!11427 lt!381298) nBits!297 bit!26 from!289))))

(assert (=> d!82090 (= (checkBitsLoopPure!0 (_1!11427 lt!381298) nBits!297 bit!26 from!289) (tuple2!21009 (_2!11430 lt!381867) (_1!11430 lt!381867)))))

(declare-fun bs!20773 () Bool)

(assert (= bs!20773 d!82090))

(declare-fun m!369289 () Bool)

(assert (=> bs!20773 m!369289))

(assert (=> b!244679 d!82090))

(declare-fun d!82100 () Bool)

(assert (=> d!82100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) lt!381296) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303)))) lt!381296))))

(declare-fun bs!20774 () Bool)

(assert (= bs!20774 d!82100))

(declare-fun m!369291 () Bool)

(assert (=> bs!20774 m!369291))

(assert (=> b!244679 d!82100))

(declare-fun d!82102 () Bool)

(assert (=> d!82102 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381303)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) lt!381296) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381303)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303)))) lt!381296))))

(declare-fun bs!20775 () Bool)

(assert (= bs!20775 d!82102))

(declare-fun m!369293 () Bool)

(assert (=> bs!20775 m!369293))

(assert (=> b!244679 d!82102))

(declare-fun d!82104 () Bool)

(assert (=> d!82104 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 thiss!1005)) ((_ sign_extend 32) (currentBit!11719 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 thiss!1005)) ((_ sign_extend 32) (currentBit!11719 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20776 () Bool)

(assert (= bs!20776 d!82104))

(declare-fun m!369295 () Bool)

(assert (=> bs!20776 m!369295))

(assert (=> b!244679 d!82104))

(declare-fun d!82106 () Bool)

(assert (=> d!82106 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 thiss!1005))) ((_ sign_extend 32) (currentByte!11724 thiss!1005)) ((_ sign_extend 32) (currentBit!11719 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 thiss!1005))) ((_ sign_extend 32) (currentByte!11724 thiss!1005)) ((_ sign_extend 32) (currentBit!11719 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20777 () Bool)

(assert (= bs!20777 d!82106))

(declare-fun m!369297 () Bool)

(assert (=> bs!20777 m!369297))

(assert (=> b!244678 d!82106))

(declare-fun d!82108 () Bool)

(declare-fun lt!381868 () tuple2!21016)

(assert (=> d!82108 (= lt!381868 (checkBitsLoop!0 (_1!11427 lt!381295) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82108 (= (checkBitsLoopPure!0 (_1!11427 lt!381295) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21009 (_2!11430 lt!381868) (_1!11430 lt!381868)))))

(declare-fun bs!20778 () Bool)

(assert (= bs!20778 d!82108))

(declare-fun m!369299 () Bool)

(assert (=> bs!20778 m!369299))

(assert (=> b!244677 d!82108))

(declare-fun d!82110 () Bool)

(assert (=> d!82110 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) lt!381289) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303)))) lt!381289))))

(declare-fun bs!20779 () Bool)

(assert (= bs!20779 d!82110))

(assert (=> bs!20779 m!369291))

(assert (=> b!244677 d!82110))

(declare-fun d!82112 () Bool)

(assert (=> d!82112 (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303))) lt!381289)))

(declare-fun lt!381869 () Unit!17843)

(assert (=> d!82112 (= lt!381869 (choose!9 (_2!11425 lt!381303) (buf!6346 (_2!11425 lt!381301)) lt!381289 (BitStream!10671 (buf!6346 (_2!11425 lt!381301)) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303)))))))

(assert (=> d!82112 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11425 lt!381303) (buf!6346 (_2!11425 lt!381301)) lt!381289) lt!381869)))

(declare-fun bs!20780 () Bool)

(assert (= bs!20780 d!82112))

(assert (=> bs!20780 m!368797))

(declare-fun m!369301 () Bool)

(assert (=> bs!20780 m!369301))

(assert (=> b!244677 d!82112))

(assert (=> b!244677 d!82036))

(declare-fun d!82114 () Bool)

(declare-fun lt!381870 () tuple2!21016)

(assert (=> d!82114 (= lt!381870 (readBit!0 (readerFrom!0 (_2!11425 lt!381303) (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005))))))

(assert (=> d!82114 (= (readBitPure!0 (readerFrom!0 (_2!11425 lt!381303) (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005))) (tuple2!21009 (_2!11430 lt!381870) (_1!11430 lt!381870)))))

(declare-fun bs!20781 () Bool)

(assert (= bs!20781 d!82114))

(assert (=> bs!20781 m!368849))

(declare-fun m!369303 () Bool)

(assert (=> bs!20781 m!369303))

(assert (=> b!244676 d!82114))

(declare-fun d!82116 () Bool)

(declare-fun e!169734 () Bool)

(assert (=> d!82116 e!169734))

(declare-fun res!204751 () Bool)

(assert (=> d!82116 (=> (not res!204751) (not e!169734))))

(assert (=> d!82116 (= res!204751 (invariant!0 (currentBit!11719 (_2!11425 lt!381303)) (currentByte!11724 (_2!11425 lt!381303)) (size!5874 (buf!6346 (_2!11425 lt!381303)))))))

(assert (=> d!82116 (= (readerFrom!0 (_2!11425 lt!381303) (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005)) (BitStream!10671 (buf!6346 (_2!11425 lt!381303)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005)))))

(declare-fun b!244926 () Bool)

(assert (=> b!244926 (= e!169734 (invariant!0 (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005) (size!5874 (buf!6346 (_2!11425 lt!381303)))))))

(assert (= (and d!82116 res!204751) b!244926))

(declare-fun m!369305 () Bool)

(assert (=> d!82116 m!369305))

(assert (=> b!244926 m!368791))

(assert (=> b!244676 d!82116))

(declare-fun d!82118 () Bool)

(declare-fun e!169735 () Bool)

(assert (=> d!82118 e!169735))

(declare-fun res!204753 () Bool)

(assert (=> d!82118 (=> (not res!204753) (not e!169735))))

(declare-fun lt!381871 () (_ BitVec 64))

(declare-fun lt!381876 () (_ BitVec 64))

(declare-fun lt!381874 () (_ BitVec 64))

(assert (=> d!82118 (= res!204753 (= lt!381876 (bvsub lt!381871 lt!381874)))))

(assert (=> d!82118 (or (= (bvand lt!381871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381874 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381871 lt!381874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82118 (= lt!381874 (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381303)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303)))))))

(declare-fun lt!381875 () (_ BitVec 64))

(declare-fun lt!381872 () (_ BitVec 64))

(assert (=> d!82118 (= lt!381871 (bvmul lt!381875 lt!381872))))

(assert (=> d!82118 (or (= lt!381875 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381872 (bvsdiv (bvmul lt!381875 lt!381872) lt!381875)))))

(assert (=> d!82118 (= lt!381872 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82118 (= lt!381875 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381303)))))))

(assert (=> d!82118 (= lt!381876 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381303))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381303)))))))

(assert (=> d!82118 (invariant!0 (currentBit!11719 (_2!11425 lt!381303)) (currentByte!11724 (_2!11425 lt!381303)) (size!5874 (buf!6346 (_2!11425 lt!381303))))))

(assert (=> d!82118 (= (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381303))) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303))) lt!381876)))

(declare-fun b!244927 () Bool)

(declare-fun res!204752 () Bool)

(assert (=> b!244927 (=> (not res!204752) (not e!169735))))

(assert (=> b!244927 (= res!204752 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381876))))

(declare-fun b!244928 () Bool)

(declare-fun lt!381873 () (_ BitVec 64))

(assert (=> b!244928 (= e!169735 (bvsle lt!381876 (bvmul lt!381873 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244928 (or (= lt!381873 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381873 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381873)))))

(assert (=> b!244928 (= lt!381873 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381303)))))))

(assert (= (and d!82118 res!204753) b!244927))

(assert (= (and b!244927 res!204752) b!244928))

(assert (=> d!82118 m!369293))

(assert (=> d!82118 m!369305))

(assert (=> b!244675 d!82118))

(declare-fun d!82120 () Bool)

(declare-fun e!169736 () Bool)

(assert (=> d!82120 e!169736))

(declare-fun res!204755 () Bool)

(assert (=> d!82120 (=> (not res!204755) (not e!169736))))

(declare-fun lt!381877 () (_ BitVec 64))

(declare-fun lt!381882 () (_ BitVec 64))

(declare-fun lt!381880 () (_ BitVec 64))

(assert (=> d!82120 (= res!204755 (= lt!381882 (bvsub lt!381877 lt!381880)))))

(assert (=> d!82120 (or (= (bvand lt!381877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381880 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381877 lt!381880) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82120 (= lt!381880 (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 thiss!1005))) ((_ sign_extend 32) (currentByte!11724 thiss!1005)) ((_ sign_extend 32) (currentBit!11719 thiss!1005))))))

(declare-fun lt!381881 () (_ BitVec 64))

(declare-fun lt!381878 () (_ BitVec 64))

(assert (=> d!82120 (= lt!381877 (bvmul lt!381881 lt!381878))))

(assert (=> d!82120 (or (= lt!381881 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381878 (bvsdiv (bvmul lt!381881 lt!381878) lt!381881)))))

(assert (=> d!82120 (= lt!381878 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82120 (= lt!381881 ((_ sign_extend 32) (size!5874 (buf!6346 thiss!1005))))))

(assert (=> d!82120 (= lt!381882 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11724 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11719 thiss!1005))))))

(assert (=> d!82120 (invariant!0 (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005) (size!5874 (buf!6346 thiss!1005)))))

(assert (=> d!82120 (= (bitIndex!0 (size!5874 (buf!6346 thiss!1005)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005)) lt!381882)))

(declare-fun b!244929 () Bool)

(declare-fun res!204754 () Bool)

(assert (=> b!244929 (=> (not res!204754) (not e!169736))))

(assert (=> b!244929 (= res!204754 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381882))))

(declare-fun b!244930 () Bool)

(declare-fun lt!381879 () (_ BitVec 64))

(assert (=> b!244930 (= e!169736 (bvsle lt!381882 (bvmul lt!381879 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244930 (or (= lt!381879 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381879 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381879)))))

(assert (=> b!244930 (= lt!381879 ((_ sign_extend 32) (size!5874 (buf!6346 thiss!1005))))))

(assert (= (and d!82120 res!204755) b!244929))

(assert (= (and b!244929 res!204754) b!244930))

(assert (=> d!82120 m!369297))

(declare-fun m!369307 () Bool)

(assert (=> d!82120 m!369307))

(assert (=> b!244675 d!82120))

(declare-fun d!82122 () Bool)

(assert (=> d!82122 (= (invariant!0 (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005) (size!5874 (buf!6346 (_2!11425 lt!381301)))) (and (bvsge (currentBit!11719 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11719 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11724 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11724 thiss!1005) (size!5874 (buf!6346 (_2!11425 lt!381301)))) (and (= (currentBit!11719 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11724 thiss!1005) (size!5874 (buf!6346 (_2!11425 lt!381301))))))))))

(assert (=> b!244674 d!82122))

(declare-fun d!82124 () Bool)

(declare-fun res!204757 () Bool)

(declare-fun e!169738 () Bool)

(assert (=> d!82124 (=> (not res!204757) (not e!169738))))

(assert (=> d!82124 (= res!204757 (= (size!5874 (buf!6346 thiss!1005)) (size!5874 (buf!6346 (_2!11425 lt!381303)))))))

(assert (=> d!82124 (= (isPrefixOf!0 thiss!1005 (_2!11425 lt!381303)) e!169738)))

(declare-fun b!244931 () Bool)

(declare-fun res!204756 () Bool)

(assert (=> b!244931 (=> (not res!204756) (not e!169738))))

(assert (=> b!244931 (= res!204756 (bvsle (bitIndex!0 (size!5874 (buf!6346 thiss!1005)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005)) (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381303))) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303)))))))

(declare-fun b!244932 () Bool)

(declare-fun e!169737 () Bool)

(assert (=> b!244932 (= e!169738 e!169737)))

(declare-fun res!204758 () Bool)

(assert (=> b!244932 (=> res!204758 e!169737)))

(assert (=> b!244932 (= res!204758 (= (size!5874 (buf!6346 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!244933 () Bool)

(assert (=> b!244933 (= e!169737 (arrayBitRangesEq!0 (buf!6346 thiss!1005) (buf!6346 (_2!11425 lt!381303)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5874 (buf!6346 thiss!1005)) (currentByte!11724 thiss!1005) (currentBit!11719 thiss!1005))))))

(assert (= (and d!82124 res!204757) b!244931))

(assert (= (and b!244931 res!204756) b!244932))

(assert (= (and b!244932 (not res!204758)) b!244933))

(assert (=> b!244931 m!368853))

(assert (=> b!244931 m!368787))

(assert (=> b!244933 m!368853))

(assert (=> b!244933 m!368853))

(declare-fun m!369309 () Bool)

(assert (=> b!244933 m!369309))

(assert (=> b!244684 d!82124))

(declare-fun d!82126 () Bool)

(assert (=> d!82126 (= (invariant!0 (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005) (size!5874 (buf!6346 (_2!11425 lt!381303)))) (and (bvsge (currentBit!11719 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11719 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11724 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11724 thiss!1005) (size!5874 (buf!6346 (_2!11425 lt!381303)))) (and (= (currentBit!11719 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11724 thiss!1005) (size!5874 (buf!6346 (_2!11425 lt!381303))))))))))

(assert (=> b!244673 d!82126))

(declare-fun d!82128 () Bool)

(assert (=> d!82128 (= (array_inv!5615 (buf!6346 thiss!1005)) (bvsge (size!5874 (buf!6346 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!244683 d!82128))

(declare-fun d!82130 () Bool)

(declare-fun res!204760 () Bool)

(declare-fun e!169740 () Bool)

(assert (=> d!82130 (=> (not res!204760) (not e!169740))))

(assert (=> d!82130 (= res!204760 (= (size!5874 (buf!6346 (_2!11425 lt!381303))) (size!5874 (buf!6346 (_2!11425 lt!381301)))))))

(assert (=> d!82130 (= (isPrefixOf!0 (_2!11425 lt!381303) (_2!11425 lt!381301)) e!169740)))

(declare-fun b!244934 () Bool)

(declare-fun res!204759 () Bool)

(assert (=> b!244934 (=> (not res!204759) (not e!169740))))

(assert (=> b!244934 (= res!204759 (bvsle (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381303))) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303))) (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381301))) (currentByte!11724 (_2!11425 lt!381301)) (currentBit!11719 (_2!11425 lt!381301)))))))

(declare-fun b!244935 () Bool)

(declare-fun e!169739 () Bool)

(assert (=> b!244935 (= e!169740 e!169739)))

(declare-fun res!204761 () Bool)

(assert (=> b!244935 (=> res!204761 e!169739)))

(assert (=> b!244935 (= res!204761 (= (size!5874 (buf!6346 (_2!11425 lt!381303))) #b00000000000000000000000000000000))))

(declare-fun b!244936 () Bool)

(assert (=> b!244936 (= e!169739 (arrayBitRangesEq!0 (buf!6346 (_2!11425 lt!381303)) (buf!6346 (_2!11425 lt!381301)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381303))) (currentByte!11724 (_2!11425 lt!381303)) (currentBit!11719 (_2!11425 lt!381303)))))))

(assert (= (and d!82130 res!204760) b!244934))

(assert (= (and b!244934 res!204759) b!244935))

(assert (= (and b!244935 (not res!204761)) b!244936))

(assert (=> b!244934 m!368787))

(assert (=> b!244934 m!368785))

(assert (=> b!244936 m!368787))

(assert (=> b!244936 m!368787))

(declare-fun m!369311 () Bool)

(assert (=> b!244936 m!369311))

(assert (=> b!244672 d!82130))

(declare-fun d!82132 () Bool)

(assert (=> d!82132 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11719 thiss!1005) (currentByte!11724 thiss!1005) (size!5874 (buf!6346 thiss!1005))))))

(declare-fun bs!20782 () Bool)

(assert (= bs!20782 d!82132))

(assert (=> bs!20782 m!369307))

(assert (=> start!52776 d!82132))

(declare-fun d!82134 () Bool)

(declare-fun e!169741 () Bool)

(assert (=> d!82134 e!169741))

(declare-fun res!204763 () Bool)

(assert (=> d!82134 (=> (not res!204763) (not e!169741))))

(declare-fun lt!381888 () (_ BitVec 64))

(declare-fun lt!381886 () (_ BitVec 64))

(declare-fun lt!381883 () (_ BitVec 64))

(assert (=> d!82134 (= res!204763 (= lt!381888 (bvsub lt!381883 lt!381886)))))

(assert (=> d!82134 (or (= (bvand lt!381883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381886 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381883 lt!381886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82134 (= lt!381886 (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11426 lt!381302)))) ((_ sign_extend 32) (currentByte!11724 (_1!11426 lt!381302))) ((_ sign_extend 32) (currentBit!11719 (_1!11426 lt!381302)))))))

(declare-fun lt!381887 () (_ BitVec 64))

(declare-fun lt!381884 () (_ BitVec 64))

(assert (=> d!82134 (= lt!381883 (bvmul lt!381887 lt!381884))))

(assert (=> d!82134 (or (= lt!381887 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381884 (bvsdiv (bvmul lt!381887 lt!381884) lt!381887)))))

(assert (=> d!82134 (= lt!381884 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82134 (= lt!381887 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11426 lt!381302)))))))

(assert (=> d!82134 (= lt!381888 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11724 (_1!11426 lt!381302))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11719 (_1!11426 lt!381302)))))))

(assert (=> d!82134 (invariant!0 (currentBit!11719 (_1!11426 lt!381302)) (currentByte!11724 (_1!11426 lt!381302)) (size!5874 (buf!6346 (_1!11426 lt!381302))))))

(assert (=> d!82134 (= (bitIndex!0 (size!5874 (buf!6346 (_1!11426 lt!381302))) (currentByte!11724 (_1!11426 lt!381302)) (currentBit!11719 (_1!11426 lt!381302))) lt!381888)))

(declare-fun b!244937 () Bool)

(declare-fun res!204762 () Bool)

(assert (=> b!244937 (=> (not res!204762) (not e!169741))))

(assert (=> b!244937 (= res!204762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381888))))

(declare-fun b!244938 () Bool)

(declare-fun lt!381885 () (_ BitVec 64))

(assert (=> b!244938 (= e!169741 (bvsle lt!381888 (bvmul lt!381885 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244938 (or (= lt!381885 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381885 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381885)))))

(assert (=> b!244938 (= lt!381885 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11426 lt!381302)))))))

(assert (= (and d!82134 res!204763) b!244937))

(assert (= (and b!244937 res!204762) b!244938))

(declare-fun m!369313 () Bool)

(assert (=> d!82134 m!369313))

(declare-fun m!369315 () Bool)

(assert (=> d!82134 m!369315))

(assert (=> b!244682 d!82134))

(declare-fun d!82136 () Bool)

(assert (=> d!82136 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11427 lt!381287)))) ((_ sign_extend 32) (currentByte!11724 (_1!11427 lt!381287))) ((_ sign_extend 32) (currentBit!11719 (_1!11427 lt!381287))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 (_1!11427 lt!381287)))) ((_ sign_extend 32) (currentByte!11724 (_1!11427 lt!381287))) ((_ sign_extend 32) (currentBit!11719 (_1!11427 lt!381287)))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun bs!20783 () Bool)

(assert (= bs!20783 d!82136))

(declare-fun m!369317 () Bool)

(assert (=> bs!20783 m!369317))

(assert (=> b!244681 d!82136))

(declare-fun d!82138 () Bool)

(declare-fun e!169742 () Bool)

(assert (=> d!82138 e!169742))

(declare-fun res!204765 () Bool)

(assert (=> d!82138 (=> (not res!204765) (not e!169742))))

(declare-fun lt!381892 () (_ BitVec 64))

(declare-fun lt!381889 () (_ BitVec 64))

(declare-fun lt!381894 () (_ BitVec 64))

(assert (=> d!82138 (= res!204765 (= lt!381894 (bvsub lt!381889 lt!381892)))))

(assert (=> d!82138 (or (= (bvand lt!381889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381892 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381889 lt!381892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82138 (= lt!381892 (remainingBits!0 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))) ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381301))) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381301)))))))

(declare-fun lt!381893 () (_ BitVec 64))

(declare-fun lt!381890 () (_ BitVec 64))

(assert (=> d!82138 (= lt!381889 (bvmul lt!381893 lt!381890))))

(assert (=> d!82138 (or (= lt!381893 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381890 (bvsdiv (bvmul lt!381893 lt!381890) lt!381893)))))

(assert (=> d!82138 (= lt!381890 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82138 (= lt!381893 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))))))

(assert (=> d!82138 (= lt!381894 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11724 (_2!11425 lt!381301))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11719 (_2!11425 lt!381301)))))))

(assert (=> d!82138 (invariant!0 (currentBit!11719 (_2!11425 lt!381301)) (currentByte!11724 (_2!11425 lt!381301)) (size!5874 (buf!6346 (_2!11425 lt!381301))))))

(assert (=> d!82138 (= (bitIndex!0 (size!5874 (buf!6346 (_2!11425 lt!381301))) (currentByte!11724 (_2!11425 lt!381301)) (currentBit!11719 (_2!11425 lt!381301))) lt!381894)))

(declare-fun b!244939 () Bool)

(declare-fun res!204764 () Bool)

(assert (=> b!244939 (=> (not res!204764) (not e!169742))))

(assert (=> b!244939 (= res!204764 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381894))))

(declare-fun b!244940 () Bool)

(declare-fun lt!381891 () (_ BitVec 64))

(assert (=> b!244940 (= e!169742 (bvsle lt!381894 (bvmul lt!381891 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244940 (or (= lt!381891 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381891 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381891)))))

(assert (=> b!244940 (= lt!381891 ((_ sign_extend 32) (size!5874 (buf!6346 (_2!11425 lt!381301)))))))

(assert (= (and d!82138 res!204765) b!244939))

(assert (= (and b!244939 res!204764) b!244940))

(declare-fun m!369319 () Bool)

(assert (=> d!82138 m!369319))

(declare-fun m!369321 () Bool)

(assert (=> d!82138 m!369321))

(assert (=> b!244680 d!82138))

(assert (=> b!244680 d!82118))

(push 1)

(assert (not d!82010))

(assert (not d!82108))

(assert (not d!82042))

(assert (not b!244864))

(assert (not d!82022))

(assert (not d!82118))

(assert (not d!82100))

(assert (not b!244931))

(assert (not d!82036))

(assert (not b!244898))

(assert (not b!244934))

(assert (not b!244899))

(assert (not b!244825))

(assert (not d!82112))

(assert (not b!244815))

(assert (not d!82082))

(assert (not b!244827))

(assert (not d!82038))

(assert (not d!82116))

(assert (not b!244826))

(assert (not b!244822))

(assert (not d!82000))

(assert (not b!244862))

(assert (not b!244936))

(assert (not b!244824))

(assert (not d!82102))

(assert (not d!82120))

(assert (not d!82062))

(assert (not b!244832))

(assert (not b!244926))

(assert (not b!244933))

(assert (not d!82040))

(assert (not b!244813))

(assert (not d!82068))

(assert (not d!82090))

(assert (not b!244812))

(assert (not d!82104))

(assert (not b!244897))

(assert (not d!82044))

(assert (not d!82132))

(assert (not d!82114))

(assert (not d!82064))

(assert (not d!82110))

(assert (not b!244829))

(assert (not d!82136))

(assert (not d!82134))

(assert (not d!82138))

(assert (not d!82106))

(assert (not b!244863))

(assert (not b!244811))

(assert (not d!82088))

(assert (not b!244861))

(assert (not b!244896))

(assert (not d!82086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

