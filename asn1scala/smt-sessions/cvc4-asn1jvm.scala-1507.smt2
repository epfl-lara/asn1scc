; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41622 () Bool)

(assert start!41622)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun e!134573 () Bool)

(declare-fun b!195725 () Bool)

(declare-datatypes ((array!10059 0))(
  ( (array!10060 (arr!5367 (Array (_ BitVec 32) (_ BitVec 8))) (size!4437 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7982 0))(
  ( (BitStream!7983 (buf!4923 array!10059) (currentByte!9225 (_ BitVec 32)) (currentBit!9220 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13817 0))(
  ( (Unit!13818) )
))
(declare-datatypes ((tuple2!16936 0))(
  ( (tuple2!16937 (_1!9113 Unit!13817) (_2!9113 BitStream!7982)) )
))
(declare-fun lt!304069 () tuple2!16936)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!304062 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195725 (= e!134573 (= (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304069))) (currentByte!9225 (_2!9113 lt!304069)) (currentBit!9220 (_2!9113 lt!304069))) (bvsub (bvsub (bvadd lt!304062 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun thiss!1204 () BitStream!7982)

(declare-fun isPrefixOf!0 (BitStream!7982 BitStream!7982) Bool)

(assert (=> b!195725 (isPrefixOf!0 thiss!1204 (_2!9113 lt!304069))))

(declare-fun lt!304067 () Unit!13817)

(declare-fun lt!304065 () tuple2!16936)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7982 BitStream!7982 BitStream!7982) Unit!13817)

(assert (=> b!195725 (= lt!304067 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9113 lt!304065) (_2!9113 lt!304069)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7982 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16936)

(assert (=> b!195725 (= lt!304069 (appendBitsLSBFirstLoopTR!0 (_2!9113 lt!304065) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!195726 () Bool)

(declare-fun e!134576 () Bool)

(assert (=> b!195726 (= e!134576 (not e!134573))))

(declare-fun res!163739 () Bool)

(assert (=> b!195726 (=> res!163739 e!134573)))

(declare-fun lt!304064 () (_ BitVec 64))

(assert (=> b!195726 (= res!163739 (not (= lt!304062 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304064))))))

(assert (=> b!195726 (= lt!304062 (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304065))) (currentByte!9225 (_2!9113 lt!304065)) (currentBit!9220 (_2!9113 lt!304065))))))

(assert (=> b!195726 (= lt!304064 (bitIndex!0 (size!4437 (buf!4923 thiss!1204)) (currentByte!9225 thiss!1204) (currentBit!9220 thiss!1204)))))

(declare-fun e!134572 () Bool)

(assert (=> b!195726 e!134572))

(declare-fun res!163740 () Bool)

(assert (=> b!195726 (=> (not res!163740) (not e!134572))))

(assert (=> b!195726 (= res!163740 (= (size!4437 (buf!4923 thiss!1204)) (size!4437 (buf!4923 (_2!9113 lt!304065)))))))

(declare-fun lt!304061 () Bool)

(declare-fun appendBit!0 (BitStream!7982 Bool) tuple2!16936)

(assert (=> b!195726 (= lt!304065 (appendBit!0 thiss!1204 lt!304061))))

(assert (=> b!195726 (= lt!304061 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!163738 () Bool)

(assert (=> start!41622 (=> (not res!163738) (not e!134576))))

(assert (=> start!41622 (= res!163738 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41622 e!134576))

(assert (=> start!41622 true))

(declare-fun e!134571 () Bool)

(declare-fun inv!12 (BitStream!7982) Bool)

(assert (=> start!41622 (and (inv!12 thiss!1204) e!134571)))

(declare-fun b!195727 () Bool)

(declare-fun res!163743 () Bool)

(assert (=> b!195727 (=> (not res!163743) (not e!134576))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195727 (= res!163743 (invariant!0 (currentBit!9220 thiss!1204) (currentByte!9225 thiss!1204) (size!4437 (buf!4923 thiss!1204))))))

(declare-fun b!195728 () Bool)

(declare-fun res!163735 () Bool)

(declare-fun e!134570 () Bool)

(assert (=> b!195728 (=> (not res!163735) (not e!134570))))

(assert (=> b!195728 (= res!163735 (isPrefixOf!0 thiss!1204 (_2!9113 lt!304065)))))

(declare-fun b!195729 () Bool)

(declare-fun res!163737 () Bool)

(assert (=> b!195729 (=> (not res!163737) (not e!134576))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195729 (= res!163737 (validate_offset_bits!1 ((_ sign_extend 32) (size!4437 (buf!4923 thiss!1204))) ((_ sign_extend 32) (currentByte!9225 thiss!1204)) ((_ sign_extend 32) (currentBit!9220 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195730 () Bool)

(declare-fun res!163736 () Bool)

(assert (=> b!195730 (=> (not res!163736) (not e!134576))))

(assert (=> b!195730 (= res!163736 (not (= i!590 nBits!348)))))

(declare-fun b!195731 () Bool)

(assert (=> b!195731 (= e!134572 e!134570)))

(declare-fun res!163741 () Bool)

(assert (=> b!195731 (=> (not res!163741) (not e!134570))))

(declare-fun lt!304063 () (_ BitVec 64))

(declare-fun lt!304066 () (_ BitVec 64))

(assert (=> b!195731 (= res!163741 (= lt!304063 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304066)))))

(assert (=> b!195731 (= lt!304063 (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304065))) (currentByte!9225 (_2!9113 lt!304065)) (currentBit!9220 (_2!9113 lt!304065))))))

(assert (=> b!195731 (= lt!304066 (bitIndex!0 (size!4437 (buf!4923 thiss!1204)) (currentByte!9225 thiss!1204) (currentBit!9220 thiss!1204)))))

(declare-fun b!195732 () Bool)

(declare-fun array_inv!4178 (array!10059) Bool)

(assert (=> b!195732 (= e!134571 (array_inv!4178 (buf!4923 thiss!1204)))))

(declare-fun b!195733 () Bool)

(declare-fun e!134575 () Bool)

(declare-datatypes ((tuple2!16938 0))(
  ( (tuple2!16939 (_1!9114 BitStream!7982) (_2!9114 Bool)) )
))
(declare-fun lt!304068 () tuple2!16938)

(assert (=> b!195733 (= e!134575 (= (bitIndex!0 (size!4437 (buf!4923 (_1!9114 lt!304068))) (currentByte!9225 (_1!9114 lt!304068)) (currentBit!9220 (_1!9114 lt!304068))) lt!304063))))

(declare-fun b!195734 () Bool)

(assert (=> b!195734 (= e!134570 e!134575)))

(declare-fun res!163742 () Bool)

(assert (=> b!195734 (=> (not res!163742) (not e!134575))))

(assert (=> b!195734 (= res!163742 (and (= (_2!9114 lt!304068) lt!304061) (= (_1!9114 lt!304068) (_2!9113 lt!304065))))))

(declare-fun readBitPure!0 (BitStream!7982) tuple2!16938)

(declare-fun readerFrom!0 (BitStream!7982 (_ BitVec 32) (_ BitVec 32)) BitStream!7982)

(assert (=> b!195734 (= lt!304068 (readBitPure!0 (readerFrom!0 (_2!9113 lt!304065) (currentBit!9220 thiss!1204) (currentByte!9225 thiss!1204))))))

(assert (= (and start!41622 res!163738) b!195729))

(assert (= (and b!195729 res!163737) b!195727))

(assert (= (and b!195727 res!163743) b!195730))

(assert (= (and b!195730 res!163736) b!195726))

(assert (= (and b!195726 res!163740) b!195731))

(assert (= (and b!195731 res!163741) b!195728))

(assert (= (and b!195728 res!163735) b!195734))

(assert (= (and b!195734 res!163742) b!195733))

(assert (= (and b!195726 (not res!163739)) b!195725))

(assert (= start!41622 b!195732))

(declare-fun m!302885 () Bool)

(assert (=> b!195725 m!302885))

(declare-fun m!302887 () Bool)

(assert (=> b!195725 m!302887))

(declare-fun m!302889 () Bool)

(assert (=> b!195725 m!302889))

(declare-fun m!302891 () Bool)

(assert (=> b!195725 m!302891))

(declare-fun m!302893 () Bool)

(assert (=> b!195727 m!302893))

(declare-fun m!302895 () Bool)

(assert (=> b!195732 m!302895))

(declare-fun m!302897 () Bool)

(assert (=> b!195731 m!302897))

(declare-fun m!302899 () Bool)

(assert (=> b!195731 m!302899))

(declare-fun m!302901 () Bool)

(assert (=> b!195729 m!302901))

(declare-fun m!302903 () Bool)

(assert (=> b!195734 m!302903))

(assert (=> b!195734 m!302903))

(declare-fun m!302905 () Bool)

(assert (=> b!195734 m!302905))

(declare-fun m!302907 () Bool)

(assert (=> start!41622 m!302907))

(declare-fun m!302909 () Bool)

(assert (=> b!195728 m!302909))

(assert (=> b!195726 m!302897))

(assert (=> b!195726 m!302899))

(declare-fun m!302911 () Bool)

(assert (=> b!195726 m!302911))

(declare-fun m!302913 () Bool)

(assert (=> b!195733 m!302913))

(push 1)

(assert (not b!195734))

(assert (not b!195725))

(assert (not b!195731))

(assert (not b!195726))

(assert (not b!195728))

(assert (not b!195732))

(assert (not b!195729))

(assert (not b!195733))

(assert (not start!41622))

(assert (not b!195727))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66283 () Bool)

(assert (=> d!66283 (= (array_inv!4178 (buf!4923 thiss!1204)) (bvsge (size!4437 (buf!4923 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!195732 d!66283))

(declare-fun d!66285 () Bool)

(declare-fun e!134593 () Bool)

(assert (=> d!66285 e!134593))

(declare-fun res!163770 () Bool)

(assert (=> d!66285 (=> (not res!163770) (not e!134593))))

(declare-fun lt!304106 () (_ BitVec 64))

(declare-fun lt!304111 () (_ BitVec 64))

(declare-fun lt!304110 () (_ BitVec 64))

(assert (=> d!66285 (= res!163770 (= lt!304111 (bvsub lt!304106 lt!304110)))))

(assert (=> d!66285 (or (= (bvand lt!304106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304110 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304106 lt!304110) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66285 (= lt!304110 (remainingBits!0 ((_ sign_extend 32) (size!4437 (buf!4923 (_1!9114 lt!304068)))) ((_ sign_extend 32) (currentByte!9225 (_1!9114 lt!304068))) ((_ sign_extend 32) (currentBit!9220 (_1!9114 lt!304068)))))))

(declare-fun lt!304107 () (_ BitVec 64))

(declare-fun lt!304108 () (_ BitVec 64))

(assert (=> d!66285 (= lt!304106 (bvmul lt!304107 lt!304108))))

(assert (=> d!66285 (or (= lt!304107 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304108 (bvsdiv (bvmul lt!304107 lt!304108) lt!304107)))))

(assert (=> d!66285 (= lt!304108 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66285 (= lt!304107 ((_ sign_extend 32) (size!4437 (buf!4923 (_1!9114 lt!304068)))))))

(assert (=> d!66285 (= lt!304111 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9225 (_1!9114 lt!304068))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9220 (_1!9114 lt!304068)))))))

(assert (=> d!66285 (invariant!0 (currentBit!9220 (_1!9114 lt!304068)) (currentByte!9225 (_1!9114 lt!304068)) (size!4437 (buf!4923 (_1!9114 lt!304068))))))

(assert (=> d!66285 (= (bitIndex!0 (size!4437 (buf!4923 (_1!9114 lt!304068))) (currentByte!9225 (_1!9114 lt!304068)) (currentBit!9220 (_1!9114 lt!304068))) lt!304111)))

(declare-fun b!195760 () Bool)

(declare-fun res!163771 () Bool)

(assert (=> b!195760 (=> (not res!163771) (not e!134593))))

(assert (=> b!195760 (= res!163771 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304111))))

(declare-fun b!195761 () Bool)

(declare-fun lt!304109 () (_ BitVec 64))

(assert (=> b!195761 (= e!134593 (bvsle lt!304111 (bvmul lt!304109 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195761 (or (= lt!304109 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304109 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304109)))))

(assert (=> b!195761 (= lt!304109 ((_ sign_extend 32) (size!4437 (buf!4923 (_1!9114 lt!304068)))))))

(assert (= (and d!66285 res!163770) b!195760))

(assert (= (and b!195760 res!163771) b!195761))

(declare-fun m!302935 () Bool)

(assert (=> d!66285 m!302935))

(declare-fun m!302937 () Bool)

(assert (=> d!66285 m!302937))

(assert (=> b!195733 d!66285))

(declare-fun d!66287 () Bool)

(assert (=> d!66287 (= (invariant!0 (currentBit!9220 thiss!1204) (currentByte!9225 thiss!1204) (size!4437 (buf!4923 thiss!1204))) (and (bvsge (currentBit!9220 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9220 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9225 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9225 thiss!1204) (size!4437 (buf!4923 thiss!1204))) (and (= (currentBit!9220 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9225 thiss!1204) (size!4437 (buf!4923 thiss!1204)))))))))

(assert (=> b!195727 d!66287))

(declare-fun d!66289 () Bool)

(assert (=> d!66289 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4437 (buf!4923 thiss!1204))) ((_ sign_extend 32) (currentByte!9225 thiss!1204)) ((_ sign_extend 32) (currentBit!9220 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4437 (buf!4923 thiss!1204))) ((_ sign_extend 32) (currentByte!9225 thiss!1204)) ((_ sign_extend 32) (currentBit!9220 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16487 () Bool)

(assert (= bs!16487 d!66289))

(declare-fun m!302939 () Bool)

(assert (=> bs!16487 m!302939))

(assert (=> b!195729 d!66289))

(declare-fun d!66291 () Bool)

(declare-fun res!163788 () Bool)

(declare-fun e!134602 () Bool)

(assert (=> d!66291 (=> (not res!163788) (not e!134602))))

(assert (=> d!66291 (= res!163788 (= (size!4437 (buf!4923 thiss!1204)) (size!4437 (buf!4923 (_2!9113 lt!304065)))))))

(assert (=> d!66291 (= (isPrefixOf!0 thiss!1204 (_2!9113 lt!304065)) e!134602)))

(declare-fun b!195776 () Bool)

(declare-fun res!163787 () Bool)

(assert (=> b!195776 (=> (not res!163787) (not e!134602))))

(assert (=> b!195776 (= res!163787 (bvsle (bitIndex!0 (size!4437 (buf!4923 thiss!1204)) (currentByte!9225 thiss!1204) (currentBit!9220 thiss!1204)) (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304065))) (currentByte!9225 (_2!9113 lt!304065)) (currentBit!9220 (_2!9113 lt!304065)))))))

(declare-fun b!195777 () Bool)

(declare-fun e!134603 () Bool)

(assert (=> b!195777 (= e!134602 e!134603)))

(declare-fun res!163786 () Bool)

(assert (=> b!195777 (=> res!163786 e!134603)))

(assert (=> b!195777 (= res!163786 (= (size!4437 (buf!4923 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!195778 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10059 array!10059 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195778 (= e!134603 (arrayBitRangesEq!0 (buf!4923 thiss!1204) (buf!4923 (_2!9113 lt!304065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4437 (buf!4923 thiss!1204)) (currentByte!9225 thiss!1204) (currentBit!9220 thiss!1204))))))

(assert (= (and d!66291 res!163788) b!195776))

(assert (= (and b!195776 res!163787) b!195777))

(assert (= (and b!195777 (not res!163786)) b!195778))

(assert (=> b!195776 m!302899))

(assert (=> b!195776 m!302897))

(assert (=> b!195778 m!302899))

(assert (=> b!195778 m!302899))

(declare-fun m!302945 () Bool)

(assert (=> b!195778 m!302945))

(assert (=> b!195728 d!66291))

(declare-fun d!66297 () Bool)

(declare-datatypes ((tuple2!16946 0))(
  ( (tuple2!16947 (_1!9118 Bool) (_2!9118 BitStream!7982)) )
))
(declare-fun lt!304138 () tuple2!16946)

(declare-fun readBit!0 (BitStream!7982) tuple2!16946)

(assert (=> d!66297 (= lt!304138 (readBit!0 (readerFrom!0 (_2!9113 lt!304065) (currentBit!9220 thiss!1204) (currentByte!9225 thiss!1204))))))

(assert (=> d!66297 (= (readBitPure!0 (readerFrom!0 (_2!9113 lt!304065) (currentBit!9220 thiss!1204) (currentByte!9225 thiss!1204))) (tuple2!16939 (_2!9118 lt!304138) (_1!9118 lt!304138)))))

(declare-fun bs!16488 () Bool)

(assert (= bs!16488 d!66297))

(assert (=> bs!16488 m!302903))

(declare-fun m!302947 () Bool)

(assert (=> bs!16488 m!302947))

(assert (=> b!195734 d!66297))

(declare-fun d!66299 () Bool)

(declare-fun e!134606 () Bool)

(assert (=> d!66299 e!134606))

(declare-fun res!163792 () Bool)

(assert (=> d!66299 (=> (not res!163792) (not e!134606))))

(assert (=> d!66299 (= res!163792 (invariant!0 (currentBit!9220 (_2!9113 lt!304065)) (currentByte!9225 (_2!9113 lt!304065)) (size!4437 (buf!4923 (_2!9113 lt!304065)))))))

(assert (=> d!66299 (= (readerFrom!0 (_2!9113 lt!304065) (currentBit!9220 thiss!1204) (currentByte!9225 thiss!1204)) (BitStream!7983 (buf!4923 (_2!9113 lt!304065)) (currentByte!9225 thiss!1204) (currentBit!9220 thiss!1204)))))

(declare-fun b!195781 () Bool)

(assert (=> b!195781 (= e!134606 (invariant!0 (currentBit!9220 thiss!1204) (currentByte!9225 thiss!1204) (size!4437 (buf!4923 (_2!9113 lt!304065)))))))

(assert (= (and d!66299 res!163792) b!195781))

(declare-fun m!302949 () Bool)

(assert (=> d!66299 m!302949))

(declare-fun m!302951 () Bool)

(assert (=> b!195781 m!302951))

(assert (=> b!195734 d!66299))

(declare-fun d!66301 () Bool)

(assert (=> d!66301 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9220 thiss!1204) (currentByte!9225 thiss!1204) (size!4437 (buf!4923 thiss!1204))))))

(declare-fun bs!16489 () Bool)

(assert (= bs!16489 d!66301))

(assert (=> bs!16489 m!302893))

(assert (=> start!41622 d!66301))

(declare-fun d!66303 () Bool)

(declare-fun e!134607 () Bool)

(assert (=> d!66303 e!134607))

(declare-fun res!163793 () Bool)

(assert (=> d!66303 (=> (not res!163793) (not e!134607))))

(declare-fun lt!304143 () (_ BitVec 64))

(declare-fun lt!304139 () (_ BitVec 64))

(declare-fun lt!304144 () (_ BitVec 64))

(assert (=> d!66303 (= res!163793 (= lt!304144 (bvsub lt!304139 lt!304143)))))

(assert (=> d!66303 (or (= (bvand lt!304139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304143 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304139 lt!304143) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66303 (= lt!304143 (remainingBits!0 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304069)))) ((_ sign_extend 32) (currentByte!9225 (_2!9113 lt!304069))) ((_ sign_extend 32) (currentBit!9220 (_2!9113 lt!304069)))))))

(declare-fun lt!304140 () (_ BitVec 64))

(declare-fun lt!304141 () (_ BitVec 64))

(assert (=> d!66303 (= lt!304139 (bvmul lt!304140 lt!304141))))

(assert (=> d!66303 (or (= lt!304140 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304141 (bvsdiv (bvmul lt!304140 lt!304141) lt!304140)))))

(assert (=> d!66303 (= lt!304141 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66303 (= lt!304140 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304069)))))))

(assert (=> d!66303 (= lt!304144 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9225 (_2!9113 lt!304069))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9220 (_2!9113 lt!304069)))))))

