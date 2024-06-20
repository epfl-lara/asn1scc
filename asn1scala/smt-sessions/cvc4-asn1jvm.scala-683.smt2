; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19140 () Bool)

(assert start!19140)

(declare-fun b!95870 () Bool)

(declare-fun e!62806 () Bool)

(declare-datatypes ((array!4480 0))(
  ( (array!4481 (arr!2645 (Array (_ BitVec 32) (_ BitVec 8))) (size!2046 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3578 0))(
  ( (BitStream!3579 (buf!2398 array!4480) (currentByte!4776 (_ BitVec 32)) (currentBit!4771 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3578)

(declare-fun array_inv!1854 (array!4480) Bool)

(assert (=> b!95870 (= e!62806 (array_inv!1854 (buf!2398 bitStream1!8)))))

(declare-fun b!95871 () Bool)

(declare-fun res!78874 () Bool)

(declare-fun e!62813 () Bool)

(assert (=> b!95871 (=> (not res!78874) (not e!62813))))

(declare-fun bitStream2!8 () BitStream!3578)

(declare-fun base!8 () BitStream!3578)

(assert (=> b!95871 (= res!78874 (and (= (buf!2398 bitStream1!8) (buf!2398 bitStream2!8)) (= (buf!2398 bitStream1!8) (buf!2398 base!8))))))

(declare-fun b!95872 () Bool)

(declare-fun res!78882 () Bool)

(assert (=> b!95872 (=> (not res!78882) (not e!62813))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95872 (= res!78882 (bvslt (bitIndex!0 (size!2046 (buf!2398 base!8)) (currentByte!4776 base!8) (currentBit!4771 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95873 () Bool)

(declare-fun res!78875 () Bool)

(assert (=> b!95873 (=> (not res!78875) (not e!62813))))

(assert (=> b!95873 (= res!78875 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!95874 () Bool)

(declare-datatypes ((List!895 0))(
  ( (Nil!892) (Cons!891 (h!1010 Bool) (t!1645 List!895)) )
))
(declare-fun listBits!13 () List!895)

(declare-fun thiss!1534 () BitStream!3578)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3578 BitStream!3578 (_ BitVec 64)) List!895)

(declare-fun tail!374 (List!895) List!895)

(assert (=> b!95874 (= e!62813 (not (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!374 listBits!13))))))

(declare-fun b!95875 () Bool)

(declare-fun res!78879 () Bool)

(assert (=> b!95875 (=> (not res!78879) (not e!62813))))

(assert (=> b!95875 (= res!78879 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8))) (bitIndex!0 (size!2046 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8) (currentBit!4771 bitStream2!8))))))

(declare-fun b!95876 () Bool)

(declare-fun res!78872 () Bool)

(assert (=> b!95876 (=> (not res!78872) (not e!62813))))

(declare-fun isPrefixOf!0 (BitStream!3578 BitStream!3578) Bool)

(assert (=> b!95876 (= res!78872 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95877 () Bool)

(declare-fun res!78873 () Bool)

(assert (=> b!95877 (=> (not res!78873) (not e!62813))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95877 (= res!78873 (validate_offset_bits!1 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream2!8))) ((_ sign_extend 32) (currentByte!4776 bitStream2!8)) ((_ sign_extend 32) (currentBit!4771 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95878 () Bool)

(declare-fun e!62812 () Bool)

(assert (=> b!95878 (= e!62812 (array_inv!1854 (buf!2398 base!8)))))

(declare-fun b!95879 () Bool)

(declare-fun res!78877 () Bool)

(assert (=> b!95879 (=> (not res!78877) (not e!62813))))

(declare-fun length!486 (List!895) Int)

(assert (=> b!95879 (= res!78877 (> (length!486 listBits!13) 0))))

(declare-fun b!95880 () Bool)

(declare-fun res!78876 () Bool)

(assert (=> b!95880 (=> (not res!78876) (not e!62813))))

(assert (=> b!95880 (= res!78876 (validate_offset_bits!1 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream1!8))) ((_ sign_extend 32) (currentByte!4776 bitStream1!8)) ((_ sign_extend 32) (currentBit!4771 bitStream1!8)) nBits!484))))

(declare-fun b!95881 () Bool)

(declare-fun e!62808 () Bool)

(assert (=> b!95881 (= e!62808 (array_inv!1854 (buf!2398 bitStream2!8)))))

(declare-fun res!78881 () Bool)

(assert (=> start!19140 (=> (not res!78881) (not e!62813))))

(assert (=> start!19140 (= res!78881 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19140 e!62813))

(assert (=> start!19140 true))

(declare-fun inv!12 (BitStream!3578) Bool)

(assert (=> start!19140 (and (inv!12 bitStream1!8) e!62806)))

(assert (=> start!19140 (and (inv!12 bitStream2!8) e!62808)))

(assert (=> start!19140 (and (inv!12 base!8) e!62812)))

(declare-fun e!62814 () Bool)

(assert (=> start!19140 (and (inv!12 thiss!1534) e!62814)))

(declare-fun b!95882 () Bool)

(declare-fun res!78878 () Bool)

(assert (=> b!95882 (=> (not res!78878) (not e!62813))))

(assert (=> b!95882 (= res!78878 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95883 () Bool)

(declare-fun res!78880 () Bool)

(assert (=> b!95883 (=> (not res!78880) (not e!62813))))

(assert (=> b!95883 (= res!78880 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!95884 () Bool)

(declare-fun res!78871 () Bool)

(assert (=> b!95884 (=> (not res!78871) (not e!62813))))

(assert (=> b!95884 (= res!78871 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95885 () Bool)

(assert (=> b!95885 (= e!62814 (array_inv!1854 (buf!2398 thiss!1534)))))

(assert (= (and start!19140 res!78881) b!95879))

(assert (= (and b!95879 res!78877) b!95884))

(assert (= (and b!95884 res!78871) b!95876))

(assert (= (and b!95876 res!78872) b!95882))

(assert (= (and b!95882 res!78878) b!95871))

(assert (= (and b!95871 res!78874) b!95872))

(assert (= (and b!95872 res!78882) b!95875))

(assert (= (and b!95875 res!78879) b!95880))

(assert (= (and b!95880 res!78876) b!95877))

(assert (= (and b!95877 res!78873) b!95883))

(assert (= (and b!95883 res!78880) b!95873))

(assert (= (and b!95873 res!78875) b!95874))

(assert (= start!19140 b!95870))

(assert (= start!19140 b!95881))

(assert (= start!19140 b!95878))

(assert (= start!19140 b!95885))

(declare-fun m!139189 () Bool)

(assert (=> b!95883 m!139189))

(declare-fun m!139191 () Bool)

(assert (=> b!95878 m!139191))

(declare-fun m!139193 () Bool)

(assert (=> b!95877 m!139193))

(declare-fun m!139195 () Bool)

(assert (=> b!95876 m!139195))

(declare-fun m!139197 () Bool)

(assert (=> b!95874 m!139197))

(declare-fun m!139199 () Bool)

(assert (=> b!95874 m!139199))

(declare-fun m!139201 () Bool)

(assert (=> b!95880 m!139201))

(declare-fun m!139203 () Bool)

(assert (=> b!95875 m!139203))

(declare-fun m!139205 () Bool)

(assert (=> b!95875 m!139205))

(declare-fun m!139207 () Bool)

(assert (=> b!95882 m!139207))

(declare-fun m!139209 () Bool)

(assert (=> b!95870 m!139209))

(declare-fun m!139211 () Bool)

(assert (=> b!95885 m!139211))

(declare-fun m!139213 () Bool)

(assert (=> b!95881 m!139213))

(declare-fun m!139215 () Bool)

(assert (=> start!19140 m!139215))

(declare-fun m!139217 () Bool)

(assert (=> start!19140 m!139217))

(declare-fun m!139219 () Bool)

(assert (=> start!19140 m!139219))

(declare-fun m!139221 () Bool)

(assert (=> start!19140 m!139221))

(declare-fun m!139223 () Bool)

(assert (=> b!95872 m!139223))

(declare-fun m!139225 () Bool)

(assert (=> b!95879 m!139225))

(declare-fun m!139227 () Bool)

(assert (=> b!95884 m!139227))

(push 1)

(assert (not start!19140))

(assert (not b!95881))

(assert (not b!95882))

(assert (not b!95884))

(assert (not b!95877))

(assert (not b!95870))

(assert (not b!95883))

(assert (not b!95879))

(assert (not b!95880))

(assert (not b!95875))

(assert (not b!95878))

(assert (not b!95876))

(assert (not b!95874))

(assert (not b!95885))

(assert (not b!95872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29806 () Bool)

(declare-fun res!78907 () Bool)

(declare-fun e!62840 () Bool)

(assert (=> d!29806 (=> (not res!78907) (not e!62840))))

(assert (=> d!29806 (= res!78907 (= (size!2046 (buf!2398 bitStream1!8)) (size!2046 (buf!2398 bitStream2!8))))))

(assert (=> d!29806 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62840)))

(declare-fun b!95926 () Bool)

(declare-fun res!78908 () Bool)

(assert (=> b!95926 (=> (not res!78908) (not e!62840))))

(assert (=> b!95926 (= res!78908 (bvsle (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8)) (bitIndex!0 (size!2046 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8) (currentBit!4771 bitStream2!8))))))

(declare-fun b!95927 () Bool)

(declare-fun e!62839 () Bool)

(assert (=> b!95927 (= e!62840 e!62839)))

(declare-fun res!78909 () Bool)

(assert (=> b!95927 (=> res!78909 e!62839)))

(assert (=> b!95927 (= res!78909 (= (size!2046 (buf!2398 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95928 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4480 array!4480 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95928 (= e!62839 (arrayBitRangesEq!0 (buf!2398 bitStream1!8) (buf!2398 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8))))))

(assert (= (and d!29806 res!78907) b!95926))

(assert (= (and b!95926 res!78908) b!95927))

(assert (= (and b!95927 (not res!78909)) b!95928))

(assert (=> b!95926 m!139203))

(assert (=> b!95926 m!139205))

(assert (=> b!95928 m!139203))

(assert (=> b!95928 m!139203))

(declare-fun m!139273 () Bool)

(assert (=> b!95928 m!139273))

(assert (=> b!95882 d!29806))

(declare-fun d!29812 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29812 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream1!8))) ((_ sign_extend 32) (currentByte!4776 bitStream1!8)) ((_ sign_extend 32) (currentBit!4771 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream1!8))) ((_ sign_extend 32) (currentByte!4776 bitStream1!8)) ((_ sign_extend 32) (currentBit!4771 bitStream1!8))) nBits!484))))

(declare-fun bs!7337 () Bool)

(assert (= bs!7337 d!29812))

(declare-fun m!139275 () Bool)

(assert (=> bs!7337 m!139275))

(assert (=> b!95880 d!29812))

(declare-fun d!29814 () Bool)

(assert (=> d!29814 (= (array_inv!1854 (buf!2398 bitStream2!8)) (bvsge (size!2046 (buf!2398 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!95881 d!29814))

(declare-fun d!29816 () Bool)

(assert (=> d!29816 (= (array_inv!1854 (buf!2398 bitStream1!8)) (bvsge (size!2046 (buf!2398 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!95870 d!29816))

(declare-fun d!29818 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29818 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4771 bitStream1!8) (currentByte!4776 bitStream1!8) (size!2046 (buf!2398 bitStream1!8))))))

(declare-fun bs!7338 () Bool)

(assert (= bs!7338 d!29818))

(declare-fun m!139277 () Bool)

(assert (=> bs!7338 m!139277))

(assert (=> start!19140 d!29818))

(declare-fun d!29820 () Bool)

(assert (=> d!29820 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4771 bitStream2!8) (currentByte!4776 bitStream2!8) (size!2046 (buf!2398 bitStream2!8))))))

(declare-fun bs!7339 () Bool)

(assert (= bs!7339 d!29820))

(declare-fun m!139279 () Bool)

(assert (=> bs!7339 m!139279))

(assert (=> start!19140 d!29820))

(declare-fun d!29822 () Bool)

(assert (=> d!29822 (= (inv!12 base!8) (invariant!0 (currentBit!4771 base!8) (currentByte!4776 base!8) (size!2046 (buf!2398 base!8))))))

(declare-fun bs!7340 () Bool)

(assert (= bs!7340 d!29822))

(declare-fun m!139281 () Bool)

(assert (=> bs!7340 m!139281))

(assert (=> start!19140 d!29822))

(declare-fun d!29824 () Bool)

(assert (=> d!29824 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4771 thiss!1534) (currentByte!4776 thiss!1534) (size!2046 (buf!2398 thiss!1534))))))

(declare-fun bs!7341 () Bool)

(assert (= bs!7341 d!29824))

(declare-fun m!139283 () Bool)

(assert (=> bs!7341 m!139283))

(assert (=> start!19140 d!29824))

(declare-fun d!29826 () Bool)

(declare-fun size!2049 (List!895) Int)

(assert (=> d!29826 (= (length!486 listBits!13) (size!2049 listBits!13))))

(declare-fun bs!7342 () Bool)

(assert (= bs!7342 d!29826))

(declare-fun m!139285 () Bool)

(assert (=> bs!7342 m!139285))

(assert (=> b!95879 d!29826))

(declare-fun d!29828 () Bool)

(assert (=> d!29828 (= (array_inv!1854 (buf!2398 base!8)) (bvsge (size!2046 (buf!2398 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!95878 d!29828))

(declare-fun d!29830 () Bool)

(declare-fun res!78914 () Bool)

(declare-fun e!62844 () Bool)

(assert (=> d!29830 (=> (not res!78914) (not e!62844))))

(assert (=> d!29830 (= res!78914 (= (size!2046 (buf!2398 bitStream2!8)) (size!2046 (buf!2398 base!8))))))

(assert (=> d!29830 (= (isPrefixOf!0 bitStream2!8 base!8) e!62844)))

(declare-fun b!95933 () Bool)

(declare-fun res!78915 () Bool)

(assert (=> b!95933 (=> (not res!78915) (not e!62844))))

(assert (=> b!95933 (= res!78915 (bvsle (bitIndex!0 (size!2046 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8) (currentBit!4771 bitStream2!8)) (bitIndex!0 (size!2046 (buf!2398 base!8)) (currentByte!4776 base!8) (currentBit!4771 base!8))))))

(declare-fun b!95934 () Bool)

(declare-fun e!62843 () Bool)

(assert (=> b!95934 (= e!62844 e!62843)))

(declare-fun res!78916 () Bool)

(assert (=> b!95934 (=> res!78916 e!62843)))

(assert (=> b!95934 (= res!78916 (= (size!2046 (buf!2398 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!95935 () Bool)

(assert (=> b!95935 (= e!62843 (arrayBitRangesEq!0 (buf!2398 bitStream2!8) (buf!2398 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8) (currentBit!4771 bitStream2!8))))))

(assert (= (and d!29830 res!78914) b!95933))

(assert (= (and b!95933 res!78915) b!95934))

(assert (= (and b!95934 (not res!78916)) b!95935))

(assert (=> b!95933 m!139205))

(assert (=> b!95933 m!139223))

(assert (=> b!95935 m!139205))

(assert (=> b!95935 m!139205))

(declare-fun m!139287 () Bool)

(assert (=> b!95935 m!139287))

(assert (=> b!95876 d!29830))

(declare-fun d!29832 () Bool)

(assert (=> d!29832 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream2!8))) ((_ sign_extend 32) (currentByte!4776 bitStream2!8)) ((_ sign_extend 32) (currentBit!4771 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream2!8))) ((_ sign_extend 32) (currentByte!4776 bitStream2!8)) ((_ sign_extend 32) (currentBit!4771 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7343 () Bool)

(assert (= bs!7343 d!29832))

(declare-fun m!139289 () Bool)

(assert (=> bs!7343 m!139289))

(assert (=> b!95877 d!29832))

(declare-fun d!29834 () Bool)

(declare-fun e!62861 () Bool)

(assert (=> d!29834 e!62861))

(declare-fun res!78939 () Bool)

(assert (=> d!29834 (=> (not res!78939) (not e!62861))))

(declare-fun lt!139271 () (_ BitVec 64))

(declare-fun lt!139273 () (_ BitVec 64))

(declare-fun lt!139274 () (_ BitVec 64))

(assert (=> d!29834 (= res!78939 (= lt!139271 (bvsub lt!139273 lt!139274)))))

(assert (=> d!29834 (or (= (bvand lt!139273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139274 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139273 lt!139274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29834 (= lt!139274 (remainingBits!0 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream1!8))) ((_ sign_extend 32) (currentByte!4776 bitStream1!8)) ((_ sign_extend 32) (currentBit!4771 bitStream1!8))))))

(declare-fun lt!139270 () (_ BitVec 64))

(declare-fun lt!139275 () (_ BitVec 64))

(assert (=> d!29834 (= lt!139273 (bvmul lt!139270 lt!139275))))

(assert (=> d!29834 (or (= lt!139270 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139275 (bvsdiv (bvmul lt!139270 lt!139275) lt!139270)))))

(assert (=> d!29834 (= lt!139275 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29834 (= lt!139270 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream1!8))))))

(assert (=> d!29834 (= lt!139271 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4776 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4771 bitStream1!8))))))

(assert (=> d!29834 (invariant!0 (currentBit!4771 bitStream1!8) (currentByte!4776 bitStream1!8) (size!2046 (buf!2398 bitStream1!8)))))

(assert (=> d!29834 (= (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8)) lt!139271)))

(declare-fun b!95966 () Bool)

(declare-fun res!78940 () Bool)

(assert (=> b!95966 (=> (not res!78940) (not e!62861))))

(assert (=> b!95966 (= res!78940 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139271))))

(declare-fun b!95967 () Bool)

(declare-fun lt!139272 () (_ BitVec 64))

(assert (=> b!95967 (= e!62861 (bvsle lt!139271 (bvmul lt!139272 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95967 (or (= lt!139272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139272 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139272)))))

(assert (=> b!95967 (= lt!139272 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream1!8))))))

(assert (= (and d!29834 res!78939) b!95966))

(assert (= (and b!95966 res!78940) b!95967))

(assert (=> d!29834 m!139275))

(assert (=> d!29834 m!139277))

(assert (=> b!95875 d!29834))

(declare-fun d!29848 () Bool)

(declare-fun e!62864 () Bool)

(assert (=> d!29848 e!62864))

(declare-fun res!78941 () Bool)

(assert (=> d!29848 (=> (not res!78941) (not e!62864))))

(declare-fun lt!139282 () (_ BitVec 64))

(declare-fun lt!139280 () (_ BitVec 64))

(declare-fun lt!139283 () (_ BitVec 64))

(assert (=> d!29848 (= res!78941 (= lt!139280 (bvsub lt!139282 lt!139283)))))

(assert (=> d!29848 (or (= (bvand lt!139282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139283 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139282 lt!139283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29848 (= lt!139283 (remainingBits!0 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream2!8))) ((_ sign_extend 32) (currentByte!4776 bitStream2!8)) ((_ sign_extend 32) (currentBit!4771 bitStream2!8))))))

(declare-fun lt!139279 () (_ BitVec 64))

(declare-fun lt!139284 () (_ BitVec 64))

(assert (=> d!29848 (= lt!139282 (bvmul lt!139279 lt!139284))))

(assert (=> d!29848 (or (= lt!139279 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139284 (bvsdiv (bvmul lt!139279 lt!139284) lt!139279)))))

(assert (=> d!29848 (= lt!139284 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29848 (= lt!139279 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream2!8))))))

(assert (=> d!29848 (= lt!139280 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4776 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4771 bitStream2!8))))))

