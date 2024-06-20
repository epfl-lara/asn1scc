; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!818 () Bool)

(assert start!818)

(declare-fun b!2919 () Bool)

(declare-fun e!2032 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!264 0))(
  ( (array!265 (arr!496 (Array (_ BitVec 32) (_ BitVec 8))) (size!109 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!196 0))(
  ( (BitStream!197 (buf!421 array!264) (currentByte!1382 (_ BitVec 32)) (currentBit!1377 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!286 0))(
  ( (tuple2!287 (_1!150 array!264) (_2!150 BitStream!196)) )
))
(declare-fun lt!2666 () tuple2!286)

(assert (=> b!2919 (= e!2032 (not (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!109 (_1!150 lt!2666))))))))))

(declare-datatypes ((tuple2!288 0))(
  ( (tuple2!289 (_1!151 BitStream!196) (_2!151 BitStream!196)) )
))
(declare-fun lt!2664 () tuple2!288)

(declare-fun readBits!0 (BitStream!196 (_ BitVec 64)) tuple2!286)

(assert (=> b!2919 (= lt!2666 (readBits!0 (_1!151 lt!2664) nBits!460))))

(declare-datatypes ((Unit!196 0))(
  ( (Unit!197) )
))
(declare-datatypes ((tuple2!290 0))(
  ( (tuple2!291 (_1!152 Unit!196) (_2!152 BitStream!196)) )
))
(declare-fun lt!2663 () tuple2!290)

(declare-fun thiss!1486 () BitStream!196)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2919 (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!2663)))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486)) nBits!460)))

(declare-fun lt!2665 () Unit!196)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!196 array!264 (_ BitVec 64)) Unit!196)

(assert (=> b!2919 (= lt!2665 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!421 (_2!152 lt!2663)) nBits!460))))

(declare-fun reader!0 (BitStream!196 BitStream!196) tuple2!288)

(assert (=> b!2919 (= lt!2664 (reader!0 thiss!1486 (_2!152 lt!2663)))))

(declare-fun res!4556 () Bool)

(declare-fun e!2033 () Bool)

(assert (=> start!818 (=> (not res!4556) (not e!2033))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!264)

(assert (=> start!818 (= res!4556 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!109 srcBuffer!6))))))))

(assert (=> start!818 e!2033))

(assert (=> start!818 true))

(declare-fun array_inv!104 (array!264) Bool)

(assert (=> start!818 (array_inv!104 srcBuffer!6)))

(declare-fun e!2031 () Bool)

(declare-fun inv!12 (BitStream!196) Bool)

(assert (=> start!818 (and (inv!12 thiss!1486) e!2031)))

(declare-fun b!2920 () Bool)

(declare-fun res!4555 () Bool)

(assert (=> b!2920 (=> (not res!4555) (not e!2032))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2920 (= res!4555 (= (bitIndex!0 (size!109 (buf!421 (_2!152 lt!2663))) (currentByte!1382 (_2!152 lt!2663)) (currentBit!1377 (_2!152 lt!2663))) (bvadd (bitIndex!0 (size!109 (buf!421 thiss!1486)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486)) nBits!460)))))

(declare-fun b!2921 () Bool)

(declare-fun res!4557 () Bool)

(assert (=> b!2921 (=> (not res!4557) (not e!2032))))

(assert (=> b!2921 (= res!4557 (= (size!109 (buf!421 thiss!1486)) (size!109 (buf!421 (_2!152 lt!2663)))))))

(declare-fun b!2922 () Bool)

(assert (=> b!2922 (= e!2031 (array_inv!104 (buf!421 thiss!1486)))))

(declare-fun b!2923 () Bool)

(assert (=> b!2923 (= e!2033 e!2032)))

(declare-fun res!4554 () Bool)