(assert (=> d!66303 (invariant!0 (currentBit!9220 (_2!9113 lt!304069)) (currentByte!9225 (_2!9113 lt!304069)) (size!4437 (buf!4923 (_2!9113 lt!304069))))))

(assert (=> d!66303 (= (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304069))) (currentByte!9225 (_2!9113 lt!304069)) (currentBit!9220 (_2!9113 lt!304069))) lt!304144)))

(declare-fun b!195782 () Bool)

(declare-fun res!163794 () Bool)

(assert (=> b!195782 (=> (not res!163794) (not e!134607))))

(assert (=> b!195782 (= res!163794 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304144))))

(declare-fun b!195783 () Bool)

(declare-fun lt!304142 () (_ BitVec 64))

(assert (=> b!195783 (= e!134607 (bvsle lt!304144 (bvmul lt!304142 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195783 (or (= lt!304142 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304142 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304142)))))

(assert (=> b!195783 (= lt!304142 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304069)))))))

(assert (= (and d!66303 res!163793) b!195782))

(assert (= (and b!195782 res!163794) b!195783))

(declare-fun m!302953 () Bool)

(assert (=> d!66303 m!302953))

(declare-fun m!302955 () Bool)

(assert (=> d!66303 m!302955))

(assert (=> b!195725 d!66303))

