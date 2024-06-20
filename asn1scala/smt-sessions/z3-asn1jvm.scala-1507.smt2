; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41620 () Bool)

(assert start!41620)

(declare-fun b!195695 () Bool)

(declare-fun res!163709 () Bool)

(declare-fun e!134552 () Bool)

(assert (=> b!195695 (=> (not res!163709) (not e!134552))))

(declare-datatypes ((array!10057 0))(
  ( (array!10058 (arr!5366 (Array (_ BitVec 32) (_ BitVec 8))) (size!4436 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7980 0))(
  ( (BitStream!7981 (buf!4922 array!10057) (currentByte!9224 (_ BitVec 32)) (currentBit!9219 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7980)

(declare-datatypes ((Unit!13815 0))(
  ( (Unit!13816) )
))
(declare-datatypes ((tuple2!16932 0))(
  ( (tuple2!16933 (_1!9111 Unit!13815) (_2!9111 BitStream!7980)) )
))
(declare-fun lt!304041 () tuple2!16932)

(declare-fun isPrefixOf!0 (BitStream!7980 BitStream!7980) Bool)

(assert (=> b!195695 (= res!163709 (isPrefixOf!0 thiss!1204 (_2!9111 lt!304041)))))

(declare-fun b!195696 () Bool)

(declare-fun res!163708 () Bool)

(declare-fun e!134551 () Bool)

(assert (=> b!195696 (=> (not res!163708) (not e!134551))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195696 (= res!163708 (validate_offset_bits!1 ((_ sign_extend 32) (size!4436 (buf!4922 thiss!1204))) ((_ sign_extend 32) (currentByte!9224 thiss!1204)) ((_ sign_extend 32) (currentBit!9219 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195697 () Bool)

(declare-fun lt!304042 () (_ BitVec 64))

(declare-fun e!134549 () Bool)

(declare-fun lt!304038 () tuple2!16932)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195697 (= e!134549 (= (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304038))) (currentByte!9224 (_2!9111 lt!304038)) (currentBit!9219 (_2!9111 lt!304038))) (bvsub (bvsub (bvadd lt!304042 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!195697 (isPrefixOf!0 thiss!1204 (_2!9111 lt!304038))))

(declare-fun lt!304035 () Unit!13815)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7980 BitStream!7980 BitStream!7980) Unit!13815)

(assert (=> b!195697 (= lt!304035 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9111 lt!304041) (_2!9111 lt!304038)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7980 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16932)

(assert (=> b!195697 (= lt!304038 (appendBitsLSBFirstLoopTR!0 (_2!9111 lt!304041) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!195698 () Bool)

(declare-fun e!134555 () Bool)

(assert (=> b!195698 (= e!134555 e!134552)))

(declare-fun res!163711 () Bool)

(assert (=> b!195698 (=> (not res!163711) (not e!134552))))

(declare-fun lt!304037 () (_ BitVec 64))

(declare-fun lt!304039 () (_ BitVec 64))

(assert (=> b!195698 (= res!163711 (= lt!304037 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304039)))))

(assert (=> b!195698 (= lt!304037 (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304041))) (currentByte!9224 (_2!9111 lt!304041)) (currentBit!9219 (_2!9111 lt!304041))))))

(assert (=> b!195698 (= lt!304039 (bitIndex!0 (size!4436 (buf!4922 thiss!1204)) (currentByte!9224 thiss!1204) (currentBit!9219 thiss!1204)))))

(declare-fun b!195699 () Bool)

(declare-fun e!134553 () Bool)

(declare-fun array_inv!4177 (array!10057) Bool)

(assert (=> b!195699 (= e!134553 (array_inv!4177 (buf!4922 thiss!1204)))))

(declare-fun b!195700 () Bool)

(declare-fun res!163712 () Bool)

(assert (=> b!195700 (=> (not res!163712) (not e!134551))))

(assert (=> b!195700 (= res!163712 (not (= i!590 nBits!348)))))

(declare-fun res!163716 () Bool)

(assert (=> start!41620 (=> (not res!163716) (not e!134551))))

(assert (=> start!41620 (= res!163716 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41620 e!134551))

(assert (=> start!41620 true))

(declare-fun inv!12 (BitStream!7980) Bool)

(assert (=> start!41620 (and (inv!12 thiss!1204) e!134553)))

(declare-fun b!195701 () Bool)

(declare-fun e!134554 () Bool)

(assert (=> b!195701 (= e!134552 e!134554)))

(declare-fun res!163710 () Bool)

(assert (=> b!195701 (=> (not res!163710) (not e!134554))))

(declare-datatypes ((tuple2!16934 0))(
  ( (tuple2!16935 (_1!9112 BitStream!7980) (_2!9112 Bool)) )
))
(declare-fun lt!304036 () tuple2!16934)

(declare-fun lt!304040 () Bool)

(assert (=> b!195701 (= res!163710 (and (= (_2!9112 lt!304036) lt!304040) (= (_1!9112 lt!304036) (_2!9111 lt!304041))))))

(declare-fun readBitPure!0 (BitStream!7980) tuple2!16934)

(declare-fun readerFrom!0 (BitStream!7980 (_ BitVec 32) (_ BitVec 32)) BitStream!7980)

(assert (=> b!195701 (= lt!304036 (readBitPure!0 (readerFrom!0 (_2!9111 lt!304041) (currentBit!9219 thiss!1204) (currentByte!9224 thiss!1204))))))

(declare-fun b!195702 () Bool)

(declare-fun res!163715 () Bool)

(assert (=> b!195702 (=> (not res!163715) (not e!134551))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195702 (= res!163715 (invariant!0 (currentBit!9219 thiss!1204) (currentByte!9224 thiss!1204) (size!4436 (buf!4922 thiss!1204))))))

(declare-fun b!195703 () Bool)

(assert (=> b!195703 (= e!134554 (= (bitIndex!0 (size!4436 (buf!4922 (_1!9112 lt!304036))) (currentByte!9224 (_1!9112 lt!304036)) (currentBit!9219 (_1!9112 lt!304036))) lt!304037))))

(declare-fun b!195704 () Bool)

(assert (=> b!195704 (= e!134551 (not e!134549))))

(declare-fun res!163713 () Bool)

(assert (=> b!195704 (=> res!163713 e!134549)))

(declare-fun lt!304034 () (_ BitVec 64))

(assert (=> b!195704 (= res!163713 (not (= lt!304042 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304034))))))

(assert (=> b!195704 (= lt!304042 (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304041))) (currentByte!9224 (_2!9111 lt!304041)) (currentBit!9219 (_2!9111 lt!304041))))))

(assert (=> b!195704 (= lt!304034 (bitIndex!0 (size!4436 (buf!4922 thiss!1204)) (currentByte!9224 thiss!1204) (currentBit!9219 thiss!1204)))))

(assert (=> b!195704 e!134555))

(declare-fun res!163714 () Bool)

(assert (=> b!195704 (=> (not res!163714) (not e!134555))))

(assert (=> b!195704 (= res!163714 (= (size!4436 (buf!4922 thiss!1204)) (size!4436 (buf!4922 (_2!9111 lt!304041)))))))

(declare-fun appendBit!0 (BitStream!7980 Bool) tuple2!16932)

(assert (=> b!195704 (= lt!304041 (appendBit!0 thiss!1204 lt!304040))))

(assert (=> b!195704 (= lt!304040 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!41620 res!163716) b!195696))

(assert (= (and b!195696 res!163708) b!195702))

(assert (= (and b!195702 res!163715) b!195700))

(assert (= (and b!195700 res!163712) b!195704))

(assert (= (and b!195704 res!163714) b!195698))

(assert (= (and b!195698 res!163711) b!195695))

(assert (= (and b!195695 res!163709) b!195701))

(assert (= (and b!195701 res!163710) b!195703))

(assert (= (and b!195704 (not res!163713)) b!195697))

(assert (= start!41620 b!195699))

(declare-fun m!302855 () Bool)

(assert (=> b!195701 m!302855))

(assert (=> b!195701 m!302855))

(declare-fun m!302857 () Bool)

(assert (=> b!195701 m!302857))

(declare-fun m!302859 () Bool)

(assert (=> b!195695 m!302859))

(declare-fun m!302861 () Bool)

(assert (=> b!195704 m!302861))

(declare-fun m!302863 () Bool)

(assert (=> b!195704 m!302863))

(declare-fun m!302865 () Bool)

(assert (=> b!195704 m!302865))

(declare-fun m!302867 () Bool)

(assert (=> b!195703 m!302867))

(assert (=> b!195698 m!302861))

(assert (=> b!195698 m!302863))

(declare-fun m!302869 () Bool)

(assert (=> start!41620 m!302869))

(declare-fun m!302871 () Bool)

(assert (=> b!195697 m!302871))

(declare-fun m!302873 () Bool)

(assert (=> b!195697 m!302873))

(declare-fun m!302875 () Bool)

(assert (=> b!195697 m!302875))

(declare-fun m!302877 () Bool)

(assert (=> b!195697 m!302877))

(declare-fun m!302879 () Bool)

(assert (=> b!195699 m!302879))

(declare-fun m!302881 () Bool)

(assert (=> b!195702 m!302881))

(declare-fun m!302883 () Bool)

(assert (=> b!195696 m!302883))

(check-sat (not b!195698) (not b!195701) (not start!41620) (not b!195702) (not b!195696) (not b!195703) (not b!195695) (not b!195704) (not b!195699) (not b!195697))
(check-sat)
(get-model)

(declare-fun d!66255 () Bool)

(assert (=> d!66255 (= (array_inv!4177 (buf!4922 thiss!1204)) (bvsge (size!4436 (buf!4922 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!195699 d!66255))

(declare-fun d!66257 () Bool)

(declare-datatypes ((tuple2!16940 0))(
  ( (tuple2!16941 (_1!9115 Bool) (_2!9115 BitStream!7980)) )
))
(declare-fun lt!304072 () tuple2!16940)

(declare-fun readBit!0 (BitStream!7980) tuple2!16940)

(assert (=> d!66257 (= lt!304072 (readBit!0 (readerFrom!0 (_2!9111 lt!304041) (currentBit!9219 thiss!1204) (currentByte!9224 thiss!1204))))))

(assert (=> d!66257 (= (readBitPure!0 (readerFrom!0 (_2!9111 lt!304041) (currentBit!9219 thiss!1204) (currentByte!9224 thiss!1204))) (tuple2!16935 (_2!9115 lt!304072) (_1!9115 lt!304072)))))

(declare-fun bs!16482 () Bool)

(assert (= bs!16482 d!66257))

(assert (=> bs!16482 m!302855))

(declare-fun m!302915 () Bool)

(assert (=> bs!16482 m!302915))

(assert (=> b!195701 d!66257))

(declare-fun d!66259 () Bool)

(declare-fun e!134579 () Bool)

(assert (=> d!66259 e!134579))

(declare-fun res!163747 () Bool)

(assert (=> d!66259 (=> (not res!163747) (not e!134579))))

(assert (=> d!66259 (= res!163747 (invariant!0 (currentBit!9219 (_2!9111 lt!304041)) (currentByte!9224 (_2!9111 lt!304041)) (size!4436 (buf!4922 (_2!9111 lt!304041)))))))

(assert (=> d!66259 (= (readerFrom!0 (_2!9111 lt!304041) (currentBit!9219 thiss!1204) (currentByte!9224 thiss!1204)) (BitStream!7981 (buf!4922 (_2!9111 lt!304041)) (currentByte!9224 thiss!1204) (currentBit!9219 thiss!1204)))))

(declare-fun b!195737 () Bool)

(assert (=> b!195737 (= e!134579 (invariant!0 (currentBit!9219 thiss!1204) (currentByte!9224 thiss!1204) (size!4436 (buf!4922 (_2!9111 lt!304041)))))))

(assert (= (and d!66259 res!163747) b!195737))

(declare-fun m!302917 () Bool)

(assert (=> d!66259 m!302917))

(declare-fun m!302919 () Bool)

(assert (=> b!195737 m!302919))

(assert (=> b!195701 d!66259))

(declare-fun d!66261 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66261 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4436 (buf!4922 thiss!1204))) ((_ sign_extend 32) (currentByte!9224 thiss!1204)) ((_ sign_extend 32) (currentBit!9219 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4436 (buf!4922 thiss!1204))) ((_ sign_extend 32) (currentByte!9224 thiss!1204)) ((_ sign_extend 32) (currentBit!9219 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16483 () Bool)

(assert (= bs!16483 d!66261))

(declare-fun m!302921 () Bool)

(assert (=> bs!16483 m!302921))

(assert (=> b!195696 d!66261))

(declare-fun d!66263 () Bool)

(assert (=> d!66263 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9219 thiss!1204) (currentByte!9224 thiss!1204) (size!4436 (buf!4922 thiss!1204))))))

(declare-fun bs!16484 () Bool)

(assert (= bs!16484 d!66263))

(assert (=> bs!16484 m!302881))

(assert (=> start!41620 d!66263))

(declare-fun d!66265 () Bool)

(declare-fun res!163755 () Bool)

(declare-fun e!134585 () Bool)

(assert (=> d!66265 (=> (not res!163755) (not e!134585))))

(assert (=> d!66265 (= res!163755 (= (size!4436 (buf!4922 thiss!1204)) (size!4436 (buf!4922 (_2!9111 lt!304041)))))))

(assert (=> d!66265 (= (isPrefixOf!0 thiss!1204 (_2!9111 lt!304041)) e!134585)))

(declare-fun b!195744 () Bool)

(declare-fun res!163754 () Bool)

(assert (=> b!195744 (=> (not res!163754) (not e!134585))))

(assert (=> b!195744 (= res!163754 (bvsle (bitIndex!0 (size!4436 (buf!4922 thiss!1204)) (currentByte!9224 thiss!1204) (currentBit!9219 thiss!1204)) (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304041))) (currentByte!9224 (_2!9111 lt!304041)) (currentBit!9219 (_2!9111 lt!304041)))))))

(declare-fun b!195745 () Bool)

(declare-fun e!134584 () Bool)

(assert (=> b!195745 (= e!134585 e!134584)))

(declare-fun res!163756 () Bool)

(assert (=> b!195745 (=> res!163756 e!134584)))

(assert (=> b!195745 (= res!163756 (= (size!4436 (buf!4922 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!195746 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10057 array!10057 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195746 (= e!134584 (arrayBitRangesEq!0 (buf!4922 thiss!1204) (buf!4922 (_2!9111 lt!304041)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4436 (buf!4922 thiss!1204)) (currentByte!9224 thiss!1204) (currentBit!9219 thiss!1204))))))

(assert (= (and d!66265 res!163755) b!195744))

(assert (= (and b!195744 res!163754) b!195745))

(assert (= (and b!195745 (not res!163756)) b!195746))

(assert (=> b!195744 m!302863))

(assert (=> b!195744 m!302861))

(assert (=> b!195746 m!302863))

(assert (=> b!195746 m!302863))

(declare-fun m!302923 () Bool)

(assert (=> b!195746 m!302923))

(assert (=> b!195695 d!66265))

(declare-fun d!66267 () Bool)

(declare-fun e!134588 () Bool)

(assert (=> d!66267 e!134588))

(declare-fun res!163761 () Bool)

(assert (=> d!66267 (=> (not res!163761) (not e!134588))))

(declare-fun lt!304087 () (_ BitVec 64))

(declare-fun lt!304085 () (_ BitVec 64))

(declare-fun lt!304089 () (_ BitVec 64))

(assert (=> d!66267 (= res!163761 (= lt!304085 (bvsub lt!304089 lt!304087)))))

(assert (=> d!66267 (or (= (bvand lt!304089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304087 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304089 lt!304087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66267 (= lt!304087 (remainingBits!0 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304038)))) ((_ sign_extend 32) (currentByte!9224 (_2!9111 lt!304038))) ((_ sign_extend 32) (currentBit!9219 (_2!9111 lt!304038)))))))

(declare-fun lt!304088 () (_ BitVec 64))

(declare-fun lt!304086 () (_ BitVec 64))

(assert (=> d!66267 (= lt!304089 (bvmul lt!304088 lt!304086))))

(assert (=> d!66267 (or (= lt!304088 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304086 (bvsdiv (bvmul lt!304088 lt!304086) lt!304088)))))

(assert (=> d!66267 (= lt!304086 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66267 (= lt!304088 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304038)))))))

(assert (=> d!66267 (= lt!304085 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9224 (_2!9111 lt!304038))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9219 (_2!9111 lt!304038)))))))

