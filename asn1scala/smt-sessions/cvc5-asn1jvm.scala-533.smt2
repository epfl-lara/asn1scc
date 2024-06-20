; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15588 () Bool)

(assert start!15588)

(declare-fun b!78975 () Bool)

(declare-fun e!51820 () Bool)

(declare-fun e!51822 () Bool)

(assert (=> b!78975 (= e!51820 e!51822)))

(declare-fun res!65349 () Bool)

(assert (=> b!78975 (=> (not res!65349) (not e!51822))))

(declare-datatypes ((array!3367 0))(
  ( (array!3368 (arr!2157 (Array (_ BitVec 32) (_ BitVec 8))) (size!1556 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2674 0))(
  ( (BitStream!2675 (buf!1946 array!3367) (currentByte!3808 (_ BitVec 32)) (currentBit!3803 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5197 0))(
  ( (Unit!5198) )
))
(declare-datatypes ((tuple2!7040 0))(
  ( (tuple2!7041 (_1!3657 Unit!5197) (_2!3657 BitStream!2674)) )
))
(declare-fun lt!125855 () tuple2!7040)

(declare-fun lt!125856 () Bool)

(declare-datatypes ((tuple2!7042 0))(
  ( (tuple2!7043 (_1!3658 BitStream!2674) (_2!3658 Bool)) )
))
(declare-fun lt!125858 () tuple2!7042)

(assert (=> b!78975 (= res!65349 (and (= (_2!3658 lt!125858) lt!125856) (= (_1!3658 lt!125858) (_2!3657 lt!125855))))))

(declare-fun thiss!1107 () BitStream!2674)

(declare-fun readBitPure!0 (BitStream!2674) tuple2!7042)

(declare-fun readerFrom!0 (BitStream!2674 (_ BitVec 32) (_ BitVec 32)) BitStream!2674)

(assert (=> b!78975 (= lt!125858 (readBitPure!0 (readerFrom!0 (_2!3657 lt!125855) (currentBit!3803 thiss!1107) (currentByte!3808 thiss!1107))))))

(declare-fun b!78976 () Bool)

(declare-fun e!51817 () Bool)

(declare-fun e!51821 () Bool)

(assert (=> b!78976 (= e!51817 (not e!51821))))

(declare-fun res!65347 () Bool)

(assert (=> b!78976 (=> res!65347 e!51821)))

(assert (=> b!78976 (= res!65347 (not (= (size!1556 (buf!1946 (_2!3657 lt!125855))) (size!1556 (buf!1946 thiss!1107)))))))

(declare-fun e!51819 () Bool)

(assert (=> b!78976 e!51819))

(declare-fun res!65353 () Bool)

(assert (=> b!78976 (=> (not res!65353) (not e!51819))))

(assert (=> b!78976 (= res!65353 (= (size!1556 (buf!1946 thiss!1107)) (size!1556 (buf!1946 (_2!3657 lt!125855)))))))

(declare-fun appendBit!0 (BitStream!2674 Bool) tuple2!7040)

(assert (=> b!78976 (= lt!125855 (appendBit!0 thiss!1107 lt!125856))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!78976 (= lt!125856 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78977 () Bool)

(declare-fun res!65346 () Bool)

(assert (=> b!78977 (=> res!65346 e!51821)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78977 (= res!65346 (not (= (bitIndex!0 (size!1556 (buf!1946 (_2!3657 lt!125855))) (currentByte!3808 (_2!3657 lt!125855)) (currentBit!3803 (_2!3657 lt!125855))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1556 (buf!1946 thiss!1107)) (currentByte!3808 thiss!1107) (currentBit!3803 thiss!1107))))))))

(declare-fun b!78979 () Bool)

(declare-fun e!51818 () Bool)

(declare-fun array_inv!1402 (array!3367) Bool)

(assert (=> b!78979 (= e!51818 (array_inv!1402 (buf!1946 thiss!1107)))))

(declare-fun b!78980 () Bool)

(declare-fun res!65350 () Bool)

(assert (=> b!78980 (=> (not res!65350) (not e!51820))))

(declare-fun isPrefixOf!0 (BitStream!2674 BitStream!2674) Bool)

(assert (=> b!78980 (= res!65350 (isPrefixOf!0 thiss!1107 (_2!3657 lt!125855)))))

(declare-fun b!78981 () Bool)

(declare-fun lt!125857 () BitStream!2674)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78981 (= e!51821 (validate_offset_bits!1 ((_ sign_extend 32) (size!1556 (buf!1946 lt!125857))) ((_ sign_extend 32) (currentByte!3808 lt!125857)) ((_ sign_extend 32) (currentBit!3803 lt!125857)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!125859 () tuple2!7042)

(assert (=> b!78981 (= lt!125859 (readBitPure!0 lt!125857))))

(assert (=> b!78981 (= lt!125857 (readerFrom!0 (_2!3657 lt!125855) (currentBit!3803 thiss!1107) (currentByte!3808 thiss!1107)))))

(declare-fun b!78982 () Bool)

(declare-fun lt!125853 () (_ BitVec 64))

(assert (=> b!78982 (= e!51822 (= (bitIndex!0 (size!1556 (buf!1946 (_1!3658 lt!125858))) (currentByte!3808 (_1!3658 lt!125858)) (currentBit!3803 (_1!3658 lt!125858))) lt!125853))))

(declare-fun b!78978 () Bool)

(declare-fun res!65352 () Bool)

(assert (=> b!78978 (=> (not res!65352) (not e!51817))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78978 (= res!65352 (validate_offset_bit!0 ((_ sign_extend 32) (size!1556 (buf!1946 thiss!1107))) ((_ sign_extend 32) (currentByte!3808 thiss!1107)) ((_ sign_extend 32) (currentBit!3803 thiss!1107))))))

(declare-fun res!65345 () Bool)

(assert (=> start!15588 (=> (not res!65345) (not e!51817))))

(assert (=> start!15588 (= res!65345 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15588 e!51817))

(assert (=> start!15588 true))

(declare-fun inv!12 (BitStream!2674) Bool)

(assert (=> start!15588 (and (inv!12 thiss!1107) e!51818)))

(declare-fun b!78983 () Bool)

(declare-fun res!65351 () Bool)

(assert (=> b!78983 (=> res!65351 e!51821)))

(assert (=> b!78983 (= res!65351 (not (isPrefixOf!0 thiss!1107 (_2!3657 lt!125855))))))

(declare-fun b!78984 () Bool)

(assert (=> b!78984 (= e!51819 e!51820)))

(declare-fun res!65348 () Bool)

(assert (=> b!78984 (=> (not res!65348) (not e!51820))))

(declare-fun lt!125854 () (_ BitVec 64))

(assert (=> b!78984 (= res!65348 (= lt!125853 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125854)))))

(assert (=> b!78984 (= lt!125853 (bitIndex!0 (size!1556 (buf!1946 (_2!3657 lt!125855))) (currentByte!3808 (_2!3657 lt!125855)) (currentBit!3803 (_2!3657 lt!125855))))))

(assert (=> b!78984 (= lt!125854 (bitIndex!0 (size!1556 (buf!1946 thiss!1107)) (currentByte!3808 thiss!1107) (currentBit!3803 thiss!1107)))))

(assert (= (and start!15588 res!65345) b!78978))

(assert (= (and b!78978 res!65352) b!78976))

(assert (= (and b!78976 res!65353) b!78984))

(assert (= (and b!78984 res!65348) b!78980))

(assert (= (and b!78980 res!65350) b!78975))

(assert (= (and b!78975 res!65349) b!78982))

(assert (= (and b!78976 (not res!65347)) b!78977))

(assert (= (and b!78977 (not res!65346)) b!78983))

(assert (= (and b!78983 (not res!65351)) b!78981))

(assert (= start!15588 b!78979))

(declare-fun m!124413 () Bool)

(assert (=> b!78981 m!124413))

(declare-fun m!124415 () Bool)

(assert (=> b!78981 m!124415))

(declare-fun m!124417 () Bool)

(assert (=> b!78981 m!124417))

(declare-fun m!124419 () Bool)

(assert (=> b!78976 m!124419))

(declare-fun m!124421 () Bool)

(assert (=> b!78976 m!124421))

(declare-fun m!124423 () Bool)

(assert (=> b!78980 m!124423))

(declare-fun m!124425 () Bool)

(assert (=> b!78984 m!124425))

(declare-fun m!124427 () Bool)

(assert (=> b!78984 m!124427))

(assert (=> b!78977 m!124425))

(assert (=> b!78977 m!124427))

(declare-fun m!124429 () Bool)

(assert (=> b!78982 m!124429))

(assert (=> b!78975 m!124417))

(assert (=> b!78975 m!124417))

(declare-fun m!124431 () Bool)

(assert (=> b!78975 m!124431))

(declare-fun m!124433 () Bool)

(assert (=> b!78979 m!124433))

(declare-fun m!124435 () Bool)

(assert (=> b!78978 m!124435))

(declare-fun m!124437 () Bool)

(assert (=> start!15588 m!124437))

(assert (=> b!78983 m!124423))

(push 1)

(assert (not b!78975))

(assert (not b!78976))

(assert (not start!15588))

(assert (not b!78984))

(assert (not b!78980))

(assert (not b!78982))

(assert (not b!78983))

(assert (not b!78981))

(assert (not b!78979))

(assert (not b!78977))

(assert (not b!78978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24934 () Bool)

(declare-fun res!65434 () Bool)

(declare-fun e!51880 () Bool)

(assert (=> d!24934 (=> (not res!65434) (not e!51880))))

(assert (=> d!24934 (= res!65434 (= (size!1556 (buf!1946 thiss!1107)) (size!1556 (buf!1946 (_2!3657 lt!125855)))))))

(assert (=> d!24934 (= (isPrefixOf!0 thiss!1107 (_2!3657 lt!125855)) e!51880)))

(declare-fun b!79070 () Bool)

(declare-fun res!65433 () Bool)

(assert (=> b!79070 (=> (not res!65433) (not e!51880))))

(assert (=> b!79070 (= res!65433 (bvsle (bitIndex!0 (size!1556 (buf!1946 thiss!1107)) (currentByte!3808 thiss!1107) (currentBit!3803 thiss!1107)) (bitIndex!0 (size!1556 (buf!1946 (_2!3657 lt!125855))) (currentByte!3808 (_2!3657 lt!125855)) (currentBit!3803 (_2!3657 lt!125855)))))))

(declare-fun b!79071 () Bool)

(declare-fun e!51881 () Bool)

(assert (=> b!79071 (= e!51880 e!51881)))

(declare-fun res!65435 () Bool)

(assert (=> b!79071 (=> res!65435 e!51881)))

(assert (=> b!79071 (= res!65435 (= (size!1556 (buf!1946 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!79072 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3367 array!3367 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79072 (= e!51881 (arrayBitRangesEq!0 (buf!1946 thiss!1107) (buf!1946 (_2!3657 lt!125855)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1556 (buf!1946 thiss!1107)) (currentByte!3808 thiss!1107) (currentBit!3803 thiss!1107))))))

(assert (= (and d!24934 res!65434) b!79070))

(assert (= (and b!79070 res!65433) b!79071))

(assert (= (and b!79071 (not res!65435)) b!79072))

(assert (=> b!79070 m!124427))

(assert (=> b!79070 m!124425))

(assert (=> b!79072 m!124427))

(assert (=> b!79072 m!124427))

(declare-fun m!124505 () Bool)

(assert (=> b!79072 m!124505))

(assert (=> b!78980 d!24934))

(declare-fun d!24946 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24946 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3803 thiss!1107) (currentByte!3808 thiss!1107) (size!1556 (buf!1946 thiss!1107))))))

(declare-fun bs!6044 () Bool)

(assert (= bs!6044 d!24946))

(declare-fun m!124507 () Bool)

(assert (=> bs!6044 m!124507))

(assert (=> start!15588 d!24946))

(declare-fun d!24948 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24948 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1556 (buf!1946 lt!125857))) ((_ sign_extend 32) (currentByte!3808 lt!125857)) ((_ sign_extend 32) (currentBit!3803 lt!125857)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1556 (buf!1946 lt!125857))) ((_ sign_extend 32) (currentByte!3808 lt!125857)) ((_ sign_extend 32) (currentBit!3803 lt!125857))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6046 () Bool)

(assert (= bs!6046 d!24948))

(declare-fun m!124511 () Bool)

(assert (=> bs!6046 m!124511))

(assert (=> b!78981 d!24948))

(declare-fun d!24952 () Bool)

(declare-datatypes ((tuple2!7054 0))(
  ( (tuple2!7055 (_1!3664 Bool) (_2!3664 BitStream!2674)) )
))
(declare-fun lt!125937 () tuple2!7054)

(declare-fun readBit!0 (BitStream!2674) tuple2!7054)

(assert (=> d!24952 (= lt!125937 (readBit!0 lt!125857))))

(assert (=> d!24952 (= (readBitPure!0 lt!125857) (tuple2!7043 (_2!3664 lt!125937) (_1!3664 lt!125937)))))

(declare-fun bs!6047 () Bool)

(assert (= bs!6047 d!24952))

(declare-fun m!124515 () Bool)

(assert (=> bs!6047 m!124515))

(assert (=> b!78981 d!24952))

(declare-fun d!24958 () Bool)

(declare-fun e!51887 () Bool)

(assert (=> d!24958 e!51887))

(declare-fun res!65443 () Bool)

(assert (=> d!24958 (=> (not res!65443) (not e!51887))))

(assert (=> d!24958 (= res!65443 (invariant!0 (currentBit!3803 (_2!3657 lt!125855)) (currentByte!3808 (_2!3657 lt!125855)) (size!1556 (buf!1946 (_2!3657 lt!125855)))))))

(assert (=> d!24958 (= (readerFrom!0 (_2!3657 lt!125855) (currentBit!3803 thiss!1107) (currentByte!3808 thiss!1107)) (BitStream!2675 (buf!1946 (_2!3657 lt!125855)) (currentByte!3808 thiss!1107) (currentBit!3803 thiss!1107)))))

(declare-fun b!79078 () Bool)

(assert (=> b!79078 (= e!51887 (invariant!0 (currentBit!3803 thiss!1107) (currentByte!3808 thiss!1107) (size!1556 (buf!1946 (_2!3657 lt!125855)))))))

(assert (= (and d!24958 res!65443) b!79078))

(declare-fun m!124521 () Bool)

(assert (=> d!24958 m!124521))

(declare-fun m!124523 () Bool)

(assert (=> b!79078 m!124523))

(assert (=> b!78981 d!24958))

(declare-fun d!24964 () Bool)

(assert (=> d!24964 (= (array_inv!1402 (buf!1946 thiss!1107)) (bvsge (size!1556 (buf!1946 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78979 d!24964))

(assert (=> b!78983 d!24934))

(declare-fun d!24966 () Bool)

(declare-fun e!51893 () Bool)

(assert (=> d!24966 e!51893))

(declare-fun res!65454 () Bool)

(assert (=> d!24966 (=> (not res!65454) (not e!51893))))

(declare-fun lt!125970 () (_ BitVec 64))

(declare-fun lt!125971 () (_ BitVec 64))

(declare-fun lt!125969 () (_ BitVec 64))

(assert (=> d!24966 (= res!65454 (= lt!125970 (bvsub lt!125971 lt!125969)))))

(assert (=> d!24966 (or (= (bvand lt!125971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125971 lt!125969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24966 (= lt!125969 (remainingBits!0 ((_ sign_extend 32) (size!1556 (buf!1946 (_1!3658 lt!125858)))) ((_ sign_extend 32) (currentByte!3808 (_1!3658 lt!125858))) ((_ sign_extend 32) (currentBit!3803 (_1!3658 lt!125858)))))))

(declare-fun lt!125972 () (_ BitVec 64))

(declare-fun lt!125973 () (_ BitVec 64))

(assert (=> d!24966 (= lt!125971 (bvmul lt!125972 lt!125973))))

(assert (=> d!24966 (or (= lt!125972 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125973 (bvsdiv (bvmul lt!125972 lt!125973) lt!125972)))))

(assert (=> d!24966 (= lt!125973 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24966 (= lt!125972 ((_ sign_extend 32) (size!1556 (buf!1946 (_1!3658 lt!125858)))))))

(assert (=> d!24966 (= lt!125970 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3808 (_1!3658 lt!125858))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3803 (_1!3658 lt!125858)))))))

(assert (=> d!24966 (invariant!0 (currentBit!3803 (_1!3658 lt!125858)) (currentByte!3808 (_1!3658 lt!125858)) (size!1556 (buf!1946 (_1!3658 lt!125858))))))

(assert (=> d!24966 (= (bitIndex!0 (size!1556 (buf!1946 (_1!3658 lt!125858))) (currentByte!3808 (_1!3658 lt!125858)) (currentBit!3803 (_1!3658 lt!125858))) lt!125970)))

(declare-fun b!79089 () Bool)

(declare-fun res!65455 () Bool)

(assert (=> b!79089 (=> (not res!65455) (not e!51893))))

(assert (=> b!79089 (= res!65455 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125970))))

(declare-fun b!79090 () Bool)

(declare-fun lt!125974 () (_ BitVec 64))

(assert (=> b!79090 (= e!51893 (bvsle lt!125970 (bvmul lt!125974 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79090 (or (= lt!125974 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125974 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125974)))))

(assert (=> b!79090 (= lt!125974 ((_ sign_extend 32) (size!1556 (buf!1946 (_1!3658 lt!125858)))))))

(assert (= (and d!24966 res!65454) b!79089))

(assert (= (and b!79089 res!65455) b!79090))

(declare-fun m!124531 () Bool)

(assert (=> d!24966 m!124531))

(declare-fun m!124533 () Bool)

(assert (=> d!24966 m!124533))

(assert (=> b!78982 d!24966))

(declare-fun d!24972 () Bool)

(declare-fun lt!125978 () tuple2!7054)

(assert (=> d!24972 (= lt!125978 (readBit!0 (readerFrom!0 (_2!3657 lt!125855) (currentBit!3803 thiss!1107) (currentByte!3808 thiss!1107))))))

(assert (=> d!24972 (= (readBitPure!0 (readerFrom!0 (_2!3657 lt!125855) (currentBit!3803 thiss!1107) (currentByte!3808 thiss!1107))) (tuple2!7043 (_2!3664 lt!125978) (_1!3664 lt!125978)))))

(declare-fun bs!6052 () Bool)

(assert (= bs!6052 d!24972))

(assert (=> bs!6052 m!124417))

(declare-fun m!124537 () Bool)

(assert (=> bs!6052 m!124537))

(assert (=> b!78975 d!24972))

(assert (=> b!78975 d!24958))

(declare-fun d!24976 () Bool)

(declare-fun e!51894 () Bool)

(assert (=> d!24976 e!51894))

(declare-fun res!65456 () Bool)

(assert (=> d!24976 (=> (not res!65456) (not e!51894))))

(declare-fun lt!125980 () (_ BitVec 64))

(declare-fun lt!125979 () (_ BitVec 64))

(declare-fun lt!125981 () (_ BitVec 64))

(assert (=> d!24976 (= res!65456 (= lt!125980 (bvsub lt!125981 lt!125979)))))

(assert (=> d!24976 (or (= (bvand lt!125981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125979 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125981 lt!125979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24976 (= lt!125979 (remainingBits!0 ((_ sign_extend 32) (size!1556 (buf!1946 (_2!3657 lt!125855)))) ((_ sign_extend 32) (currentByte!3808 (_2!3657 lt!125855))) ((_ sign_extend 32) (currentBit!3803 (_2!3657 lt!125855)))))))

(declare-fun lt!125982 () (_ BitVec 64))

(declare-fun lt!125983 () (_ BitVec 64))

(assert (=> d!24976 (= lt!125981 (bvmul lt!125982 lt!125983))))

(assert (=> d!24976 (or (= lt!125982 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125983 (bvsdiv (bvmul lt!125982 lt!125983) lt!125982)))))

(assert (=> d!24976 (= lt!125983 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24976 (= lt!125982 ((_ sign_extend 32) (size!1556 (buf!1946 (_2!3657 lt!125855)))))))

(assert (=> d!24976 (= lt!125980 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3808 (_2!3657 lt!125855))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3803 (_2!3657 lt!125855)))))))

(assert (=> d!24976 (invariant!0 (currentBit!3803 (_2!3657 lt!125855)) (currentByte!3808 (_2!3657 lt!125855)) (size!1556 (buf!1946 (_2!3657 lt!125855))))))

(assert (=> d!24976 (= (bitIndex!0 (size!1556 (buf!1946 (_2!3657 lt!125855))) (currentByte!3808 (_2!3657 lt!125855)) (currentBit!3803 (_2!3657 lt!125855))) lt!125980)))

(declare-fun b!79091 () Bool)

(declare-fun res!65457 () Bool)

(assert (=> b!79091 (=> (not res!65457) (not e!51894))))

(assert (=> b!79091 (= res!65457 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125980))))

(declare-fun b!79092 () Bool)

(declare-fun lt!125984 () (_ BitVec 64))

(assert (=> b!79092 (= e!51894 (bvsle lt!125980 (bvmul lt!125984 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79092 (or (= lt!125984 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125984 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125984)))))

(assert (=> b!79092 (= lt!125984 ((_ sign_extend 32) (size!1556 (buf!1946 (_2!3657 lt!125855)))))))

(assert (= (and d!24976 res!65456) b!79091))

(assert (= (and b!79091 res!65457) b!79092))

(declare-fun m!124539 () Bool)

(assert (=> d!24976 m!124539))

(assert (=> d!24976 m!124521))

(assert (=> b!78984 d!24976))

(declare-fun d!24978 () Bool)

(declare-fun e!51895 () Bool)

(assert (=> d!24978 e!51895))

(declare-fun res!65459 () Bool)

(assert (=> d!24978 (=> (not res!65459) (not e!51895))))

(declare-fun lt!125987 () (_ BitVec 64))

(declare-fun lt!125985 () (_ BitVec 64))

(declare-fun lt!125986 () (_ BitVec 64))

(assert (=> d!24978 (= res!65459 (= lt!125986 (bvsub lt!125987 lt!125985)))))

(assert (=> d!24978 (or (= (bvand lt!125987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125985 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125987 lt!125985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24978 (= lt!125985 (remainingBits!0 ((_ sign_extend 32) (size!1556 (buf!1946 thiss!1107))) ((_ sign_extend 32) (currentByte!3808 thiss!1107)) ((_ sign_extend 32) (currentBit!3803 thiss!1107))))))

(declare-fun lt!125988 () (_ BitVec 64))

(declare-fun lt!125989 () (_ BitVec 64))

(assert (=> d!24978 (= lt!125987 (bvmul lt!125988 lt!125989))))

(assert (=> d!24978 (or (= lt!125988 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125989 (bvsdiv (bvmul lt!125988 lt!125989) lt!125988)))))

(assert (=> d!24978 (= lt!125989 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24978 (= lt!125988 ((_ sign_extend 32) (size!1556 (buf!1946 thiss!1107))))))

(assert (=> d!24978 (= lt!125986 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3808 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3803 thiss!1107))))))

(assert (=> d!24978 (invariant!0 (currentBit!3803 thiss!1107) (currentByte!3808 thiss!1107) (size!1556 (buf!1946 thiss!1107)))))

(assert (=> d!24978 (= (bitIndex!0 (size!1556 (buf!1946 thiss!1107)) (currentByte!3808 thiss!1107) (currentBit!3803 thiss!1107)) lt!125986)))

(declare-fun b!79093 () Bool)

(declare-fun res!65460 () Bool)

(assert (=> b!79093 (=> (not res!65460) (not e!51895))))

(assert (=> b!79093 (= res!65460 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125986))))

(declare-fun b!79094 () Bool)

(declare-fun lt!125990 () (_ BitVec 64))

(assert (=> b!79094 (= e!51895 (bvsle lt!125986 (bvmul lt!125990 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79094 (or (= lt!125990 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125990 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125990)))))

(assert (=> b!79094 (= lt!125990 ((_ sign_extend 32) (size!1556 (buf!1946 thiss!1107))))))

(assert (= (and d!24978 res!65459) b!79093))

(assert (= (and b!79093 res!65460) b!79094))

(declare-fun m!124541 () Bool)

(assert (=> d!24978 m!124541))

(assert (=> d!24978 m!124507))

(assert (=> b!78984 d!24978))

(declare-fun d!24980 () Bool)

(assert (=> d!24980 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1556 (buf!1946 thiss!1107))) ((_ sign_extend 32) (currentByte!3808 thiss!1107)) ((_ sign_extend 32) (currentBit!3803 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1556 (buf!1946 thiss!1107))) ((_ sign_extend 32) (currentByte!3808 thiss!1107)) ((_ sign_extend 32) (currentBit!3803 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6053 () Bool)

(assert (= bs!6053 d!24980))

(assert (=> bs!6053 m!124541))

(assert (=> b!78978 d!24980))

(declare-fun b!79134 () Bool)

(declare-fun res!65497 () Bool)

(declare-fun e!51916 () Bool)

(assert (=> b!79134 (=> (not res!65497) (not e!51916))))

(declare-fun lt!126035 () tuple2!7040)

(assert (=> b!79134 (= res!65497 (isPrefixOf!0 thiss!1107 (_2!3657 lt!126035)))))

(declare-fun b!79133 () Bool)

(declare-fun res!65498 () Bool)

(assert (=> b!79133 (=> (not res!65498) (not e!51916))))

(declare-fun lt!126032 () (_ BitVec 64))

(declare-fun lt!126034 () (_ BitVec 64))

(assert (=> b!79133 (= res!65498 (= (bitIndex!0 (size!1556 (buf!1946 (_2!3657 lt!126035))) (currentByte!3808 (_2!3657 lt!126035)) (currentBit!3803 (_2!3657 lt!126035))) (bvadd lt!126032 lt!126034)))))

(assert (=> b!79133 (or (not (= (bvand lt!126032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126034 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!126032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!126032 lt!126034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!79133 (= lt!126034 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!79133 (= lt!126032 (bitIndex!0 (size!1556 (buf!1946 thiss!1107)) (currentByte!3808 thiss!1107) (currentBit!3803 thiss!1107)))))

(declare-fun b!79136 () Bool)

(declare-fun e!51915 () Bool)

(declare-fun lt!126033 () tuple2!7042)

(assert (=> b!79136 (= e!51915 (= (bitIndex!0 (size!1556 (buf!1946 (_1!3658 lt!126033))) (currentByte!3808 (_1!3658 lt!126033)) (currentBit!3803 (_1!3658 lt!126033))) (bitIndex!0 (size!1556 (buf!1946 (_2!3657 lt!126035))) (currentByte!3808 (_2!3657 lt!126035)) (currentBit!3803 (_2!3657 lt!126035)))))))

(declare-fun b!79135 () Bool)

(assert (=> b!79135 (= e!51916 e!51915)))

(declare-fun res!65496 () Bool)

(assert (=> b!79135 (=> (not res!65496) (not e!51915))))

(assert (=> b!79135 (= res!65496 (and (= (_2!3658 lt!126033) lt!125856) (= (_1!3658 lt!126033) (_2!3657 lt!126035))))))

(assert (=> b!79135 (= lt!126033 (readBitPure!0 (readerFrom!0 (_2!3657 lt!126035) (currentBit!3803 thiss!1107) (currentByte!3808 thiss!1107))))))

(declare-fun d!24982 () Bool)

(assert (=> d!24982 e!51916))

(declare-fun res!65499 () Bool)

(assert (=> d!24982 (=> (not res!65499) (not e!51916))))

(assert (=> d!24982 (= res!65499 (= (size!1556 (buf!1946 thiss!1107)) (size!1556 (buf!1946 (_2!3657 lt!126035)))))))

(declare-fun choose!16 (BitStream!2674 Bool) tuple2!7040)

(assert (=> d!24982 (= lt!126035 (choose!16 thiss!1107 lt!125856))))

(assert (=> d!24982 (validate_offset_bit!0 ((_ sign_extend 32) (size!1556 (buf!1946 thiss!1107))) ((_ sign_extend 32) (currentByte!3808 thiss!1107)) ((_ sign_extend 32) (currentBit!3803 thiss!1107)))))

(assert (=> d!24982 (= (appendBit!0 thiss!1107 lt!125856) lt!126035)))

(assert (= (and d!24982 res!65499) b!79133))

(assert (= (and b!79133 res!65498) b!79134))

(assert (= (and b!79134 res!65497) b!79135))

(assert (= (and b!79135 res!65496) b!79136))

(declare-fun m!124567 () Bool)

(assert (=> b!79135 m!124567))

(assert (=> b!79135 m!124567))

(declare-fun m!124569 () Bool)

(assert (=> b!79135 m!124569))

(declare-fun m!124571 () Bool)

(assert (=> b!79134 m!124571))

(declare-fun m!124573 () Bool)

(assert (=> b!79133 m!124573))

(assert (=> b!79133 m!124427))

(declare-fun m!124575 () Bool)

(assert (=> b!79136 m!124575))

(assert (=> b!79136 m!124573))

(declare-fun m!124577 () Bool)

(assert (=> d!24982 m!124577))

(assert (=> d!24982 m!124435))

(assert (=> b!78976 d!24982))

(assert (=> b!78977 d!24976))

(assert (=> b!78977 d!24978))

(push 1)

(assert (not d!24948))

(assert (not d!24966))

(assert (not d!24978))

(assert (not d!24952))

(assert (not b!79134))

(assert (not d!24972))

(assert (not d!24980))

(assert (not b!79136))

(assert (not d!24958))

(assert (not b!79135))

(assert (not d!24982))

(assert (not d!24976))

(assert (not d!24946))

(assert (not b!79078))

(assert (not b!79133))

(assert (not b!79070))

(assert (not b!79072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

