; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31542 () Bool)

(assert start!31542)

(declare-fun b!158023 () Bool)

(declare-fun e!107274 () Bool)

(declare-fun e!107269 () Bool)

(assert (=> b!158023 (= e!107274 e!107269)))

(declare-fun res!132018 () Bool)

(assert (=> b!158023 (=> (not res!132018) (not e!107269))))

(declare-fun lt!248923 () (_ BitVec 64))

(assert (=> b!158023 (= res!132018 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 lt!248923))))

(declare-datatypes ((array!7333 0))(
  ( (array!7334 (arr!4223 (Array (_ BitVec 32) (_ BitVec 8))) (size!3318 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5828 0))(
  ( (BitStream!5829 (buf!3788 array!7333) (currentByte!6959 (_ BitVec 32)) (currentBit!6954 (_ BitVec 32))) )
))
(declare-fun lt!248927 () BitStream!5828)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!158023 (= lt!248923 (bitIndex!0 (size!3318 (buf!3788 lt!248927)) (currentByte!6959 lt!248927) (currentBit!6954 lt!248927)))))

(declare-fun b!158024 () Bool)

(declare-fun e!107271 () Bool)

(assert (=> b!158024 (= e!107271 e!107274)))

(declare-fun res!132016 () Bool)

(assert (=> b!158024 (=> (not res!132016) (not e!107274))))

(declare-fun bs!65 () BitStream!5828)

(assert (=> b!158024 (= res!132016 (= (size!3318 (buf!3788 bs!65)) (size!3318 (buf!3788 lt!248927))))))

(declare-datatypes ((tuple2!14366 0))(
  ( (tuple2!14367 (_1!7642 BitStream!5828) (_2!7642 (_ BitVec 8))) )
))
(declare-fun lt!248924 () tuple2!14366)

(declare-fun readBytePure!0 (BitStream!5828) tuple2!14366)

(assert (=> b!158024 (= lt!248924 (readBytePure!0 lt!248927))))

(declare-fun b!158025 () Bool)

(assert (=> b!158025 (= e!107269 (not (= lt!248923 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3318 (buf!3788 bs!65)) (currentByte!6959 bs!65) (currentBit!6954 bs!65))))))))

(declare-fun b!158026 () Bool)

(declare-fun res!132020 () Bool)

(declare-fun e!107275 () Bool)

(assert (=> b!158026 (=> (not res!132020) (not e!107275))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158026 (= res!132020 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3318 (buf!3788 bs!65))) ((_ sign_extend 32) (currentByte!6959 bs!65)) ((_ sign_extend 32) (currentBit!6954 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158027 () Bool)

(declare-fun e!107270 () Bool)

(declare-fun array_inv!3077 (array!7333) Bool)

(assert (=> b!158027 (= e!107270 (array_inv!3077 (buf!3788 bs!65)))))

(declare-fun res!132017 () Bool)

(assert (=> start!31542 (=> (not res!132017) (not e!107275))))

(declare-fun arr!153 () array!7333)

(assert (=> start!31542 (= res!132017 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3318 arr!153))))))

(assert (=> start!31542 e!107275))

(assert (=> start!31542 true))

(assert (=> start!31542 (array_inv!3077 arr!153)))

(declare-fun inv!12 (BitStream!5828) Bool)

(assert (=> start!31542 (and (inv!12 bs!65) e!107270)))

(declare-fun b!158022 () Bool)

(assert (=> b!158022 (= e!107275 e!107271)))

(declare-fun res!132019 () Bool)

(assert (=> b!158022 (=> (not res!132019) (not e!107271))))

(assert (=> b!158022 (= res!132019 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14368 0))(
  ( (tuple2!14369 (_1!7643 BitStream!5828) (_2!7643 array!7333)) )
))
(declare-fun lt!248926 () tuple2!14368)

(declare-fun readByteArrayLoopPure!0 (BitStream!5828 array!7333 (_ BitVec 32) (_ BitVec 32)) tuple2!14368)

