; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35324 () Bool)

(assert start!35324)

(declare-fun b!165376 () Bool)

(declare-fun res!137731 () Bool)

(declare-fun e!114452 () Bool)

(assert (=> b!165376 (=> (not res!137731) (not e!114452))))

(declare-datatypes ((array!8419 0))(
  ( (array!8420 (arr!4680 (Array (_ BitVec 32) (_ BitVec 8))) (size!3759 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6674 0))(
  ( (BitStream!6675 (buf!4211 array!8419) (currentByte!7887 (_ BitVec 32)) (currentBit!7882 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6674)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165376 (= res!137731 (validate_offset_bits!1 ((_ sign_extend 32) (size!3759 (buf!4211 thiss!1577))) ((_ sign_extend 32) (currentByte!7887 thiss!1577)) ((_ sign_extend 32) (currentBit!7882 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun lt!258644 () (_ BitVec 64))

(declare-fun b!165378 () Bool)

(declare-fun e!114451 () Bool)

(declare-fun lt!258648 () (_ BitVec 64))

(assert (=> b!165378 (= e!114451 (or (not (= lt!258648 (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!258648 (bvand (bvadd lt!258644 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!165378 (= lt!258648 (bvand lt!258644 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!165378 (= lt!258644 (bitIndex!0 (size!3759 (buf!4211 thiss!1577)) (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577)))))

(declare-fun b!165379 () Bool)

(declare-fun res!137733 () Bool)

(assert (=> b!165379 (=> res!137733 e!114451)))

(declare-fun lt!258647 () array!8419)

(declare-datatypes ((Unit!11490 0))(
  ( (Unit!11491) )
))
(declare-datatypes ((tuple2!14556 0))(
  ( (tuple2!14557 (_1!7869 Unit!11490) (_2!7869 BitStream!6674)) )
))
(declare-fun moveBitIndex!0 (BitStream!6674 (_ BitVec 64)) tuple2!14556)

(assert (=> b!165379 (= res!137733 (not (= (size!3759 (buf!4211 thiss!1577)) (size!3759 (buf!4211 (_2!7869 (moveBitIndex!0 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577)) ((_ sign_extend 32) nBits!511))))))))))

(declare-fun b!165380 () Bool)

(declare-fun e!114450 () Bool)

(declare-fun array_inv!3500 (array!8419) Bool)

(assert (=> b!165380 (= e!114450 (array_inv!3500 (buf!4211 thiss!1577)))))

(declare-fun b!165381 () Bool)

(assert (=> b!165381 (= e!114452 (not e!114451))))

(declare-fun res!137735 () Bool)

(assert (=> b!165381 (=> res!137735 e!114451)))

(declare-fun lt!258643 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165381 (= res!137735 (not (byteRangesEq!0 (select (arr!4680 (buf!4211 thiss!1577)) (currentByte!7887 thiss!1577)) lt!258643 #b00000000000000000000000000000000 (currentBit!7882 thiss!1577))))))

(declare-fun arrayRangesEq!639 (array!8419 array!8419 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165381 (arrayRangesEq!639 (buf!4211 thiss!1577) lt!258647 #b00000000000000000000000000000000 (currentByte!7887 thiss!1577))))

(declare-fun lt!258646 () Unit!11490)

(declare-fun arrayUpdatedAtPrefixLemma!247 (array!8419 (_ BitVec 32) (_ BitVec 8)) Unit!11490)

(assert (=> b!165381 (= lt!258646 (arrayUpdatedAtPrefixLemma!247 (buf!4211 thiss!1577) (currentByte!7887 thiss!1577) lt!258643))))

(assert (=> b!165381 (= lt!258647 (array!8420 (store (arr!4680 (buf!4211 thiss!1577)) (currentByte!7887 thiss!1577) lt!258643) (size!3759 (buf!4211 thiss!1577))))))

(declare-fun lt!258645 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165381 (= lt!258643 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4680 (buf!4211 thiss!1577)) (currentByte!7887 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7882 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258645)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258645))))))

(assert (=> b!165381 (= lt!258645 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7882 thiss!1577) nBits!511)))))

(declare-fun b!165377 () Bool)

(declare-fun res!137732 () Bool)

(assert (=> b!165377 (=> (not res!137732) (not e!114452))))

(assert (=> b!165377 (= res!137732 (bvsle (bvadd (currentBit!7882 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!137734 () Bool)

(assert (=> start!35324 (=> (not res!137734) (not e!114452))))

(assert (=> start!35324 (= res!137734 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35324 e!114452))

(assert (=> start!35324 true))

(declare-fun inv!12 (BitStream!6674) Bool)

(assert (=> start!35324 (and (inv!12 thiss!1577) e!114450)))

(assert (= (and start!35324 res!137734) b!165376))

(assert (= (and b!165376 res!137731) b!165377))

(assert (= (and b!165377 res!137732) b!165381))

(assert (= (and b!165381 (not res!137735)) b!165379))

(assert (= (and b!165379 (not res!137733)) b!165378))

(assert (= start!35324 b!165380))

(declare-fun m!262835 () Bool)

(assert (=> b!165379 m!262835))

(declare-fun m!262837 () Bool)

(assert (=> b!165378 m!262837))

(declare-fun m!262839 () Bool)

(assert (=> start!35324 m!262839))

(declare-fun m!262841 () Bool)

(assert (=> b!165381 m!262841))

(declare-fun m!262843 () Bool)

(assert (=> b!165381 m!262843))

(assert (=> b!165381 m!262843))

(declare-fun m!262845 () Bool)

(assert (=> b!165381 m!262845))

(declare-fun m!262847 () Bool)

(assert (=> b!165381 m!262847))

(declare-fun m!262849 () Bool)

(assert (=> b!165381 m!262849))

(declare-fun m!262851 () Bool)

(assert (=> b!165381 m!262851))

(declare-fun m!262853 () Bool)

(assert (=> b!165381 m!262853))

(declare-fun m!262855 () Bool)

(assert (=> b!165381 m!262855))

(declare-fun m!262857 () Bool)

(assert (=> b!165376 m!262857))

(declare-fun m!262859 () Bool)

(assert (=> b!165380 m!262859))

(push 1)

(assert (not b!165376))

(assert (not b!165378))

(assert (not b!165380))

(assert (not start!35324))

(assert (not b!165379))

(assert (not b!165381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57297 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57297 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3759 (buf!4211 thiss!1577))) ((_ sign_extend 32) (currentByte!7887 thiss!1577)) ((_ sign_extend 32) (currentBit!7882 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3759 (buf!4211 thiss!1577))) ((_ sign_extend 32) (currentByte!7887 thiss!1577)) ((_ sign_extend 32) (currentBit!7882 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14235 () Bool)

(assert (= bs!14235 d!57297))

(declare-fun m!262883 () Bool)

(assert (=> bs!14235 m!262883))

(assert (=> b!165376 d!57297))

(declare-fun d!57301 () Bool)

(assert (=> d!57301 (= (byteRangesEq!0 (select (arr!4680 (buf!4211 thiss!1577)) (currentByte!7887 thiss!1577)) lt!258643 #b00000000000000000000000000000000 (currentBit!7882 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7882 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4680 (buf!4211 thiss!1577)) (currentByte!7887 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7882 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258643) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7882 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14236 () Bool)

(assert (= bs!14236 d!57301))

(declare-fun m!262885 () Bool)

(assert (=> bs!14236 m!262885))

(declare-fun m!262887 () Bool)

(assert (=> bs!14236 m!262887))

(assert (=> b!165381 d!57301))

(declare-fun d!57303 () Bool)

(declare-fun res!137757 () Bool)

(declare-fun e!114475 () Bool)

(assert (=> d!57303 (=> res!137757 e!114475)))

(assert (=> d!57303 (= res!137757 (= #b00000000000000000000000000000000 (currentByte!7887 thiss!1577)))))

(assert (=> d!57303 (= (arrayRangesEq!639 (buf!4211 thiss!1577) lt!258647 #b00000000000000000000000000000000 (currentByte!7887 thiss!1577)) e!114475)))

(declare-fun b!165401 () Bool)

(declare-fun e!114476 () Bool)

(assert (=> b!165401 (= e!114475 e!114476)))

(declare-fun res!137758 () Bool)

(assert (=> b!165401 (=> (not res!137758) (not e!114476))))

(assert (=> b!165401 (= res!137758 (= (select (arr!4680 (buf!4211 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4680 lt!258647) #b00000000000000000000000000000000)))))

(declare-fun b!165402 () Bool)

(assert (=> b!165402 (= e!114476 (arrayRangesEq!639 (buf!4211 thiss!1577) lt!258647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7887 thiss!1577)))))

(assert (= (and d!57303 (not res!137757)) b!165401))

(assert (= (and b!165401 res!137758) b!165402))

(declare-fun m!262889 () Bool)

(assert (=> b!165401 m!262889))

(declare-fun m!262891 () Bool)

(assert (=> b!165401 m!262891))

(declare-fun m!262893 () Bool)

(assert (=> b!165402 m!262893))

(assert (=> b!165381 d!57303))

(declare-fun d!57305 () Bool)

(declare-fun e!114480 () Bool)

(assert (=> d!57305 e!114480))

(declare-fun res!137765 () Bool)

(assert (=> d!57305 (=> (not res!137765) (not e!114480))))

(assert (=> d!57305 (= res!137765 (and (bvsge (currentByte!7887 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7887 thiss!1577) (size!3759 (buf!4211 thiss!1577)))))))

(declare-fun lt!258690 () Unit!11490)

(declare-fun choose!222 (array!8419 (_ BitVec 32) (_ BitVec 8)) Unit!11490)

(assert (=> d!57305 (= lt!258690 (choose!222 (buf!4211 thiss!1577) (currentByte!7887 thiss!1577) lt!258643))))

(assert (=> d!57305 (and (bvsle #b00000000000000000000000000000000 (currentByte!7887 thiss!1577)) (bvslt (currentByte!7887 thiss!1577) (size!3759 (buf!4211 thiss!1577))))))

(assert (=> d!57305 (= (arrayUpdatedAtPrefixLemma!247 (buf!4211 thiss!1577) (currentByte!7887 thiss!1577) lt!258643) lt!258690)))

(declare-fun b!165411 () Bool)

(assert (=> b!165411 (= e!114480 (arrayRangesEq!639 (buf!4211 thiss!1577) (array!8420 (store (arr!4680 (buf!4211 thiss!1577)) (currentByte!7887 thiss!1577) lt!258643) (size!3759 (buf!4211 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7887 thiss!1577)))))

(assert (= (and d!57305 res!137765) b!165411))

(declare-fun m!262897 () Bool)

(assert (=> d!57305 m!262897))

(assert (=> b!165411 m!262849))

(declare-fun m!262899 () Bool)

(assert (=> b!165411 m!262899))

(assert (=> b!165381 d!57305))

(declare-fun d!57309 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57309 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7882 thiss!1577) (currentByte!7887 thiss!1577) (size!3759 (buf!4211 thiss!1577))))))

(declare-fun bs!14238 () Bool)

(assert (= bs!14238 d!57309))

(declare-fun m!262901 () Bool)

(assert (=> bs!14238 m!262901))

(assert (=> start!35324 d!57309))

(declare-fun d!57311 () Bool)

(declare-fun e!114489 () Bool)

(assert (=> d!57311 e!114489))

(declare-fun res!137776 () Bool)

(assert (=> d!57311 (=> (not res!137776) (not e!114489))))

(declare-fun lt!258721 () (_ BitVec 64))

(declare-fun lt!258723 () (_ BitVec 64))

(declare-fun lt!258722 () (_ BitVec 64))

(assert (=> d!57311 (= res!137776 (= lt!258723 (bvsub lt!258722 lt!258721)))))

(assert (=> d!57311 (or (= (bvand lt!258722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258721 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258722 lt!258721) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57311 (= lt!258721 (remainingBits!0 ((_ sign_extend 32) (size!3759 (buf!4211 thiss!1577))) ((_ sign_extend 32) (currentByte!7887 thiss!1577)) ((_ sign_extend 32) (currentBit!7882 thiss!1577))))))

(declare-fun lt!258725 () (_ BitVec 64))

(declare-fun lt!258726 () (_ BitVec 64))

(assert (=> d!57311 (= lt!258722 (bvmul lt!258725 lt!258726))))

(assert (=> d!57311 (or (= lt!258725 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!258726 (bvsdiv (bvmul lt!258725 lt!258726) lt!258725)))))

(assert (=> d!57311 (= lt!258726 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57311 (= lt!258725 ((_ sign_extend 32) (size!3759 (buf!4211 thiss!1577))))))

(assert (=> d!57311 (= lt!258723 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7887 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7882 thiss!1577))))))

(assert (=> d!57311 (invariant!0 (currentBit!7882 thiss!1577) (currentByte!7887 thiss!1577) (size!3759 (buf!4211 thiss!1577)))))

(assert (=> d!57311 (= (bitIndex!0 (size!3759 (buf!4211 thiss!1577)) (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577)) lt!258723)))

(declare-fun b!165422 () Bool)

(declare-fun res!137777 () Bool)

(assert (=> b!165422 (=> (not res!137777) (not e!114489))))

(assert (=> b!165422 (= res!137777 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!258723))))

(declare-fun b!165423 () Bool)

(declare-fun lt!258724 () (_ BitVec 64))

(assert (=> b!165423 (= e!114489 (bvsle lt!258723 (bvmul lt!258724 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165423 (or (= lt!258724 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!258724 #b0000000000000000000000000000000000000000000000000000000000001000) lt!258724)))))

(assert (=> b!165423 (= lt!258724 ((_ sign_extend 32) (size!3759 (buf!4211 thiss!1577))))))

(assert (= (and d!57311 res!137776) b!165422))

(assert (= (and b!165422 res!137777) b!165423))

(assert (=> d!57311 m!262883))

(assert (=> d!57311 m!262901))

(assert (=> b!165378 d!57311))

(declare-fun d!57315 () Bool)

(declare-fun lt!258760 () (_ BitVec 32))

(assert (=> d!57315 (= lt!258760 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!258762 () (_ BitVec 32))

(assert (=> d!57315 (= lt!258762 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114507 () Bool)

(assert (=> d!57315 e!114507))

(declare-fun res!137798 () Bool)

(assert (=> d!57315 (=> (not res!137798) (not e!114507))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6674 (_ BitVec 64)) Bool)

(assert (=> d!57315 (= res!137798 (moveBitIndexPrecond!0 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11504 () Unit!11490)

(declare-fun Unit!11505 () Unit!11490)

(declare-fun Unit!11506 () Unit!11490)

(assert (=> d!57315 (= (moveBitIndex!0 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258760) #b00000000000000000000000000000000) (tuple2!14557 Unit!11504 (BitStream!6675 (buf!4211 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) (bvsub (bvadd (currentByte!7887 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258762) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!258760 (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258760) #b00000000000000000000000000001000) (tuple2!14557 Unit!11505 (BitStream!6675 (buf!4211 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) (bvadd (currentByte!7887 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258762 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258760) #b00000000000000000000000000001000))) (tuple2!14557 Unit!11506 (BitStream!6675 (buf!4211 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) (bvadd (currentByte!7887 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258762) (bvadd (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258760))))))))

(declare-fun b!165443 () Bool)

(declare-fun e!114506 () Bool)

(assert (=> b!165443 (= e!114507 e!114506)))

(declare-fun res!137797 () Bool)

(assert (=> b!165443 (=> (not res!137797) (not e!114506))))

(declare-fun lt!258765 () (_ BitVec 64))

(declare-fun lt!258763 () tuple2!14556)

(assert (=> b!165443 (= res!137797 (= (bvadd lt!258765 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3759 (buf!4211 (_2!7869 lt!258763))) (currentByte!7887 (_2!7869 lt!258763)) (currentBit!7882 (_2!7869 lt!258763)))))))

(assert (=> b!165443 (or (not (= (bvand lt!258765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!258765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!258765 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165443 (= lt!258765 (bitIndex!0 (size!3759 (buf!4211 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577)))) (currentByte!7887 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577)))))))

(declare-fun lt!258761 () (_ BitVec 32))

(declare-fun lt!258764 () (_ BitVec 32))

(declare-fun Unit!11507 () Unit!11490)

(declare-fun Unit!11508 () Unit!11490)

(declare-fun Unit!11509 () Unit!11490)

(assert (=> b!165443 (= lt!258763 (ite (bvslt (bvadd (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258761) #b00000000000000000000000000000000) (tuple2!14557 Unit!11507 (BitStream!6675 (buf!4211 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) (bvsub (bvadd (currentByte!7887 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258764) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!258761 (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258761) #b00000000000000000000000000001000) (tuple2!14557 Unit!11508 (BitStream!6675 (buf!4211 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) (bvadd (currentByte!7887 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258764 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258761) #b00000000000000000000000000001000))) (tuple2!14557 Unit!11509 (BitStream!6675 (buf!4211 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) (bvadd (currentByte!7887 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258764) (bvadd (currentBit!7882 (BitStream!6675 lt!258647 (currentByte!7887 thiss!1577) (currentBit!7882 thiss!1577))) lt!258761))))))))

