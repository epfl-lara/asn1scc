; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18488 () Bool)

(assert start!18488)

(declare-fun b!91801 () Bool)

(declare-fun res!75788 () Bool)

(declare-fun e!60359 () Bool)

(assert (=> b!91801 (=> (not res!75788) (not e!60359))))

(declare-datatypes ((array!4294 0))(
  ( (array!4295 (arr!2570 (Array (_ BitVec 32) (_ BitVec 8))) (size!1936 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3428 0))(
  ( (BitStream!3429 (buf!2323 array!4294) (currentByte!4625 (_ BitVec 32)) (currentBit!4620 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3428)

(declare-fun bitStream2!8 () BitStream!3428)

(declare-fun base!8 () BitStream!3428)

(assert (=> b!91801 (= res!75788 (and (= (buf!2323 bitStream1!8) (buf!2323 bitStream2!8)) (= (buf!2323 bitStream1!8) (buf!2323 base!8))))))

(declare-fun b!91802 () Bool)

(declare-fun e!60355 () Bool)

(declare-fun array_inv!1779 (array!4294) Bool)

(assert (=> b!91802 (= e!60355 (array_inv!1779 (buf!2323 bitStream2!8)))))

(declare-fun b!91803 () Bool)

(declare-fun e!60357 () Bool)

(assert (=> b!91803 (= e!60357 (array_inv!1779 (buf!2323 base!8)))))

(declare-fun b!91804 () Bool)

(declare-fun res!75792 () Bool)

(assert (=> b!91804 (=> (not res!75792) (not e!60359))))

(declare-fun isPrefixOf!0 (BitStream!3428 BitStream!3428) Bool)

(assert (=> b!91804 (= res!75792 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!91805 () Bool)

(declare-fun res!75787 () Bool)

(assert (=> b!91805 (=> (not res!75787) (not e!60359))))

(declare-datatypes ((List!820 0))(
  ( (Nil!817) (Cons!816 (h!935 Bool) (t!1570 List!820)) )
))
(declare-fun listBits!13 () List!820)

(declare-fun length!411 (List!820) Int)

(assert (=> b!91805 (= res!75787 (> (length!411 listBits!13) 0))))

(declare-fun res!75789 () Bool)

(assert (=> start!18488 (=> (not res!75789) (not e!60359))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18488 (= res!75789 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18488 e!60359))

(assert (=> start!18488 true))

(declare-fun e!60358 () Bool)

(declare-fun inv!12 (BitStream!3428) Bool)

(assert (=> start!18488 (and (inv!12 bitStream1!8) e!60358)))

(assert (=> start!18488 (and (inv!12 bitStream2!8) e!60355)))

(assert (=> start!18488 (and (inv!12 base!8) e!60357)))

(declare-fun b!91806 () Bool)

(declare-fun res!75793 () Bool)

(assert (=> b!91806 (=> (not res!75793) (not e!60359))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91806 (= res!75793 (bvslt (bitIndex!0 (size!1936 (buf!2323 base!8)) (currentByte!4625 base!8) (currentBit!4620 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!91807 () Bool)

(assert (=> b!91807 (= e!60358 (array_inv!1779 (buf!2323 bitStream1!8)))))

(declare-fun b!91808 () Bool)

(declare-fun res!75791 () Bool)

(assert (=> b!91808 (=> (not res!75791) (not e!60359))))

(assert (=> b!91808 (= res!75791 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!91809 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91809 (= e!60359 (not (invariant!0 (currentBit!4620 bitStream1!8) (currentByte!4625 bitStream1!8) (size!1936 (buf!2323 bitStream1!8)))))))

(declare-fun b!91810 () Bool)

(declare-fun res!75790 () Bool)

(assert (=> b!91810 (=> (not res!75790) (not e!60359))))

(assert (=> b!91810 (= res!75790 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(assert (= (and start!18488 res!75789) b!91805))

(assert (= (and b!91805 res!75787) b!91808))

(assert (= (and b!91808 res!75791) b!91804))

(assert (= (and b!91804 res!75792) b!91810))

(assert (= (and b!91810 res!75790) b!91801))

(assert (= (and b!91801 res!75788) b!91806))

(assert (= (and b!91806 res!75793) b!91809))

(assert (= start!18488 b!91807))

(assert (= start!18488 b!91802))

(assert (= start!18488 b!91803))

(declare-fun m!135893 () Bool)

(assert (=> b!91804 m!135893))

(declare-fun m!135895 () Bool)

(assert (=> b!91807 m!135895))

(declare-fun m!135897 () Bool)

(assert (=> b!91809 m!135897))

(declare-fun m!135899 () Bool)

(assert (=> start!18488 m!135899))

(declare-fun m!135901 () Bool)

(assert (=> start!18488 m!135901))

(declare-fun m!135903 () Bool)

(assert (=> start!18488 m!135903))

(declare-fun m!135905 () Bool)

(assert (=> b!91803 m!135905))

(declare-fun m!135907 () Bool)

(assert (=> b!91808 m!135907))

(declare-fun m!135909 () Bool)

(assert (=> b!91806 m!135909))

(declare-fun m!135911 () Bool)

(assert (=> b!91802 m!135911))

(declare-fun m!135913 () Bool)

(assert (=> b!91810 m!135913))

(declare-fun m!135915 () Bool)

(assert (=> b!91805 m!135915))

(push 1)

(assert (not b!91805))

(assert (not b!91803))

(assert (not b!91802))

(assert (not b!91807))

(assert (not b!91806))

(assert (not b!91804))

(assert (not b!91808))

(assert (not start!18488))

(assert (not b!91810))

(assert (not b!91809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28554 () Bool)

(assert (=> d!28554 (= (array_inv!1779 (buf!2323 base!8)) (bvsge (size!1936 (buf!2323 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!91803 d!28554))

(declare-fun d!28556 () Bool)

(declare-fun res!75825 () Bool)

(declare-fun e!60381 () Bool)

(assert (=> d!28556 (=> (not res!75825) (not e!60381))))

(assert (=> d!28556 (= res!75825 (= (size!1936 (buf!2323 bitStream1!8)) (size!1936 (buf!2323 base!8))))))

(assert (=> d!28556 (= (isPrefixOf!0 bitStream1!8 base!8) e!60381)))

(declare-fun b!91841 () Bool)

(declare-fun res!75824 () Bool)

(assert (=> b!91841 (=> (not res!75824) (not e!60381))))

(assert (=> b!91841 (= res!75824 (bvsle (bitIndex!0 (size!1936 (buf!2323 bitStream1!8)) (currentByte!4625 bitStream1!8) (currentBit!4620 bitStream1!8)) (bitIndex!0 (size!1936 (buf!2323 base!8)) (currentByte!4625 base!8) (currentBit!4620 base!8))))))

(declare-fun b!91842 () Bool)

(declare-fun e!60382 () Bool)

(assert (=> b!91842 (= e!60381 e!60382)))

(declare-fun res!75826 () Bool)

(assert (=> b!91842 (=> res!75826 e!60382)))

(assert (=> b!91842 (= res!75826 (= (size!1936 (buf!2323 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91843 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4294 array!4294 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91843 (= e!60382 (arrayBitRangesEq!0 (buf!2323 bitStream1!8) (buf!2323 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1936 (buf!2323 bitStream1!8)) (currentByte!4625 bitStream1!8) (currentBit!4620 bitStream1!8))))))

(assert (= (and d!28556 res!75825) b!91841))

(assert (= (and b!91841 res!75824) b!91842))

(assert (= (and b!91842 (not res!75826)) b!91843))

(declare-fun m!135937 () Bool)

(assert (=> b!91841 m!135937))

(assert (=> b!91841 m!135909))

(assert (=> b!91843 m!135937))

(assert (=> b!91843 m!135937))

(declare-fun m!135939 () Bool)

(assert (=> b!91843 m!135939))

(assert (=> b!91808 d!28556))

(declare-fun d!28580 () Bool)

(assert (=> d!28580 (= (invariant!0 (currentBit!4620 bitStream1!8) (currentByte!4625 bitStream1!8) (size!1936 (buf!2323 bitStream1!8))) (and (bvsge (currentBit!4620 bitStream1!8) #b00000000000000000000000000000000) (bvslt (currentBit!4620 bitStream1!8) #b00000000000000000000000000001000) (bvsge (currentByte!4625 bitStream1!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4625 bitStream1!8) (size!1936 (buf!2323 bitStream1!8))) (and (= (currentBit!4620 bitStream1!8) #b00000000000000000000000000000000) (= (currentByte!4625 bitStream1!8) (size!1936 (buf!2323 bitStream1!8)))))))))

(assert (=> b!91809 d!28580))

(declare-fun d!28590 () Bool)

(declare-fun res!75828 () Bool)

(declare-fun e!60383 () Bool)

(assert (=> d!28590 (=> (not res!75828) (not e!60383))))

(assert (=> d!28590 (= res!75828 (= (size!1936 (buf!2323 bitStream2!8)) (size!1936 (buf!2323 base!8))))))

(assert (=> d!28590 (= (isPrefixOf!0 bitStream2!8 base!8) e!60383)))

(declare-fun b!91844 () Bool)

(declare-fun res!75827 () Bool)

(assert (=> b!91844 (=> (not res!75827) (not e!60383))))

(assert (=> b!91844 (= res!75827 (bvsle (bitIndex!0 (size!1936 (buf!2323 bitStream2!8)) (currentByte!4625 bitStream2!8) (currentBit!4620 bitStream2!8)) (bitIndex!0 (size!1936 (buf!2323 base!8)) (currentByte!4625 base!8) (currentBit!4620 base!8))))))

(declare-fun b!91845 () Bool)

(declare-fun e!60384 () Bool)

(assert (=> b!91845 (= e!60383 e!60384)))

(declare-fun res!75829 () Bool)

(assert (=> b!91845 (=> res!75829 e!60384)))

(assert (=> b!91845 (= res!75829 (= (size!1936 (buf!2323 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!91846 () Bool)

(assert (=> b!91846 (= e!60384 (arrayBitRangesEq!0 (buf!2323 bitStream2!8) (buf!2323 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1936 (buf!2323 bitStream2!8)) (currentByte!4625 bitStream2!8) (currentBit!4620 bitStream2!8))))))

(assert (= (and d!28590 res!75828) b!91844))

(assert (= (and b!91844 res!75827) b!91845))

(assert (= (and b!91845 (not res!75829)) b!91846))

(declare-fun m!135945 () Bool)

(assert (=> b!91844 m!135945))

(assert (=> b!91844 m!135909))

(assert (=> b!91846 m!135945))

(assert (=> b!91846 m!135945))

(declare-fun m!135947 () Bool)

(assert (=> b!91846 m!135947))

(assert (=> b!91804 d!28590))

(declare-fun d!28592 () Bool)

(declare-fun size!1938 (List!820) Int)

(assert (=> d!28592 (= (length!411 listBits!13) (size!1938 listBits!13))))

(declare-fun bs!7053 () Bool)

(assert (= bs!7053 d!28592))

(declare-fun m!135949 () Bool)

(assert (=> bs!7053 m!135949))

(assert (=> b!91805 d!28592))

(declare-fun d!28594 () Bool)

(declare-fun res!75831 () Bool)

(declare-fun e!60385 () Bool)

(assert (=> d!28594 (=> (not res!75831) (not e!60385))))

(assert (=> d!28594 (= res!75831 (= (size!1936 (buf!2323 bitStream1!8)) (size!1936 (buf!2323 bitStream2!8))))))

(assert (=> d!28594 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60385)))

(declare-fun b!91847 () Bool)

(declare-fun res!75830 () Bool)

(assert (=> b!91847 (=> (not res!75830) (not e!60385))))

(assert (=> b!91847 (= res!75830 (bvsle (bitIndex!0 (size!1936 (buf!2323 bitStream1!8)) (currentByte!4625 bitStream1!8) (currentBit!4620 bitStream1!8)) (bitIndex!0 (size!1936 (buf!2323 bitStream2!8)) (currentByte!4625 bitStream2!8) (currentBit!4620 bitStream2!8))))))

(declare-fun b!91848 () Bool)

(declare-fun e!60386 () Bool)

(assert (=> b!91848 (= e!60385 e!60386)))

(declare-fun res!75832 () Bool)

(assert (=> b!91848 (=> res!75832 e!60386)))

(assert (=> b!91848 (= res!75832 (= (size!1936 (buf!2323 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91849 () Bool)

(assert (=> b!91849 (= e!60386 (arrayBitRangesEq!0 (buf!2323 bitStream1!8) (buf!2323 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1936 (buf!2323 bitStream1!8)) (currentByte!4625 bitStream1!8) (currentBit!4620 bitStream1!8))))))

(assert (= (and d!28594 res!75831) b!91847))

(assert (= (and b!91847 res!75830) b!91848))

(assert (= (and b!91848 (not res!75832)) b!91849))

(assert (=> b!91847 m!135937))

(assert (=> b!91847 m!135945))

(assert (=> b!91849 m!135937))

(assert (=> b!91849 m!135937))

(declare-fun m!135951 () Bool)

(assert (=> b!91849 m!135951))

(assert (=> b!91810 d!28594))

(declare-fun d!28596 () Bool)

(declare-fun e!60399 () Bool)

(assert (=> d!28596 e!60399))

(declare-fun res!75855 () Bool)

(assert (=> d!28596 (=> (not res!75855) (not e!60399))))

(declare-fun lt!137974 () (_ BitVec 64))

(declare-fun lt!137972 () (_ BitVec 64))

(declare-fun lt!137971 () (_ BitVec 64))

(assert (=> d!28596 (= res!75855 (= lt!137971 (bvsub lt!137974 lt!137972)))))

(assert (=> d!28596 (or (= (bvand lt!137974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137972 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137974 lt!137972) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28596 (= lt!137972 (remainingBits!0 ((_ sign_extend 32) (size!1936 (buf!2323 base!8))) ((_ sign_extend 32) (currentByte!4625 base!8)) ((_ sign_extend 32) (currentBit!4620 base!8))))))

(declare-fun lt!137975 () (_ BitVec 64))

(declare-fun lt!137976 () (_ BitVec 64))

(assert (=> d!28596 (= lt!137974 (bvmul lt!137975 lt!137976))))

(assert (=> d!28596 (or (= lt!137975 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137976 (bvsdiv (bvmul lt!137975 lt!137976) lt!137975)))))

(assert (=> d!28596 (= lt!137976 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28596 (= lt!137975 ((_ sign_extend 32) (size!1936 (buf!2323 base!8))))))

(assert (=> d!28596 (= lt!137971 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4625 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4620 base!8))))))

(assert (=> d!28596 (invariant!0 (currentBit!4620 base!8) (currentByte!4625 base!8) (size!1936 (buf!2323 base!8)))))

(assert (=> d!28596 (= (bitIndex!0 (size!1936 (buf!2323 base!8)) (currentByte!4625 base!8) (currentBit!4620 base!8)) lt!137971)))

(declare-fun b!91872 () Bool)

(declare-fun res!75856 () Bool)

(assert (=> b!91872 (=> (not res!75856) (not e!60399))))

(assert (=> b!91872 (= res!75856 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137971))))

(declare-fun b!91873 () Bool)

(declare-fun lt!137973 () (_ BitVec 64))

(assert (=> b!91873 (= e!60399 (bvsle lt!137971 (bvmul lt!137973 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91873 (or (= lt!137973 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137973 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137973)))))

(assert (=> b!91873 (= lt!137973 ((_ sign_extend 32) (size!1936 (buf!2323 base!8))))))

(assert (= (and d!28596 res!75855) b!91872))

(assert (= (and b!91872 res!75856) b!91873))

(declare-fun m!135965 () Bool)

(assert (=> d!28596 m!135965))

(declare-fun m!135967 () Bool)

(assert (=> d!28596 m!135967))

(assert (=> b!91806 d!28596))

(declare-fun d!28612 () Bool)

(assert (=> d!28612 (= (array_inv!1779 (buf!2323 bitStream1!8)) (bvsge (size!1936 (buf!2323 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!91807 d!28612))

(declare-fun d!28614 () Bool)

(assert (=> d!28614 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4620 bitStream1!8) (currentByte!4625 bitStream1!8) (size!1936 (buf!2323 bitStream1!8))))))

(declare-fun bs!7055 () Bool)

(assert (= bs!7055 d!28614))

(assert (=> bs!7055 m!135897))

(assert (=> start!18488 d!28614))

(declare-fun d!28616 () Bool)

(assert (=> d!28616 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4620 bitStream2!8) (currentByte!4625 bitStream2!8) (size!1936 (buf!2323 bitStream2!8))))))

(declare-fun bs!7056 () Bool)

(assert (= bs!7056 d!28616))

(declare-fun m!135969 () Bool)

(assert (=> bs!7056 m!135969))

(assert (=> start!18488 d!28616))

(declare-fun d!28618 () Bool)

(assert (=> d!28618 (= (inv!12 base!8) (invariant!0 (currentBit!4620 base!8) (currentByte!4625 base!8) (size!1936 (buf!2323 base!8))))))

(declare-fun bs!7057 () Bool)

(assert (= bs!7057 d!28618))

(assert (=> bs!7057 m!135967))

(assert (=> start!18488 d!28618))

(declare-fun d!28620 () Bool)

(assert (=> d!28620 (= (array_inv!1779 (buf!2323 bitStream2!8)) (bvsge (size!1936 (buf!2323 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!91802 d!28620))

(push 1)