(assert (=> d!66267 (invariant!0 (currentBit!9219 (_2!9111 lt!304038)) (currentByte!9224 (_2!9111 lt!304038)) (size!4436 (buf!4922 (_2!9111 lt!304038))))))

(assert (=> d!66267 (= (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304038))) (currentByte!9224 (_2!9111 lt!304038)) (currentBit!9219 (_2!9111 lt!304038))) lt!304085)))

(declare-fun b!195751 () Bool)

(declare-fun res!163762 () Bool)

(assert (=> b!195751 (=> (not res!163762) (not e!134588))))

(assert (=> b!195751 (= res!163762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304085))))

(declare-fun b!195752 () Bool)

(declare-fun lt!304090 () (_ BitVec 64))

(assert (=> b!195752 (= e!134588 (bvsle lt!304085 (bvmul lt!304090 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195752 (or (= lt!304090 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304090 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304090)))))

(assert (=> b!195752 (= lt!304090 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304038)))))))

(assert (= (and d!66267 res!163761) b!195751))

(assert (= (and b!195751 res!163762) b!195752))

(declare-fun m!302925 () Bool)

(assert (=> d!66267 m!302925))

(declare-fun m!302927 () Bool)

(assert (=> d!66267 m!302927))

(assert (=> b!195697 d!66267))