(declare-fun d!66305 () Bool)

(declare-fun res!163797 () Bool)

(declare-fun e!134608 () Bool)

(assert (=> d!66305 (=> (not res!163797) (not e!134608))))

(assert (=> d!66305 (= res!163797 (= (size!4437 (buf!4923 thiss!1204)) (size!4437 (buf!4923 (_2!9113 lt!304069)))))))

(assert (=> d!66305 (= (isPrefixOf!0 thiss!1204 (_2!9113 lt!304069)) e!134608)))

(declare-fun b!195784 () Bool)

(declare-fun res!163796 () Bool)

(assert (=> b!195784 (=> (not res!163796) (not e!134608))))

(assert (=> b!195784 (= res!163796 (bvsle (bitIndex!0 (size!4437 (buf!4923 thiss!1204)) (currentByte!9225 thiss!1204) (currentBit!9220 thiss!1204)) (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304069))) (currentByte!9225 (_2!9113 lt!304069)) (currentBit!9220 (_2!9113 lt!304069)))))))

(declare-fun b!195785 () Bool)

(declare-fun e!134609 () Bool)

(assert (=> b!195785 (= e!134608 e!134609)))

(declare-fun res!163795 () Bool)

(assert (=> b!195785 (=> res!163795 e!134609)))

(assert (=> b!195785 (= res!163795 (= (size!4437 (buf!4923 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!195786 () Bool)

(assert (=> b!195786 (= e!134609 (arrayBitRangesEq!0 (buf!4923 thiss!1204) (buf!4923 (_2!9113 lt!304069)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4437 (buf!4923 thiss!1204)) (currentByte!9225 thiss!1204) (currentBit!9220 thiss!1204))))))

(assert (= (and d!66305 res!163797) b!195784))

(assert (= (and b!195784 res!163796) b!195785))

(assert (= (and b!195785 (not res!163795)) b!195786))

(assert (=> b!195784 m!302899))

(assert (=> b!195784 m!302885))

(assert (=> b!195786 m!302899))

(assert (=> b!195786 m!302899))

(declare-fun m!302957 () Bool)

(assert (=> b!195786 m!302957))

(assert (=> b!195725 d!66305))

(declare-fun d!66307 () Bool)

(assert (=> d!66307 (isPrefixOf!0 thiss!1204 (_2!9113 lt!304069))))

(declare-fun lt!304147 () Unit!13817)

(declare-fun choose!30 (BitStream!7982 BitStream!7982 BitStream!7982) Unit!13817)

(assert (=> d!66307 (= lt!304147 (choose!30 thiss!1204 (_2!9113 lt!304065) (_2!9113 lt!304069)))))

(assert (=> d!66307 (isPrefixOf!0 thiss!1204 (_2!9113 lt!304065))))

(assert (=> d!66307 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9113 lt!304065) (_2!9113 lt!304069)) lt!304147)))

(declare-fun bs!16490 () Bool)

(assert (= bs!16490 d!66307))

(assert (=> bs!16490 m!302887))

(declare-fun m!302959 () Bool)

(assert (=> bs!16490 m!302959))

(assert (=> bs!16490 m!302909))

(assert (=> b!195725 d!66307))

(declare-fun b!195916 () Bool)

(declare-fun e!134689 () Bool)

(declare-fun lt!304533 () (_ BitVec 64))

(assert (=> b!195916 (= e!134689 (validate_offset_bits!1 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304065)))) ((_ sign_extend 32) (currentByte!9225 (_2!9113 lt!304065))) ((_ sign_extend 32) (currentBit!9220 (_2!9113 lt!304065))) lt!304533))))