(assert (=> d!29848 (invariant!0 (currentBit!4771 bitStream2!8) (currentByte!4776 bitStream2!8) (size!2046 (buf!2398 bitStream2!8)))))

(assert (=> d!29848 (= (bitIndex!0 (size!2046 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8) (currentBit!4771 bitStream2!8)) lt!139280)))

(declare-fun b!95972 () Bool)

(declare-fun res!78942 () Bool)

(assert (=> b!95972 (=> (not res!78942) (not e!62864))))

(assert (=> b!95972 (= res!78942 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139280))))

(declare-fun b!95973 () Bool)

(declare-fun lt!139281 () (_ BitVec 64))

(assert (=> b!95973 (= e!62864 (bvsle lt!139280 (bvmul lt!139281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95973 (or (= lt!139281 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139281 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139281)))))

(assert (=> b!95973 (= lt!139281 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream2!8))))))

(assert (= (and d!29848 res!78941) b!95972))

(assert (= (and b!95972 res!78942) b!95973))

(assert (=> d!29848 m!139289))

(assert (=> d!29848 m!139279))

(assert (=> b!95875 d!29848))

(declare-fun d!29852 () Bool)

(declare-fun res!78943 () Bool)

(declare-fun e!62866 () Bool)

(assert (=> d!29852 (=> (not res!78943) (not e!62866))))

