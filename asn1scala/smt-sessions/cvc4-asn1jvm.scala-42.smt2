; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!822 () Bool)

(assert start!822)

(declare-fun b!2961 () Bool)

(declare-fun res!4589 () Bool)

(declare-fun e!2063 () Bool)

(assert (=> b!2961 (=> (not res!4589) (not e!2063))))

(declare-datatypes ((array!268 0))(
  ( (array!269 (arr!498 (Array (_ BitVec 32) (_ BitVec 8))) (size!111 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!200 0))(
  ( (BitStream!201 (buf!423 array!268) (currentByte!1384 (_ BitVec 32)) (currentBit!1379 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!200)

(declare-datatypes ((Unit!200 0))(
  ( (Unit!201) )
))
(declare-datatypes ((tuple2!298 0))(
  ( (tuple2!299 (_1!156 Unit!200) (_2!156 BitStream!200)) )
))
(declare-fun lt!2688 () tuple2!298)

(declare-fun isPrefixOf!0 (BitStream!200 BitStream!200) Bool)

(assert (=> b!2961 (= res!4589 (isPrefixOf!0 thiss!1486 (_2!156 lt!2688)))))

(declare-fun b!2962 () Bool)

(declare-fun res!4592 () Bool)

(declare-fun e!2061 () Bool)

(assert (=> b!2962 (=> (not res!4592) (not e!2061))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2962 (= res!4592 (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 thiss!1486))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486)) nBits!460))))

(declare-fun b!2963 () Bool)

(assert (=> b!2963 (= e!2061 e!2063)))

(declare-fun res!4593 () Bool)

(assert (=> b!2963 (=> (not res!4593) (not e!2063))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2963 (= res!4593 (invariant!0 (currentBit!1379 (_2!156 lt!2688)) (currentByte!1384 (_2!156 lt!2688)) (size!111 (buf!423 (_2!156 lt!2688)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!268)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!200 array!268 (_ BitVec 64) (_ BitVec 64)) tuple2!298)

(assert (=> b!2963 (= lt!2688 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!4590 () Bool)

(assert (=> start!822 (=> (not res!4590) (not e!2061))))

(assert (=> start!822 (= res!4590 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!111 srcBuffer!6))))))))

(assert (=> start!822 e!2061))

(assert (=> start!822 true))

(declare-fun array_inv!106 (array!268) Bool)

(assert (=> start!822 (array_inv!106 srcBuffer!6)))

(declare-fun e!2060 () Bool)

(declare-fun inv!12 (BitStream!200) Bool)

(assert (=> start!822 (and (inv!12 thiss!1486) e!2060)))

(declare-fun b!2964 () Bool)

(declare-datatypes ((tuple2!300 0))(
  ( (tuple2!301 (_1!157 array!268) (_2!157 BitStream!200)) )
))
(declare-fun lt!2687 () tuple2!300)

(assert (=> b!2964 (= e!2063 (not (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!111 (_1!157 lt!2687))))))))))

(declare-datatypes ((tuple2!302 0))(
  ( (tuple2!303 (_1!158 BitStream!200) (_2!158 BitStream!200)) )
))
(declare-fun lt!2690 () tuple2!302)

(declare-fun readBits!0 (BitStream!200 (_ BitVec 64)) tuple2!300)

(assert (=> b!2964 (= lt!2687 (readBits!0 (_1!158 lt!2690) nBits!460))))

(assert (=> b!2964 (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!2688)))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486)) nBits!460)))

(declare-fun lt!2689 () Unit!200)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!200 array!268 (_ BitVec 64)) Unit!200)

(assert (=> b!2964 (= lt!2689 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!423 (_2!156 lt!2688)) nBits!460))))

(declare-fun reader!0 (BitStream!200 BitStream!200) tuple2!302)

(assert (=> b!2964 (= lt!2690 (reader!0 thiss!1486 (_2!156 lt!2688)))))

(declare-fun b!2965 () Bool)

(declare-fun res!4591 () Bool)

(assert (=> b!2965 (=> (not res!4591) (not e!2063))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2965 (= res!4591 (= (bitIndex!0 (size!111 (buf!423 (_2!156 lt!2688))) (currentByte!1384 (_2!156 lt!2688)) (currentBit!1379 (_2!156 lt!2688))) (bvadd (bitIndex!0 (size!111 (buf!423 thiss!1486)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486)) nBits!460)))))

(declare-fun b!2966 () Bool)

(declare-fun res!4594 () Bool)

(assert (=> b!2966 (=> (not res!4594) (not e!2063))))

(assert (=> b!2966 (= res!4594 (= (size!111 (buf!423 thiss!1486)) (size!111 (buf!423 (_2!156 lt!2688)))))))

(declare-fun b!2967 () Bool)

(assert (=> b!2967 (= e!2060 (array_inv!106 (buf!423 thiss!1486)))))

(assert (= (and start!822 res!4590) b!2962))

(assert (= (and b!2962 res!4592) b!2963))

(assert (= (and b!2963 res!4593) b!2966))

(assert (= (and b!2966 res!4594) b!2965))

(assert (= (and b!2965 res!4591) b!2961))

(assert (= (and b!2961 res!4589) b!2964))

(assert (= start!822 b!2967))

(declare-fun m!2899 () Bool)

(assert (=> b!2963 m!2899))

(declare-fun m!2901 () Bool)

(assert (=> b!2963 m!2901))

(declare-fun m!2903 () Bool)

(assert (=> b!2962 m!2903))

(declare-fun m!2905 () Bool)

(assert (=> b!2964 m!2905))

(declare-fun m!2907 () Bool)

(assert (=> b!2964 m!2907))

(declare-fun m!2909 () Bool)

(assert (=> b!2964 m!2909))

(declare-fun m!2911 () Bool)

(assert (=> b!2964 m!2911))

(declare-fun m!2913 () Bool)

(assert (=> start!822 m!2913))

(declare-fun m!2915 () Bool)

(assert (=> start!822 m!2915))

(declare-fun m!2917 () Bool)

(assert (=> b!2961 m!2917))

(declare-fun m!2919 () Bool)

(assert (=> b!2965 m!2919))