(declare-fun b!195917 () Bool)

(declare-fun e!134686 () Bool)

(declare-fun lt!304537 () tuple2!16938)

(declare-fun lt!304502 () tuple2!16938)

(assert (=> b!195917 (= e!134686 (= (_2!9114 lt!304537) (_2!9114 lt!304502)))))

(declare-fun b!195919 () Bool)

(declare-fun res!163911 () Bool)

(declare-fun call!3071 () Bool)

(assert (=> b!195919 (= res!163911 call!3071)))

(declare-fun e!134690 () Bool)

(assert (=> b!195919 (=> (not res!163911) (not e!134690))))

(declare-fun b!195920 () Bool)

(declare-fun lt!304488 () tuple2!16938)

(declare-fun lt!304486 () tuple2!16936)

(assert (=> b!195920 (= lt!304488 (readBitPure!0 (readerFrom!0 (_2!9113 lt!304486) (currentBit!9220 (_2!9113 lt!304065)) (currentByte!9225 (_2!9113 lt!304065)))))))

(declare-fun lt!304506 () Bool)

(declare-fun res!163913 () Bool)

(assert (=> b!195920 (= res!163913 (and (= (_2!9114 lt!304488) lt!304506) (= (_1!9114 lt!304488) (_2!9113 lt!304486))))))

(declare-fun e!134683 () Bool)

(assert (=> b!195920 (=> (not res!163913) (not e!134683))))

(assert (=> b!195920 (= e!134690 e!134683)))

(declare-fun b!195921 () Bool)

(assert (=> b!195921 (= e!134683 (= (bitIndex!0 (size!4437 (buf!4923 (_1!9114 lt!304488))) (currentByte!9225 (_1!9114 lt!304488)) (currentBit!9220 (_1!9114 lt!304488))) (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304486))) (currentByte!9225 (_2!9113 lt!304486)) (currentBit!9220 (_2!9113 lt!304486)))))))

(declare-fun b!195922 () Bool)

(declare-fun e!134688 () tuple2!16936)

(declare-fun Unit!13830 () Unit!13817)

(assert (=> b!195922 (= e!134688 (tuple2!16937 Unit!13830 (_2!9113 lt!304065)))))

(declare-fun lt!304500 () Unit!13817)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7982) Unit!13817)

(assert (=> b!195922 (= lt!304500 (lemmaIsPrefixRefl!0 (_2!9113 lt!304065)))))

(assert (=> b!195922 call!3071))

(declare-fun lt!304496 () Unit!13817)

(assert (=> b!195922 (= lt!304496 lt!304500)))

(declare-fun b!195923 () Bool)

(declare-fun e!134682 () (_ BitVec 64))

(assert (=> b!195923 (= e!134682 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!195924 () Bool)

(declare-fun lt!304532 () tuple2!16936)

(assert (=> b!195924 (= e!134688 (tuple2!16937 (_1!9113 lt!304532) (_2!9113 lt!304532)))))

(assert (=> b!195924 (= lt!304506 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195924 (= lt!304486 (appendBit!0 (_2!9113 lt!304065) lt!304506))))

(declare-fun res!163916 () Bool)

(assert (=> b!195924 (= res!163916 (= (size!4437 (buf!4923 (_2!9113 lt!304065))) (size!4437 (buf!4923 (_2!9113 lt!304486)))))))

(assert (=> b!195924 (=> (not res!163916) (not e!134690))))

(assert (=> b!195924 e!134690))

(declare-fun lt!304520 () tuple2!16936)

(assert (=> b!195924 (= lt!304520 lt!304486)))

(assert (=> b!195924 (= lt!304532 (appendBitsLSBFirstLoopTR!0 (_2!9113 lt!304520) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!304531 () Unit!13817)

(assert (=> b!195924 (= lt!304531 (lemmaIsPrefixTransitive!0 (_2!9113 lt!304065) (_2!9113 lt!304520) (_2!9113 lt!304532)))))

(assert (=> b!195924 (isPrefixOf!0 (_2!9113 lt!304065) (_2!9113 lt!304532))))

(declare-fun lt!304508 () Unit!13817)

(assert (=> b!195924 (= lt!304508 lt!304531)))

(assert (=> b!195924 (invariant!0 (currentBit!9220 (_2!9113 lt!304065)) (currentByte!9225 (_2!9113 lt!304065)) (size!4437 (buf!4923 (_2!9113 lt!304520))))))

(declare-fun lt!304514 () BitStream!7982)

(assert (=> b!195924 (= lt!304514 (BitStream!7983 (buf!4923 (_2!9113 lt!304520)) (currentByte!9225 (_2!9113 lt!304065)) (currentBit!9220 (_2!9113 lt!304065))))))

(assert (=> b!195924 (invariant!0 (currentBit!9220 lt!304514) (currentByte!9225 lt!304514) (size!4437 (buf!4923 (_2!9113 lt!304532))))))

(declare-fun lt!304510 () BitStream!7982)

(assert (=> b!195924 (= lt!304510 (BitStream!7983 (buf!4923 (_2!9113 lt!304532)) (currentByte!9225 lt!304514) (currentBit!9220 lt!304514)))))

(assert (=> b!195924 (= lt!304537 (readBitPure!0 lt!304514))))

(assert (=> b!195924 (= lt!304502 (readBitPure!0 lt!304510))))

(declare-fun lt!304498 () Unit!13817)

(declare-fun readBitPrefixLemma!0 (BitStream!7982 BitStream!7982) Unit!13817)

(assert (=> b!195924 (= lt!304498 (readBitPrefixLemma!0 lt!304514 (_2!9113 lt!304532)))))

(declare-fun res!163907 () Bool)

(assert (=> b!195924 (= res!163907 (= (bitIndex!0 (size!4437 (buf!4923 (_1!9114 lt!304537))) (currentByte!9225 (_1!9114 lt!304537)) (currentBit!9220 (_1!9114 lt!304537))) (bitIndex!0 (size!4437 (buf!4923 (_1!9114 lt!304502))) (currentByte!9225 (_1!9114 lt!304502)) (currentBit!9220 (_1!9114 lt!304502)))))))

(assert (=> b!195924 (=> (not res!163907) (not e!134686))))

(assert (=> b!195924 e!134686))

(declare-fun lt!304499 () Unit!13817)

(assert (=> b!195924 (= lt!304499 lt!304498)))

(declare-datatypes ((tuple2!16948 0))(
  ( (tuple2!16949 (_1!9119 BitStream!7982) (_2!9119 BitStream!7982)) )
))
(declare-fun lt!304507 () tuple2!16948)

(declare-fun reader!0 (BitStream!7982 BitStream!7982) tuple2!16948)

(assert (=> b!195924 (= lt!304507 (reader!0 (_2!9113 lt!304065) (_2!9113 lt!304532)))))

(declare-fun lt!304516 () tuple2!16948)

(assert (=> b!195924 (= lt!304516 (reader!0 (_2!9113 lt!304520) (_2!9113 lt!304532)))))

(declare-fun lt!304490 () tuple2!16938)

(assert (=> b!195924 (= lt!304490 (readBitPure!0 (_1!9119 lt!304507)))))

(assert (=> b!195924 (= (_2!9114 lt!304490) lt!304506)))

(declare-fun lt!304517 () Unit!13817)

(declare-fun Unit!13831 () Unit!13817)

(assert (=> b!195924 (= lt!304517 Unit!13831)))

(declare-fun lt!304484 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195924 (= lt!304484 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304511 () (_ BitVec 64))

(assert (=> b!195924 (= lt!304511 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304495 () Unit!13817)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7982 array!10059 (_ BitVec 64)) Unit!13817)

(assert (=> b!195924 (= lt!304495 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9113 lt!304065) (buf!4923 (_2!9113 lt!304532)) lt!304511))))

(assert (=> b!195924 (validate_offset_bits!1 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304532)))) ((_ sign_extend 32) (currentByte!9225 (_2!9113 lt!304065))) ((_ sign_extend 32) (currentBit!9220 (_2!9113 lt!304065))) lt!304511)))

(declare-fun lt!304503 () Unit!13817)

(assert (=> b!195924 (= lt!304503 lt!304495)))

(declare-datatypes ((tuple2!16950 0))(
  ( (tuple2!16951 (_1!9120 BitStream!7982) (_2!9120 (_ BitVec 64))) )
))
(declare-fun lt!304535 () tuple2!16950)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16950)

