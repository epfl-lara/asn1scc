; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!820 () Bool)

(assert start!820)

(declare-fun b!2940 () Bool)

(declare-fun res!4574 () Bool)

(declare-fun e!2044 () Bool)

(assert (=> b!2940 (=> (not res!4574) (not e!2044))))

(declare-datatypes ((array!266 0))(
  ( (array!267 (arr!497 (Array (_ BitVec 32) (_ BitVec 8))) (size!110 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!198 0))(
  ( (BitStream!199 (buf!422 array!266) (currentByte!1383 (_ BitVec 32)) (currentBit!1378 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!198)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2940 (= res!4574 (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 thiss!1486))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486)) nBits!460))))

(declare-fun b!2941 () Bool)

(declare-fun e!2045 () Bool)

(declare-fun array_inv!105 (array!266) Bool)

(assert (=> b!2941 (= e!2045 (array_inv!105 (buf!422 thiss!1486)))))

(declare-fun b!2942 () Bool)

(declare-fun res!4576 () Bool)

(declare-fun e!2048 () Bool)

(assert (=> b!2942 (=> (not res!4576) (not e!2048))))

(declare-datatypes ((Unit!198 0))(
  ( (Unit!199) )
))
(declare-datatypes ((tuple2!292 0))(
  ( (tuple2!293 (_1!153 Unit!198) (_2!153 BitStream!198)) )
))
(declare-fun lt!2678 () tuple2!292)

(assert (=> b!2942 (= res!4576 (= (size!110 (buf!422 thiss!1486)) (size!110 (buf!422 (_2!153 lt!2678)))))))

(declare-fun b!2943 () Bool)

(declare-datatypes ((tuple2!294 0))(
  ( (tuple2!295 (_1!154 array!266) (_2!154 BitStream!198)) )
))
(declare-fun lt!2677 () tuple2!294)

(assert (=> b!2943 (= e!2048 (not (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!110 (_1!154 lt!2677))))))))))

(declare-datatypes ((tuple2!296 0))(
  ( (tuple2!297 (_1!155 BitStream!198) (_2!155 BitStream!198)) )
))
(declare-fun lt!2675 () tuple2!296)

(declare-fun readBits!0 (BitStream!198 (_ BitVec 64)) tuple2!294)

(assert (=> b!2943 (= lt!2677 (readBits!0 (_1!155 lt!2675) nBits!460))))

(assert (=> b!2943 (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!2678)))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486)) nBits!460)))

(declare-fun lt!2676 () Unit!198)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!198 array!266 (_ BitVec 64)) Unit!198)

(assert (=> b!2943 (= lt!2676 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!422 (_2!153 lt!2678)) nBits!460))))

(declare-fun reader!0 (BitStream!198 BitStream!198) tuple2!296)

(assert (=> b!2943 (= lt!2675 (reader!0 thiss!1486 (_2!153 lt!2678)))))

(declare-fun b!2944 () Bool)

(declare-fun res!4575 () Bool)

(assert (=> b!2944 (=> (not res!4575) (not e!2048))))

(declare-fun isPrefixOf!0 (BitStream!198 BitStream!198) Bool)

(assert (=> b!2944 (= res!4575 (isPrefixOf!0 thiss!1486 (_2!153 lt!2678)))))

(declare-fun res!4571 () Bool)

(assert (=> start!820 (=> (not res!4571) (not e!2044))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!266)

(assert (=> start!820 (= res!4571 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!110 srcBuffer!6))))))))

(assert (=> start!820 e!2044))

(assert (=> start!820 true))

(assert (=> start!820 (array_inv!105 srcBuffer!6)))

(declare-fun inv!12 (BitStream!198) Bool)

(assert (=> start!820 (and (inv!12 thiss!1486) e!2045)))

(declare-fun b!2945 () Bool)

(assert (=> b!2945 (= e!2044 e!2048)))

(declare-fun res!4572 () Bool)