(declare-fun d!66269 () Bool)

(declare-fun res!163764 () Bool)

(declare-fun e!134590 () Bool)

(assert (=> d!66269 (=> (not res!163764) (not e!134590))))

(assert (=> d!66269 (= res!163764 (= (size!4436 (buf!4922 thiss!1204)) (size!4436 (buf!4922 (_2!9111 lt!304038)))))))

(assert (=> d!66269 (= (isPrefixOf!0 thiss!1204 (_2!9111 lt!304038)) e!134590)))

(declare-fun b!195753 () Bool)

(declare-fun res!163763 () Bool)

(assert (=> b!195753 (=> (not res!163763) (not e!134590))))

(assert (=> b!195753 (= res!163763 (bvsle (bitIndex!0 (size!4436 (buf!4922 thiss!1204)) (currentByte!9224 thiss!1204) (currentBit!9219 thiss!1204)) (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304038))) (currentByte!9224 (_2!9111 lt!304038)) (currentBit!9219 (_2!9111 lt!304038)))))))

(declare-fun b!195754 () Bool)

(declare-fun e!134589 () Bool)

(assert (=> b!195754 (= e!134590 e!134589)))

(declare-fun res!163765 () Bool)

(assert (=> b!195754 (=> res!163765 e!134589)))

(assert (=> b!195754 (= res!163765 (= (size!4436 (buf!4922 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!195755 () Bool)

(assert (=> b!195755 (= e!134589 (arrayBitRangesEq!0 (buf!4922 thiss!1204) (buf!4922 (_2!9111 lt!304038)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4436 (buf!4922 thiss!1204)) (currentByte!9224 thiss!1204) (currentBit!9219 thiss!1204))))))

(assert (= (and d!66269 res!163764) b!195753))

(assert (= (and b!195753 res!163763) b!195754))

(assert (= (and b!195754 (not res!163765)) b!195755))

(assert (=> b!195753 m!302863))

(assert (=> b!195753 m!302871))

(assert (=> b!195755 m!302863))

(assert (=> b!195755 m!302863))

(declare-fun m!302929 () Bool)

(assert (=> b!195755 m!302929))

(assert (=> b!195697 d!66269))

(declare-fun d!66271 () Bool)

(assert (=> d!66271 (isPrefixOf!0 thiss!1204 (_2!9111 lt!304038))))

(declare-fun lt!304093 () Unit!13815)

(declare-fun choose!30 (BitStream!7980 BitStream!7980 BitStream!7980) Unit!13815)

(assert (=> d!66271 (= lt!304093 (choose!30 thiss!1204 (_2!9111 lt!304041) (_2!9111 lt!304038)))))

(assert (=> d!66271 (isPrefixOf!0 thiss!1204 (_2!9111 lt!304041))))

(assert (=> d!66271 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9111 lt!304041) (_2!9111 lt!304038)) lt!304093)))

(declare-fun bs!16485 () Bool)

(assert (= bs!16485 d!66271))

(assert (=> bs!16485 m!302873))

(declare-fun m!302931 () Bool)

(assert (=> bs!16485 m!302931))

(assert (=> bs!16485 m!302859))

(assert (=> b!195697 d!66271))

(declare-fun b!195849 () Bool)

(declare-fun res!163862 () Bool)

(declare-fun call!3068 () Bool)

(assert (=> b!195849 (= res!163862 call!3068)))

(declare-fun e!134648 () Bool)

(assert (=> b!195849 (=> (not res!163862) (not e!134648))))

(declare-fun b!195850 () Bool)

(declare-fun e!134653 () (_ BitVec 64))

(assert (=> b!195850 (= e!134653 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!195851 () Bool)

(declare-fun e!134646 () Bool)

(declare-fun lt!304336 () tuple2!16934)

(declare-fun lt!304328 () tuple2!16932)

(assert (=> b!195851 (= e!134646 (= (bitIndex!0 (size!4436 (buf!4922 (_1!9112 lt!304336))) (currentByte!9224 (_1!9112 lt!304336)) (currentBit!9219 (_1!9112 lt!304336))) (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304328))) (currentByte!9224 (_2!9111 lt!304328)) (currentBit!9219 (_2!9111 lt!304328)))))))

(declare-fun b!195852 () Bool)

(declare-fun res!163857 () Bool)

(declare-fun e!134652 () Bool)

(assert (=> b!195852 (=> (not res!163857) (not e!134652))))

(declare-fun lt!304285 () tuple2!16932)

(assert (=> b!195852 (= res!163857 (= (size!4436 (buf!4922 (_2!9111 lt!304041))) (size!4436 (buf!4922 (_2!9111 lt!304285)))))))

(declare-fun bm!3065 () Bool)

(declare-fun c!9744 () Bool)

(assert (=> bm!3065 (= call!3068 (isPrefixOf!0 (_2!9111 lt!304041) (ite c!9744 (_2!9111 lt!304041) (_2!9111 lt!304328))))))

(declare-fun b!195853 () Bool)