(assert (=> d!29852 (= res!78943 (= (size!2046 (buf!2398 bitStream1!8)) (size!2046 (buf!2398 base!8))))))

(assert (=> d!29852 (= (isPrefixOf!0 bitStream1!8 base!8) e!62866)))

(declare-fun b!95974 () Bool)

(declare-fun res!78944 () Bool)

(assert (=> b!95974 (=> (not res!78944) (not e!62866))))

(assert (=> b!95974 (= res!78944 (bvsle (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8)) (bitIndex!0 (size!2046 (buf!2398 base!8)) (currentByte!4776 base!8) (currentBit!4771 base!8))))))

(declare-fun b!95975 () Bool)

(declare-fun e!62865 () Bool)

(assert (=> b!95975 (= e!62866 e!62865)))

(declare-fun res!78945 () Bool)

(assert (=> b!95975 (=> res!78945 e!62865)))

(assert (=> b!95975 (= res!78945 (= (size!2046 (buf!2398 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95976 () Bool)

(assert (=> b!95976 (= e!62865 (arrayBitRangesEq!0 (buf!2398 bitStream1!8) (buf!2398 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8))))))

(assert (= (and d!29852 res!78943) b!95974))

(assert (= (and b!95974 res!78944) b!95975))

(assert (= (and b!95975 (not res!78945)) b!95976))

(assert (=> b!95974 m!139203))

(assert (=> b!95974 m!139223))

(assert (=> b!95976 m!139203))

(assert (=> b!95976 m!139203))

(declare-fun m!139309 () Bool)

(assert (=> b!95976 m!139309))

(assert (=> b!95884 d!29852))

(declare-fun d!29856 () Bool)

(assert (=> d!29856 (= (array_inv!1854 (buf!2398 thiss!1534)) (bvsge (size!2046 (buf!2398 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!95885 d!29856))

(declare-fun d!29858 () Bool)

(declare-fun e!62879 () Bool)

(assert (=> d!29858 e!62879))

(declare-fun c!6012 () Bool)

(assert (=> d!29858 (= c!6012 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!139306 () List!895)

(declare-datatypes ((tuple2!7710 0))(
  ( (tuple2!7711 (_1!4102 List!895) (_2!4102 BitStream!3578)) )
))
(declare-fun e!62880 () tuple2!7710)

(assert (=> d!29858 (= lt!139306 (_1!4102 e!62880))))

(declare-fun c!6013 () Bool)

(assert (=> d!29858 (= c!6013 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29858 (bvsge (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29858 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!139306)))

(declare-fun b!96002 () Bool)

(assert (=> b!96002 (= e!62879 (> (length!486 lt!139306) 0))))

(declare-fun b!96000 () Bool)

(declare-datatypes ((tuple2!7712 0))(
  ( (tuple2!7713 (_1!4103 Bool) (_2!4103 BitStream!3578)) )
))
(declare-fun lt!139308 () tuple2!7712)

(declare-fun lt!139307 () (_ BitVec 64))

(assert (=> b!96000 (= e!62880 (tuple2!7711 (Cons!891 (_1!4103 lt!139308) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4103 lt!139308) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139307))) (_2!4103 lt!139308)))))

(declare-fun readBit!0 (BitStream!3578) tuple2!7712)

(assert (=> b!96000 (= lt!139308 (readBit!0 bitStream2!8))))

(assert (=> b!96000 (= lt!139307 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96001 () Bool)

(declare-fun isEmpty!264 (List!895) Bool)

(assert (=> b!96001 (= e!62879 (isEmpty!264 lt!139306))))

(declare-fun b!95999 () Bool)

(assert (=> b!95999 (= e!62880 (tuple2!7711 Nil!892 bitStream2!8))))

(assert (= (and d!29858 c!6013) b!95999))

(assert (= (and d!29858 (not c!6013)) b!96000))

(assert (= (and d!29858 c!6012) b!96001))

(assert (= (and d!29858 (not c!6012)) b!96002))

(declare-fun m!139325 () Bool)

(assert (=> b!96002 m!139325))

(declare-fun m!139327 () Bool)

(assert (=> b!96000 m!139327))

(declare-fun m!139329 () Bool)

(assert (=> b!96000 m!139329))

(declare-fun m!139331 () Bool)

(assert (=> b!96001 m!139331))

(assert (=> b!95874 d!29858))

(declare-fun d!29876 () Bool)

(assert (=> d!29876 (= (tail!374 listBits!13) (t!1645 listBits!13))))

(assert (=> b!95874 d!29876))

(declare-fun d!29878 () Bool)

(declare-fun e!62881 () Bool)

(assert (=> d!29878 e!62881))

(declare-fun c!6014 () Bool)

(assert (=> d!29878 (= c!6014 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!139309 () List!895)

(declare-fun e!62882 () tuple2!7710)

(assert (=> d!29878 (= lt!139309 (_1!4102 e!62882))))

(declare-fun c!6015 () Bool)

(assert (=> d!29878 (= c!6015 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29878 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29878 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!139309)))

(declare-fun b!96006 () Bool)

(assert (=> b!96006 (= e!62881 (> (length!486 lt!139309) 0))))

(declare-fun b!96004 () Bool)

(declare-fun lt!139311 () tuple2!7712)

(declare-fun lt!139310 () (_ BitVec 64))

(assert (=> b!96004 (= e!62882 (tuple2!7711 (Cons!891 (_1!4103 lt!139311) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4103 lt!139311) (bvsub nBits!484 lt!139310))) (_2!4103 lt!139311)))))

(assert (=> b!96004 (= lt!139311 (readBit!0 bitStream1!8))))

(assert (=> b!96004 (= lt!139310 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96005 () Bool)

(assert (=> b!96005 (= e!62881 (isEmpty!264 lt!139309))))

(declare-fun b!96003 () Bool)

(assert (=> b!96003 (= e!62882 (tuple2!7711 Nil!892 bitStream1!8))))

(assert (= (and d!29878 c!6015) b!96003))

(assert (= (and d!29878 (not c!6015)) b!96004))

(assert (= (and d!29878 c!6014) b!96005))

(assert (= (and d!29878 (not c!6014)) b!96006))

(declare-fun m!139333 () Bool)

(assert (=> b!96006 m!139333))

(declare-fun m!139335 () Bool)

(assert (=> b!96004 m!139335))

(declare-fun m!139337 () Bool)

(assert (=> b!96004 m!139337))

(declare-fun m!139339 () Bool)

(assert (=> b!96005 m!139339))

(assert (=> b!95883 d!29878))

(declare-fun d!29880 () Bool)

(declare-fun e!62883 () Bool)

(assert (=> d!29880 e!62883))

(declare-fun res!78956 () Bool)

(assert (=> d!29880 (=> (not res!78956) (not e!62883))))

(declare-fun lt!139313 () (_ BitVec 64))

(declare-fun lt!139316 () (_ BitVec 64))

(declare-fun lt!139315 () (_ BitVec 64))

(assert (=> d!29880 (= res!78956 (= lt!139313 (bvsub lt!139315 lt!139316)))))

(assert (=> d!29880 (or (= (bvand lt!139315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139315 lt!139316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29880 (= lt!139316 (remainingBits!0 ((_ sign_extend 32) (size!2046 (buf!2398 base!8))) ((_ sign_extend 32) (currentByte!4776 base!8)) ((_ sign_extend 32) (currentBit!4771 base!8))))))

(declare-fun lt!139312 () (_ BitVec 64))

(declare-fun lt!139317 () (_ BitVec 64))

(assert (=> d!29880 (= lt!139315 (bvmul lt!139312 lt!139317))))

(assert (=> d!29880 (or (= lt!139312 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139317 (bvsdiv (bvmul lt!139312 lt!139317) lt!139312)))))

(assert (=> d!29880 (= lt!139317 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29880 (= lt!139312 ((_ sign_extend 32) (size!2046 (buf!2398 base!8))))))

(assert (=> d!29880 (= lt!139313 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4776 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4771 base!8))))))

(assert (=> d!29880 (invariant!0 (currentBit!4771 base!8) (currentByte!4776 base!8) (size!2046 (buf!2398 base!8)))))

(assert (=> d!29880 (= (bitIndex!0 (size!2046 (buf!2398 base!8)) (currentByte!4776 base!8) (currentBit!4771 base!8)) lt!139313)))

(declare-fun b!96007 () Bool)

(declare-fun res!78957 () Bool)

(assert (=> b!96007 (=> (not res!78957) (not e!62883))))

(assert (=> b!96007 (= res!78957 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139313))))

(declare-fun b!96008 () Bool)

(declare-fun lt!139314 () (_ BitVec 64))

(assert (=> b!96008 (= e!62883 (bvsle lt!139313 (bvmul lt!139314 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96008 (or (= lt!139314 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139314 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139314)))))

(assert (=> b!96008 (= lt!139314 ((_ sign_extend 32) (size!2046 (buf!2398 base!8))))))

(assert (= (and d!29880 res!78956) b!96007))

(assert (= (and b!96007 res!78957) b!96008))

(declare-fun m!139341 () Bool)

(assert (=> d!29880 m!139341))

(assert (=> d!29880 m!139281))

(assert (=> b!95872 d!29880))

(push 1)

(assert (not d!29832))

(assert (not d!29848))

(assert (not b!96001))

(assert (not d!29834))

(assert (not d!29822))

(assert (not d!29880))

(assert (not b!96006))

(assert (not b!95933))

(assert (not b!96004))

(assert (not b!95974))

(assert (not b!96002))

(assert (not d!29820))

(assert (not b!96000))

(assert (not b!95976))

(assert (not b!95935))

(assert (not d!29826))

(assert (not b!95928))

(assert (not b!95926))

(assert (not d!29812))

(assert (not d!29824))

(assert (not d!29818))

(assert (not b!96005))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29882 () Bool)

(assert (=> d!29882 (= (length!486 lt!139306) (size!2049 lt!139306))))

(declare-fun bs!7346 () Bool)

(assert (= bs!7346 d!29882))

(declare-fun m!139343 () Bool)

(assert (=> bs!7346 m!139343))

(assert (=> b!96002 d!29882))

(assert (=> b!95974 d!29834))

(assert (=> b!95974 d!29880))

(declare-fun b!96023 () Bool)

(declare-fun e!62896 () Bool)

(declare-fun e!62898 () Bool)

(assert (=> b!96023 (= e!62896 e!62898)))

(declare-fun res!78969 () Bool)

(declare-fun call!1162 () Bool)

(assert (=> b!96023 (= res!78969 call!1162)))

(assert (=> b!96023 (=> (not res!78969) (not e!62898))))

(declare-fun b!96024 () Bool)

(declare-datatypes ((tuple4!52 0))(
  ( (tuple4!53 (_1!4104 (_ BitVec 32)) (_2!4104 (_ BitVec 32)) (_3!247 (_ BitVec 32)) (_4!26 (_ BitVec 32))) )
))
(declare-fun lt!139326 () tuple4!52)

(declare-fun e!62901 () Bool)

(declare-fun arrayRangesEq!27 (array!4480 array!4480 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96024 (= e!62901 (arrayRangesEq!27 (buf!2398 bitStream1!8) (buf!2398 bitStream2!8) (_1!4104 lt!139326) (_2!4104 lt!139326)))))

(declare-fun b!96025 () Bool)

(declare-fun e!62897 () Bool)

(assert (=> b!96025 (= e!62897 e!62896)))

(declare-fun c!6018 () Bool)

(assert (=> b!96025 (= c!6018 (= (_3!247 lt!139326) (_4!26 lt!139326)))))

(declare-fun b!96026 () Bool)

(declare-fun e!62900 () Bool)

(assert (=> b!96026 (= e!62900 e!62897)))

(declare-fun res!78970 () Bool)

(assert (=> b!96026 (=> (not res!78970) (not e!62897))))

(assert (=> b!96026 (= res!78970 e!62901)))

(declare-fun res!78972 () Bool)

(assert (=> b!96026 (=> res!78972 e!62901)))

(assert (=> b!96026 (= res!78972 (bvsge (_1!4104 lt!139326) (_2!4104 lt!139326)))))

(declare-fun lt!139324 () (_ BitVec 32))

(assert (=> b!96026 (= lt!139324 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!139325 () (_ BitVec 32))

(assert (=> b!96026 (= lt!139325 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!52)

(assert (=> b!96026 (= lt!139326 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8))))))

(declare-fun b!96027 () Bool)

(declare-fun res!78971 () Bool)

(assert (=> b!96027 (= res!78971 (= lt!139324 #b00000000000000000000000000000000))))

(declare-fun e!62899 () Bool)

(assert (=> b!96027 (=> res!78971 e!62899)))

(assert (=> b!96027 (= e!62898 e!62899)))

(declare-fun bm!1159 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1159 (= call!1162 (byteRangesEq!0 (select (arr!2645 (buf!2398 bitStream1!8)) (_3!247 lt!139326)) (select (arr!2645 (buf!2398 bitStream2!8)) (_3!247 lt!139326)) lt!139325 (ite c!6018 lt!139324 #b00000000000000000000000000001000)))))

(declare-fun d!29884 () Bool)

(declare-fun res!78968 () Bool)

(assert (=> d!29884 (=> res!78968 e!62900)))

(assert (=> d!29884 (= res!78968 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8))))))

(assert (=> d!29884 (= (arrayBitRangesEq!0 (buf!2398 bitStream1!8) (buf!2398 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8))) e!62900)))

(declare-fun b!96028 () Bool)

(assert (=> b!96028 (= e!62896 call!1162)))

(declare-fun b!96029 () Bool)

(assert (=> b!96029 (= e!62899 (byteRangesEq!0 (select (arr!2645 (buf!2398 bitStream1!8)) (_4!26 lt!139326)) (select (arr!2645 (buf!2398 bitStream2!8)) (_4!26 lt!139326)) #b00000000000000000000000000000000 lt!139324))))

(assert (= (and d!29884 (not res!78968)) b!96026))

(assert (= (and b!96026 (not res!78972)) b!96024))

(assert (= (and b!96026 res!78970) b!96025))

(assert (= (and b!96025 c!6018) b!96028))

(assert (= (and b!96025 (not c!6018)) b!96023))

(assert (= (and b!96023 res!78969) b!96027))

(assert (= (and b!96027 (not res!78971)) b!96029))

(assert (= (or b!96028 b!96023) bm!1159))

(declare-fun m!139345 () Bool)

(assert (=> b!96024 m!139345))

(assert (=> b!96026 m!139203))

(declare-fun m!139347 () Bool)

(assert (=> b!96026 m!139347))

(declare-fun m!139349 () Bool)

(assert (=> bm!1159 m!139349))

(declare-fun m!139351 () Bool)

(assert (=> bm!1159 m!139351))

(assert (=> bm!1159 m!139349))

(assert (=> bm!1159 m!139351))

(declare-fun m!139353 () Bool)

(assert (=> bm!1159 m!139353))

(declare-fun m!139355 () Bool)

(assert (=> b!96029 m!139355))

(declare-fun m!139357 () Bool)

(assert (=> b!96029 m!139357))

(assert (=> b!96029 m!139355))

(assert (=> b!96029 m!139357))

(declare-fun m!139359 () Bool)

(assert (=> b!96029 m!139359))

(assert (=> b!95928 d!29884))

(assert (=> b!95928 d!29834))

(declare-fun d!29886 () Bool)

(assert (=> d!29886 (= (isEmpty!264 lt!139306) (is-Nil!892 lt!139306))))

(assert (=> b!96001 d!29886))

(declare-fun d!29888 () Bool)

(assert (=> d!29888 (= (invariant!0 (currentBit!4771 bitStream1!8) (currentByte!4776 bitStream1!8) (size!2046 (buf!2398 bitStream1!8))) (and (bvsge (currentBit!4771 bitStream1!8) #b00000000000000000000000000000000) (bvslt (currentBit!4771 bitStream1!8) #b00000000000000000000000000001000) (bvsge (currentByte!4776 bitStream1!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4776 bitStream1!8) (size!2046 (buf!2398 bitStream1!8))) (and (= (currentBit!4771 bitStream1!8) #b00000000000000000000000000000000) (= (currentByte!4776 bitStream1!8) (size!2046 (buf!2398 bitStream1!8)))))))))

(assert (=> d!29818 d!29888))

(declare-fun d!29890 () Bool)

(declare-fun lt!139329 () Int)

(assert (=> d!29890 (>= lt!139329 0)))

(declare-fun e!62904 () Int)

(assert (=> d!29890 (= lt!139329 e!62904)))

(declare-fun c!6021 () Bool)

(assert (=> d!29890 (= c!6021 (is-Nil!892 listBits!13))))

(assert (=> d!29890 (= (size!2049 listBits!13) lt!139329)))

(declare-fun b!96034 () Bool)

(assert (=> b!96034 (= e!62904 0)))

(declare-fun b!96035 () Bool)

(assert (=> b!96035 (= e!62904 (+ 1 (size!2049 (t!1645 listBits!13))))))

(assert (= (and d!29890 c!6021) b!96034))

(assert (= (and d!29890 (not c!6021)) b!96035))

(declare-fun m!139361 () Bool)

(assert (=> b!96035 m!139361))

(assert (=> d!29826 d!29890))

(declare-fun d!29892 () Bool)

(declare-fun e!62905 () Bool)

(assert (=> d!29892 e!62905))

(declare-fun c!6022 () Bool)

(assert (=> d!29892 (= c!6022 (= (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139307) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!139330 () List!895)

(declare-fun e!62906 () tuple2!7710)

(assert (=> d!29892 (= lt!139330 (_1!4102 e!62906))))

(declare-fun c!6023 () Bool)

(assert (=> d!29892 (= c!6023 (= (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139307) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29892 (bvsge (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139307) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29892 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4103 lt!139308) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139307)) lt!139330)))

(declare-fun b!96039 () Bool)

(assert (=> b!96039 (= e!62905 (> (length!486 lt!139330) 0))))

(declare-fun lt!139331 () (_ BitVec 64))

(declare-fun b!96037 () Bool)

(declare-fun lt!139332 () tuple2!7712)

(assert (=> b!96037 (= e!62906 (tuple2!7711 (Cons!891 (_1!4103 lt!139332) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4103 lt!139332) (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139307) lt!139331))) (_2!4103 lt!139332)))))

(assert (=> b!96037 (= lt!139332 (readBit!0 (_2!4103 lt!139308)))))

(assert (=> b!96037 (= lt!139331 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96038 () Bool)

(assert (=> b!96038 (= e!62905 (isEmpty!264 lt!139330))))

(declare-fun b!96036 () Bool)

(assert (=> b!96036 (= e!62906 (tuple2!7711 Nil!892 (_2!4103 lt!139308)))))

(assert (= (and d!29892 c!6023) b!96036))

(assert (= (and d!29892 (not c!6023)) b!96037))

(assert (= (and d!29892 c!6022) b!96038))

(assert (= (and d!29892 (not c!6022)) b!96039))

(declare-fun m!139363 () Bool)

(assert (=> b!96039 m!139363))

(declare-fun m!139365 () Bool)

(assert (=> b!96037 m!139365))

(declare-fun m!139367 () Bool)

(assert (=> b!96037 m!139367))

(declare-fun m!139369 () Bool)

(assert (=> b!96038 m!139369))

(assert (=> b!96000 d!29892))

(declare-fun d!29894 () Bool)

(declare-fun e!62913 () Bool)

(assert (=> d!29894 e!62913))

(declare-fun res!78975 () Bool)

(assert (=> d!29894 (=> (not res!78975) (not e!62913))))

(declare-datatypes ((Unit!5848 0))(
  ( (Unit!5849) )
))
(declare-datatypes ((tuple2!7714 0))(
  ( (tuple2!7715 (_1!4105 Unit!5848) (_2!4105 BitStream!3578)) )
))
(declare-fun increaseBitIndex!0 (BitStream!3578) tuple2!7714)

(assert (=> d!29894 (= res!78975 (= (buf!2398 (_2!4105 (increaseBitIndex!0 bitStream2!8))) (buf!2398 bitStream2!8)))))

(declare-fun lt!139347 () Bool)

(assert (=> d!29894 (= lt!139347 (not (= (bvand ((_ sign_extend 24) (select (arr!2645 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4771 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139350 () tuple2!7712)

(assert (=> d!29894 (= lt!139350 (tuple2!7713 (not (= (bvand ((_ sign_extend 24) (select (arr!2645 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4771 bitStream2!8)))) #b00000000000000000000000000000000)) (_2!4105 (increaseBitIndex!0 bitStream2!8))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!29894 (validate_offset_bit!0 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream2!8))) ((_ sign_extend 32) (currentByte!4776 bitStream2!8)) ((_ sign_extend 32) (currentBit!4771 bitStream2!8)))))

(assert (=> d!29894 (= (readBit!0 bitStream2!8) lt!139350)))

(declare-fun lt!139349 () (_ BitVec 64))

(declare-fun b!96042 () Bool)

(declare-fun lt!139348 () (_ BitVec 64))

(assert (=> b!96042 (= e!62913 (= (bitIndex!0 (size!2046 (buf!2398 (_2!4105 (increaseBitIndex!0 bitStream2!8)))) (currentByte!4776 (_2!4105 (increaseBitIndex!0 bitStream2!8))) (currentBit!4771 (_2!4105 (increaseBitIndex!0 bitStream2!8)))) (bvadd lt!139349 lt!139348)))))

(assert (=> b!96042 (or (not (= (bvand lt!139349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139348 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139349 lt!139348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96042 (= lt!139348 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96042 (= lt!139349 (bitIndex!0 (size!2046 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8) (currentBit!4771 bitStream2!8)))))

(declare-fun lt!139352 () Bool)

(assert (=> b!96042 (= lt!139352 (not (= (bvand ((_ sign_extend 24) (select (arr!2645 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4771 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139351 () Bool)

(assert (=> b!96042 (= lt!139351 (not (= (bvand ((_ sign_extend 24) (select (arr!2645 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4771 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139353 () Bool)

(assert (=> b!96042 (= lt!139353 (not (= (bvand ((_ sign_extend 24) (select (arr!2645 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4771 bitStream2!8)))) #b00000000000000000000000000000000)))))

(assert (= (and d!29894 res!78975) b!96042))

(declare-fun m!139371 () Bool)

(assert (=> d!29894 m!139371))

(declare-fun m!139373 () Bool)

(assert (=> d!29894 m!139373))

(declare-fun m!139375 () Bool)

(assert (=> d!29894 m!139375))

(declare-fun m!139377 () Bool)

(assert (=> d!29894 m!139377))

(declare-fun m!139379 () Bool)

(assert (=> b!96042 m!139379))

(assert (=> b!96042 m!139373))

(assert (=> b!96042 m!139371))

(assert (=> b!96042 m!139205))

(assert (=> b!96042 m!139375))

(assert (=> b!96000 d!29894))

(declare-fun d!29896 () Bool)

(assert (=> d!29896 (= (remainingBits!0 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream1!8))) ((_ sign_extend 32) (currentByte!4776 bitStream1!8)) ((_ sign_extend 32) (currentBit!4771 bitStream1!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2046 (buf!2398 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4776 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4771 bitStream1!8)))))))

(assert (=> d!29834 d!29896))

(assert (=> d!29834 d!29888))

(declare-fun d!29898 () Bool)

(assert (=> d!29898 (= (invariant!0 (currentBit!4771 bitStream2!8) (currentByte!4776 bitStream2!8) (size!2046 (buf!2398 bitStream2!8))) (and (bvsge (currentBit!4771 bitStream2!8) #b00000000000000000000000000000000) (bvslt (currentBit!4771 bitStream2!8) #b00000000000000000000000000001000) (bvsge (currentByte!4776 bitStream2!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4776 bitStream2!8) (size!2046 (buf!2398 bitStream2!8))) (and (= (currentBit!4771 bitStream2!8) #b00000000000000000000000000000000) (= (currentByte!4776 bitStream2!8) (size!2046 (buf!2398 bitStream2!8)))))))))

(assert (=> d!29820 d!29898))

(assert (=> b!95926 d!29834))

(assert (=> b!95926 d!29848))

(declare-fun d!29900 () Bool)

(assert (=> d!29900 (= (isEmpty!264 lt!139309) (is-Nil!892 lt!139309))))

(assert (=> b!96005 d!29900))

(declare-fun d!29902 () Bool)

(assert (=> d!29902 (= (remainingBits!0 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream2!8))) ((_ sign_extend 32) (currentByte!4776 bitStream2!8)) ((_ sign_extend 32) (currentBit!4771 bitStream2!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2046 (buf!2398 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4776 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4771 bitStream2!8)))))))

(assert (=> d!29848 d!29902))

(assert (=> d!29848 d!29898))

(declare-fun d!29904 () Bool)

(assert (=> d!29904 (= (remainingBits!0 ((_ sign_extend 32) (size!2046 (buf!2398 base!8))) ((_ sign_extend 32) (currentByte!4776 base!8)) ((_ sign_extend 32) (currentBit!4771 base!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2046 (buf!2398 base!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4776 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4771 base!8)))))))

(assert (=> d!29880 d!29904))

(declare-fun d!29906 () Bool)

(assert (=> d!29906 (= (invariant!0 (currentBit!4771 base!8) (currentByte!4776 base!8) (size!2046 (buf!2398 base!8))) (and (bvsge (currentBit!4771 base!8) #b00000000000000000000000000000000) (bvslt (currentBit!4771 base!8) #b00000000000000000000000000001000) (bvsge (currentByte!4776 base!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4776 base!8) (size!2046 (buf!2398 base!8))) (and (= (currentBit!4771 base!8) #b00000000000000000000000000000000) (= (currentByte!4776 base!8) (size!2046 (buf!2398 base!8)))))))))

(assert (=> d!29880 d!29906))

(declare-fun d!29908 () Bool)

(assert (=> d!29908 (= (length!486 lt!139309) (size!2049 lt!139309))))

(declare-fun bs!7347 () Bool)

(assert (= bs!7347 d!29908))

(declare-fun m!139381 () Bool)

(assert (=> bs!7347 m!139381))

(assert (=> b!96006 d!29908))

(declare-fun d!29910 () Bool)

(declare-fun e!62914 () Bool)

(assert (=> d!29910 e!62914))

(declare-fun c!6024 () Bool)

(assert (=> d!29910 (= c!6024 (= (bvsub nBits!484 lt!139310) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!139354 () List!895)

(declare-fun e!62915 () tuple2!7710)

(assert (=> d!29910 (= lt!139354 (_1!4102 e!62915))))

(declare-fun c!6025 () Bool)

(assert (=> d!29910 (= c!6025 (= (bvsub nBits!484 lt!139310) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29910 (bvsge (bvsub nBits!484 lt!139310) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29910 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4103 lt!139311) (bvsub nBits!484 lt!139310)) lt!139354)))

(declare-fun b!96046 () Bool)

(assert (=> b!96046 (= e!62914 (> (length!486 lt!139354) 0))))

(declare-fun b!96044 () Bool)

(declare-fun lt!139355 () (_ BitVec 64))

(declare-fun lt!139356 () tuple2!7712)

(assert (=> b!96044 (= e!62915 (tuple2!7711 (Cons!891 (_1!4103 lt!139356) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4103 lt!139356) (bvsub (bvsub nBits!484 lt!139310) lt!139355))) (_2!4103 lt!139356)))))

(assert (=> b!96044 (= lt!139356 (readBit!0 (_2!4103 lt!139311)))))

(assert (=> b!96044 (= lt!139355 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96045 () Bool)

(assert (=> b!96045 (= e!62914 (isEmpty!264 lt!139354))))

(declare-fun b!96043 () Bool)

(assert (=> b!96043 (= e!62915 (tuple2!7711 Nil!892 (_2!4103 lt!139311)))))

(assert (= (and d!29910 c!6025) b!96043))

(assert (= (and d!29910 (not c!6025)) b!96044))

(assert (= (and d!29910 c!6024) b!96045))

(assert (= (and d!29910 (not c!6024)) b!96046))

(declare-fun m!139383 () Bool)

(assert (=> b!96046 m!139383))

(declare-fun m!139385 () Bool)

(assert (=> b!96044 m!139385))

(declare-fun m!139387 () Bool)

(assert (=> b!96044 m!139387))

(declare-fun m!139389 () Bool)

(assert (=> b!96045 m!139389))

(assert (=> b!96004 d!29910))

(declare-fun d!29912 () Bool)

(declare-fun e!62916 () Bool)

(assert (=> d!29912 e!62916))

(declare-fun res!78976 () Bool)

(assert (=> d!29912 (=> (not res!78976) (not e!62916))))

(assert (=> d!29912 (= res!78976 (= (buf!2398 (_2!4105 (increaseBitIndex!0 bitStream1!8))) (buf!2398 bitStream1!8)))))

(declare-fun lt!139357 () Bool)

(assert (=> d!29912 (= lt!139357 (not (= (bvand ((_ sign_extend 24) (select (arr!2645 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4771 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139360 () tuple2!7712)

(assert (=> d!29912 (= lt!139360 (tuple2!7713 (not (= (bvand ((_ sign_extend 24) (select (arr!2645 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4771 bitStream1!8)))) #b00000000000000000000000000000000)) (_2!4105 (increaseBitIndex!0 bitStream1!8))))))

(assert (=> d!29912 (validate_offset_bit!0 ((_ sign_extend 32) (size!2046 (buf!2398 bitStream1!8))) ((_ sign_extend 32) (currentByte!4776 bitStream1!8)) ((_ sign_extend 32) (currentBit!4771 bitStream1!8)))))

(assert (=> d!29912 (= (readBit!0 bitStream1!8) lt!139360)))

(declare-fun lt!139358 () (_ BitVec 64))

(declare-fun lt!139359 () (_ BitVec 64))

(declare-fun b!96047 () Bool)

(assert (=> b!96047 (= e!62916 (= (bitIndex!0 (size!2046 (buf!2398 (_2!4105 (increaseBitIndex!0 bitStream1!8)))) (currentByte!4776 (_2!4105 (increaseBitIndex!0 bitStream1!8))) (currentBit!4771 (_2!4105 (increaseBitIndex!0 bitStream1!8)))) (bvadd lt!139359 lt!139358)))))

(assert (=> b!96047 (or (not (= (bvand lt!139359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139358 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139359 lt!139358) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96047 (= lt!139358 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96047 (= lt!139359 (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8)))))

(declare-fun lt!139362 () Bool)

(assert (=> b!96047 (= lt!139362 (not (= (bvand ((_ sign_extend 24) (select (arr!2645 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4771 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139361 () Bool)

(assert (=> b!96047 (= lt!139361 (not (= (bvand ((_ sign_extend 24) (select (arr!2645 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4771 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139363 () Bool)

(assert (=> b!96047 (= lt!139363 (not (= (bvand ((_ sign_extend 24) (select (arr!2645 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4771 bitStream1!8)))) #b00000000000000000000000000000000)))))

(assert (= (and d!29912 res!78976) b!96047))

(declare-fun m!139391 () Bool)

(assert (=> d!29912 m!139391))

(declare-fun m!139393 () Bool)

(assert (=> d!29912 m!139393))

(declare-fun m!139395 () Bool)

(assert (=> d!29912 m!139395))

(declare-fun m!139397 () Bool)

(assert (=> d!29912 m!139397))

(declare-fun m!139399 () Bool)

(assert (=> b!96047 m!139399))

(assert (=> b!96047 m!139393))

(assert (=> b!96047 m!139391))

(assert (=> b!96047 m!139203))

(assert (=> b!96047 m!139395))

(assert (=> b!96004 d!29912))

(declare-fun b!96048 () Bool)

(declare-fun e!62917 () Bool)

(declare-fun e!62919 () Bool)

(assert (=> b!96048 (= e!62917 e!62919)))

(declare-fun res!78978 () Bool)

(declare-fun call!1163 () Bool)

(assert (=> b!96048 (= res!78978 call!1163)))

(assert (=> b!96048 (=> (not res!78978) (not e!62919))))

(declare-fun lt!139366 () tuple4!52)

(declare-fun b!96049 () Bool)

(declare-fun e!62922 () Bool)

(assert (=> b!96049 (= e!62922 (arrayRangesEq!27 (buf!2398 bitStream1!8) (buf!2398 base!8) (_1!4104 lt!139366) (_2!4104 lt!139366)))))

(declare-fun b!96050 () Bool)

(declare-fun e!62918 () Bool)

(assert (=> b!96050 (= e!62918 e!62917)))

(declare-fun c!6026 () Bool)

(assert (=> b!96050 (= c!6026 (= (_3!247 lt!139366) (_4!26 lt!139366)))))

(declare-fun b!96051 () Bool)

(declare-fun e!62921 () Bool)

(assert (=> b!96051 (= e!62921 e!62918)))

(declare-fun res!78979 () Bool)

(assert (=> b!96051 (=> (not res!78979) (not e!62918))))

(assert (=> b!96051 (= res!78979 e!62922)))

(declare-fun res!78981 () Bool)

(assert (=> b!96051 (=> res!78981 e!62922)))

(assert (=> b!96051 (= res!78981 (bvsge (_1!4104 lt!139366) (_2!4104 lt!139366)))))

(declare-fun lt!139364 () (_ BitVec 32))

(assert (=> b!96051 (= lt!139364 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!139365 () (_ BitVec 32))

(assert (=> b!96051 (= lt!139365 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96051 (= lt!139366 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8))))))

(declare-fun b!96052 () Bool)

(declare-fun res!78980 () Bool)

(assert (=> b!96052 (= res!78980 (= lt!139364 #b00000000000000000000000000000000))))

(declare-fun e!62920 () Bool)

(assert (=> b!96052 (=> res!78980 e!62920)))

(assert (=> b!96052 (= e!62919 e!62920)))

(declare-fun bm!1160 () Bool)

(assert (=> bm!1160 (= call!1163 (byteRangesEq!0 (select (arr!2645 (buf!2398 bitStream1!8)) (_3!247 lt!139366)) (select (arr!2645 (buf!2398 base!8)) (_3!247 lt!139366)) lt!139365 (ite c!6026 lt!139364 #b00000000000000000000000000001000)))))

(declare-fun d!29914 () Bool)

(declare-fun res!78977 () Bool)

(assert (=> d!29914 (=> res!78977 e!62921)))

(assert (=> d!29914 (= res!78977 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8))))))

(assert (=> d!29914 (= (arrayBitRangesEq!0 (buf!2398 bitStream1!8) (buf!2398 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream1!8)) (currentByte!4776 bitStream1!8) (currentBit!4771 bitStream1!8))) e!62921)))

(declare-fun b!96053 () Bool)

(assert (=> b!96053 (= e!62917 call!1163)))

(declare-fun b!96054 () Bool)

(assert (=> b!96054 (= e!62920 (byteRangesEq!0 (select (arr!2645 (buf!2398 bitStream1!8)) (_4!26 lt!139366)) (select (arr!2645 (buf!2398 base!8)) (_4!26 lt!139366)) #b00000000000000000000000000000000 lt!139364))))

(assert (= (and d!29914 (not res!78977)) b!96051))

(assert (= (and b!96051 (not res!78981)) b!96049))

(assert (= (and b!96051 res!78979) b!96050))

(assert (= (and b!96050 c!6026) b!96053))

(assert (= (and b!96050 (not c!6026)) b!96048))

(assert (= (and b!96048 res!78978) b!96052))

(assert (= (and b!96052 (not res!78980)) b!96054))

(assert (= (or b!96053 b!96048) bm!1160))

(declare-fun m!139401 () Bool)

(assert (=> b!96049 m!139401))

(assert (=> b!96051 m!139203))

(assert (=> b!96051 m!139347))

(declare-fun m!139403 () Bool)

(assert (=> bm!1160 m!139403))

(declare-fun m!139405 () Bool)

(assert (=> bm!1160 m!139405))

(assert (=> bm!1160 m!139403))

(assert (=> bm!1160 m!139405))

(declare-fun m!139407 () Bool)

(assert (=> bm!1160 m!139407))

(declare-fun m!139409 () Bool)

(assert (=> b!96054 m!139409))

(declare-fun m!139411 () Bool)

(assert (=> b!96054 m!139411))

(assert (=> b!96054 m!139409))

(assert (=> b!96054 m!139411))

(declare-fun m!139413 () Bool)

(assert (=> b!96054 m!139413))

(assert (=> b!95976 d!29914))

(assert (=> b!95976 d!29834))

(assert (=> d!29812 d!29896))

(declare-fun d!29916 () Bool)

(assert (=> d!29916 (= (invariant!0 (currentBit!4771 thiss!1534) (currentByte!4776 thiss!1534) (size!2046 (buf!2398 thiss!1534))) (and (bvsge (currentBit!4771 thiss!1534) #b00000000000000000000000000000000) (bvslt (currentBit!4771 thiss!1534) #b00000000000000000000000000001000) (bvsge (currentByte!4776 thiss!1534) #b00000000000000000000000000000000) (or (bvslt (currentByte!4776 thiss!1534) (size!2046 (buf!2398 thiss!1534))) (and (= (currentBit!4771 thiss!1534) #b00000000000000000000000000000000) (= (currentByte!4776 thiss!1534) (size!2046 (buf!2398 thiss!1534)))))))))

(assert (=> d!29824 d!29916))

(declare-fun b!96055 () Bool)

(declare-fun e!62923 () Bool)

(declare-fun e!62925 () Bool)

(assert (=> b!96055 (= e!62923 e!62925)))

(declare-fun res!78983 () Bool)

(declare-fun call!1164 () Bool)

(assert (=> b!96055 (= res!78983 call!1164)))

(assert (=> b!96055 (=> (not res!78983) (not e!62925))))

(declare-fun e!62928 () Bool)

(declare-fun b!96056 () Bool)

(declare-fun lt!139369 () tuple4!52)

(assert (=> b!96056 (= e!62928 (arrayRangesEq!27 (buf!2398 bitStream2!8) (buf!2398 base!8) (_1!4104 lt!139369) (_2!4104 lt!139369)))))

(declare-fun b!96057 () Bool)

(declare-fun e!62924 () Bool)

(assert (=> b!96057 (= e!62924 e!62923)))

(declare-fun c!6027 () Bool)

(assert (=> b!96057 (= c!6027 (= (_3!247 lt!139369) (_4!26 lt!139369)))))

(declare-fun b!96058 () Bool)

(declare-fun e!62927 () Bool)

(assert (=> b!96058 (= e!62927 e!62924)))

(declare-fun res!78984 () Bool)

(assert (=> b!96058 (=> (not res!78984) (not e!62924))))

(assert (=> b!96058 (= res!78984 e!62928)))

(declare-fun res!78986 () Bool)

(assert (=> b!96058 (=> res!78986 e!62928)))

(assert (=> b!96058 (= res!78986 (bvsge (_1!4104 lt!139369) (_2!4104 lt!139369)))))

(declare-fun lt!139367 () (_ BitVec 32))

(assert (=> b!96058 (= lt!139367 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2046 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8) (currentBit!4771 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!139368 () (_ BitVec 32))

(assert (=> b!96058 (= lt!139368 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96058 (= lt!139369 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8) (currentBit!4771 bitStream2!8))))))

(declare-fun b!96059 () Bool)

(declare-fun res!78985 () Bool)

(assert (=> b!96059 (= res!78985 (= lt!139367 #b00000000000000000000000000000000))))

(declare-fun e!62926 () Bool)

(assert (=> b!96059 (=> res!78985 e!62926)))

(assert (=> b!96059 (= e!62925 e!62926)))

(declare-fun bm!1161 () Bool)

(assert (=> bm!1161 (= call!1164 (byteRangesEq!0 (select (arr!2645 (buf!2398 bitStream2!8)) (_3!247 lt!139369)) (select (arr!2645 (buf!2398 base!8)) (_3!247 lt!139369)) lt!139368 (ite c!6027 lt!139367 #b00000000000000000000000000001000)))))

(declare-fun d!29918 () Bool)

(declare-fun res!78982 () Bool)

(assert (=> d!29918 (=> res!78982 e!62927)))

(assert (=> d!29918 (= res!78982 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8) (currentBit!4771 bitStream2!8))))))

(assert (=> d!29918 (= (arrayBitRangesEq!0 (buf!2398 bitStream2!8) (buf!2398 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2046 (buf!2398 bitStream2!8)) (currentByte!4776 bitStream2!8) (currentBit!4771 bitStream2!8))) e!62927)))

(declare-fun b!96060 () Bool)

(assert (=> b!96060 (= e!62923 call!1164)))

(declare-fun b!96061 () Bool)

(assert (=> b!96061 (= e!62926 (byteRangesEq!0 (select (arr!2645 (buf!2398 bitStream2!8)) (_4!26 lt!139369)) (select (arr!2645 (buf!2398 base!8)) (_4!26 lt!139369)) #b00000000000000000000000000000000 lt!139367))))

(assert (= (and d!29918 (not res!78982)) b!96058))

(assert (= (and b!96058 (not res!78986)) b!96056))

(assert (= (and b!96058 res!78984) b!96057))

(assert (= (and b!96057 c!6027) b!96060))

(assert (= (and b!96057 (not c!6027)) b!96055))

(assert (= (and b!96055 res!78983) b!96059))

(assert (= (and b!96059 (not res!78985)) b!96061))

(assert (= (or b!96060 b!96055) bm!1161))

(declare-fun m!139415 () Bool)

(assert (=> b!96056 m!139415))

(assert (=> b!96058 m!139205))

(declare-fun m!139417 () Bool)

(assert (=> b!96058 m!139417))

(declare-fun m!139419 () Bool)

(assert (=> bm!1161 m!139419))

(declare-fun m!139421 () Bool)

(assert (=> bm!1161 m!139421))

(assert (=> bm!1161 m!139419))

(assert (=> bm!1161 m!139421))

(declare-fun m!139423 () Bool)

(assert (=> bm!1161 m!139423))

(declare-fun m!139425 () Bool)

(assert (=> b!96061 m!139425))

(declare-fun m!139427 () Bool)

(assert (=> b!96061 m!139427))

(assert (=> b!96061 m!139425))

(assert (=> b!96061 m!139427))

(declare-fun m!139429 () Bool)

(assert (=> b!96061 m!139429))

(assert (=> b!95935 d!29918))

(assert (=> b!95935 d!29848))

(assert (=> b!95933 d!29848))

(assert (=> b!95933 d!29880))

(assert (=> d!29822 d!29906))

(assert (=> d!29832 d!29902))

(push 1)

(assert (not bm!1160))

(assert (not bm!1161))

(assert (not b!96042))

(assert (not b!96046))

(assert (not b!96045))

(assert (not b!96056))

(assert (not b!96035))

(assert (not b!96029))

(assert (not d!29882))

(assert (not b!96051))

(assert (not b!96061))

(assert (not b!96026))

(assert (not b!96054))

(assert (not b!96049))

(assert (not b!96058))

(assert (not b!96024))

(assert (not b!96044))

(assert (not d!29912))

(assert (not bm!1159))

(assert (not d!29894))

(assert (not b!96039))

(assert (not d!29908))

(assert (not b!96037))

(assert (not b!96038))

(assert (not b!96047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