(assert (=> b!2945 (=> (not res!4572) (not e!2048))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2945 (= res!4572 (invariant!0 (currentBit!1378 (_2!153 lt!2678)) (currentByte!1383 (_2!153 lt!2678)) (size!110 (buf!422 (_2!153 lt!2678)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!198 array!266 (_ BitVec 64) (_ BitVec 64)) tuple2!292)

(assert (=> b!2945 (= lt!2678 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2946 () Bool)

(declare-fun res!4573 () Bool)

(assert (=> b!2946 (=> (not res!4573) (not e!2048))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2946 (= res!4573 (= (bitIndex!0 (size!110 (buf!422 (_2!153 lt!2678))) (currentByte!1383 (_2!153 lt!2678)) (currentBit!1378 (_2!153 lt!2678))) (bvadd (bitIndex!0 (size!110 (buf!422 thiss!1486)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486)) nBits!460)))))

(assert (= (and start!820 res!4571) b!2940))

(assert (= (and b!2940 res!4574) b!2945))

(assert (= (and b!2945 res!4572) b!2942))

(assert (= (and b!2942 res!4576) b!2946))

(assert (= (and b!2946 res!4573) b!2944))

(assert (= (and b!2944 res!4575) b!2943))

(assert (= start!820 b!2941))

(declare-fun m!2873 () Bool)

(assert (=> b!2944 m!2873))

(declare-fun m!2875 () Bool)

(assert (=> b!2945 m!2875))

(declare-fun m!2877 () Bool)

(assert (=> b!2945 m!2877))

(declare-fun m!2879 () Bool)

(assert (=> b!2943 m!2879))

(declare-fun m!2881 () Bool)

(assert (=> b!2943 m!2881))

(declare-fun m!2883 () Bool)

(assert (=> b!2943 m!2883))

(declare-fun m!2885 () Bool)

(assert (=> b!2943 m!2885))

(declare-fun m!2887 () Bool)

(assert (=> start!820 m!2887))

(declare-fun m!2889 () Bool)

(assert (=> start!820 m!2889))

(declare-fun m!2891 () Bool)

(assert (=> b!2941 m!2891))

(declare-fun m!2893 () Bool)

(assert (=> b!2940 m!2893))

(declare-fun m!2895 () Bool)

(assert (=> b!2946 m!2895))

(declare-fun m!2897 () Bool)

(assert (=> b!2946 m!2897))

(check-sat (not b!2944) (not b!2946) (not b!2941) (not start!820) (not b!2940) (not b!2943) (not b!2945))
(check-sat)
(get-model)

(declare-fun d!1492 () Bool)

(assert (=> d!1492 (= (array_inv!105 srcBuffer!6) (bvsge (size!110 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!820 d!1492))

(declare-fun d!1494 () Bool)

(assert (=> d!1494 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1378 thiss!1486) (currentByte!1383 thiss!1486) (size!110 (buf!422 thiss!1486))))))

(declare-fun bs!573 () Bool)

(assert (= bs!573 d!1494))

(declare-fun m!2927 () Bool)

(assert (=> bs!573 m!2927))

(assert (=> start!820 d!1494))

(declare-fun d!1496 () Bool)

(declare-fun res!4609 () Bool)

(declare-fun e!2072 () Bool)

(assert (=> d!1496 (=> (not res!4609) (not e!2072))))

(assert (=> d!1496 (= res!4609 (= (size!110 (buf!422 thiss!1486)) (size!110 (buf!422 (_2!153 lt!2678)))))))

(assert (=> d!1496 (= (isPrefixOf!0 thiss!1486 (_2!153 lt!2678)) e!2072)))

(declare-fun b!2982 () Bool)

(declare-fun res!4611 () Bool)

(assert (=> b!2982 (=> (not res!4611) (not e!2072))))

(assert (=> b!2982 (= res!4611 (bvsle (bitIndex!0 (size!110 (buf!422 thiss!1486)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486)) (bitIndex!0 (size!110 (buf!422 (_2!153 lt!2678))) (currentByte!1383 (_2!153 lt!2678)) (currentBit!1378 (_2!153 lt!2678)))))))

(declare-fun b!2983 () Bool)

(declare-fun e!2073 () Bool)

(assert (=> b!2983 (= e!2072 e!2073)))

(declare-fun res!4610 () Bool)

(assert (=> b!2983 (=> res!4610 e!2073)))

(assert (=> b!2983 (= res!4610 (= (size!110 (buf!422 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!2984 () Bool)

(declare-fun arrayBitRangesEq!0 (array!266 array!266 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2984 (= e!2073 (arrayBitRangesEq!0 (buf!422 thiss!1486) (buf!422 (_2!153 lt!2678)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!110 (buf!422 thiss!1486)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486))))))

(assert (= (and d!1496 res!4609) b!2982))

(assert (= (and b!2982 res!4611) b!2983))

(assert (= (and b!2983 (not res!4610)) b!2984))

(assert (=> b!2982 m!2897))

(assert (=> b!2982 m!2895))

(assert (=> b!2984 m!2897))

(assert (=> b!2984 m!2897))

(declare-fun m!2933 () Bool)

(assert (=> b!2984 m!2933))

(assert (=> b!2944 d!1496))

(declare-fun d!1502 () Bool)

(declare-fun e!2080 () Bool)

(assert (=> d!1502 e!2080))

(declare-fun res!4623 () Bool)

(assert (=> d!1502 (=> (not res!4623) (not e!2080))))

(declare-fun lt!2729 () (_ BitVec 64))

(declare-fun lt!2730 () (_ BitVec 64))

(declare-fun lt!2732 () (_ BitVec 64))

(assert (=> d!1502 (= res!4623 (= lt!2730 (bvsub lt!2732 lt!2729)))))

(assert (=> d!1502 (or (= (bvand lt!2732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2732 lt!2729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1502 (= lt!2729 (remainingBits!0 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!2678)))) ((_ sign_extend 32) (currentByte!1383 (_2!153 lt!2678))) ((_ sign_extend 32) (currentBit!1378 (_2!153 lt!2678)))))))

(declare-fun lt!2731 () (_ BitVec 64))

(declare-fun lt!2727 () (_ BitVec 64))

(assert (=> d!1502 (= lt!2732 (bvmul lt!2731 lt!2727))))

(assert (=> d!1502 (or (= lt!2731 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!2727 (bvsdiv (bvmul lt!2731 lt!2727) lt!2731)))))

(assert (=> d!1502 (= lt!2727 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1502 (= lt!2731 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!2678)))))))

(assert (=> d!1502 (= lt!2730 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1383 (_2!153 lt!2678))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1378 (_2!153 lt!2678)))))))

(assert (=> d!1502 (invariant!0 (currentBit!1378 (_2!153 lt!2678)) (currentByte!1383 (_2!153 lt!2678)) (size!110 (buf!422 (_2!153 lt!2678))))))

(assert (=> d!1502 (= (bitIndex!0 (size!110 (buf!422 (_2!153 lt!2678))) (currentByte!1383 (_2!153 lt!2678)) (currentBit!1378 (_2!153 lt!2678))) lt!2730)))

(declare-fun b!2995 () Bool)

(declare-fun res!4622 () Bool)

(assert (=> b!2995 (=> (not res!4622) (not e!2080))))

(assert (=> b!2995 (= res!4622 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!2730))))

(declare-fun b!2996 () Bool)

(declare-fun lt!2728 () (_ BitVec 64))

(assert (=> b!2996 (= e!2080 (bvsle lt!2730 (bvmul lt!2728 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!2996 (or (= lt!2728 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!2728 #b0000000000000000000000000000000000000000000000000000000000001000) lt!2728)))))

(assert (=> b!2996 (= lt!2728 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!2678)))))))

(assert (= (and d!1502 res!4623) b!2995))

(assert (= (and b!2995 res!4622) b!2996))

(declare-fun m!2935 () Bool)

(assert (=> d!1502 m!2935))

(assert (=> d!1502 m!2875))

(assert (=> b!2946 d!1502))

(declare-fun d!1506 () Bool)

(declare-fun e!2081 () Bool)

(assert (=> d!1506 e!2081))

(declare-fun res!4625 () Bool)

(assert (=> d!1506 (=> (not res!4625) (not e!2081))))

(declare-fun lt!2735 () (_ BitVec 64))

(declare-fun lt!2738 () (_ BitVec 64))

(declare-fun lt!2736 () (_ BitVec 64))

(assert (=> d!1506 (= res!4625 (= lt!2736 (bvsub lt!2738 lt!2735)))))

(assert (=> d!1506 (or (= (bvand lt!2738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2738 lt!2735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1506 (= lt!2735 (remainingBits!0 ((_ sign_extend 32) (size!110 (buf!422 thiss!1486))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486))))))

(declare-fun lt!2737 () (_ BitVec 64))

(declare-fun lt!2733 () (_ BitVec 64))

(assert (=> d!1506 (= lt!2738 (bvmul lt!2737 lt!2733))))

(assert (=> d!1506 (or (= lt!2737 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!2733 (bvsdiv (bvmul lt!2737 lt!2733) lt!2737)))))

(assert (=> d!1506 (= lt!2733 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1506 (= lt!2737 ((_ sign_extend 32) (size!110 (buf!422 thiss!1486))))))

(assert (=> d!1506 (= lt!2736 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1383 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1378 thiss!1486))))))

(assert (=> d!1506 (invariant!0 (currentBit!1378 thiss!1486) (currentByte!1383 thiss!1486) (size!110 (buf!422 thiss!1486)))))

(assert (=> d!1506 (= (bitIndex!0 (size!110 (buf!422 thiss!1486)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486)) lt!2736)))

(declare-fun b!2997 () Bool)

(declare-fun res!4624 () Bool)

(assert (=> b!2997 (=> (not res!4624) (not e!2081))))

(assert (=> b!2997 (= res!4624 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!2736))))

(declare-fun b!2998 () Bool)

(declare-fun lt!2734 () (_ BitVec 64))

(assert (=> b!2998 (= e!2081 (bvsle lt!2736 (bvmul lt!2734 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!2998 (or (= lt!2734 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!2734 #b0000000000000000000000000000000000000000000000000000000000001000) lt!2734)))))

(assert (=> b!2998 (= lt!2734 ((_ sign_extend 32) (size!110 (buf!422 thiss!1486))))))

(assert (= (and d!1506 res!4625) b!2997))

(assert (= (and b!2997 res!4624) b!2998))

(declare-fun m!2937 () Bool)

(assert (=> d!1506 m!2937))

(assert (=> d!1506 m!2927))

(assert (=> b!2946 d!1506))

(declare-fun d!1508 () Bool)

(assert (=> d!1508 (= (invariant!0 (currentBit!1378 (_2!153 lt!2678)) (currentByte!1383 (_2!153 lt!2678)) (size!110 (buf!422 (_2!153 lt!2678)))) (and (bvsge (currentBit!1378 (_2!153 lt!2678)) #b00000000000000000000000000000000) (bvslt (currentBit!1378 (_2!153 lt!2678)) #b00000000000000000000000000001000) (bvsge (currentByte!1383 (_2!153 lt!2678)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1383 (_2!153 lt!2678)) (size!110 (buf!422 (_2!153 lt!2678)))) (and (= (currentBit!1378 (_2!153 lt!2678)) #b00000000000000000000000000000000) (= (currentByte!1383 (_2!153 lt!2678)) (size!110 (buf!422 (_2!153 lt!2678))))))))))

(assert (=> b!2945 d!1508))

(declare-fun call!23 () tuple2!296)

(declare-fun lt!3053 () tuple2!292)

(declare-fun c!125 () Bool)

(declare-fun lt!3060 () tuple2!292)

(declare-fun bm!20 () Bool)

(assert (=> bm!20 (= call!23 (reader!0 (ite c!125 (_2!153 lt!3053) thiss!1486) (ite c!125 (_2!153 lt!3060) thiss!1486)))))

(declare-fun b!3095 () Bool)

(declare-fun res!4709 () Bool)

(declare-fun e!2118 () Bool)

(assert (=> b!3095 (=> (not res!4709) (not e!2118))))

(declare-fun lt!3031 () tuple2!292)

(assert (=> b!3095 (= res!4709 (= (size!110 (buf!422 thiss!1486)) (size!110 (buf!422 (_2!153 lt!3031)))))))

(declare-fun b!3096 () Bool)

(declare-fun e!2120 () Bool)

(declare-fun lt!3051 () (_ BitVec 64))

(assert (=> b!3096 (= e!2120 (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 thiss!1486))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486)) lt!3051))))

(declare-fun b!3097 () Bool)

(declare-fun e!2119 () tuple2!292)

(declare-fun Unit!204 () Unit!198)

(assert (=> b!3097 (= e!2119 (tuple2!293 Unit!204 (_2!153 lt!3060)))))

(declare-fun appendBitFromByte!0 (BitStream!198 (_ BitVec 8) (_ BitVec 32)) tuple2!292)

(assert (=> b!3097 (= lt!3053 (appendBitFromByte!0 thiss!1486 (select (arr!497 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!3071 () (_ BitVec 64))

(assert (=> b!3097 (= lt!3071 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3049 () (_ BitVec 64))

(assert (=> b!3097 (= lt!3049 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3063 () Unit!198)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!198 BitStream!198 (_ BitVec 64) (_ BitVec 64)) Unit!198)

(assert (=> b!3097 (= lt!3063 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!153 lt!3053) lt!3071 lt!3049))))

(assert (=> b!3097 (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!3053)))) ((_ sign_extend 32) (currentByte!1383 (_2!153 lt!3053))) ((_ sign_extend 32) (currentBit!1378 (_2!153 lt!3053))) (bvsub lt!3071 lt!3049))))

(declare-fun lt!3068 () Unit!198)

(assert (=> b!3097 (= lt!3068 lt!3063)))

(declare-fun lt!3045 () tuple2!296)

(assert (=> b!3097 (= lt!3045 (reader!0 thiss!1486 (_2!153 lt!3053)))))

(declare-fun lt!3050 () (_ BitVec 64))

(assert (=> b!3097 (= lt!3050 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3061 () Unit!198)

(assert (=> b!3097 (= lt!3061 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!422 (_2!153 lt!3053)) lt!3050))))

(assert (=> b!3097 (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!3053)))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486)) lt!3050)))

(declare-fun lt!3059 () Unit!198)

(assert (=> b!3097 (= lt!3059 lt!3061)))

(declare-datatypes ((List!14 0))(
  ( (Nil!11) (Cons!10 (h!129 Bool) (t!764 List!14)) )
))
(declare-fun head!11 (List!14) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!198 array!266 (_ BitVec 64) (_ BitVec 64)) List!14)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!198 BitStream!198 (_ BitVec 64)) List!14)

(assert (=> b!3097 (= (head!11 (byteArrayBitContentToList!0 (_2!153 lt!3053) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!11 (bitStreamReadBitsIntoList!0 (_2!153 lt!3053) (_1!155 lt!3045) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3073 () Unit!198)

(declare-fun Unit!205 () Unit!198)

(assert (=> b!3097 (= lt!3073 Unit!205)))

(assert (=> b!3097 (= lt!3060 (appendBitsMSBFirstLoop!0 (_2!153 lt!3053) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!3035 () Unit!198)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!198 BitStream!198 BitStream!198) Unit!198)

(assert (=> b!3097 (= lt!3035 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!153 lt!3053) (_2!153 lt!3060)))))

(assert (=> b!3097 (isPrefixOf!0 thiss!1486 (_2!153 lt!3060))))

(declare-fun lt!3036 () Unit!198)

(assert (=> b!3097 (= lt!3036 lt!3035)))

(assert (=> b!3097 (= (size!110 (buf!422 (_2!153 lt!3060))) (size!110 (buf!422 thiss!1486)))))

(declare-fun lt!3040 () Unit!198)

(declare-fun Unit!206 () Unit!198)

(assert (=> b!3097 (= lt!3040 Unit!206)))

(assert (=> b!3097 (= (bitIndex!0 (size!110 (buf!422 (_2!153 lt!3060))) (currentByte!1383 (_2!153 lt!3060)) (currentBit!1378 (_2!153 lt!3060))) (bvsub (bvadd (bitIndex!0 (size!110 (buf!422 thiss!1486)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!3041 () Unit!198)

(declare-fun Unit!207 () Unit!198)

(assert (=> b!3097 (= lt!3041 Unit!207)))

(assert (=> b!3097 (= (bitIndex!0 (size!110 (buf!422 (_2!153 lt!3060))) (currentByte!1383 (_2!153 lt!3060)) (currentBit!1378 (_2!153 lt!3060))) (bvsub (bvsub (bvadd (bitIndex!0 (size!110 (buf!422 (_2!153 lt!3053))) (currentByte!1383 (_2!153 lt!3053)) (currentBit!1378 (_2!153 lt!3053))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!3033 () Unit!198)

(declare-fun Unit!208 () Unit!198)

(assert (=> b!3097 (= lt!3033 Unit!208)))

(declare-fun lt!3069 () tuple2!296)

(assert (=> b!3097 (= lt!3069 (reader!0 thiss!1486 (_2!153 lt!3060)))))

(declare-fun lt!3044 () (_ BitVec 64))

(assert (=> b!3097 (= lt!3044 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3067 () Unit!198)

(assert (=> b!3097 (= lt!3067 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!422 (_2!153 lt!3060)) lt!3044))))

(assert (=> b!3097 (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!3060)))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486)) lt!3044)))

(declare-fun lt!3066 () Unit!198)

(assert (=> b!3097 (= lt!3066 lt!3067)))

(declare-fun lt!3065 () tuple2!296)

(assert (=> b!3097 (= lt!3065 call!23)))

(declare-fun lt!3070 () (_ BitVec 64))

(assert (=> b!3097 (= lt!3070 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!3042 () Unit!198)

(assert (=> b!3097 (= lt!3042 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!153 lt!3053) (buf!422 (_2!153 lt!3060)) lt!3070))))

(assert (=> b!3097 (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!3060)))) ((_ sign_extend 32) (currentByte!1383 (_2!153 lt!3053))) ((_ sign_extend 32) (currentBit!1378 (_2!153 lt!3053))) lt!3070)))

(declare-fun lt!3056 () Unit!198)

(assert (=> b!3097 (= lt!3056 lt!3042)))

(declare-fun lt!3034 () List!14)

(assert (=> b!3097 (= lt!3034 (byteArrayBitContentToList!0 (_2!153 lt!3060) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!3043 () List!14)

(assert (=> b!3097 (= lt!3043 (byteArrayBitContentToList!0 (_2!153 lt!3060) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3057 () List!14)

(assert (=> b!3097 (= lt!3057 (bitStreamReadBitsIntoList!0 (_2!153 lt!3060) (_1!155 lt!3069) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!3037 () List!14)

(assert (=> b!3097 (= lt!3037 (bitStreamReadBitsIntoList!0 (_2!153 lt!3060) (_1!155 lt!3065) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3055 () (_ BitVec 64))

(assert (=> b!3097 (= lt!3055 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3046 () Unit!198)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!198 BitStream!198 BitStream!198 BitStream!198 (_ BitVec 64) List!14) Unit!198)

(assert (=> b!3097 (= lt!3046 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!153 lt!3060) (_2!153 lt!3060) (_1!155 lt!3069) (_1!155 lt!3065) lt!3055 lt!3057))))

(declare-fun tail!19 (List!14) List!14)

(assert (=> b!3097 (= (bitStreamReadBitsIntoList!0 (_2!153 lt!3060) (_1!155 lt!3065) (bvsub lt!3055 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!19 lt!3057))))

(declare-fun lt!3038 () Unit!198)

(assert (=> b!3097 (= lt!3038 lt!3046)))

(declare-fun lt!3047 () Unit!198)

(declare-fun lt!3064 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!266 array!266 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!198)

(assert (=> b!3097 (= lt!3047 (arrayBitRangesEqImpliesEq!0 (buf!422 (_2!153 lt!3053)) (buf!422 (_2!153 lt!3060)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!3064 (bitIndex!0 (size!110 (buf!422 (_2!153 lt!3053))) (currentByte!1383 (_2!153 lt!3053)) (currentBit!1378 (_2!153 lt!3053)))))))

(declare-fun bitAt!0 (array!266 (_ BitVec 64)) Bool)

(assert (=> b!3097 (= (bitAt!0 (buf!422 (_2!153 lt!3053)) lt!3064) (bitAt!0 (buf!422 (_2!153 lt!3060)) lt!3064))))

(declare-fun lt!3032 () Unit!198)

(assert (=> b!3097 (= lt!3032 lt!3047)))

(declare-fun d!1512 () Bool)

(assert (=> d!1512 e!2118))

(declare-fun res!4706 () Bool)

(assert (=> d!1512 (=> (not res!4706) (not e!2118))))

(declare-fun lt!3054 () (_ BitVec 64))

(assert (=> d!1512 (= res!4706 (= (bitIndex!0 (size!110 (buf!422 (_2!153 lt!3031))) (currentByte!1383 (_2!153 lt!3031)) (currentBit!1378 (_2!153 lt!3031))) (bvsub lt!3054 from!367)))))

(assert (=> d!1512 (or (= (bvand lt!3054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3054 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!3074 () (_ BitVec 64))

(assert (=> d!1512 (= lt!3054 (bvadd lt!3074 from!367 nBits!460))))

(assert (=> d!1512 (or (not (= (bvand lt!3074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!3074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!3074 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1512 (= lt!3074 (bitIndex!0 (size!110 (buf!422 thiss!1486)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486)))))

(assert (=> d!1512 (= lt!3031 e!2119)))

(assert (=> d!1512 (= c!125 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!3048 () Unit!198)

(declare-fun lt!3052 () Unit!198)

(assert (=> d!1512 (= lt!3048 lt!3052)))

(assert (=> d!1512 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!198) Unit!198)

(assert (=> d!1512 (= lt!3052 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1512 (= lt!3064 (bitIndex!0 (size!110 (buf!422 thiss!1486)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486)))))

(assert (=> d!1512 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1512 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!3031)))

(declare-fun b!3098 () Bool)

(declare-fun res!4710 () Bool)

(assert (=> b!3098 (=> (not res!4710) (not e!2118))))

(assert (=> b!3098 (= res!4710 (= (size!110 (buf!422 (_2!153 lt!3031))) (size!110 (buf!422 thiss!1486))))))

(declare-fun b!3099 () Bool)

(declare-fun res!4707 () Bool)

(assert (=> b!3099 (=> (not res!4707) (not e!2118))))

(assert (=> b!3099 (= res!4707 (invariant!0 (currentBit!1378 (_2!153 lt!3031)) (currentByte!1383 (_2!153 lt!3031)) (size!110 (buf!422 (_2!153 lt!3031)))))))

(declare-fun b!3100 () Bool)

(declare-fun res!4711 () Bool)

(assert (=> b!3100 (=> (not res!4711) (not e!2118))))

(assert (=> b!3100 (= res!4711 (isPrefixOf!0 thiss!1486 (_2!153 lt!3031)))))

(declare-fun lt!3072 () tuple2!296)

(declare-fun b!3101 () Bool)

(assert (=> b!3101 (= e!2118 (= (bitStreamReadBitsIntoList!0 (_2!153 lt!3031) (_1!155 lt!3072) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!153 lt!3031) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!3101 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3101 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!3039 () Unit!198)

(declare-fun lt!3062 () Unit!198)

(assert (=> b!3101 (= lt!3039 lt!3062)))

(assert (=> b!3101 (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!3031)))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486)) lt!3051)))

(assert (=> b!3101 (= lt!3062 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!422 (_2!153 lt!3031)) lt!3051))))

(assert (=> b!3101 e!2120))

(declare-fun res!4708 () Bool)

(assert (=> b!3101 (=> (not res!4708) (not e!2120))))

(assert (=> b!3101 (= res!4708 (and (= (size!110 (buf!422 thiss!1486)) (size!110 (buf!422 (_2!153 lt!3031)))) (bvsge lt!3051 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3101 (= lt!3051 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!3101 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3101 (= lt!3072 (reader!0 thiss!1486 (_2!153 lt!3031)))))

(declare-fun b!3102 () Bool)

(declare-fun Unit!211 () Unit!198)

(assert (=> b!3102 (= e!2119 (tuple2!293 Unit!211 thiss!1486))))

(assert (=> b!3102 (= (size!110 (buf!422 thiss!1486)) (size!110 (buf!422 thiss!1486)))))

(declare-fun lt!3058 () Unit!198)

(declare-fun Unit!212 () Unit!198)

(assert (=> b!3102 (= lt!3058 Unit!212)))

(declare-fun checkByteArrayBitContent!0 (BitStream!198 array!266 array!266 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3102 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!154 (readBits!0 (_1!155 call!23) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (= (and d!1512 c!125) b!3097))

(assert (= (and d!1512 (not c!125)) b!3102))

(assert (= (or b!3097 b!3102) bm!20))

(assert (= (and d!1512 res!4706) b!3099))

(assert (= (and b!3099 res!4707) b!3095))

(assert (= (and b!3095 res!4709) b!3100))

(assert (= (and b!3100 res!4711) b!3098))

(assert (= (and b!3098 res!4710) b!3101))

(assert (= (and b!3101 res!4708) b!3096))

(declare-fun m!3041 () Bool)

(assert (=> b!3102 m!3041))

(declare-fun m!3043 () Bool)

(assert (=> b!3102 m!3043))

(declare-fun m!3045 () Bool)

(assert (=> b!3100 m!3045))

(declare-fun m!3047 () Bool)

(assert (=> b!3096 m!3047))

(declare-fun m!3049 () Bool)

(assert (=> b!3099 m!3049))

(declare-fun m!3051 () Bool)

(assert (=> b!3097 m!3051))

(declare-fun m!3053 () Bool)

(assert (=> b!3097 m!3053))

(declare-fun m!3055 () Bool)

(assert (=> b!3097 m!3055))

(declare-fun m!3057 () Bool)

(assert (=> b!3097 m!3057))

(declare-fun m!3059 () Bool)

(assert (=> b!3097 m!3059))

(declare-fun m!3061 () Bool)

(assert (=> b!3097 m!3061))

(declare-fun m!3063 () Bool)

(assert (=> b!3097 m!3063))

(assert (=> b!3097 m!3053))

(declare-fun m!3065 () Bool)

(assert (=> b!3097 m!3065))

(declare-fun m!3067 () Bool)

(assert (=> b!3097 m!3067))

(declare-fun m!3069 () Bool)

(assert (=> b!3097 m!3069))

(declare-fun m!3071 () Bool)

(assert (=> b!3097 m!3071))

(declare-fun m!3073 () Bool)

(assert (=> b!3097 m!3073))

(declare-fun m!3075 () Bool)

(assert (=> b!3097 m!3075))

(declare-fun m!3077 () Bool)

(assert (=> b!3097 m!3077))

(declare-fun m!3079 () Bool)

(assert (=> b!3097 m!3079))

(declare-fun m!3081 () Bool)

(assert (=> b!3097 m!3081))

(declare-fun m!3083 () Bool)

(assert (=> b!3097 m!3083))

(declare-fun m!3085 () Bool)

(assert (=> b!3097 m!3085))

(declare-fun m!3087 () Bool)

(assert (=> b!3097 m!3087))

(declare-fun m!3089 () Bool)

(assert (=> b!3097 m!3089))

(assert (=> b!3097 m!3087))

(declare-fun m!3091 () Bool)

(assert (=> b!3097 m!3091))

(declare-fun m!3093 () Bool)

(assert (=> b!3097 m!3093))

(declare-fun m!3095 () Bool)

(assert (=> b!3097 m!3095))

(declare-fun m!3097 () Bool)

(assert (=> b!3097 m!3097))

(assert (=> b!3097 m!2897))

(declare-fun m!3099 () Bool)

(assert (=> b!3097 m!3099))

(declare-fun m!3101 () Bool)

(assert (=> b!3097 m!3101))

(declare-fun m!3103 () Bool)

(assert (=> b!3097 m!3103))

(declare-fun m!3105 () Bool)

(assert (=> b!3097 m!3105))

(assert (=> b!3097 m!3069))

(declare-fun m!3107 () Bool)

(assert (=> b!3097 m!3107))

(assert (=> b!3097 m!3091))

(declare-fun m!3109 () Bool)

(assert (=> b!3097 m!3109))

(declare-fun m!3111 () Bool)

(assert (=> b!3097 m!3111))

(declare-fun m!3113 () Bool)

(assert (=> d!1512 m!3113))

(assert (=> d!1512 m!2897))

(declare-fun m!3115 () Bool)

(assert (=> d!1512 m!3115))

(declare-fun m!3117 () Bool)

(assert (=> d!1512 m!3117))

(declare-fun m!3119 () Bool)

(assert (=> bm!20 m!3119))

(declare-fun m!3121 () Bool)

(assert (=> b!3101 m!3121))

(declare-fun m!3123 () Bool)

(assert (=> b!3101 m!3123))

(declare-fun m!3125 () Bool)

(assert (=> b!3101 m!3125))

(declare-fun m!3127 () Bool)

(assert (=> b!3101 m!3127))

(declare-fun m!3129 () Bool)

(assert (=> b!3101 m!3129))

(assert (=> b!2945 d!1512))

(declare-fun d!1550 () Bool)

(assert (=> d!1550 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 thiss!1486))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!110 (buf!422 thiss!1486))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486))) nBits!460))))

(declare-fun bs!581 () Bool)

(assert (= bs!581 d!1550))

(assert (=> bs!581 m!2937))

(assert (=> b!2940 d!1550))

(declare-fun d!1552 () Bool)

(assert (=> d!1552 (= (array_inv!105 (buf!422 thiss!1486)) (bvsge (size!110 (buf!422 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!2941 d!1552))

(declare-fun b!3133 () Bool)

(declare-fun res!4738 () Bool)

(declare-fun e!2131 () Bool)

(assert (=> b!3133 (=> (not res!4738) (not e!2131))))

(declare-fun lt!3257 () tuple2!294)

(assert (=> b!3133 (= res!4738 (bvsle (currentByte!1383 (_1!155 lt!2675)) (currentByte!1383 (_2!154 lt!3257))))))

(declare-fun d!1554 () Bool)

(assert (=> d!1554 e!2131))

(declare-fun res!4735 () Bool)

(assert (=> d!1554 (=> (not res!4735) (not e!2131))))

(assert (=> d!1554 (= res!4735 (= (buf!422 (_2!154 lt!3257)) (buf!422 (_1!155 lt!2675))))))

(declare-datatypes ((tuple3!18 0))(
  ( (tuple3!19 (_1!161 Unit!198) (_2!161 BitStream!198) (_3!9 array!266)) )
))
(declare-fun lt!3258 () tuple3!18)

(assert (=> d!1554 (= lt!3257 (tuple2!295 (_3!9 lt!3258) (_2!161 lt!3258)))))

(declare-fun readBitsLoop!0 (BitStream!198 (_ BitVec 64) array!266 (_ BitVec 64) (_ BitVec 64)) tuple3!18)

(assert (=> d!1554 (= lt!3258 (readBitsLoop!0 (_1!155 lt!2675) nBits!460 (array!267 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1554 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1554 (= (readBits!0 (_1!155 lt!2675) nBits!460) lt!3257)))

(declare-fun b!3134 () Bool)

(declare-fun res!4736 () Bool)

(assert (=> b!3134 (=> (not res!4736) (not e!2131))))

(declare-fun lt!3260 () (_ BitVec 64))

(assert (=> b!3134 (= res!4736 (= (size!110 (_1!154 lt!3257)) ((_ extract 31 0) lt!3260)))))

(assert (=> b!3134 (and (bvslt lt!3260 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!3260 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!3265 () (_ BitVec 64))

(declare-fun lt!3261 () (_ BitVec 64))

(assert (=> b!3134 (= lt!3260 (bvsdiv lt!3265 lt!3261))))

(assert (=> b!3134 (and (not (= lt!3261 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!3265 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!3261 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!3134 (= lt!3261 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!3264 () (_ BitVec 64))

(declare-fun lt!3259 () (_ BitVec 64))

(assert (=> b!3134 (= lt!3265 (bvsub lt!3264 lt!3259))))

(assert (=> b!3134 (or (= (bvand lt!3264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3259 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3264 lt!3259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3134 (= lt!3259 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3262 () (_ BitVec 64))

(assert (=> b!3134 (= lt!3264 (bvadd nBits!460 lt!3262))))

(assert (=> b!3134 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3262 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!3262) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3134 (= lt!3262 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!3135 () Bool)

(declare-fun res!4734 () Bool)

(assert (=> b!3135 (=> (not res!4734) (not e!2131))))

(declare-fun lt!3263 () (_ BitVec 64))

(assert (=> b!3135 (= res!4734 (= (bvadd lt!3263 nBits!460) (bitIndex!0 (size!110 (buf!422 (_2!154 lt!3257))) (currentByte!1383 (_2!154 lt!3257)) (currentBit!1378 (_2!154 lt!3257)))))))

(assert (=> b!3135 (or (not (= (bvand lt!3263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!3263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!3263 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3135 (= lt!3263 (bitIndex!0 (size!110 (buf!422 (_1!155 lt!2675))) (currentByte!1383 (_1!155 lt!2675)) (currentBit!1378 (_1!155 lt!2675))))))

(declare-fun b!3136 () Bool)

(declare-fun res!4737 () Bool)

(assert (=> b!3136 (=> (not res!4737) (not e!2131))))

(assert (=> b!3136 (= res!4737 (invariant!0 (currentBit!1378 (_2!154 lt!3257)) (currentByte!1383 (_2!154 lt!3257)) (size!110 (buf!422 (_2!154 lt!3257)))))))

(declare-fun b!3137 () Bool)

(assert (=> b!3137 (= e!2131 (= (byteArrayBitContentToList!0 (_2!154 lt!3257) (_1!154 lt!3257) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!154 lt!3257) (_1!155 lt!2675) nBits!460)))))

(assert (= (and d!1554 res!4735) b!3135))

(assert (= (and b!3135 res!4734) b!3136))

(assert (= (and b!3136 res!4737) b!3134))

(assert (= (and b!3134 res!4736) b!3133))

(assert (= (and b!3133 res!4738) b!3137))

(declare-fun m!3131 () Bool)

(assert (=> d!1554 m!3131))

(declare-fun m!3133 () Bool)

(assert (=> b!3135 m!3133))

(declare-fun m!3135 () Bool)

(assert (=> b!3135 m!3135))

(declare-fun m!3137 () Bool)

(assert (=> b!3136 m!3137))

(declare-fun m!3139 () Bool)

(assert (=> b!3137 m!3139))

(declare-fun m!3141 () Bool)

(assert (=> b!3137 m!3141))

(assert (=> b!2943 d!1554))

(declare-fun d!1556 () Bool)

(assert (=> d!1556 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!2678)))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!2678)))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486))) nBits!460))))

(declare-fun bs!582 () Bool)

(assert (= bs!582 d!1556))

(declare-fun m!3143 () Bool)

(assert (=> bs!582 m!3143))

(assert (=> b!2943 d!1556))

(declare-fun d!1558 () Bool)

(assert (=> d!1558 (validate_offset_bits!1 ((_ sign_extend 32) (size!110 (buf!422 (_2!153 lt!2678)))) ((_ sign_extend 32) (currentByte!1383 thiss!1486)) ((_ sign_extend 32) (currentBit!1378 thiss!1486)) nBits!460)))

(declare-fun lt!3280 () Unit!198)

(declare-fun choose!9 (BitStream!198 array!266 (_ BitVec 64) BitStream!198) Unit!198)

(assert (=> d!1558 (= lt!3280 (choose!9 thiss!1486 (buf!422 (_2!153 lt!2678)) nBits!460 (BitStream!199 (buf!422 (_2!153 lt!2678)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486))))))

(assert (=> d!1558 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!422 (_2!153 lt!2678)) nBits!460) lt!3280)))

(declare-fun bs!583 () Bool)

(assert (= bs!583 d!1558))

(assert (=> bs!583 m!2881))

(declare-fun m!3145 () Bool)

(assert (=> bs!583 m!3145))

(assert (=> b!2943 d!1558))

(declare-fun b!3176 () Bool)

(declare-fun e!2146 () Unit!198)

(declare-fun lt!3424 () Unit!198)

(assert (=> b!3176 (= e!2146 lt!3424)))

(declare-fun lt!3410 () (_ BitVec 64))

(assert (=> b!3176 (= lt!3410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!3419 () (_ BitVec 64))

(assert (=> b!3176 (= lt!3419 (bitIndex!0 (size!110 (buf!422 thiss!1486)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!266 array!266 (_ BitVec 64) (_ BitVec 64)) Unit!198)

(assert (=> b!3176 (= lt!3424 (arrayBitRangesEqSymmetric!0 (buf!422 thiss!1486) (buf!422 (_2!153 lt!2678)) lt!3410 lt!3419))))

(assert (=> b!3176 (arrayBitRangesEq!0 (buf!422 (_2!153 lt!2678)) (buf!422 thiss!1486) lt!3410 lt!3419)))

(declare-fun lt!3418 () (_ BitVec 64))

(declare-fun b!3177 () Bool)

(declare-fun lt!3427 () (_ BitVec 64))

(declare-fun lt!3417 () tuple2!296)

(declare-fun e!2147 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!198 (_ BitVec 64)) BitStream!198)

(assert (=> b!3177 (= e!2147 (= (_1!155 lt!3417) (withMovedBitIndex!0 (_2!155 lt!3417) (bvsub lt!3427 lt!3418))))))

(assert (=> b!3177 (or (= (bvand lt!3427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3418 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3427 lt!3418) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3177 (= lt!3418 (bitIndex!0 (size!110 (buf!422 (_2!153 lt!2678))) (currentByte!1383 (_2!153 lt!2678)) (currentBit!1378 (_2!153 lt!2678))))))

(assert (=> b!3177 (= lt!3427 (bitIndex!0 (size!110 (buf!422 thiss!1486)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486)))))

(declare-fun b!3178 () Bool)

(declare-fun res!4770 () Bool)

(assert (=> b!3178 (=> (not res!4770) (not e!2147))))

(assert (=> b!3178 (= res!4770 (isPrefixOf!0 (_1!155 lt!3417) thiss!1486))))

(declare-fun b!3179 () Bool)

(declare-fun Unit!223 () Unit!198)

(assert (=> b!3179 (= e!2146 Unit!223)))

(declare-fun b!3180 () Bool)

(declare-fun res!4771 () Bool)

(assert (=> b!3180 (=> (not res!4771) (not e!2147))))

(assert (=> b!3180 (= res!4771 (isPrefixOf!0 (_2!155 lt!3417) (_2!153 lt!2678)))))

(declare-fun d!1560 () Bool)

(assert (=> d!1560 e!2147))

(declare-fun res!4769 () Bool)

(assert (=> d!1560 (=> (not res!4769) (not e!2147))))

(assert (=> d!1560 (= res!4769 (isPrefixOf!0 (_1!155 lt!3417) (_2!155 lt!3417)))))

(declare-fun lt!3421 () BitStream!198)

(assert (=> d!1560 (= lt!3417 (tuple2!297 lt!3421 (_2!153 lt!2678)))))

(declare-fun lt!3428 () Unit!198)

(declare-fun lt!3415 () Unit!198)

(assert (=> d!1560 (= lt!3428 lt!3415)))

(assert (=> d!1560 (isPrefixOf!0 lt!3421 (_2!153 lt!2678))))

(assert (=> d!1560 (= lt!3415 (lemmaIsPrefixTransitive!0 lt!3421 (_2!153 lt!2678) (_2!153 lt!2678)))))

(declare-fun lt!3413 () Unit!198)

(declare-fun lt!3423 () Unit!198)

(assert (=> d!1560 (= lt!3413 lt!3423)))

(assert (=> d!1560 (isPrefixOf!0 lt!3421 (_2!153 lt!2678))))

(assert (=> d!1560 (= lt!3423 (lemmaIsPrefixTransitive!0 lt!3421 thiss!1486 (_2!153 lt!2678)))))

(declare-fun lt!3422 () Unit!198)

(assert (=> d!1560 (= lt!3422 e!2146)))

(declare-fun c!134 () Bool)

(assert (=> d!1560 (= c!134 (not (= (size!110 (buf!422 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!3425 () Unit!198)

(declare-fun lt!3412 () Unit!198)

(assert (=> d!1560 (= lt!3425 lt!3412)))

(assert (=> d!1560 (isPrefixOf!0 (_2!153 lt!2678) (_2!153 lt!2678))))

(assert (=> d!1560 (= lt!3412 (lemmaIsPrefixRefl!0 (_2!153 lt!2678)))))

(declare-fun lt!3409 () Unit!198)

(declare-fun lt!3416 () Unit!198)

(assert (=> d!1560 (= lt!3409 lt!3416)))

(assert (=> d!1560 (= lt!3416 (lemmaIsPrefixRefl!0 (_2!153 lt!2678)))))

(declare-fun lt!3426 () Unit!198)

(declare-fun lt!3420 () Unit!198)

(assert (=> d!1560 (= lt!3426 lt!3420)))

(assert (=> d!1560 (isPrefixOf!0 lt!3421 lt!3421)))

(assert (=> d!1560 (= lt!3420 (lemmaIsPrefixRefl!0 lt!3421))))

(declare-fun lt!3411 () Unit!198)

(declare-fun lt!3414 () Unit!198)

(assert (=> d!1560 (= lt!3411 lt!3414)))

(assert (=> d!1560 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1560 (= lt!3414 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1560 (= lt!3421 (BitStream!199 (buf!422 (_2!153 lt!2678)) (currentByte!1383 thiss!1486) (currentBit!1378 thiss!1486)))))

(assert (=> d!1560 (isPrefixOf!0 thiss!1486 (_2!153 lt!2678))))

(assert (=> d!1560 (= (reader!0 thiss!1486 (_2!153 lt!2678)) lt!3417)))

(assert (= (and d!1560 c!134) b!3176))

(assert (= (and d!1560 (not c!134)) b!3179))

(assert (= (and d!1560 res!4769) b!3178))

(assert (= (and b!3178 res!4770) b!3180))

(assert (= (and b!3180 res!4771) b!3177))

(assert (=> d!1560 m!3117))

(declare-fun m!3319 () Bool)

(assert (=> d!1560 m!3319))

(declare-fun m!3321 () Bool)

(assert (=> d!1560 m!3321))

(declare-fun m!3323 () Bool)

(assert (=> d!1560 m!3323))

(declare-fun m!3325 () Bool)

(assert (=> d!1560 m!3325))

(declare-fun m!3327 () Bool)

(assert (=> d!1560 m!3327))

(assert (=> d!1560 m!2873))

(declare-fun m!3329 () Bool)

(assert (=> d!1560 m!3329))

(declare-fun m!3331 () Bool)

(assert (=> d!1560 m!3331))

(declare-fun m!3333 () Bool)

(assert (=> d!1560 m!3333))

(assert (=> d!1560 m!3115))

(declare-fun m!3335 () Bool)

(assert (=> b!3177 m!3335))

(assert (=> b!3177 m!2895))

(assert (=> b!3177 m!2897))

(declare-fun m!3337 () Bool)

(assert (=> b!3178 m!3337))

(assert (=> b!3176 m!2897))

(declare-fun m!3339 () Bool)

(assert (=> b!3176 m!3339))

(declare-fun m!3341 () Bool)

(assert (=> b!3176 m!3341))

(declare-fun m!3343 () Bool)

(assert (=> b!3180 m!3343))

(assert (=> b!2943 d!1560))

(check-sat (not b!3178) (not b!3096) (not b!3101) (not b!3100) (not d!1512) (not d!1494) (not d!1502) (not b!3180) (not bm!20) (not d!1560) (not d!1556) (not b!2984) (not d!1506) (not b!2982) (not b!3177) (not d!1550) (not b!3099) (not b!3136) (not b!3137) (not b!3102) (not d!1558) (not b!3135) (not b!3097) (not d!1554) (not b!3176))
(check-sat)
