; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38442 () Bool)

(assert start!38442)

(declare-fun b!172641 () Bool)

(declare-fun res!142988 () Bool)

(declare-fun e!120638 () Bool)

(assert (=> b!172641 (=> (not res!142988) (not e!120638))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9281 0))(
  ( (array!9282 (arr!5026 (Array (_ BitVec 32) (_ BitVec 8))) (size!4096 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7300 0))(
  ( (BitStream!7301 (buf!4524 array!9281) (currentByte!8602 (_ BitVec 32)) (currentBit!8597 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12339 0))(
  ( (Unit!12340) )
))
(declare-datatypes ((tuple2!14842 0))(
  ( (tuple2!14843 (_1!8063 Unit!12339) (_2!8063 BitStream!7300)) )
))
(declare-fun lt!265970 () tuple2!14842)

(declare-fun thiss!1187 () BitStream!7300)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172641 (= res!142988 (= (bitIndex!0 (size!4096 (buf!4524 (_2!8063 lt!265970))) (currentByte!8602 (_2!8063 lt!265970)) (currentBit!8597 (_2!8063 lt!265970))) (bvadd (bitIndex!0 (size!4096 (buf!4524 thiss!1187)) (currentByte!8602 thiss!1187) (currentBit!8597 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!172642 () Bool)

(declare-fun res!142992 () Bool)

(assert (=> b!172642 (=> (not res!142992) (not e!120638))))

(assert (=> b!172642 (= res!142992 (= (size!4096 (buf!4524 thiss!1187)) (size!4096 (buf!4524 (_2!8063 lt!265970)))))))

(declare-fun res!142991 () Bool)

(declare-fun e!120639 () Bool)

(assert (=> start!38442 (=> (not res!142991) (not e!120639))))

(assert (=> start!38442 (= res!142991 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38442 e!120639))

(assert (=> start!38442 true))

(declare-fun e!120637 () Bool)

(declare-fun inv!12 (BitStream!7300) Bool)

(assert (=> start!38442 (and (inv!12 thiss!1187) e!120637)))

(declare-fun b!172643 () Bool)

(assert (=> b!172643 (= e!120639 e!120638)))

(declare-fun res!142990 () Bool)

(assert (=> b!172643 (=> (not res!142990) (not e!120638))))

(assert (=> b!172643 (= res!142990 (= (size!4096 (buf!4524 (_2!8063 lt!265970))) (size!4096 (buf!4524 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7300 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14842)

(assert (=> b!172643 (= lt!265970 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172644 () Bool)

(declare-fun res!142987 () Bool)

(assert (=> b!172644 (=> (not res!142987) (not e!120639))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172644 (= res!142987 (invariant!0 (currentBit!8597 thiss!1187) (currentByte!8602 thiss!1187) (size!4096 (buf!4524 thiss!1187))))))

(declare-fun b!172645 () Bool)

(declare-fun array_inv!3837 (array!9281) Bool)

(assert (=> b!172645 (= e!120637 (array_inv!3837 (buf!4524 thiss!1187)))))

(declare-fun b!172646 () Bool)

(assert (=> b!172646 (= e!120638 (not (invariant!0 (currentBit!8597 (_2!8063 lt!265970)) (currentByte!8602 (_2!8063 lt!265970)) (size!4096 (buf!4524 (_2!8063 lt!265970))))))))

(declare-fun b!172647 () Bool)

(declare-fun res!142989 () Bool)

(assert (=> b!172647 (=> (not res!142989) (not e!120639))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172647 (= res!142989 (validate_offset_bits!1 ((_ sign_extend 32) (size!4096 (buf!4524 thiss!1187))) ((_ sign_extend 32) (currentByte!8602 thiss!1187)) ((_ sign_extend 32) (currentBit!8597 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(assert (= (and start!38442 res!142991) b!172647))

(assert (= (and b!172647 res!142989) b!172644))

(assert (= (and b!172644 res!142987) b!172643))

(assert (= (and b!172643 res!142990) b!172641))

(assert (= (and b!172641 res!142988) b!172642))

(assert (= (and b!172642 res!142992) b!172646))

(assert (= start!38442 b!172645))

(declare-fun m!271795 () Bool)

(assert (=> b!172646 m!271795))

(declare-fun m!271797 () Bool)

(assert (=> b!172647 m!271797))

(declare-fun m!271799 () Bool)

(assert (=> start!38442 m!271799))

(declare-fun m!271801 () Bool)

(assert (=> b!172641 m!271801))

(declare-fun m!271803 () Bool)

(assert (=> b!172641 m!271803))

(declare-fun m!271805 () Bool)

(assert (=> b!172644 m!271805))

(declare-fun m!271807 () Bool)

(assert (=> b!172645 m!271807))

(declare-fun m!271809 () Bool)

(assert (=> b!172643 m!271809))

(push 1)

(assert (not b!172646))

(assert (not b!172647))

(assert (not start!38442))

(assert (not b!172645))

(assert (not b!172644))

(assert (not b!172643))

(assert (not b!172641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61151 () Bool)

(assert (=> d!61151 (= (invariant!0 (currentBit!8597 (_2!8063 lt!265970)) (currentByte!8602 (_2!8063 lt!265970)) (size!4096 (buf!4524 (_2!8063 lt!265970)))) (and (bvsge (currentBit!8597 (_2!8063 lt!265970)) #b00000000000000000000000000000000) (bvslt (currentBit!8597 (_2!8063 lt!265970)) #b00000000000000000000000000001000) (bvsge (currentByte!8602 (_2!8063 lt!265970)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8602 (_2!8063 lt!265970)) (size!4096 (buf!4524 (_2!8063 lt!265970)))) (and (= (currentBit!8597 (_2!8063 lt!265970)) #b00000000000000000000000000000000) (= (currentByte!8602 (_2!8063 lt!265970)) (size!4096 (buf!4524 (_2!8063 lt!265970))))))))))

(assert (=> b!172646 d!61151))

(declare-fun d!61155 () Bool)

(declare-fun e!120667 () Bool)

(assert (=> d!61155 e!120667))

(declare-fun res!143033 () Bool)

(assert (=> d!61155 (=> (not res!143033) (not e!120667))))

(declare-fun lt!265989 () (_ BitVec 64))

(declare-fun lt!265992 () (_ BitVec 64))

(declare-fun lt!265994 () (_ BitVec 64))

(assert (=> d!61155 (= res!143033 (= lt!265989 (bvsub lt!265994 lt!265992)))))

(assert (=> d!61155 (or (= (bvand lt!265994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265992 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265994 lt!265992) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61155 (= lt!265992 (remainingBits!0 ((_ sign_extend 32) (size!4096 (buf!4524 (_2!8063 lt!265970)))) ((_ sign_extend 32) (currentByte!8602 (_2!8063 lt!265970))) ((_ sign_extend 32) (currentBit!8597 (_2!8063 lt!265970)))))))

(declare-fun lt!265993 () (_ BitVec 64))

(declare-fun lt!265990 () (_ BitVec 64))

(assert (=> d!61155 (= lt!265994 (bvmul lt!265993 lt!265990))))

(assert (=> d!61155 (or (= lt!265993 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265990 (bvsdiv (bvmul lt!265993 lt!265990) lt!265993)))))

(assert (=> d!61155 (= lt!265990 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61155 (= lt!265993 ((_ sign_extend 32) (size!4096 (buf!4524 (_2!8063 lt!265970)))))))

(assert (=> d!61155 (= lt!265989 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8602 (_2!8063 lt!265970))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8597 (_2!8063 lt!265970)))))))

(assert (=> d!61155 (invariant!0 (currentBit!8597 (_2!8063 lt!265970)) (currentByte!8602 (_2!8063 lt!265970)) (size!4096 (buf!4524 (_2!8063 lt!265970))))))

(assert (=> d!61155 (= (bitIndex!0 (size!4096 (buf!4524 (_2!8063 lt!265970))) (currentByte!8602 (_2!8063 lt!265970)) (currentBit!8597 (_2!8063 lt!265970))) lt!265989)))

(declare-fun b!172694 () Bool)

(declare-fun res!143034 () Bool)

(assert (=> b!172694 (=> (not res!143034) (not e!120667))))

(assert (=> b!172694 (= res!143034 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!265989))))

(declare-fun b!172695 () Bool)

(declare-fun lt!265991 () (_ BitVec 64))

(assert (=> b!172695 (= e!120667 (bvsle lt!265989 (bvmul lt!265991 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172695 (or (= lt!265991 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!265991 #b0000000000000000000000000000000000000000000000000000000000001000) lt!265991)))))

(assert (=> b!172695 (= lt!265991 ((_ sign_extend 32) (size!4096 (buf!4524 (_2!8063 lt!265970)))))))

(assert (= (and d!61155 res!143033) b!172694))

(assert (= (and b!172694 res!143034) b!172695))

(declare-fun m!271845 () Bool)

(assert (=> d!61155 m!271845))

(assert (=> d!61155 m!271795))

(assert (=> b!172641 d!61155))

(declare-fun d!61163 () Bool)

(declare-fun e!120668 () Bool)

(assert (=> d!61163 e!120668))

(declare-fun res!143035 () Bool)

(assert (=> d!61163 (=> (not res!143035) (not e!120668))))

(declare-fun lt!266000 () (_ BitVec 64))

(declare-fun lt!265995 () (_ BitVec 64))

(declare-fun lt!265998 () (_ BitVec 64))

(assert (=> d!61163 (= res!143035 (= lt!265995 (bvsub lt!266000 lt!265998)))))

(assert (=> d!61163 (or (= (bvand lt!266000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265998 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266000 lt!265998) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61163 (= lt!265998 (remainingBits!0 ((_ sign_extend 32) (size!4096 (buf!4524 thiss!1187))) ((_ sign_extend 32) (currentByte!8602 thiss!1187)) ((_ sign_extend 32) (currentBit!8597 thiss!1187))))))

(declare-fun lt!265999 () (_ BitVec 64))

(declare-fun lt!265996 () (_ BitVec 64))

(assert (=> d!61163 (= lt!266000 (bvmul lt!265999 lt!265996))))

(assert (=> d!61163 (or (= lt!265999 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265996 (bvsdiv (bvmul lt!265999 lt!265996) lt!265999)))))

(assert (=> d!61163 (= lt!265996 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61163 (= lt!265999 ((_ sign_extend 32) (size!4096 (buf!4524 thiss!1187))))))

(assert (=> d!61163 (= lt!265995 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8602 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8597 thiss!1187))))))

(assert (=> d!61163 (invariant!0 (currentBit!8597 thiss!1187) (currentByte!8602 thiss!1187) (size!4096 (buf!4524 thiss!1187)))))

(assert (=> d!61163 (= (bitIndex!0 (size!4096 (buf!4524 thiss!1187)) (currentByte!8602 thiss!1187) (currentBit!8597 thiss!1187)) lt!265995)))

(declare-fun b!172696 () Bool)

(declare-fun res!143036 () Bool)

(assert (=> b!172696 (=> (not res!143036) (not e!120668))))

(assert (=> b!172696 (= res!143036 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!265995))))

(declare-fun b!172697 () Bool)

(declare-fun lt!265997 () (_ BitVec 64))

(assert (=> b!172697 (= e!120668 (bvsle lt!265995 (bvmul lt!265997 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172697 (or (= lt!265997 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!265997 #b0000000000000000000000000000000000000000000000000000000000001000) lt!265997)))))

(assert (=> b!172697 (= lt!265997 ((_ sign_extend 32) (size!4096 (buf!4524 thiss!1187))))))

(assert (= (and d!61163 res!143035) b!172696))

(assert (= (and b!172696 res!143036) b!172697))

(declare-fun m!271847 () Bool)

(assert (=> d!61163 m!271847))

(assert (=> d!61163 m!271805))

(assert (=> b!172641 d!61163))

(declare-fun d!61165 () Bool)

(assert (=> d!61165 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8597 thiss!1187) (currentByte!8602 thiss!1187) (size!4096 (buf!4524 thiss!1187))))))

(declare-fun bs!15221 () Bool)

(assert (= bs!15221 d!61165))

(assert (=> bs!15221 m!271805))

(assert (=> start!38442 d!61165))

(declare-fun d!61167 () Bool)

(assert (=> d!61167 (= (array_inv!3837 (buf!4524 thiss!1187)) (bvsge (size!4096 (buf!4524 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!172645 d!61167))

(declare-fun b!172786 () Bool)

(declare-fun e!120723 () (_ BitVec 64))

(assert (=> b!172786 (= e!120723 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!172787 () Bool)

(declare-fun res!143107 () Bool)

(declare-fun lt!266306 () tuple2!14842)

(assert (=> b!172787 (= res!143107 (= (bitIndex!0 (size!4096 (buf!4524 (_2!8063 lt!266306))) (currentByte!8602 (_2!8063 lt!266306)) (currentBit!8597 (_2!8063 lt!266306))) (bvadd (bitIndex!0 (size!4096 (buf!4524 thiss!1187)) (currentByte!8602 thiss!1187) (currentBit!8597 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!120726 () Bool)

(assert (=> b!172787 (=> (not res!143107) (not e!120726))))

(declare-fun bm!2852 () Bool)

(declare-fun call!2855 () Bool)

(declare-fun c!9098 () Bool)

(declare-fun isPrefixOf!0 (BitStream!7300 BitStream!7300) Bool)

(assert (=> bm!2852 (= call!2855 (isPrefixOf!0 thiss!1187 (ite c!9098 thiss!1187 (_2!8063 lt!266306))))))

(declare-fun d!61169 () Bool)

(declare-fun e!120724 () Bool)

(assert (=> d!61169 e!120724))

(declare-fun res!143109 () Bool)

(assert (=> d!61169 (=> (not res!143109) (not e!120724))))

(declare-fun lt!266305 () tuple2!14842)

(assert (=> d!61169 (= res!143109 (invariant!0 (currentBit!8597 (_2!8063 lt!266305)) (currentByte!8602 (_2!8063 lt!266305)) (size!4096 (buf!4524 (_2!8063 lt!266305)))))))

(declare-fun e!120720 () tuple2!14842)

(assert (=> d!61169 (= lt!266305 e!120720)))

(assert (=> d!61169 (= c!9098 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61169 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61169 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!266305)))

(declare-fun b!172788 () Bool)

(declare-fun e!120721 () Bool)

(declare-datatypes ((tuple2!14852 0))(
  ( (tuple2!14853 (_1!8068 BitStream!7300) (_2!8068 Bool)) )
))
(declare-fun lt!266320 () tuple2!14852)

(assert (=> b!172788 (= e!120721 (= (bitIndex!0 (size!4096 (buf!4524 (_1!8068 lt!266320))) (currentByte!8602 (_1!8068 lt!266320)) (currentBit!8597 (_1!8068 lt!266320))) (bitIndex!0 (size!4096 (buf!4524 (_2!8063 lt!266306))) (currentByte!8602 (_2!8063 lt!266306)) (currentBit!8597 (_2!8063 lt!266306)))))))

(declare-fun b!172789 () Bool)

(declare-fun res!143108 () Bool)

(assert (=> b!172789 (= res!143108 call!2855)))

(assert (=> b!172789 (=> (not res!143108) (not e!120726))))

(declare-fun b!172790 () Bool)

(declare-fun res!143114 () Bool)

(assert (=> b!172790 (=> (not res!143114) (not e!120724))))

(declare-fun lt!266317 () (_ BitVec 64))

(declare-fun lt!266349 () (_ BitVec 64))

(assert (=> b!172790 (= res!143114 (= (bitIndex!0 (size!4096 (buf!4524 (_2!8063 lt!266305))) (currentByte!8602 (_2!8063 lt!266305)) (currentBit!8597 (_2!8063 lt!266305))) (bvsub lt!266349 lt!266317)))))

(assert (=> b!172790 (or (= (bvand lt!266349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266317 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266349 lt!266317) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172790 (= lt!266317 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!266345 () (_ BitVec 64))

(declare-fun lt!266325 () (_ BitVec 64))

(assert (=> b!172790 (= lt!266349 (bvadd lt!266345 lt!266325))))

(assert (=> b!172790 (or (not (= (bvand lt!266345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266325 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!266345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!266345 lt!266325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172790 (= lt!266325 ((_ sign_extend 32) nBits!340))))

(assert (=> b!172790 (= lt!266345 (bitIndex!0 (size!4096 (buf!4524 thiss!1187)) (currentByte!8602 thiss!1187) (currentBit!8597 thiss!1187)))))

(declare-fun b!172791 () Bool)

(assert (=> b!172791 (= e!120723 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!172792 () Bool)

(declare-fun e!120722 () Bool)

(declare-fun lt!266336 () (_ BitVec 64))

(assert (=> b!172792 (= e!120722 (validate_offset_bits!1 ((_ sign_extend 32) (size!4096 (buf!4524 thiss!1187))) ((_ sign_extend 32) (currentByte!8602 thiss!1187)) ((_ sign_extend 32) (currentBit!8597 thiss!1187)) lt!266336))))

(declare-fun b!172793 () Bool)

(declare-fun e!120718 () Bool)

(declare-datatypes ((tuple2!14856 0))(
  ( (tuple2!14857 (_1!8070 BitStream!7300) (_2!8070 (_ BitVec 64))) )
))
(declare-fun lt!266321 () tuple2!14856)

(declare-datatypes ((tuple2!14858 0))(
  ( (tuple2!14859 (_1!8071 BitStream!7300) (_2!8071 BitStream!7300)) )
))
(declare-fun lt!266342 () tuple2!14858)

(assert (=> b!172793 (= e!120718 (= (_1!8070 lt!266321) (_2!8071 lt!266342)))))

(declare-fun b!172794 () Bool)

(declare-fun e!120719 () Bool)

(assert (=> b!172794 (= e!120724 e!120719)))

(declare-fun res!143113 () Bool)

(assert (=> b!172794 (=> (not res!143113) (not e!120719))))

(declare-fun lt!266344 () tuple2!14856)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172794 (= res!143113 (= (_2!8070 lt!266344) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun lt!266333 () tuple2!14858)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14856)

(assert (=> b!172794 (= lt!266344 (readNBitsLSBFirstsLoopPure!0 (_1!8071 lt!266333) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!266338 () Unit!12339)

(declare-fun lt!266346 () Unit!12339)

(assert (=> b!172794 (= lt!266338 lt!266346)))

(assert (=> b!172794 (validate_offset_bits!1 ((_ sign_extend 32) (size!4096 (buf!4524 (_2!8063 lt!266305)))) ((_ sign_extend 32) (currentByte!8602 thiss!1187)) ((_ sign_extend 32) (currentBit!8597 thiss!1187)) lt!266336)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7300 array!9281 (_ BitVec 64)) Unit!12339)

(assert (=> b!172794 (= lt!266346 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4524 (_2!8063 lt!266305)) lt!266336))))

(assert (=> b!172794 e!120722))

(declare-fun res!143110 () Bool)

(assert (=> b!172794 (=> (not res!143110) (not e!120722))))

(assert (=> b!172794 (= res!143110 (and (= (size!4096 (buf!4524 thiss!1187)) (size!4096 (buf!4524 (_2!8063 lt!266305)))) (bvsge lt!266336 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172794 (= lt!266336 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!172794 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7300 BitStream!7300) tuple2!14858)

(assert (=> b!172794 (= lt!266333 (reader!0 thiss!1187 (_2!8063 lt!266305)))))

(declare-fun b!172795 () Bool)

(declare-fun readBitPure!0 (BitStream!7300) tuple2!14852)

(declare-fun readerFrom!0 (BitStream!7300 (_ BitVec 32) (_ BitVec 32)) BitStream!7300)

(assert (=> b!172795 (= lt!266320 (readBitPure!0 (readerFrom!0 (_2!8063 lt!266306) (currentBit!8597 thiss!1187) (currentByte!8602 thiss!1187))))))

(declare-fun res!143106 () Bool)

(declare-fun lt!266311 () Bool)

(assert (=> b!172795 (= res!143106 (and (= (_2!8068 lt!266320) lt!266311) (= (_1!8068 lt!266320) (_2!8063 lt!266306))))))

(assert (=> b!172795 (=> (not res!143106) (not e!120721))))

(assert (=> b!172795 (= e!120726 e!120721)))

(declare-fun b!172796 () Bool)

(declare-fun lt!266319 () tuple2!14842)

(assert (=> b!172796 (= e!120720 (tuple2!14843 (_1!8063 lt!266319) (_2!8063 lt!266319)))))

(assert (=> b!172796 (= lt!266311 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7300 Bool) tuple2!14842)

(assert (=> b!172796 (= lt!266306 (appendBit!0 thiss!1187 lt!266311))))

(declare-fun res!143105 () Bool)

(assert (=> b!172796 (= res!143105 (= (size!4096 (buf!4524 thiss!1187)) (size!4096 (buf!4524 (_2!8063 lt!266306)))))))

(assert (=> b!172796 (=> (not res!143105) (not e!120726))))

(assert (=> b!172796 e!120726))

(declare-fun lt!266307 () tuple2!14842)

(assert (=> b!172796 (= lt!266307 lt!266306)))

(assert (=> b!172796 (= lt!266319 (appendBitsLSBFirstLoopTR!0 (_2!8063 lt!266307) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!266316 () Unit!12339)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7300 BitStream!7300 BitStream!7300) Unit!12339)

(assert (=> b!172796 (= lt!266316 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8063 lt!266307) (_2!8063 lt!266319)))))

(assert (=> b!172796 (isPrefixOf!0 thiss!1187 (_2!8063 lt!266319))))

(declare-fun lt!266348 () Unit!12339)

(assert (=> b!172796 (= lt!266348 lt!266316)))

(assert (=> b!172796 (invariant!0 (currentBit!8597 thiss!1187) (currentByte!8602 thiss!1187) (size!4096 (buf!4524 (_2!8063 lt!266307))))))

(declare-fun lt!266330 () BitStream!7300)

(assert (=> b!172796 (= lt!266330 (BitStream!7301 (buf!4524 (_2!8063 lt!266307)) (currentByte!8602 thiss!1187) (currentBit!8597 thiss!1187)))))

(assert (=> b!172796 (invariant!0 (currentBit!8597 lt!266330) (currentByte!8602 lt!266330) (size!4096 (buf!4524 (_2!8063 lt!266319))))))

(declare-fun lt!266322 () BitStream!7300)

(assert (=> b!172796 (= lt!266322 (BitStream!7301 (buf!4524 (_2!8063 lt!266319)) (currentByte!8602 lt!266330) (currentBit!8597 lt!266330)))))

(declare-fun lt!266341 () tuple2!14852)

(assert (=> b!172796 (= lt!266341 (readBitPure!0 lt!266330))))

(declare-fun lt!266340 () tuple2!14852)

(assert (=> b!172796 (= lt!266340 (readBitPure!0 lt!266322))))

(declare-fun lt!266357 () Unit!12339)

(declare-fun readBitPrefixLemma!0 (BitStream!7300 BitStream!7300) Unit!12339)

(assert (=> b!172796 (= lt!266357 (readBitPrefixLemma!0 lt!266330 (_2!8063 lt!266319)))))

(declare-fun res!143115 () Bool)

(assert (=> b!172796 (= res!143115 (= (bitIndex!0 (size!4096 (buf!4524 (_1!8068 lt!266341))) (currentByte!8602 (_1!8068 lt!266341)) (currentBit!8597 (_1!8068 lt!266341))) (bitIndex!0 (size!4096 (buf!4524 (_1!8068 lt!266340))) (currentByte!8602 (_1!8068 lt!266340)) (currentBit!8597 (_1!8068 lt!266340)))))))

(declare-fun e!120725 () Bool)

(assert (=> b!172796 (=> (not res!143115) (not e!120725))))

(assert (=> b!172796 e!120725))

(declare-fun lt!266308 () Unit!12339)

(assert (=> b!172796 (= lt!266308 lt!266357)))

(declare-fun lt!266318 () tuple2!14858)

(assert (=> b!172796 (= lt!266318 (reader!0 thiss!1187 (_2!8063 lt!266319)))))

(declare-fun lt!266360 () tuple2!14858)

(assert (=> b!172796 (= lt!266360 (reader!0 (_2!8063 lt!266307) (_2!8063 lt!266319)))))

(declare-fun lt!266353 () tuple2!14852)

(assert (=> b!172796 (= lt!266353 (readBitPure!0 (_1!8071 lt!266318)))))

(assert (=> b!172796 (= (_2!8068 lt!266353) lt!266311)))

(declare-fun lt!266351 () Unit!12339)

(declare-fun Unit!12353 () Unit!12339)

(assert (=> b!172796 (= lt!266351 Unit!12353)))

(declare-fun lt!266339 () (_ BitVec 64))

(assert (=> b!172796 (= lt!266339 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!266359 () (_ BitVec 64))

(assert (=> b!172796 (= lt!266359 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!266350 () Unit!12339)

(assert (=> b!172796 (= lt!266350 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4524 (_2!8063 lt!266319)) lt!266359))))

(assert (=> b!172796 (validate_offset_bits!1 ((_ sign_extend 32) (size!4096 (buf!4524 (_2!8063 lt!266319)))) ((_ sign_extend 32) (currentByte!8602 thiss!1187)) ((_ sign_extend 32) (currentBit!8597 thiss!1187)) lt!266359)))

(declare-fun lt!266331 () Unit!12339)

(assert (=> b!172796 (= lt!266331 lt!266350)))

(declare-fun lt!266314 () tuple2!14856)

(assert (=> b!172796 (= lt!266314 (readNBitsLSBFirstsLoopPure!0 (_1!8071 lt!266318) nBits!340 #b00000000000000000000000000000000 lt!266339))))

(declare-fun lt!266337 () (_ BitVec 64))

(assert (=> b!172796 (= lt!266337 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!266323 () Unit!12339)

(assert (=> b!172796 (= lt!266323 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8063 lt!266307) (buf!4524 (_2!8063 lt!266319)) lt!266337))))

(assert (=> b!172796 (validate_offset_bits!1 ((_ sign_extend 32) (size!4096 (buf!4524 (_2!8063 lt!266319)))) ((_ sign_extend 32) (currentByte!8602 (_2!8063 lt!266307))) ((_ sign_extend 32) (currentBit!8597 (_2!8063 lt!266307))) lt!266337)))

(declare-fun lt!266354 () Unit!12339)

(assert (=> b!172796 (= lt!266354 lt!266323)))

(declare-fun lt!266313 () tuple2!14856)

(assert (=> b!172796 (= lt!266313 (readNBitsLSBFirstsLoopPure!0 (_1!8071 lt!266360) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!266339 (ite (_2!8068 lt!266353) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!266327 () tuple2!14856)

(assert (=> b!172796 (= lt!266327 (readNBitsLSBFirstsLoopPure!0 (_1!8071 lt!266318) nBits!340 #b00000000000000000000000000000000 lt!266339))))

(declare-fun c!9099 () Bool)

(assert (=> b!172796 (= c!9099 (_2!8068 (readBitPure!0 (_1!8071 lt!266318))))))

(declare-fun lt!266310 () tuple2!14856)

(declare-fun withMovedBitIndex!0 (BitStream!7300 (_ BitVec 64)) BitStream!7300)

(assert (=> b!172796 (= lt!266310 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8071 lt!266318) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!266339 e!120723)))))

(declare-fun lt!266332 () Unit!12339)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12339)

(assert (=> b!172796 (= lt!266332 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8071 lt!266318) nBits!340 #b00000000000000000000000000000000 lt!266339))))

(assert (=> b!172796 (and (= (_2!8070 lt!266327) (_2!8070 lt!266310)) (= (_1!8070 lt!266327) (_1!8070 lt!266310)))))

(declare-fun lt!266343 () Unit!12339)

(assert (=> b!172796 (= lt!266343 lt!266332)))

(assert (=> b!172796 (= (_1!8071 lt!266318) (withMovedBitIndex!0 (_2!8071 lt!266318) (bvsub (bitIndex!0 (size!4096 (buf!4524 thiss!1187)) (currentByte!8602 thiss!1187) (currentBit!8597 thiss!1187)) (bitIndex!0 (size!4096 (buf!4524 (_2!8063 lt!266319))) (currentByte!8602 (_2!8063 lt!266319)) (currentBit!8597 (_2!8063 lt!266319))))))))

(declare-fun lt!266355 () Unit!12339)

(declare-fun Unit!12356 () Unit!12339)

(assert (=> b!172796 (= lt!266355 Unit!12356)))

(assert (=> b!172796 (= (_1!8071 lt!266360) (withMovedBitIndex!0 (_2!8071 lt!266360) (bvsub (bitIndex!0 (size!4096 (buf!4524 (_2!8063 lt!266307))) (currentByte!8602 (_2!8063 lt!266307)) (currentBit!8597 (_2!8063 lt!266307))) (bitIndex!0 (size!4096 (buf!4524 (_2!8063 lt!266319))) (currentByte!8602 (_2!8063 lt!266319)) (currentBit!8597 (_2!8063 lt!266319))))))))

(declare-fun lt!266326 () Unit!12339)

(declare-fun Unit!12357 () Unit!12339)

(assert (=> b!172796 (= lt!266326 Unit!12357)))

(assert (=> b!172796 (= (bitIndex!0 (size!4096 (buf!4524 thiss!1187)) (currentByte!8602 thiss!1187) (currentBit!8597 thiss!1187)) (bvsub (bitIndex!0 (size!4096 (buf!4524 (_2!8063 lt!266307))) (currentByte!8602 (_2!8063 lt!266307)) (currentBit!8597 (_2!8063 lt!266307))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!266312 () Unit!12339)

(declare-fun Unit!12358 () Unit!12339)

(assert (=> b!172796 (= lt!266312 Unit!12358)))

(assert (=> b!172796 (= (_2!8070 lt!266314) (_2!8070 lt!266313))))

(declare-fun lt!266309 () Unit!12339)

(declare-fun Unit!12359 () Unit!12339)

(assert (=> b!172796 (= lt!266309 Unit!12359)))

(assert (=> b!172796 (invariant!0 (currentBit!8597 (_2!8063 lt!266319)) (currentByte!8602 (_2!8063 lt!266319)) (size!4096 (buf!4524 (_2!8063 lt!266319))))))

(declare-fun lt!266334 () Unit!12339)

(declare-fun Unit!12360 () Unit!12339)

(assert (=> b!172796 (= lt!266334 Unit!12360)))

(assert (=> b!172796 (= (size!4096 (buf!4524 thiss!1187)) (size!4096 (buf!4524 (_2!8063 lt!266319))))))

(declare-fun lt!266315 () Unit!12339)

(declare-fun Unit!12361 () Unit!12339)

(assert (=> b!172796 (= lt!266315 Unit!12361)))

(assert (=> b!172796 (= (bitIndex!0 (size!4096 (buf!4524 (_2!8063 lt!266319))) (currentByte!8602 (_2!8063 lt!266319)) (currentBit!8597 (_2!8063 lt!266319))) (bvsub (bvadd (bitIndex!0 (size!4096 (buf!4524 thiss!1187)) (currentByte!8602 thiss!1187) (currentBit!8597 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!266347 () Unit!12339)

(declare-fun Unit!12362 () Unit!12339)

(assert (=> b!172796 (= lt!266347 Unit!12362)))

(declare-fun lt!266324 () Unit!12339)

(declare-fun Unit!12363 () Unit!12339)

(assert (=> b!172796 (= lt!266324 Unit!12363)))

(assert (=> b!172796 (= lt!266342 (reader!0 thiss!1187 (_2!8063 lt!266319)))))

(declare-fun lt!266328 () (_ BitVec 64))

(assert (=> b!172796 (= lt!266328 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!266358 () Unit!12339)

(assert (=> b!172796 (= lt!266358 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4524 (_2!8063 lt!266319)) lt!266328))))

(assert (=> b!172796 (validate_offset_bits!1 ((_ sign_extend 32) (size!4096 (buf!4524 (_2!8063 lt!266319)))) ((_ sign_extend 32) (currentByte!8602 thiss!1187)) ((_ sign_extend 32) (currentBit!8597 thiss!1187)) lt!266328)))

(declare-fun lt!266335 () Unit!12339)

(assert (=> b!172796 (= lt!266335 lt!266358)))

(assert (=> b!172796 (= lt!266321 (readNBitsLSBFirstsLoopPure!0 (_1!8071 lt!266342) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!143116 () Bool)

(assert (=> b!172796 (= res!143116 (= (_2!8070 lt!266321) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!172796 (=> (not res!143116) (not e!120718))))

(assert (=> b!172796 e!120718))

(declare-fun lt!266352 () Unit!12339)

(declare-fun Unit!12364 () Unit!12339)

(assert (=> b!172796 (= lt!266352 Unit!12364)))

(declare-fun b!172797 () Bool)

(assert (=> b!172797 (= e!120719 (= (_1!8070 lt!266344) (_2!8071 lt!266333)))))

(declare-fun b!172798 () Bool)

(declare-fun res!143112 () Bool)

(assert (=> b!172798 (=> (not res!143112) (not e!120724))))

(assert (=> b!172798 (= res!143112 (= (size!4096 (buf!4524 thiss!1187)) (size!4096 (buf!4524 (_2!8063 lt!266305)))))))

(declare-fun b!172799 () Bool)

(declare-fun Unit!12365 () Unit!12339)

(assert (=> b!172799 (= e!120720 (tuple2!14843 Unit!12365 thiss!1187))))

(declare-fun lt!266356 () Unit!12339)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7300) Unit!12339)

(assert (=> b!172799 (= lt!266356 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!172799 call!2855))

(declare-fun lt!266329 () Unit!12339)

(assert (=> b!172799 (= lt!266329 lt!266356)))

(declare-fun b!172800 () Bool)

(declare-fun res!143111 () Bool)

(assert (=> b!172800 (=> (not res!143111) (not e!120724))))

(assert (=> b!172800 (= res!143111 (isPrefixOf!0 thiss!1187 (_2!8063 lt!266305)))))

(declare-fun b!172801 () Bool)

(assert (=> b!172801 (= e!120725 (= (_2!8068 lt!266341) (_2!8068 lt!266340)))))

(assert (= (and d!61169 c!9098) b!172799))

(assert (= (and d!61169 (not c!9098)) b!172796))

(assert (= (and b!172796 res!143105) b!172787))

(assert (= (and b!172787 res!143107) b!172789))

(assert (= (and b!172789 res!143108) b!172795))

(assert (= (and b!172795 res!143106) b!172788))

(assert (= (and b!172796 res!143115) b!172801))

(assert (= (and b!172796 c!9099) b!172791))

(assert (= (and b!172796 (not c!9099)) b!172786))

(assert (= (and b!172796 res!143116) b!172793))

(assert (= (or b!172799 b!172789) bm!2852))

(assert (= (and d!61169 res!143109) b!172798))

(assert (= (and b!172798 res!143112) b!172790))

(assert (= (and b!172790 res!143114) b!172800))

(assert (= (and b!172800 res!143111) b!172794))

(assert (= (and b!172794 res!143110) b!172792))

(assert (= (and b!172794 res!143113) b!172797))

(declare-fun m!271947 () Bool)

(assert (=> b!172794 m!271947))

(declare-fun m!271949 () Bool)

(assert (=> b!172794 m!271949))

(declare-fun m!271951 () Bool)

(assert (=> b!172794 m!271951))

(declare-fun m!271953 () Bool)

(assert (=> b!172794 m!271953))

(declare-fun m!271955 () Bool)

(assert (=> b!172794 m!271955))

(declare-fun m!271957 () Bool)

(assert (=> b!172794 m!271957))

(declare-fun m!271959 () Bool)

(assert (=> b!172795 m!271959))

(assert (=> b!172795 m!271959))

(declare-fun m!271961 () Bool)

(assert (=> b!172795 m!271961))

(declare-fun m!271963 () Bool)

(assert (=> b!172787 m!271963))

(assert (=> b!172787 m!271803))

(declare-fun m!271965 () Bool)

(assert (=> b!172790 m!271965))

(assert (=> b!172790 m!271803))

(declare-fun m!271967 () Bool)

(assert (=> b!172796 m!271967))

(declare-fun m!271969 () Bool)

(assert (=> b!172796 m!271969))

(declare-fun m!271971 () Bool)

(assert (=> b!172796 m!271971))

(assert (=> b!172796 m!271951))

(declare-fun m!271973 () Bool)

(assert (=> b!172796 m!271973))

(declare-fun m!271975 () Bool)

(assert (=> b!172796 m!271975))

(declare-fun m!271977 () Bool)

(assert (=> b!172796 m!271977))

(declare-fun m!271979 () Bool)

(assert (=> b!172796 m!271979))

(declare-fun m!271981 () Bool)

(assert (=> b!172796 m!271981))

(declare-fun m!271983 () Bool)

(assert (=> b!172796 m!271983))

(declare-fun m!271985 () Bool)

(assert (=> b!172796 m!271985))

(declare-fun m!271987 () Bool)

(assert (=> b!172796 m!271987))

(assert (=> b!172796 m!271947))

(declare-fun m!271989 () Bool)

(assert (=> b!172796 m!271989))

(declare-fun m!271991 () Bool)

(assert (=> b!172796 m!271991))

(declare-fun m!271993 () Bool)

(assert (=> b!172796 m!271993))

(declare-fun m!271995 () Bool)

(assert (=> b!172796 m!271995))

(declare-fun m!271997 () Bool)

(assert (=> b!172796 m!271997))

(declare-fun m!271999 () Bool)

(assert (=> b!172796 m!271999))

(declare-fun m!272001 () Bool)

(assert (=> b!172796 m!272001))

(declare-fun m!272003 () Bool)

(assert (=> b!172796 m!272003))

(assert (=> b!172796 m!271803))

(declare-fun m!272005 () Bool)

(assert (=> b!172796 m!272005))

(declare-fun m!272007 () Bool)

(assert (=> b!172796 m!272007))

(declare-fun m!272009 () Bool)

(assert (=> b!172796 m!272009))

(assert (=> b!172796 m!271991))

(declare-fun m!272011 () Bool)

(assert (=> b!172796 m!272011))

(declare-fun m!272013 () Bool)

(assert (=> b!172796 m!272013))

(declare-fun m!272015 () Bool)

(assert (=> b!172796 m!272015))

(declare-fun m!272017 () Bool)

(assert (=> b!172796 m!272017))

(declare-fun m!272019 () Bool)

(assert (=> b!172796 m!272019))

(declare-fun m!272021 () Bool)

(assert (=> b!172796 m!272021))

(declare-fun m!272023 () Bool)

(assert (=> b!172796 m!272023))

(declare-fun m!272025 () Bool)

(assert (=> b!172796 m!272025))

(declare-fun m!272027 () Bool)

(assert (=> b!172796 m!272027))

(declare-fun m!272029 () Bool)

(assert (=> d!61169 m!272029))

(declare-fun m!272031 () Bool)

(assert (=> b!172792 m!272031))

(declare-fun m!272033 () Bool)

(assert (=> b!172788 m!272033))

(assert (=> b!172788 m!271963))

(declare-fun m!272035 () Bool)

(assert (=> b!172799 m!272035))

(declare-fun m!272037 () Bool)

(assert (=> bm!2852 m!272037))

(declare-fun m!272039 () Bool)

(assert (=> b!172800 m!272039))

(assert (=> b!172643 d!61169))

(declare-fun d!61189 () Bool)

(assert (=> d!61189 (= (invariant!0 (currentBit!8597 thiss!1187) (currentByte!8602 thiss!1187) (size!4096 (buf!4524 thiss!1187))) (and (bvsge (currentBit!8597 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8597 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8602 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8602 thiss!1187) (size!4096 (buf!4524 thiss!1187))) (and (= (currentBit!8597 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8602 thiss!1187) (size!4096 (buf!4524 thiss!1187)))))))))

(assert (=> b!172644 d!61189))

(declare-fun d!61191 () Bool)

(assert (=> d!61191 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4096 (buf!4524 thiss!1187))) ((_ sign_extend 32) (currentByte!8602 thiss!1187)) ((_ sign_extend 32) (currentBit!8597 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4096 (buf!4524 thiss!1187))) ((_ sign_extend 32) (currentByte!8602 thiss!1187)) ((_ sign_extend 32) (currentBit!8597 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15225 () Bool)

(assert (= bs!15225 d!61191))

(assert (=> bs!15225 m!271847))

(assert (=> b!172647 d!61191))

(push 1)

(assert (not b!172799))

(assert (not b!172796))

(assert (not bm!2852))

(assert (not d!61191))

(assert (not b!172795))

(assert (not d!61169))

(assert (not d!61163))

(assert (not d!61155))

(assert (not b!172794))

(assert (not b!172790))

(assert (not b!172800))

(assert (not b!172787))

(assert (not b!172792))

(assert (not b!172788))

(assert (not d!61165))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

