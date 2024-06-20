; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58104 () Bool)

(assert start!58104)

(declare-fun b!266939 () Bool)

(declare-fun e!186837 () Bool)

(declare-datatypes ((array!14873 0))(
  ( (array!14874 (arr!7471 (Array (_ BitVec 32) (_ BitVec 8))) (size!6484 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11782 0))(
  ( (BitStream!11783 (buf!6952 array!14873) (currentByte!12849 (_ BitVec 32)) (currentBit!12844 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11782)

(declare-fun w2!580 () BitStream!11782)

(declare-fun arrayBitRangesEq!0 (array!14873 array!14873 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266939 (= e!186837 (not (arrayBitRangesEq!0 (buf!6952 w1!584) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)))))))

(declare-fun b!266940 () Bool)

(declare-fun e!186839 () Bool)

(declare-fun e!186840 () Bool)

(assert (=> b!266940 (= e!186839 (not e!186840))))

(declare-fun res!222911 () Bool)

(assert (=> b!266940 (=> res!222911 e!186840)))

(assert (=> b!266940 (= res!222911 e!186837)))

(declare-fun res!222913 () Bool)

(assert (=> b!266940 (=> (not res!222913) (not e!186837))))

(assert (=> b!266940 (= res!222913 (not (= (size!6484 (buf!6952 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11782 BitStream!11782) Bool)

(assert (=> b!266940 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18950 0))(
  ( (Unit!18951) )
))
(declare-fun lt!407598 () Unit!18950)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11782) Unit!18950)

(assert (=> b!266940 (= lt!407598 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407606 () BitStream!11782)

(assert (=> b!266940 (isPrefixOf!0 lt!407606 lt!407606)))

(declare-fun lt!407602 () Unit!18950)

(assert (=> b!266940 (= lt!407602 (lemmaIsPrefixRefl!0 lt!407606))))

(assert (=> b!266940 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407603 () Unit!18950)

(assert (=> b!266940 (= lt!407603 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266940 (= lt!407606 (BitStream!11783 (buf!6952 w2!580) (currentByte!12849 w1!584) (currentBit!12844 w1!584)))))

(declare-fun b!266941 () Bool)

(declare-fun e!186836 () Bool)

(declare-fun array_inv!6208 (array!14873) Bool)

(assert (=> b!266941 (= e!186836 (array_inv!6208 (buf!6952 w1!584)))))

(declare-fun b!266942 () Bool)

(declare-fun e!186833 () Unit!18950)

(declare-fun lt!407605 () Unit!18950)

(assert (=> b!266942 (= e!186833 lt!407605)))

(declare-fun lt!407600 () (_ BitVec 64))

(assert (=> b!266942 (= lt!407600 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14873 array!14873 (_ BitVec 64) (_ BitVec 64)) Unit!18950)

(assert (=> b!266942 (= lt!407605 (arrayBitRangesEqSymmetric!0 (buf!6952 w1!584) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600))))

(assert (=> b!266942 (arrayBitRangesEq!0 (buf!6952 w2!580) (buf!6952 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600)))

(declare-fun b!266943 () Bool)

(declare-fun e!186831 () Bool)

(assert (=> b!266943 (= e!186831 (not (arrayBitRangesEq!0 (buf!6952 w2!580) (buf!6952 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)))))))

(declare-fun b!266944 () Bool)

(declare-fun e!186838 () Bool)

(assert (=> b!266944 (= e!186840 e!186838)))

(declare-fun res!222912 () Bool)

(assert (=> b!266944 (=> res!222912 e!186838)))

(assert (=> b!266944 (= res!222912 e!186831)))

(declare-fun res!222915 () Bool)

(assert (=> b!266944 (=> (not res!222915) (not e!186831))))

(assert (=> b!266944 (= res!222915 (not (= (size!6484 (buf!6952 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407601 () Unit!18950)

(assert (=> b!266944 (= lt!407601 e!186833)))

(declare-fun c!12306 () Bool)

(assert (=> b!266944 (= c!12306 (not (= (size!6484 (buf!6952 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun res!222916 () Bool)

(assert (=> start!58104 (=> (not res!222916) (not e!186839))))

(assert (=> start!58104 (= res!222916 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58104 e!186839))

(declare-fun inv!12 (BitStream!11782) Bool)

(assert (=> start!58104 (and (inv!12 w1!584) e!186836)))

(declare-fun e!186835 () Bool)

(assert (=> start!58104 (and (inv!12 w2!580) e!186835)))

(declare-fun b!266945 () Bool)

(declare-fun res!222914 () Bool)

(assert (=> b!266945 (=> res!222914 e!186838)))

(assert (=> b!266945 (= res!222914 (not (isPrefixOf!0 lt!407606 w1!584)))))

(declare-fun b!266946 () Bool)

(assert (=> b!266946 (= e!186835 (array_inv!6208 (buf!6952 w2!580)))))

(declare-fun b!266947 () Bool)

(declare-fun Unit!18952 () Unit!18950)

(assert (=> b!266947 (= e!186833 Unit!18952)))

(declare-fun b!266948 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!11782 (_ BitVec 64)) BitStream!11782)

(assert (=> b!266948 (= e!186838 (= lt!407606 (withMovedBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))))))))

(declare-fun lt!407604 () Unit!18950)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11782 BitStream!11782 BitStream!11782) Unit!18950)

(assert (=> b!266948 (= lt!407604 (lemmaIsPrefixTransitive!0 lt!407606 w2!580 w2!580))))

(assert (=> b!266948 (isPrefixOf!0 lt!407606 w2!580)))

(declare-fun lt!407599 () Unit!18950)

(assert (=> b!266948 (= lt!407599 (lemmaIsPrefixTransitive!0 lt!407606 w1!584 w2!580))))

(assert (= (and start!58104 res!222916) b!266940))

(assert (= (and b!266940 res!222913) b!266939))

(assert (= (and b!266940 (not res!222911)) b!266944))

(assert (= (and b!266944 c!12306) b!266942))

(assert (= (and b!266944 (not c!12306)) b!266947))

(assert (= (and b!266944 res!222915) b!266943))

(assert (= (and b!266944 (not res!222912)) b!266945))

(assert (= (and b!266945 (not res!222914)) b!266948))

(assert (= start!58104 b!266941))

(assert (= start!58104 b!266946))

(declare-fun m!397871 () Bool)

(assert (=> b!266939 m!397871))

(assert (=> b!266939 m!397871))

(declare-fun m!397873 () Bool)

(assert (=> b!266939 m!397873))

(assert (=> b!266943 m!397871))

(assert (=> b!266943 m!397871))

(declare-fun m!397875 () Bool)

(assert (=> b!266943 m!397875))

(declare-fun m!397877 () Bool)

(assert (=> start!58104 m!397877))

(declare-fun m!397879 () Bool)

(assert (=> start!58104 m!397879))

(declare-fun m!397881 () Bool)

(assert (=> start!58104 m!397881))

(declare-fun m!397883 () Bool)

(assert (=> b!266946 m!397883))

(declare-fun m!397885 () Bool)

(assert (=> b!266948 m!397885))

(assert (=> b!266948 m!397871))

(declare-fun m!397887 () Bool)

(assert (=> b!266948 m!397887))

(declare-fun m!397889 () Bool)

(assert (=> b!266948 m!397889))

(declare-fun m!397891 () Bool)

(assert (=> b!266948 m!397891))

(declare-fun m!397893 () Bool)

(assert (=> b!266948 m!397893))

(declare-fun m!397895 () Bool)

(assert (=> b!266940 m!397895))

(declare-fun m!397897 () Bool)

(assert (=> b!266940 m!397897))

(declare-fun m!397899 () Bool)

(assert (=> b!266940 m!397899))

(declare-fun m!397901 () Bool)

(assert (=> b!266940 m!397901))

(declare-fun m!397903 () Bool)

(assert (=> b!266940 m!397903))

(declare-fun m!397905 () Bool)

(assert (=> b!266940 m!397905))

(assert (=> b!266942 m!397871))

(declare-fun m!397907 () Bool)

(assert (=> b!266942 m!397907))

(declare-fun m!397909 () Bool)

(assert (=> b!266942 m!397909))

(declare-fun m!397911 () Bool)

(assert (=> b!266945 m!397911))

(declare-fun m!397913 () Bool)

(assert (=> b!266941 m!397913))

(push 1)

(assert (not b!266939))

(assert (not b!266940))

(assert (not b!266945))

(assert (not b!266948))

(assert (not start!58104))

(assert (not b!266946))

(assert (not b!266941))

(assert (not b!266942))

(assert (not b!266943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90080 () Bool)

(declare-fun e!186907 () Bool)

(assert (=> d!90080 e!186907))

(declare-fun res!222963 () Bool)

(assert (=> d!90080 (=> (not res!222963) (not e!186907))))

(declare-fun lt!407679 () (_ BitVec 64))

(declare-fun lt!407680 () (_ BitVec 64))

(declare-fun lt!407677 () (_ BitVec 64))

(assert (=> d!90080 (= res!222963 (= lt!407677 (bvsub lt!407679 lt!407680)))))

(assert (=> d!90080 (or (= (bvand lt!407679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407680 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407679 lt!407680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90080 (= lt!407680 (remainingBits!0 ((_ sign_extend 32) (size!6484 (buf!6952 w2!580))) ((_ sign_extend 32) (currentByte!12849 w2!580)) ((_ sign_extend 32) (currentBit!12844 w2!580))))))

(declare-fun lt!407678 () (_ BitVec 64))

(declare-fun lt!407681 () (_ BitVec 64))

(assert (=> d!90080 (= lt!407679 (bvmul lt!407678 lt!407681))))

(assert (=> d!90080 (or (= lt!407678 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407681 (bvsdiv (bvmul lt!407678 lt!407681) lt!407678)))))

(assert (=> d!90080 (= lt!407681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90080 (= lt!407678 ((_ sign_extend 32) (size!6484 (buf!6952 w2!580))))))

(assert (=> d!90080 (= lt!407677 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12849 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12844 w2!580))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90080 (invariant!0 (currentBit!12844 w2!580) (currentByte!12849 w2!580) (size!6484 (buf!6952 w2!580)))))

(assert (=> d!90080 (= (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)) lt!407677)))

(declare-fun b!267019 () Bool)

(declare-fun res!222964 () Bool)

(assert (=> b!267019 (=> (not res!222964) (not e!186907))))

(assert (=> b!267019 (= res!222964 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407677))))

(declare-fun b!267020 () Bool)

(declare-fun lt!407682 () (_ BitVec 64))

(assert (=> b!267020 (= e!186907 (bvsle lt!407677 (bvmul lt!407682 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267020 (or (= lt!407682 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407682 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407682)))))

(assert (=> b!267020 (= lt!407682 ((_ sign_extend 32) (size!6484 (buf!6952 w2!580))))))

(assert (= (and d!90080 res!222963) b!267019))

(assert (= (and b!267019 res!222964) b!267020))

(declare-fun m!398007 () Bool)

(assert (=> d!90080 m!398007))

(declare-fun m!398009 () Bool)

(assert (=> d!90080 m!398009))

(assert (=> b!266948 d!90080))

(declare-fun d!90090 () Bool)

(assert (=> d!90090 (isPrefixOf!0 lt!407606 w2!580)))

(declare-fun lt!407686 () Unit!18950)

(declare-fun choose!30 (BitStream!11782 BitStream!11782 BitStream!11782) Unit!18950)

(assert (=> d!90090 (= lt!407686 (choose!30 lt!407606 w1!584 w2!580))))

(assert (=> d!90090 (isPrefixOf!0 lt!407606 w1!584)))

(assert (=> d!90090 (= (lemmaIsPrefixTransitive!0 lt!407606 w1!584 w2!580) lt!407686)))

(declare-fun bs!22882 () Bool)

(assert (= bs!22882 d!90090))

(assert (=> bs!22882 m!397893))

(declare-fun m!398021 () Bool)

(assert (=> bs!22882 m!398021))

(assert (=> bs!22882 m!397911))

(assert (=> b!266948 d!90090))

(declare-fun d!90100 () Bool)

(assert (=> d!90100 (isPrefixOf!0 lt!407606 w2!580)))

(declare-fun lt!407687 () Unit!18950)

(assert (=> d!90100 (= lt!407687 (choose!30 lt!407606 w2!580 w2!580))))

(assert (=> d!90100 (isPrefixOf!0 lt!407606 w2!580)))

(assert (=> d!90100 (= (lemmaIsPrefixTransitive!0 lt!407606 w2!580 w2!580) lt!407687)))

(declare-fun bs!22883 () Bool)

(assert (= bs!22883 d!90100))

(assert (=> bs!22883 m!397893))

(declare-fun m!398023 () Bool)

(assert (=> bs!22883 m!398023))

(assert (=> bs!22883 m!397893))

(assert (=> b!266948 d!90100))

(declare-fun d!90102 () Bool)

(declare-fun res!222990 () Bool)

(declare-fun e!186931 () Bool)

(assert (=> d!90102 (=> (not res!222990) (not e!186931))))

(assert (=> d!90102 (= res!222990 (= (size!6484 (buf!6952 lt!407606)) (size!6484 (buf!6952 w2!580))))))

(assert (=> d!90102 (= (isPrefixOf!0 lt!407606 w2!580) e!186931)))

(declare-fun b!267050 () Bool)

(declare-fun res!222992 () Bool)

(assert (=> b!267050 (=> (not res!222992) (not e!186931))))

(assert (=> b!267050 (= res!222992 (bvsle (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))))))

(declare-fun b!267051 () Bool)

(declare-fun e!186930 () Bool)

(assert (=> b!267051 (= e!186931 e!186930)))

(declare-fun res!222991 () Bool)

(assert (=> b!267051 (=> res!222991 e!186930)))

(assert (=> b!267051 (= res!222991 (= (size!6484 (buf!6952 lt!407606)) #b00000000000000000000000000000000))))

(declare-fun b!267052 () Bool)

(assert (=> b!267052 (= e!186930 (arrayBitRangesEq!0 (buf!6952 lt!407606) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))))))

(assert (= (and d!90102 res!222990) b!267050))

(assert (= (and b!267050 res!222992) b!267051))

(assert (= (and b!267051 (not res!222991)) b!267052))

(declare-fun m!398027 () Bool)

(assert (=> b!267050 m!398027))

(assert (=> b!267050 m!397887))

(assert (=> b!267052 m!398027))

(assert (=> b!267052 m!398027))

(declare-fun m!398029 () Bool)

(assert (=> b!267052 m!398029))

(assert (=> b!266948 d!90102))

(declare-fun d!90106 () Bool)

(declare-fun e!186932 () Bool)

(assert (=> d!90106 e!186932))

(declare-fun res!222993 () Bool)

(assert (=> d!90106 (=> (not res!222993) (not e!186932))))

(declare-fun lt!407700 () (_ BitVec 64))

(declare-fun lt!407699 () (_ BitVec 64))

(declare-fun lt!407697 () (_ BitVec 64))

(assert (=> d!90106 (= res!222993 (= lt!407697 (bvsub lt!407699 lt!407700)))))

(assert (=> d!90106 (or (= (bvand lt!407699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407700 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407699 lt!407700) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90106 (= lt!407700 (remainingBits!0 ((_ sign_extend 32) (size!6484 (buf!6952 w1!584))) ((_ sign_extend 32) (currentByte!12849 w1!584)) ((_ sign_extend 32) (currentBit!12844 w1!584))))))

(declare-fun lt!407698 () (_ BitVec 64))

(declare-fun lt!407701 () (_ BitVec 64))

(assert (=> d!90106 (= lt!407699 (bvmul lt!407698 lt!407701))))

(assert (=> d!90106 (or (= lt!407698 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407701 (bvsdiv (bvmul lt!407698 lt!407701) lt!407698)))))

(assert (=> d!90106 (= lt!407701 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90106 (= lt!407698 ((_ sign_extend 32) (size!6484 (buf!6952 w1!584))))))

(assert (=> d!90106 (= lt!407697 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12849 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12844 w1!584))))))

(assert (=> d!90106 (invariant!0 (currentBit!12844 w1!584) (currentByte!12849 w1!584) (size!6484 (buf!6952 w1!584)))))

(assert (=> d!90106 (= (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) lt!407697)))

(declare-fun b!267053 () Bool)

(declare-fun res!222994 () Bool)

(assert (=> b!267053 (=> (not res!222994) (not e!186932))))

(assert (=> b!267053 (= res!222994 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407697))))

(declare-fun b!267054 () Bool)

(declare-fun lt!407702 () (_ BitVec 64))

(assert (=> b!267054 (= e!186932 (bvsle lt!407697 (bvmul lt!407702 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267054 (or (= lt!407702 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407702 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407702)))))

(assert (=> b!267054 (= lt!407702 ((_ sign_extend 32) (size!6484 (buf!6952 w1!584))))))

(assert (= (and d!90106 res!222993) b!267053))

(assert (= (and b!267053 res!222994) b!267054))

(declare-fun m!398031 () Bool)

(assert (=> d!90106 m!398031))

(declare-fun m!398033 () Bool)

(assert (=> d!90106 m!398033))

(assert (=> b!266948 d!90106))

(declare-fun d!90108 () Bool)

(declare-fun e!186941 () Bool)

(assert (=> d!90108 e!186941))

(declare-fun res!223002 () Bool)

(assert (=> d!90108 (=> (not res!223002) (not e!186941))))

(declare-fun lt!407711 () (_ BitVec 64))

(declare-fun lt!407710 () BitStream!11782)

(assert (=> d!90108 (= res!223002 (= (bvadd lt!407711 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))) (bitIndex!0 (size!6484 (buf!6952 lt!407710)) (currentByte!12849 lt!407710) (currentBit!12844 lt!407710))))))

(assert (=> d!90108 (or (not (= (bvand lt!407711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!407711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!407711 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90108 (= lt!407711 (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))))

(declare-datatypes ((tuple2!22400 0))(
  ( (tuple2!22401 (_1!12179 Unit!18950) (_2!12179 BitStream!11782)) )
))
(declare-fun moveBitIndex!0 (BitStream!11782 (_ BitVec 64)) tuple2!22400)

(assert (=> d!90108 (= lt!407710 (_2!12179 (moveBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!11782 (_ BitVec 64)) Bool)

(assert (=> d!90108 (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))))))

(assert (=> d!90108 (= (withMovedBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))) lt!407710)))

(declare-fun b!267064 () Bool)

(assert (=> b!267064 (= e!186941 (= (size!6484 (buf!6952 w2!580)) (size!6484 (buf!6952 lt!407710))))))

(assert (= (and d!90108 res!223002) b!267064))

(declare-fun m!398051 () Bool)

(assert (=> d!90108 m!398051))

(assert (=> d!90108 m!397887))

(declare-fun m!398053 () Bool)

(assert (=> d!90108 m!398053))

(declare-fun m!398055 () Bool)

(assert (=> d!90108 m!398055))

(assert (=> b!266948 d!90108))

(assert (=> b!266942 d!90106))

(declare-fun d!90112 () Bool)

(assert (=> d!90112 (arrayBitRangesEq!0 (buf!6952 w2!580) (buf!6952 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600)))

(declare-fun lt!407726 () Unit!18950)

(declare-fun choose!8 (array!14873 array!14873 (_ BitVec 64) (_ BitVec 64)) Unit!18950)

(assert (=> d!90112 (= lt!407726 (choose!8 (buf!6952 w1!584) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600))))

(assert (=> d!90112 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600))))

(assert (=> d!90112 (= (arrayBitRangesEqSymmetric!0 (buf!6952 w1!584) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600) lt!407726)))

(declare-fun bs!22885 () Bool)

(assert (= bs!22885 d!90112))

(assert (=> bs!22885 m!397909))

(declare-fun m!398057 () Bool)

(assert (=> bs!22885 m!398057))

(assert (=> b!266942 d!90112))

(declare-fun b!267119 () Bool)

(declare-fun e!186984 () Bool)

(declare-fun call!4189 () Bool)

(assert (=> b!267119 (= e!186984 call!4189)))

(declare-fun b!267120 () Bool)

(declare-fun e!186987 () Bool)

(declare-fun e!186985 () Bool)

(assert (=> b!267120 (= e!186987 e!186985)))

(declare-fun lt!407785 () (_ BitVec 32))

(declare-fun res!223049 () Bool)

(declare-datatypes ((tuple4!398 0))(
  ( (tuple4!399 (_1!12180 (_ BitVec 32)) (_2!12180 (_ BitVec 32)) (_3!979 (_ BitVec 32)) (_4!199 (_ BitVec 32))) )
))
(declare-fun lt!407784 () tuple4!398)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267120 (= res!223049 (byteRangesEq!0 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407784)) (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407784)) lt!407785 #b00000000000000000000000000001000))))

(assert (=> b!267120 (=> (not res!223049) (not e!186985))))

(declare-fun e!186986 () Bool)

(declare-fun b!267121 () Bool)

(declare-fun arrayRangesEq!1035 (array!14873 array!14873 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267121 (= e!186986 (arrayRangesEq!1035 (buf!6952 w2!580) (buf!6952 w1!584) (_1!12180 lt!407784) (_2!12180 lt!407784)))))

(declare-fun bm!4186 () Bool)

(declare-fun lt!407786 () (_ BitVec 32))

(declare-fun c!12320 () Bool)

(assert (=> bm!4186 (= call!4189 (byteRangesEq!0 (ite c!12320 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407784)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407784))) (ite c!12320 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407784)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407784))) (ite c!12320 lt!407785 #b00000000000000000000000000000000) lt!407786))))

(declare-fun b!267123 () Bool)

(declare-fun e!186983 () Bool)

(declare-fun e!186982 () Bool)

(assert (=> b!267123 (= e!186983 e!186982)))

(declare-fun res!223051 () Bool)

(assert (=> b!267123 (=> (not res!223051) (not e!186982))))

(assert (=> b!267123 (= res!223051 e!186986)))

(declare-fun res!223050 () Bool)

(assert (=> b!267123 (=> res!223050 e!186986)))

(assert (=> b!267123 (= res!223050 (bvsge (_1!12180 lt!407784) (_2!12180 lt!407784)))))

(assert (=> b!267123 (= lt!407786 ((_ extract 31 0) (bvsrem lt!407600 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267123 (= lt!407785 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!398)

(assert (=> b!267123 (= lt!407784 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600))))

(declare-fun d!90114 () Bool)

(declare-fun res!223053 () Bool)

(assert (=> d!90114 (=> res!223053 e!186983)))

(assert (=> d!90114 (= res!223053 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600))))

(assert (=> d!90114 (= (arrayBitRangesEq!0 (buf!6952 w2!580) (buf!6952 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600) e!186983)))

(declare-fun b!267122 () Bool)

(declare-fun res!223052 () Bool)

(assert (=> b!267122 (= res!223052 (= lt!407786 #b00000000000000000000000000000000))))

(assert (=> b!267122 (=> res!223052 e!186984)))

(assert (=> b!267122 (= e!186985 e!186984)))

(declare-fun b!267124 () Bool)

(assert (=> b!267124 (= e!186982 e!186987)))

(assert (=> b!267124 (= c!12320 (= (_3!979 lt!407784) (_4!199 lt!407784)))))

(declare-fun b!267125 () Bool)

(assert (=> b!267125 (= e!186987 call!4189)))

(assert (= (and d!90114 (not res!223053)) b!267123))

(assert (= (and b!267123 (not res!223050)) b!267121))

(assert (= (and b!267123 res!223051) b!267124))

(assert (= (and b!267124 c!12320) b!267125))

(assert (= (and b!267124 (not c!12320)) b!267120))

(assert (= (and b!267120 res!223049) b!267122))

(assert (= (and b!267122 (not res!223052)) b!267119))

(assert (= (or b!267125 b!267119) bm!4186))

(declare-fun m!398119 () Bool)

(assert (=> b!267120 m!398119))

(declare-fun m!398121 () Bool)

(assert (=> b!267120 m!398121))

(assert (=> b!267120 m!398119))

(assert (=> b!267120 m!398121))

(declare-fun m!398123 () Bool)

(assert (=> b!267120 m!398123))

(declare-fun m!398125 () Bool)

(assert (=> b!267121 m!398125))

(assert (=> bm!4186 m!398121))

(declare-fun m!398127 () Bool)

(assert (=> bm!4186 m!398127))

(assert (=> bm!4186 m!398119))

(declare-fun m!398129 () Bool)

(assert (=> bm!4186 m!398129))

(declare-fun m!398131 () Bool)

(assert (=> bm!4186 m!398131))

(declare-fun m!398133 () Bool)

(assert (=> b!267123 m!398133))

(assert (=> b!266942 d!90114))

(declare-fun b!267129 () Bool)

(declare-fun e!186992 () Bool)

(declare-fun call!4190 () Bool)

(assert (=> b!267129 (= e!186992 call!4190)))

(declare-fun b!267130 () Bool)

(declare-fun e!186995 () Bool)

(declare-fun e!186993 () Bool)

(assert (=> b!267130 (= e!186995 e!186993)))

(declare-fun lt!407788 () (_ BitVec 32))

(declare-fun lt!407787 () tuple4!398)

(declare-fun res!223057 () Bool)

(assert (=> b!267130 (= res!223057 (byteRangesEq!0 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407787)) (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407787)) lt!407788 #b00000000000000000000000000001000))))

(assert (=> b!267130 (=> (not res!223057) (not e!186993))))

(declare-fun b!267131 () Bool)

(declare-fun e!186994 () Bool)

(assert (=> b!267131 (= e!186994 (arrayRangesEq!1035 (buf!6952 w2!580) (buf!6952 w1!584) (_1!12180 lt!407787) (_2!12180 lt!407787)))))

(declare-fun bm!4187 () Bool)

(declare-fun c!12321 () Bool)

(declare-fun lt!407789 () (_ BitVec 32))

(assert (=> bm!4187 (= call!4190 (byteRangesEq!0 (ite c!12321 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407787)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407787))) (ite c!12321 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407787)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407787))) (ite c!12321 lt!407788 #b00000000000000000000000000000000) lt!407789))))

(declare-fun b!267133 () Bool)

(declare-fun e!186991 () Bool)

(declare-fun e!186990 () Bool)

(assert (=> b!267133 (= e!186991 e!186990)))

(declare-fun res!223059 () Bool)

(assert (=> b!267133 (=> (not res!223059) (not e!186990))))

(assert (=> b!267133 (= res!223059 e!186994)))

(declare-fun res!223058 () Bool)

(assert (=> b!267133 (=> res!223058 e!186994)))

(assert (=> b!267133 (= res!223058 (bvsge (_1!12180 lt!407787) (_2!12180 lt!407787)))))

(assert (=> b!267133 (= lt!407789 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267133 (= lt!407788 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267133 (= lt!407787 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))))))

(declare-fun d!90140 () Bool)

(declare-fun res!223061 () Bool)

(assert (=> d!90140 (=> res!223061 e!186991)))

(assert (=> d!90140 (= res!223061 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))))))

(assert (=> d!90140 (= (arrayBitRangesEq!0 (buf!6952 w2!580) (buf!6952 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))) e!186991)))

(declare-fun b!267132 () Bool)

(declare-fun res!223060 () Bool)

(assert (=> b!267132 (= res!223060 (= lt!407789 #b00000000000000000000000000000000))))

(assert (=> b!267132 (=> res!223060 e!186992)))

(assert (=> b!267132 (= e!186993 e!186992)))

(declare-fun b!267134 () Bool)

(assert (=> b!267134 (= e!186990 e!186995)))

(assert (=> b!267134 (= c!12321 (= (_3!979 lt!407787) (_4!199 lt!407787)))))

(declare-fun b!267135 () Bool)

(assert (=> b!267135 (= e!186995 call!4190)))

(assert (= (and d!90140 (not res!223061)) b!267133))

(assert (= (and b!267133 (not res!223058)) b!267131))

(assert (= (and b!267133 res!223059) b!267134))

(assert (= (and b!267134 c!12321) b!267135))

(assert (= (and b!267134 (not c!12321)) b!267130))

(assert (= (and b!267130 res!223057) b!267132))

(assert (= (and b!267132 (not res!223060)) b!267129))

(assert (= (or b!267135 b!267129) bm!4187))

(declare-fun m!398139 () Bool)

(assert (=> b!267130 m!398139))

(declare-fun m!398141 () Bool)

(assert (=> b!267130 m!398141))

(assert (=> b!267130 m!398139))

(assert (=> b!267130 m!398141))

(declare-fun m!398143 () Bool)

(assert (=> b!267130 m!398143))

(declare-fun m!398147 () Bool)

(assert (=> b!267131 m!398147))

(assert (=> bm!4187 m!398141))

(declare-fun m!398149 () Bool)

(assert (=> bm!4187 m!398149))

(assert (=> bm!4187 m!398139))

(declare-fun m!398151 () Bool)

(assert (=> bm!4187 m!398151))

(declare-fun m!398155 () Bool)

(assert (=> bm!4187 m!398155))

(assert (=> b!267133 m!397871))

(declare-fun m!398157 () Bool)

(assert (=> b!267133 m!398157))

(assert (=> b!266943 d!90140))

(assert (=> b!266943 d!90106))

(declare-fun d!90148 () Bool)

(declare-fun res!223068 () Bool)

(declare-fun e!187001 () Bool)

(assert (=> d!90148 (=> (not res!223068) (not e!187001))))

(assert (=> d!90148 (= res!223068 (= (size!6484 (buf!6952 lt!407606)) (size!6484 (buf!6952 w1!584))))))

(assert (=> d!90148 (= (isPrefixOf!0 lt!407606 w1!584) e!187001)))

(declare-fun b!267142 () Bool)

(declare-fun res!223070 () Bool)

(assert (=> b!267142 (=> (not res!223070) (not e!187001))))

(assert (=> b!267142 (= res!223070 (bvsle (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606)) (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))))))

(declare-fun b!267143 () Bool)

(declare-fun e!187000 () Bool)

(assert (=> b!267143 (= e!187001 e!187000)))

(declare-fun res!223069 () Bool)

(assert (=> b!267143 (=> res!223069 e!187000)))

(assert (=> b!267143 (= res!223069 (= (size!6484 (buf!6952 lt!407606)) #b00000000000000000000000000000000))))

(declare-fun b!267144 () Bool)

(assert (=> b!267144 (= e!187000 (arrayBitRangesEq!0 (buf!6952 lt!407606) (buf!6952 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))))))

(assert (= (and d!90148 res!223068) b!267142))

(assert (= (and b!267142 res!223070) b!267143))

(assert (= (and b!267143 (not res!223069)) b!267144))

(assert (=> b!267142 m!398027))

(assert (=> b!267142 m!397871))

(assert (=> b!267144 m!398027))

(assert (=> b!267144 m!398027))

(declare-fun m!398161 () Bool)

(assert (=> b!267144 m!398161))

(assert (=> b!266945 d!90148))

(declare-fun d!90152 () Bool)

(assert (=> d!90152 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407801 () Unit!18950)

(declare-fun choose!11 (BitStream!11782) Unit!18950)

(assert (=> d!90152 (= lt!407801 (choose!11 w2!580))))

(assert (=> d!90152 (= (lemmaIsPrefixRefl!0 w2!580) lt!407801)))

(declare-fun bs!22894 () Bool)

(assert (= bs!22894 d!90152))

(assert (=> bs!22894 m!397903))

(declare-fun m!398167 () Bool)

(assert (=> bs!22894 m!398167))

(assert (=> b!266940 d!90152))

(declare-fun d!90156 () Bool)

(assert (=> d!90156 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407804 () Unit!18950)

(assert (=> d!90156 (= lt!407804 (choose!11 w1!584))))

(assert (=> d!90156 (= (lemmaIsPrefixRefl!0 w1!584) lt!407804)))

(declare-fun bs!22895 () Bool)

(assert (= bs!22895 d!90156))

(assert (=> bs!22895 m!397901))

(declare-fun m!398169 () Bool)

(assert (=> bs!22895 m!398169))

(assert (=> b!266940 d!90156))

(declare-fun d!90158 () Bool)

(assert (=> d!90158 (isPrefixOf!0 lt!407606 lt!407606)))

(declare-fun lt!407805 () Unit!18950)

(assert (=> d!90158 (= lt!407805 (choose!11 lt!407606))))

(assert (=> d!90158 (= (lemmaIsPrefixRefl!0 lt!407606) lt!407805)))

(declare-fun bs!22896 () Bool)

(assert (= bs!22896 d!90158))

(assert (=> bs!22896 m!397895))

(declare-fun m!398171 () Bool)

(assert (=> bs!22896 m!398171))

(assert (=> b!266940 d!90158))

(declare-fun d!90160 () Bool)

(declare-fun res!223073 () Bool)

(declare-fun e!187004 () Bool)

(assert (=> d!90160 (=> (not res!223073) (not e!187004))))

(assert (=> d!90160 (= res!223073 (= (size!6484 (buf!6952 lt!407606)) (size!6484 (buf!6952 lt!407606))))))

(assert (=> d!90160 (= (isPrefixOf!0 lt!407606 lt!407606) e!187004)))

(declare-fun b!267147 () Bool)

(declare-fun res!223075 () Bool)

(assert (=> b!267147 (=> (not res!223075) (not e!187004))))

(assert (=> b!267147 (= res!223075 (bvsle (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606)) (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))))))

(declare-fun b!267148 () Bool)

(declare-fun e!187003 () Bool)

(assert (=> b!267148 (= e!187004 e!187003)))

(declare-fun res!223074 () Bool)

(assert (=> b!267148 (=> res!223074 e!187003)))

(assert (=> b!267148 (= res!223074 (= (size!6484 (buf!6952 lt!407606)) #b00000000000000000000000000000000))))

(declare-fun b!267149 () Bool)

(assert (=> b!267149 (= e!187003 (arrayBitRangesEq!0 (buf!6952 lt!407606) (buf!6952 lt!407606) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))))))

(assert (= (and d!90160 res!223073) b!267147))

(assert (= (and b!267147 res!223075) b!267148))

(assert (= (and b!267148 (not res!223074)) b!267149))

(assert (=> b!267147 m!398027))

(assert (=> b!267147 m!398027))

(assert (=> b!267149 m!398027))

(assert (=> b!267149 m!398027))

(declare-fun m!398175 () Bool)

(assert (=> b!267149 m!398175))

(assert (=> b!266940 d!90160))

(declare-fun d!90164 () Bool)

(declare-fun res!223076 () Bool)

(declare-fun e!187006 () Bool)

(assert (=> d!90164 (=> (not res!223076) (not e!187006))))

(assert (=> d!90164 (= res!223076 (= (size!6484 (buf!6952 w1!584)) (size!6484 (buf!6952 w1!584))))))

(assert (=> d!90164 (= (isPrefixOf!0 w1!584 w1!584) e!187006)))

(declare-fun b!267150 () Bool)

(declare-fun res!223078 () Bool)

(assert (=> b!267150 (=> (not res!223078) (not e!187006))))

(assert (=> b!267150 (= res!223078 (bvsle (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))))))

(declare-fun b!267151 () Bool)

(declare-fun e!187005 () Bool)

(assert (=> b!267151 (= e!187006 e!187005)))

(declare-fun res!223077 () Bool)

(assert (=> b!267151 (=> res!223077 e!187005)))

(assert (=> b!267151 (= res!223077 (= (size!6484 (buf!6952 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!267152 () Bool)

(assert (=> b!267152 (= e!187005 (arrayBitRangesEq!0 (buf!6952 w1!584) (buf!6952 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))))))

(assert (= (and d!90164 res!223076) b!267150))

(assert (= (and b!267150 res!223078) b!267151))

(assert (= (and b!267151 (not res!223077)) b!267152))

(assert (=> b!267150 m!397871))

(assert (=> b!267150 m!397871))

(assert (=> b!267152 m!397871))

(assert (=> b!267152 m!397871))

(declare-fun m!398177 () Bool)

(assert (=> b!267152 m!398177))

(assert (=> b!266940 d!90164))

(declare-fun d!90166 () Bool)

(declare-fun res!223079 () Bool)

(declare-fun e!187008 () Bool)

(assert (=> d!90166 (=> (not res!223079) (not e!187008))))

(assert (=> d!90166 (= res!223079 (= (size!6484 (buf!6952 w2!580)) (size!6484 (buf!6952 w2!580))))))

(assert (=> d!90166 (= (isPrefixOf!0 w2!580 w2!580) e!187008)))

(declare-fun b!267153 () Bool)

(declare-fun res!223081 () Bool)

(assert (=> b!267153 (=> (not res!223081) (not e!187008))))

(assert (=> b!267153 (= res!223081 (bvsle (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))))))

(declare-fun b!267154 () Bool)

(declare-fun e!187007 () Bool)

(assert (=> b!267154 (= e!187008 e!187007)))

(declare-fun res!223080 () Bool)

(assert (=> b!267154 (=> res!223080 e!187007)))

(assert (=> b!267154 (= res!223080 (= (size!6484 (buf!6952 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!267155 () Bool)

(assert (=> b!267155 (= e!187007 (arrayBitRangesEq!0 (buf!6952 w2!580) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))))))

(assert (= (and d!90166 res!223079) b!267153))

(assert (= (and b!267153 res!223081) b!267154))

(assert (= (and b!267154 (not res!223080)) b!267155))

(assert (=> b!267153 m!397887))

(assert (=> b!267153 m!397887))

(assert (=> b!267155 m!397887))

(assert (=> b!267155 m!397887))

(declare-fun m!398179 () Bool)

(assert (=> b!267155 m!398179))

(assert (=> b!266940 d!90166))

(declare-fun b!267156 () Bool)

(declare-fun e!187011 () Bool)

(declare-fun call!4191 () Bool)

(assert (=> b!267156 (= e!187011 call!4191)))

(declare-fun b!267157 () Bool)

(declare-fun e!187014 () Bool)

(declare-fun e!187012 () Bool)

(assert (=> b!267157 (= e!187014 e!187012)))

(declare-fun lt!407807 () tuple4!398)

(declare-fun res!223082 () Bool)

(declare-fun lt!407808 () (_ BitVec 32))

(assert (=> b!267157 (= res!223082 (byteRangesEq!0 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407807)) (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407807)) lt!407808 #b00000000000000000000000000001000))))

(assert (=> b!267157 (=> (not res!223082) (not e!187012))))

(declare-fun e!187013 () Bool)

(declare-fun b!267158 () Bool)

(assert (=> b!267158 (= e!187013 (arrayRangesEq!1035 (buf!6952 w1!584) (buf!6952 w2!580) (_1!12180 lt!407807) (_2!12180 lt!407807)))))

(declare-fun lt!407809 () (_ BitVec 32))

(declare-fun c!12322 () Bool)

(declare-fun bm!4188 () Bool)

(assert (=> bm!4188 (= call!4191 (byteRangesEq!0 (ite c!12322 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407807)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407807))) (ite c!12322 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407807)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407807))) (ite c!12322 lt!407808 #b00000000000000000000000000000000) lt!407809))))

(declare-fun b!267160 () Bool)

(declare-fun e!187010 () Bool)

(declare-fun e!187009 () Bool)

(assert (=> b!267160 (= e!187010 e!187009)))

(declare-fun res!223084 () Bool)

(assert (=> b!267160 (=> (not res!223084) (not e!187009))))

(assert (=> b!267160 (= res!223084 e!187013)))

(declare-fun res!223083 () Bool)

(assert (=> b!267160 (=> res!223083 e!187013)))

(assert (=> b!267160 (= res!223083 (bvsge (_1!12180 lt!407807) (_2!12180 lt!407807)))))

(assert (=> b!267160 (= lt!407809 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267160 (= lt!407808 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267160 (= lt!407807 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))))))

(declare-fun d!90168 () Bool)

(declare-fun res!223086 () Bool)

(assert (=> d!90168 (=> res!223086 e!187010)))

(assert (=> d!90168 (= res!223086 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))))))

(assert (=> d!90168 (= (arrayBitRangesEq!0 (buf!6952 w1!584) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))) e!187010)))

(declare-fun b!267159 () Bool)

(declare-fun res!223085 () Bool)

(assert (=> b!267159 (= res!223085 (= lt!407809 #b00000000000000000000000000000000))))

(assert (=> b!267159 (=> res!223085 e!187011)))

(assert (=> b!267159 (= e!187012 e!187011)))

(declare-fun b!267161 () Bool)

(assert (=> b!267161 (= e!187009 e!187014)))

(assert (=> b!267161 (= c!12322 (= (_3!979 lt!407807) (_4!199 lt!407807)))))

(declare-fun b!267162 () Bool)

(assert (=> b!267162 (= e!187014 call!4191)))

(assert (= (and d!90168 (not res!223086)) b!267160))

(assert (= (and b!267160 (not res!223083)) b!267158))

(assert (= (and b!267160 res!223084) b!267161))

(assert (= (and b!267161 c!12322) b!267162))

(assert (= (and b!267161 (not c!12322)) b!267157))

(assert (= (and b!267157 res!223082) b!267159))

(assert (= (and b!267159 (not res!223085)) b!267156))

(assert (= (or b!267162 b!267156) bm!4188))

(declare-fun m!398181 () Bool)

(assert (=> b!267157 m!398181))

(declare-fun m!398183 () Bool)

(assert (=> b!267157 m!398183))

(assert (=> b!267157 m!398181))

(assert (=> b!267157 m!398183))

(declare-fun m!398185 () Bool)

(assert (=> b!267157 m!398185))

(declare-fun m!398187 () Bool)

(assert (=> b!267158 m!398187))

(assert (=> bm!4188 m!398183))

(declare-fun m!398189 () Bool)

(assert (=> bm!4188 m!398189))

(assert (=> bm!4188 m!398181))

(declare-fun m!398191 () Bool)

(assert (=> bm!4188 m!398191))

(declare-fun m!398193 () Bool)

(assert (=> bm!4188 m!398193))

(assert (=> b!267160 m!397871))

(assert (=> b!267160 m!398157))

(assert (=> b!266939 d!90168))

(assert (=> b!266939 d!90106))

(declare-fun d!90170 () Bool)

(assert (=> d!90170 (= (array_inv!6208 (buf!6952 w1!584)) (bvsge (size!6484 (buf!6952 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!266941 d!90170))

(declare-fun d!90172 () Bool)

(declare-fun res!223087 () Bool)

(declare-fun e!187016 () Bool)

(assert (=> d!90172 (=> (not res!223087) (not e!187016))))

(assert (=> d!90172 (= res!223087 (= (size!6484 (buf!6952 w1!584)) (size!6484 (buf!6952 w2!580))))))

(assert (=> d!90172 (= (isPrefixOf!0 w1!584 w2!580) e!187016)))

(declare-fun b!267163 () Bool)

(declare-fun res!223089 () Bool)

(assert (=> b!267163 (=> (not res!223089) (not e!187016))))

(assert (=> b!267163 (= res!223089 (bvsle (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))))))

(declare-fun b!267164 () Bool)

(declare-fun e!187015 () Bool)

(assert (=> b!267164 (= e!187016 e!187015)))

(declare-fun res!223088 () Bool)

(assert (=> b!267164 (=> res!223088 e!187015)))

(assert (=> b!267164 (= res!223088 (= (size!6484 (buf!6952 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!267165 () Bool)

(assert (=> b!267165 (= e!187015 (arrayBitRangesEq!0 (buf!6952 w1!584) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))))))

(assert (= (and d!90172 res!223087) b!267163))

(assert (= (and b!267163 res!223089) b!267164))

(assert (= (and b!267164 (not res!223088)) b!267165))

(assert (=> b!267163 m!397871))

(assert (=> b!267163 m!397887))

(assert (=> b!267165 m!397871))

(assert (=> b!267165 m!397871))

(assert (=> b!267165 m!397873))

(assert (=> start!58104 d!90172))

(declare-fun d!90174 () Bool)

(assert (=> d!90174 (= (inv!12 w1!584) (invariant!0 (currentBit!12844 w1!584) (currentByte!12849 w1!584) (size!6484 (buf!6952 w1!584))))))

(declare-fun bs!22898 () Bool)

(assert (= bs!22898 d!90174))

(assert (=> bs!22898 m!398033))

(assert (=> start!58104 d!90174))

(declare-fun d!90176 () Bool)

(assert (=> d!90176 (= (inv!12 w2!580) (invariant!0 (currentBit!12844 w2!580) (currentByte!12849 w2!580) (size!6484 (buf!6952 w2!580))))))

(declare-fun bs!22899 () Bool)

(assert (= bs!22899 d!90176))

(assert (=> bs!22899 m!398009))

(assert (=> start!58104 d!90176))

(declare-fun d!90178 () Bool)

(assert (=> d!90178 (= (array_inv!6208 (buf!6952 w2!580)) (bvsge (size!6484 (buf!6952 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!266946 d!90178))

(push 1)

(assert (not bm!4188))

(assert (not b!267133))

(assert (not d!90174))

(assert (not b!267131))

(assert (not d!90100))

(assert (not bm!4187))

(assert (not d!90106))

(assert (not d!90158))

(assert (not b!267163))

(assert (not b!267052))

(assert (not b!267147))

(assert (not b!267158))

(assert (not d!90176))

(assert (not b!267149))

(assert (not b!267165))

(assert (not b!267050))

(assert (not d!90108))

(assert (not b!267130))

(assert (not bm!4186))

(assert (not b!267157))

(assert (not b!267120))

(assert (not b!267123))

(assert (not d!90080))

(assert (not d!90156))

(assert (not d!90090))

(assert (not d!90112))

(assert (not b!267121))

(assert (not d!90152))

(assert (not b!267150))

(assert (not b!267144))

(assert (not b!267153))

(assert (not b!267160))

(assert (not b!267152))

(assert (not b!267142))

(assert (not b!267155))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90212 () Bool)

(assert (=> d!90212 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))) (tuple4!399 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!267160 d!90212))

(declare-fun d!90214 () Bool)

(assert (=> d!90214 (= (byteRangesEq!0 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407787)) (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407787)) lt!407788 #b00000000000000000000000000001000) (or (= lt!407788 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407787))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407788)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407787))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407788)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22905 () Bool)

(assert (= bs!22905 d!90214))

(declare-fun m!398255 () Bool)

(assert (=> bs!22905 m!398255))

(declare-fun m!398257 () Bool)

(assert (=> bs!22905 m!398257))

(assert (=> b!267130 d!90214))

(declare-fun d!90216 () Bool)

(assert (=> d!90216 (= (invariant!0 (currentBit!12844 w2!580) (currentByte!12849 w2!580) (size!6484 (buf!6952 w2!580))) (and (bvsge (currentBit!12844 w2!580) #b00000000000000000000000000000000) (bvslt (currentBit!12844 w2!580) #b00000000000000000000000000001000) (bvsge (currentByte!12849 w2!580) #b00000000000000000000000000000000) (or (bvslt (currentByte!12849 w2!580) (size!6484 (buf!6952 w2!580))) (and (= (currentBit!12844 w2!580) #b00000000000000000000000000000000) (= (currentByte!12849 w2!580) (size!6484 (buf!6952 w2!580)))))))))

(assert (=> d!90176 d!90216))

(declare-fun d!90218 () Bool)

(declare-fun res!223137 () Bool)

(declare-fun e!187064 () Bool)

(assert (=> d!90218 (=> res!223137 e!187064)))

(assert (=> d!90218 (= res!223137 (= (_1!12180 lt!407807) (_2!12180 lt!407807)))))

(assert (=> d!90218 (= (arrayRangesEq!1035 (buf!6952 w1!584) (buf!6952 w2!580) (_1!12180 lt!407807) (_2!12180 lt!407807)) e!187064)))

(declare-fun b!267223 () Bool)

(declare-fun e!187065 () Bool)

(assert (=> b!267223 (= e!187064 e!187065)))

(declare-fun res!223138 () Bool)

(assert (=> b!267223 (=> (not res!223138) (not e!187065))))

(assert (=> b!267223 (= res!223138 (= (select (arr!7471 (buf!6952 w1!584)) (_1!12180 lt!407807)) (select (arr!7471 (buf!6952 w2!580)) (_1!12180 lt!407807))))))

(declare-fun b!267224 () Bool)

(assert (=> b!267224 (= e!187065 (arrayRangesEq!1035 (buf!6952 w1!584) (buf!6952 w2!580) (bvadd (_1!12180 lt!407807) #b00000000000000000000000000000001) (_2!12180 lt!407807)))))

(assert (= (and d!90218 (not res!223137)) b!267223))

(assert (= (and b!267223 res!223138) b!267224))

(declare-fun m!398259 () Bool)

(assert (=> b!267223 m!398259))

(declare-fun m!398261 () Bool)

(assert (=> b!267223 m!398261))

(declare-fun m!398263 () Bool)

(assert (=> b!267224 m!398263))

(assert (=> b!267158 d!90218))

(declare-fun d!90220 () Bool)

(assert (=> d!90220 (= (byteRangesEq!0 (ite c!12322 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407807)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407807))) (ite c!12322 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407807)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407807))) (ite c!12322 lt!407808 #b00000000000000000000000000000000) lt!407809) (or (= (ite c!12322 lt!407808 #b00000000000000000000000000000000) lt!407809) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12322 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407807)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407807)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407809))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12322 lt!407808 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12322 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407807)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407807)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407809))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12322 lt!407808 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!22906 () Bool)

(assert (= bs!22906 d!90220))

(declare-fun m!398265 () Bool)

(assert (=> bs!22906 m!398265))

(declare-fun m!398267 () Bool)

(assert (=> bs!22906 m!398267))

(assert (=> bm!4188 d!90220))

(declare-fun d!90222 () Bool)

(assert (=> d!90222 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600) (tuple4!399 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!407600 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!407600 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!267123 d!90222))

(declare-fun d!90224 () Bool)

(declare-fun e!187066 () Bool)

(assert (=> d!90224 e!187066))

(declare-fun res!223139 () Bool)

(assert (=> d!90224 (=> (not res!223139) (not e!187066))))

(declare-fun lt!407832 () (_ BitVec 64))

(declare-fun lt!407835 () (_ BitVec 64))

(declare-fun lt!407834 () (_ BitVec 64))

(assert (=> d!90224 (= res!223139 (= lt!407832 (bvsub lt!407834 lt!407835)))))

(assert (=> d!90224 (or (= (bvand lt!407834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407834 lt!407835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90224 (= lt!407835 (remainingBits!0 ((_ sign_extend 32) (size!6484 (buf!6952 lt!407710))) ((_ sign_extend 32) (currentByte!12849 lt!407710)) ((_ sign_extend 32) (currentBit!12844 lt!407710))))))

(declare-fun lt!407833 () (_ BitVec 64))

(declare-fun lt!407836 () (_ BitVec 64))

(assert (=> d!90224 (= lt!407834 (bvmul lt!407833 lt!407836))))

(assert (=> d!90224 (or (= lt!407833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407836 (bvsdiv (bvmul lt!407833 lt!407836) lt!407833)))))

(assert (=> d!90224 (= lt!407836 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90224 (= lt!407833 ((_ sign_extend 32) (size!6484 (buf!6952 lt!407710))))))

(assert (=> d!90224 (= lt!407832 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12849 lt!407710)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12844 lt!407710))))))

(assert (=> d!90224 (invariant!0 (currentBit!12844 lt!407710) (currentByte!12849 lt!407710) (size!6484 (buf!6952 lt!407710)))))

(assert (=> d!90224 (= (bitIndex!0 (size!6484 (buf!6952 lt!407710)) (currentByte!12849 lt!407710) (currentBit!12844 lt!407710)) lt!407832)))

(declare-fun b!267225 () Bool)

(declare-fun res!223140 () Bool)

(assert (=> b!267225 (=> (not res!223140) (not e!187066))))

(assert (=> b!267225 (= res!223140 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407832))))

(declare-fun b!267226 () Bool)

(declare-fun lt!407837 () (_ BitVec 64))

(assert (=> b!267226 (= e!187066 (bvsle lt!407832 (bvmul lt!407837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267226 (or (= lt!407837 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407837 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407837)))))

(assert (=> b!267226 (= lt!407837 ((_ sign_extend 32) (size!6484 (buf!6952 lt!407710))))))

(assert (= (and d!90224 res!223139) b!267225))

(assert (= (and b!267225 res!223140) b!267226))

(declare-fun m!398269 () Bool)

(assert (=> d!90224 m!398269))

(declare-fun m!398271 () Bool)

(assert (=> d!90224 m!398271))

(assert (=> d!90108 d!90224))

(assert (=> d!90108 d!90080))

(declare-fun d!90226 () Bool)

(declare-fun lt!407850 () (_ BitVec 32))

(assert (=> d!90226 (= lt!407850 ((_ extract 31 0) (bvsrem (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!407851 () (_ BitVec 32))

(assert (=> d!90226 (= lt!407851 ((_ extract 31 0) (bvsdiv (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!187071 () Bool)

(assert (=> d!90226 e!187071))

(declare-fun res!223146 () Bool)

(assert (=> d!90226 (=> (not res!223146) (not e!187071))))

(assert (=> d!90226 (= res!223146 (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))))))

(declare-fun Unit!18959 () Unit!18950)

(declare-fun Unit!18960 () Unit!18950)

(declare-fun Unit!18961 () Unit!18950)

(assert (=> d!90226 (= (moveBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))) (ite (bvslt (bvadd (currentBit!12844 w2!580) lt!407850) #b00000000000000000000000000000000) (tuple2!22401 Unit!18959 (BitStream!11783 (buf!6952 w2!580) (bvsub (bvadd (currentByte!12849 w2!580) lt!407851) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!407850 (currentBit!12844 w2!580)))) (ite (bvsge (bvadd (currentBit!12844 w2!580) lt!407850) #b00000000000000000000000000001000) (tuple2!22401 Unit!18960 (BitStream!11783 (buf!6952 w2!580) (bvadd (currentByte!12849 w2!580) lt!407851 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!12844 w2!580) lt!407850) #b00000000000000000000000000001000))) (tuple2!22401 Unit!18961 (BitStream!11783 (buf!6952 w2!580) (bvadd (currentByte!12849 w2!580) lt!407851) (bvadd (currentBit!12844 w2!580) lt!407850))))))))

(declare-fun b!267231 () Bool)

(declare-fun e!187072 () Bool)

(assert (=> b!267231 (= e!187071 e!187072)))

(declare-fun res!223145 () Bool)

(assert (=> b!267231 (=> (not res!223145) (not e!187072))))

(declare-fun lt!407854 () tuple2!22400)

(declare-fun lt!407853 () (_ BitVec 64))

(assert (=> b!267231 (= res!223145 (= (bvadd lt!407853 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))) (bitIndex!0 (size!6484 (buf!6952 (_2!12179 lt!407854))) (currentByte!12849 (_2!12179 lt!407854)) (currentBit!12844 (_2!12179 lt!407854)))))))

(assert (=> b!267231 (or (not (= (bvand lt!407853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!407853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!407853 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!267231 (= lt!407853 (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))))

(declare-fun lt!407852 () (_ BitVec 32))

(declare-fun lt!407855 () (_ BitVec 32))

(declare-fun Unit!18962 () Unit!18950)

(declare-fun Unit!18963 () Unit!18950)

(declare-fun Unit!18964 () Unit!18950)

(assert (=> b!267231 (= lt!407854 (ite (bvslt (bvadd (currentBit!12844 w2!580) lt!407852) #b00000000000000000000000000000000) (tuple2!22401 Unit!18962 (BitStream!11783 (buf!6952 w2!580) (bvsub (bvadd (currentByte!12849 w2!580) lt!407855) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!407852 (currentBit!12844 w2!580)))) (ite (bvsge (bvadd (currentBit!12844 w2!580) lt!407852) #b00000000000000000000000000001000) (tuple2!22401 Unit!18963 (BitStream!11783 (buf!6952 w2!580) (bvadd (currentByte!12849 w2!580) lt!407855 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!12844 w2!580) lt!407852) #b00000000000000000000000000001000))) (tuple2!22401 Unit!18964 (BitStream!11783 (buf!6952 w2!580) (bvadd (currentByte!12849 w2!580) lt!407855) (bvadd (currentBit!12844 w2!580) lt!407852))))))))

(assert (=> b!267231 (= lt!407852 ((_ extract 31 0) (bvsrem (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267231 (= lt!407855 ((_ extract 31 0) (bvsdiv (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!267232 () Bool)

(assert (=> b!267232 (= e!187072 (and (= (size!6484 (buf!6952 w2!580)) (size!6484 (buf!6952 (_2!12179 lt!407854)))) (= (buf!6952 w2!580) (buf!6952 (_2!12179 lt!407854)))))))

(assert (= (and d!90226 res!223146) b!267231))

(assert (= (and b!267231 res!223145) b!267232))

(assert (=> d!90226 m!398055))

(declare-fun m!398273 () Bool)

(assert (=> b!267231 m!398273))

(assert (=> b!267231 m!397887))

(assert (=> d!90108 d!90226))

(declare-fun d!90230 () Bool)

(declare-fun res!223149 () Bool)

(declare-fun e!187075 () Bool)

(assert (=> d!90230 (=> (not res!223149) (not e!187075))))

(assert (=> d!90230 (= res!223149 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6484 (buf!6952 w2!580)))) (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))) (bvsle (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6484 (buf!6952 w2!580)))))))))

(assert (=> d!90230 (= (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))) e!187075)))

(declare-fun b!267236 () Bool)

(declare-fun lt!407858 () (_ BitVec 64))

(assert (=> b!267236 (= e!187075 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407858) (bvsle lt!407858 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6484 (buf!6952 w2!580)))))))))

(assert (=> b!267236 (= lt!407858 (bvadd (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)) (bvsub (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)))))))

(assert (= (and d!90230 res!223149) b!267236))

(assert (=> b!267236 m!397887))

(assert (=> d!90108 d!90230))

(assert (=> d!90158 d!90160))

(declare-fun d!90232 () Bool)

(assert (=> d!90232 (isPrefixOf!0 lt!407606 lt!407606)))

(assert (=> d!90232 true))

(declare-fun _$14!331 () Unit!18950)

(assert (=> d!90232 (= (choose!11 lt!407606) _$14!331)))

(declare-fun bs!22908 () Bool)

(assert (= bs!22908 d!90232))

(assert (=> bs!22908 m!397895))

(assert (=> d!90158 d!90232))

(declare-fun d!90234 () Bool)

(assert (=> d!90234 (= (byteRangesEq!0 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407784)) (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407784)) lt!407785 #b00000000000000000000000000001000) (or (= lt!407785 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407784))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407785)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407784))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407785)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22909 () Bool)

(assert (= bs!22909 d!90234))

(assert (=> bs!22909 m!398255))

(declare-fun m!398275 () Bool)

(assert (=> bs!22909 m!398275))

(assert (=> b!267120 d!90234))

(declare-fun d!90236 () Bool)

(declare-fun res!223150 () Bool)

(declare-fun e!187076 () Bool)

(assert (=> d!90236 (=> res!223150 e!187076)))

(assert (=> d!90236 (= res!223150 (= (_1!12180 lt!407784) (_2!12180 lt!407784)))))

(assert (=> d!90236 (= (arrayRangesEq!1035 (buf!6952 w2!580) (buf!6952 w1!584) (_1!12180 lt!407784) (_2!12180 lt!407784)) e!187076)))

(declare-fun b!267237 () Bool)

(declare-fun e!187077 () Bool)

(assert (=> b!267237 (= e!187076 e!187077)))

(declare-fun res!223151 () Bool)

(assert (=> b!267237 (=> (not res!223151) (not e!187077))))

(assert (=> b!267237 (= res!223151 (= (select (arr!7471 (buf!6952 w2!580)) (_1!12180 lt!407784)) (select (arr!7471 (buf!6952 w1!584)) (_1!12180 lt!407784))))))

(declare-fun b!267238 () Bool)

(assert (=> b!267238 (= e!187077 (arrayRangesEq!1035 (buf!6952 w2!580) (buf!6952 w1!584) (bvadd (_1!12180 lt!407784) #b00000000000000000000000000000001) (_2!12180 lt!407784)))))

(assert (= (and d!90236 (not res!223150)) b!267237))

(assert (= (and b!267237 res!223151) b!267238))

(declare-fun m!398277 () Bool)

(assert (=> b!267237 m!398277))

(declare-fun m!398279 () Bool)

(assert (=> b!267237 m!398279))

(declare-fun m!398281 () Bool)

(assert (=> b!267238 m!398281))

(assert (=> b!267121 d!90236))

(declare-fun d!90238 () Bool)

(declare-fun e!187078 () Bool)

(assert (=> d!90238 e!187078))

(declare-fun res!223152 () Bool)

(assert (=> d!90238 (=> (not res!223152) (not e!187078))))

(declare-fun lt!407862 () (_ BitVec 64))

(declare-fun lt!407861 () (_ BitVec 64))

(declare-fun lt!407859 () (_ BitVec 64))

(assert (=> d!90238 (= res!223152 (= lt!407859 (bvsub lt!407861 lt!407862)))))

(assert (=> d!90238 (or (= (bvand lt!407861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407861 lt!407862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90238 (= lt!407862 (remainingBits!0 ((_ sign_extend 32) (size!6484 (buf!6952 lt!407606))) ((_ sign_extend 32) (currentByte!12849 lt!407606)) ((_ sign_extend 32) (currentBit!12844 lt!407606))))))

(declare-fun lt!407860 () (_ BitVec 64))

(declare-fun lt!407863 () (_ BitVec 64))

(assert (=> d!90238 (= lt!407861 (bvmul lt!407860 lt!407863))))

(assert (=> d!90238 (or (= lt!407860 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407863 (bvsdiv (bvmul lt!407860 lt!407863) lt!407860)))))

(assert (=> d!90238 (= lt!407863 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90238 (= lt!407860 ((_ sign_extend 32) (size!6484 (buf!6952 lt!407606))))))

(assert (=> d!90238 (= lt!407859 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12849 lt!407606)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12844 lt!407606))))))

(assert (=> d!90238 (invariant!0 (currentBit!12844 lt!407606) (currentByte!12849 lt!407606) (size!6484 (buf!6952 lt!407606)))))

(assert (=> d!90238 (= (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606)) lt!407859)))

(declare-fun b!267239 () Bool)

(declare-fun res!223153 () Bool)

(assert (=> b!267239 (=> (not res!223153) (not e!187078))))

(assert (=> b!267239 (= res!223153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407859))))

(declare-fun b!267240 () Bool)

(declare-fun lt!407864 () (_ BitVec 64))

(assert (=> b!267240 (= e!187078 (bvsle lt!407859 (bvmul lt!407864 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267240 (or (= lt!407864 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407864 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407864)))))

(assert (=> b!267240 (= lt!407864 ((_ sign_extend 32) (size!6484 (buf!6952 lt!407606))))))

(assert (= (and d!90238 res!223152) b!267239))

(assert (= (and b!267239 res!223153) b!267240))

(declare-fun m!398283 () Bool)

(assert (=> d!90238 m!398283))

(declare-fun m!398285 () Bool)

(assert (=> d!90238 m!398285))

(assert (=> b!267050 d!90238))

(assert (=> b!267050 d!90080))

(declare-fun b!267241 () Bool)

(declare-fun e!187081 () Bool)

(declare-fun call!4197 () Bool)

(assert (=> b!267241 (= e!187081 call!4197)))

(declare-fun b!267242 () Bool)

(declare-fun e!187084 () Bool)

(declare-fun e!187082 () Bool)

(assert (=> b!267242 (= e!187084 e!187082)))

(declare-fun res!223154 () Bool)

(declare-fun lt!407866 () (_ BitVec 32))

(declare-fun lt!407865 () tuple4!398)

(assert (=> b!267242 (= res!223154 (byteRangesEq!0 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407865)) (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407865)) lt!407866 #b00000000000000000000000000001000))))

(assert (=> b!267242 (=> (not res!223154) (not e!187082))))

(declare-fun b!267243 () Bool)

(declare-fun e!187083 () Bool)

(assert (=> b!267243 (= e!187083 (arrayRangesEq!1035 (buf!6952 w2!580) (buf!6952 w2!580) (_1!12180 lt!407865) (_2!12180 lt!407865)))))

(declare-fun bm!4194 () Bool)

(declare-fun lt!407867 () (_ BitVec 32))

(declare-fun c!12328 () Bool)

(assert (=> bm!4194 (= call!4197 (byteRangesEq!0 (ite c!12328 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407865)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407865))) (ite c!12328 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407865)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407865))) (ite c!12328 lt!407866 #b00000000000000000000000000000000) lt!407867))))

(declare-fun b!267245 () Bool)

(declare-fun e!187080 () Bool)

(declare-fun e!187079 () Bool)

(assert (=> b!267245 (= e!187080 e!187079)))

(declare-fun res!223156 () Bool)

(assert (=> b!267245 (=> (not res!223156) (not e!187079))))

(assert (=> b!267245 (= res!223156 e!187083)))

(declare-fun res!223155 () Bool)

(assert (=> b!267245 (=> res!223155 e!187083)))

(assert (=> b!267245 (= res!223155 (bvsge (_1!12180 lt!407865) (_2!12180 lt!407865)))))

(assert (=> b!267245 (= lt!407867 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267245 (= lt!407866 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267245 (= lt!407865 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))))))

(declare-fun d!90240 () Bool)

(declare-fun res!223158 () Bool)

(assert (=> d!90240 (=> res!223158 e!187080)))

(assert (=> d!90240 (= res!223158 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))))))

(assert (=> d!90240 (= (arrayBitRangesEq!0 (buf!6952 w2!580) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w2!580)) (currentByte!12849 w2!580) (currentBit!12844 w2!580))) e!187080)))

(declare-fun b!267244 () Bool)

(declare-fun res!223157 () Bool)

(assert (=> b!267244 (= res!223157 (= lt!407867 #b00000000000000000000000000000000))))

(assert (=> b!267244 (=> res!223157 e!187081)))

(assert (=> b!267244 (= e!187082 e!187081)))

(declare-fun b!267246 () Bool)

(assert (=> b!267246 (= e!187079 e!187084)))

(assert (=> b!267246 (= c!12328 (= (_3!979 lt!407865) (_4!199 lt!407865)))))

(declare-fun b!267247 () Bool)

(assert (=> b!267247 (= e!187084 call!4197)))

(assert (= (and d!90240 (not res!223158)) b!267245))

(assert (= (and b!267245 (not res!223155)) b!267243))

(assert (= (and b!267245 res!223156) b!267246))

(assert (= (and b!267246 c!12328) b!267247))

(assert (= (and b!267246 (not c!12328)) b!267242))

(assert (= (and b!267242 res!223154) b!267244))

(assert (= (and b!267244 (not res!223157)) b!267241))

(assert (= (or b!267247 b!267241) bm!4194))

(declare-fun m!398287 () Bool)

(assert (=> b!267242 m!398287))

(assert (=> b!267242 m!398287))

(assert (=> b!267242 m!398287))

(assert (=> b!267242 m!398287))

(declare-fun m!398289 () Bool)

(assert (=> b!267242 m!398289))

(declare-fun m!398291 () Bool)

(assert (=> b!267243 m!398291))

(assert (=> bm!4194 m!398287))

(declare-fun m!398293 () Bool)

(assert (=> bm!4194 m!398293))

(assert (=> bm!4194 m!398287))

(assert (=> bm!4194 m!398293))

(declare-fun m!398295 () Bool)

(assert (=> bm!4194 m!398295))

(assert (=> b!267245 m!397887))

(declare-fun m!398297 () Bool)

(assert (=> b!267245 m!398297))

(assert (=> b!267155 d!90240))

(assert (=> b!267155 d!90080))

(declare-fun b!267248 () Bool)

(declare-fun e!187087 () Bool)

(declare-fun call!4198 () Bool)

(assert (=> b!267248 (= e!187087 call!4198)))

(declare-fun b!267249 () Bool)

(declare-fun e!187090 () Bool)

(declare-fun e!187088 () Bool)

(assert (=> b!267249 (= e!187090 e!187088)))

(declare-fun lt!407869 () (_ BitVec 32))

(declare-fun res!223159 () Bool)

(declare-fun lt!407868 () tuple4!398)

(assert (=> b!267249 (= res!223159 (byteRangesEq!0 (select (arr!7471 (buf!6952 lt!407606)) (_3!979 lt!407868)) (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407868)) lt!407869 #b00000000000000000000000000001000))))

(assert (=> b!267249 (=> (not res!223159) (not e!187088))))

(declare-fun e!187089 () Bool)

(declare-fun b!267250 () Bool)

(assert (=> b!267250 (= e!187089 (arrayRangesEq!1035 (buf!6952 lt!407606) (buf!6952 w2!580) (_1!12180 lt!407868) (_2!12180 lt!407868)))))

(declare-fun lt!407870 () (_ BitVec 32))

(declare-fun c!12329 () Bool)

(declare-fun bm!4195 () Bool)

(assert (=> bm!4195 (= call!4198 (byteRangesEq!0 (ite c!12329 (select (arr!7471 (buf!6952 lt!407606)) (_3!979 lt!407868)) (select (arr!7471 (buf!6952 lt!407606)) (_4!199 lt!407868))) (ite c!12329 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407868)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407868))) (ite c!12329 lt!407869 #b00000000000000000000000000000000) lt!407870))))

(declare-fun b!267252 () Bool)

(declare-fun e!187086 () Bool)

(declare-fun e!187085 () Bool)

(assert (=> b!267252 (= e!187086 e!187085)))

(declare-fun res!223161 () Bool)

(assert (=> b!267252 (=> (not res!223161) (not e!187085))))

(assert (=> b!267252 (= res!223161 e!187089)))

(declare-fun res!223160 () Bool)

(assert (=> b!267252 (=> res!223160 e!187089)))

(assert (=> b!267252 (= res!223160 (bvsge (_1!12180 lt!407868) (_2!12180 lt!407868)))))

(assert (=> b!267252 (= lt!407870 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267252 (= lt!407869 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267252 (= lt!407868 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))))))

(declare-fun d!90242 () Bool)

(declare-fun res!223163 () Bool)

(assert (=> d!90242 (=> res!223163 e!187086)))

(assert (=> d!90242 (= res!223163 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))))))

(assert (=> d!90242 (= (arrayBitRangesEq!0 (buf!6952 lt!407606) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))) e!187086)))

(declare-fun b!267251 () Bool)

(declare-fun res!223162 () Bool)

(assert (=> b!267251 (= res!223162 (= lt!407870 #b00000000000000000000000000000000))))

(assert (=> b!267251 (=> res!223162 e!187087)))

(assert (=> b!267251 (= e!187088 e!187087)))

(declare-fun b!267253 () Bool)

(assert (=> b!267253 (= e!187085 e!187090)))

(assert (=> b!267253 (= c!12329 (= (_3!979 lt!407868) (_4!199 lt!407868)))))

(declare-fun b!267254 () Bool)

(assert (=> b!267254 (= e!187090 call!4198)))

(assert (= (and d!90242 (not res!223163)) b!267252))

(assert (= (and b!267252 (not res!223160)) b!267250))

(assert (= (and b!267252 res!223161) b!267253))

(assert (= (and b!267253 c!12329) b!267254))

(assert (= (and b!267253 (not c!12329)) b!267249))

(assert (= (and b!267249 res!223159) b!267251))

(assert (= (and b!267251 (not res!223162)) b!267248))

(assert (= (or b!267254 b!267248) bm!4195))

(declare-fun m!398299 () Bool)

(assert (=> b!267249 m!398299))

(declare-fun m!398301 () Bool)

(assert (=> b!267249 m!398301))

(assert (=> b!267249 m!398299))

(assert (=> b!267249 m!398301))

(declare-fun m!398303 () Bool)

(assert (=> b!267249 m!398303))

(declare-fun m!398305 () Bool)

(assert (=> b!267250 m!398305))

(assert (=> bm!4195 m!398301))

(declare-fun m!398307 () Bool)

(assert (=> bm!4195 m!398307))

(assert (=> bm!4195 m!398299))

(declare-fun m!398309 () Bool)

(assert (=> bm!4195 m!398309))

(declare-fun m!398311 () Bool)

(assert (=> bm!4195 m!398311))

(assert (=> b!267252 m!398027))

(declare-fun m!398313 () Bool)

(assert (=> b!267252 m!398313))

(assert (=> b!267052 d!90242))

(assert (=> b!267052 d!90238))

(declare-fun d!90244 () Bool)

(assert (=> d!90244 (= (byteRangesEq!0 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407807)) (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407807)) lt!407808 #b00000000000000000000000000001000) (or (= lt!407808 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407807))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407808)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407807))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407808)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22910 () Bool)

(assert (= bs!22910 d!90244))

(assert (=> bs!22910 m!398255))

(declare-fun m!398315 () Bool)

(assert (=> bs!22910 m!398315))

(assert (=> b!267157 d!90244))

(declare-fun d!90246 () Bool)

(assert (=> d!90246 (= (byteRangesEq!0 (ite c!12320 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407784)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407784))) (ite c!12320 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407784)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407784))) (ite c!12320 lt!407785 #b00000000000000000000000000000000) lt!407786) (or (= (ite c!12320 lt!407785 #b00000000000000000000000000000000) lt!407786) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12320 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407784)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407784)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407786))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12320 lt!407785 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12320 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407784)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407784)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407786))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12320 lt!407785 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!22911 () Bool)

(assert (= bs!22911 d!90246))

(declare-fun m!398317 () Bool)

(assert (=> bs!22911 m!398317))

(declare-fun m!398319 () Bool)

(assert (=> bs!22911 m!398319))

(assert (=> bm!4186 d!90246))

(assert (=> b!267153 d!90080))

(assert (=> b!267165 d!90168))

(assert (=> b!267165 d!90106))

(declare-fun d!90248 () Bool)

(assert (=> d!90248 (= (invariant!0 (currentBit!12844 w1!584) (currentByte!12849 w1!584) (size!6484 (buf!6952 w1!584))) (and (bvsge (currentBit!12844 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12844 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12849 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12849 w1!584) (size!6484 (buf!6952 w1!584))) (and (= (currentBit!12844 w1!584) #b00000000000000000000000000000000) (= (currentByte!12849 w1!584) (size!6484 (buf!6952 w1!584)))))))))

(assert (=> d!90174 d!90248))

(assert (=> b!267142 d!90238))

(assert (=> b!267142 d!90106))

(declare-fun b!267255 () Bool)

(declare-fun e!187093 () Bool)

(declare-fun call!4199 () Bool)

(assert (=> b!267255 (= e!187093 call!4199)))

(declare-fun b!267256 () Bool)

(declare-fun e!187096 () Bool)

(declare-fun e!187094 () Bool)

(assert (=> b!267256 (= e!187096 e!187094)))

(declare-fun lt!407872 () (_ BitVec 32))

(declare-fun lt!407871 () tuple4!398)

(declare-fun res!223164 () Bool)

(assert (=> b!267256 (= res!223164 (byteRangesEq!0 (select (arr!7471 (buf!6952 lt!407606)) (_3!979 lt!407871)) (select (arr!7471 (buf!6952 lt!407606)) (_3!979 lt!407871)) lt!407872 #b00000000000000000000000000001000))))

(assert (=> b!267256 (=> (not res!223164) (not e!187094))))

(declare-fun b!267257 () Bool)

(declare-fun e!187095 () Bool)

(assert (=> b!267257 (= e!187095 (arrayRangesEq!1035 (buf!6952 lt!407606) (buf!6952 lt!407606) (_1!12180 lt!407871) (_2!12180 lt!407871)))))

(declare-fun c!12330 () Bool)

(declare-fun bm!4196 () Bool)

(declare-fun lt!407873 () (_ BitVec 32))

(assert (=> bm!4196 (= call!4199 (byteRangesEq!0 (ite c!12330 (select (arr!7471 (buf!6952 lt!407606)) (_3!979 lt!407871)) (select (arr!7471 (buf!6952 lt!407606)) (_4!199 lt!407871))) (ite c!12330 (select (arr!7471 (buf!6952 lt!407606)) (_3!979 lt!407871)) (select (arr!7471 (buf!6952 lt!407606)) (_4!199 lt!407871))) (ite c!12330 lt!407872 #b00000000000000000000000000000000) lt!407873))))

(declare-fun b!267259 () Bool)

(declare-fun e!187092 () Bool)

(declare-fun e!187091 () Bool)

(assert (=> b!267259 (= e!187092 e!187091)))

(declare-fun res!223166 () Bool)

(assert (=> b!267259 (=> (not res!223166) (not e!187091))))

(assert (=> b!267259 (= res!223166 e!187095)))

(declare-fun res!223165 () Bool)

(assert (=> b!267259 (=> res!223165 e!187095)))

(assert (=> b!267259 (= res!223165 (bvsge (_1!12180 lt!407871) (_2!12180 lt!407871)))))

(assert (=> b!267259 (= lt!407873 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267259 (= lt!407872 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267259 (= lt!407871 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))))))

(declare-fun d!90250 () Bool)

(declare-fun res!223168 () Bool)

(assert (=> d!90250 (=> res!223168 e!187092)))

(assert (=> d!90250 (= res!223168 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))))))

(assert (=> d!90250 (= (arrayBitRangesEq!0 (buf!6952 lt!407606) (buf!6952 lt!407606) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))) e!187092)))

(declare-fun b!267258 () Bool)

(declare-fun res!223167 () Bool)

(assert (=> b!267258 (= res!223167 (= lt!407873 #b00000000000000000000000000000000))))

(assert (=> b!267258 (=> res!223167 e!187093)))

(assert (=> b!267258 (= e!187094 e!187093)))

(declare-fun b!267260 () Bool)

(assert (=> b!267260 (= e!187091 e!187096)))

(assert (=> b!267260 (= c!12330 (= (_3!979 lt!407871) (_4!199 lt!407871)))))

(declare-fun b!267261 () Bool)

(assert (=> b!267261 (= e!187096 call!4199)))

(assert (= (and d!90250 (not res!223168)) b!267259))

(assert (= (and b!267259 (not res!223165)) b!267257))

(assert (= (and b!267259 res!223166) b!267260))

(assert (= (and b!267260 c!12330) b!267261))

(assert (= (and b!267260 (not c!12330)) b!267256))

(assert (= (and b!267256 res!223164) b!267258))

(assert (= (and b!267258 (not res!223167)) b!267255))

(assert (= (or b!267261 b!267255) bm!4196))

(declare-fun m!398321 () Bool)

(assert (=> b!267256 m!398321))

(assert (=> b!267256 m!398321))

(assert (=> b!267256 m!398321))

(assert (=> b!267256 m!398321))

(declare-fun m!398323 () Bool)

(assert (=> b!267256 m!398323))

(declare-fun m!398325 () Bool)

(assert (=> b!267257 m!398325))

(assert (=> bm!4196 m!398321))

(declare-fun m!398327 () Bool)

(assert (=> bm!4196 m!398327))

(assert (=> bm!4196 m!398321))

(assert (=> bm!4196 m!398327))

(declare-fun m!398329 () Bool)

(assert (=> bm!4196 m!398329))

(assert (=> b!267259 m!398027))

(assert (=> b!267259 m!398313))

(assert (=> b!267149 d!90250))

(assert (=> b!267149 d!90238))

(assert (=> b!267163 d!90106))

(assert (=> b!267163 d!90080))

(declare-fun d!90252 () Bool)

(assert (=> d!90252 (= (remainingBits!0 ((_ sign_extend 32) (size!6484 (buf!6952 w2!580))) ((_ sign_extend 32) (currentByte!12849 w2!580)) ((_ sign_extend 32) (currentBit!12844 w2!580))) (bvsub (bvmul ((_ sign_extend 32) (size!6484 (buf!6952 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12849 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12844 w2!580)))))))

(assert (=> d!90080 d!90252))

(assert (=> d!90080 d!90216))

(assert (=> d!90156 d!90164))

(declare-fun d!90254 () Bool)

(assert (=> d!90254 (isPrefixOf!0 w1!584 w1!584)))

(assert (=> d!90254 true))

(declare-fun _$14!332 () Unit!18950)

(assert (=> d!90254 (= (choose!11 w1!584) _$14!332)))

(declare-fun bs!22912 () Bool)

(assert (= bs!22912 d!90254))

(assert (=> bs!22912 m!397901))

(assert (=> d!90156 d!90254))

(assert (=> d!90090 d!90102))

(declare-fun d!90256 () Bool)

(assert (=> d!90256 (isPrefixOf!0 lt!407606 w2!580)))

(assert (=> d!90256 true))

(declare-fun _$15!342 () Unit!18950)

(assert (=> d!90256 (= (choose!30 lt!407606 w1!584 w2!580) _$15!342)))

(declare-fun bs!22913 () Bool)

(assert (= bs!22913 d!90256))

(assert (=> bs!22913 m!397893))

(assert (=> d!90090 d!90256))

(assert (=> d!90090 d!90148))

(declare-fun b!267262 () Bool)

(declare-fun e!187099 () Bool)

(declare-fun call!4200 () Bool)

(assert (=> b!267262 (= e!187099 call!4200)))

(declare-fun b!267263 () Bool)

(declare-fun e!187102 () Bool)

(declare-fun e!187100 () Bool)

(assert (=> b!267263 (= e!187102 e!187100)))

(declare-fun lt!407875 () (_ BitVec 32))

(declare-fun lt!407874 () tuple4!398)

(declare-fun res!223169 () Bool)

(assert (=> b!267263 (= res!223169 (byteRangesEq!0 (select (arr!7471 (buf!6952 lt!407606)) (_3!979 lt!407874)) (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407874)) lt!407875 #b00000000000000000000000000001000))))

(assert (=> b!267263 (=> (not res!223169) (not e!187100))))

(declare-fun e!187101 () Bool)

(declare-fun b!267264 () Bool)

(assert (=> b!267264 (= e!187101 (arrayRangesEq!1035 (buf!6952 lt!407606) (buf!6952 w1!584) (_1!12180 lt!407874) (_2!12180 lt!407874)))))

(declare-fun c!12331 () Bool)

(declare-fun bm!4197 () Bool)

(declare-fun lt!407876 () (_ BitVec 32))

(assert (=> bm!4197 (= call!4200 (byteRangesEq!0 (ite c!12331 (select (arr!7471 (buf!6952 lt!407606)) (_3!979 lt!407874)) (select (arr!7471 (buf!6952 lt!407606)) (_4!199 lt!407874))) (ite c!12331 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407874)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407874))) (ite c!12331 lt!407875 #b00000000000000000000000000000000) lt!407876))))

(declare-fun b!267266 () Bool)

(declare-fun e!187098 () Bool)

(declare-fun e!187097 () Bool)

(assert (=> b!267266 (= e!187098 e!187097)))

(declare-fun res!223171 () Bool)

(assert (=> b!267266 (=> (not res!223171) (not e!187097))))

(assert (=> b!267266 (= res!223171 e!187101)))

(declare-fun res!223170 () Bool)

(assert (=> b!267266 (=> res!223170 e!187101)))

(assert (=> b!267266 (= res!223170 (bvsge (_1!12180 lt!407874) (_2!12180 lt!407874)))))

(assert (=> b!267266 (= lt!407876 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267266 (= lt!407875 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267266 (= lt!407874 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))))))

(declare-fun d!90258 () Bool)

(declare-fun res!223173 () Bool)

(assert (=> d!90258 (=> res!223173 e!187098)))

(assert (=> d!90258 (= res!223173 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))))))

(assert (=> d!90258 (= (arrayBitRangesEq!0 (buf!6952 lt!407606) (buf!6952 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 lt!407606)) (currentByte!12849 lt!407606) (currentBit!12844 lt!407606))) e!187098)))

(declare-fun b!267265 () Bool)

(declare-fun res!223172 () Bool)

(assert (=> b!267265 (= res!223172 (= lt!407876 #b00000000000000000000000000000000))))

(assert (=> b!267265 (=> res!223172 e!187099)))

(assert (=> b!267265 (= e!187100 e!187099)))

(declare-fun b!267267 () Bool)

(assert (=> b!267267 (= e!187097 e!187102)))

(assert (=> b!267267 (= c!12331 (= (_3!979 lt!407874) (_4!199 lt!407874)))))

(declare-fun b!267268 () Bool)

(assert (=> b!267268 (= e!187102 call!4200)))

(assert (= (and d!90258 (not res!223173)) b!267266))

(assert (= (and b!267266 (not res!223170)) b!267264))

(assert (= (and b!267266 res!223171) b!267267))

(assert (= (and b!267267 c!12331) b!267268))

(assert (= (and b!267267 (not c!12331)) b!267263))

(assert (= (and b!267263 res!223169) b!267265))

(assert (= (and b!267265 (not res!223172)) b!267262))

(assert (= (or b!267268 b!267262) bm!4197))

(declare-fun m!398331 () Bool)

(assert (=> b!267263 m!398331))

(declare-fun m!398333 () Bool)

(assert (=> b!267263 m!398333))

(assert (=> b!267263 m!398331))

(assert (=> b!267263 m!398333))

(declare-fun m!398335 () Bool)

(assert (=> b!267263 m!398335))

(declare-fun m!398337 () Bool)

(assert (=> b!267264 m!398337))

(assert (=> bm!4197 m!398333))

(declare-fun m!398339 () Bool)

(assert (=> bm!4197 m!398339))

(assert (=> bm!4197 m!398331))

(declare-fun m!398341 () Bool)

(assert (=> bm!4197 m!398341))

(declare-fun m!398343 () Bool)

(assert (=> bm!4197 m!398343))

(assert (=> b!267266 m!398027))

(assert (=> b!267266 m!398313))

(assert (=> b!267144 d!90258))

(assert (=> b!267144 d!90238))

(declare-fun b!267269 () Bool)

(declare-fun e!187105 () Bool)

(declare-fun call!4201 () Bool)

(assert (=> b!267269 (= e!187105 call!4201)))

(declare-fun b!267270 () Bool)

(declare-fun e!187108 () Bool)

(declare-fun e!187106 () Bool)

(assert (=> b!267270 (= e!187108 e!187106)))

(declare-fun lt!407878 () (_ BitVec 32))

(declare-fun res!223174 () Bool)

(declare-fun lt!407877 () tuple4!398)

(assert (=> b!267270 (= res!223174 (byteRangesEq!0 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407877)) (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407877)) lt!407878 #b00000000000000000000000000001000))))

(assert (=> b!267270 (=> (not res!223174) (not e!187106))))

(declare-fun b!267271 () Bool)

(declare-fun e!187107 () Bool)

(assert (=> b!267271 (= e!187107 (arrayRangesEq!1035 (buf!6952 w1!584) (buf!6952 w1!584) (_1!12180 lt!407877) (_2!12180 lt!407877)))))

(declare-fun c!12332 () Bool)

(declare-fun lt!407879 () (_ BitVec 32))

(declare-fun bm!4198 () Bool)

(assert (=> bm!4198 (= call!4201 (byteRangesEq!0 (ite c!12332 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407877)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407877))) (ite c!12332 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407877)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407877))) (ite c!12332 lt!407878 #b00000000000000000000000000000000) lt!407879))))

(declare-fun b!267273 () Bool)

(declare-fun e!187104 () Bool)

(declare-fun e!187103 () Bool)

(assert (=> b!267273 (= e!187104 e!187103)))

(declare-fun res!223176 () Bool)

(assert (=> b!267273 (=> (not res!223176) (not e!187103))))

(assert (=> b!267273 (= res!223176 e!187107)))

(declare-fun res!223175 () Bool)

(assert (=> b!267273 (=> res!223175 e!187107)))

(assert (=> b!267273 (= res!223175 (bvsge (_1!12180 lt!407877) (_2!12180 lt!407877)))))

(assert (=> b!267273 (= lt!407879 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267273 (= lt!407878 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267273 (= lt!407877 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))))))

(declare-fun d!90260 () Bool)

(declare-fun res!223178 () Bool)

(assert (=> d!90260 (=> res!223178 e!187104)))

(assert (=> d!90260 (= res!223178 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))))))

(assert (=> d!90260 (= (arrayBitRangesEq!0 (buf!6952 w1!584) (buf!6952 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6484 (buf!6952 w1!584)) (currentByte!12849 w1!584) (currentBit!12844 w1!584))) e!187104)))

(declare-fun b!267272 () Bool)

(declare-fun res!223177 () Bool)

(assert (=> b!267272 (= res!223177 (= lt!407879 #b00000000000000000000000000000000))))

(assert (=> b!267272 (=> res!223177 e!187105)))

(assert (=> b!267272 (= e!187106 e!187105)))

(declare-fun b!267274 () Bool)

(assert (=> b!267274 (= e!187103 e!187108)))

(assert (=> b!267274 (= c!12332 (= (_3!979 lt!407877) (_4!199 lt!407877)))))

(declare-fun b!267275 () Bool)

(assert (=> b!267275 (= e!187108 call!4201)))

(assert (= (and d!90260 (not res!223178)) b!267273))

(assert (= (and b!267273 (not res!223175)) b!267271))

(assert (= (and b!267273 res!223176) b!267274))

(assert (= (and b!267274 c!12332) b!267275))

(assert (= (and b!267274 (not c!12332)) b!267270))

(assert (= (and b!267270 res!223174) b!267272))

(assert (= (and b!267272 (not res!223177)) b!267269))

(assert (= (or b!267275 b!267269) bm!4198))

(declare-fun m!398345 () Bool)

(assert (=> b!267270 m!398345))

(assert (=> b!267270 m!398345))

(assert (=> b!267270 m!398345))

(assert (=> b!267270 m!398345))

(declare-fun m!398347 () Bool)

(assert (=> b!267270 m!398347))

(declare-fun m!398349 () Bool)

(assert (=> b!267271 m!398349))

(assert (=> bm!4198 m!398345))

(declare-fun m!398351 () Bool)

(assert (=> bm!4198 m!398351))

(assert (=> bm!4198 m!398345))

(assert (=> bm!4198 m!398351))

(declare-fun m!398353 () Bool)

(assert (=> bm!4198 m!398353))

(assert (=> b!267273 m!397871))

(assert (=> b!267273 m!398157))

(assert (=> b!267152 d!90260))

(assert (=> b!267152 d!90106))

(assert (=> b!267133 d!90212))

(assert (=> b!267147 d!90238))

(assert (=> d!90152 d!90166))

(declare-fun d!90262 () Bool)

(assert (=> d!90262 (isPrefixOf!0 w2!580 w2!580)))

(assert (=> d!90262 true))

(declare-fun _$14!333 () Unit!18950)

(assert (=> d!90262 (= (choose!11 w2!580) _$14!333)))

(declare-fun bs!22914 () Bool)

(assert (= bs!22914 d!90262))

(assert (=> bs!22914 m!397903))

(assert (=> d!90152 d!90262))

(declare-fun d!90264 () Bool)

(declare-fun res!223179 () Bool)

(declare-fun e!187109 () Bool)

(assert (=> d!90264 (=> res!223179 e!187109)))

(assert (=> d!90264 (= res!223179 (= (_1!12180 lt!407787) (_2!12180 lt!407787)))))

(assert (=> d!90264 (= (arrayRangesEq!1035 (buf!6952 w2!580) (buf!6952 w1!584) (_1!12180 lt!407787) (_2!12180 lt!407787)) e!187109)))

(declare-fun b!267276 () Bool)

(declare-fun e!187110 () Bool)

(assert (=> b!267276 (= e!187109 e!187110)))

(declare-fun res!223180 () Bool)

(assert (=> b!267276 (=> (not res!223180) (not e!187110))))

(assert (=> b!267276 (= res!223180 (= (select (arr!7471 (buf!6952 w2!580)) (_1!12180 lt!407787)) (select (arr!7471 (buf!6952 w1!584)) (_1!12180 lt!407787))))))

(declare-fun b!267277 () Bool)

(assert (=> b!267277 (= e!187110 (arrayRangesEq!1035 (buf!6952 w2!580) (buf!6952 w1!584) (bvadd (_1!12180 lt!407787) #b00000000000000000000000000000001) (_2!12180 lt!407787)))))

(assert (= (and d!90264 (not res!223179)) b!267276))

(assert (= (and b!267276 res!223180) b!267277))

(declare-fun m!398355 () Bool)

(assert (=> b!267276 m!398355))

(declare-fun m!398357 () Bool)

(assert (=> b!267276 m!398357))

(declare-fun m!398359 () Bool)

(assert (=> b!267277 m!398359))

(assert (=> b!267131 d!90264))

(assert (=> d!90100 d!90102))

(declare-fun d!90266 () Bool)

(assert (=> d!90266 (isPrefixOf!0 lt!407606 w2!580)))

(assert (=> d!90266 true))

(declare-fun _$15!343 () Unit!18950)

(assert (=> d!90266 (= (choose!30 lt!407606 w2!580 w2!580) _$15!343)))

(declare-fun bs!22915 () Bool)

(assert (= bs!22915 d!90266))

(assert (=> bs!22915 m!397893))

(assert (=> d!90100 d!90266))

(assert (=> b!267150 d!90106))

(assert (=> d!90112 d!90114))

(declare-fun d!90268 () Bool)

(assert (=> d!90268 (arrayBitRangesEq!0 (buf!6952 w2!580) (buf!6952 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600)))

(assert (=> d!90268 true))

(declare-fun _$19!207 () Unit!18950)

(assert (=> d!90268 (= (choose!8 (buf!6952 w1!584) (buf!6952 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407600) _$19!207)))

(declare-fun bs!22916 () Bool)

(assert (= bs!22916 d!90268))

(assert (=> bs!22916 m!397909))

(assert (=> d!90112 d!90268))

(declare-fun d!90270 () Bool)

(assert (=> d!90270 (= (remainingBits!0 ((_ sign_extend 32) (size!6484 (buf!6952 w1!584))) ((_ sign_extend 32) (currentByte!12849 w1!584)) ((_ sign_extend 32) (currentBit!12844 w1!584))) (bvsub (bvmul ((_ sign_extend 32) (size!6484 (buf!6952 w1!584))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12849 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12844 w1!584)))))))

(assert (=> d!90106 d!90270))

(assert (=> d!90106 d!90248))

(declare-fun d!90272 () Bool)

(assert (=> d!90272 (= (byteRangesEq!0 (ite c!12321 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407787)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407787))) (ite c!12321 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407787)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407787))) (ite c!12321 lt!407788 #b00000000000000000000000000000000) lt!407789) (or (= (ite c!12321 lt!407788 #b00000000000000000000000000000000) lt!407789) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12321 (select (arr!7471 (buf!6952 w2!580)) (_3!979 lt!407787)) (select (arr!7471 (buf!6952 w2!580)) (_4!199 lt!407787)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407789))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12321 lt!407788 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12321 (select (arr!7471 (buf!6952 w1!584)) (_3!979 lt!407787)) (select (arr!7471 (buf!6952 w1!584)) (_4!199 lt!407787)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407789))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12321 lt!407788 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!22917 () Bool)

(assert (= bs!22917 d!90272))

(declare-fun m!398361 () Bool)

(assert (=> bs!22917 m!398361))

(declare-fun m!398363 () Bool)

(assert (=> bs!22917 m!398363))

(assert (=> bm!4187 d!90272))

(push 1)

(assert (not b!267224))

(assert (not b!267257))

(assert (not b!267250))

(assert (not b!267256))

(assert (not b!267271))

(assert (not bm!4197))

(assert (not bm!4198))

(assert (not b!267231))

(assert (not d!90266))

(assert (not b!267243))

(assert (not b!267270))

(assert (not b!267245))

(assert (not b!267249))

(assert (not b!267277))

(assert (not d!90232))

(assert (not d!90226))

(assert (not bm!4196))

(assert (not b!267273))

(assert (not d!90268))

(assert (not d!90254))

(assert (not b!267264))

(assert (not bm!4194))

(assert (not b!267236))

(assert (not b!267238))

(assert (not d!90256))

(assert (not d!90238))

(assert (not b!267263))

(assert (not b!267259))

(assert (not bm!4195))

(assert (not b!267242))

(assert (not b!267252))

(assert (not d!90224))

(assert (not d!90262))

(assert (not b!267266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