(assert (=> b!195853 (= e!134653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!195854 () Bool)

(declare-fun e!134647 () Bool)

(declare-fun lt!304310 () tuple2!16934)

(declare-fun lt!304314 () tuple2!16934)

(assert (=> b!195854 (= e!134647 (= (_2!9112 lt!304310) (_2!9112 lt!304314)))))

(declare-fun b!195855 () Bool)

(declare-fun e!134654 () Bool)

(declare-fun lt!304332 () (_ BitVec 64))

(assert (=> b!195855 (= e!134654 (validate_offset_bits!1 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304041)))) ((_ sign_extend 32) (currentByte!9224 (_2!9111 lt!304041))) ((_ sign_extend 32) (currentBit!9219 (_2!9111 lt!304041))) lt!304332))))

(declare-fun b!195856 () Bool)

(declare-fun res!163853 () Bool)

(assert (=> b!195856 (=> (not res!163853) (not e!134652))))

(assert (=> b!195856 (= res!163853 (isPrefixOf!0 (_2!9111 lt!304041) (_2!9111 lt!304285)))))

(declare-fun b!195857 () Bool)

(declare-fun res!163859 () Bool)

(assert (=> b!195857 (= res!163859 (= (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304328))) (currentByte!9224 (_2!9111 lt!304328)) (currentBit!9219 (_2!9111 lt!304328))) (bvadd (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304041))) (currentByte!9224 (_2!9111 lt!304041)) (currentBit!9219 (_2!9111 lt!304041))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!195857 (=> (not res!163859) (not e!134648))))

(declare-fun b!195858 () Bool)

(declare-fun e!134651 () Bool)

(declare-datatypes ((tuple2!16942 0))(
  ( (tuple2!16943 (_1!9116 BitStream!7980) (_2!9116 (_ BitVec 64))) )
))
(declare-fun lt!304287 () tuple2!16942)

(declare-datatypes ((tuple2!16944 0))(
  ( (tuple2!16945 (_1!9117 BitStream!7980) (_2!9117 BitStream!7980)) )
))
(declare-fun lt!304330 () tuple2!16944)

(assert (=> b!195858 (= e!134651 (= (_1!9116 lt!304287) (_2!9117 lt!304330)))))

(declare-fun b!195859 () Bool)

(declare-fun e!134649 () tuple2!16932)

(declare-fun lt!304316 () tuple2!16932)

(assert (=> b!195859 (= e!134649 (tuple2!16933 (_1!9111 lt!304316) (_2!9111 lt!304316)))))

(declare-fun lt!304301 () Bool)

(assert (=> b!195859 (= lt!304301 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195859 (= lt!304328 (appendBit!0 (_2!9111 lt!304041) lt!304301))))

(declare-fun res!163863 () Bool)

(assert (=> b!195859 (= res!163863 (= (size!4436 (buf!4922 (_2!9111 lt!304041))) (size!4436 (buf!4922 (_2!9111 lt!304328)))))))

(assert (=> b!195859 (=> (not res!163863) (not e!134648))))

(assert (=> b!195859 e!134648))

(declare-fun lt!304327 () tuple2!16932)

(assert (=> b!195859 (= lt!304327 lt!304328)))

(assert (=> b!195859 (= lt!304316 (appendBitsLSBFirstLoopTR!0 (_2!9111 lt!304327) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!304295 () Unit!13815)

(assert (=> b!195859 (= lt!304295 (lemmaIsPrefixTransitive!0 (_2!9111 lt!304041) (_2!9111 lt!304327) (_2!9111 lt!304316)))))

(assert (=> b!195859 (isPrefixOf!0 (_2!9111 lt!304041) (_2!9111 lt!304316))))

(declare-fun lt!304305 () Unit!13815)

(assert (=> b!195859 (= lt!304305 lt!304295)))

(assert (=> b!195859 (invariant!0 (currentBit!9219 (_2!9111 lt!304041)) (currentByte!9224 (_2!9111 lt!304041)) (size!4436 (buf!4922 (_2!9111 lt!304327))))))

(declare-fun lt!304302 () BitStream!7980)

(assert (=> b!195859 (= lt!304302 (BitStream!7981 (buf!4922 (_2!9111 lt!304327)) (currentByte!9224 (_2!9111 lt!304041)) (currentBit!9219 (_2!9111 lt!304041))))))

(assert (=> b!195859 (invariant!0 (currentBit!9219 lt!304302) (currentByte!9224 lt!304302) (size!4436 (buf!4922 (_2!9111 lt!304316))))))

(declare-fun lt!304304 () BitStream!7980)

(assert (=> b!195859 (= lt!304304 (BitStream!7981 (buf!4922 (_2!9111 lt!304316)) (currentByte!9224 lt!304302) (currentBit!9219 lt!304302)))))

(assert (=> b!195859 (= lt!304310 (readBitPure!0 lt!304302))))

(assert (=> b!195859 (= lt!304314 (readBitPure!0 lt!304304))))

(declare-fun lt!304331 () Unit!13815)

(declare-fun readBitPrefixLemma!0 (BitStream!7980 BitStream!7980) Unit!13815)

(assert (=> b!195859 (= lt!304331 (readBitPrefixLemma!0 lt!304302 (_2!9111 lt!304316)))))

(declare-fun res!163858 () Bool)

(assert (=> b!195859 (= res!163858 (= (bitIndex!0 (size!4436 (buf!4922 (_1!9112 lt!304310))) (currentByte!9224 (_1!9112 lt!304310)) (currentBit!9219 (_1!9112 lt!304310))) (bitIndex!0 (size!4436 (buf!4922 (_1!9112 lt!304314))) (currentByte!9224 (_1!9112 lt!304314)) (currentBit!9219 (_1!9112 lt!304314)))))))

(assert (=> b!195859 (=> (not res!163858) (not e!134647))))

(assert (=> b!195859 e!134647))

(declare-fun lt!304294 () Unit!13815)

(assert (=> b!195859 (= lt!304294 lt!304331)))

(declare-fun lt!304299 () tuple2!16944)

(declare-fun reader!0 (BitStream!7980 BitStream!7980) tuple2!16944)

(assert (=> b!195859 (= lt!304299 (reader!0 (_2!9111 lt!304041) (_2!9111 lt!304316)))))

(declare-fun lt!304297 () tuple2!16944)

(assert (=> b!195859 (= lt!304297 (reader!0 (_2!9111 lt!304327) (_2!9111 lt!304316)))))

(declare-fun lt!304334 () tuple2!16934)

(assert (=> b!195859 (= lt!304334 (readBitPure!0 (_1!9117 lt!304299)))))

(assert (=> b!195859 (= (_2!9112 lt!304334) lt!304301)))

(declare-fun lt!304322 () Unit!13815)

(declare-fun Unit!13819 () Unit!13815)

(assert (=> b!195859 (= lt!304322 Unit!13819)))

(declare-fun lt!304337 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195859 (= lt!304337 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304284 () (_ BitVec 64))

(assert (=> b!195859 (= lt!304284 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304307 () Unit!13815)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7980 array!10057 (_ BitVec 64)) Unit!13815)

(assert (=> b!195859 (= lt!304307 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9111 lt!304041) (buf!4922 (_2!9111 lt!304316)) lt!304284))))

(assert (=> b!195859 (validate_offset_bits!1 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304316)))) ((_ sign_extend 32) (currentByte!9224 (_2!9111 lt!304041))) ((_ sign_extend 32) (currentBit!9219 (_2!9111 lt!304041))) lt!304284)))

(declare-fun lt!304317 () Unit!13815)

(assert (=> b!195859 (= lt!304317 lt!304307)))

(declare-fun lt!304326 () tuple2!16942)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16942)

(assert (=> b!195859 (= lt!304326 (readNBitsLSBFirstsLoopPure!0 (_1!9117 lt!304299) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!304337))))

(declare-fun lt!304329 () (_ BitVec 64))