(assert (=> b!195924 (= lt!304535 (readNBitsLSBFirstsLoopPure!0 (_1!9119 lt!304507) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!304484))))

(declare-fun lt!304482 () (_ BitVec 64))

(assert (=> b!195924 (= lt!304482 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!304529 () Unit!13817)

(assert (=> b!195924 (= lt!304529 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9113 lt!304520) (buf!4923 (_2!9113 lt!304532)) lt!304482))))

(assert (=> b!195924 (validate_offset_bits!1 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304532)))) ((_ sign_extend 32) (currentByte!9225 (_2!9113 lt!304520))) ((_ sign_extend 32) (currentBit!9220 (_2!9113 lt!304520))) lt!304482)))

(declare-fun lt!304493 () Unit!13817)

(assert (=> b!195924 (= lt!304493 lt!304529)))

(declare-fun lt!304515 () tuple2!16950)

(assert (=> b!195924 (= lt!304515 (readNBitsLSBFirstsLoopPure!0 (_1!9119 lt!304516) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!304484 (ite (_2!9114 lt!304490) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!304519 () tuple2!16950)

(assert (=> b!195924 (= lt!304519 (readNBitsLSBFirstsLoopPure!0 (_1!9119 lt!304507) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!304484))))

(declare-fun c!9751 () Bool)

(assert (=> b!195924 (= c!9751 (_2!9114 (readBitPure!0 (_1!9119 lt!304507))))))

(declare-fun lt!304509 () tuple2!16950)

(declare-fun withMovedBitIndex!0 (BitStream!7982 (_ BitVec 64)) BitStream!7982)

(assert (=> b!195924 (= lt!304509 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9119 lt!304507) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!304484 e!134682)))))

(declare-fun lt!304518 () Unit!13817)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13817)

(assert (=> b!195924 (= lt!304518 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9119 lt!304507) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!304484))))

(assert (=> b!195924 (and (= (_2!9120 lt!304519) (_2!9120 lt!304509)) (= (_1!9120 lt!304519) (_1!9120 lt!304509)))))

(declare-fun lt!304487 () Unit!13817)

(assert (=> b!195924 (= lt!304487 lt!304518)))

(assert (=> b!195924 (= (_1!9119 lt!304507) (withMovedBitIndex!0 (_2!9119 lt!304507) (bvsub (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304065))) (currentByte!9225 (_2!9113 lt!304065)) (currentBit!9220 (_2!9113 lt!304065))) (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304532))) (currentByte!9225 (_2!9113 lt!304532)) (currentBit!9220 (_2!9113 lt!304532))))))))

(declare-fun lt!304483 () Unit!13817)

(declare-fun Unit!13832 () Unit!13817)

(assert (=> b!195924 (= lt!304483 Unit!13832)))

(assert (=> b!195924 (= (_1!9119 lt!304516) (withMovedBitIndex!0 (_2!9119 lt!304516) (bvsub (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304520))) (currentByte!9225 (_2!9113 lt!304520)) (currentBit!9220 (_2!9113 lt!304520))) (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304532))) (currentByte!9225 (_2!9113 lt!304532)) (currentBit!9220 (_2!9113 lt!304532))))))))

(declare-fun lt!304489 () Unit!13817)

(declare-fun Unit!13833 () Unit!13817)

(assert (=> b!195924 (= lt!304489 Unit!13833)))

(assert (=> b!195924 (= (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304065))) (currentByte!9225 (_2!9113 lt!304065)) (currentBit!9220 (_2!9113 lt!304065))) (bvsub (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304520))) (currentByte!9225 (_2!9113 lt!304520)) (currentBit!9220 (_2!9113 lt!304520))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!304534 () Unit!13817)

(declare-fun Unit!13834 () Unit!13817)

(assert (=> b!195924 (= lt!304534 Unit!13834)))

(assert (=> b!195924 (= (_2!9120 lt!304535) (_2!9120 lt!304515))))

(declare-fun lt!304501 () Unit!13817)

(declare-fun Unit!13835 () Unit!13817)

(assert (=> b!195924 (= lt!304501 Unit!13835)))

(assert (=> b!195924 (invariant!0 (currentBit!9220 (_2!9113 lt!304532)) (currentByte!9225 (_2!9113 lt!304532)) (size!4437 (buf!4923 (_2!9113 lt!304532))))))

(declare-fun lt!304521 () Unit!13817)

(declare-fun Unit!13836 () Unit!13817)

(assert (=> b!195924 (= lt!304521 Unit!13836)))

(assert (=> b!195924 (= (size!4437 (buf!4923 (_2!9113 lt!304065))) (size!4437 (buf!4923 (_2!9113 lt!304532))))))

(declare-fun lt!304512 () Unit!13817)

(declare-fun Unit!13837 () Unit!13817)

(assert (=> b!195924 (= lt!304512 Unit!13837)))

(assert (=> b!195924 (= (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304532))) (currentByte!9225 (_2!9113 lt!304532)) (currentBit!9220 (_2!9113 lt!304532))) (bvsub (bvadd (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304065))) (currentByte!9225 (_2!9113 lt!304065)) (currentBit!9220 (_2!9113 lt!304065))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304525 () Unit!13817)

(declare-fun Unit!13838 () Unit!13817)