(assert (=> b!158022 (= lt!248926 (readByteArrayLoopPure!0 lt!248927 (array!7334 (store (arr!4223 arr!153) from!240 (_2!7642 (readBytePure!0 bs!65))) (size!3318 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5828 (_ BitVec 32)) BitStream!5828)

(assert (=> b!158022 (= lt!248927 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248925 () tuple2!14368)

(assert (=> b!158022 (= lt!248925 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31542 res!132017) b!158026))

(assert (= (and b!158026 res!132020) b!158022))

(assert (= (and b!158022 res!132019) b!158024))

(assert (= (and b!158024 res!132016) b!158023))

(assert (= (and b!158023 res!132018) b!158025))

(assert (= start!31542 b!158027))

(declare-fun m!247695 () Bool)

(assert (=> b!158025 m!247695))

(declare-fun m!247697 () Bool)

(assert (=> b!158026 m!247697))

(declare-fun m!247699 () Bool)

(assert (=> b!158023 m!247699))

(declare-fun m!247701 () Bool)

(assert (=> b!158024 m!247701))

(declare-fun m!247703 () Bool)

(assert (=> start!31542 m!247703))

(declare-fun m!247705 () Bool)

(assert (=> start!31542 m!247705))

(declare-fun m!247707 () Bool)

(assert (=> b!158022 m!247707))

(declare-fun m!247709 () Bool)

(assert (=> b!158022 m!247709))

(declare-fun m!247711 () Bool)

(assert (=> b!158022 m!247711))

(declare-fun m!247713 () Bool)

(assert (=> b!158022 m!247713))

(declare-fun m!247715 () Bool)

(assert (=> b!158022 m!247715))

(declare-fun m!247717 () Bool)

(assert (=> b!158027 m!247717))

(push 1)

(assert (not b!158026))

(assert (not b!158024))

(assert (not b!158025))

(assert (not start!31542))

(assert (not b!158022))

(assert (not b!158023))

(assert (not b!158027))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52834 () Bool)

(assert (=> d!52834 (= (array_inv!3077 arr!153) (bvsge (size!3318 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31542 d!52834))

(declare-fun d!52836 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52836 (= (inv!12 bs!65) (invariant!0 (currentBit!6954 bs!65) (currentByte!6959 bs!65) (size!3318 (buf!3788 bs!65))))))

(declare-fun bs!13006 () Bool)

(assert (= bs!13006 d!52836))

(declare-fun m!247721 () Bool)

(assert (=> bs!13006 m!247721))

(assert (=> start!31542 d!52836))

(declare-fun d!52838 () Bool)

(declare-datatypes ((Unit!10529 0))(
  ( (Unit!10530) )
))
(declare-datatypes ((tuple3!686 0))(
  ( (tuple3!687 (_1!7647 Unit!10529) (_2!7647 BitStream!5828) (_3!460 array!7333)) )
))
(declare-fun lt!248937 () tuple3!686)

(declare-fun readByteArrayLoop!0 (BitStream!5828 array!7333 (_ BitVec 32) (_ BitVec 32)) tuple3!686)

(assert (=> d!52838 (= lt!248937 (readByteArrayLoop!0 lt!248927 (array!7334 (store (arr!4223 arr!153) from!240 (_2!7642 (readBytePure!0 bs!65))) (size!3318 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52838 (= (readByteArrayLoopPure!0 lt!248927 (array!7334 (store (arr!4223 arr!153) from!240 (_2!7642 (readBytePure!0 bs!65))) (size!3318 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14369 (_2!7647 lt!248937) (_3!460 lt!248937)))))

(declare-fun bs!13011 () Bool)

(assert (= bs!13011 d!52838))

(declare-fun m!247731 () Bool)

(assert (=> bs!13011 m!247731))

(assert (=> b!158022 d!52838))

(declare-fun d!52848 () Bool)

(declare-datatypes ((tuple2!14374 0))(
  ( (tuple2!14375 (_1!7648 (_ BitVec 8)) (_2!7648 BitStream!5828)) )
))
(declare-fun lt!248940 () tuple2!14374)

(declare-fun readByte!0 (BitStream!5828) tuple2!14374)

(assert (=> d!52848 (= lt!248940 (readByte!0 bs!65))))

(assert (=> d!52848 (= (readBytePure!0 bs!65) (tuple2!14367 (_2!7648 lt!248940) (_1!7648 lt!248940)))))

(declare-fun bs!13012 () Bool)

(assert (= bs!13012 d!52848))

(declare-fun m!247733 () Bool)

(assert (=> bs!13012 m!247733))

(assert (=> b!158022 d!52848))

(declare-fun d!52850 () Bool)

(declare-datatypes ((tuple2!14376 0))(
  ( (tuple2!14377 (_1!7649 Unit!10529) (_2!7649 BitStream!5828)) )
))
(declare-fun moveByteIndex!0 (BitStream!5828 (_ BitVec 32)) tuple2!14376)

(assert (=> d!52850 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7649 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!13013 () Bool)

(assert (= bs!13013 d!52850))

(declare-fun m!247735 () Bool)

(assert (=> bs!13013 m!247735))

(assert (=> b!158022 d!52850))

(declare-fun d!52852 () Bool)

(declare-fun lt!248941 () tuple3!686)

(assert (=> d!52852 (= lt!248941 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52852 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14369 (_2!7647 lt!248941) (_3!460 lt!248941)))))

(declare-fun bs!13014 () Bool)

(assert (= bs!13014 d!52852))

(declare-fun m!247737 () Bool)

(assert (=> bs!13014 m!247737))

(assert (=> b!158022 d!52852))

(declare-fun d!52854 () Bool)

(assert (=> d!52854 (= (array_inv!3077 (buf!3788 bs!65)) (bvsge (size!3318 (buf!3788 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!158027 d!52854))

(declare-fun d!52856 () Bool)

(declare-fun e!107282 () Bool)

(assert (=> d!52856 e!107282))

(declare-fun res!132034 () Bool)

(assert (=> d!52856 (=> (not res!132034) (not e!107282))))

(declare-fun lt!248980 () (_ BitVec 64))

(declare-fun lt!248983 () (_ BitVec 64))

(declare-fun lt!248984 () (_ BitVec 64))

(assert (=> d!52856 (= res!132034 (= lt!248984 (bvsub lt!248983 lt!248980)))))

(assert (=> d!52856 (or (= (bvand lt!248983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!248983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!248983 lt!248980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52856 (= lt!248980 (remainingBits!0 ((_ sign_extend 32) (size!3318 (buf!3788 lt!248927))) ((_ sign_extend 32) (currentByte!6959 lt!248927)) ((_ sign_extend 32) (currentBit!6954 lt!248927))))))

(declare-fun lt!248981 () (_ BitVec 64))

(declare-fun lt!248979 () (_ BitVec 64))

(assert (=> d!52856 (= lt!248983 (bvmul lt!248981 lt!248979))))

(assert (=> d!52856 (or (= lt!248981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!248979 (bvsdiv (bvmul lt!248981 lt!248979) lt!248981)))))

(assert (=> d!52856 (= lt!248979 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!52856 (= lt!248981 ((_ sign_extend 32) (size!3318 (buf!3788 lt!248927))))))

(assert (=> d!52856 (= lt!248984 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6959 lt!248927)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6954 lt!248927))))))

(assert (=> d!52856 (invariant!0 (currentBit!6954 lt!248927) (currentByte!6959 lt!248927) (size!3318 (buf!3788 lt!248927)))))

(assert (=> d!52856 (= (bitIndex!0 (size!3318 (buf!3788 lt!248927)) (currentByte!6959 lt!248927) (currentBit!6954 lt!248927)) lt!248984)))

(declare-fun b!158040 () Bool)

(declare-fun res!132033 () Bool)

(assert (=> b!158040 (=> (not res!132033) (not e!107282))))

(assert (=> b!158040 (= res!132033 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!248984))))

(declare-fun b!158041 () Bool)

(declare-fun lt!248982 () (_ BitVec 64))

(assert (=> b!158041 (= e!107282 (bvsle lt!248984 (bvmul lt!248982 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!158041 (or (= lt!248982 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248982 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248982)))))

(assert (=> b!158041 (= lt!248982 ((_ sign_extend 32) (size!3318 (buf!3788 lt!248927))))))

(assert (= (and d!52856 res!132034) b!158040))

(assert (= (and b!158040 res!132033) b!158041))

(declare-fun m!247747 () Bool)

(assert (=> d!52856 m!247747))

(declare-fun m!247749 () Bool)

(assert (=> d!52856 m!247749))

(assert (=> b!158023 d!52856))

(declare-fun d!52866 () Bool)

(declare-fun e!107283 () Bool)

(assert (=> d!52866 e!107283))

(declare-fun res!132036 () Bool)

(assert (=> d!52866 (=> (not res!132036) (not e!107283))))

(declare-fun lt!248986 () (_ BitVec 64))

(declare-fun lt!248989 () (_ BitVec 64))

(declare-fun lt!248990 () (_ BitVec 64))

(assert (=> d!52866 (= res!132036 (= lt!248990 (bvsub lt!248989 lt!248986)))))

(assert (=> d!52866 (or (= (bvand lt!248989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248986 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!248989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!248989 lt!248986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52866 (= lt!248986 (remainingBits!0 ((_ sign_extend 32) (size!3318 (buf!3788 bs!65))) ((_ sign_extend 32) (currentByte!6959 bs!65)) ((_ sign_extend 32) (currentBit!6954 bs!65))))))

(declare-fun lt!248987 () (_ BitVec 64))

(declare-fun lt!248985 () (_ BitVec 64))

(assert (=> d!52866 (= lt!248989 (bvmul lt!248987 lt!248985))))

(assert (=> d!52866 (or (= lt!248987 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!248985 (bvsdiv (bvmul lt!248987 lt!248985) lt!248987)))))

(assert (=> d!52866 (= lt!248985 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!52866 (= lt!248987 ((_ sign_extend 32) (size!3318 (buf!3788 bs!65))))))

(assert (=> d!52866 (= lt!248990 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6959 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6954 bs!65))))))

(assert (=> d!52866 (invariant!0 (currentBit!6954 bs!65) (currentByte!6959 bs!65) (size!3318 (buf!3788 bs!65)))))

(assert (=> d!52866 (= (bitIndex!0 (size!3318 (buf!3788 bs!65)) (currentByte!6959 bs!65) (currentBit!6954 bs!65)) lt!248990)))

(declare-fun b!158042 () Bool)

(declare-fun res!132035 () Bool)

(assert (=> b!158042 (=> (not res!132035) (not e!107283))))

(assert (=> b!158042 (= res!132035 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!248990))))

(declare-fun b!158043 () Bool)

(declare-fun lt!248988 () (_ BitVec 64))

(assert (=> b!158043 (= e!107283 (bvsle lt!248990 (bvmul lt!248988 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!158043 (or (= lt!248988 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248988 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248988)))))

(assert (=> b!158043 (= lt!248988 ((_ sign_extend 32) (size!3318 (buf!3788 bs!65))))))

(assert (= (and d!52866 res!132036) b!158042))

(assert (= (and b!158042 res!132035) b!158043))

(declare-fun m!247751 () Bool)

(assert (=> d!52866 m!247751))

(assert (=> d!52866 m!247721))

(assert (=> b!158025 d!52866))

(declare-fun d!52868 () Bool)

(declare-fun lt!248991 () tuple2!14374)

(assert (=> d!52868 (= lt!248991 (readByte!0 lt!248927))))

(assert (=> d!52868 (= (readBytePure!0 lt!248927) (tuple2!14367 (_2!7648 lt!248991) (_1!7648 lt!248991)))))

(declare-fun bs!13017 () Bool)

(assert (= bs!13017 d!52868))

(declare-fun m!247753 () Bool)

(assert (=> bs!13017 m!247753))

(assert (=> b!158024 d!52868))

(declare-fun d!52870 () Bool)

(assert (=> d!52870 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3318 (buf!3788 bs!65))) ((_ sign_extend 32) (currentByte!6959 bs!65)) ((_ sign_extend 32) (currentBit!6954 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3318 (buf!3788 bs!65))) ((_ sign_extend 32) (currentByte!6959 bs!65)) ((_ sign_extend 32) (currentBit!6954 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13018 () Bool)

(assert (= bs!13018 d!52870))

(assert (=> bs!13018 m!247751))

(assert (=> b!158026 d!52870))

(push 1)

(assert (not d!52868))

(assert (not d!52838))

(assert (not d!52866))

(assert (not d!52852))

(assert (not d!52850))

(assert (not d!52848))

(assert (not d!52836))

(assert (not d!52856))

(assert (not d!52870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