(assert (=> b!195859 (= lt!304329 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!304333 () Unit!13815)

(assert (=> b!195859 (= lt!304333 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9111 lt!304327) (buf!4922 (_2!9111 lt!304316)) lt!304329))))

(assert (=> b!195859 (validate_offset_bits!1 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304316)))) ((_ sign_extend 32) (currentByte!9224 (_2!9111 lt!304327))) ((_ sign_extend 32) (currentBit!9219 (_2!9111 lt!304327))) lt!304329)))

(declare-fun lt!304311 () Unit!13815)

(assert (=> b!195859 (= lt!304311 lt!304333)))

(declare-fun lt!304318 () tuple2!16942)

(assert (=> b!195859 (= lt!304318 (readNBitsLSBFirstsLoopPure!0 (_1!9117 lt!304297) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!304337 (ite (_2!9112 lt!304334) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!304339 () tuple2!16942)

(assert (=> b!195859 (= lt!304339 (readNBitsLSBFirstsLoopPure!0 (_1!9117 lt!304299) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!304337))))

(declare-fun c!9745 () Bool)

(assert (=> b!195859 (= c!9745 (_2!9112 (readBitPure!0 (_1!9117 lt!304299))))))

(declare-fun lt!304321 () tuple2!16942)

(declare-fun withMovedBitIndex!0 (BitStream!7980 (_ BitVec 64)) BitStream!7980)

(assert (=> b!195859 (= lt!304321 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9117 lt!304299) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!304337 e!134653)))))

(declare-fun lt!304315 () Unit!13815)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13815)

(assert (=> b!195859 (= lt!304315 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9117 lt!304299) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!304337))))

(assert (=> b!195859 (and (= (_2!9116 lt!304339) (_2!9116 lt!304321)) (= (_1!9116 lt!304339) (_1!9116 lt!304321)))))

(declare-fun lt!304296 () Unit!13815)

(assert (=> b!195859 (= lt!304296 lt!304315)))

(assert (=> b!195859 (= (_1!9117 lt!304299) (withMovedBitIndex!0 (_2!9117 lt!304299) (bvsub (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304041))) (currentByte!9224 (_2!9111 lt!304041)) (currentBit!9219 (_2!9111 lt!304041))) (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304316))) (currentByte!9224 (_2!9111 lt!304316)) (currentBit!9219 (_2!9111 lt!304316))))))))

(declare-fun lt!304312 () Unit!13815)

(declare-fun Unit!13820 () Unit!13815)

(assert (=> b!195859 (= lt!304312 Unit!13820)))

(assert (=> b!195859 (= (_1!9117 lt!304297) (withMovedBitIndex!0 (_2!9117 lt!304297) (bvsub (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304327))) (currentByte!9224 (_2!9111 lt!304327)) (currentBit!9219 (_2!9111 lt!304327))) (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304316))) (currentByte!9224 (_2!9111 lt!304316)) (currentBit!9219 (_2!9111 lt!304316))))))))

(declare-fun lt!304303 () Unit!13815)

(declare-fun Unit!13821 () Unit!13815)

(assert (=> b!195859 (= lt!304303 Unit!13821)))

(assert (=> b!195859 (= (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304041))) (currentByte!9224 (_2!9111 lt!304041)) (currentBit!9219 (_2!9111 lt!304041))) (bvsub (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304327))) (currentByte!9224 (_2!9111 lt!304327)) (currentBit!9219 (_2!9111 lt!304327))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!304289 () Unit!13815)

(declare-fun Unit!13822 () Unit!13815)

(assert (=> b!195859 (= lt!304289 Unit!13822)))

(assert (=> b!195859 (= (_2!9116 lt!304326) (_2!9116 lt!304318))))

(declare-fun lt!304291 () Unit!13815)

(declare-fun Unit!13823 () Unit!13815)

(assert (=> b!195859 (= lt!304291 Unit!13823)))

(assert (=> b!195859 (invariant!0 (currentBit!9219 (_2!9111 lt!304316)) (currentByte!9224 (_2!9111 lt!304316)) (size!4436 (buf!4922 (_2!9111 lt!304316))))))

(declare-fun lt!304300 () Unit!13815)

(declare-fun Unit!13824 () Unit!13815)

(assert (=> b!195859 (= lt!304300 Unit!13824)))

(assert (=> b!195859 (= (size!4436 (buf!4922 (_2!9111 lt!304041))) (size!4436 (buf!4922 (_2!9111 lt!304316))))))

(declare-fun lt!304324 () Unit!13815)

(declare-fun Unit!13825 () Unit!13815)

(assert (=> b!195859 (= lt!304324 Unit!13825)))

(assert (=> b!195859 (= (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304316))) (currentByte!9224 (_2!9111 lt!304316)) (currentBit!9219 (_2!9111 lt!304316))) (bvsub (bvadd (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304041))) (currentByte!9224 (_2!9111 lt!304041)) (currentBit!9219 (_2!9111 lt!304041))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304325 () Unit!13815)

(declare-fun Unit!13826 () Unit!13815)

(assert (=> b!195859 (= lt!304325 Unit!13826)))

(declare-fun lt!304320 () Unit!13815)

(declare-fun Unit!13827 () Unit!13815)

(assert (=> b!195859 (= lt!304320 Unit!13827)))

(assert (=> b!195859 (= lt!304330 (reader!0 (_2!9111 lt!304041) (_2!9111 lt!304316)))))

(declare-fun lt!304292 () (_ BitVec 64))

(assert (=> b!195859 (= lt!304292 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304335 () Unit!13815)

(assert (=> b!195859 (= lt!304335 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9111 lt!304041) (buf!4922 (_2!9111 lt!304316)) lt!304292))))

(assert (=> b!195859 (validate_offset_bits!1 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304316)))) ((_ sign_extend 32) (currentByte!9224 (_2!9111 lt!304041))) ((_ sign_extend 32) (currentBit!9219 (_2!9111 lt!304041))) lt!304292)))

(declare-fun lt!304338 () Unit!13815)

(assert (=> b!195859 (= lt!304338 lt!304335)))