(assert (=> b!2923 (=> (not res!4554) (not e!2032))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2923 (= res!4554 (invariant!0 (currentBit!1377 (_2!152 lt!2663)) (currentByte!1382 (_2!152 lt!2663)) (size!109 (buf!421 (_2!152 lt!2663)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!196 array!264 (_ BitVec 64) (_ BitVec 64)) tuple2!290)

(assert (=> b!2923 (= lt!2663 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2924 () Bool)

(declare-fun res!4553 () Bool)

(assert (=> b!2924 (=> (not res!4553) (not e!2032))))

(declare-fun isPrefixOf!0 (BitStream!196 BitStream!196) Bool)

(assert (=> b!2924 (= res!4553 (isPrefixOf!0 thiss!1486 (_2!152 lt!2663)))))

(declare-fun b!2925 () Bool)

(declare-fun res!4558 () Bool)

(assert (=> b!2925 (=> (not res!4558) (not e!2033))))

(assert (=> b!2925 (= res!4558 (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 thiss!1486))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486)) nBits!460))))

(assert (= (and start!818 res!4556) b!2925))

(assert (= (and b!2925 res!4558) b!2923))

(assert (= (and b!2923 res!4554) b!2921))

(assert (= (and b!2921 res!4557) b!2920))

(assert (= (and b!2920 res!4555) b!2924))

(assert (= (and b!2924 res!4553) b!2919))

(assert (= start!818 b!2922))

(declare-fun m!2847 () Bool)

(assert (=> b!2923 m!2847))

(declare-fun m!2849 () Bool)

(assert (=> b!2923 m!2849))

(declare-fun m!2851 () Bool)

(assert (=> b!2922 m!2851))

(declare-fun m!2853 () Bool)

(assert (=> b!2919 m!2853))

(declare-fun m!2855 () Bool)

(assert (=> b!2919 m!2855))

(declare-fun m!2857 () Bool)

(assert (=> b!2919 m!2857))

(declare-fun m!2859 () Bool)

(assert (=> b!2919 m!2859))

(declare-fun m!2861 () Bool)

(assert (=> b!2920 m!2861))

(declare-fun m!2863 () Bool)

(assert (=> b!2920 m!2863))

(declare-fun m!2865 () Bool)

(assert (=> b!2925 m!2865))

(declare-fun m!2867 () Bool)

(assert (=> start!818 m!2867))

(declare-fun m!2869 () Bool)

(assert (=> start!818 m!2869))

(declare-fun m!2871 () Bool)

(assert (=> b!2924 m!2871))

(push 1)

(assert (not start!818))

(assert (not b!2919))

(assert (not b!2925))

(assert (not b!2924))

(assert (not b!2923))

(assert (not b!2922))

(assert (not b!2920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1504 () Bool)

(declare-fun res!4626 () Bool)

(declare-fun e!2082 () Bool)

(assert (=> d!1504 (=> (not res!4626) (not e!2082))))

(assert (=> d!1504 (= res!4626 (= (size!109 (buf!421 thiss!1486)) (size!109 (buf!421 (_2!152 lt!2663)))))))

(assert (=> d!1504 (= (isPrefixOf!0 thiss!1486 (_2!152 lt!2663)) e!2082)))

(declare-fun b!2999 () Bool)

(declare-fun res!4628 () Bool)

(assert (=> b!2999 (=> (not res!4628) (not e!2082))))

(assert (=> b!2999 (= res!4628 (bvsle (bitIndex!0 (size!109 (buf!421 thiss!1486)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486)) (bitIndex!0 (size!109 (buf!421 (_2!152 lt!2663))) (currentByte!1382 (_2!152 lt!2663)) (currentBit!1377 (_2!152 lt!2663)))))))

(declare-fun b!3000 () Bool)

(declare-fun e!2083 () Bool)

(assert (=> b!3000 (= e!2082 e!2083)))

(declare-fun res!4627 () Bool)

(assert (=> b!3000 (=> res!4627 e!2083)))

(assert (=> b!3000 (= res!4627 (= (size!109 (buf!421 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!3001 () Bool)

(declare-fun arrayBitRangesEq!0 (array!264 array!264 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3001 (= e!2083 (arrayBitRangesEq!0 (buf!421 thiss!1486) (buf!421 (_2!152 lt!2663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!109 (buf!421 thiss!1486)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486))))))

(assert (= (and d!1504 res!4626) b!2999))

(assert (= (and b!2999 res!4628) b!3000))

(assert (= (and b!3000 (not res!4627)) b!3001))

(assert (=> b!2999 m!2863))

(assert (=> b!2999 m!2861))

(assert (=> b!3001 m!2863))

(assert (=> b!3001 m!2863))

(declare-fun m!2939 () Bool)

(assert (=> b!3001 m!2939))

(assert (=> b!2924 d!1504))

(declare-fun b!3027 () Bool)

(declare-fun res!4654 () Bool)

(declare-fun e!2089 () Bool)

(assert (=> b!3027 (=> (not res!4654) (not e!2089))))

(declare-fun lt!2792 () tuple2!286)

(assert (=> b!3027 (= res!4654 (invariant!0 (currentBit!1377 (_2!150 lt!2792)) (currentByte!1382 (_2!150 lt!2792)) (size!109 (buf!421 (_2!150 lt!2792)))))))

(declare-fun b!3028 () Bool)

(declare-fun res!4657 () Bool)

(assert (=> b!3028 (=> (not res!4657) (not e!2089))))

(assert (=> b!3028 (= res!4657 (bvsle (currentByte!1382 (_1!151 lt!2664)) (currentByte!1382 (_2!150 lt!2792))))))

(declare-fun d!1510 () Bool)

(assert (=> d!1510 e!2089))

(declare-fun res!4655 () Bool)

(assert (=> d!1510 (=> (not res!4655) (not e!2089))))

(assert (=> d!1510 (= res!4655 (= (buf!421 (_2!150 lt!2792)) (buf!421 (_1!151 lt!2664))))))

(declare-datatypes ((tuple3!16 0))(
  ( (tuple3!17 (_1!160 Unit!196) (_2!160 BitStream!196) (_3!8 array!264)) )
))
(declare-fun lt!2789 () tuple3!16)

(assert (=> d!1510 (= lt!2792 (tuple2!287 (_3!8 lt!2789) (_2!160 lt!2789)))))

(declare-fun readBitsLoop!0 (BitStream!196 (_ BitVec 64) array!264 (_ BitVec 64) (_ BitVec 64)) tuple3!16)

(assert (=> d!1510 (= lt!2789 (readBitsLoop!0 (_1!151 lt!2664) nBits!460 (array!265 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1510 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1510 (= (readBits!0 (_1!151 lt!2664) nBits!460) lt!2792)))

(declare-fun b!3029 () Bool)

(declare-fun res!4658 () Bool)

(assert (=> b!3029 (=> (not res!4658) (not e!2089))))

(declare-fun lt!2790 () (_ BitVec 64))

(assert (=> b!3029 (= res!4658 (= (size!109 (_1!150 lt!2792)) ((_ extract 31 0) lt!2790)))))

(assert (=> b!3029 (and (bvslt lt!2790 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!2790 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!2794 () (_ BitVec 64))

(declare-fun lt!2787 () (_ BitVec 64))

(assert (=> b!3029 (= lt!2790 (bvsdiv lt!2794 lt!2787))))

(assert (=> b!3029 (and (not (= lt!2787 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!2794 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!2787 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!3029 (= lt!2787 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!2791 () (_ BitVec 64))

(declare-fun lt!2793 () (_ BitVec 64))

(assert (=> b!3029 (= lt!2794 (bvsub lt!2791 lt!2793))))

(assert (=> b!3029 (or (= (bvand lt!2791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2791 lt!2793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3029 (= lt!2793 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!2795 () (_ BitVec 64))

(assert (=> b!3029 (= lt!2791 (bvadd nBits!460 lt!2795))))

(assert (=> b!3029 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2795 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!2795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3029 (= lt!2795 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!3030 () Bool)

(declare-fun res!4656 () Bool)

(assert (=> b!3030 (=> (not res!4656) (not e!2089))))

(declare-fun lt!2788 () (_ BitVec 64))

(assert (=> b!3030 (= res!4656 (= (bvadd lt!2788 nBits!460) (bitIndex!0 (size!109 (buf!421 (_2!150 lt!2792))) (currentByte!1382 (_2!150 lt!2792)) (currentBit!1377 (_2!150 lt!2792)))))))

(assert (=> b!3030 (or (not (= (bvand lt!2788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!2788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!2788 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3030 (= lt!2788 (bitIndex!0 (size!109 (buf!421 (_1!151 lt!2664))) (currentByte!1382 (_1!151 lt!2664)) (currentBit!1377 (_1!151 lt!2664))))))

(declare-fun b!3031 () Bool)

(declare-datatypes ((List!13 0))(
  ( (Nil!10) (Cons!9 (h!128 Bool) (t!763 List!13)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!196 array!264 (_ BitVec 64) (_ BitVec 64)) List!13)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!196 BitStream!196 (_ BitVec 64)) List!13)

(assert (=> b!3031 (= e!2089 (= (byteArrayBitContentToList!0 (_2!150 lt!2792) (_1!150 lt!2792) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!150 lt!2792) (_1!151 lt!2664) nBits!460)))))

(assert (= (and d!1510 res!4655) b!3030))

(assert (= (and b!3030 res!4656) b!3027))

(assert (= (and b!3027 res!4654) b!3029))

(assert (= (and b!3029 res!4658) b!3028))

(assert (= (and b!3028 res!4657) b!3031))

(declare-fun m!2957 () Bool)

(assert (=> b!3027 m!2957))

(declare-fun m!2959 () Bool)

(assert (=> d!1510 m!2959))

(declare-fun m!2961 () Bool)

(assert (=> b!3030 m!2961))

(declare-fun m!2963 () Bool)

(assert (=> b!3030 m!2963))

(declare-fun m!2965 () Bool)

(assert (=> b!3031 m!2965))

(declare-fun m!2967 () Bool)

(assert (=> b!3031 m!2967))

(assert (=> b!2919 d!1510))

(declare-fun d!1520 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1520 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!2663)))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!2663)))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486))) nBits!460))))

(declare-fun bs!576 () Bool)

(assert (= bs!576 d!1520))

(declare-fun m!2969 () Bool)

(assert (=> bs!576 m!2969))

(assert (=> b!2919 d!1520))

(declare-fun d!1522 () Bool)

(assert (=> d!1522 (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!2663)))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486)) nBits!460)))

(declare-fun lt!2798 () Unit!196)

(declare-fun choose!9 (BitStream!196 array!264 (_ BitVec 64) BitStream!196) Unit!196)

(assert (=> d!1522 (= lt!2798 (choose!9 thiss!1486 (buf!421 (_2!152 lt!2663)) nBits!460 (BitStream!197 (buf!421 (_2!152 lt!2663)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486))))))

(assert (=> d!1522 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!421 (_2!152 lt!2663)) nBits!460) lt!2798)))

(declare-fun bs!577 () Bool)

(assert (= bs!577 d!1522))

(assert (=> bs!577 m!2855))

(declare-fun m!2971 () Bool)

(assert (=> bs!577 m!2971))

(assert (=> b!2919 d!1522))

(declare-fun lt!2915 () tuple2!288)

(declare-fun lt!2918 () (_ BitVec 64))

(declare-fun b!3066 () Bool)

(declare-fun lt!2901 () (_ BitVec 64))

(declare-fun e!2106 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!196 (_ BitVec 64)) BitStream!196)

(assert (=> b!3066 (= e!2106 (= (_1!151 lt!2915) (withMovedBitIndex!0 (_2!151 lt!2915) (bvsub lt!2918 lt!2901))))))

(assert (=> b!3066 (or (= (bvand lt!2918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2901 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2918 lt!2901) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3066 (= lt!2901 (bitIndex!0 (size!109 (buf!421 (_2!152 lt!2663))) (currentByte!1382 (_2!152 lt!2663)) (currentBit!1377 (_2!152 lt!2663))))))

(assert (=> b!3066 (= lt!2918 (bitIndex!0 (size!109 (buf!421 thiss!1486)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486)))))

(declare-fun b!3068 () Bool)

(declare-fun e!2107 () Unit!196)

(declare-fun lt!2909 () Unit!196)

(assert (=> b!3068 (= e!2107 lt!2909)))

(declare-fun lt!2912 () (_ BitVec 64))

(assert (=> b!3068 (= lt!2912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2906 () (_ BitVec 64))

(assert (=> b!3068 (= lt!2906 (bitIndex!0 (size!109 (buf!421 thiss!1486)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!264 array!264 (_ BitVec 64) (_ BitVec 64)) Unit!196)

(assert (=> b!3068 (= lt!2909 (arrayBitRangesEqSymmetric!0 (buf!421 thiss!1486) (buf!421 (_2!152 lt!2663)) lt!2912 lt!2906))))

(assert (=> b!3068 (arrayBitRangesEq!0 (buf!421 (_2!152 lt!2663)) (buf!421 thiss!1486) lt!2912 lt!2906)))

(declare-fun b!3069 () Bool)

(declare-fun Unit!203 () Unit!196)

(assert (=> b!3069 (= e!2107 Unit!203)))

(declare-fun b!3070 () Bool)

(declare-fun res!4685 () Bool)

(assert (=> b!3070 (=> (not res!4685) (not e!2106))))

(assert (=> b!3070 (= res!4685 (isPrefixOf!0 (_1!151 lt!2915) thiss!1486))))

(declare-fun b!3067 () Bool)

(declare-fun res!4683 () Bool)

(assert (=> b!3067 (=> (not res!4683) (not e!2106))))

(assert (=> b!3067 (= res!4683 (isPrefixOf!0 (_2!151 lt!2915) (_2!152 lt!2663)))))

(declare-fun d!1524 () Bool)

(assert (=> d!1524 e!2106))

(declare-fun res!4684 () Bool)

(assert (=> d!1524 (=> (not res!4684) (not e!2106))))

(assert (=> d!1524 (= res!4684 (isPrefixOf!0 (_1!151 lt!2915) (_2!151 lt!2915)))))

(declare-fun lt!2911 () BitStream!196)

(assert (=> d!1524 (= lt!2915 (tuple2!289 lt!2911 (_2!152 lt!2663)))))

(declare-fun lt!2900 () Unit!196)

(declare-fun lt!2907 () Unit!196)

(assert (=> d!1524 (= lt!2900 lt!2907)))

(assert (=> d!1524 (isPrefixOf!0 lt!2911 (_2!152 lt!2663))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!196 BitStream!196 BitStream!196) Unit!196)

(assert (=> d!1524 (= lt!2907 (lemmaIsPrefixTransitive!0 lt!2911 (_2!152 lt!2663) (_2!152 lt!2663)))))

(declare-fun lt!2903 () Unit!196)

(declare-fun lt!2914 () Unit!196)

(assert (=> d!1524 (= lt!2903 lt!2914)))

(assert (=> d!1524 (isPrefixOf!0 lt!2911 (_2!152 lt!2663))))

(assert (=> d!1524 (= lt!2914 (lemmaIsPrefixTransitive!0 lt!2911 thiss!1486 (_2!152 lt!2663)))))

(declare-fun lt!2905 () Unit!196)

(assert (=> d!1524 (= lt!2905 e!2107)))

(declare-fun c!122 () Bool)

(assert (=> d!1524 (= c!122 (not (= (size!109 (buf!421 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!2913 () Unit!196)

(declare-fun lt!2904 () Unit!196)

(assert (=> d!1524 (= lt!2913 lt!2904)))

(assert (=> d!1524 (isPrefixOf!0 (_2!152 lt!2663) (_2!152 lt!2663))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!196) Unit!196)

(assert (=> d!1524 (= lt!2904 (lemmaIsPrefixRefl!0 (_2!152 lt!2663)))))

(declare-fun lt!2902 () Unit!196)

(declare-fun lt!2910 () Unit!196)

(assert (=> d!1524 (= lt!2902 lt!2910)))

(assert (=> d!1524 (= lt!2910 (lemmaIsPrefixRefl!0 (_2!152 lt!2663)))))

(declare-fun lt!2917 () Unit!196)

(declare-fun lt!2916 () Unit!196)

(assert (=> d!1524 (= lt!2917 lt!2916)))

(assert (=> d!1524 (isPrefixOf!0 lt!2911 lt!2911)))

(assert (=> d!1524 (= lt!2916 (lemmaIsPrefixRefl!0 lt!2911))))

(declare-fun lt!2899 () Unit!196)

(declare-fun lt!2908 () Unit!196)

(assert (=> d!1524 (= lt!2899 lt!2908)))

(assert (=> d!1524 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1524 (= lt!2908 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1524 (= lt!2911 (BitStream!197 (buf!421 (_2!152 lt!2663)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486)))))

(assert (=> d!1524 (isPrefixOf!0 thiss!1486 (_2!152 lt!2663))))

(assert (=> d!1524 (= (reader!0 thiss!1486 (_2!152 lt!2663)) lt!2915)))

(assert (= (and d!1524 c!122) b!3068))

(assert (= (and d!1524 (not c!122)) b!3069))

(assert (= (and d!1524 res!4684) b!3070))

(assert (= (and b!3070 res!4685) b!3067))

(assert (= (and b!3067 res!4683) b!3066))

(declare-fun m!3005 () Bool)

(assert (=> b!3066 m!3005))

(assert (=> b!3066 m!2861))

(assert (=> b!3066 m!2863))

(declare-fun m!3007 () Bool)

(assert (=> b!3070 m!3007))

(assert (=> b!3068 m!2863))

(declare-fun m!3009 () Bool)

(assert (=> b!3068 m!3009))

(declare-fun m!3011 () Bool)

(assert (=> b!3068 m!3011))

(declare-fun m!3013 () Bool)

(assert (=> b!3067 m!3013))

(declare-fun m!3015 () Bool)

(assert (=> d!1524 m!3015))

(declare-fun m!3017 () Bool)

(assert (=> d!1524 m!3017))

(declare-fun m!3019 () Bool)

(assert (=> d!1524 m!3019))

(declare-fun m!3021 () Bool)

(assert (=> d!1524 m!3021))

(declare-fun m!3023 () Bool)

(assert (=> d!1524 m!3023))

(declare-fun m!3025 () Bool)

(assert (=> d!1524 m!3025))

(declare-fun m!3027 () Bool)

(assert (=> d!1524 m!3027))

(declare-fun m!3029 () Bool)

(assert (=> d!1524 m!3029))

(declare-fun m!3031 () Bool)

(assert (=> d!1524 m!3031))

(assert (=> d!1524 m!2871))

(declare-fun m!3033 () Bool)

(assert (=> d!1524 m!3033))

(assert (=> b!2919 d!1524))

(declare-fun d!1536 () Bool)

(declare-fun e!2110 () Bool)

(assert (=> d!1536 e!2110))

(declare-fun res!4690 () Bool)

(assert (=> d!1536 (=> (not res!4690) (not e!2110))))

(declare-fun lt!2935 () (_ BitVec 64))

(declare-fun lt!2931 () (_ BitVec 64))

(declare-fun lt!2933 () (_ BitVec 64))

(assert (=> d!1536 (= res!4690 (= lt!2933 (bvsub lt!2931 lt!2935)))))

(assert (=> d!1536 (or (= (bvand lt!2931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2935 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2931 lt!2935) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1536 (= lt!2935 (remainingBits!0 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!2663)))) ((_ sign_extend 32) (currentByte!1382 (_2!152 lt!2663))) ((_ sign_extend 32) (currentBit!1377 (_2!152 lt!2663)))))))

(declare-fun lt!2936 () (_ BitVec 64))

(declare-fun lt!2932 () (_ BitVec 64))

(assert (=> d!1536 (= lt!2931 (bvmul lt!2936 lt!2932))))

(assert (=> d!1536 (or (= lt!2936 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!2932 (bvsdiv (bvmul lt!2936 lt!2932) lt!2936)))))

(assert (=> d!1536 (= lt!2932 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1536 (= lt!2936 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!2663)))))))

(assert (=> d!1536 (= lt!2933 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1382 (_2!152 lt!2663))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1377 (_2!152 lt!2663)))))))

(assert (=> d!1536 (invariant!0 (currentBit!1377 (_2!152 lt!2663)) (currentByte!1382 (_2!152 lt!2663)) (size!109 (buf!421 (_2!152 lt!2663))))))

(assert (=> d!1536 (= (bitIndex!0 (size!109 (buf!421 (_2!152 lt!2663))) (currentByte!1382 (_2!152 lt!2663)) (currentBit!1377 (_2!152 lt!2663))) lt!2933)))

(declare-fun b!3075 () Bool)

(declare-fun res!4691 () Bool)

(assert (=> b!3075 (=> (not res!4691) (not e!2110))))

(assert (=> b!3075 (= res!4691 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!2933))))

(declare-fun b!3076 () Bool)

(declare-fun lt!2934 () (_ BitVec 64))

(assert (=> b!3076 (= e!2110 (bvsle lt!2933 (bvmul lt!2934 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3076 (or (= lt!2934 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!2934 #b0000000000000000000000000000000000000000000000000000000000001000) lt!2934)))))

(assert (=> b!3076 (= lt!2934 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!2663)))))))

(assert (= (and d!1536 res!4690) b!3075))

(assert (= (and b!3075 res!4691) b!3076))

(declare-fun m!3035 () Bool)

(assert (=> d!1536 m!3035))

(assert (=> d!1536 m!2847))

(assert (=> b!2920 d!1536))

(declare-fun d!1538 () Bool)

(declare-fun e!2111 () Bool)

(assert (=> d!1538 e!2111))

(declare-fun res!4692 () Bool)

(assert (=> d!1538 (=> (not res!4692) (not e!2111))))

(declare-fun lt!2939 () (_ BitVec 64))

(declare-fun lt!2937 () (_ BitVec 64))

(declare-fun lt!2941 () (_ BitVec 64))

(assert (=> d!1538 (= res!4692 (= lt!2939 (bvsub lt!2937 lt!2941)))))

(assert (=> d!1538 (or (= (bvand lt!2937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2937 lt!2941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1538 (= lt!2941 (remainingBits!0 ((_ sign_extend 32) (size!109 (buf!421 thiss!1486))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486))))))

(declare-fun lt!2942 () (_ BitVec 64))

(declare-fun lt!2938 () (_ BitVec 64))

(assert (=> d!1538 (= lt!2937 (bvmul lt!2942 lt!2938))))

(assert (=> d!1538 (or (= lt!2942 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!2938 (bvsdiv (bvmul lt!2942 lt!2938) lt!2942)))))

(assert (=> d!1538 (= lt!2938 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1538 (= lt!2942 ((_ sign_extend 32) (size!109 (buf!421 thiss!1486))))))

(assert (=> d!1538 (= lt!2939 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1382 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1377 thiss!1486))))))

(assert (=> d!1538 (invariant!0 (currentBit!1377 thiss!1486) (currentByte!1382 thiss!1486) (size!109 (buf!421 thiss!1486)))))

(assert (=> d!1538 (= (bitIndex!0 (size!109 (buf!421 thiss!1486)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486)) lt!2939)))

(declare-fun b!3077 () Bool)

(declare-fun res!4693 () Bool)

(assert (=> b!3077 (=> (not res!4693) (not e!2111))))

(assert (=> b!3077 (= res!4693 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!2939))))

(declare-fun b!3078 () Bool)

(declare-fun lt!2940 () (_ BitVec 64))

(assert (=> b!3078 (= e!2111 (bvsle lt!2939 (bvmul lt!2940 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3078 (or (= lt!2940 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!2940 #b0000000000000000000000000000000000000000000000000000000000001000) lt!2940)))))

(assert (=> b!3078 (= lt!2940 ((_ sign_extend 32) (size!109 (buf!421 thiss!1486))))))

(assert (= (and d!1538 res!4692) b!3077))

(assert (= (and b!3077 res!4693) b!3078))

(declare-fun m!3037 () Bool)

(assert (=> d!1538 m!3037))

(declare-fun m!3039 () Bool)

(assert (=> d!1538 m!3039))

(assert (=> b!2920 d!1538))

(declare-fun d!1540 () Bool)

(assert (=> d!1540 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 thiss!1486))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!109 (buf!421 thiss!1486))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486))) nBits!460))))

(declare-fun bs!579 () Bool)

(assert (= bs!579 d!1540))

(assert (=> bs!579 m!3037))

(assert (=> b!2925 d!1540))

(declare-fun d!1542 () Bool)

(assert (=> d!1542 (= (array_inv!104 srcBuffer!6) (bvsge (size!109 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!818 d!1542))

(declare-fun d!1544 () Bool)

(assert (=> d!1544 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1377 thiss!1486) (currentByte!1382 thiss!1486) (size!109 (buf!421 thiss!1486))))))

(declare-fun bs!580 () Bool)

(assert (= bs!580 d!1544))

(assert (=> bs!580 m!3039))

(assert (=> start!818 d!1544))

(declare-fun d!1546 () Bool)

(assert (=> d!1546 (= (invariant!0 (currentBit!1377 (_2!152 lt!2663)) (currentByte!1382 (_2!152 lt!2663)) (size!109 (buf!421 (_2!152 lt!2663)))) (and (bvsge (currentBit!1377 (_2!152 lt!2663)) #b00000000000000000000000000000000) (bvslt (currentBit!1377 (_2!152 lt!2663)) #b00000000000000000000000000001000) (bvsge (currentByte!1382 (_2!152 lt!2663)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1382 (_2!152 lt!2663)) (size!109 (buf!421 (_2!152 lt!2663)))) (and (= (currentBit!1377 (_2!152 lt!2663)) #b00000000000000000000000000000000) (= (currentByte!1382 (_2!152 lt!2663)) (size!109 (buf!421 (_2!152 lt!2663))))))))))

(assert (=> b!2923 d!1546))

(declare-fun b!3158 () Bool)

(declare-fun e!2139 () Bool)

(declare-fun lt!3361 () tuple2!288)

(declare-fun lt!3330 () tuple2!290)

(assert (=> b!3158 (= e!2139 (= (bitStreamReadBitsIntoList!0 (_2!152 lt!3330) (_1!151 lt!3361) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!152 lt!3330) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!3158 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3158 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!3343 () Unit!196)

(declare-fun lt!3364 () Unit!196)

(assert (=> b!3158 (= lt!3343 lt!3364)))

(declare-fun lt!3365 () (_ BitVec 64))

(assert (=> b!3158 (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!3330)))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486)) lt!3365)))

(assert (=> b!3158 (= lt!3364 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!421 (_2!152 lt!3330)) lt!3365))))

(declare-fun e!2141 () Bool)

(assert (=> b!3158 e!2141))

(declare-fun res!4758 () Bool)

(assert (=> b!3158 (=> (not res!4758) (not e!2141))))

(assert (=> b!3158 (= res!4758 (and (= (size!109 (buf!421 thiss!1486)) (size!109 (buf!421 (_2!152 lt!3330)))) (bvsge lt!3365 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3158 (= lt!3365 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!3158 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3158 (= lt!3361 (reader!0 thiss!1486 (_2!152 lt!3330)))))

(declare-fun b!3159 () Bool)

(declare-fun e!2140 () tuple2!290)

(declare-fun lt!3346 () tuple2!290)

(declare-fun Unit!216 () Unit!196)

(assert (=> b!3159 (= e!2140 (tuple2!291 Unit!216 (_2!152 lt!3346)))))

(declare-fun lt!3367 () tuple2!290)

(declare-fun appendBitFromByte!0 (BitStream!196 (_ BitVec 8) (_ BitVec 32)) tuple2!290)

(assert (=> b!3159 (= lt!3367 (appendBitFromByte!0 thiss!1486 (select (arr!496 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!3342 () (_ BitVec 64))

(assert (=> b!3159 (= lt!3342 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3366 () (_ BitVec 64))

(assert (=> b!3159 (= lt!3366 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3352 () Unit!196)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!196 BitStream!196 (_ BitVec 64) (_ BitVec 64)) Unit!196)

(assert (=> b!3159 (= lt!3352 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!152 lt!3367) lt!3342 lt!3366))))

(assert (=> b!3159 (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!3367)))) ((_ sign_extend 32) (currentByte!1382 (_2!152 lt!3367))) ((_ sign_extend 32) (currentBit!1377 (_2!152 lt!3367))) (bvsub lt!3342 lt!3366))))

(declare-fun lt!3338 () Unit!196)

(assert (=> b!3159 (= lt!3338 lt!3352)))

(declare-fun lt!3360 () tuple2!288)

(assert (=> b!3159 (= lt!3360 (reader!0 thiss!1486 (_2!152 lt!3367)))))

(declare-fun lt!3337 () (_ BitVec 64))

(assert (=> b!3159 (= lt!3337 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3339 () Unit!196)

(assert (=> b!3159 (= lt!3339 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!421 (_2!152 lt!3367)) lt!3337))))

(assert (=> b!3159 (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!3367)))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486)) lt!3337)))

(declare-fun lt!3348 () Unit!196)

(assert (=> b!3159 (= lt!3348 lt!3339)))

(declare-fun head!13 (List!13) Bool)

(assert (=> b!3159 (= (head!13 (byteArrayBitContentToList!0 (_2!152 lt!3367) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!13 (bitStreamReadBitsIntoList!0 (_2!152 lt!3367) (_1!151 lt!3360) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3347 () Unit!196)

(declare-fun Unit!219 () Unit!196)

(assert (=> b!3159 (= lt!3347 Unit!219)))

(assert (=> b!3159 (= lt!3346 (appendBitsMSBFirstLoop!0 (_2!152 lt!3367) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!3333 () Unit!196)

(assert (=> b!3159 (= lt!3333 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!152 lt!3367) (_2!152 lt!3346)))))

(assert (=> b!3159 (isPrefixOf!0 thiss!1486 (_2!152 lt!3346))))

(declare-fun lt!3355 () Unit!196)

(assert (=> b!3159 (= lt!3355 lt!3333)))

(assert (=> b!3159 (= (size!109 (buf!421 (_2!152 lt!3346))) (size!109 (buf!421 thiss!1486)))))

(declare-fun lt!3357 () Unit!196)

(declare-fun Unit!220 () Unit!196)

(assert (=> b!3159 (= lt!3357 Unit!220)))

(assert (=> b!3159 (= (bitIndex!0 (size!109 (buf!421 (_2!152 lt!3346))) (currentByte!1382 (_2!152 lt!3346)) (currentBit!1377 (_2!152 lt!3346))) (bvsub (bvadd (bitIndex!0 (size!109 (buf!421 thiss!1486)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!3358 () Unit!196)

(declare-fun Unit!221 () Unit!196)

(assert (=> b!3159 (= lt!3358 Unit!221)))

(assert (=> b!3159 (= (bitIndex!0 (size!109 (buf!421 (_2!152 lt!3346))) (currentByte!1382 (_2!152 lt!3346)) (currentBit!1377 (_2!152 lt!3346))) (bvsub (bvsub (bvadd (bitIndex!0 (size!109 (buf!421 (_2!152 lt!3367))) (currentByte!1382 (_2!152 lt!3367)) (currentBit!1377 (_2!152 lt!3367))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!3325 () Unit!196)

(declare-fun Unit!222 () Unit!196)

(assert (=> b!3159 (= lt!3325 Unit!222)))

(declare-fun lt!3341 () tuple2!288)

(declare-fun call!29 () tuple2!288)

(assert (=> b!3159 (= lt!3341 call!29)))

(declare-fun lt!3351 () (_ BitVec 64))

(assert (=> b!3159 (= lt!3351 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3344 () Unit!196)

(assert (=> b!3159 (= lt!3344 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!421 (_2!152 lt!3346)) lt!3351))))

(assert (=> b!3159 (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!3346)))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486)) lt!3351)))

(declare-fun lt!3368 () Unit!196)

(assert (=> b!3159 (= lt!3368 lt!3344)))

(declare-fun lt!3327 () tuple2!288)

(assert (=> b!3159 (= lt!3327 (reader!0 (_2!152 lt!3367) (_2!152 lt!3346)))))

(declare-fun lt!3354 () (_ BitVec 64))

(assert (=> b!3159 (= lt!3354 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!3353 () Unit!196)

(assert (=> b!3159 (= lt!3353 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!152 lt!3367) (buf!421 (_2!152 lt!3346)) lt!3354))))

(assert (=> b!3159 (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 (_2!152 lt!3346)))) ((_ sign_extend 32) (currentByte!1382 (_2!152 lt!3367))) ((_ sign_extend 32) (currentBit!1377 (_2!152 lt!3367))) lt!3354)))

(declare-fun lt!3326 () Unit!196)

(assert (=> b!3159 (= lt!3326 lt!3353)))

(declare-fun lt!3332 () List!13)

(assert (=> b!3159 (= lt!3332 (byteArrayBitContentToList!0 (_2!152 lt!3346) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!3328 () List!13)

(assert (=> b!3159 (= lt!3328 (byteArrayBitContentToList!0 (_2!152 lt!3346) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3356 () List!13)

(assert (=> b!3159 (= lt!3356 (bitStreamReadBitsIntoList!0 (_2!152 lt!3346) (_1!151 lt!3341) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!3350 () List!13)

(assert (=> b!3159 (= lt!3350 (bitStreamReadBitsIntoList!0 (_2!152 lt!3346) (_1!151 lt!3327) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3331 () (_ BitVec 64))

(assert (=> b!3159 (= lt!3331 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3335 () Unit!196)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!196 BitStream!196 BitStream!196 BitStream!196 (_ BitVec 64) List!13) Unit!196)

(assert (=> b!3159 (= lt!3335 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!152 lt!3346) (_2!152 lt!3346) (_1!151 lt!3341) (_1!151 lt!3327) lt!3331 lt!3356))))

(declare-fun tail!21 (List!13) List!13)

(assert (=> b!3159 (= (bitStreamReadBitsIntoList!0 (_2!152 lt!3346) (_1!151 lt!3327) (bvsub lt!3331 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!21 lt!3356))))

(declare-fun lt!3349 () Unit!196)

(assert (=> b!3159 (= lt!3349 lt!3335)))

(declare-fun lt!3336 () (_ BitVec 64))

(declare-fun lt!3345 () Unit!196)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!264 array!264 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!196)

(assert (=> b!3159 (= lt!3345 (arrayBitRangesEqImpliesEq!0 (buf!421 (_2!152 lt!3367)) (buf!421 (_2!152 lt!3346)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!3336 (bitIndex!0 (size!109 (buf!421 (_2!152 lt!3367))) (currentByte!1382 (_2!152 lt!3367)) (currentBit!1377 (_2!152 lt!3367)))))))

(declare-fun bitAt!0 (array!264 (_ BitVec 64)) Bool)

(assert (=> b!3159 (= (bitAt!0 (buf!421 (_2!152 lt!3367)) lt!3336) (bitAt!0 (buf!421 (_2!152 lt!3346)) lt!3336))))

(declare-fun lt!3334 () Unit!196)

(assert (=> b!3159 (= lt!3334 lt!3345)))

(declare-fun bm!26 () Bool)

(declare-fun c!131 () Bool)

(assert (=> bm!26 (= call!29 (reader!0 thiss!1486 (ite c!131 (_2!152 lt!3346) thiss!1486)))))

(declare-fun b!3160 () Bool)

(declare-fun res!4757 () Bool)

(assert (=> b!3160 (=> (not res!4757) (not e!2139))))

(assert (=> b!3160 (= res!4757 (invariant!0 (currentBit!1377 (_2!152 lt!3330)) (currentByte!1382 (_2!152 lt!3330)) (size!109 (buf!421 (_2!152 lt!3330)))))))

(declare-fun b!3161 () Bool)

(assert (=> b!3161 (= e!2141 (validate_offset_bits!1 ((_ sign_extend 32) (size!109 (buf!421 thiss!1486))) ((_ sign_extend 32) (currentByte!1382 thiss!1486)) ((_ sign_extend 32) (currentBit!1377 thiss!1486)) lt!3365))))

(declare-fun b!3162 () Bool)

(declare-fun res!4762 () Bool)

(assert (=> b!3162 (=> (not res!4762) (not e!2139))))

(assert (=> b!3162 (= res!4762 (isPrefixOf!0 thiss!1486 (_2!152 lt!3330)))))

(declare-fun b!3163 () Bool)

(declare-fun res!4761 () Bool)

(assert (=> b!3163 (=> (not res!4761) (not e!2139))))

(assert (=> b!3163 (= res!4761 (= (size!109 (buf!421 (_2!152 lt!3330))) (size!109 (buf!421 thiss!1486))))))

(declare-fun d!1548 () Bool)

(assert (=> d!1548 e!2139))

(declare-fun res!4760 () Bool)

(assert (=> d!1548 (=> (not res!4760) (not e!2139))))

(declare-fun lt!3359 () (_ BitVec 64))

(assert (=> d!1548 (= res!4760 (= (bitIndex!0 (size!109 (buf!421 (_2!152 lt!3330))) (currentByte!1382 (_2!152 lt!3330)) (currentBit!1377 (_2!152 lt!3330))) (bvsub lt!3359 from!367)))))

(assert (=> d!1548 (or (= (bvand lt!3359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3359 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!3363 () (_ BitVec 64))

(assert (=> d!1548 (= lt!3359 (bvadd lt!3363 from!367 nBits!460))))

(assert (=> d!1548 (or (not (= (bvand lt!3363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!3363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!3363 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1548 (= lt!3363 (bitIndex!0 (size!109 (buf!421 thiss!1486)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486)))))

(assert (=> d!1548 (= lt!3330 e!2140)))

(assert (=> d!1548 (= c!131 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!3340 () Unit!196)

(declare-fun lt!3329 () Unit!196)

(assert (=> d!1548 (= lt!3340 lt!3329)))

(assert (=> d!1548 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1548 (= lt!3329 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1548 (= lt!3336 (bitIndex!0 (size!109 (buf!421 thiss!1486)) (currentByte!1382 thiss!1486) (currentBit!1377 thiss!1486)))))

(assert (=> d!1548 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1548 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!3330)))

(declare-fun b!3164 () Bool)

(declare-fun res!4759 () Bool)

(assert (=> b!3164 (=> (not res!4759) (not e!2139))))

(assert (=> b!3164 (= res!4759 (= (size!109 (buf!421 thiss!1486)) (size!109 (buf!421 (_2!152 lt!3330)))))))

(declare-fun b!3165 () Bool)

(declare-fun Unit!224 () Unit!196)

(assert (=> b!3165 (= e!2140 (tuple2!291 Unit!224 thiss!1486))))

(assert (=> b!3165 (= (size!109 (buf!421 thiss!1486)) (size!109 (buf!421 thiss!1486)))))

(declare-fun lt!3362 () Unit!196)

(declare-fun Unit!225 () Unit!196)

(assert (=> b!3165 (= lt!3362 Unit!225)))

(declare-fun checkByteArrayBitContent!0 (BitStream!196 array!264 array!264 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3165 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!150 (readBits!0 (_1!151 call!29) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (= (and d!1548 c!131) b!3159))

(assert (= (and d!1548 (not c!131)) b!3165))

(assert (= (or b!3159 b!3165) bm!26))

(assert (= (and d!1548 res!4760) b!3160))

(assert (= (and b!3160 res!4757) b!3164))

(assert (= (and b!3164 res!4759) b!3162))

(assert (= (and b!3162 res!4762) b!3163))

(assert (= (and b!3163 res!4761) b!3158))

(assert (= (and b!3158 res!4758) b!3161))

(declare-fun m!3233 () Bool)

(assert (=> b!3161 m!3233))

(declare-fun m!3235 () Bool)

(assert (=> b!3159 m!3235))

(declare-fun m!3237 () Bool)

(assert (=> b!3159 m!3237))

(declare-fun m!3239 () Bool)

(assert (=> b!3159 m!3239))

(declare-fun m!3241 () Bool)

(assert (=> b!3159 m!3241))

(declare-fun m!3243 () Bool)

(assert (=> b!3159 m!3243))

(declare-fun m!3245 () Bool)

(assert (=> b!3159 m!3245))

(declare-fun m!3247 () Bool)

(assert (=> b!3159 m!3247))

(declare-fun m!3249 () Bool)

(assert (=> b!3159 m!3249))

(declare-fun m!3251 () Bool)

(assert (=> b!3159 m!3251))

(declare-fun m!3253 () Bool)

(assert (=> b!3159 m!3253))

(assert (=> b!3159 m!2863))

(declare-fun m!3255 () Bool)

(assert (=> b!3159 m!3255))

(declare-fun m!3257 () Bool)

(assert (=> b!3159 m!3257))

(declare-fun m!3259 () Bool)

(assert (=> b!3159 m!3259))

(declare-fun m!3261 () Bool)

(assert (=> b!3159 m!3261))

(declare-fun m!3263 () Bool)

(assert (=> b!3159 m!3263))

(declare-fun m!3265 () Bool)

(assert (=> b!3159 m!3265))

(declare-fun m!3267 () Bool)

(assert (=> b!3159 m!3267))

(declare-fun m!3269 () Bool)

(assert (=> b!3159 m!3269))

(declare-fun m!3271 () Bool)

(assert (=> b!3159 m!3271))

(assert (=> b!3159 m!3253))

(declare-fun m!3273 () Bool)

(assert (=> b!3159 m!3273))

(assert (=> b!3159 m!3269))

(declare-fun m!3275 () Bool)

(assert (=> b!3159 m!3275))

(declare-fun m!3277 () Bool)

(assert (=> b!3159 m!3277))

(declare-fun m!3279 () Bool)

(assert (=> b!3159 m!3279))

(declare-fun m!3281 () Bool)

(assert (=> b!3159 m!3281))

(declare-fun m!3283 () Bool)

(assert (=> b!3159 m!3283))

(declare-fun m!3285 () Bool)

(assert (=> b!3159 m!3285))

(assert (=> b!3159 m!3245))

(declare-fun m!3287 () Bool)

(assert (=> b!3159 m!3287))

(declare-fun m!3289 () Bool)

(assert (=> b!3159 m!3289))

(declare-fun m!3291 () Bool)

(assert (=> b!3159 m!3291))

(assert (=> b!3159 m!3255))

(declare-fun m!3293 () Bool)

(assert (=> b!3159 m!3293))

(declare-fun m!3295 () Bool)

(assert (=> b!3159 m!3295))

(declare-fun m!3297 () Bool)

(assert (=> b!3165 m!3297))

(declare-fun m!3299 () Bool)

(assert (=> b!3165 m!3299))

(declare-fun m!3301 () Bool)

(assert (=> b!3162 m!3301))

(declare-fun m!3303 () Bool)

(assert (=> b!3158 m!3303))

(declare-fun m!3305 () Bool)

(assert (=> b!3158 m!3305))

(declare-fun m!3307 () Bool)

(assert (=> b!3158 m!3307))

(declare-fun m!3309 () Bool)

(assert (=> b!3158 m!3309))

(declare-fun m!3311 () Bool)

(assert (=> b!3158 m!3311))

(declare-fun m!3313 () Bool)

(assert (=> d!1548 m!3313))

(assert (=> d!1548 m!2863))

(assert (=> d!1548 m!3017))

(assert (=> d!1548 m!3019))

(declare-fun m!3315 () Bool)

(assert (=> b!3160 m!3315))

(declare-fun m!3317 () Bool)

(assert (=> bm!26 m!3317))

(assert (=> b!2923 d!1548))

(declare-fun d!1562 () Bool)

(assert (=> d!1562 (= (array_inv!104 (buf!421 thiss!1486)) (bvsge (size!109 (buf!421 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!2922 d!1562))

(push 1)

(assert (not bm!26))

(assert (not b!3068))

(assert (not b!3067))

(assert (not b!3162))

(assert (not d!1510))

(assert (not d!1524))

(assert (not d!1520))

(assert (not d!1548))

(assert (not b!3160))

(assert (not b!3158))

(assert (not d!1536))

(assert (not b!3165))

(assert (not d!1544))

(assert (not b!3030))

(assert (not d!1538))

(assert (not b!3001))

(assert (not b!3031))

(assert (not d!1540))

(assert (not b!3161))

(assert (not b!3027))

(assert (not b!3066))

(assert (not b!2999))

(assert (not b!3159))

(assert (not b!3070))

(assert (not d!1522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

