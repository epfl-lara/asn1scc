; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30744 () Bool)

(assert start!30744)

(declare-fun res!130484 () Bool)

(declare-fun e!105374 () Bool)

(assert (=> start!30744 (=> (not res!130484) (not e!105374))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7142 0))(
  ( (array!7143 (arr!4050 (Array (_ BitVec 32) (_ BitVec 8))) (size!3206 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7142)

(assert (=> start!30744 (= res!130484 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3206 arr!153))))))

(assert (=> start!30744 e!105374))

(assert (=> start!30744 true))

(declare-fun array_inv!2995 (array!7142) Bool)

(assert (=> start!30744 (array_inv!2995 arr!153)))

(declare-datatypes ((BitStream!5670 0))(
  ( (BitStream!5671 (buf!3709 array!7142) (currentByte!6800 (_ BitVec 32)) (currentBit!6795 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5670)

(declare-fun e!105376 () Bool)

(declare-fun inv!12 (BitStream!5670) Bool)

(assert (=> start!30744 (and (inv!12 bs!65) e!105376)))

(declare-fun b!156083 () Bool)

(declare-fun res!130483 () Bool)

(assert (=> b!156083 (=> (not res!130483) (not e!105374))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156083 (= res!130483 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3206 (buf!3709 bs!65))) ((_ sign_extend 32) (currentByte!6800 bs!65)) ((_ sign_extend 32) (currentBit!6795 bs!65)) (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!13898 0))(
  ( (tuple2!13899 (_1!7381 BitStream!5670) (_2!7381 array!7142)) )
))
(declare-fun lt!243477 () tuple2!13898)

(declare-fun b!156084 () Bool)

(declare-fun lt!243478 () tuple2!13898)

(assert (=> b!156084 (= e!105374 (and (= from!240 (bvsub to!236 #b00000000000000000000000000000001)) (bvsle #b00000000000000000000000000000000 to!236) (bvsle (size!3206 (_2!7381 lt!243477)) (size!3206 (_2!7381 lt!243478))) (bvsgt to!236 (size!3206 (_2!7381 lt!243477)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5670 array!7142 (_ BitVec 32) (_ BitVec 32)) tuple2!13898)

(declare-fun withMovedByteIndex!0 (BitStream!5670 (_ BitVec 32)) BitStream!5670)

(declare-datatypes ((tuple2!13900 0))(
  ( (tuple2!13901 (_1!7382 BitStream!5670) (_2!7382 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5670) tuple2!13900)

(assert (=> b!156084 (= lt!243478 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156084 (= lt!243477 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156085 () Bool)

(assert (=> b!156085 (= e!105376 (array_inv!2995 (buf!3709 bs!65)))))

(assert (= (and start!30744 res!130484) b!156083))

(assert (= (and b!156083 res!130483) b!156084))

(assert (= start!30744 b!156085))

(declare-fun m!242811 () Bool)

(assert (=> start!30744 m!242811))

(declare-fun m!242813 () Bool)

(assert (=> start!30744 m!242813))

(declare-fun m!242815 () Bool)

(assert (=> b!156083 m!242815))

(declare-fun m!242817 () Bool)

(assert (=> b!156084 m!242817))

(declare-fun m!242819 () Bool)

(assert (=> b!156084 m!242819))

(assert (=> b!156084 m!242819))

(declare-fun m!242821 () Bool)

(assert (=> b!156084 m!242821))

(declare-fun m!242823 () Bool)

(assert (=> b!156084 m!242823))

(declare-fun m!242825 () Bool)

(assert (=> b!156084 m!242825))

(declare-fun m!242827 () Bool)

(assert (=> b!156085 m!242827))

(check-sat (not b!156084) (not start!30744) (not b!156085) (not b!156083))
(check-sat)
(get-model)

(declare-fun d!51808 () Bool)

(declare-datatypes ((Unit!9951 0))(
  ( (Unit!9952) )
))
(declare-datatypes ((tuple3!632 0))(
  ( (tuple3!633 (_1!7388 Unit!9951) (_2!7388 BitStream!5670) (_3!433 array!7142)) )
))
(declare-fun lt!243494 () tuple3!632)

(declare-fun readByteArrayLoop!0 (BitStream!5670 array!7142 (_ BitVec 32) (_ BitVec 32)) tuple3!632)

(assert (=> d!51808 (= lt!243494 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51808 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13899 (_2!7388 lt!243494) (_3!433 lt!243494)))))

(declare-fun bs!12681 () Bool)

(assert (= bs!12681 d!51808))

(assert (=> bs!12681 m!242819))

(declare-fun m!242859 () Bool)

(assert (=> bs!12681 m!242859))

(assert (=> b!156084 d!51808))

(declare-fun d!51810 () Bool)

(declare-datatypes ((tuple2!13910 0))(
  ( (tuple2!13911 (_1!7389 Unit!9951) (_2!7389 BitStream!5670)) )
))
(declare-fun moveByteIndex!0 (BitStream!5670 (_ BitVec 32)) tuple2!13910)

(assert (=> d!51810 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7389 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12682 () Bool)

(assert (= bs!12682 d!51810))

(declare-fun m!242861 () Bool)

(assert (=> bs!12682 m!242861))

(assert (=> b!156084 d!51810))

(declare-fun d!51812 () Bool)

(declare-datatypes ((tuple2!13912 0))(
  ( (tuple2!13913 (_1!7390 (_ BitVec 8)) (_2!7390 BitStream!5670)) )
))
(declare-fun lt!243500 () tuple2!13912)

(declare-fun readByte!0 (BitStream!5670) tuple2!13912)

(assert (=> d!51812 (= lt!243500 (readByte!0 bs!65))))

(assert (=> d!51812 (= (readBytePure!0 bs!65) (tuple2!13901 (_2!7390 lt!243500) (_1!7390 lt!243500)))))

(declare-fun bs!12684 () Bool)

(assert (= bs!12684 d!51812))

(declare-fun m!242865 () Bool)

(assert (=> bs!12684 m!242865))

(assert (=> b!156084 d!51812))

(declare-fun d!51816 () Bool)

(declare-fun lt!243501 () tuple3!632)

(assert (=> d!51816 (= lt!243501 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51816 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13899 (_2!7388 lt!243501) (_3!433 lt!243501)))))

(declare-fun bs!12685 () Bool)

(assert (= bs!12685 d!51816))

(declare-fun m!242867 () Bool)

(assert (=> bs!12685 m!242867))

(assert (=> b!156084 d!51816))

(declare-fun d!51818 () Bool)

(assert (=> d!51818 (= (array_inv!2995 arr!153) (bvsge (size!3206 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30744 d!51818))

(declare-fun d!51820 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51820 (= (inv!12 bs!65) (invariant!0 (currentBit!6795 bs!65) (currentByte!6800 bs!65) (size!3206 (buf!3709 bs!65))))))

(declare-fun bs!12687 () Bool)

(assert (= bs!12687 d!51820))

(declare-fun m!242871 () Bool)

(assert (=> bs!12687 m!242871))

(assert (=> start!30744 d!51820))

(declare-fun d!51824 () Bool)

(assert (=> d!51824 (= (array_inv!2995 (buf!3709 bs!65)) (bvsge (size!3206 (buf!3709 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156085 d!51824))

(declare-fun d!51826 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51826 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3206 (buf!3709 bs!65))) ((_ sign_extend 32) (currentByte!6800 bs!65)) ((_ sign_extend 32) (currentBit!6795 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3206 (buf!3709 bs!65))) ((_ sign_extend 32) (currentByte!6800 bs!65)) ((_ sign_extend 32) (currentBit!6795 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12688 () Bool)

(assert (= bs!12688 d!51826))

(declare-fun m!242873 () Bool)

(assert (=> bs!12688 m!242873))

(assert (=> b!156083 d!51826))

(check-sat (not d!51812) (not d!51810) (not d!51816) (not d!51826) (not d!51820) (not d!51808))
(check-sat)
(get-model)

(declare-fun d!51844 () Bool)

(assert (=> d!51844 (= (remainingBits!0 ((_ sign_extend 32) (size!3206 (buf!3709 bs!65))) ((_ sign_extend 32) (currentByte!6800 bs!65)) ((_ sign_extend 32) (currentBit!6795 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3206 (buf!3709 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6800 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6795 bs!65)))))))

(assert (=> d!51826 d!51844))

(declare-fun d!51846 () Bool)

(declare-fun e!105395 () Bool)

(assert (=> d!51846 e!105395))

(declare-fun res!130496 () Bool)

(assert (=> d!51846 (=> (not res!130496) (not e!105395))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5670 (_ BitVec 32)) Bool)

(assert (=> d!51846 (= res!130496 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!9974 () Unit!9951)

(assert (=> d!51846 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13911 Unit!9974 (BitStream!5671 (buf!3709 bs!65) (bvadd (currentByte!6800 bs!65) #b00000000000000000000000000000001) (currentBit!6795 bs!65))))))

(declare-fun b!156100 () Bool)

(assert (=> b!156100 (= e!105395 (and (or (not (= (bvand (currentByte!6800 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6800 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6800 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6800 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6800 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51846 res!130496) b!156100))

(declare-fun m!242885 () Bool)

(assert (=> d!51846 m!242885))

(assert (=> d!51810 d!51846))

(declare-fun b!156152 () Bool)

(declare-fun e!105429 () tuple3!632)

(declare-fun lt!243856 () Unit!9951)

(declare-fun lt!243861 () tuple3!632)

(assert (=> b!156152 (= e!105429 (tuple3!633 lt!243856 (_2!7388 lt!243861) (_3!433 lt!243861)))))

(declare-fun lt!243863 () tuple2!13912)

(assert (=> b!156152 (= lt!243863 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!243881 () array!7142)

(assert (=> b!156152 (= lt!243881 (array!7143 (store (arr!4050 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7390 lt!243863)) (size!3206 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)))))))

(declare-fun lt!243877 () (_ BitVec 64))

(assert (=> b!156152 (= lt!243877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243858 () (_ BitVec 32))

(assert (=> b!156152 (= lt!243858 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243869 () Unit!9951)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5670 BitStream!5670 (_ BitVec 64) (_ BitVec 32)) Unit!9951)

(assert (=> b!156152 (= lt!243869 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7390 lt!243863) lt!243877 lt!243858))))

(assert (=> b!156152 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3206 (buf!3709 (_2!7390 lt!243863)))) ((_ sign_extend 32) (currentByte!6800 (_2!7390 lt!243863))) ((_ sign_extend 32) (currentBit!6795 (_2!7390 lt!243863))) (bvsub lt!243858 ((_ extract 31 0) (bvsdiv (bvadd lt!243877 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243867 () Unit!9951)

(assert (=> b!156152 (= lt!243867 lt!243869)))

(assert (=> b!156152 (= lt!243861 (readByteArrayLoop!0 (_2!7390 lt!243863) lt!243881 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2377 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156152 (= call!2377 (bvadd (bitIndex!0 (size!3206 (buf!3709 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6800 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6795 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243862 () Unit!9951)

(declare-fun Unit!9979 () Unit!9951)

(assert (=> b!156152 (= lt!243862 Unit!9979)))

(assert (=> b!156152 (= (bvadd call!2377 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3206 (buf!3709 (_2!7388 lt!243861))) (currentByte!6800 (_2!7388 lt!243861)) (currentBit!6795 (_2!7388 lt!243861))))))

(declare-fun lt!243855 () Unit!9951)

(declare-fun Unit!9980 () Unit!9951)

(assert (=> b!156152 (= lt!243855 Unit!9980)))

(assert (=> b!156152 (= (bvadd (bitIndex!0 (size!3206 (buf!3709 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6800 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6795 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3206 (buf!3709 (_2!7388 lt!243861))) (currentByte!6800 (_2!7388 lt!243861)) (currentBit!6795 (_2!7388 lt!243861))))))

(declare-fun lt!243870 () Unit!9951)

(declare-fun Unit!9981 () Unit!9951)

(assert (=> b!156152 (= lt!243870 Unit!9981)))

(assert (=> b!156152 (and (= (buf!3709 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3709 (_2!7388 lt!243861))) (= (size!3206 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153))) (size!3206 (_3!433 lt!243861))))))

(declare-fun lt!243851 () Unit!9951)

(declare-fun Unit!9982 () Unit!9951)

(assert (=> b!156152 (= lt!243851 Unit!9982)))

(declare-fun lt!243874 () Unit!9951)

(declare-fun arrayUpdatedAtPrefixLemma!32 (array!7142 (_ BitVec 32) (_ BitVec 8)) Unit!9951)

(assert (=> b!156152 (= lt!243874 (arrayUpdatedAtPrefixLemma!32 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7390 lt!243863)))))

(declare-fun call!2376 () Bool)

(assert (=> b!156152 call!2376))

(declare-fun lt!243883 () Unit!9951)

(assert (=> b!156152 (= lt!243883 lt!243874)))

(declare-fun lt!243853 () (_ BitVec 32))

(assert (=> b!156152 (= lt!243853 #b00000000000000000000000000000000)))

(declare-fun lt!243876 () Unit!9951)

(declare-fun arrayRangesEqTransitive!97 (array!7142 array!7142 array!7142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9951)

(assert (=> b!156152 (= lt!243876 (arrayRangesEqTransitive!97 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)) lt!243881 (_3!433 lt!243861) lt!243853 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2378 () Bool)

(assert (=> b!156152 call!2378))

(declare-fun lt!243880 () Unit!9951)

(assert (=> b!156152 (= lt!243880 lt!243876)))

(declare-fun arrayRangesEq!421 (array!7142 array!7142 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156152 (arrayRangesEq!421 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)) (_3!433 lt!243861) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!243857 () Unit!9951)

(declare-fun Unit!9985 () Unit!9951)

(assert (=> b!156152 (= lt!243857 Unit!9985)))

(declare-fun lt!243860 () Unit!9951)

(declare-fun arrayRangesEqImpliesEq!41 (array!7142 array!7142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9951)

(assert (=> b!156152 (= lt!243860 (arrayRangesEqImpliesEq!41 lt!243881 (_3!433 lt!243861) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156152 (= (select (store (arr!4050 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7390 lt!243863)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4050 (_3!433 lt!243861)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243868 () Unit!9951)

(assert (=> b!156152 (= lt!243868 lt!243860)))

(declare-fun lt!243872 () Bool)

(assert (=> b!156152 (= lt!243872 (= (select (arr!4050 (_3!433 lt!243861)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7390 lt!243863)))))

(declare-fun Unit!9986 () Unit!9951)

(assert (=> b!156152 (= lt!243856 Unit!9986)))

(assert (=> b!156152 lt!243872))

(declare-fun b!156153 () Bool)

(declare-fun lt!243866 () Unit!9951)

(assert (=> b!156153 (= e!105429 (tuple3!633 lt!243866 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153))))))

(assert (=> b!156153 (= call!2377 call!2377)))

(declare-fun lt!243885 () Unit!9951)

(declare-fun Unit!9987 () Unit!9951)

(assert (=> b!156153 (= lt!243885 Unit!9987)))

(declare-fun lt!243852 () Unit!9951)

(declare-fun arrayRangesEqReflexiveLemma!31 (array!7142) Unit!9951)

(assert (=> b!156153 (= lt!243852 (arrayRangesEqReflexiveLemma!31 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153))))))

(assert (=> b!156153 call!2376))

(declare-fun lt!243859 () Unit!9951)

(assert (=> b!156153 (= lt!243859 lt!243852)))

(declare-fun lt!243875 () array!7142)

(assert (=> b!156153 (= lt!243875 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)))))

(declare-fun lt!243865 () array!7142)

(assert (=> b!156153 (= lt!243865 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)))))

(declare-fun lt!243854 () (_ BitVec 32))

(assert (=> b!156153 (= lt!243854 #b00000000000000000000000000000000)))

(declare-fun lt!243873 () (_ BitVec 32))

(assert (=> b!156153 (= lt!243873 (size!3206 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153))))))

(declare-fun lt!243878 () (_ BitVec 32))

(assert (=> b!156153 (= lt!243878 #b00000000000000000000000000000000)))

(declare-fun lt!243882 () (_ BitVec 32))

(assert (=> b!156153 (= lt!243882 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!31 (array!7142 array!7142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9951)

(assert (=> b!156153 (= lt!243866 (arrayRangesEqSlicedLemma!31 lt!243875 lt!243865 lt!243854 lt!243873 lt!243878 lt!243882))))

(assert (=> b!156153 call!2378))

(declare-fun bm!2373 () Bool)

(declare-fun c!8314 () Bool)

(assert (=> bm!2373 (= call!2377 (bitIndex!0 (ite c!8314 (size!3206 (buf!3709 (_2!7390 lt!243863))) (size!3206 (buf!3709 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))) (ite c!8314 (currentByte!6800 (_2!7390 lt!243863)) (currentByte!6800 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (ite c!8314 (currentBit!6795 (_2!7390 lt!243863)) (currentBit!6795 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(declare-fun bm!2374 () Bool)

(assert (=> bm!2374 (= call!2378 (arrayRangesEq!421 (ite c!8314 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)) lt!243875) (ite c!8314 (_3!433 lt!243861) lt!243865) (ite c!8314 lt!243853 lt!243878) (ite c!8314 (bvadd #b00000000000000000000000000000001 from!240) lt!243882)))))

(declare-fun b!156154 () Bool)

(declare-fun res!130531 () Bool)

(declare-fun e!105431 () Bool)

(assert (=> b!156154 (=> (not res!130531) (not e!105431))))

(declare-fun lt!243871 () tuple3!632)

(assert (=> b!156154 (= res!130531 (and (= (buf!3709 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3709 (_2!7388 lt!243871))) (= (size!3206 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153))) (size!3206 (_3!433 lt!243871)))))))

(declare-fun b!156155 () Bool)

(assert (=> b!156155 (= e!105431 (arrayRangesEq!421 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)) (_3!433 lt!243871) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun e!105430 () Bool)

(declare-fun b!156156 () Bool)

(assert (=> b!156156 (= e!105430 (= (select (arr!4050 (_3!433 lt!243871)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7382 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!156156 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3206 (_3!433 lt!243871))))))

(declare-fun bm!2375 () Bool)

(assert (=> bm!2375 (= call!2376 (arrayRangesEq!421 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)) (ite c!8314 (array!7143 (store (arr!4050 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7390 lt!243863)) (size!3206 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)))) (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153))) #b00000000000000000000000000000000 (ite c!8314 (bvadd #b00000000000000000000000000000001 from!240) (size!3206 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153))))))))

(declare-fun d!51848 () Bool)

(assert (=> d!51848 e!105430))

(declare-fun res!130532 () Bool)

(assert (=> d!51848 (=> res!130532 e!105430)))

(assert (=> d!51848 (= res!130532 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!243886 () Bool)

(assert (=> d!51848 (= lt!243886 e!105431)))

(declare-fun res!130533 () Bool)

(assert (=> d!51848 (=> (not res!130533) (not e!105431))))

(declare-fun lt!243879 () (_ BitVec 64))

(declare-fun lt!243884 () (_ BitVec 64))

(assert (=> d!51848 (= res!130533 (= (bvadd lt!243884 lt!243879) (bitIndex!0 (size!3206 (buf!3709 (_2!7388 lt!243871))) (currentByte!6800 (_2!7388 lt!243871)) (currentBit!6795 (_2!7388 lt!243871)))))))

(assert (=> d!51848 (or (not (= (bvand lt!243884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243879 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243884 lt!243879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243864 () (_ BitVec 64))

(assert (=> d!51848 (= lt!243879 (bvmul lt!243864 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51848 (or (= lt!243864 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243864 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243864)))))

(assert (=> d!51848 (= lt!243864 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!51848 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!51848 (= lt!243884 (bitIndex!0 (size!3206 (buf!3709 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6800 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6795 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(assert (=> d!51848 (= lt!243871 e!105429)))

(assert (=> d!51848 (= c!8314 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51848 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3206 (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)))))))

(assert (=> d!51848 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7143 (store (arr!4050 arr!153) from!240 (_2!7382 (readBytePure!0 bs!65))) (size!3206 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!243871)))

(assert (= (and d!51848 c!8314) b!156152))

(assert (= (and d!51848 (not c!8314)) b!156153))

(assert (= (or b!156152 b!156153) bm!2374))

(assert (= (or b!156152 b!156153) bm!2375))

(assert (= (or b!156152 b!156153) bm!2373))

(assert (= (and d!51848 res!130533) b!156154))

(assert (= (and b!156154 res!130531) b!156155))

(assert (= (and d!51848 (not res!130532)) b!156156))

(declare-fun m!243019 () Bool)

(assert (=> d!51848 m!243019))

(declare-fun m!243021 () Bool)

(assert (=> d!51848 m!243021))

(declare-fun m!243023 () Bool)

(assert (=> bm!2374 m!243023))

(declare-fun m!243025 () Bool)

(assert (=> bm!2373 m!243025))

(declare-fun m!243027 () Bool)

(assert (=> b!156156 m!243027))

(assert (=> b!156156 m!242819))

(declare-fun m!243029 () Bool)

(assert (=> b!156156 m!243029))

(declare-fun m!243031 () Bool)

(assert (=> bm!2375 m!243031))

(declare-fun m!243033 () Bool)

(assert (=> bm!2375 m!243033))

(declare-fun m!243035 () Bool)

(assert (=> b!156155 m!243035))

(declare-fun m!243037 () Bool)

(assert (=> b!156153 m!243037))

(declare-fun m!243039 () Bool)

(assert (=> b!156153 m!243039))

(declare-fun m!243041 () Bool)

(assert (=> b!156152 m!243041))

(declare-fun m!243043 () Bool)

(assert (=> b!156152 m!243043))

(declare-fun m!243045 () Bool)

(assert (=> b!156152 m!243045))

(declare-fun m!243047 () Bool)

(assert (=> b!156152 m!243047))

(declare-fun m!243049 () Bool)

(assert (=> b!156152 m!243049))

(declare-fun m!243051 () Bool)

(assert (=> b!156152 m!243051))

(assert (=> b!156152 m!243021))

(declare-fun m!243053 () Bool)

(assert (=> b!156152 m!243053))

(assert (=> b!156152 m!243031))

(declare-fun m!243055 () Bool)

(assert (=> b!156152 m!243055))

(assert (=> b!156152 m!242819))

(declare-fun m!243057 () Bool)

(assert (=> b!156152 m!243057))

(assert (=> b!156152 m!242819))

(declare-fun m!243059 () Bool)

(assert (=> b!156152 m!243059))

(declare-fun m!243063 () Bool)

(assert (=> b!156152 m!243063))

(assert (=> d!51808 d!51848))

(declare-fun d!51862 () Bool)

(assert (=> d!51862 (= (invariant!0 (currentBit!6795 bs!65) (currentByte!6800 bs!65) (size!3206 (buf!3709 bs!65))) (and (bvsge (currentBit!6795 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6795 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6800 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6800 bs!65) (size!3206 (buf!3709 bs!65))) (and (= (currentBit!6795 bs!65) #b00000000000000000000000000000000) (= (currentByte!6800 bs!65) (size!3206 (buf!3709 bs!65)))))))))

(assert (=> d!51820 d!51862))

(declare-fun b!156165 () Bool)

(declare-fun e!105438 () tuple3!632)

(declare-fun lt!243928 () Unit!9951)

(declare-fun lt!243933 () tuple3!632)

(assert (=> b!156165 (= e!105438 (tuple3!633 lt!243928 (_2!7388 lt!243933) (_3!433 lt!243933)))))

(declare-fun lt!243935 () tuple2!13912)

(assert (=> b!156165 (= lt!243935 (readByte!0 bs!65))))

(declare-fun lt!243953 () array!7142)

(assert (=> b!156165 (= lt!243953 (array!7143 (store (arr!4050 arr!153) from!240 (_1!7390 lt!243935)) (size!3206 arr!153)))))

(declare-fun lt!243949 () (_ BitVec 64))

(assert (=> b!156165 (= lt!243949 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243930 () (_ BitVec 32))

(assert (=> b!156165 (= lt!243930 (bvsub to!236 from!240))))

(declare-fun lt!243941 () Unit!9951)

(assert (=> b!156165 (= lt!243941 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7390 lt!243935) lt!243949 lt!243930))))

(assert (=> b!156165 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3206 (buf!3709 (_2!7390 lt!243935)))) ((_ sign_extend 32) (currentByte!6800 (_2!7390 lt!243935))) ((_ sign_extend 32) (currentBit!6795 (_2!7390 lt!243935))) (bvsub lt!243930 ((_ extract 31 0) (bvsdiv (bvadd lt!243949 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243939 () Unit!9951)

(assert (=> b!156165 (= lt!243939 lt!243941)))

(assert (=> b!156165 (= lt!243933 (readByteArrayLoop!0 (_2!7390 lt!243935) lt!243953 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2383 () (_ BitVec 64))

(assert (=> b!156165 (= call!2383 (bvadd (bitIndex!0 (size!3206 (buf!3709 bs!65)) (currentByte!6800 bs!65) (currentBit!6795 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243934 () Unit!9951)

(declare-fun Unit!9989 () Unit!9951)

(assert (=> b!156165 (= lt!243934 Unit!9989)))

(assert (=> b!156165 (= (bvadd call!2383 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3206 (buf!3709 (_2!7388 lt!243933))) (currentByte!6800 (_2!7388 lt!243933)) (currentBit!6795 (_2!7388 lt!243933))))))

(declare-fun lt!243927 () Unit!9951)

(declare-fun Unit!9990 () Unit!9951)

(assert (=> b!156165 (= lt!243927 Unit!9990)))

(assert (=> b!156165 (= (bvadd (bitIndex!0 (size!3206 (buf!3709 bs!65)) (currentByte!6800 bs!65) (currentBit!6795 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3206 (buf!3709 (_2!7388 lt!243933))) (currentByte!6800 (_2!7388 lt!243933)) (currentBit!6795 (_2!7388 lt!243933))))))

(declare-fun lt!243942 () Unit!9951)

(declare-fun Unit!9992 () Unit!9951)

(assert (=> b!156165 (= lt!243942 Unit!9992)))

(assert (=> b!156165 (and (= (buf!3709 bs!65) (buf!3709 (_2!7388 lt!243933))) (= (size!3206 arr!153) (size!3206 (_3!433 lt!243933))))))

(declare-fun lt!243923 () Unit!9951)

(declare-fun Unit!9993 () Unit!9951)

(assert (=> b!156165 (= lt!243923 Unit!9993)))

(declare-fun lt!243946 () Unit!9951)

(assert (=> b!156165 (= lt!243946 (arrayUpdatedAtPrefixLemma!32 arr!153 from!240 (_1!7390 lt!243935)))))

(declare-fun call!2382 () Bool)

(assert (=> b!156165 call!2382))

(declare-fun lt!243955 () Unit!9951)

(assert (=> b!156165 (= lt!243955 lt!243946)))

(declare-fun lt!243925 () (_ BitVec 32))

(assert (=> b!156165 (= lt!243925 #b00000000000000000000000000000000)))

(declare-fun lt!243948 () Unit!9951)

(assert (=> b!156165 (= lt!243948 (arrayRangesEqTransitive!97 arr!153 lt!243953 (_3!433 lt!243933) lt!243925 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2384 () Bool)

(assert (=> b!156165 call!2384))

(declare-fun lt!243952 () Unit!9951)

(assert (=> b!156165 (= lt!243952 lt!243948)))

(assert (=> b!156165 (arrayRangesEq!421 arr!153 (_3!433 lt!243933) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!243929 () Unit!9951)

(declare-fun Unit!9994 () Unit!9951)

(assert (=> b!156165 (= lt!243929 Unit!9994)))

(declare-fun lt!243932 () Unit!9951)

(assert (=> b!156165 (= lt!243932 (arrayRangesEqImpliesEq!41 lt!243953 (_3!433 lt!243933) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156165 (= (select (store (arr!4050 arr!153) from!240 (_1!7390 lt!243935)) from!240) (select (arr!4050 (_3!433 lt!243933)) from!240))))

(declare-fun lt!243940 () Unit!9951)

(assert (=> b!156165 (= lt!243940 lt!243932)))

(declare-fun lt!243944 () Bool)

(assert (=> b!156165 (= lt!243944 (= (select (arr!4050 (_3!433 lt!243933)) from!240) (_1!7390 lt!243935)))))

(declare-fun Unit!9995 () Unit!9951)

(assert (=> b!156165 (= lt!243928 Unit!9995)))

(assert (=> b!156165 lt!243944))

(declare-fun lt!243938 () Unit!9951)

(declare-fun b!156166 () Bool)

(assert (=> b!156166 (= e!105438 (tuple3!633 lt!243938 bs!65 arr!153))))

(assert (=> b!156166 (= call!2383 call!2383)))

(declare-fun lt!243957 () Unit!9951)

(declare-fun Unit!9996 () Unit!9951)

(assert (=> b!156166 (= lt!243957 Unit!9996)))

(declare-fun lt!243924 () Unit!9951)

(assert (=> b!156166 (= lt!243924 (arrayRangesEqReflexiveLemma!31 arr!153))))

(assert (=> b!156166 call!2382))

(declare-fun lt!243931 () Unit!9951)

(assert (=> b!156166 (= lt!243931 lt!243924)))

(declare-fun lt!243947 () array!7142)

(assert (=> b!156166 (= lt!243947 arr!153)))

(declare-fun lt!243937 () array!7142)

(assert (=> b!156166 (= lt!243937 arr!153)))

(declare-fun lt!243926 () (_ BitVec 32))

(assert (=> b!156166 (= lt!243926 #b00000000000000000000000000000000)))

(declare-fun lt!243945 () (_ BitVec 32))

(assert (=> b!156166 (= lt!243945 (size!3206 arr!153))))

(declare-fun lt!243950 () (_ BitVec 32))

(assert (=> b!156166 (= lt!243950 #b00000000000000000000000000000000)))

(declare-fun lt!243954 () (_ BitVec 32))

(assert (=> b!156166 (= lt!243954 from!240)))

(assert (=> b!156166 (= lt!243938 (arrayRangesEqSlicedLemma!31 lt!243947 lt!243937 lt!243926 lt!243945 lt!243950 lt!243954))))

(assert (=> b!156166 call!2384))

(declare-fun bm!2379 () Bool)

(declare-fun c!8316 () Bool)

(assert (=> bm!2379 (= call!2383 (bitIndex!0 (ite c!8316 (size!3206 (buf!3709 (_2!7390 lt!243935))) (size!3206 (buf!3709 bs!65))) (ite c!8316 (currentByte!6800 (_2!7390 lt!243935)) (currentByte!6800 bs!65)) (ite c!8316 (currentBit!6795 (_2!7390 lt!243935)) (currentBit!6795 bs!65))))))

(declare-fun bm!2380 () Bool)

(assert (=> bm!2380 (= call!2384 (arrayRangesEq!421 (ite c!8316 arr!153 lt!243947) (ite c!8316 (_3!433 lt!243933) lt!243937) (ite c!8316 lt!243925 lt!243950) (ite c!8316 from!240 lt!243954)))))

(declare-fun b!156167 () Bool)

(declare-fun res!130540 () Bool)

(declare-fun e!105440 () Bool)

(assert (=> b!156167 (=> (not res!130540) (not e!105440))))

(declare-fun lt!243943 () tuple3!632)

(assert (=> b!156167 (= res!130540 (and (= (buf!3709 bs!65) (buf!3709 (_2!7388 lt!243943))) (= (size!3206 arr!153) (size!3206 (_3!433 lt!243943)))))))

(declare-fun b!156168 () Bool)

(assert (=> b!156168 (= e!105440 (arrayRangesEq!421 arr!153 (_3!433 lt!243943) #b00000000000000000000000000000000 from!240))))

(declare-fun e!105439 () Bool)

(declare-fun b!156169 () Bool)

(assert (=> b!156169 (= e!105439 (= (select (arr!4050 (_3!433 lt!243943)) from!240) (_2!7382 (readBytePure!0 bs!65))))))

(assert (=> b!156169 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3206 (_3!433 lt!243943))))))

(declare-fun bm!2381 () Bool)

(assert (=> bm!2381 (= call!2382 (arrayRangesEq!421 arr!153 (ite c!8316 (array!7143 (store (arr!4050 arr!153) from!240 (_1!7390 lt!243935)) (size!3206 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8316 from!240 (size!3206 arr!153))))))

(declare-fun d!51864 () Bool)

(assert (=> d!51864 e!105439))

(declare-fun res!130541 () Bool)

(assert (=> d!51864 (=> res!130541 e!105439)))

(assert (=> d!51864 (= res!130541 (bvsge from!240 to!236))))

(declare-fun lt!243958 () Bool)

(assert (=> d!51864 (= lt!243958 e!105440)))

(declare-fun res!130542 () Bool)

(assert (=> d!51864 (=> (not res!130542) (not e!105440))))

(declare-fun lt!243956 () (_ BitVec 64))

(declare-fun lt!243951 () (_ BitVec 64))

(assert (=> d!51864 (= res!130542 (= (bvadd lt!243956 lt!243951) (bitIndex!0 (size!3206 (buf!3709 (_2!7388 lt!243943))) (currentByte!6800 (_2!7388 lt!243943)) (currentBit!6795 (_2!7388 lt!243943)))))))

(assert (=> d!51864 (or (not (= (bvand lt!243956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243951 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243956 lt!243951) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243936 () (_ BitVec 64))

(assert (=> d!51864 (= lt!243951 (bvmul lt!243936 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51864 (or (= lt!243936 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243936 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243936)))))

(assert (=> d!51864 (= lt!243936 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51864 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51864 (= lt!243956 (bitIndex!0 (size!3206 (buf!3709 bs!65)) (currentByte!6800 bs!65) (currentBit!6795 bs!65)))))

(assert (=> d!51864 (= lt!243943 e!105438)))

(assert (=> d!51864 (= c!8316 (bvslt from!240 to!236))))

(assert (=> d!51864 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3206 arr!153)))))

(assert (=> d!51864 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!243943)))

(assert (= (and d!51864 c!8316) b!156165))

(assert (= (and d!51864 (not c!8316)) b!156166))

(assert (= (or b!156165 b!156166) bm!2380))

(assert (= (or b!156165 b!156166) bm!2381))

(assert (= (or b!156165 b!156166) bm!2379))

(assert (= (and d!51864 res!130542) b!156167))

(assert (= (and b!156167 res!130540) b!156168))

(assert (= (and d!51864 (not res!130541)) b!156169))

(declare-fun m!243105 () Bool)

(assert (=> d!51864 m!243105))

(declare-fun m!243111 () Bool)

(assert (=> d!51864 m!243111))

(declare-fun m!243113 () Bool)

(assert (=> bm!2380 m!243113))

(declare-fun m!243115 () Bool)

(assert (=> bm!2379 m!243115))

(declare-fun m!243117 () Bool)

(assert (=> b!156169 m!243117))

(assert (=> b!156169 m!242817))

(declare-fun m!243119 () Bool)

(assert (=> bm!2381 m!243119))

(declare-fun m!243121 () Bool)

(assert (=> bm!2381 m!243121))

(declare-fun m!243123 () Bool)

(assert (=> b!156168 m!243123))

(declare-fun m!243125 () Bool)

(assert (=> b!156166 m!243125))

(declare-fun m!243127 () Bool)

(assert (=> b!156166 m!243127))

(declare-fun m!243129 () Bool)

(assert (=> b!156165 m!243129))

(declare-fun m!243131 () Bool)

(assert (=> b!156165 m!243131))

(declare-fun m!243133 () Bool)

(assert (=> b!156165 m!243133))

(declare-fun m!243135 () Bool)

(assert (=> b!156165 m!243135))

(declare-fun m!243137 () Bool)

(assert (=> b!156165 m!243137))

(declare-fun m!243139 () Bool)

(assert (=> b!156165 m!243139))

(assert (=> b!156165 m!243111))

(declare-fun m!243141 () Bool)

(assert (=> b!156165 m!243141))

(assert (=> b!156165 m!243119))

(declare-fun m!243143 () Bool)

(assert (=> b!156165 m!243143))

(assert (=> b!156165 m!242865))

(declare-fun m!243145 () Bool)

(assert (=> b!156165 m!243145))

(declare-fun m!243147 () Bool)

(assert (=> b!156165 m!243147))

(assert (=> d!51816 d!51864))

(declare-fun d!51868 () Bool)

(declare-fun lt!244000 () (_ BitVec 8))

(declare-fun lt!243996 () (_ BitVec 8))

(assert (=> d!51868 (= lt!244000 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4050 (buf!3709 bs!65)) (currentByte!6800 bs!65))) ((_ sign_extend 24) lt!243996))))))

(assert (=> d!51868 (= lt!243996 ((_ extract 7 0) (currentBit!6795 bs!65)))))

(declare-fun e!105451 () Bool)

(assert (=> d!51868 e!105451))

(declare-fun res!130555 () Bool)

(assert (=> d!51868 (=> (not res!130555) (not e!105451))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51868 (= res!130555 (validate_offset_bits!1 ((_ sign_extend 32) (size!3206 (buf!3709 bs!65))) ((_ sign_extend 32) (currentByte!6800 bs!65)) ((_ sign_extend 32) (currentBit!6795 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13920 0))(
  ( (tuple2!13921 (_1!7395 Unit!9951) (_2!7395 (_ BitVec 8))) )
))
(declare-fun Unit!10003 () Unit!9951)

(declare-fun Unit!10004 () Unit!9951)

(assert (=> d!51868 (= (readByte!0 bs!65) (tuple2!13913 (_2!7395 (ite (bvsgt ((_ sign_extend 24) lt!243996) #b00000000000000000000000000000000) (tuple2!13921 Unit!10003 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!244000) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4050 (buf!3709 bs!65)) (bvadd (currentByte!6800 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!243996)))))))) (tuple2!13921 Unit!10004 lt!244000))) (BitStream!5671 (buf!3709 bs!65) (bvadd (currentByte!6800 bs!65) #b00000000000000000000000000000001) (currentBit!6795 bs!65))))))

(declare-fun b!156180 () Bool)

(declare-fun e!105452 () Bool)

(assert (=> b!156180 (= e!105451 e!105452)))

(declare-fun res!130556 () Bool)

(assert (=> b!156180 (=> (not res!130556) (not e!105452))))

(declare-fun lt!243999 () tuple2!13912)

(assert (=> b!156180 (= res!130556 (= (buf!3709 (_2!7390 lt!243999)) (buf!3709 bs!65)))))

(declare-fun lt!243994 () (_ BitVec 8))

(declare-fun lt!243995 () (_ BitVec 8))

(declare-fun Unit!10005 () Unit!9951)

(declare-fun Unit!10006 () Unit!9951)

(assert (=> b!156180 (= lt!243999 (tuple2!13913 (_2!7395 (ite (bvsgt ((_ sign_extend 24) lt!243994) #b00000000000000000000000000000000) (tuple2!13921 Unit!10005 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!243995) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4050 (buf!3709 bs!65)) (bvadd (currentByte!6800 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!243994)))))))) (tuple2!13921 Unit!10006 lt!243995))) (BitStream!5671 (buf!3709 bs!65) (bvadd (currentByte!6800 bs!65) #b00000000000000000000000000000001) (currentBit!6795 bs!65))))))

(assert (=> b!156180 (= lt!243995 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4050 (buf!3709 bs!65)) (currentByte!6800 bs!65))) ((_ sign_extend 24) lt!243994))))))

(assert (=> b!156180 (= lt!243994 ((_ extract 7 0) (currentBit!6795 bs!65)))))

(declare-fun lt!243998 () (_ BitVec 64))

(declare-fun b!156181 () Bool)

(declare-fun lt!243997 () (_ BitVec 64))

(assert (=> b!156181 (= e!105452 (= (bitIndex!0 (size!3206 (buf!3709 (_2!7390 lt!243999))) (currentByte!6800 (_2!7390 lt!243999)) (currentBit!6795 (_2!7390 lt!243999))) (bvadd lt!243997 lt!243998)))))

(assert (=> b!156181 (or (not (= (bvand lt!243997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243998 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243997 lt!243998) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156181 (= lt!243998 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156181 (= lt!243997 (bitIndex!0 (size!3206 (buf!3709 bs!65)) (currentByte!6800 bs!65) (currentBit!6795 bs!65)))))

(assert (= (and d!51868 res!130555) b!156180))

(assert (= (and b!156180 res!130556) b!156181))

(declare-fun m!243157 () Bool)

(assert (=> d!51868 m!243157))

(declare-fun m!243159 () Bool)

(assert (=> d!51868 m!243159))

(declare-fun m!243161 () Bool)

(assert (=> d!51868 m!243161))

(assert (=> b!156180 m!243161))

(assert (=> b!156180 m!243157))

(declare-fun m!243163 () Bool)

(assert (=> b!156181 m!243163))

(assert (=> b!156181 m!243111))

(assert (=> d!51812 d!51868))

(check-sat (not b!156168) (not b!156166) (not b!156165) (not bm!2375) (not d!51864) (not bm!2373) (not b!156152) (not bm!2374) (not bm!2381) (not b!156156) (not d!51846) (not b!156155) (not b!156181) (not d!51848) (not b!156169) (not bm!2380) (not bm!2379) (not d!51868) (not b!156153))
