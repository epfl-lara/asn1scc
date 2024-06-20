; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47342 () Bool)

(assert start!47342)

(declare-fun b!225880 () Bool)

(declare-fun e!154313 () Bool)

(declare-fun lt!358949 () (_ BitVec 64))

(declare-datatypes ((array!11270 0))(
  ( (array!11271 (arr!5902 (Array (_ BitVec 32) (_ BitVec 8))) (size!4945 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8986 0))(
  ( (BitStream!8987 (buf!5486 array!11270) (currentByte!10282 (_ BitVec 32)) (currentBit!10277 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8986)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225880 (= e!154313 (not (= lt!358949 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4945 (buf!5486 thiss!1870)) (currentByte!10282 thiss!1870) (currentBit!10277 thiss!1870))))))))

(declare-fun b!225881 () Bool)

(declare-fun e!154311 () Bool)

(declare-fun e!154312 () Bool)

(assert (=> b!225881 (= e!154311 e!154312)))

(declare-fun res!189548 () Bool)

(assert (=> b!225881 (=> (not res!189548) (not e!154312))))

(declare-datatypes ((tuple2!19334 0))(
  ( (tuple2!19335 (_1!10454 (_ BitVec 8)) (_2!10454 BitStream!8986)) )
))
(declare-fun lt!358950 () tuple2!19334)

(assert (=> b!225881 (= res!189548 (= (size!4945 (buf!5486 thiss!1870)) (size!4945 (buf!5486 (_2!10454 lt!358950)))))))

(declare-fun readByte!0 (BitStream!8986) tuple2!19334)

(assert (=> b!225881 (= lt!358950 (readByte!0 thiss!1870))))

(declare-fun b!225882 () Bool)

(declare-fun res!189546 () Bool)

(assert (=> b!225882 (=> (not res!189546) (not e!154311))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225882 (= res!189546 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4945 (buf!5486 thiss!1870))) ((_ sign_extend 32) (currentByte!10282 thiss!1870)) ((_ sign_extend 32) (currentBit!10277 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225883 () Bool)

(assert (=> b!225883 (= e!154312 e!154313)))

(declare-fun res!189550 () Bool)

(assert (=> b!225883 (=> (not res!189550) (not e!154313))))

(assert (=> b!225883 (= res!189550 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 lt!358949))))

(assert (=> b!225883 (= lt!358949 (bitIndex!0 (size!4945 (buf!5486 (_2!10454 lt!358950))) (currentByte!10282 (_2!10454 lt!358950)) (currentBit!10277 (_2!10454 lt!358950))))))

(declare-fun b!225884 () Bool)

(declare-fun res!189547 () Bool)

(assert (=> b!225884 (=> (not res!189547) (not e!154311))))

(assert (=> b!225884 (= res!189547 (bvslt i!761 to!496))))

(declare-fun b!225885 () Bool)

(declare-fun e!154310 () Bool)

(declare-fun array_inv!4686 (array!11270) Bool)

(assert (=> b!225885 (= e!154310 (array_inv!4686 (buf!5486 thiss!1870)))))

(declare-fun res!189549 () Bool)

(assert (=> start!47342 (=> (not res!189549) (not e!154311))))

(declare-fun arr!308 () array!11270)

(assert (=> start!47342 (= res!189549 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4945 arr!308))))))

(assert (=> start!47342 e!154311))

(assert (=> start!47342 true))

(assert (=> start!47342 (array_inv!4686 arr!308)))

(declare-fun inv!12 (BitStream!8986) Bool)

(assert (=> start!47342 (and (inv!12 thiss!1870) e!154310)))

(assert (= (and start!47342 res!189549) b!225882))

(assert (= (and b!225882 res!189546) b!225884))

(assert (= (and b!225884 res!189547) b!225881))

(assert (= (and b!225881 res!189548) b!225883))

(assert (= (and b!225883 res!189550) b!225880))

(assert (= start!47342 b!225885))

(declare-fun m!346915 () Bool)

(assert (=> b!225883 m!346915))

(declare-fun m!346917 () Bool)

(assert (=> b!225881 m!346917))

(declare-fun m!346919 () Bool)

(assert (=> start!47342 m!346919))

(declare-fun m!346921 () Bool)

(assert (=> start!47342 m!346921))