(assert (=> b!195859 (= lt!304287 (readNBitsLSBFirstsLoopPure!0 (_1!9117 lt!304330) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!163860 () Bool)

(assert (=> b!195859 (= res!163860 (= (_2!9116 lt!304287) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!195859 (=> (not res!163860) (not e!134651))))

(assert (=> b!195859 e!134651))

(declare-fun lt!304323 () Unit!13815)

(declare-fun Unit!13828 () Unit!13815)

(assert (=> b!195859 (= lt!304323 Unit!13828)))

(declare-fun b!195860 () Bool)

(declare-fun e!134650 () Bool)

(assert (=> b!195860 (= e!134652 e!134650)))

(declare-fun res!163854 () Bool)

(assert (=> b!195860 (=> (not res!163854) (not e!134650))))

(declare-fun lt!304290 () tuple2!16942)

(assert (=> b!195860 (= res!163854 (= (_2!9116 lt!304290) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!304309 () tuple2!16944)

(assert (=> b!195860 (= lt!304290 (readNBitsLSBFirstsLoopPure!0 (_1!9117 lt!304309) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!304319 () Unit!13815)

(declare-fun lt!304306 () Unit!13815)

(assert (=> b!195860 (= lt!304319 lt!304306)))

(assert (=> b!195860 (validate_offset_bits!1 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304285)))) ((_ sign_extend 32) (currentByte!9224 (_2!9111 lt!304041))) ((_ sign_extend 32) (currentBit!9219 (_2!9111 lt!304041))) lt!304332)))

(assert (=> b!195860 (= lt!304306 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9111 lt!304041) (buf!4922 (_2!9111 lt!304285)) lt!304332))))

(assert (=> b!195860 e!134654))

(declare-fun res!163861 () Bool)

(assert (=> b!195860 (=> (not res!163861) (not e!134654))))

(assert (=> b!195860 (= res!163861 (and (= (size!4436 (buf!4922 (_2!9111 lt!304041))) (size!4436 (buf!4922 (_2!9111 lt!304285)))) (bvsge lt!304332 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195860 (= lt!304332 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!195860 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!195860 (= lt!304309 (reader!0 (_2!9111 lt!304041) (_2!9111 lt!304285)))))

(declare-fun b!195862 () Bool)

(assert (=> b!195862 (= e!134650 (= (_1!9116 lt!304290) (_2!9117 lt!304309)))))

(declare-fun b!195863 () Bool)

(declare-fun Unit!13829 () Unit!13815)

(assert (=> b!195863 (= e!134649 (tuple2!16933 Unit!13829 (_2!9111 lt!304041)))))

(declare-fun lt!304286 () Unit!13815)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7980) Unit!13815)

(assert (=> b!195863 (= lt!304286 (lemmaIsPrefixRefl!0 (_2!9111 lt!304041)))))

(assert (=> b!195863 call!3068))

(declare-fun lt!304293 () Unit!13815)

(assert (=> b!195863 (= lt!304293 lt!304286)))

(declare-fun b!195864 () Bool)

(declare-fun res!163855 () Bool)

(assert (=> b!195864 (=> (not res!163855) (not e!134652))))

(declare-fun lt!304288 () (_ BitVec 64))

(declare-fun lt!304308 () (_ BitVec 64))

(assert (=> b!195864 (= res!163855 (= (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304285))) (currentByte!9224 (_2!9111 lt!304285)) (currentBit!9219 (_2!9111 lt!304285))) (bvsub lt!304288 lt!304308)))))

(assert (=> b!195864 (or (= (bvand lt!304288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304308 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304288 lt!304308) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195864 (= lt!304308 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!304313 () (_ BitVec 64))

(declare-fun lt!304298 () (_ BitVec 64))

(assert (=> b!195864 (= lt!304288 (bvadd lt!304313 lt!304298))))

(assert (=> b!195864 (or (not (= (bvand lt!304313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304298 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!304313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!304313 lt!304298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195864 (= lt!304298 ((_ sign_extend 32) nBits!348))))

(assert (=> b!195864 (= lt!304313 (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304041))) (currentByte!9224 (_2!9111 lt!304041)) (currentBit!9219 (_2!9111 lt!304041))))))

(declare-fun d!66273 () Bool)

(assert (=> d!66273 e!134652))

(declare-fun res!163856 () Bool)

(assert (=> d!66273 (=> (not res!163856) (not e!134652))))

(assert (=> d!66273 (= res!163856 (invariant!0 (currentBit!9219 (_2!9111 lt!304285)) (currentByte!9224 (_2!9111 lt!304285)) (size!4436 (buf!4922 (_2!9111 lt!304285)))))))

(assert (=> d!66273 (= lt!304285 e!134649)))

(assert (=> d!66273 (= c!9744 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66273 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66273 (= (appendBitsLSBFirstLoopTR!0 (_2!9111 lt!304041) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!304285)))

(declare-fun b!195861 () Bool)

(assert (=> b!195861 (= lt!304336 (readBitPure!0 (readerFrom!0 (_2!9111 lt!304328) (currentBit!9219 (_2!9111 lt!304041)) (currentByte!9224 (_2!9111 lt!304041)))))))

(declare-fun res!163852 () Bool)

(assert (=> b!195861 (= res!163852 (and (= (_2!9112 lt!304336) lt!304301) (= (_1!9112 lt!304336) (_2!9111 lt!304328))))))

(assert (=> b!195861 (=> (not res!163852) (not e!134646))))

(assert (=> b!195861 (= e!134648 e!134646)))

(assert (= (and d!66273 c!9744) b!195863))

(assert (= (and d!66273 (not c!9744)) b!195859))

(assert (= (and b!195859 res!163863) b!195857))

(assert (= (and b!195857 res!163859) b!195849))

(assert (= (and b!195849 res!163862) b!195861))

(assert (= (and b!195861 res!163852) b!195851))

(assert (= (and b!195859 res!163858) b!195854))

(assert (= (and b!195859 c!9745) b!195850))

(assert (= (and b!195859 (not c!9745)) b!195853))

(assert (= (and b!195859 res!163860) b!195858))

(assert (= (or b!195863 b!195849) bm!3065))

(assert (= (and d!66273 res!163856) b!195852))

(assert (= (and b!195852 res!163857) b!195864))

(assert (= (and b!195864 res!163855) b!195856))

(assert (= (and b!195856 res!163853) b!195860))

(assert (= (and b!195860 res!163861) b!195855))

(assert (= (and b!195860 res!163854) b!195862))

(declare-fun m!302989 () Bool)

(assert (=> b!195857 m!302989))

(assert (=> b!195857 m!302861))

(declare-fun m!302991 () Bool)

(assert (=> b!195859 m!302991))

(declare-fun m!302993 () Bool)

(assert (=> b!195859 m!302993))

(declare-fun m!302995 () Bool)

(assert (=> b!195859 m!302995))

(declare-fun m!302997 () Bool)

(assert (=> b!195859 m!302997))

(declare-fun m!302999 () Bool)

(assert (=> b!195859 m!302999))

(declare-fun m!303001 () Bool)

(assert (=> b!195859 m!303001))

(declare-fun m!303003 () Bool)

(assert (=> b!195859 m!303003))

(declare-fun m!303005 () Bool)

(assert (=> b!195859 m!303005))

(declare-fun m!303007 () Bool)

(assert (=> b!195859 m!303007))

(declare-fun m!303009 () Bool)

(assert (=> b!195859 m!303009))

(declare-fun m!303011 () Bool)

(assert (=> b!195859 m!303011))

(declare-fun m!303013 () Bool)

(assert (=> b!195859 m!303013))

(assert (=> b!195859 m!302995))

(declare-fun m!303015 () Bool)

(assert (=> b!195859 m!303015))

(declare-fun m!303017 () Bool)

(assert (=> b!195859 m!303017))

(declare-fun m!303019 () Bool)

(assert (=> b!195859 m!303019))

(declare-fun m!303021 () Bool)

(assert (=> b!195859 m!303021))

(declare-fun m!303023 () Bool)

(assert (=> b!195859 m!303023))

(declare-fun m!303025 () Bool)

(assert (=> b!195859 m!303025))

(declare-fun m!303027 () Bool)

(assert (=> b!195859 m!303027))

(declare-fun m!303029 () Bool)

(assert (=> b!195859 m!303029))

(declare-fun m!303031 () Bool)

(assert (=> b!195859 m!303031))

(declare-fun m!303033 () Bool)

(assert (=> b!195859 m!303033))

(declare-fun m!303035 () Bool)

(assert (=> b!195859 m!303035))

(declare-fun m!303037 () Bool)

(assert (=> b!195859 m!303037))

(declare-fun m!303039 () Bool)

(assert (=> b!195859 m!303039))

(declare-fun m!303041 () Bool)

(assert (=> b!195859 m!303041))

(assert (=> b!195859 m!302861))

(declare-fun m!303043 () Bool)

(assert (=> b!195859 m!303043))

(declare-fun m!303045 () Bool)

(assert (=> b!195859 m!303045))

(declare-fun m!303047 () Bool)

(assert (=> b!195859 m!303047))

(declare-fun m!303049 () Bool)

(assert (=> b!195859 m!303049))

(declare-fun m!303051 () Bool)

(assert (=> b!195859 m!303051))

(declare-fun m!303053 () Bool)

(assert (=> b!195859 m!303053))

(declare-fun m!303055 () Bool)

(assert (=> b!195859 m!303055))

(declare-fun m!303057 () Bool)

(assert (=> b!195855 m!303057))

(declare-fun m!303059 () Bool)

(assert (=> b!195860 m!303059))

(assert (=> b!195860 m!302997))

(declare-fun m!303061 () Bool)

(assert (=> b!195860 m!303061))

(declare-fun m!303063 () Bool)

(assert (=> b!195860 m!303063))

(declare-fun m!303065 () Bool)

(assert (=> b!195860 m!303065))

(assert (=> b!195860 m!303053))

(declare-fun m!303067 () Bool)

(assert (=> b!195864 m!303067))

(assert (=> b!195864 m!302861))

(declare-fun m!303069 () Bool)

(assert (=> d!66273 m!303069))

(declare-fun m!303071 () Bool)

(assert (=> bm!3065 m!303071))

(declare-fun m!303073 () Bool)

(assert (=> b!195863 m!303073))

(declare-fun m!303075 () Bool)

(assert (=> b!195861 m!303075))

(assert (=> b!195861 m!303075))

(declare-fun m!303077 () Bool)

(assert (=> b!195861 m!303077))

(declare-fun m!303079 () Bool)

(assert (=> b!195856 m!303079))

(declare-fun m!303081 () Bool)

(assert (=> b!195851 m!303081))

(assert (=> b!195851 m!302989))

(assert (=> b!195697 d!66273))

(declare-fun d!66325 () Bool)

(assert (=> d!66325 (= (invariant!0 (currentBit!9219 thiss!1204) (currentByte!9224 thiss!1204) (size!4436 (buf!4922 thiss!1204))) (and (bvsge (currentBit!9219 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9219 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9224 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9224 thiss!1204) (size!4436 (buf!4922 thiss!1204))) (and (= (currentBit!9219 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9224 thiss!1204) (size!4436 (buf!4922 thiss!1204)))))))))

(assert (=> b!195702 d!66325))

(declare-fun d!66327 () Bool)

(declare-fun e!134655 () Bool)

(assert (=> d!66327 e!134655))

(declare-fun res!163864 () Bool)

(assert (=> d!66327 (=> (not res!163864) (not e!134655))))

(declare-fun lt!304344 () (_ BitVec 64))

(declare-fun lt!304342 () (_ BitVec 64))

(declare-fun lt!304340 () (_ BitVec 64))

(assert (=> d!66327 (= res!163864 (= lt!304340 (bvsub lt!304344 lt!304342)))))

(assert (=> d!66327 (or (= (bvand lt!304344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304342 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304344 lt!304342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66327 (= lt!304342 (remainingBits!0 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304041)))) ((_ sign_extend 32) (currentByte!9224 (_2!9111 lt!304041))) ((_ sign_extend 32) (currentBit!9219 (_2!9111 lt!304041)))))))

(declare-fun lt!304343 () (_ BitVec 64))

(declare-fun lt!304341 () (_ BitVec 64))

(assert (=> d!66327 (= lt!304344 (bvmul lt!304343 lt!304341))))

(assert (=> d!66327 (or (= lt!304343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304341 (bvsdiv (bvmul lt!304343 lt!304341) lt!304343)))))

(assert (=> d!66327 (= lt!304341 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66327 (= lt!304343 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304041)))))))

(assert (=> d!66327 (= lt!304340 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9224 (_2!9111 lt!304041))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9219 (_2!9111 lt!304041)))))))

(assert (=> d!66327 (invariant!0 (currentBit!9219 (_2!9111 lt!304041)) (currentByte!9224 (_2!9111 lt!304041)) (size!4436 (buf!4922 (_2!9111 lt!304041))))))

(assert (=> d!66327 (= (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304041))) (currentByte!9224 (_2!9111 lt!304041)) (currentBit!9219 (_2!9111 lt!304041))) lt!304340)))

