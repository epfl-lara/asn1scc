; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31538 () Bool)

(assert start!31538)

(declare-fun b!157986 () Bool)

(declare-fun e!107227 () Bool)

(declare-fun e!107231 () Bool)

(assert (=> b!157986 (= e!107227 e!107231)))

(declare-fun res!131987 () Bool)

(assert (=> b!157986 (=> (not res!131987) (not e!107231))))

(declare-datatypes ((array!7329 0))(
  ( (array!7330 (arr!4221 (Array (_ BitVec 32) (_ BitVec 8))) (size!3316 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5824 0))(
  ( (BitStream!5825 (buf!3786 array!7329) (currentByte!6957 (_ BitVec 32)) (currentBit!6952 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5824)

(declare-fun lt!248896 () BitStream!5824)

(assert (=> b!157986 (= res!131987 (= (size!3316 (buf!3786 bs!65)) (size!3316 (buf!3786 lt!248896))))))

(declare-datatypes ((tuple2!14358 0))(
  ( (tuple2!14359 (_1!7638 BitStream!5824) (_2!7638 (_ BitVec 8))) )
))
(declare-fun lt!248893 () tuple2!14358)

(declare-fun readBytePure!0 (BitStream!5824) tuple2!14358)

(assert (=> b!157986 (= lt!248893 (readBytePure!0 lt!248896))))

(declare-fun b!157987 () Bool)

(declare-fun e!107228 () Bool)

(assert (=> b!157987 (= e!107231 e!107228)))

(declare-fun res!131989 () Bool)

(assert (=> b!157987 (=> (not res!131989) (not e!107228))))

(declare-fun lt!248894 () (_ BitVec 64))

(assert (=> b!157987 (= res!131989 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 lt!248894))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157987 (= lt!248894 (bitIndex!0 (size!3316 (buf!3786 lt!248896)) (currentByte!6957 lt!248896) (currentBit!6952 lt!248896)))))

(declare-fun res!131990 () Bool)

(declare-fun e!107229 () Bool)

(assert (=> start!31538 (=> (not res!131990) (not e!107229))))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7329)

(declare-fun from!240 () (_ BitVec 32))

(assert (=> start!31538 (= res!131990 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3316 arr!153))))))

(assert (=> start!31538 e!107229))

(assert (=> start!31538 true))

(declare-fun array_inv!3075 (array!7329) Bool)

(assert (=> start!31538 (array_inv!3075 arr!153)))

(declare-fun e!107233 () Bool)

(declare-fun inv!12 (BitStream!5824) Bool)

(assert (=> start!31538 (and (inv!12 bs!65) e!107233)))

(declare-fun b!157988 () Bool)

(assert (=> b!157988 (= e!107233 (array_inv!3075 (buf!3786 bs!65)))))

(declare-fun b!157989 () Bool)

(assert (=> b!157989 (= e!107229 e!107227)))

(declare-fun res!131986 () Bool)

(assert (=> b!157989 (=> (not res!131986) (not e!107227))))

(assert (=> b!157989 (= res!131986 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14360 0))(
  ( (tuple2!14361 (_1!7639 BitStream!5824) (_2!7639 array!7329)) )
))
(declare-fun lt!248895 () tuple2!14360)

(declare-fun readByteArrayLoopPure!0 (BitStream!5824 array!7329 (_ BitVec 32) (_ BitVec 32)) tuple2!14360)

(assert (=> b!157989 (= lt!248895 (readByteArrayLoopPure!0 lt!248896 (array!7330 (store (arr!4221 arr!153) from!240 (_2!7638 (readBytePure!0 bs!65))) (size!3316 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5824 (_ BitVec 32)) BitStream!5824)

(assert (=> b!157989 (= lt!248896 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248897 () tuple2!14360)

(assert (=> b!157989 (= lt!248897 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157990 () Bool)

(assert (=> b!157990 (= e!107228 (not (= lt!248894 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3316 (buf!3786 bs!65)) (currentByte!6957 bs!65) (currentBit!6952 bs!65))))))))

(declare-fun b!157991 () Bool)

(declare-fun res!131988 () Bool)

(assert (=> b!157991 (=> (not res!131988) (not e!107229))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157991 (= res!131988 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3316 (buf!3786 bs!65))) ((_ sign_extend 32) (currentByte!6957 bs!65)) ((_ sign_extend 32) (currentBit!6952 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31538 res!131990) b!157991))

(assert (= (and b!157991 res!131988) b!157989))

(assert (= (and b!157989 res!131986) b!157986))

(assert (= (and b!157986 res!131987) b!157987))

(assert (= (and b!157987 res!131989) b!157990))

(assert (= start!31538 b!157988))

(declare-fun m!247647 () Bool)

(assert (=> b!157987 m!247647))

(declare-fun m!247649 () Bool)

(assert (=> b!157988 m!247649))

(declare-fun m!247651 () Bool)

(assert (=> b!157990 m!247651))

(declare-fun m!247653 () Bool)

(assert (=> b!157986 m!247653))

(declare-fun m!247655 () Bool)

(assert (=> start!31538 m!247655))

(declare-fun m!247657 () Bool)

(assert (=> start!31538 m!247657))

(declare-fun m!247659 () Bool)

(assert (=> b!157989 m!247659))

(declare-fun m!247661 () Bool)

(assert (=> b!157989 m!247661))

(declare-fun m!247663 () Bool)

(assert (=> b!157989 m!247663))

(declare-fun m!247665 () Bool)

(assert (=> b!157989 m!247665))

(declare-fun m!247667 () Bool)

(assert (=> b!157989 m!247667))

(declare-fun m!247669 () Bool)

(assert (=> b!157991 m!247669))

(push 1)

(assert (not b!157988))

(assert (not b!157989))

(assert (not start!31538))

(assert (not b!157990))

(assert (not b!157986))

(assert (not b!157991))

(assert (not b!157987))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52828 () Bool)

(assert (=> d!52828 (= (array_inv!3075 (buf!3786 bs!65)) (bvsge (size!3316 (buf!3786 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157988 d!52828))

(declare-fun d!52830 () Bool)

(declare-datatypes ((Unit!10527 0))(
  ( (Unit!10528) )
))
(declare-datatypes ((tuple3!684 0))(
  ( (tuple3!685 (_1!7644 Unit!10527) (_2!7644 BitStream!5824) (_3!459 array!7329)) )
))
(declare-fun lt!248930 () tuple3!684)

(declare-fun readByteArrayLoop!0 (BitStream!5824 array!7329 (_ BitVec 32) (_ BitVec 32)) tuple3!684)

(assert (=> d!52830 (= lt!248930 (readByteArrayLoop!0 lt!248896 (array!7330 (store (arr!4221 arr!153) from!240 (_2!7638 (readBytePure!0 bs!65))) (size!3316 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52830 (= (readByteArrayLoopPure!0 lt!248896 (array!7330 (store (arr!4221 arr!153) from!240 (_2!7638 (readBytePure!0 bs!65))) (size!3316 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14361 (_2!7644 lt!248930) (_3!459 lt!248930)))))

(declare-fun bs!13005 () Bool)

(assert (= bs!13005 d!52830))

(declare-fun m!247719 () Bool)

(assert (=> bs!13005 m!247719))

(assert (=> b!157989 d!52830))

(declare-fun d!52832 () Bool)

(declare-datatypes ((tuple2!14370 0))(
  ( (tuple2!14371 (_1!7645 (_ BitVec 8)) (_2!7645 BitStream!5824)) )
))
(declare-fun lt!248933 () tuple2!14370)

(declare-fun readByte!0 (BitStream!5824) tuple2!14370)

(assert (=> d!52832 (= lt!248933 (readByte!0 bs!65))))

(assert (=> d!52832 (= (readBytePure!0 bs!65) (tuple2!14359 (_2!7645 lt!248933) (_1!7645 lt!248933)))))

(declare-fun bs!13007 () Bool)

(assert (= bs!13007 d!52832))

(declare-fun m!247723 () Bool)

(assert (=> bs!13007 m!247723))

(assert (=> b!157989 d!52832))

(declare-fun d!52840 () Bool)

(declare-datatypes ((tuple2!14372 0))(
  ( (tuple2!14373 (_1!7646 Unit!10527) (_2!7646 BitStream!5824)) )
))
(declare-fun moveByteIndex!0 (BitStream!5824 (_ BitVec 32)) tuple2!14372)

(assert (=> d!52840 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7646 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!13008 () Bool)

(assert (= bs!13008 d!52840))

(declare-fun m!247725 () Bool)

(assert (=> bs!13008 m!247725))

(assert (=> b!157989 d!52840))

(declare-fun d!52842 () Bool)

(declare-fun lt!248934 () tuple3!684)

(assert (=> d!52842 (= lt!248934 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52842 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14361 (_2!7644 lt!248934) (_3!459 lt!248934)))))

(declare-fun bs!13009 () Bool)

(assert (= bs!13009 d!52842))

(declare-fun m!247727 () Bool)

(assert (=> bs!13009 m!247727))

(assert (=> b!157989 d!52842))

(declare-fun d!52844 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52844 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3316 (buf!3786 bs!65))) ((_ sign_extend 32) (currentByte!6957 bs!65)) ((_ sign_extend 32) (currentBit!6952 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3316 (buf!3786 bs!65))) ((_ sign_extend 32) (currentByte!6957 bs!65)) ((_ sign_extend 32) (currentBit!6952 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13010 () Bool)

(assert (= bs!13010 d!52844))

(declare-fun m!247729 () Bool)

(assert (=> bs!13010 m!247729))

(assert (=> b!157991 d!52844))

(declare-fun d!52846 () Bool)

(declare-fun e!107278 () Bool)

(assert (=> d!52846 e!107278))

(declare-fun res!132025 () Bool)

(assert (=> d!52846 (=> (not res!132025) (not e!107278))))

(declare-fun lt!248958 () (_ BitVec 64))

(declare-fun lt!248954 () (_ BitVec 64))

(declare-fun lt!248956 () (_ BitVec 64))

(assert (=> d!52846 (= res!132025 (= lt!248954 (bvsub lt!248958 lt!248956)))))

(assert (=> d!52846 (or (= (bvand lt!248958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!248958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!248958 lt!248956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52846 (= lt!248956 (remainingBits!0 ((_ sign_extend 32) (size!3316 (buf!3786 bs!65))) ((_ sign_extend 32) (currentByte!6957 bs!65)) ((_ sign_extend 32) (currentBit!6952 bs!65))))))

(declare-fun lt!248957 () (_ BitVec 64))

(declare-fun lt!248955 () (_ BitVec 64))

(assert (=> d!52846 (= lt!248958 (bvmul lt!248957 lt!248955))))

(assert (=> d!52846 (or (= lt!248957 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!248955 (bvsdiv (bvmul lt!248957 lt!248955) lt!248957)))))

(assert (=> d!52846 (= lt!248955 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!52846 (= lt!248957 ((_ sign_extend 32) (size!3316 (buf!3786 bs!65))))))

(assert (=> d!52846 (= lt!248954 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6957 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6952 bs!65))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52846 (invariant!0 (currentBit!6952 bs!65) (currentByte!6957 bs!65) (size!3316 (buf!3786 bs!65)))))

(assert (=> d!52846 (= (bitIndex!0 (size!3316 (buf!3786 bs!65)) (currentByte!6957 bs!65) (currentBit!6952 bs!65)) lt!248954)))

(declare-fun b!158032 () Bool)

(declare-fun res!132026 () Bool)

(assert (=> b!158032 (=> (not res!132026) (not e!107278))))

(assert (=> b!158032 (= res!132026 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!248954))))

(declare-fun b!158033 () Bool)

(declare-fun lt!248959 () (_ BitVec 64))

(assert (=> b!158033 (= e!107278 (bvsle lt!248954 (bvmul lt!248959 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!158033 (or (= lt!248959 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248959 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248959)))))

(assert (=> b!158033 (= lt!248959 ((_ sign_extend 32) (size!3316 (buf!3786 bs!65))))))

(assert (= (and d!52846 res!132025) b!158032))

(assert (= (and b!158032 res!132026) b!158033))

(assert (=> d!52846 m!247729))

(declare-fun m!247739 () Bool)

(assert (=> d!52846 m!247739))

(assert (=> b!157990 d!52846))

(declare-fun d!52858 () Bool)

(declare-fun e!107279 () Bool)

(assert (=> d!52858 e!107279))

(declare-fun res!132027 () Bool)

(assert (=> d!52858 (=> (not res!132027) (not e!107279))))

(declare-fun lt!248962 () (_ BitVec 64))

(declare-fun lt!248964 () (_ BitVec 64))

(declare-fun lt!248960 () (_ BitVec 64))

(assert (=> d!52858 (= res!132027 (= lt!248960 (bvsub lt!248964 lt!248962)))))

(assert (=> d!52858 (or (= (bvand lt!248964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248962 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!248964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!248964 lt!248962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52858 (= lt!248962 (remainingBits!0 ((_ sign_extend 32) (size!3316 (buf!3786 lt!248896))) ((_ sign_extend 32) (currentByte!6957 lt!248896)) ((_ sign_extend 32) (currentBit!6952 lt!248896))))))

(declare-fun lt!248963 () (_ BitVec 64))

(declare-fun lt!248961 () (_ BitVec 64))

(assert (=> d!52858 (= lt!248964 (bvmul lt!248963 lt!248961))))

(assert (=> d!52858 (or (= lt!248963 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!248961 (bvsdiv (bvmul lt!248963 lt!248961) lt!248963)))))

(assert (=> d!52858 (= lt!248961 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!52858 (= lt!248963 ((_ sign_extend 32) (size!3316 (buf!3786 lt!248896))))))

(assert (=> d!52858 (= lt!248960 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6957 lt!248896)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6952 lt!248896))))))

(assert (=> d!52858 (invariant!0 (currentBit!6952 lt!248896) (currentByte!6957 lt!248896) (size!3316 (buf!3786 lt!248896)))))

(assert (=> d!52858 (= (bitIndex!0 (size!3316 (buf!3786 lt!248896)) (currentByte!6957 lt!248896) (currentBit!6952 lt!248896)) lt!248960)))

(declare-fun b!158034 () Bool)

(declare-fun res!132028 () Bool)

(assert (=> b!158034 (=> (not res!132028) (not e!107279))))

(assert (=> b!158034 (= res!132028 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!248960))))

(declare-fun b!158035 () Bool)

(declare-fun lt!248965 () (_ BitVec 64))

(assert (=> b!158035 (= e!107279 (bvsle lt!248960 (bvmul lt!248965 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!158035 (or (= lt!248965 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248965 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248965)))))

(assert (=> b!158035 (= lt!248965 ((_ sign_extend 32) (size!3316 (buf!3786 lt!248896))))))

(assert (= (and d!52858 res!132027) b!158034))

(assert (= (and b!158034 res!132028) b!158035))

(declare-fun m!247741 () Bool)

(assert (=> d!52858 m!247741))

(declare-fun m!247743 () Bool)

(assert (=> d!52858 m!247743))

(assert (=> b!157987 d!52858))

(declare-fun d!52860 () Bool)

(assert (=> d!52860 (= (array_inv!3075 arr!153) (bvsge (size!3316 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31538 d!52860))

(declare-fun d!52862 () Bool)

(assert (=> d!52862 (= (inv!12 bs!65) (invariant!0 (currentBit!6952 bs!65) (currentByte!6957 bs!65) (size!3316 (buf!3786 bs!65))))))

(declare-fun bs!13015 () Bool)

(assert (= bs!13015 d!52862))

(assert (=> bs!13015 m!247739))

(assert (=> start!31538 d!52862))

(declare-fun d!52864 () Bool)

(declare-fun lt!248966 () tuple2!14370)

(assert (=> d!52864 (= lt!248966 (readByte!0 lt!248896))))

(assert (=> d!52864 (= (readBytePure!0 lt!248896) (tuple2!14359 (_2!7645 lt!248966) (_1!7645 lt!248966)))))

(declare-fun bs!13016 () Bool)

(assert (= bs!13016 d!52864))

(declare-fun m!247745 () Bool)

(assert (=> bs!13016 m!247745))

(assert (=> b!157986 d!52864))

(push 1)

(assert (not d!52830))

(assert (not d!52844))

(assert (not d!52864))

(assert (not d!52840))

(assert (not d!52832))

(assert (not d!52858))

(assert (not d!52846))

(assert (not d!52842))

(assert (not d!52862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