(assert (=> b!195924 (= lt!304525 Unit!13838)))

(declare-fun lt!304530 () Unit!13817)

(declare-fun Unit!13839 () Unit!13817)

(assert (=> b!195924 (= lt!304530 Unit!13839)))

(declare-fun lt!304513 () tuple2!16948)

(assert (=> b!195924 (= lt!304513 (reader!0 (_2!9113 lt!304065) (_2!9113 lt!304532)))))

(declare-fun lt!304497 () (_ BitVec 64))

(assert (=> b!195924 (= lt!304497 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304485 () Unit!13817)

(assert (=> b!195924 (= lt!304485 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9113 lt!304065) (buf!4923 (_2!9113 lt!304532)) lt!304497))))

(assert (=> b!195924 (validate_offset_bits!1 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304532)))) ((_ sign_extend 32) (currentByte!9225 (_2!9113 lt!304065))) ((_ sign_extend 32) (currentBit!9220 (_2!9113 lt!304065))) lt!304497)))

(declare-fun lt!304536 () Unit!13817)

(assert (=> b!195924 (= lt!304536 lt!304485)))

(declare-fun lt!304492 () tuple2!16950)

(assert (=> b!195924 (= lt!304492 (readNBitsLSBFirstsLoopPure!0 (_1!9119 lt!304513) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!163908 () Bool)

(assert (=> b!195924 (= res!163908 (= (_2!9120 lt!304492) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!134687 () Bool)

(assert (=> b!195924 (=> (not res!163908) (not e!134687))))

(assert (=> b!195924 e!134687))

(declare-fun lt!304491 () Unit!13817)

(declare-fun Unit!13840 () Unit!13817)

(assert (=> b!195924 (= lt!304491 Unit!13840)))

(declare-fun c!9750 () Bool)

(declare-fun bm!3068 () Bool)

(assert (=> bm!3068 (= call!3071 (isPrefixOf!0 (_2!9113 lt!304065) (ite c!9750 (_2!9113 lt!304065) (_2!9113 lt!304486))))))

(declare-fun b!195925 () Bool)

(assert (=> b!195925 (= e!134687 (= (_1!9120 lt!304492) (_2!9119 lt!304513)))))

(declare-fun b!195926 () Bool)

(declare-fun res!163906 () Bool)

(declare-fun e!134684 () Bool)

(assert (=> b!195926 (=> (not res!163906) (not e!134684))))

(declare-fun lt!304523 () tuple2!16936)

(assert (=> b!195926 (= res!163906 (= (size!4437 (buf!4923 (_2!9113 lt!304065))) (size!4437 (buf!4923 (_2!9113 lt!304523)))))))

(declare-fun b!195927 () Bool)

(declare-fun res!163910 () Bool)

(assert (=> b!195927 (= res!163910 (= (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304486))) (currentByte!9225 (_2!9113 lt!304486)) (currentBit!9220 (_2!9113 lt!304486))) (bvadd (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304065))) (currentByte!9225 (_2!9113 lt!304065)) (currentBit!9220 (_2!9113 lt!304065))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!195927 (=> (not res!163910) (not e!134690))))

(declare-fun b!195928 () Bool)

(declare-fun e!134685 () Bool)

(declare-fun lt!304527 () tuple2!16950)

(declare-fun lt!304528 () tuple2!16948)

(assert (=> b!195928 (= e!134685 (= (_1!9120 lt!304527) (_2!9119 lt!304528)))))

(declare-fun b!195929 () Bool)

(declare-fun res!163912 () Bool)

(assert (=> b!195929 (=> (not res!163912) (not e!134684))))

(assert (=> b!195929 (= res!163912 (isPrefixOf!0 (_2!9113 lt!304065) (_2!9113 lt!304523)))))

(declare-fun b!195918 () Bool)

(declare-fun res!163914 () Bool)

(assert (=> b!195918 (=> (not res!163914) (not e!134684))))

(declare-fun lt!304526 () (_ BitVec 64))

(declare-fun lt!304504 () (_ BitVec 64))

(assert (=> b!195918 (= res!163914 (= (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304523))) (currentByte!9225 (_2!9113 lt!304523)) (currentBit!9220 (_2!9113 lt!304523))) (bvsub lt!304526 lt!304504)))))

(assert (=> b!195918 (or (= (bvand lt!304526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304526 lt!304504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195918 (= lt!304504 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!304524 () (_ BitVec 64))

(declare-fun lt!304505 () (_ BitVec 64))

(assert (=> b!195918 (= lt!304526 (bvadd lt!304524 lt!304505))))

(assert (=> b!195918 (or (not (= (bvand lt!304524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304505 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!304524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!304524 lt!304505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195918 (= lt!304505 ((_ sign_extend 32) nBits!348))))

(assert (=> b!195918 (= lt!304524 (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304065))) (currentByte!9225 (_2!9113 lt!304065)) (currentBit!9220 (_2!9113 lt!304065))))))

(declare-fun d!66309 () Bool)

(assert (=> d!66309 e!134684))

(declare-fun res!163917 () Bool)

(assert (=> d!66309 (=> (not res!163917) (not e!134684))))

(assert (=> d!66309 (= res!163917 (invariant!0 (currentBit!9220 (_2!9113 lt!304523)) (currentByte!9225 (_2!9113 lt!304523)) (size!4437 (buf!4923 (_2!9113 lt!304523)))))))

(assert (=> d!66309 (= lt!304523 e!134688)))

(assert (=> d!66309 (= c!9750 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66309 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66309 (= (appendBitsLSBFirstLoopTR!0 (_2!9113 lt!304065) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!304523)))

(declare-fun b!195930 () Bool)

(assert (=> b!195930 (= e!134682 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!195931 () Bool)

(assert (=> b!195931 (= e!134684 e!134685)))

(declare-fun res!163915 () Bool)

(assert (=> b!195931 (=> (not res!163915) (not e!134685))))

(assert (=> b!195931 (= res!163915 (= (_2!9120 lt!304527) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!195931 (= lt!304527 (readNBitsLSBFirstsLoopPure!0 (_1!9119 lt!304528) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!304522 () Unit!13817)

(declare-fun lt!304494 () Unit!13817)

(assert (=> b!195931 (= lt!304522 lt!304494)))

(assert (=> b!195931 (validate_offset_bits!1 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304523)))) ((_ sign_extend 32) (currentByte!9225 (_2!9113 lt!304065))) ((_ sign_extend 32) (currentBit!9220 (_2!9113 lt!304065))) lt!304533)))

(assert (=> b!195931 (= lt!304494 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9113 lt!304065) (buf!4923 (_2!9113 lt!304523)) lt!304533))))

(assert (=> b!195931 e!134689))

(declare-fun res!163909 () Bool)

(assert (=> b!195931 (=> (not res!163909) (not e!134689))))

(assert (=> b!195931 (= res!163909 (and (= (size!4437 (buf!4923 (_2!9113 lt!304065))) (size!4437 (buf!4923 (_2!9113 lt!304523)))) (bvsge lt!304533 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195931 (= lt!304533 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!195931 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!195931 (= lt!304528 (reader!0 (_2!9113 lt!304065) (_2!9113 lt!304523)))))

(assert (= (and d!66309 c!9750) b!195922))

(assert (= (and d!66309 (not c!9750)) b!195924))

(assert (= (and b!195924 res!163916) b!195927))

(assert (= (and b!195927 res!163910) b!195919))

(assert (= (and b!195919 res!163911) b!195920))

(assert (= (and b!195920 res!163913) b!195921))

(assert (= (and b!195924 res!163907) b!195917))

(assert (= (and b!195924 c!9751) b!195930))

(assert (= (and b!195924 (not c!9751)) b!195923))

(assert (= (and b!195924 res!163908) b!195925))

(assert (= (or b!195922 b!195919) bm!3068))

(assert (= (and d!66309 res!163917) b!195926))

(assert (= (and b!195926 res!163906) b!195918))

(assert (= (and b!195918 res!163914) b!195929))

(assert (= (and b!195929 res!163912) b!195931))

(assert (= (and b!195931 res!163909) b!195916))

(assert (= (and b!195931 res!163915) b!195928))

(declare-fun m!303103 () Bool)

(assert (=> b!195922 m!303103))

(declare-fun m!303105 () Bool)

(assert (=> b!195931 m!303105))

(declare-fun m!303107 () Bool)

(assert (=> b!195931 m!303107))

(declare-fun m!303109 () Bool)

(assert (=> b!195931 m!303109))

(declare-fun m!303111 () Bool)

(assert (=> b!195931 m!303111))

(declare-fun m!303113 () Bool)

(assert (=> b!195931 m!303113))

(declare-fun m!303115 () Bool)

(assert (=> b!195931 m!303115))

(declare-fun m!303117 () Bool)

(assert (=> b!195929 m!303117))

(declare-fun m!303119 () Bool)

(assert (=> b!195918 m!303119))

(assert (=> b!195918 m!302897))

(declare-fun m!303121 () Bool)

(assert (=> d!66309 m!303121))

(declare-fun m!303123 () Bool)

(assert (=> b!195916 m!303123))

(declare-fun m!303125 () Bool)

(assert (=> b!195920 m!303125))

(assert (=> b!195920 m!303125))

(declare-fun m!303127 () Bool)

(assert (=> b!195920 m!303127))

(declare-fun m!303129 () Bool)

(assert (=> b!195921 m!303129))

(declare-fun m!303131 () Bool)

(assert (=> b!195921 m!303131))

(declare-fun m!303133 () Bool)

(assert (=> bm!3068 m!303133))

(declare-fun m!303135 () Bool)

(assert (=> b!195924 m!303135))

(declare-fun m!303137 () Bool)

(assert (=> b!195924 m!303137))

(declare-fun m!303139 () Bool)

(assert (=> b!195924 m!303139))

(declare-fun m!303141 () Bool)

(assert (=> b!195924 m!303141))

(declare-fun m!303143 () Bool)

(assert (=> b!195924 m!303143))

(declare-fun m!303145 () Bool)

(assert (=> b!195924 m!303145))

(declare-fun m!303147 () Bool)

(assert (=> b!195924 m!303147))

(declare-fun m!303149 () Bool)

(assert (=> b!195924 m!303149))

(declare-fun m!303151 () Bool)

(assert (=> b!195924 m!303151))

(declare-fun m!303153 () Bool)

(assert (=> b!195924 m!303153))

(declare-fun m!303155 () Bool)

(assert (=> b!195924 m!303155))

(assert (=> b!195924 m!303105))

(declare-fun m!303157 () Bool)

(assert (=> b!195924 m!303157))

(declare-fun m!303159 () Bool)

(assert (=> b!195924 m!303159))

(declare-fun m!303161 () Bool)

(assert (=> b!195924 m!303161))

(declare-fun m!303163 () Bool)

(assert (=> b!195924 m!303163))

(declare-fun m!303165 () Bool)

(assert (=> b!195924 m!303165))

(declare-fun m!303167 () Bool)

(assert (=> b!195924 m!303167))

(declare-fun m!303169 () Bool)

(assert (=> b!195924 m!303169))

(declare-fun m!303171 () Bool)

(assert (=> b!195924 m!303171))

(declare-fun m!303173 () Bool)

(assert (=> b!195924 m!303173))

(declare-fun m!303175 () Bool)

(assert (=> b!195924 m!303175))

(declare-fun m!303177 () Bool)

(assert (=> b!195924 m!303177))

(declare-fun m!303179 () Bool)

(assert (=> b!195924 m!303179))

(assert (=> b!195924 m!303159))

(assert (=> b!195924 m!302897))

(declare-fun m!303181 () Bool)

(assert (=> b!195924 m!303181))

(declare-fun m!303183 () Bool)

(assert (=> b!195924 m!303183))

(declare-fun m!303185 () Bool)

(assert (=> b!195924 m!303185))

(declare-fun m!303187 () Bool)

(assert (=> b!195924 m!303187))

(declare-fun m!303189 () Bool)

(assert (=> b!195924 m!303189))

(declare-fun m!303191 () Bool)

(assert (=> b!195924 m!303191))

(declare-fun m!303193 () Bool)

(assert (=> b!195924 m!303193))

(assert (=> b!195924 m!303115))

(declare-fun m!303195 () Bool)

(assert (=> b!195924 m!303195))

(assert (=> b!195927 m!303131))

(assert (=> b!195927 m!302897))

(assert (=> b!195725 d!66309))

(declare-fun d!66335 () Bool)

(declare-fun e!134691 () Bool)

(assert (=> d!66335 e!134691))

(declare-fun res!163918 () Bool)

(assert (=> d!66335 (=> (not res!163918) (not e!134691))))

(declare-fun lt!304542 () (_ BitVec 64))

(declare-fun lt!304538 () (_ BitVec 64))

(declare-fun lt!304543 () (_ BitVec 64))

(assert (=> d!66335 (= res!163918 (= lt!304543 (bvsub lt!304538 lt!304542)))))

(assert (=> d!66335 (or (= (bvand lt!304538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304542 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304538 lt!304542) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66335 (= lt!304542 (remainingBits!0 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304065)))) ((_ sign_extend 32) (currentByte!9225 (_2!9113 lt!304065))) ((_ sign_extend 32) (currentBit!9220 (_2!9113 lt!304065)))))))

(declare-fun lt!304539 () (_ BitVec 64))

(declare-fun lt!304540 () (_ BitVec 64))

(assert (=> d!66335 (= lt!304538 (bvmul lt!304539 lt!304540))))

(assert (=> d!66335 (or (= lt!304539 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304540 (bvsdiv (bvmul lt!304539 lt!304540) lt!304539)))))

(assert (=> d!66335 (= lt!304540 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66335 (= lt!304539 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304065)))))))

(assert (=> d!66335 (= lt!304543 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9225 (_2!9113 lt!304065))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9220 (_2!9113 lt!304065)))))))

(assert (=> d!66335 (invariant!0 (currentBit!9220 (_2!9113 lt!304065)) (currentByte!9225 (_2!9113 lt!304065)) (size!4437 (buf!4923 (_2!9113 lt!304065))))))

(assert (=> d!66335 (= (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304065))) (currentByte!9225 (_2!9113 lt!304065)) (currentBit!9220 (_2!9113 lt!304065))) lt!304543)))

(declare-fun b!195932 () Bool)

(declare-fun res!163919 () Bool)

(assert (=> b!195932 (=> (not res!163919) (not e!134691))))

(assert (=> b!195932 (= res!163919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304543))))

(declare-fun b!195933 () Bool)

(declare-fun lt!304541 () (_ BitVec 64))

(assert (=> b!195933 (= e!134691 (bvsle lt!304543 (bvmul lt!304541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195933 (or (= lt!304541 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304541 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304541)))))

(assert (=> b!195933 (= lt!304541 ((_ sign_extend 32) (size!4437 (buf!4923 (_2!9113 lt!304065)))))))

(assert (= (and d!66335 res!163918) b!195932))

(assert (= (and b!195932 res!163919) b!195933))

(declare-fun m!303197 () Bool)

(assert (=> d!66335 m!303197))

(assert (=> d!66335 m!302949))

(assert (=> b!195726 d!66335))

(declare-fun d!66337 () Bool)

(declare-fun e!134692 () Bool)

(assert (=> d!66337 e!134692))

(declare-fun res!163920 () Bool)

(assert (=> d!66337 (=> (not res!163920) (not e!134692))))

(declare-fun lt!304544 () (_ BitVec 64))

(declare-fun lt!304548 () (_ BitVec 64))

(declare-fun lt!304549 () (_ BitVec 64))

(assert (=> d!66337 (= res!163920 (= lt!304549 (bvsub lt!304544 lt!304548)))))

(assert (=> d!66337 (or (= (bvand lt!304544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304548 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304544 lt!304548) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66337 (= lt!304548 (remainingBits!0 ((_ sign_extend 32) (size!4437 (buf!4923 thiss!1204))) ((_ sign_extend 32) (currentByte!9225 thiss!1204)) ((_ sign_extend 32) (currentBit!9220 thiss!1204))))))

(declare-fun lt!304545 () (_ BitVec 64))

(declare-fun lt!304546 () (_ BitVec 64))

(assert (=> d!66337 (= lt!304544 (bvmul lt!304545 lt!304546))))

(assert (=> d!66337 (or (= lt!304545 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304546 (bvsdiv (bvmul lt!304545 lt!304546) lt!304545)))))

(assert (=> d!66337 (= lt!304546 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66337 (= lt!304545 ((_ sign_extend 32) (size!4437 (buf!4923 thiss!1204))))))

(assert (=> d!66337 (= lt!304549 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9225 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9220 thiss!1204))))))

(assert (=> d!66337 (invariant!0 (currentBit!9220 thiss!1204) (currentByte!9225 thiss!1204) (size!4437 (buf!4923 thiss!1204)))))

(assert (=> d!66337 (= (bitIndex!0 (size!4437 (buf!4923 thiss!1204)) (currentByte!9225 thiss!1204) (currentBit!9220 thiss!1204)) lt!304549)))

(declare-fun b!195934 () Bool)

(declare-fun res!163921 () Bool)

(assert (=> b!195934 (=> (not res!163921) (not e!134692))))

(assert (=> b!195934 (= res!163921 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304549))))

(declare-fun b!195935 () Bool)

(declare-fun lt!304547 () (_ BitVec 64))

(assert (=> b!195935 (= e!134692 (bvsle lt!304549 (bvmul lt!304547 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195935 (or (= lt!304547 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304547 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304547)))))

(assert (=> b!195935 (= lt!304547 ((_ sign_extend 32) (size!4437 (buf!4923 thiss!1204))))))

(assert (= (and d!66337 res!163920) b!195934))

(assert (= (and b!195934 res!163921) b!195935))

(assert (=> d!66337 m!302939))

(assert (=> d!66337 m!302893))

(assert (=> b!195726 d!66337))

(declare-fun b!195948 () Bool)

(declare-fun e!134698 () Bool)

(declare-fun lt!304558 () tuple2!16938)

(declare-fun lt!304560 () tuple2!16936)

(assert (=> b!195948 (= e!134698 (= (bitIndex!0 (size!4437 (buf!4923 (_1!9114 lt!304558))) (currentByte!9225 (_1!9114 lt!304558)) (currentBit!9220 (_1!9114 lt!304558))) (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304560))) (currentByte!9225 (_2!9113 lt!304560)) (currentBit!9220 (_2!9113 lt!304560)))))))

(declare-fun d!66339 () Bool)

(declare-fun e!134697 () Bool)

(assert (=> d!66339 e!134697))

(declare-fun res!163933 () Bool)

(assert (=> d!66339 (=> (not res!163933) (not e!134697))))

(assert (=> d!66339 (= res!163933 (= (size!4437 (buf!4923 thiss!1204)) (size!4437 (buf!4923 (_2!9113 lt!304560)))))))

(declare-fun choose!16 (BitStream!7982 Bool) tuple2!16936)

(assert (=> d!66339 (= lt!304560 (choose!16 thiss!1204 lt!304061))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66339 (validate_offset_bit!0 ((_ sign_extend 32) (size!4437 (buf!4923 thiss!1204))) ((_ sign_extend 32) (currentByte!9225 thiss!1204)) ((_ sign_extend 32) (currentBit!9220 thiss!1204)))))

(assert (=> d!66339 (= (appendBit!0 thiss!1204 lt!304061) lt!304560)))

(declare-fun b!195945 () Bool)

(declare-fun res!163932 () Bool)

(assert (=> b!195945 (=> (not res!163932) (not e!134697))))

(declare-fun lt!304561 () (_ BitVec 64))

(declare-fun lt!304559 () (_ BitVec 64))

(assert (=> b!195945 (= res!163932 (= (bitIndex!0 (size!4437 (buf!4923 (_2!9113 lt!304560))) (currentByte!9225 (_2!9113 lt!304560)) (currentBit!9220 (_2!9113 lt!304560))) (bvadd lt!304561 lt!304559)))))

(assert (=> b!195945 (or (not (= (bvand lt!304561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304559 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!304561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!304561 lt!304559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195945 (= lt!304559 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!195945 (= lt!304561 (bitIndex!0 (size!4437 (buf!4923 thiss!1204)) (currentByte!9225 thiss!1204) (currentBit!9220 thiss!1204)))))

(declare-fun b!195946 () Bool)

(declare-fun res!163931 () Bool)

(assert (=> b!195946 (=> (not res!163931) (not e!134697))))

(assert (=> b!195946 (= res!163931 (isPrefixOf!0 thiss!1204 (_2!9113 lt!304560)))))

(declare-fun b!195947 () Bool)

(assert (=> b!195947 (= e!134697 e!134698)))

(declare-fun res!163930 () Bool)

(assert (=> b!195947 (=> (not res!163930) (not e!134698))))

(assert (=> b!195947 (= res!163930 (and (= (_2!9114 lt!304558) lt!304061) (= (_1!9114 lt!304558) (_2!9113 lt!304560))))))

(assert (=> b!195947 (= lt!304558 (readBitPure!0 (readerFrom!0 (_2!9113 lt!304560) (currentBit!9220 thiss!1204) (currentByte!9225 thiss!1204))))))

(assert (= (and d!66339 res!163933) b!195945))

(assert (= (and b!195945 res!163932) b!195946))

(assert (= (and b!195946 res!163931) b!195947))

(assert (= (and b!195947 res!163930) b!195948))

(declare-fun m!303199 () Bool)

(assert (=> b!195948 m!303199))

(declare-fun m!303201 () Bool)

(assert (=> b!195948 m!303201))

(assert (=> b!195945 m!303201))

(assert (=> b!195945 m!302899))

(declare-fun m!303203 () Bool)

(assert (=> d!66339 m!303203))

(declare-fun m!303205 () Bool)

(assert (=> d!66339 m!303205))

(declare-fun m!303207 () Bool)

(assert (=> b!195947 m!303207))

(assert (=> b!195947 m!303207))

(declare-fun m!303209 () Bool)

(assert (=> b!195947 m!303209))

(declare-fun m!303211 () Bool)

(assert (=> b!195946 m!303211))

(assert (=> b!195726 d!66339))

(assert (=> b!195731 d!66335))

(assert (=> b!195731 d!66337))

(push 1)

(assert (not d!66335))

(assert (not b!195918))

(assert (not b!195931))

(assert (not d!66337))

(assert (not b!195920))

(assert (not b!195924))

(assert (not b!195921))

(assert (not d!66285))

(assert (not d!66307))

(assert (not d!66297))

(assert (not b!195916))

(assert (not d!66299))

(assert (not b!195947))

(assert (not b!195927))

(assert (not b!195948))

(assert (not b!195946))

(assert (not b!195945))

(assert (not b!195922))

(assert (not b!195929))

(assert (not b!195784))

(assert (not b!195786))

(assert (not b!195781))

(assert (not b!195776))

(assert (not d!66309))

(assert (not d!66289))

(assert (not d!66339))

(assert (not d!66301))

(assert (not bm!3068))

(assert (not d!66303))

(assert (not b!195778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