(declare-fun m!346923 () Bool)

(assert (=> b!225882 m!346923))

(declare-fun m!346925 () Bool)

(assert (=> b!225885 m!346925))

(declare-fun m!346927 () Bool)

(assert (=> b!225880 m!346927))

(push 1)

(assert (not b!225880))

(assert (not b!225885))

(assert (not b!225881))

(assert (not start!47342))

(assert (not b!225882))

(assert (not b!225883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76654 () Bool)

(declare-fun lt!359024 () (_ BitVec 8))

(declare-fun lt!359020 () (_ BitVec 8))

(assert (=> d!76654 (= lt!359024 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5902 (buf!5486 thiss!1870)) (currentByte!10282 thiss!1870))) ((_ sign_extend 24) lt!359020))))))

(assert (=> d!76654 (= lt!359020 ((_ extract 7 0) (currentBit!10277 thiss!1870)))))

(declare-fun e!154364 () Bool)

(assert (=> d!76654 e!154364))

(declare-fun res!189603 () Bool)

(assert (=> d!76654 (=> (not res!189603) (not e!154364))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76654 (= res!189603 (validate_offset_bits!1 ((_ sign_extend 32) (size!4945 (buf!5486 thiss!1870))) ((_ sign_extend 32) (currentByte!10282 thiss!1870)) ((_ sign_extend 32) (currentBit!10277 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!16626 0))(
  ( (Unit!16627) )
))
(declare-datatypes ((tuple2!19342 0))(
  ( (tuple2!19343 (_1!10458 Unit!16626) (_2!10458 (_ BitVec 8))) )
))
(declare-fun Unit!16629 () Unit!16626)

(declare-fun Unit!16630 () Unit!16626)

(assert (=> d!76654 (= (readByte!0 thiss!1870) (tuple2!19335 (_2!10458 (ite (bvsgt ((_ sign_extend 24) lt!359020) #b00000000000000000000000000000000) (tuple2!19343 Unit!16629 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359024) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5902 (buf!5486 thiss!1870)) (bvadd (currentByte!10282 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359020)))))))) (tuple2!19343 Unit!16630 lt!359024))) (BitStream!8987 (buf!5486 thiss!1870) (bvadd (currentByte!10282 thiss!1870) #b00000000000000000000000000000001) (currentBit!10277 thiss!1870))))))

(declare-fun b!225940 () Bool)

(declare-fun e!154363 () Bool)

(assert (=> b!225940 (= e!154364 e!154363)))

(declare-fun res!189602 () Bool)

(assert (=> b!225940 (=> (not res!189602) (not e!154363))))

(declare-fun lt!359021 () tuple2!19334)

(assert (=> b!225940 (= res!189602 (= (buf!5486 (_2!10454 lt!359021)) (buf!5486 thiss!1870)))))

(declare-fun lt!359023 () (_ BitVec 8))

(declare-fun lt!359025 () (_ BitVec 8))

(declare-fun Unit!16633 () Unit!16626)

(declare-fun Unit!16634 () Unit!16626)

(assert (=> b!225940 (= lt!359021 (tuple2!19335 (_2!10458 (ite (bvsgt ((_ sign_extend 24) lt!359023) #b00000000000000000000000000000000) (tuple2!19343 Unit!16633 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359025) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5902 (buf!5486 thiss!1870)) (bvadd (currentByte!10282 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359023)))))))) (tuple2!19343 Unit!16634 lt!359025))) (BitStream!8987 (buf!5486 thiss!1870) (bvadd (currentByte!10282 thiss!1870) #b00000000000000000000000000000001) (currentBit!10277 thiss!1870))))))

(assert (=> b!225940 (= lt!359025 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5902 (buf!5486 thiss!1870)) (currentByte!10282 thiss!1870))) ((_ sign_extend 24) lt!359023))))))

(assert (=> b!225940 (= lt!359023 ((_ extract 7 0) (currentBit!10277 thiss!1870)))))

(declare-fun lt!359022 () (_ BitVec 64))

(declare-fun b!225941 () Bool)

(declare-fun lt!359019 () (_ BitVec 64))

(assert (=> b!225941 (= e!154363 (= (bitIndex!0 (size!4945 (buf!5486 (_2!10454 lt!359021))) (currentByte!10282 (_2!10454 lt!359021)) (currentBit!10277 (_2!10454 lt!359021))) (bvadd lt!359022 lt!359019)))))

(assert (=> b!225941 (or (not (= (bvand lt!359022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359019 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359022 lt!359019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!225941 (= lt!359019 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!225941 (= lt!359022 (bitIndex!0 (size!4945 (buf!5486 thiss!1870)) (currentByte!10282 thiss!1870) (currentBit!10277 thiss!1870)))))

(assert (= (and d!76654 res!189603) b!225940))

(assert (= (and b!225940 res!189602) b!225941))

(declare-fun m!346969 () Bool)

(assert (=> d!76654 m!346969))

(declare-fun m!346971 () Bool)

(assert (=> d!76654 m!346971))

(declare-fun m!346973 () Bool)

(assert (=> d!76654 m!346973))

(assert (=> b!225940 m!346973))

(assert (=> b!225940 m!346969))

(declare-fun m!346975 () Bool)

(assert (=> b!225941 m!346975))

(assert (=> b!225941 m!346927))

(assert (=> b!225881 d!76654))

(declare-fun d!76666 () Bool)

(assert (=> d!76666 (= (array_inv!4686 arr!308) (bvsge (size!4945 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47342 d!76666))

(declare-fun d!76668 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76668 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10277 thiss!1870) (currentByte!10282 thiss!1870) (size!4945 (buf!5486 thiss!1870))))))

(declare-fun bs!18739 () Bool)

(assert (= bs!18739 d!76668))

(declare-fun m!346977 () Bool)

(assert (=> bs!18739 m!346977))

(assert (=> start!47342 d!76668))

(declare-fun d!76670 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76670 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4945 (buf!5486 thiss!1870))) ((_ sign_extend 32) (currentByte!10282 thiss!1870)) ((_ sign_extend 32) (currentBit!10277 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4945 (buf!5486 thiss!1870))) ((_ sign_extend 32) (currentByte!10282 thiss!1870)) ((_ sign_extend 32) (currentBit!10277 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18740 () Bool)

(assert (= bs!18740 d!76670))

(declare-fun m!346979 () Bool)

(assert (=> bs!18740 m!346979))

(assert (=> b!225882 d!76670))

(declare-fun d!76672 () Bool)

(assert (=> d!76672 (= (array_inv!4686 (buf!5486 thiss!1870)) (bvsge (size!4945 (buf!5486 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225885 d!76672))

(declare-fun d!76674 () Bool)

(declare-fun e!154374 () Bool)

(assert (=> d!76674 e!154374))

(declare-fun res!189616 () Bool)

(assert (=> d!76674 (=> (not res!189616) (not e!154374))))

(declare-fun lt!359065 () (_ BitVec 64))

(declare-fun lt!359069 () (_ BitVec 64))

(declare-fun lt!359067 () (_ BitVec 64))

(assert (=> d!76674 (= res!189616 (= lt!359069 (bvsub lt!359067 lt!359065)))))

(assert (=> d!76674 (or (= (bvand lt!359067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359065 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!359067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!359067 lt!359065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76674 (= lt!359065 (remainingBits!0 ((_ sign_extend 32) (size!4945 (buf!5486 thiss!1870))) ((_ sign_extend 32) (currentByte!10282 thiss!1870)) ((_ sign_extend 32) (currentBit!10277 thiss!1870))))))

(declare-fun lt!359066 () (_ BitVec 64))

(declare-fun lt!359070 () (_ BitVec 64))

(assert (=> d!76674 (= lt!359067 (bvmul lt!359066 lt!359070))))

(assert (=> d!76674 (or (= lt!359066 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!359070 (bvsdiv (bvmul lt!359066 lt!359070) lt!359066)))))

(assert (=> d!76674 (= lt!359070 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76674 (= lt!359066 ((_ sign_extend 32) (size!4945 (buf!5486 thiss!1870))))))

(assert (=> d!76674 (= lt!359069 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10282 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10277 thiss!1870))))))

(assert (=> d!76674 (invariant!0 (currentBit!10277 thiss!1870) (currentByte!10282 thiss!1870) (size!4945 (buf!5486 thiss!1870)))))

(assert (=> d!76674 (= (bitIndex!0 (size!4945 (buf!5486 thiss!1870)) (currentByte!10282 thiss!1870) (currentBit!10277 thiss!1870)) lt!359069)))

(declare-fun b!225954 () Bool)

(declare-fun res!189617 () Bool)

(assert (=> b!225954 (=> (not res!189617) (not e!154374))))

(assert (=> b!225954 (= res!189617 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!359069))))

(declare-fun b!225955 () Bool)

(declare-fun lt!359068 () (_ BitVec 64))

(assert (=> b!225955 (= e!154374 (bvsle lt!359069 (bvmul lt!359068 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225955 (or (= lt!359068 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359068 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359068)))))

(assert (=> b!225955 (= lt!359068 ((_ sign_extend 32) (size!4945 (buf!5486 thiss!1870))))))

(assert (= (and d!76674 res!189616) b!225954))

(assert (= (and b!225954 res!189617) b!225955))

(assert (=> d!76674 m!346979))

(assert (=> d!76674 m!346977))

(assert (=> b!225880 d!76674))

(declare-fun d!76686 () Bool)

(declare-fun e!154375 () Bool)

(assert (=> d!76686 e!154375))

(declare-fun res!189618 () Bool)

(assert (=> d!76686 (=> (not res!189618) (not e!154375))))

(declare-fun lt!359075 () (_ BitVec 64))

(declare-fun lt!359071 () (_ BitVec 64))

(declare-fun lt!359073 () (_ BitVec 64))

(assert (=> d!76686 (= res!189618 (= lt!359075 (bvsub lt!359073 lt!359071)))))

(assert (=> d!76686 (or (= (bvand lt!359073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359071 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!359073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!359073 lt!359071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76686 (= lt!359071 (remainingBits!0 ((_ sign_extend 32) (size!4945 (buf!5486 (_2!10454 lt!358950)))) ((_ sign_extend 32) (currentByte!10282 (_2!10454 lt!358950))) ((_ sign_extend 32) (currentBit!10277 (_2!10454 lt!358950)))))))

(declare-fun lt!359072 () (_ BitVec 64))

(declare-fun lt!359076 () (_ BitVec 64))

(assert (=> d!76686 (= lt!359073 (bvmul lt!359072 lt!359076))))

(assert (=> d!76686 (or (= lt!359072 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!359076 (bvsdiv (bvmul lt!359072 lt!359076) lt!359072)))))

(assert (=> d!76686 (= lt!359076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76686 (= lt!359072 ((_ sign_extend 32) (size!4945 (buf!5486 (_2!10454 lt!358950)))))))

(assert (=> d!76686 (= lt!359075 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10282 (_2!10454 lt!358950))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10277 (_2!10454 lt!358950)))))))

(assert (=> d!76686 (invariant!0 (currentBit!10277 (_2!10454 lt!358950)) (currentByte!10282 (_2!10454 lt!358950)) (size!4945 (buf!5486 (_2!10454 lt!358950))))))

(assert (=> d!76686 (= (bitIndex!0 (size!4945 (buf!5486 (_2!10454 lt!358950))) (currentByte!10282 (_2!10454 lt!358950)) (currentBit!10277 (_2!10454 lt!358950))) lt!359075)))

(declare-fun b!225956 () Bool)

(declare-fun res!189619 () Bool)

(assert (=> b!225956 (=> (not res!189619) (not e!154375))))

(assert (=> b!225956 (= res!189619 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!359075))))

(declare-fun b!225957 () Bool)

(declare-fun lt!359074 () (_ BitVec 64))

(assert (=> b!225957 (= e!154375 (bvsle lt!359075 (bvmul lt!359074 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225957 (or (= lt!359074 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359074 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359074)))))

(assert (=> b!225957 (= lt!359074 ((_ sign_extend 32) (size!4945 (buf!5486 (_2!10454 lt!358950)))))))

(assert (= (and d!76686 res!189618) b!225956))

(assert (= (and b!225956 res!189619) b!225957))

(declare-fun m!346993 () Bool)

(assert (=> d!76686 m!346993))

(declare-fun m!346995 () Bool)

(assert (=> d!76686 m!346995))

(assert (=> b!225883 d!76686))

(push 1)

(assert (not d!76686))

(assert (not b!225941))

(assert (not d!76654))

(assert (not d!76674))

(assert (not d!76670))

(assert (not d!76668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