(declare-fun b!195865 () Bool)

(declare-fun res!163865 () Bool)

(assert (=> b!195865 (=> (not res!163865) (not e!134655))))

(assert (=> b!195865 (= res!163865 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304340))))

(declare-fun b!195866 () Bool)

(declare-fun lt!304345 () (_ BitVec 64))

(assert (=> b!195866 (= e!134655 (bvsle lt!304340 (bvmul lt!304345 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195866 (or (= lt!304345 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304345 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304345)))))

(assert (=> b!195866 (= lt!304345 ((_ sign_extend 32) (size!4436 (buf!4922 (_2!9111 lt!304041)))))))

(assert (= (and d!66327 res!163864) b!195865))

(assert (= (and b!195865 res!163865) b!195866))

(declare-fun m!303083 () Bool)

(assert (=> d!66327 m!303083))

(assert (=> d!66327 m!302917))

(assert (=> b!195704 d!66327))

(declare-fun d!66329 () Bool)

(declare-fun e!134656 () Bool)

(assert (=> d!66329 e!134656))

(declare-fun res!163866 () Bool)

(assert (=> d!66329 (=> (not res!163866) (not e!134656))))

(declare-fun lt!304350 () (_ BitVec 64))

(declare-fun lt!304346 () (_ BitVec 64))

(declare-fun lt!304348 () (_ BitVec 64))

(assert (=> d!66329 (= res!163866 (= lt!304346 (bvsub lt!304350 lt!304348)))))

(assert (=> d!66329 (or (= (bvand lt!304350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304348 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304350 lt!304348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66329 (= lt!304348 (remainingBits!0 ((_ sign_extend 32) (size!4436 (buf!4922 thiss!1204))) ((_ sign_extend 32) (currentByte!9224 thiss!1204)) ((_ sign_extend 32) (currentBit!9219 thiss!1204))))))

(declare-fun lt!304349 () (_ BitVec 64))

(declare-fun lt!304347 () (_ BitVec 64))

(assert (=> d!66329 (= lt!304350 (bvmul lt!304349 lt!304347))))

(assert (=> d!66329 (or (= lt!304349 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304347 (bvsdiv (bvmul lt!304349 lt!304347) lt!304349)))))

(assert (=> d!66329 (= lt!304347 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66329 (= lt!304349 ((_ sign_extend 32) (size!4436 (buf!4922 thiss!1204))))))

(assert (=> d!66329 (= lt!304346 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9224 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9219 thiss!1204))))))

(assert (=> d!66329 (invariant!0 (currentBit!9219 thiss!1204) (currentByte!9224 thiss!1204) (size!4436 (buf!4922 thiss!1204)))))

(assert (=> d!66329 (= (bitIndex!0 (size!4436 (buf!4922 thiss!1204)) (currentByte!9224 thiss!1204) (currentBit!9219 thiss!1204)) lt!304346)))

(declare-fun b!195867 () Bool)

(declare-fun res!163867 () Bool)

(assert (=> b!195867 (=> (not res!163867) (not e!134656))))

(assert (=> b!195867 (= res!163867 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304346))))

(declare-fun b!195868 () Bool)

(declare-fun lt!304351 () (_ BitVec 64))

(assert (=> b!195868 (= e!134656 (bvsle lt!304346 (bvmul lt!304351 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195868 (or (= lt!304351 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304351 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304351)))))

(assert (=> b!195868 (= lt!304351 ((_ sign_extend 32) (size!4436 (buf!4922 thiss!1204))))))

(assert (= (and d!66329 res!163866) b!195867))

(assert (= (and b!195867 res!163867) b!195868))

(assert (=> d!66329 m!302921))

(assert (=> d!66329 m!302881))

(assert (=> b!195704 d!66329))

(declare-fun b!195894 () Bool)

(declare-fun e!134669 () Bool)

(declare-fun e!134670 () Bool)

(assert (=> b!195894 (= e!134669 e!134670)))

(declare-fun res!163886 () Bool)

(assert (=> b!195894 (=> (not res!163886) (not e!134670))))

(declare-fun lt!304399 () tuple2!16932)

(declare-fun lt!304396 () tuple2!16934)

(assert (=> b!195894 (= res!163886 (and (= (_2!9112 lt!304396) lt!304040) (= (_1!9112 lt!304396) (_2!9111 lt!304399))))))

(assert (=> b!195894 (= lt!304396 (readBitPure!0 (readerFrom!0 (_2!9111 lt!304399) (currentBit!9219 thiss!1204) (currentByte!9224 thiss!1204))))))

(declare-fun d!66331 () Bool)

(assert (=> d!66331 e!134669))

(declare-fun res!163887 () Bool)

(assert (=> d!66331 (=> (not res!163887) (not e!134669))))

(assert (=> d!66331 (= res!163887 (= (size!4436 (buf!4922 thiss!1204)) (size!4436 (buf!4922 (_2!9111 lt!304399)))))))

(declare-fun choose!16 (BitStream!7980 Bool) tuple2!16932)

(assert (=> d!66331 (= lt!304399 (choose!16 thiss!1204 lt!304040))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66331 (validate_offset_bit!0 ((_ sign_extend 32) (size!4436 (buf!4922 thiss!1204))) ((_ sign_extend 32) (currentByte!9224 thiss!1204)) ((_ sign_extend 32) (currentBit!9219 thiss!1204)))))

(assert (=> d!66331 (= (appendBit!0 thiss!1204 lt!304040) lt!304399)))

(declare-fun b!195895 () Bool)

(assert (=> b!195895 (= e!134670 (= (bitIndex!0 (size!4436 (buf!4922 (_1!9112 lt!304396))) (currentByte!9224 (_1!9112 lt!304396)) (currentBit!9219 (_1!9112 lt!304396))) (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304399))) (currentByte!9224 (_2!9111 lt!304399)) (currentBit!9219 (_2!9111 lt!304399)))))))

(declare-fun b!195892 () Bool)

(declare-fun res!163888 () Bool)

(assert (=> b!195892 (=> (not res!163888) (not e!134669))))

(declare-fun lt!304397 () (_ BitVec 64))

(declare-fun lt!304398 () (_ BitVec 64))

(assert (=> b!195892 (= res!163888 (= (bitIndex!0 (size!4436 (buf!4922 (_2!9111 lt!304399))) (currentByte!9224 (_2!9111 lt!304399)) (currentBit!9219 (_2!9111 lt!304399))) (bvadd lt!304398 lt!304397)))))

(assert (=> b!195892 (or (not (= (bvand lt!304398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304397 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!304398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!304398 lt!304397) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195892 (= lt!304397 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!195892 (= lt!304398 (bitIndex!0 (size!4436 (buf!4922 thiss!1204)) (currentByte!9224 thiss!1204) (currentBit!9219 thiss!1204)))))

(declare-fun b!195893 () Bool)

(declare-fun res!163889 () Bool)

(assert (=> b!195893 (=> (not res!163889) (not e!134669))))

(assert (=> b!195893 (= res!163889 (isPrefixOf!0 thiss!1204 (_2!9111 lt!304399)))))

(assert (= (and d!66331 res!163887) b!195892))

(assert (= (and b!195892 res!163888) b!195893))

(assert (= (and b!195893 res!163889) b!195894))

(assert (= (and b!195894 res!163886) b!195895))

(declare-fun m!303085 () Bool)

(assert (=> b!195895 m!303085))

(declare-fun m!303087 () Bool)

(assert (=> b!195895 m!303087))

(declare-fun m!303089 () Bool)

(assert (=> b!195893 m!303089))

(assert (=> b!195892 m!303087))

(assert (=> b!195892 m!302863))

(declare-fun m!303091 () Bool)

(assert (=> b!195894 m!303091))

(assert (=> b!195894 m!303091))

(declare-fun m!303093 () Bool)

(assert (=> b!195894 m!303093))

(declare-fun m!303095 () Bool)

(assert (=> d!66331 m!303095))

(declare-fun m!303097 () Bool)

(assert (=> d!66331 m!303097))

(assert (=> b!195704 d!66331))

(declare-fun d!66333 () Bool)

(declare-fun e!134671 () Bool)

(assert (=> d!66333 e!134671))

(declare-fun res!163890 () Bool)

(assert (=> d!66333 (=> (not res!163890) (not e!134671))))

(declare-fun lt!304406 () (_ BitVec 64))

(declare-fun lt!304408 () (_ BitVec 64))

(declare-fun lt!304410 () (_ BitVec 64))

(assert (=> d!66333 (= res!163890 (= lt!304406 (bvsub lt!304410 lt!304408)))))

(assert (=> d!66333 (or (= (bvand lt!304410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304408 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304410 lt!304408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66333 (= lt!304408 (remainingBits!0 ((_ sign_extend 32) (size!4436 (buf!4922 (_1!9112 lt!304036)))) ((_ sign_extend 32) (currentByte!9224 (_1!9112 lt!304036))) ((_ sign_extend 32) (currentBit!9219 (_1!9112 lt!304036)))))))

(declare-fun lt!304409 () (_ BitVec 64))

(declare-fun lt!304407 () (_ BitVec 64))

(assert (=> d!66333 (= lt!304410 (bvmul lt!304409 lt!304407))))

(assert (=> d!66333 (or (= lt!304409 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304407 (bvsdiv (bvmul lt!304409 lt!304407) lt!304409)))))

(assert (=> d!66333 (= lt!304407 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66333 (= lt!304409 ((_ sign_extend 32) (size!4436 (buf!4922 (_1!9112 lt!304036)))))))

(assert (=> d!66333 (= lt!304406 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9224 (_1!9112 lt!304036))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9219 (_1!9112 lt!304036)))))))

(assert (=> d!66333 (invariant!0 (currentBit!9219 (_1!9112 lt!304036)) (currentByte!9224 (_1!9112 lt!304036)) (size!4436 (buf!4922 (_1!9112 lt!304036))))))

(assert (=> d!66333 (= (bitIndex!0 (size!4436 (buf!4922 (_1!9112 lt!304036))) (currentByte!9224 (_1!9112 lt!304036)) (currentBit!9219 (_1!9112 lt!304036))) lt!304406)))

(declare-fun b!195896 () Bool)

(declare-fun res!163891 () Bool)

(assert (=> b!195896 (=> (not res!163891) (not e!134671))))

(assert (=> b!195896 (= res!163891 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304406))))

(declare-fun b!195897 () Bool)

(declare-fun lt!304411 () (_ BitVec 64))

(assert (=> b!195897 (= e!134671 (bvsle lt!304406 (bvmul lt!304411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195897 (or (= lt!304411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304411)))))

(assert (=> b!195897 (= lt!304411 ((_ sign_extend 32) (size!4436 (buf!4922 (_1!9112 lt!304036)))))))

(assert (= (and d!66333 res!163890) b!195896))

(assert (= (and b!195896 res!163891) b!195897))

(declare-fun m!303099 () Bool)

(assert (=> d!66333 m!303099))

(declare-fun m!303101 () Bool)

(assert (=> d!66333 m!303101))

(assert (=> b!195703 d!66333))

(assert (=> b!195698 d!66327))

(assert (=> b!195698 d!66329))

(check-sat (not b!195855) (not b!195755) (not d!66259) (not b!195861) (not b!195851) (not d!66263) (not b!195895) (not bm!3065) (not d!66273) (not d!66327) (not b!195744) (not b!195746) (not d!66257) (not b!195753) (not d!66261) (not d!66333) (not d!66329) (not b!195864) (not b!195893) (not b!195892) (not b!195863) (not b!195860) (not b!195859) (not b!195857) (not b!195856) (not d!66271) (not b!195894) (not d!66331) (not b!195737) (not d!66267))
(check-sat)
