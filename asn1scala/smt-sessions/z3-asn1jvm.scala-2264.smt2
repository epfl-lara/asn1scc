; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57344 () Bool)

(assert start!57344)

(declare-fun b!262782 () Bool)

(declare-fun e!183027 () Bool)

(declare-datatypes ((array!14659 0))(
  ( (array!14660 (arr!7385 (Array (_ BitVec 32) (_ BitVec 8))) (size!6398 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11610 0))(
  ( (BitStream!11611 (buf!6866 array!14659) (currentByte!12712 (_ BitVec 32)) (currentBit!12707 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11610)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262782 (= e!183027 (invariant!0 (currentBit!12707 w1!584) (currentByte!12712 w1!584) (size!6398 (buf!6866 w1!584))))))

(declare-fun b!262783 () Bool)

(declare-fun e!183024 () Bool)

(declare-fun array_inv!6122 (array!14659) Bool)

(assert (=> b!262783 (= e!183024 (array_inv!6122 (buf!6866 w1!584)))))

(declare-fun b!262784 () Bool)

(declare-fun e!183025 () Bool)

(assert (=> b!262784 (= e!183025 (not e!183027))))

(declare-fun res!219898 () Bool)

(assert (=> b!262784 (=> res!219898 e!183027)))

(declare-fun e!183028 () Bool)

(assert (=> b!262784 (= res!219898 e!183028)))

(declare-fun res!219897 () Bool)

(assert (=> b!262784 (=> (not res!219897) (not e!183028))))

(assert (=> b!262784 (= res!219897 (not (= (size!6398 (buf!6866 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11610)

(declare-fun isPrefixOf!0 (BitStream!11610 BitStream!11610) Bool)

(assert (=> b!262784 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18739 0))(
  ( (Unit!18740) )
))
(declare-fun lt!404390 () Unit!18739)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11610) Unit!18739)

(assert (=> b!262784 (= lt!404390 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404388 () BitStream!11610)

(assert (=> b!262784 (isPrefixOf!0 lt!404388 lt!404388)))

(declare-fun lt!404387 () Unit!18739)

(assert (=> b!262784 (= lt!404387 (lemmaIsPrefixRefl!0 lt!404388))))

(assert (=> b!262784 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404389 () Unit!18739)

(assert (=> b!262784 (= lt!404389 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262784 (= lt!404388 (BitStream!11611 (buf!6866 w2!580) (currentByte!12712 w1!584) (currentBit!12707 w1!584)))))

(declare-fun b!262785 () Bool)

(declare-fun e!183026 () Bool)

(assert (=> b!262785 (= e!183026 (array_inv!6122 (buf!6866 w2!580)))))

(declare-fun b!262786 () Bool)

(declare-fun res!219895 () Bool)

(assert (=> b!262786 (=> res!219895 e!183027)))

(assert (=> b!262786 (= res!219895 (= (size!6398 (buf!6866 w1!584)) #b00000000000000000000000000000000))))

(declare-fun res!219896 () Bool)

(assert (=> start!57344 (=> (not res!219896) (not e!183025))))

(assert (=> start!57344 (= res!219896 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57344 e!183025))

(declare-fun inv!12 (BitStream!11610) Bool)

(assert (=> start!57344 (and (inv!12 w1!584) e!183024)))

(assert (=> start!57344 (and (inv!12 w2!580) e!183026)))

(declare-fun b!262787 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14659 array!14659 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262787 (= e!183028 (not (arrayBitRangesEq!0 (buf!6866 w1!584) (buf!6866 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584)))))))

(assert (= (and start!57344 res!219896) b!262784))

(assert (= (and b!262784 res!219897) b!262787))

(assert (= (and b!262784 (not res!219898)) b!262786))

(assert (= (and b!262786 (not res!219895)) b!262782))

(assert (= start!57344 b!262783))

(assert (= start!57344 b!262785))

(declare-fun m!392955 () Bool)

(assert (=> b!262785 m!392955))

(declare-fun m!392957 () Bool)

(assert (=> b!262783 m!392957))

(declare-fun m!392959 () Bool)

(assert (=> b!262782 m!392959))

(declare-fun m!392961 () Bool)

(assert (=> start!57344 m!392961))

(declare-fun m!392963 () Bool)

(assert (=> start!57344 m!392963))

(declare-fun m!392965 () Bool)

(assert (=> start!57344 m!392965))

(declare-fun m!392967 () Bool)

(assert (=> b!262787 m!392967))

(assert (=> b!262787 m!392967))

(declare-fun m!392969 () Bool)

(assert (=> b!262787 m!392969))

(declare-fun m!392971 () Bool)

(assert (=> b!262784 m!392971))

(declare-fun m!392973 () Bool)

(assert (=> b!262784 m!392973))

(declare-fun m!392975 () Bool)

(assert (=> b!262784 m!392975))

(declare-fun m!392977 () Bool)

(assert (=> b!262784 m!392977))

(declare-fun m!392979 () Bool)

(assert (=> b!262784 m!392979))

(declare-fun m!392981 () Bool)

(assert (=> b!262784 m!392981))

(check-sat (not b!262784) (not b!262782) (not b!262787) (not start!57344) (not b!262785) (not b!262783))
(check-sat)
(get-model)

(declare-fun d!88710 () Bool)

(assert (=> d!88710 (isPrefixOf!0 lt!404388 lt!404388)))

(declare-fun lt!404405 () Unit!18739)

(declare-fun choose!11 (BitStream!11610) Unit!18739)

(assert (=> d!88710 (= lt!404405 (choose!11 lt!404388))))

(assert (=> d!88710 (= (lemmaIsPrefixRefl!0 lt!404388) lt!404405)))

(declare-fun bs!22503 () Bool)

(assert (= bs!22503 d!88710))

(assert (=> bs!22503 m!392981))

(declare-fun m!393015 () Bool)

(assert (=> bs!22503 m!393015))

(assert (=> b!262784 d!88710))

(declare-fun d!88718 () Bool)

(assert (=> d!88718 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404406 () Unit!18739)

(assert (=> d!88718 (= lt!404406 (choose!11 w2!580))))

(assert (=> d!88718 (= (lemmaIsPrefixRefl!0 w2!580) lt!404406)))

(declare-fun bs!22504 () Bool)

(assert (= bs!22504 d!88718))

(assert (=> bs!22504 m!392977))

(declare-fun m!393017 () Bool)

(assert (=> bs!22504 m!393017))

(assert (=> b!262784 d!88718))

(declare-fun d!88720 () Bool)

(assert (=> d!88720 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404409 () Unit!18739)

(assert (=> d!88720 (= lt!404409 (choose!11 w1!584))))

(assert (=> d!88720 (= (lemmaIsPrefixRefl!0 w1!584) lt!404409)))

(declare-fun bs!22505 () Bool)

(assert (= bs!22505 d!88720))

(assert (=> bs!22505 m!392975))

(declare-fun m!393019 () Bool)

(assert (=> bs!22505 m!393019))

(assert (=> b!262784 d!88720))

(declare-fun d!88722 () Bool)

(declare-fun res!219941 () Bool)

(declare-fun e!183080 () Bool)

(assert (=> d!88722 (=> (not res!219941) (not e!183080))))

(assert (=> d!88722 (= res!219941 (= (size!6398 (buf!6866 w1!584)) (size!6398 (buf!6866 w1!584))))))

(assert (=> d!88722 (= (isPrefixOf!0 w1!584 w1!584) e!183080)))

(declare-fun b!262842 () Bool)

(declare-fun res!219942 () Bool)

(assert (=> b!262842 (=> (not res!219942) (not e!183080))))

(assert (=> b!262842 (= res!219942 (bvsle (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584)) (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584))))))

(declare-fun b!262843 () Bool)

(declare-fun e!183081 () Bool)

(assert (=> b!262843 (= e!183080 e!183081)))

(declare-fun res!219943 () Bool)

(assert (=> b!262843 (=> res!219943 e!183081)))

(assert (=> b!262843 (= res!219943 (= (size!6398 (buf!6866 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262844 () Bool)

(assert (=> b!262844 (= e!183081 (arrayBitRangesEq!0 (buf!6866 w1!584) (buf!6866 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584))))))

(assert (= (and d!88722 res!219941) b!262842))

(assert (= (and b!262842 res!219942) b!262843))

(assert (= (and b!262843 (not res!219943)) b!262844))

(assert (=> b!262842 m!392967))

(assert (=> b!262842 m!392967))

(assert (=> b!262844 m!392967))

(assert (=> b!262844 m!392967))

(declare-fun m!393037 () Bool)

(assert (=> b!262844 m!393037))

(assert (=> b!262784 d!88722))

(declare-fun d!88726 () Bool)

(declare-fun res!219944 () Bool)

(declare-fun e!183082 () Bool)

(assert (=> d!88726 (=> (not res!219944) (not e!183082))))

(assert (=> d!88726 (= res!219944 (= (size!6398 (buf!6866 lt!404388)) (size!6398 (buf!6866 lt!404388))))))

(assert (=> d!88726 (= (isPrefixOf!0 lt!404388 lt!404388) e!183082)))

(declare-fun b!262845 () Bool)

(declare-fun res!219945 () Bool)

(assert (=> b!262845 (=> (not res!219945) (not e!183082))))

(assert (=> b!262845 (= res!219945 (bvsle (bitIndex!0 (size!6398 (buf!6866 lt!404388)) (currentByte!12712 lt!404388) (currentBit!12707 lt!404388)) (bitIndex!0 (size!6398 (buf!6866 lt!404388)) (currentByte!12712 lt!404388) (currentBit!12707 lt!404388))))))

(declare-fun b!262846 () Bool)

(declare-fun e!183083 () Bool)

(assert (=> b!262846 (= e!183082 e!183083)))

(declare-fun res!219946 () Bool)

(assert (=> b!262846 (=> res!219946 e!183083)))

(assert (=> b!262846 (= res!219946 (= (size!6398 (buf!6866 lt!404388)) #b00000000000000000000000000000000))))

(declare-fun b!262847 () Bool)

(assert (=> b!262847 (= e!183083 (arrayBitRangesEq!0 (buf!6866 lt!404388) (buf!6866 lt!404388) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6398 (buf!6866 lt!404388)) (currentByte!12712 lt!404388) (currentBit!12707 lt!404388))))))

(assert (= (and d!88726 res!219944) b!262845))

(assert (= (and b!262845 res!219945) b!262846))

(assert (= (and b!262846 (not res!219946)) b!262847))

(declare-fun m!393039 () Bool)

(assert (=> b!262845 m!393039))

(assert (=> b!262845 m!393039))

(assert (=> b!262847 m!393039))

(assert (=> b!262847 m!393039))

(declare-fun m!393041 () Bool)

(assert (=> b!262847 m!393041))

(assert (=> b!262784 d!88726))

(declare-fun d!88728 () Bool)

(declare-fun res!219947 () Bool)

(declare-fun e!183084 () Bool)

(assert (=> d!88728 (=> (not res!219947) (not e!183084))))

(assert (=> d!88728 (= res!219947 (= (size!6398 (buf!6866 w2!580)) (size!6398 (buf!6866 w2!580))))))

(assert (=> d!88728 (= (isPrefixOf!0 w2!580 w2!580) e!183084)))

(declare-fun b!262848 () Bool)

(declare-fun res!219948 () Bool)

(assert (=> b!262848 (=> (not res!219948) (not e!183084))))

(assert (=> b!262848 (= res!219948 (bvsle (bitIndex!0 (size!6398 (buf!6866 w2!580)) (currentByte!12712 w2!580) (currentBit!12707 w2!580)) (bitIndex!0 (size!6398 (buf!6866 w2!580)) (currentByte!12712 w2!580) (currentBit!12707 w2!580))))))

(declare-fun b!262849 () Bool)

(declare-fun e!183085 () Bool)

(assert (=> b!262849 (= e!183084 e!183085)))

(declare-fun res!219949 () Bool)

(assert (=> b!262849 (=> res!219949 e!183085)))

(assert (=> b!262849 (= res!219949 (= (size!6398 (buf!6866 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262850 () Bool)

(assert (=> b!262850 (= e!183085 (arrayBitRangesEq!0 (buf!6866 w2!580) (buf!6866 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6398 (buf!6866 w2!580)) (currentByte!12712 w2!580) (currentBit!12707 w2!580))))))

(assert (= (and d!88728 res!219947) b!262848))

(assert (= (and b!262848 res!219948) b!262849))

(assert (= (and b!262849 (not res!219949)) b!262850))

(declare-fun m!393043 () Bool)

(assert (=> b!262848 m!393043))

(assert (=> b!262848 m!393043))

(assert (=> b!262850 m!393043))

(assert (=> b!262850 m!393043))

(declare-fun m!393045 () Bool)

(assert (=> b!262850 m!393045))

(assert (=> b!262784 d!88728))

(declare-fun d!88730 () Bool)

(assert (=> d!88730 (= (array_inv!6122 (buf!6866 w2!580)) (bvsge (size!6398 (buf!6866 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262785 d!88730))

(declare-fun d!88732 () Bool)

(declare-fun res!219950 () Bool)

(declare-fun e!183086 () Bool)

(assert (=> d!88732 (=> (not res!219950) (not e!183086))))

(assert (=> d!88732 (= res!219950 (= (size!6398 (buf!6866 w1!584)) (size!6398 (buf!6866 w2!580))))))

(assert (=> d!88732 (= (isPrefixOf!0 w1!584 w2!580) e!183086)))

(declare-fun b!262851 () Bool)

(declare-fun res!219951 () Bool)

(assert (=> b!262851 (=> (not res!219951) (not e!183086))))

(assert (=> b!262851 (= res!219951 (bvsle (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584)) (bitIndex!0 (size!6398 (buf!6866 w2!580)) (currentByte!12712 w2!580) (currentBit!12707 w2!580))))))

(declare-fun b!262852 () Bool)

(declare-fun e!183087 () Bool)

(assert (=> b!262852 (= e!183086 e!183087)))

(declare-fun res!219952 () Bool)

(assert (=> b!262852 (=> res!219952 e!183087)))

(assert (=> b!262852 (= res!219952 (= (size!6398 (buf!6866 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262853 () Bool)

(assert (=> b!262853 (= e!183087 (arrayBitRangesEq!0 (buf!6866 w1!584) (buf!6866 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584))))))

(assert (= (and d!88732 res!219950) b!262851))

(assert (= (and b!262851 res!219951) b!262852))

(assert (= (and b!262852 (not res!219952)) b!262853))

(assert (=> b!262851 m!392967))

(assert (=> b!262851 m!393043))

(assert (=> b!262853 m!392967))

(assert (=> b!262853 m!392967))

(assert (=> b!262853 m!392969))

(assert (=> start!57344 d!88732))

(declare-fun d!88734 () Bool)

(assert (=> d!88734 (= (inv!12 w1!584) (invariant!0 (currentBit!12707 w1!584) (currentByte!12712 w1!584) (size!6398 (buf!6866 w1!584))))))

(declare-fun bs!22506 () Bool)

(assert (= bs!22506 d!88734))

(assert (=> bs!22506 m!392959))

(assert (=> start!57344 d!88734))

(declare-fun d!88736 () Bool)

(assert (=> d!88736 (= (inv!12 w2!580) (invariant!0 (currentBit!12707 w2!580) (currentByte!12712 w2!580) (size!6398 (buf!6866 w2!580))))))

(declare-fun bs!22507 () Bool)

(assert (= bs!22507 d!88736))

(declare-fun m!393047 () Bool)

(assert (=> bs!22507 m!393047))

(assert (=> start!57344 d!88736))

(declare-fun d!88738 () Bool)

(assert (=> d!88738 (= (array_inv!6122 (buf!6866 w1!584)) (bvsge (size!6398 (buf!6866 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262783 d!88738))

(declare-fun b!262895 () Bool)

(declare-fun e!183124 () Bool)

(declare-fun e!183125 () Bool)

(assert (=> b!262895 (= e!183124 e!183125)))

(declare-fun res!219987 () Bool)

(assert (=> b!262895 (=> (not res!219987) (not e!183125))))

(declare-fun e!183126 () Bool)

(assert (=> b!262895 (= res!219987 e!183126)))

(declare-fun res!219986 () Bool)

(assert (=> b!262895 (=> res!219986 e!183126)))

(declare-datatypes ((tuple4!322 0))(
  ( (tuple4!323 (_1!12141 (_ BitVec 32)) (_2!12141 (_ BitVec 32)) (_3!941 (_ BitVec 32)) (_4!161 (_ BitVec 32))) )
))
(declare-fun lt!404455 () tuple4!322)

(assert (=> b!262895 (= res!219986 (bvsge (_1!12141 lt!404455) (_2!12141 lt!404455)))))

(declare-fun lt!404457 () (_ BitVec 32))

(assert (=> b!262895 (= lt!404457 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!404456 () (_ BitVec 32))

(assert (=> b!262895 (= lt!404456 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!322)

(assert (=> b!262895 (= lt!404455 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584))))))

(declare-fun bm!4031 () Bool)

(declare-fun call!4034 () Bool)

(declare-fun c!12003 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4031 (= call!4034 (byteRangesEq!0 (ite c!12003 (select (arr!7385 (buf!6866 w1!584)) (_3!941 lt!404455)) (select (arr!7385 (buf!6866 w1!584)) (_4!161 lt!404455))) (ite c!12003 (select (arr!7385 (buf!6866 w2!580)) (_3!941 lt!404455)) (select (arr!7385 (buf!6866 w2!580)) (_4!161 lt!404455))) (ite c!12003 lt!404456 #b00000000000000000000000000000000) lt!404457))))

(declare-fun b!262897 () Bool)

(declare-fun res!219985 () Bool)

(assert (=> b!262897 (= res!219985 (= lt!404457 #b00000000000000000000000000000000))))

(declare-fun e!183123 () Bool)

(assert (=> b!262897 (=> res!219985 e!183123)))

(declare-fun e!183122 () Bool)

(assert (=> b!262897 (= e!183122 e!183123)))

(declare-fun b!262896 () Bool)

(declare-fun arrayRangesEq!997 (array!14659 array!14659 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262896 (= e!183126 (arrayRangesEq!997 (buf!6866 w1!584) (buf!6866 w2!580) (_1!12141 lt!404455) (_2!12141 lt!404455)))))

(declare-fun d!88740 () Bool)

(declare-fun res!219984 () Bool)

(assert (=> d!88740 (=> res!219984 e!183124)))

(assert (=> d!88740 (= res!219984 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584))))))

(assert (=> d!88740 (= (arrayBitRangesEq!0 (buf!6866 w1!584) (buf!6866 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584))) e!183124)))

(declare-fun b!262898 () Bool)

(assert (=> b!262898 (= e!183123 call!4034)))

(declare-fun b!262899 () Bool)

(declare-fun e!183121 () Bool)

(assert (=> b!262899 (= e!183121 call!4034)))

(declare-fun b!262900 () Bool)

(assert (=> b!262900 (= e!183121 e!183122)))

(declare-fun res!219988 () Bool)

(assert (=> b!262900 (= res!219988 (byteRangesEq!0 (select (arr!7385 (buf!6866 w1!584)) (_3!941 lt!404455)) (select (arr!7385 (buf!6866 w2!580)) (_3!941 lt!404455)) lt!404456 #b00000000000000000000000000001000))))

(assert (=> b!262900 (=> (not res!219988) (not e!183122))))

(declare-fun b!262901 () Bool)

(assert (=> b!262901 (= e!183125 e!183121)))

(assert (=> b!262901 (= c!12003 (= (_3!941 lt!404455) (_4!161 lt!404455)))))

(assert (= (and d!88740 (not res!219984)) b!262895))

(assert (= (and b!262895 (not res!219986)) b!262896))

(assert (= (and b!262895 res!219987) b!262901))

(assert (= (and b!262901 c!12003) b!262899))

(assert (= (and b!262901 (not c!12003)) b!262900))

(assert (= (and b!262900 res!219988) b!262897))

(assert (= (and b!262897 (not res!219985)) b!262898))

(assert (= (or b!262899 b!262898) bm!4031))

(assert (=> b!262895 m!392967))

(declare-fun m!393073 () Bool)

(assert (=> b!262895 m!393073))

(declare-fun m!393075 () Bool)

(assert (=> bm!4031 m!393075))

(declare-fun m!393077 () Bool)

(assert (=> bm!4031 m!393077))

(declare-fun m!393079 () Bool)

(assert (=> bm!4031 m!393079))

(declare-fun m!393081 () Bool)

(assert (=> bm!4031 m!393081))

(declare-fun m!393083 () Bool)

(assert (=> bm!4031 m!393083))

(declare-fun m!393085 () Bool)

(assert (=> b!262896 m!393085))

(assert (=> b!262900 m!393079))

(assert (=> b!262900 m!393075))

(assert (=> b!262900 m!393079))

(assert (=> b!262900 m!393075))

(declare-fun m!393087 () Bool)

(assert (=> b!262900 m!393087))

(assert (=> b!262787 d!88740))

(declare-fun d!88754 () Bool)

(declare-fun e!183150 () Bool)

(assert (=> d!88754 e!183150))

(declare-fun res!220026 () Bool)

(assert (=> d!88754 (=> (not res!220026) (not e!183150))))

(declare-fun lt!404494 () (_ BitVec 64))

(declare-fun lt!404493 () (_ BitVec 64))

(declare-fun lt!404498 () (_ BitVec 64))

(assert (=> d!88754 (= res!220026 (= lt!404493 (bvsub lt!404498 lt!404494)))))

(assert (=> d!88754 (or (= (bvand lt!404498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404498 lt!404494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88754 (= lt!404494 (remainingBits!0 ((_ sign_extend 32) (size!6398 (buf!6866 w1!584))) ((_ sign_extend 32) (currentByte!12712 w1!584)) ((_ sign_extend 32) (currentBit!12707 w1!584))))))

(declare-fun lt!404495 () (_ BitVec 64))

(declare-fun lt!404496 () (_ BitVec 64))

(assert (=> d!88754 (= lt!404498 (bvmul lt!404495 lt!404496))))

(assert (=> d!88754 (or (= lt!404495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404496 (bvsdiv (bvmul lt!404495 lt!404496) lt!404495)))))

(assert (=> d!88754 (= lt!404496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88754 (= lt!404495 ((_ sign_extend 32) (size!6398 (buf!6866 w1!584))))))

(assert (=> d!88754 (= lt!404493 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12712 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12707 w1!584))))))

(assert (=> d!88754 (invariant!0 (currentBit!12707 w1!584) (currentByte!12712 w1!584) (size!6398 (buf!6866 w1!584)))))

(assert (=> d!88754 (= (bitIndex!0 (size!6398 (buf!6866 w1!584)) (currentByte!12712 w1!584) (currentBit!12707 w1!584)) lt!404493)))

(declare-fun b!262939 () Bool)

(declare-fun res!220027 () Bool)

(assert (=> b!262939 (=> (not res!220027) (not e!183150))))

(assert (=> b!262939 (= res!220027 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404493))))

(declare-fun b!262940 () Bool)

(declare-fun lt!404497 () (_ BitVec 64))

(assert (=> b!262940 (= e!183150 (bvsle lt!404493 (bvmul lt!404497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262940 (or (= lt!404497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404497)))))

(assert (=> b!262940 (= lt!404497 ((_ sign_extend 32) (size!6398 (buf!6866 w1!584))))))

(assert (= (and d!88754 res!220026) b!262939))

(assert (= (and b!262939 res!220027) b!262940))

(declare-fun m!393117 () Bool)

(assert (=> d!88754 m!393117))

(assert (=> d!88754 m!392959))

(assert (=> b!262787 d!88754))

(declare-fun d!88784 () Bool)

(assert (=> d!88784 (= (invariant!0 (currentBit!12707 w1!584) (currentByte!12712 w1!584) (size!6398 (buf!6866 w1!584))) (and (bvsge (currentBit!12707 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12707 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12712 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12712 w1!584) (size!6398 (buf!6866 w1!584))) (and (= (currentBit!12707 w1!584) #b00000000000000000000000000000000) (= (currentByte!12712 w1!584) (size!6398 (buf!6866 w1!584)))))))))

(assert (=> b!262782 d!88784))

(check-sat (not b!262848) (not b!262844) (not d!88736) (not b!262895) (not d!88710) (not b!262896) (not b!262847) (not b!262851) (not d!88734) (not b!262845) (not b!262850) (not bm!4031) (not b!262853) (not b!262842) (not d!88720) (not b!262900) (not d!88718) (not d!88754))