(declare-fun m!2921 () Bool)

(assert (=> b!2965 m!2921))

(declare-fun m!2923 () Bool)

(assert (=> b!2967 m!2923))

(push 1)

(assert (not b!2965))

(assert (not b!2964))

(assert (not start!822))

(assert (not b!2961))

(assert (not b!2967))

(assert (not b!2963))

(assert (not b!2962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1486 () Bool)

(assert (=> d!1486 (= (array_inv!106 srcBuffer!6) (bvsge (size!111 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!822 d!1486))

(declare-fun d!1488 () Bool)

(assert (=> d!1488 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1379 thiss!1486) (currentByte!1384 thiss!1486) (size!111 (buf!423 thiss!1486))))))

(declare-fun bs!572 () Bool)

(assert (= bs!572 d!1488))

(declare-fun m!2925 () Bool)

(assert (=> bs!572 m!2925))

(assert (=> start!822 d!1488))

(declare-fun d!1490 () Bool)

(declare-fun e!2066 () Bool)

(assert (=> d!1490 e!2066))

(declare-fun res!4600 () Bool)

(assert (=> d!1490 (=> (not res!4600) (not e!2066))))

(declare-fun lt!2708 () (_ BitVec 64))

(declare-fun lt!2706 () (_ BitVec 64))

(declare-fun lt!2705 () (_ BitVec 64))

(assert (=> d!1490 (= res!4600 (= lt!2708 (bvsub lt!2705 lt!2706)))))

(assert (=> d!1490 (or (= (bvand lt!2705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2706 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2705 lt!2706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1490 (= lt!2706 (remainingBits!0 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!2688)))) ((_ sign_extend 32) (currentByte!1384 (_2!156 lt!2688))) ((_ sign_extend 32) (currentBit!1379 (_2!156 lt!2688)))))))

(declare-fun lt!2703 () (_ BitVec 64))

(declare-fun lt!2704 () (_ BitVec 64))

(assert (=> d!1490 (= lt!2705 (bvmul lt!2703 lt!2704))))

(assert (=> d!1490 (or (= lt!2703 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!2704 (bvsdiv (bvmul lt!2703 lt!2704) lt!2703)))))

(assert (=> d!1490 (= lt!2704 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1490 (= lt!2703 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!2688)))))))

(assert (=> d!1490 (= lt!2708 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1384 (_2!156 lt!2688))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1379 (_2!156 lt!2688)))))))

(assert (=> d!1490 (invariant!0 (currentBit!1379 (_2!156 lt!2688)) (currentByte!1384 (_2!156 lt!2688)) (size!111 (buf!423 (_2!156 lt!2688))))))

(assert (=> d!1490 (= (bitIndex!0 (size!111 (buf!423 (_2!156 lt!2688))) (currentByte!1384 (_2!156 lt!2688)) (currentBit!1379 (_2!156 lt!2688))) lt!2708)))

(declare-fun b!2972 () Bool)

(declare-fun res!4599 () Bool)

(assert (=> b!2972 (=> (not res!4599) (not e!2066))))

(assert (=> b!2972 (= res!4599 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!2708))))

(declare-fun b!2973 () Bool)

(declare-fun lt!2707 () (_ BitVec 64))

(assert (=> b!2973 (= e!2066 (bvsle lt!2708 (bvmul lt!2707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!2973 (or (= lt!2707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!2707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!2707)))))

(assert (=> b!2973 (= lt!2707 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!2688)))))))

(assert (= (and d!1490 res!4600) b!2972))

(assert (= (and b!2972 res!4599) b!2973))

(declare-fun m!2929 () Bool)

(assert (=> d!1490 m!2929))

(assert (=> d!1490 m!2899))

(assert (=> b!2965 d!1490))

(declare-fun d!1498 () Bool)

(declare-fun e!2071 () Bool)

(assert (=> d!1498 e!2071))

(declare-fun res!4608 () Bool)

(assert (=> d!1498 (=> (not res!4608) (not e!2071))))

(declare-fun lt!2712 () (_ BitVec 64))

(declare-fun lt!2714 () (_ BitVec 64))

(declare-fun lt!2711 () (_ BitVec 64))

(assert (=> d!1498 (= res!4608 (= lt!2714 (bvsub lt!2711 lt!2712)))))

(assert (=> d!1498 (or (= (bvand lt!2711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2712 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2711 lt!2712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1498 (= lt!2712 (remainingBits!0 ((_ sign_extend 32) (size!111 (buf!423 thiss!1486))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486))))))

(declare-fun lt!2709 () (_ BitVec 64))

(declare-fun lt!2710 () (_ BitVec 64))

(assert (=> d!1498 (= lt!2711 (bvmul lt!2709 lt!2710))))

(assert (=> d!1498 (or (= lt!2709 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!2710 (bvsdiv (bvmul lt!2709 lt!2710) lt!2709)))))

(assert (=> d!1498 (= lt!2710 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1498 (= lt!2709 ((_ sign_extend 32) (size!111 (buf!423 thiss!1486))))))

(assert (=> d!1498 (= lt!2714 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1384 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1379 thiss!1486))))))

(assert (=> d!1498 (invariant!0 (currentBit!1379 thiss!1486) (currentByte!1384 thiss!1486) (size!111 (buf!423 thiss!1486)))))

(assert (=> d!1498 (= (bitIndex!0 (size!111 (buf!423 thiss!1486)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486)) lt!2714)))

(declare-fun b!2980 () Bool)

(declare-fun res!4607 () Bool)

(assert (=> b!2980 (=> (not res!4607) (not e!2071))))

(assert (=> b!2980 (= res!4607 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!2714))))

(declare-fun b!2981 () Bool)

(declare-fun lt!2713 () (_ BitVec 64))

