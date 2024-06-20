; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57308 () Bool)

(assert start!57308)

(declare-fun b!262664 () Bool)

(declare-fun e!182922 () Bool)

(declare-fun e!182924 () Bool)

(assert (=> b!262664 (= e!182922 (not e!182924))))

(declare-fun res!219795 () Bool)

(assert (=> b!262664 (=> res!219795 e!182924)))

(declare-datatypes ((array!14650 0))(
  ( (array!14651 (arr!7382 (Array (_ BitVec 32) (_ BitVec 8))) (size!6395 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11604 0))(
  ( (BitStream!11605 (buf!6863 array!14650) (currentByte!12706 (_ BitVec 32)) (currentBit!12701 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11604)

(assert (=> b!262664 (= res!219795 (= (size!6395 (buf!6863 w1!584)) #b00000000000000000000000000000000))))

(declare-fun w2!580 () BitStream!11604)

(declare-fun isPrefixOf!0 (BitStream!11604 BitStream!11604) Bool)

(assert (=> b!262664 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18733 0))(
  ( (Unit!18734) )
))
(declare-fun lt!404278 () Unit!18733)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11604) Unit!18733)

(assert (=> b!262664 (= lt!404278 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404280 () BitStream!11604)

(assert (=> b!262664 (isPrefixOf!0 lt!404280 lt!404280)))

(declare-fun lt!404279 () Unit!18733)

(assert (=> b!262664 (= lt!404279 (lemmaIsPrefixRefl!0 lt!404280))))

(assert (=> b!262664 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404282 () Unit!18733)

(assert (=> b!262664 (= lt!404282 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262664 (= lt!404280 (BitStream!11605 (buf!6863 w2!580) (currentByte!12706 w1!584) (currentBit!12701 w1!584)))))

(declare-fun res!219796 () Bool)

(assert (=> start!57308 (=> (not res!219796) (not e!182922))))

(assert (=> start!57308 (= res!219796 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57308 e!182922))

(declare-fun e!182923 () Bool)

(declare-fun inv!12 (BitStream!11604) Bool)

(assert (=> start!57308 (and (inv!12 w1!584) e!182923)))

(declare-fun e!182921 () Bool)

(assert (=> start!57308 (and (inv!12 w2!580) e!182921)))

(declare-fun b!262667 () Bool)

(declare-fun array_inv!6119 (array!14650) Bool)

(assert (=> b!262667 (= e!182921 (array_inv!6119 (buf!6863 w2!580)))))

(declare-fun b!262665 () Bool)

(declare-fun lt!404281 () (_ BitVec 64))

(assert (=> b!262665 (= e!182924 (or (bvsgt (size!6395 (buf!6863 w1!584)) (size!6395 (buf!6863 w2!580))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404281) (bvsle lt!404281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6395 (buf!6863 w1!584))))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262665 (= lt!404281 (bitIndex!0 (size!6395 (buf!6863 w1!584)) (currentByte!12706 w1!584) (currentBit!12701 w1!584)))))

(declare-fun b!262666 () Bool)

(assert (=> b!262666 (= e!182923 (array_inv!6119 (buf!6863 w1!584)))))

(assert (= (and start!57308 res!219796) b!262664))

(assert (= (and b!262664 (not res!219795)) b!262665))

(assert (= start!57308 b!262666))

(assert (= start!57308 b!262667))

(declare-fun m!392807 () Bool)

(assert (=> start!57308 m!392807))

(declare-fun m!392809 () Bool)

(assert (=> start!57308 m!392809))

(declare-fun m!392811 () Bool)

(assert (=> start!57308 m!392811))

(declare-fun m!392813 () Bool)

(assert (=> b!262667 m!392813))

(declare-fun m!392815 () Bool)

(assert (=> b!262666 m!392815))

(declare-fun m!392817 () Bool)

(assert (=> b!262664 m!392817))

(declare-fun m!392819 () Bool)

(assert (=> b!262664 m!392819))

(declare-fun m!392821 () Bool)

(assert (=> b!262664 m!392821))

(declare-fun m!392823 () Bool)

(assert (=> b!262664 m!392823))

(declare-fun m!392825 () Bool)

(assert (=> b!262664 m!392825))

(declare-fun m!392827 () Bool)

(assert (=> b!262664 m!392827))

(declare-fun m!392829 () Bool)

(assert (=> b!262665 m!392829))

(check-sat (not b!262665) (not start!57308) (not b!262666) (not b!262667) (not b!262664))
(check-sat)
(get-model)

(declare-fun d!88628 () Bool)

(assert (=> d!88628 (= (array_inv!6119 (buf!6863 w1!584)) (bvsge (size!6395 (buf!6863 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262666 d!88628))

(declare-fun d!88630 () Bool)

(assert (=> d!88630 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404300 () Unit!18733)

(declare-fun choose!11 (BitStream!11604) Unit!18733)

(assert (=> d!88630 (= lt!404300 (choose!11 w2!580))))

(assert (=> d!88630 (= (lemmaIsPrefixRefl!0 w2!580) lt!404300)))

(declare-fun bs!22480 () Bool)

(assert (= bs!22480 d!88630))

(assert (=> bs!22480 m!392825))

(declare-fun m!392855 () Bool)

(assert (=> bs!22480 m!392855))

(assert (=> b!262664 d!88630))

(declare-fun d!88632 () Bool)

(assert (=> d!88632 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404301 () Unit!18733)

(assert (=> d!88632 (= lt!404301 (choose!11 w1!584))))

(assert (=> d!88632 (= (lemmaIsPrefixRefl!0 w1!584) lt!404301)))

(declare-fun bs!22481 () Bool)

(assert (= bs!22481 d!88632))

(assert (=> bs!22481 m!392823))

(declare-fun m!392857 () Bool)

(assert (=> bs!22481 m!392857))

(assert (=> b!262664 d!88632))

(declare-fun d!88634 () Bool)

(declare-fun res!219811 () Bool)

(declare-fun e!182948 () Bool)

(assert (=> d!88634 (=> (not res!219811) (not e!182948))))

(assert (=> d!88634 (= res!219811 (= (size!6395 (buf!6863 w1!584)) (size!6395 (buf!6863 w1!584))))))

(assert (=> d!88634 (= (isPrefixOf!0 w1!584 w1!584) e!182948)))

(declare-fun b!262686 () Bool)

(declare-fun res!219809 () Bool)

(assert (=> b!262686 (=> (not res!219809) (not e!182948))))

(assert (=> b!262686 (= res!219809 (bvsle (bitIndex!0 (size!6395 (buf!6863 w1!584)) (currentByte!12706 w1!584) (currentBit!12701 w1!584)) (bitIndex!0 (size!6395 (buf!6863 w1!584)) (currentByte!12706 w1!584) (currentBit!12701 w1!584))))))

(declare-fun b!262687 () Bool)

(declare-fun e!182949 () Bool)

(assert (=> b!262687 (= e!182948 e!182949)))

(declare-fun res!219810 () Bool)

(assert (=> b!262687 (=> res!219810 e!182949)))

(assert (=> b!262687 (= res!219810 (= (size!6395 (buf!6863 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262688 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14650 array!14650 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262688 (= e!182949 (arrayBitRangesEq!0 (buf!6863 w1!584) (buf!6863 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6395 (buf!6863 w1!584)) (currentByte!12706 w1!584) (currentBit!12701 w1!584))))))

(assert (= (and d!88634 res!219811) b!262686))

(assert (= (and b!262686 res!219809) b!262687))

(assert (= (and b!262687 (not res!219810)) b!262688))

(assert (=> b!262686 m!392829))

(assert (=> b!262686 m!392829))

(assert (=> b!262688 m!392829))

(assert (=> b!262688 m!392829))

(declare-fun m!392859 () Bool)

(assert (=> b!262688 m!392859))

(assert (=> b!262664 d!88634))

(declare-fun d!88638 () Bool)

(declare-fun res!219814 () Bool)

(declare-fun e!182950 () Bool)

(assert (=> d!88638 (=> (not res!219814) (not e!182950))))

(assert (=> d!88638 (= res!219814 (= (size!6395 (buf!6863 w2!580)) (size!6395 (buf!6863 w2!580))))))

(assert (=> d!88638 (= (isPrefixOf!0 w2!580 w2!580) e!182950)))

(declare-fun b!262689 () Bool)

(declare-fun res!219812 () Bool)

(assert (=> b!262689 (=> (not res!219812) (not e!182950))))

(assert (=> b!262689 (= res!219812 (bvsle (bitIndex!0 (size!6395 (buf!6863 w2!580)) (currentByte!12706 w2!580) (currentBit!12701 w2!580)) (bitIndex!0 (size!6395 (buf!6863 w2!580)) (currentByte!12706 w2!580) (currentBit!12701 w2!580))))))

(declare-fun b!262690 () Bool)

(declare-fun e!182951 () Bool)

(assert (=> b!262690 (= e!182950 e!182951)))

(declare-fun res!219813 () Bool)

(assert (=> b!262690 (=> res!219813 e!182951)))

(assert (=> b!262690 (= res!219813 (= (size!6395 (buf!6863 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262691 () Bool)

(assert (=> b!262691 (= e!182951 (arrayBitRangesEq!0 (buf!6863 w2!580) (buf!6863 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6395 (buf!6863 w2!580)) (currentByte!12706 w2!580) (currentBit!12701 w2!580))))))

(assert (= (and d!88638 res!219814) b!262689))

(assert (= (and b!262689 res!219812) b!262690))

(assert (= (and b!262690 (not res!219813)) b!262691))

(declare-fun m!392861 () Bool)

(assert (=> b!262689 m!392861))

(assert (=> b!262689 m!392861))

(assert (=> b!262691 m!392861))

(assert (=> b!262691 m!392861))

(declare-fun m!392863 () Bool)

(assert (=> b!262691 m!392863))

(assert (=> b!262664 d!88638))

(declare-fun d!88640 () Bool)

(declare-fun res!219823 () Bool)

(declare-fun e!182956 () Bool)

(assert (=> d!88640 (=> (not res!219823) (not e!182956))))

(assert (=> d!88640 (= res!219823 (= (size!6395 (buf!6863 lt!404280)) (size!6395 (buf!6863 lt!404280))))))

(assert (=> d!88640 (= (isPrefixOf!0 lt!404280 lt!404280) e!182956)))

(declare-fun b!262698 () Bool)

(declare-fun res!219821 () Bool)

(assert (=> b!262698 (=> (not res!219821) (not e!182956))))

(assert (=> b!262698 (= res!219821 (bvsle (bitIndex!0 (size!6395 (buf!6863 lt!404280)) (currentByte!12706 lt!404280) (currentBit!12701 lt!404280)) (bitIndex!0 (size!6395 (buf!6863 lt!404280)) (currentByte!12706 lt!404280) (currentBit!12701 lt!404280))))))

(declare-fun b!262699 () Bool)

(declare-fun e!182957 () Bool)

(assert (=> b!262699 (= e!182956 e!182957)))

(declare-fun res!219822 () Bool)

(assert (=> b!262699 (=> res!219822 e!182957)))

(assert (=> b!262699 (= res!219822 (= (size!6395 (buf!6863 lt!404280)) #b00000000000000000000000000000000))))

(declare-fun b!262700 () Bool)

(assert (=> b!262700 (= e!182957 (arrayBitRangesEq!0 (buf!6863 lt!404280) (buf!6863 lt!404280) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6395 (buf!6863 lt!404280)) (currentByte!12706 lt!404280) (currentBit!12701 lt!404280))))))

(assert (= (and d!88640 res!219823) b!262698))

(assert (= (and b!262698 res!219821) b!262699))

(assert (= (and b!262699 (not res!219822)) b!262700))

(declare-fun m!392865 () Bool)

(assert (=> b!262698 m!392865))

(assert (=> b!262698 m!392865))

(assert (=> b!262700 m!392865))

(assert (=> b!262700 m!392865))

(declare-fun m!392867 () Bool)

(assert (=> b!262700 m!392867))

(assert (=> b!262664 d!88640))

(declare-fun d!88642 () Bool)

(assert (=> d!88642 (isPrefixOf!0 lt!404280 lt!404280)))

(declare-fun lt!404302 () Unit!18733)

(assert (=> d!88642 (= lt!404302 (choose!11 lt!404280))))

(assert (=> d!88642 (= (lemmaIsPrefixRefl!0 lt!404280) lt!404302)))

(declare-fun bs!22482 () Bool)

(assert (= bs!22482 d!88642))

(assert (=> bs!22482 m!392821))

(declare-fun m!392869 () Bool)

(assert (=> bs!22482 m!392869))

(assert (=> b!262664 d!88642))

(declare-fun d!88644 () Bool)

(declare-fun res!219826 () Bool)

(declare-fun e!182958 () Bool)

(assert (=> d!88644 (=> (not res!219826) (not e!182958))))

(assert (=> d!88644 (= res!219826 (= (size!6395 (buf!6863 w1!584)) (size!6395 (buf!6863 w2!580))))))

(assert (=> d!88644 (= (isPrefixOf!0 w1!584 w2!580) e!182958)))

(declare-fun b!262701 () Bool)

(declare-fun res!219824 () Bool)

(assert (=> b!262701 (=> (not res!219824) (not e!182958))))

(assert (=> b!262701 (= res!219824 (bvsle (bitIndex!0 (size!6395 (buf!6863 w1!584)) (currentByte!12706 w1!584) (currentBit!12701 w1!584)) (bitIndex!0 (size!6395 (buf!6863 w2!580)) (currentByte!12706 w2!580) (currentBit!12701 w2!580))))))

(declare-fun b!262702 () Bool)

(declare-fun e!182959 () Bool)

(assert (=> b!262702 (= e!182958 e!182959)))

(declare-fun res!219825 () Bool)

(assert (=> b!262702 (=> res!219825 e!182959)))

(assert (=> b!262702 (= res!219825 (= (size!6395 (buf!6863 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262703 () Bool)

(assert (=> b!262703 (= e!182959 (arrayBitRangesEq!0 (buf!6863 w1!584) (buf!6863 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6395 (buf!6863 w1!584)) (currentByte!12706 w1!584) (currentBit!12701 w1!584))))))

(assert (= (and d!88644 res!219826) b!262701))

(assert (= (and b!262701 res!219824) b!262702))

(assert (= (and b!262702 (not res!219825)) b!262703))

(assert (=> b!262701 m!392829))

(assert (=> b!262701 m!392861))

(assert (=> b!262703 m!392829))

(assert (=> b!262703 m!392829))

(declare-fun m!392871 () Bool)

(assert (=> b!262703 m!392871))

(assert (=> start!57308 d!88644))

(declare-fun d!88648 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88648 (= (inv!12 w1!584) (invariant!0 (currentBit!12701 w1!584) (currentByte!12706 w1!584) (size!6395 (buf!6863 w1!584))))))

(declare-fun bs!22483 () Bool)

(assert (= bs!22483 d!88648))

(declare-fun m!392875 () Bool)

(assert (=> bs!22483 m!392875))

(assert (=> start!57308 d!88648))

(declare-fun d!88654 () Bool)

(assert (=> d!88654 (= (inv!12 w2!580) (invariant!0 (currentBit!12701 w2!580) (currentByte!12706 w2!580) (size!6395 (buf!6863 w2!580))))))

(declare-fun bs!22484 () Bool)

(assert (= bs!22484 d!88654))

(declare-fun m!392879 () Bool)

(assert (=> bs!22484 m!392879))

(assert (=> start!57308 d!88654))

(declare-fun d!88658 () Bool)

(declare-fun e!182973 () Bool)

(assert (=> d!88658 e!182973))

(declare-fun res!219850 () Bool)

(assert (=> d!88658 (=> (not res!219850) (not e!182973))))

(declare-fun lt!404340 () (_ BitVec 64))

(declare-fun lt!404338 () (_ BitVec 64))

(declare-fun lt!404339 () (_ BitVec 64))

(assert (=> d!88658 (= res!219850 (= lt!404338 (bvsub lt!404340 lt!404339)))))

(assert (=> d!88658 (or (= (bvand lt!404340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404339 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404340 lt!404339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88658 (= lt!404339 (remainingBits!0 ((_ sign_extend 32) (size!6395 (buf!6863 w1!584))) ((_ sign_extend 32) (currentByte!12706 w1!584)) ((_ sign_extend 32) (currentBit!12701 w1!584))))))

(declare-fun lt!404343 () (_ BitVec 64))

(declare-fun lt!404342 () (_ BitVec 64))

(assert (=> d!88658 (= lt!404340 (bvmul lt!404343 lt!404342))))

(assert (=> d!88658 (or (= lt!404343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404342 (bvsdiv (bvmul lt!404343 lt!404342) lt!404343)))))

(assert (=> d!88658 (= lt!404342 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88658 (= lt!404343 ((_ sign_extend 32) (size!6395 (buf!6863 w1!584))))))

(assert (=> d!88658 (= lt!404338 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12706 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12701 w1!584))))))

(assert (=> d!88658 (invariant!0 (currentBit!12701 w1!584) (currentByte!12706 w1!584) (size!6395 (buf!6863 w1!584)))))

(assert (=> d!88658 (= (bitIndex!0 (size!6395 (buf!6863 w1!584)) (currentByte!12706 w1!584) (currentBit!12701 w1!584)) lt!404338)))

(declare-fun b!262726 () Bool)

(declare-fun res!219849 () Bool)

(assert (=> b!262726 (=> (not res!219849) (not e!182973))))

(assert (=> b!262726 (= res!219849 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404338))))

(declare-fun b!262727 () Bool)

(declare-fun lt!404341 () (_ BitVec 64))

(assert (=> b!262727 (= e!182973 (bvsle lt!404338 (bvmul lt!404341 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262727 (or (= lt!404341 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404341 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404341)))))

(assert (=> b!262727 (= lt!404341 ((_ sign_extend 32) (size!6395 (buf!6863 w1!584))))))

(assert (= (and d!88658 res!219850) b!262726))

(assert (= (and b!262726 res!219849) b!262727))

(declare-fun m!392903 () Bool)

(assert (=> d!88658 m!392903))

(assert (=> d!88658 m!392875))

(assert (=> b!262665 d!88658))

(declare-fun d!88680 () Bool)

(assert (=> d!88680 (= (array_inv!6119 (buf!6863 w2!580)) (bvsge (size!6395 (buf!6863 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262667 d!88680))

(check-sat (not d!88642) (not b!262688) (not d!88654) (not b!262686) (not d!88630) (not d!88658) (not b!262700) (not b!262698) (not b!262691) (not d!88648) (not d!88632) (not b!262701) (not b!262703) (not b!262689))
(check-sat)