(assert (=> b!2981 (= e!2071 (bvsle lt!2714 (bvmul lt!2713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!2981 (or (= lt!2713 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!2713 #b0000000000000000000000000000000000000000000000000000000000001000) lt!2713)))))

(assert (=> b!2981 (= lt!2713 ((_ sign_extend 32) (size!111 (buf!423 thiss!1486))))))

(assert (= (and d!1498 res!4608) b!2980))

(assert (= (and b!2980 res!4607) b!2981))

(declare-fun m!2931 () Bool)

(assert (=> d!1498 m!2931))

(assert (=> d!1498 m!2925))

(assert (=> b!2965 d!1498))

(declare-fun b!3012 () Bool)

(declare-fun res!4642 () Bool)

(declare-fun e!2086 () Bool)

(assert (=> b!3012 (=> (not res!4642) (not e!2086))))

(declare-fun lt!2761 () tuple2!300)

(assert (=> b!3012 (= res!4642 (bvsle (currentByte!1384 (_1!158 lt!2690)) (currentByte!1384 (_2!157 lt!2761))))))

(declare-fun b!3013 () Bool)

(declare-fun res!4643 () Bool)

(assert (=> b!3013 (=> (not res!4643) (not e!2086))))

(assert (=> b!3013 (= res!4643 (invariant!0 (currentBit!1379 (_2!157 lt!2761)) (currentByte!1384 (_2!157 lt!2761)) (size!111 (buf!423 (_2!157 lt!2761)))))))

(declare-fun d!1500 () Bool)

(assert (=> d!1500 e!2086))

(declare-fun res!4640 () Bool)

(assert (=> d!1500 (=> (not res!4640) (not e!2086))))

(assert (=> d!1500 (= res!4640 (= (buf!423 (_2!157 lt!2761)) (buf!423 (_1!158 lt!2690))))))

(declare-datatypes ((tuple3!14 0))(
  ( (tuple3!15 (_1!159 Unit!200) (_2!159 BitStream!200) (_3!7 array!268)) )
))
(declare-fun lt!2760 () tuple3!14)

(assert (=> d!1500 (= lt!2761 (tuple2!301 (_3!7 lt!2760) (_2!159 lt!2760)))))

(declare-fun readBitsLoop!0 (BitStream!200 (_ BitVec 64) array!268 (_ BitVec 64) (_ BitVec 64)) tuple3!14)

(assert (=> d!1500 (= lt!2760 (readBitsLoop!0 (_1!158 lt!2690) nBits!460 (array!269 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1500 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1500 (= (readBits!0 (_1!158 lt!2690) nBits!460) lt!2761)))

(declare-fun b!3014 () Bool)

(declare-fun res!4639 () Bool)

(assert (=> b!3014 (=> (not res!4639) (not e!2086))))

(declare-fun lt!2758 () (_ BitVec 64))

(assert (=> b!3014 (= res!4639 (= (bvadd lt!2758 nBits!460) (bitIndex!0 (size!111 (buf!423 (_2!157 lt!2761))) (currentByte!1384 (_2!157 lt!2761)) (currentBit!1379 (_2!157 lt!2761)))))))

(assert (=> b!3014 (or (not (= (bvand lt!2758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!2758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!2758 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3014 (= lt!2758 (bitIndex!0 (size!111 (buf!423 (_1!158 lt!2690))) (currentByte!1384 (_1!158 lt!2690)) (currentBit!1379 (_1!158 lt!2690))))))

(declare-fun b!3015 () Bool)

(declare-datatypes ((List!12 0))(
  ( (Nil!9) (Cons!8 (h!127 Bool) (t!762 List!12)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!200 array!268 (_ BitVec 64) (_ BitVec 64)) List!12)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!200 BitStream!200 (_ BitVec 64)) List!12)

(assert (=> b!3015 (= e!2086 (= (byteArrayBitContentToList!0 (_2!157 lt!2761) (_1!157 lt!2761) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!157 lt!2761) (_1!158 lt!2690) nBits!460)))))

(declare-fun b!3016 () Bool)

(declare-fun res!4641 () Bool)

(assert (=> b!3016 (=> (not res!4641) (not e!2086))))

(declare-fun lt!2764 () (_ BitVec 64))

(assert (=> b!3016 (= res!4641 (= (size!111 (_1!157 lt!2761)) ((_ extract 31 0) lt!2764)))))

(assert (=> b!3016 (and (bvslt lt!2764 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!2764 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!2759 () (_ BitVec 64))

(declare-fun lt!2765 () (_ BitVec 64))

(assert (=> b!3016 (= lt!2764 (bvsdiv lt!2759 lt!2765))))

(assert (=> b!3016 (and (not (= lt!2765 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!2759 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!2765 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!3016 (= lt!2765 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!2757 () (_ BitVec 64))

(declare-fun lt!2763 () (_ BitVec 64))

(assert (=> b!3016 (= lt!2759 (bvsub lt!2757 lt!2763))))

(assert (=> b!3016 (or (= (bvand lt!2757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2763 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2757 lt!2763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3016 (= lt!2763 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!2762 () (_ BitVec 64))

(assert (=> b!3016 (= lt!2757 (bvadd nBits!460 lt!2762))))

(assert (=> b!3016 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2762 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!2762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3016 (= lt!2762 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!1500 res!4640) b!3014))

(assert (= (and b!3014 res!4639) b!3013))

(assert (= (and b!3013 res!4643) b!3016))

(assert (= (and b!3016 res!4641) b!3012))

(assert (= (and b!3012 res!4642) b!3015))

(declare-fun m!2941 () Bool)

(assert (=> b!3013 m!2941))

(declare-fun m!2943 () Bool)

(assert (=> d!1500 m!2943))

(declare-fun m!2945 () Bool)

(assert (=> b!3014 m!2945))

(declare-fun m!2947 () Bool)

(assert (=> b!3014 m!2947))

(declare-fun m!2949 () Bool)

(assert (=> b!3015 m!2949))

(declare-fun m!2951 () Bool)

(assert (=> b!3015 m!2951))

(assert (=> b!2964 d!1500))

(declare-fun d!1514 () Bool)

(assert (=> d!1514 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!2688)))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!2688)))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486))) nBits!460))))

(declare-fun bs!574 () Bool)

(assert (= bs!574 d!1514))

(declare-fun m!2953 () Bool)

(assert (=> bs!574 m!2953))

(assert (=> b!2964 d!1514))

(declare-fun d!1516 () Bool)

(assert (=> d!1516 (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!2688)))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486)) nBits!460)))

(declare-fun lt!2772 () Unit!200)

(declare-fun choose!9 (BitStream!200 array!268 (_ BitVec 64) BitStream!200) Unit!200)

(assert (=> d!1516 (= lt!2772 (choose!9 thiss!1486 (buf!423 (_2!156 lt!2688)) nBits!460 (BitStream!201 (buf!423 (_2!156 lt!2688)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486))))))

(assert (=> d!1516 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!423 (_2!156 lt!2688)) nBits!460) lt!2772)))

(declare-fun bs!575 () Bool)

(assert (= bs!575 d!1516))

(assert (=> bs!575 m!2907))

(declare-fun m!2955 () Bool)

(assert (=> bs!575 m!2955))

(assert (=> b!2964 d!1516))

(declare-fun b!3042 () Bool)

(declare-fun e!2094 () Unit!200)

(declare-fun lt!2854 () Unit!200)

(assert (=> b!3042 (= e!2094 lt!2854)))

(declare-fun lt!2842 () (_ BitVec 64))

(assert (=> b!3042 (= lt!2842 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2844 () (_ BitVec 64))

(assert (=> b!3042 (= lt!2844 (bitIndex!0 (size!111 (buf!423 thiss!1486)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!268 array!268 (_ BitVec 64) (_ BitVec 64)) Unit!200)

(assert (=> b!3042 (= lt!2854 (arrayBitRangesEqSymmetric!0 (buf!423 thiss!1486) (buf!423 (_2!156 lt!2688)) lt!2842 lt!2844))))

(declare-fun arrayBitRangesEq!0 (array!268 array!268 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3042 (arrayBitRangesEq!0 (buf!423 (_2!156 lt!2688)) (buf!423 thiss!1486) lt!2842 lt!2844)))

(declare-fun b!3043 () Bool)

(declare-fun Unit!202 () Unit!200)

(assert (=> b!3043 (= e!2094 Unit!202)))

(declare-fun b!3044 () Bool)

(declare-fun res!4665 () Bool)

(declare-fun e!2095 () Bool)

(assert (=> b!3044 (=> (not res!4665) (not e!2095))))

(declare-fun lt!2846 () tuple2!302)

(assert (=> b!3044 (= res!4665 (isPrefixOf!0 (_1!158 lt!2846) thiss!1486))))

(declare-fun lt!2843 () (_ BitVec 64))

(declare-fun b!3045 () Bool)

(declare-fun lt!2850 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!200 (_ BitVec 64)) BitStream!200)

(assert (=> b!3045 (= e!2095 (= (_1!158 lt!2846) (withMovedBitIndex!0 (_2!158 lt!2846) (bvsub lt!2843 lt!2850))))))

(assert (=> b!3045 (or (= (bvand lt!2843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2850 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2843 lt!2850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3045 (= lt!2850 (bitIndex!0 (size!111 (buf!423 (_2!156 lt!2688))) (currentByte!1384 (_2!156 lt!2688)) (currentBit!1379 (_2!156 lt!2688))))))

(assert (=> b!3045 (= lt!2843 (bitIndex!0 (size!111 (buf!423 thiss!1486)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486)))))

(declare-fun b!3046 () Bool)

(declare-fun res!4666 () Bool)

(assert (=> b!3046 (=> (not res!4666) (not e!2095))))

(assert (=> b!3046 (= res!4666 (isPrefixOf!0 (_2!158 lt!2846) (_2!156 lt!2688)))))

(declare-fun d!1518 () Bool)

(assert (=> d!1518 e!2095))

(declare-fun res!4667 () Bool)

(assert (=> d!1518 (=> (not res!4667) (not e!2095))))

(assert (=> d!1518 (= res!4667 (isPrefixOf!0 (_1!158 lt!2846) (_2!158 lt!2846)))))

(declare-fun lt!2857 () BitStream!200)

(assert (=> d!1518 (= lt!2846 (tuple2!303 lt!2857 (_2!156 lt!2688)))))

(declare-fun lt!2839 () Unit!200)

(declare-fun lt!2848 () Unit!200)

(assert (=> d!1518 (= lt!2839 lt!2848)))

(assert (=> d!1518 (isPrefixOf!0 lt!2857 (_2!156 lt!2688))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!200 BitStream!200 BitStream!200) Unit!200)

(assert (=> d!1518 (= lt!2848 (lemmaIsPrefixTransitive!0 lt!2857 (_2!156 lt!2688) (_2!156 lt!2688)))))

(declare-fun lt!2855 () Unit!200)

(declare-fun lt!2849 () Unit!200)

(assert (=> d!1518 (= lt!2855 lt!2849)))

(assert (=> d!1518 (isPrefixOf!0 lt!2857 (_2!156 lt!2688))))

(assert (=> d!1518 (= lt!2849 (lemmaIsPrefixTransitive!0 lt!2857 thiss!1486 (_2!156 lt!2688)))))

(declare-fun lt!2840 () Unit!200)

(assert (=> d!1518 (= lt!2840 e!2094)))

(declare-fun c!119 () Bool)

(assert (=> d!1518 (= c!119 (not (= (size!111 (buf!423 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!2858 () Unit!200)

(declare-fun lt!2851 () Unit!200)

(assert (=> d!1518 (= lt!2858 lt!2851)))

(assert (=> d!1518 (isPrefixOf!0 (_2!156 lt!2688) (_2!156 lt!2688))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!200) Unit!200)

(assert (=> d!1518 (= lt!2851 (lemmaIsPrefixRefl!0 (_2!156 lt!2688)))))

(declare-fun lt!2852 () Unit!200)

(declare-fun lt!2845 () Unit!200)

(assert (=> d!1518 (= lt!2852 lt!2845)))

(assert (=> d!1518 (= lt!2845 (lemmaIsPrefixRefl!0 (_2!156 lt!2688)))))

(declare-fun lt!2847 () Unit!200)

(declare-fun lt!2856 () Unit!200)

(assert (=> d!1518 (= lt!2847 lt!2856)))

(assert (=> d!1518 (isPrefixOf!0 lt!2857 lt!2857)))

(assert (=> d!1518 (= lt!2856 (lemmaIsPrefixRefl!0 lt!2857))))

(declare-fun lt!2853 () Unit!200)

(declare-fun lt!2841 () Unit!200)

(assert (=> d!1518 (= lt!2853 lt!2841)))

(assert (=> d!1518 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1518 (= lt!2841 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1518 (= lt!2857 (BitStream!201 (buf!423 (_2!156 lt!2688)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486)))))

(assert (=> d!1518 (isPrefixOf!0 thiss!1486 (_2!156 lt!2688))))

(assert (=> d!1518 (= (reader!0 thiss!1486 (_2!156 lt!2688)) lt!2846)))

(assert (= (and d!1518 c!119) b!3042))

(assert (= (and d!1518 (not c!119)) b!3043))

(assert (= (and d!1518 res!4667) b!3044))

(assert (= (and b!3044 res!4665) b!3046))

(assert (= (and b!3046 res!4666) b!3045))

(assert (=> b!3042 m!2921))

(declare-fun m!2973 () Bool)

(assert (=> b!3042 m!2973))

(declare-fun m!2975 () Bool)

(assert (=> b!3042 m!2975))

(declare-fun m!2977 () Bool)

(assert (=> b!3044 m!2977))

(declare-fun m!2979 () Bool)

(assert (=> d!1518 m!2979))

(declare-fun m!2981 () Bool)

(assert (=> d!1518 m!2981))

(declare-fun m!2983 () Bool)

(assert (=> d!1518 m!2983))

(declare-fun m!2985 () Bool)

(assert (=> d!1518 m!2985))

(declare-fun m!2987 () Bool)

(assert (=> d!1518 m!2987))

(assert (=> d!1518 m!2917))

(declare-fun m!2989 () Bool)

(assert (=> d!1518 m!2989))

(declare-fun m!2991 () Bool)

(assert (=> d!1518 m!2991))

(declare-fun m!2993 () Bool)

(assert (=> d!1518 m!2993))

(declare-fun m!2995 () Bool)

(assert (=> d!1518 m!2995))

(declare-fun m!2997 () Bool)

(assert (=> d!1518 m!2997))

(declare-fun m!2999 () Bool)

(assert (=> b!3045 m!2999))

(assert (=> b!3045 m!2919))

(assert (=> b!3045 m!2921))

(declare-fun m!3001 () Bool)

(assert (=> b!3046 m!3001))

(assert (=> b!2964 d!1518))

(declare-fun d!1526 () Bool)

(declare-fun res!4681 () Bool)

(declare-fun e!2104 () Bool)

(assert (=> d!1526 (=> (not res!4681) (not e!2104))))

(assert (=> d!1526 (= res!4681 (= (size!111 (buf!423 thiss!1486)) (size!111 (buf!423 (_2!156 lt!2688)))))))

(assert (=> d!1526 (= (isPrefixOf!0 thiss!1486 (_2!156 lt!2688)) e!2104)))

(declare-fun b!3063 () Bool)

(declare-fun res!4682 () Bool)

(assert (=> b!3063 (=> (not res!4682) (not e!2104))))

(assert (=> b!3063 (= res!4682 (bvsle (bitIndex!0 (size!111 (buf!423 thiss!1486)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486)) (bitIndex!0 (size!111 (buf!423 (_2!156 lt!2688))) (currentByte!1384 (_2!156 lt!2688)) (currentBit!1379 (_2!156 lt!2688)))))))

(declare-fun b!3064 () Bool)

(declare-fun e!2105 () Bool)

(assert (=> b!3064 (= e!2104 e!2105)))

(declare-fun res!4680 () Bool)

(assert (=> b!3064 (=> res!4680 e!2105)))

(assert (=> b!3064 (= res!4680 (= (size!111 (buf!423 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!3065 () Bool)

(assert (=> b!3065 (= e!2105 (arrayBitRangesEq!0 (buf!423 thiss!1486) (buf!423 (_2!156 lt!2688)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!111 (buf!423 thiss!1486)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486))))))

(assert (= (and d!1526 res!4681) b!3063))

(assert (= (and b!3063 res!4682) b!3064))

(assert (= (and b!3064 (not res!4680)) b!3065))

(assert (=> b!3063 m!2921))

(assert (=> b!3063 m!2919))

(assert (=> b!3065 m!2921))

(assert (=> b!3065 m!2921))

(declare-fun m!3003 () Bool)

(assert (=> b!3065 m!3003))

(assert (=> b!2961 d!1526))

(declare-fun d!1528 () Bool)

(assert (=> d!1528 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 thiss!1486))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!111 (buf!423 thiss!1486))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486))) nBits!460))))

(declare-fun bs!578 () Bool)

(assert (= bs!578 d!1528))

(assert (=> bs!578 m!2931))

(assert (=> b!2962 d!1528))

(declare-fun d!1530 () Bool)

(assert (=> d!1530 (= (array_inv!106 (buf!423 thiss!1486)) (bvsge (size!111 (buf!423 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!2967 d!1530))

(declare-fun d!1532 () Bool)

(assert (=> d!1532 (= (invariant!0 (currentBit!1379 (_2!156 lt!2688)) (currentByte!1384 (_2!156 lt!2688)) (size!111 (buf!423 (_2!156 lt!2688)))) (and (bvsge (currentBit!1379 (_2!156 lt!2688)) #b00000000000000000000000000000000) (bvslt (currentBit!1379 (_2!156 lt!2688)) #b00000000000000000000000000001000) (bvsge (currentByte!1384 (_2!156 lt!2688)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1384 (_2!156 lt!2688)) (size!111 (buf!423 (_2!156 lt!2688)))) (and (= (currentBit!1379 (_2!156 lt!2688)) #b00000000000000000000000000000000) (= (currentByte!1384 (_2!156 lt!2688)) (size!111 (buf!423 (_2!156 lt!2688))))))))))

(assert (=> b!2963 d!1532))

(declare-fun b!3151 () Bool)

(declare-fun res!4753 () Bool)

(declare-fun e!2136 () Bool)

(assert (=> b!3151 (=> (not res!4753) (not e!2136))))

(declare-fun lt!3303 () tuple2!298)

(assert (=> b!3151 (= res!4753 (= (size!111 (buf!423 thiss!1486)) (size!111 (buf!423 (_2!156 lt!3303)))))))

(declare-fun b!3152 () Bool)

(declare-fun e!2138 () Bool)

(declare-fun lt!3306 () (_ BitVec 64))

(assert (=> b!3152 (= e!2138 (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 thiss!1486))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486)) lt!3306))))

(declare-fun b!3153 () Bool)

(declare-fun e!2137 () tuple2!298)

(declare-fun Unit!209 () Unit!200)

(assert (=> b!3153 (= e!2137 (tuple2!299 Unit!209 thiss!1486))))

(assert (=> b!3153 (= (size!111 (buf!423 thiss!1486)) (size!111 (buf!423 thiss!1486)))))

(declare-fun lt!3291 () Unit!200)

(declare-fun Unit!210 () Unit!200)

(assert (=> b!3153 (= lt!3291 Unit!210)))

(declare-fun call!28 () tuple2!302)

(declare-fun checkByteArrayBitContent!0 (BitStream!200 array!268 array!268 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3153 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!157 (readBits!0 (_1!158 call!28) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun c!130 () Bool)

(declare-fun lt!3320 () tuple2!298)

(declare-fun bm!25 () Bool)

(assert (=> bm!25 (= call!28 (reader!0 thiss!1486 (ite c!130 (_2!156 lt!3320) thiss!1486)))))

(declare-fun d!1534 () Bool)

(assert (=> d!1534 e!2136))

(declare-fun res!4754 () Bool)

(assert (=> d!1534 (=> (not res!4754) (not e!2136))))

(declare-fun lt!3323 () (_ BitVec 64))

(assert (=> d!1534 (= res!4754 (= (bitIndex!0 (size!111 (buf!423 (_2!156 lt!3303))) (currentByte!1384 (_2!156 lt!3303)) (currentBit!1379 (_2!156 lt!3303))) (bvsub lt!3323 from!367)))))

(assert (=> d!1534 (or (= (bvand lt!3323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3323 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!3314 () (_ BitVec 64))

(assert (=> d!1534 (= lt!3323 (bvadd lt!3314 from!367 nBits!460))))

(assert (=> d!1534 (or (not (= (bvand lt!3314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!3314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!3314 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1534 (= lt!3314 (bitIndex!0 (size!111 (buf!423 thiss!1486)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486)))))

(assert (=> d!1534 (= lt!3303 e!2137)))

(assert (=> d!1534 (= c!130 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!3309 () Unit!200)

(declare-fun lt!3302 () Unit!200)

(assert (=> d!1534 (= lt!3309 lt!3302)))

(assert (=> d!1534 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1534 (= lt!3302 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!3292 () (_ BitVec 64))

(assert (=> d!1534 (= lt!3292 (bitIndex!0 (size!111 (buf!423 thiss!1486)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486)))))

(assert (=> d!1534 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1534 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!3303)))

(declare-fun b!3150 () Bool)

(declare-fun res!4752 () Bool)

(assert (=> b!3150 (=> (not res!4752) (not e!2136))))

(assert (=> b!3150 (= res!4752 (= (size!111 (buf!423 (_2!156 lt!3303))) (size!111 (buf!423 thiss!1486))))))

(declare-fun b!3154 () Bool)

(declare-fun lt!3317 () tuple2!298)

(declare-fun Unit!213 () Unit!200)

(assert (=> b!3154 (= e!2137 (tuple2!299 Unit!213 (_2!156 lt!3317)))))

(declare-fun appendBitFromByte!0 (BitStream!200 (_ BitVec 8) (_ BitVec 32)) tuple2!298)

(assert (=> b!3154 (= lt!3320 (appendBitFromByte!0 thiss!1486 (select (arr!498 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!3288 () (_ BitVec 64))

(assert (=> b!3154 (= lt!3288 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3299 () (_ BitVec 64))

(assert (=> b!3154 (= lt!3299 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3282 () Unit!200)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!200 BitStream!200 (_ BitVec 64) (_ BitVec 64)) Unit!200)

(assert (=> b!3154 (= lt!3282 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!156 lt!3320) lt!3288 lt!3299))))

(assert (=> b!3154 (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!3320)))) ((_ sign_extend 32) (currentByte!1384 (_2!156 lt!3320))) ((_ sign_extend 32) (currentBit!1379 (_2!156 lt!3320))) (bvsub lt!3288 lt!3299))))

(declare-fun lt!3304 () Unit!200)

(assert (=> b!3154 (= lt!3304 lt!3282)))

(declare-fun lt!3313 () tuple2!302)

(assert (=> b!3154 (= lt!3313 call!28)))

(declare-fun lt!3296 () (_ BitVec 64))

(assert (=> b!3154 (= lt!3296 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3316 () Unit!200)

(assert (=> b!3154 (= lt!3316 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!423 (_2!156 lt!3320)) lt!3296))))

(assert (=> b!3154 (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!3320)))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486)) lt!3296)))

(declare-fun lt!3290 () Unit!200)

(assert (=> b!3154 (= lt!3290 lt!3316)))

(declare-fun head!12 (List!12) Bool)

(assert (=> b!3154 (= (head!12 (byteArrayBitContentToList!0 (_2!156 lt!3320) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!12 (bitStreamReadBitsIntoList!0 (_2!156 lt!3320) (_1!158 lt!3313) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3298 () Unit!200)

(declare-fun Unit!214 () Unit!200)

(assert (=> b!3154 (= lt!3298 Unit!214)))

(assert (=> b!3154 (= lt!3317 (appendBitsMSBFirstLoop!0 (_2!156 lt!3320) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!3301 () Unit!200)

(assert (=> b!3154 (= lt!3301 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!156 lt!3320) (_2!156 lt!3317)))))

(assert (=> b!3154 (isPrefixOf!0 thiss!1486 (_2!156 lt!3317))))

(declare-fun lt!3287 () Unit!200)

(assert (=> b!3154 (= lt!3287 lt!3301)))

(assert (=> b!3154 (= (size!111 (buf!423 (_2!156 lt!3317))) (size!111 (buf!423 thiss!1486)))))

(declare-fun lt!3319 () Unit!200)

(declare-fun Unit!215 () Unit!200)

(assert (=> b!3154 (= lt!3319 Unit!215)))

(assert (=> b!3154 (= (bitIndex!0 (size!111 (buf!423 (_2!156 lt!3317))) (currentByte!1384 (_2!156 lt!3317)) (currentBit!1379 (_2!156 lt!3317))) (bvsub (bvadd (bitIndex!0 (size!111 (buf!423 thiss!1486)) (currentByte!1384 thiss!1486) (currentBit!1379 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!3322 () Unit!200)

(declare-fun Unit!217 () Unit!200)

(assert (=> b!3154 (= lt!3322 Unit!217)))

(assert (=> b!3154 (= (bitIndex!0 (size!111 (buf!423 (_2!156 lt!3317))) (currentByte!1384 (_2!156 lt!3317)) (currentBit!1379 (_2!156 lt!3317))) (bvsub (bvsub (bvadd (bitIndex!0 (size!111 (buf!423 (_2!156 lt!3320))) (currentByte!1384 (_2!156 lt!3320)) (currentBit!1379 (_2!156 lt!3320))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!3285 () Unit!200)

(declare-fun Unit!218 () Unit!200)

(assert (=> b!3154 (= lt!3285 Unit!218)))

(declare-fun lt!3297 () tuple2!302)

(assert (=> b!3154 (= lt!3297 (reader!0 thiss!1486 (_2!156 lt!3317)))))

(declare-fun lt!3312 () (_ BitVec 64))

(assert (=> b!3154 (= lt!3312 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3321 () Unit!200)

(assert (=> b!3154 (= lt!3321 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!423 (_2!156 lt!3317)) lt!3312))))

(assert (=> b!3154 (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!3317)))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486)) lt!3312)))

(declare-fun lt!3289 () Unit!200)

(assert (=> b!3154 (= lt!3289 lt!3321)))

(declare-fun lt!3286 () tuple2!302)

(assert (=> b!3154 (= lt!3286 (reader!0 (_2!156 lt!3320) (_2!156 lt!3317)))))

(declare-fun lt!3295 () (_ BitVec 64))

(assert (=> b!3154 (= lt!3295 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!3307 () Unit!200)

(assert (=> b!3154 (= lt!3307 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!156 lt!3320) (buf!423 (_2!156 lt!3317)) lt!3295))))

(assert (=> b!3154 (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!3317)))) ((_ sign_extend 32) (currentByte!1384 (_2!156 lt!3320))) ((_ sign_extend 32) (currentBit!1379 (_2!156 lt!3320))) lt!3295)))

(declare-fun lt!3305 () Unit!200)

(assert (=> b!3154 (= lt!3305 lt!3307)))

(declare-fun lt!3281 () List!12)

(assert (=> b!3154 (= lt!3281 (byteArrayBitContentToList!0 (_2!156 lt!3317) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!3308 () List!12)

(assert (=> b!3154 (= lt!3308 (byteArrayBitContentToList!0 (_2!156 lt!3317) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3293 () List!12)

(assert (=> b!3154 (= lt!3293 (bitStreamReadBitsIntoList!0 (_2!156 lt!3317) (_1!158 lt!3297) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!3294 () List!12)

(assert (=> b!3154 (= lt!3294 (bitStreamReadBitsIntoList!0 (_2!156 lt!3317) (_1!158 lt!3286) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3300 () (_ BitVec 64))

(assert (=> b!3154 (= lt!3300 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3315 () Unit!200)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!200 BitStream!200 BitStream!200 BitStream!200 (_ BitVec 64) List!12) Unit!200)

(assert (=> b!3154 (= lt!3315 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!156 lt!3317) (_2!156 lt!3317) (_1!158 lt!3297) (_1!158 lt!3286) lt!3300 lt!3293))))

(declare-fun tail!20 (List!12) List!12)

(assert (=> b!3154 (= (bitStreamReadBitsIntoList!0 (_2!156 lt!3317) (_1!158 lt!3286) (bvsub lt!3300 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!20 lt!3293))))

(declare-fun lt!3284 () Unit!200)

(assert (=> b!3154 (= lt!3284 lt!3315)))

(declare-fun lt!3324 () Unit!200)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!268 array!268 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!200)

(assert (=> b!3154 (= lt!3324 (arrayBitRangesEqImpliesEq!0 (buf!423 (_2!156 lt!3320)) (buf!423 (_2!156 lt!3317)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!3292 (bitIndex!0 (size!111 (buf!423 (_2!156 lt!3320))) (currentByte!1384 (_2!156 lt!3320)) (currentBit!1379 (_2!156 lt!3320)))))))

(declare-fun bitAt!0 (array!268 (_ BitVec 64)) Bool)

(assert (=> b!3154 (= (bitAt!0 (buf!423 (_2!156 lt!3320)) lt!3292) (bitAt!0 (buf!423 (_2!156 lt!3317)) lt!3292))))

(declare-fun lt!3283 () Unit!200)

(assert (=> b!3154 (= lt!3283 lt!3324)))

(declare-fun b!3155 () Bool)

(declare-fun res!4756 () Bool)

(assert (=> b!3155 (=> (not res!4756) (not e!2136))))

(assert (=> b!3155 (= res!4756 (invariant!0 (currentBit!1379 (_2!156 lt!3303)) (currentByte!1384 (_2!156 lt!3303)) (size!111 (buf!423 (_2!156 lt!3303)))))))

(declare-fun b!3156 () Bool)

(declare-fun res!4751 () Bool)

(assert (=> b!3156 (=> (not res!4751) (not e!2136))))

(assert (=> b!3156 (= res!4751 (isPrefixOf!0 thiss!1486 (_2!156 lt!3303)))))

(declare-fun b!3157 () Bool)

(declare-fun lt!3311 () tuple2!302)

(assert (=> b!3157 (= e!2136 (= (bitStreamReadBitsIntoList!0 (_2!156 lt!3303) (_1!158 lt!3311) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!156 lt!3303) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!3157 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3157 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!3310 () Unit!200)

(declare-fun lt!3318 () Unit!200)

(assert (=> b!3157 (= lt!3310 lt!3318)))

(assert (=> b!3157 (validate_offset_bits!1 ((_ sign_extend 32) (size!111 (buf!423 (_2!156 lt!3303)))) ((_ sign_extend 32) (currentByte!1384 thiss!1486)) ((_ sign_extend 32) (currentBit!1379 thiss!1486)) lt!3306)))

(assert (=> b!3157 (= lt!3318 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!423 (_2!156 lt!3303)) lt!3306))))

(assert (=> b!3157 e!2138))

(declare-fun res!4755 () Bool)

(assert (=> b!3157 (=> (not res!4755) (not e!2138))))

(assert (=> b!3157 (= res!4755 (and (= (size!111 (buf!423 thiss!1486)) (size!111 (buf!423 (_2!156 lt!3303)))) (bvsge lt!3306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3157 (= lt!3306 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!3157 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3157 (= lt!3311 (reader!0 thiss!1486 (_2!156 lt!3303)))))

(assert (= (and d!1534 c!130) b!3154))

(assert (= (and d!1534 (not c!130)) b!3153))

(assert (= (or b!3154 b!3153) bm!25))

(assert (= (and d!1534 res!4754) b!3155))

(assert (= (and b!3155 res!4756) b!3151))

(assert (= (and b!3151 res!4753) b!3156))

(assert (= (and b!3156 res!4751) b!3150))

(assert (= (and b!3150 res!4752) b!3157))

(assert (= (and b!3157 res!4755) b!3152))

(declare-fun m!3147 () Bool)

(assert (=> b!3153 m!3147))

(declare-fun m!3149 () Bool)

(assert (=> b!3153 m!3149))

(declare-fun m!3151 () Bool)

(assert (=> b!3152 m!3151))

(declare-fun m!3153 () Bool)

(assert (=> bm!25 m!3153))

(declare-fun m!3155 () Bool)

(assert (=> b!3155 m!3155))

(declare-fun m!3157 () Bool)

(assert (=> d!1534 m!3157))

(assert (=> d!1534 m!2921))

(assert (=> d!1534 m!2993))

(assert (=> d!1534 m!2995))

(declare-fun m!3159 () Bool)

(assert (=> b!3157 m!3159))

(declare-fun m!3161 () Bool)

(assert (=> b!3157 m!3161))

(declare-fun m!3163 () Bool)

(assert (=> b!3157 m!3163))

(declare-fun m!3165 () Bool)

(assert (=> b!3157 m!3165))

(declare-fun m!3167 () Bool)

(assert (=> b!3157 m!3167))

(declare-fun m!3169 () Bool)

(assert (=> b!3156 m!3169))

(declare-fun m!3171 () Bool)

(assert (=> b!3154 m!3171))

(declare-fun m!3173 () Bool)

(assert (=> b!3154 m!3173))

(declare-fun m!3175 () Bool)

(assert (=> b!3154 m!3175))

(declare-fun m!3177 () Bool)

(assert (=> b!3154 m!3177))

(declare-fun m!3179 () Bool)

(assert (=> b!3154 m!3179))

(assert (=> b!3154 m!3173))

(declare-fun m!3181 () Bool)

(assert (=> b!3154 m!3181))

(declare-fun m!3183 () Bool)

(assert (=> b!3154 m!3183))

(declare-fun m!3185 () Bool)

(assert (=> b!3154 m!3185))

(declare-fun m!3187 () Bool)

(assert (=> b!3154 m!3187))

(declare-fun m!3189 () Bool)

(assert (=> b!3154 m!3189))

(declare-fun m!3191 () Bool)

(assert (=> b!3154 m!3191))

(assert (=> b!3154 m!3189))

(declare-fun m!3193 () Bool)

(assert (=> b!3154 m!3193))

(declare-fun m!3195 () Bool)

(assert (=> b!3154 m!3195))

(declare-fun m!3197 () Bool)

(assert (=> b!3154 m!3197))

(assert (=> b!3154 m!2921))

(declare-fun m!3199 () Bool)

(assert (=> b!3154 m!3199))

(declare-fun m!3201 () Bool)

(assert (=> b!3154 m!3201))

(declare-fun m!3203 () Bool)

(assert (=> b!3154 m!3203))

(declare-fun m!3205 () Bool)

(assert (=> b!3154 m!3205))

(declare-fun m!3207 () Bool)

(assert (=> b!3154 m!3207))

(declare-fun m!3209 () Bool)

(assert (=> b!3154 m!3209))

(assert (=> b!3154 m!3209))

(declare-fun m!3211 () Bool)

(assert (=> b!3154 m!3211))

(declare-fun m!3213 () Bool)

(assert (=> b!3154 m!3213))

(declare-fun m!3215 () Bool)

(assert (=> b!3154 m!3215))

(declare-fun m!3217 () Bool)

(assert (=> b!3154 m!3217))

(declare-fun m!3219 () Bool)

(assert (=> b!3154 m!3219))

(declare-fun m!3221 () Bool)

(assert (=> b!3154 m!3221))

(declare-fun m!3223 () Bool)

(assert (=> b!3154 m!3223))

(declare-fun m!3225 () Bool)

(assert (=> b!3154 m!3225))

(assert (=> b!3154 m!3203))

(declare-fun m!3227 () Bool)

(assert (=> b!3154 m!3227))

(declare-fun m!3229 () Bool)

(assert (=> b!3154 m!3229))

(declare-fun m!3231 () Bool)

(assert (=> b!3154 m!3231))

(assert (=> b!2963 d!1534))

(push 1)

(assert (not b!3042))

(assert (not d!1534))

(assert (not b!3045))

(assert (not b!3013))

(assert (not d!1500))

(assert (not b!3156))

(assert (not d!1498))

(assert (not b!3155))

(assert (not bm!25))

(assert (not b!3014))

(assert (not b!3154))

(assert (not d!1528))

(assert (not b!3063))

(assert (not d!1516))

(assert (not b!3152))

(assert (not b!3153))

(assert (not d!1514))

(assert (not d!1490))

(assert (not d!1518))

(assert (not b!3157))

(assert (not b!3044))

(assert (not b!3065))

(assert (not d!1488))

(assert (not b!3046))

(assert (not b!3015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

