; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22622 () Bool)

(assert start!22622)

(declare-fun b!114308 () Bool)

(declare-fun res!94446 () Bool)

(declare-fun e!74955 () Bool)

(assert (=> b!114308 (=> (not res!94446) (not e!74955))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114308 (= res!94446 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!114309 () Bool)

(declare-fun res!94440 () Bool)

(assert (=> b!114309 (=> (not res!94440) (not e!74955))))

(declare-datatypes ((array!5185 0))(
  ( (array!5186 (arr!2947 (Array (_ BitVec 32) (_ BitVec 8))) (size!2354 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4182 0))(
  ( (BitStream!4183 (buf!2762 array!5185) (currentByte!5369 (_ BitVec 32)) (currentBit!5364 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4182)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114309 (= res!94440 (validate_offset_bits!1 ((_ sign_extend 32) (size!2354 (buf!2762 thiss!1305))) ((_ sign_extend 32) (currentByte!5369 thiss!1305)) ((_ sign_extend 32) (currentBit!5364 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!114311 () Bool)

(declare-fun res!94448 () Bool)

(declare-fun e!74957 () Bool)

(assert (=> b!114311 (=> (not res!94448) (not e!74957))))

(declare-datatypes ((Unit!7029 0))(
  ( (Unit!7030) )
))
(declare-datatypes ((tuple2!9430 0))(
  ( (tuple2!9431 (_1!4977 Unit!7029) (_2!4977 BitStream!4182)) )
))
(declare-fun lt!173887 () tuple2!9430)

(declare-fun isPrefixOf!0 (BitStream!4182 BitStream!4182) Bool)

(assert (=> b!114311 (= res!94448 (isPrefixOf!0 thiss!1305 (_2!4977 lt!173887)))))

(declare-fun b!114312 () Bool)

(declare-fun e!74958 () Bool)

(declare-datatypes ((tuple2!9432 0))(
  ( (tuple2!9433 (_1!4978 BitStream!4182) (_2!4978 Bool)) )
))
(declare-fun lt!173883 () tuple2!9432)

(declare-fun lt!173886 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114312 (= e!74958 (= (bitIndex!0 (size!2354 (buf!2762 (_1!4978 lt!173883))) (currentByte!5369 (_1!4978 lt!173883)) (currentBit!5364 (_1!4978 lt!173883))) lt!173886))))

(declare-fun b!114313 () Bool)

(declare-fun e!74959 () Bool)

(assert (=> b!114313 (= e!74959 e!74957)))

(declare-fun res!94444 () Bool)

(assert (=> b!114313 (=> (not res!94444) (not e!74957))))

(declare-fun lt!173882 () (_ BitVec 64))

(assert (=> b!114313 (= res!94444 (= lt!173886 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!173882)))))

(assert (=> b!114313 (= lt!173886 (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 (_2!4977 lt!173887)) (currentBit!5364 (_2!4977 lt!173887))))))

(assert (=> b!114313 (= lt!173882 (bitIndex!0 (size!2354 (buf!2762 thiss!1305)) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)))))

(declare-fun b!114314 () Bool)

(declare-fun e!74960 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114314 (= e!74960 (invariant!0 (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305) (size!2354 (buf!2762 (_2!4977 lt!173887)))))))

(declare-fun b!114315 () Bool)

(declare-fun e!74954 () Bool)

(assert (=> b!114315 (= e!74955 (not e!74954))))

(declare-fun res!94447 () Bool)

(assert (=> b!114315 (=> res!94447 e!74954)))

(declare-fun lt!173884 () tuple2!9430)

(assert (=> b!114315 (= res!94447 (not (= (size!2354 (buf!2762 (_2!4977 lt!173887))) (size!2354 (buf!2762 (_2!4977 lt!173884))))))))

(assert (=> b!114315 e!74960))

(declare-fun res!94439 () Bool)

(assert (=> b!114315 (=> (not res!94439) (not e!74960))))

(assert (=> b!114315 (= res!94439 (isPrefixOf!0 thiss!1305 (_2!4977 lt!173884)))))

(declare-fun lt!173888 () Unit!7029)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4182 BitStream!4182 BitStream!4182) Unit!7029)

(assert (=> b!114315 (= lt!173888 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4977 lt!173887) (_2!4977 lt!173884)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4182 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9430)

(assert (=> b!114315 (= lt!173884 (appendNLeastSignificantBitsLoop!0 (_2!4977 lt!173887) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!114315 e!74959))

(declare-fun res!94438 () Bool)

(assert (=> b!114315 (=> (not res!94438) (not e!74959))))

(assert (=> b!114315 (= res!94438 (= (size!2354 (buf!2762 thiss!1305)) (size!2354 (buf!2762 (_2!4977 lt!173887)))))))

(declare-fun lt!173885 () Bool)

(declare-fun appendBit!0 (BitStream!4182 Bool) tuple2!9430)

(assert (=> b!114315 (= lt!173887 (appendBit!0 thiss!1305 lt!173885))))

(assert (=> b!114315 (= lt!173885 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114316 () Bool)

(declare-fun res!94441 () Bool)

(assert (=> b!114316 (=> (not res!94441) (not e!74955))))

(assert (=> b!114316 (= res!94441 (bvslt i!615 nBits!396))))

(declare-fun b!114317 () Bool)

(declare-fun res!94445 () Bool)

(assert (=> b!114317 (=> res!94445 e!74954)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114317 (= res!94445 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!173887)))) ((_ sign_extend 32) (currentByte!5369 thiss!1305)) ((_ sign_extend 32) (currentBit!5364 thiss!1305)))))))

(declare-fun b!114318 () Bool)

(assert (=> b!114318 (= e!74957 e!74958)))

(declare-fun res!94443 () Bool)

(assert (=> b!114318 (=> (not res!94443) (not e!74958))))

(assert (=> b!114318 (= res!94443 (and (= (_2!4978 lt!173883) lt!173885) (= (_1!4978 lt!173883) (_2!4977 lt!173887))))))

(declare-fun readBitPure!0 (BitStream!4182) tuple2!9432)

(declare-fun readerFrom!0 (BitStream!4182 (_ BitVec 32) (_ BitVec 32)) BitStream!4182)

(assert (=> b!114318 (= lt!173883 (readBitPure!0 (readerFrom!0 (_2!4977 lt!173887) (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305))))))

(declare-fun b!114319 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5185 array!5185 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114319 (= e!74954 (arrayBitRangesEq!0 (buf!2762 (_2!4977 lt!173887)) (buf!2762 (_2!4977 lt!173884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)))))))

(declare-fun b!114310 () Bool)

(declare-fun e!74956 () Bool)

(declare-fun array_inv!2156 (array!5185) Bool)

(assert (=> b!114310 (= e!74956 (array_inv!2156 (buf!2762 thiss!1305)))))

(declare-fun res!94442 () Bool)

(assert (=> start!22622 (=> (not res!94442) (not e!74955))))

(assert (=> start!22622 (= res!94442 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22622 e!74955))

(assert (=> start!22622 true))

(declare-fun inv!12 (BitStream!4182) Bool)

(assert (=> start!22622 (and (inv!12 thiss!1305) e!74956)))

(assert (= (and start!22622 res!94442) b!114309))

(assert (= (and b!114309 res!94440) b!114308))

(assert (= (and b!114308 res!94446) b!114316))

(assert (= (and b!114316 res!94441) b!114315))

(assert (= (and b!114315 res!94438) b!114313))

(assert (= (and b!114313 res!94444) b!114311))

(assert (= (and b!114311 res!94448) b!114318))

(assert (= (and b!114318 res!94443) b!114312))

(assert (= (and b!114315 res!94439) b!114314))

(assert (= (and b!114315 (not res!94447)) b!114317))

(assert (= (and b!114317 (not res!94445)) b!114319))

(assert (= start!22622 b!114310))

(declare-fun m!170683 () Bool)

(assert (=> b!114315 m!170683))

(declare-fun m!170685 () Bool)

(assert (=> b!114315 m!170685))

(declare-fun m!170687 () Bool)

(assert (=> b!114315 m!170687))

(declare-fun m!170689 () Bool)

(assert (=> b!114315 m!170689))

(declare-fun m!170691 () Bool)

(assert (=> b!114317 m!170691))

(declare-fun m!170693 () Bool)

(assert (=> b!114310 m!170693))

(declare-fun m!170695 () Bool)

(assert (=> start!22622 m!170695))

(declare-fun m!170697 () Bool)

(assert (=> b!114312 m!170697))

(declare-fun m!170699 () Bool)

(assert (=> b!114311 m!170699))

(declare-fun m!170701 () Bool)

(assert (=> b!114318 m!170701))

(assert (=> b!114318 m!170701))

(declare-fun m!170703 () Bool)

(assert (=> b!114318 m!170703))

(declare-fun m!170705 () Bool)

(assert (=> b!114308 m!170705))

(declare-fun m!170707 () Bool)

(assert (=> b!114314 m!170707))

(declare-fun m!170709 () Bool)

(assert (=> b!114319 m!170709))

(declare-fun m!170711 () Bool)

(assert (=> b!114319 m!170711))

(declare-fun m!170713 () Bool)

(assert (=> b!114309 m!170713))

(declare-fun m!170715 () Bool)

(assert (=> b!114313 m!170715))

(declare-fun m!170717 () Bool)

(assert (=> b!114313 m!170717))

(check-sat (not b!114313) (not b!114315) (not b!114319) (not b!114318) (not start!22622) (not b!114314) (not b!114311) (not b!114317) (not b!114309) (not b!114308) (not b!114310) (not b!114312))
(check-sat)
(get-model)

(declare-fun d!36676 () Bool)

(declare-fun e!74988 () Bool)

(assert (=> d!36676 e!74988))

(declare-fun res!94487 () Bool)

(assert (=> d!36676 (=> (not res!94487) (not e!74988))))

(declare-fun lt!173922 () (_ BitVec 64))

(declare-fun lt!173923 () (_ BitVec 64))

(declare-fun lt!173926 () (_ BitVec 64))

(assert (=> d!36676 (= res!94487 (= lt!173926 (bvsub lt!173922 lt!173923)))))

(assert (=> d!36676 (or (= (bvand lt!173922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173922 lt!173923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36676 (= lt!173923 (remainingBits!0 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!173887)))) ((_ sign_extend 32) (currentByte!5369 (_2!4977 lt!173887))) ((_ sign_extend 32) (currentBit!5364 (_2!4977 lt!173887)))))))

(declare-fun lt!173925 () (_ BitVec 64))

(declare-fun lt!173927 () (_ BitVec 64))

(assert (=> d!36676 (= lt!173922 (bvmul lt!173925 lt!173927))))

(assert (=> d!36676 (or (= lt!173925 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173927 (bvsdiv (bvmul lt!173925 lt!173927) lt!173925)))))

(assert (=> d!36676 (= lt!173927 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36676 (= lt!173925 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!173887)))))))

(assert (=> d!36676 (= lt!173926 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5369 (_2!4977 lt!173887))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5364 (_2!4977 lt!173887)))))))

(assert (=> d!36676 (invariant!0 (currentBit!5364 (_2!4977 lt!173887)) (currentByte!5369 (_2!4977 lt!173887)) (size!2354 (buf!2762 (_2!4977 lt!173887))))))

(assert (=> d!36676 (= (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 (_2!4977 lt!173887)) (currentBit!5364 (_2!4977 lt!173887))) lt!173926)))

(declare-fun b!114360 () Bool)

(declare-fun res!94486 () Bool)

(assert (=> b!114360 (=> (not res!94486) (not e!74988))))

(assert (=> b!114360 (= res!94486 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173926))))

(declare-fun b!114361 () Bool)

(declare-fun lt!173924 () (_ BitVec 64))

(assert (=> b!114361 (= e!74988 (bvsle lt!173926 (bvmul lt!173924 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114361 (or (= lt!173924 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173924 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173924)))))

(assert (=> b!114361 (= lt!173924 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!173887)))))))

(assert (= (and d!36676 res!94487) b!114360))

(assert (= (and b!114360 res!94486) b!114361))

(declare-fun m!170755 () Bool)

(assert (=> d!36676 m!170755))

(declare-fun m!170757 () Bool)

(assert (=> d!36676 m!170757))

(assert (=> b!114313 d!36676))

(declare-fun d!36678 () Bool)

(declare-fun e!74989 () Bool)

(assert (=> d!36678 e!74989))

(declare-fun res!94489 () Bool)

(assert (=> d!36678 (=> (not res!94489) (not e!74989))))

(declare-fun lt!173929 () (_ BitVec 64))

(declare-fun lt!173928 () (_ BitVec 64))

(declare-fun lt!173932 () (_ BitVec 64))

(assert (=> d!36678 (= res!94489 (= lt!173932 (bvsub lt!173928 lt!173929)))))

(assert (=> d!36678 (or (= (bvand lt!173928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173929 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173928 lt!173929) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36678 (= lt!173929 (remainingBits!0 ((_ sign_extend 32) (size!2354 (buf!2762 thiss!1305))) ((_ sign_extend 32) (currentByte!5369 thiss!1305)) ((_ sign_extend 32) (currentBit!5364 thiss!1305))))))

(declare-fun lt!173931 () (_ BitVec 64))

(declare-fun lt!173933 () (_ BitVec 64))

(assert (=> d!36678 (= lt!173928 (bvmul lt!173931 lt!173933))))

(assert (=> d!36678 (or (= lt!173931 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173933 (bvsdiv (bvmul lt!173931 lt!173933) lt!173931)))))

(assert (=> d!36678 (= lt!173933 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36678 (= lt!173931 ((_ sign_extend 32) (size!2354 (buf!2762 thiss!1305))))))

(assert (=> d!36678 (= lt!173932 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5369 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5364 thiss!1305))))))

(assert (=> d!36678 (invariant!0 (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305) (size!2354 (buf!2762 thiss!1305)))))

(assert (=> d!36678 (= (bitIndex!0 (size!2354 (buf!2762 thiss!1305)) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)) lt!173932)))

(declare-fun b!114362 () Bool)

(declare-fun res!94488 () Bool)

(assert (=> b!114362 (=> (not res!94488) (not e!74989))))

(assert (=> b!114362 (= res!94488 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173932))))

(declare-fun b!114363 () Bool)

(declare-fun lt!173930 () (_ BitVec 64))

(assert (=> b!114363 (= e!74989 (bvsle lt!173932 (bvmul lt!173930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114363 (or (= lt!173930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173930)))))

(assert (=> b!114363 (= lt!173930 ((_ sign_extend 32) (size!2354 (buf!2762 thiss!1305))))))

(assert (= (and d!36678 res!94489) b!114362))

(assert (= (and b!114362 res!94488) b!114363))

(declare-fun m!170759 () Bool)

(assert (=> d!36678 m!170759))

(declare-fun m!170761 () Bool)

(assert (=> d!36678 m!170761))

(assert (=> b!114313 d!36678))

(declare-fun d!36680 () Bool)

(declare-fun e!74990 () Bool)

(assert (=> d!36680 e!74990))

(declare-fun res!94491 () Bool)

(assert (=> d!36680 (=> (not res!94491) (not e!74990))))

(declare-fun lt!173938 () (_ BitVec 64))

(declare-fun lt!173935 () (_ BitVec 64))

(declare-fun lt!173934 () (_ BitVec 64))

(assert (=> d!36680 (= res!94491 (= lt!173938 (bvsub lt!173934 lt!173935)))))

(assert (=> d!36680 (or (= (bvand lt!173934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173935 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173934 lt!173935) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36680 (= lt!173935 (remainingBits!0 ((_ sign_extend 32) (size!2354 (buf!2762 (_1!4978 lt!173883)))) ((_ sign_extend 32) (currentByte!5369 (_1!4978 lt!173883))) ((_ sign_extend 32) (currentBit!5364 (_1!4978 lt!173883)))))))

(declare-fun lt!173937 () (_ BitVec 64))

(declare-fun lt!173939 () (_ BitVec 64))

(assert (=> d!36680 (= lt!173934 (bvmul lt!173937 lt!173939))))

(assert (=> d!36680 (or (= lt!173937 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173939 (bvsdiv (bvmul lt!173937 lt!173939) lt!173937)))))

(assert (=> d!36680 (= lt!173939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36680 (= lt!173937 ((_ sign_extend 32) (size!2354 (buf!2762 (_1!4978 lt!173883)))))))

(assert (=> d!36680 (= lt!173938 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5369 (_1!4978 lt!173883))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5364 (_1!4978 lt!173883)))))))

(assert (=> d!36680 (invariant!0 (currentBit!5364 (_1!4978 lt!173883)) (currentByte!5369 (_1!4978 lt!173883)) (size!2354 (buf!2762 (_1!4978 lt!173883))))))

(assert (=> d!36680 (= (bitIndex!0 (size!2354 (buf!2762 (_1!4978 lt!173883))) (currentByte!5369 (_1!4978 lt!173883)) (currentBit!5364 (_1!4978 lt!173883))) lt!173938)))

(declare-fun b!114364 () Bool)

(declare-fun res!94490 () Bool)

(assert (=> b!114364 (=> (not res!94490) (not e!74990))))

(assert (=> b!114364 (= res!94490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173938))))

(declare-fun b!114365 () Bool)

(declare-fun lt!173936 () (_ BitVec 64))

(assert (=> b!114365 (= e!74990 (bvsle lt!173938 (bvmul lt!173936 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114365 (or (= lt!173936 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173936 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173936)))))

(assert (=> b!114365 (= lt!173936 ((_ sign_extend 32) (size!2354 (buf!2762 (_1!4978 lt!173883)))))))

(assert (= (and d!36680 res!94491) b!114364))

(assert (= (and b!114364 res!94490) b!114365))

(declare-fun m!170763 () Bool)

(assert (=> d!36680 m!170763))

(declare-fun m!170765 () Bool)

(assert (=> d!36680 m!170765))

(assert (=> b!114312 d!36680))

(declare-fun d!36682 () Bool)

(assert (=> d!36682 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305) (size!2354 (buf!2762 thiss!1305))))))

(declare-fun bs!8904 () Bool)

(assert (= bs!8904 d!36682))

(assert (=> bs!8904 m!170761))

(assert (=> start!22622 d!36682))

(declare-fun d!36684 () Bool)

(declare-fun res!94498 () Bool)

(declare-fun e!74996 () Bool)

(assert (=> d!36684 (=> (not res!94498) (not e!74996))))

(assert (=> d!36684 (= res!94498 (= (size!2354 (buf!2762 thiss!1305)) (size!2354 (buf!2762 (_2!4977 lt!173887)))))))

(assert (=> d!36684 (= (isPrefixOf!0 thiss!1305 (_2!4977 lt!173887)) e!74996)))

(declare-fun b!114372 () Bool)

(declare-fun res!94500 () Bool)

(assert (=> b!114372 (=> (not res!94500) (not e!74996))))

(assert (=> b!114372 (= res!94500 (bvsle (bitIndex!0 (size!2354 (buf!2762 thiss!1305)) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)) (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 (_2!4977 lt!173887)) (currentBit!5364 (_2!4977 lt!173887)))))))

(declare-fun b!114373 () Bool)

(declare-fun e!74995 () Bool)

(assert (=> b!114373 (= e!74996 e!74995)))

(declare-fun res!94499 () Bool)

(assert (=> b!114373 (=> res!94499 e!74995)))

(assert (=> b!114373 (= res!94499 (= (size!2354 (buf!2762 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114374 () Bool)

(assert (=> b!114374 (= e!74995 (arrayBitRangesEq!0 (buf!2762 thiss!1305) (buf!2762 (_2!4977 lt!173887)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2354 (buf!2762 thiss!1305)) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305))))))

(assert (= (and d!36684 res!94498) b!114372))

(assert (= (and b!114372 res!94500) b!114373))

(assert (= (and b!114373 (not res!94499)) b!114374))

(assert (=> b!114372 m!170717))

(assert (=> b!114372 m!170715))

(assert (=> b!114374 m!170717))

(assert (=> b!114374 m!170717))

(declare-fun m!170767 () Bool)

(assert (=> b!114374 m!170767))

(assert (=> b!114311 d!36684))

(declare-fun d!36686 () Bool)

(assert (=> d!36686 (= (array_inv!2156 (buf!2762 thiss!1305)) (bvsge (size!2354 (buf!2762 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!114310 d!36686))

(declare-fun d!36688 () Bool)

(assert (=> d!36688 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2354 (buf!2762 thiss!1305))) ((_ sign_extend 32) (currentByte!5369 thiss!1305)) ((_ sign_extend 32) (currentBit!5364 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2354 (buf!2762 thiss!1305))) ((_ sign_extend 32) (currentByte!5369 thiss!1305)) ((_ sign_extend 32) (currentBit!5364 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8905 () Bool)

(assert (= bs!8905 d!36688))

(assert (=> bs!8905 m!170759))

(assert (=> b!114309 d!36688))

(declare-datatypes ((tuple4!82 0))(
  ( (tuple4!83 (_1!4981 (_ BitVec 32)) (_2!4981 (_ BitVec 32)) (_3!262 (_ BitVec 32)) (_4!41 (_ BitVec 32))) )
))
(declare-fun lt!173947 () tuple4!82)

(declare-fun b!114389 () Bool)

(declare-fun e!75014 () Bool)

(declare-fun arrayRangesEq!42 (array!5185 array!5185 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114389 (= e!75014 (arrayRangesEq!42 (buf!2762 (_2!4977 lt!173887)) (buf!2762 (_2!4977 lt!173884)) (_1!4981 lt!173947) (_2!4981 lt!173947)))))

(declare-fun d!36690 () Bool)

(declare-fun res!94513 () Bool)

(declare-fun e!75009 () Bool)

(assert (=> d!36690 (=> res!94513 e!75009)))

(assert (=> d!36690 (= res!94513 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)))))))

(assert (=> d!36690 (= (arrayBitRangesEq!0 (buf!2762 (_2!4977 lt!173887)) (buf!2762 (_2!4977 lt!173884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)))) e!75009)))

(declare-fun b!114390 () Bool)

(declare-fun lt!173946 () (_ BitVec 32))

(declare-fun e!75013 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114390 (= e!75013 (byteRangesEq!0 (select (arr!2947 (buf!2762 (_2!4977 lt!173887))) (_4!41 lt!173947)) (select (arr!2947 (buf!2762 (_2!4977 lt!173884))) (_4!41 lt!173947)) #b00000000000000000000000000000000 lt!173946))))

(declare-fun b!114391 () Bool)

(declare-fun e!75010 () Bool)

(declare-fun call!1469 () Bool)

(assert (=> b!114391 (= e!75010 call!1469)))

(declare-fun b!114392 () Bool)

(declare-fun e!75011 () Bool)

(assert (=> b!114392 (= e!75011 e!75010)))

(declare-fun c!6928 () Bool)

(assert (=> b!114392 (= c!6928 (= (_3!262 lt!173947) (_4!41 lt!173947)))))

(declare-fun lt!173948 () (_ BitVec 32))

(declare-fun bm!1466 () Bool)

(assert (=> bm!1466 (= call!1469 (byteRangesEq!0 (select (arr!2947 (buf!2762 (_2!4977 lt!173887))) (_3!262 lt!173947)) (select (arr!2947 (buf!2762 (_2!4977 lt!173884))) (_3!262 lt!173947)) lt!173948 (ite c!6928 lt!173946 #b00000000000000000000000000001000)))))

(declare-fun b!114393 () Bool)

(assert (=> b!114393 (= e!75009 e!75011)))

(declare-fun res!94512 () Bool)

(assert (=> b!114393 (=> (not res!94512) (not e!75011))))

(assert (=> b!114393 (= res!94512 e!75014)))

(declare-fun res!94514 () Bool)

(assert (=> b!114393 (=> res!94514 e!75014)))

(assert (=> b!114393 (= res!94514 (bvsge (_1!4981 lt!173947) (_2!4981 lt!173947)))))

(assert (=> b!114393 (= lt!173946 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114393 (= lt!173948 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!82)

(assert (=> b!114393 (= lt!173947 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)))))))

(declare-fun b!114394 () Bool)

(declare-fun res!94511 () Bool)

(assert (=> b!114394 (= res!94511 (= lt!173946 #b00000000000000000000000000000000))))

(assert (=> b!114394 (=> res!94511 e!75013)))

(declare-fun e!75012 () Bool)

(assert (=> b!114394 (= e!75012 e!75013)))

(declare-fun b!114395 () Bool)

(assert (=> b!114395 (= e!75010 e!75012)))

(declare-fun res!94515 () Bool)

(assert (=> b!114395 (= res!94515 call!1469)))

(assert (=> b!114395 (=> (not res!94515) (not e!75012))))

(assert (= (and d!36690 (not res!94513)) b!114393))

(assert (= (and b!114393 (not res!94514)) b!114389))

(assert (= (and b!114393 res!94512) b!114392))

(assert (= (and b!114392 c!6928) b!114391))

(assert (= (and b!114392 (not c!6928)) b!114395))

(assert (= (and b!114395 res!94515) b!114394))

(assert (= (and b!114394 (not res!94511)) b!114390))

(assert (= (or b!114391 b!114395) bm!1466))

(declare-fun m!170769 () Bool)

(assert (=> b!114389 m!170769))

(declare-fun m!170771 () Bool)

(assert (=> b!114390 m!170771))

(declare-fun m!170773 () Bool)

(assert (=> b!114390 m!170773))

(assert (=> b!114390 m!170771))

(assert (=> b!114390 m!170773))

(declare-fun m!170775 () Bool)

(assert (=> b!114390 m!170775))

(declare-fun m!170777 () Bool)

(assert (=> bm!1466 m!170777))

(declare-fun m!170779 () Bool)

(assert (=> bm!1466 m!170779))

(assert (=> bm!1466 m!170777))

(assert (=> bm!1466 m!170779))

(declare-fun m!170781 () Bool)

(assert (=> bm!1466 m!170781))

(declare-fun m!170783 () Bool)

(assert (=> b!114393 m!170783))

(assert (=> b!114319 d!36690))

(declare-fun d!36694 () Bool)

(declare-fun e!75015 () Bool)

(assert (=> d!36694 e!75015))

(declare-fun res!94517 () Bool)

(assert (=> d!36694 (=> (not res!94517) (not e!75015))))

(declare-fun lt!173950 () (_ BitVec 64))

(declare-fun lt!173949 () (_ BitVec 64))

(declare-fun lt!173953 () (_ BitVec 64))

(assert (=> d!36694 (= res!94517 (= lt!173953 (bvsub lt!173949 lt!173950)))))

(assert (=> d!36694 (or (= (bvand lt!173949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173950 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173949 lt!173950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36694 (= lt!173950 (remainingBits!0 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!173887)))) ((_ sign_extend 32) (currentByte!5369 thiss!1305)) ((_ sign_extend 32) (currentBit!5364 thiss!1305))))))

(declare-fun lt!173952 () (_ BitVec 64))

(declare-fun lt!173954 () (_ BitVec 64))

(assert (=> d!36694 (= lt!173949 (bvmul lt!173952 lt!173954))))

(assert (=> d!36694 (or (= lt!173952 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173954 (bvsdiv (bvmul lt!173952 lt!173954) lt!173952)))))

(assert (=> d!36694 (= lt!173954 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36694 (= lt!173952 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!173887)))))))

(assert (=> d!36694 (= lt!173953 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5369 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5364 thiss!1305))))))

(assert (=> d!36694 (invariant!0 (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305) (size!2354 (buf!2762 (_2!4977 lt!173887))))))

(assert (=> d!36694 (= (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)) lt!173953)))

(declare-fun b!114396 () Bool)

(declare-fun res!94516 () Bool)

(assert (=> b!114396 (=> (not res!94516) (not e!75015))))

(assert (=> b!114396 (= res!94516 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173953))))

(declare-fun b!114397 () Bool)

(declare-fun lt!173951 () (_ BitVec 64))

(assert (=> b!114397 (= e!75015 (bvsle lt!173953 (bvmul lt!173951 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114397 (or (= lt!173951 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173951 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173951)))))

(assert (=> b!114397 (= lt!173951 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!173887)))))))

(assert (= (and d!36694 res!94517) b!114396))

(assert (= (and b!114396 res!94516) b!114397))

(declare-fun m!170785 () Bool)

(assert (=> d!36694 m!170785))

(assert (=> d!36694 m!170707))

(assert (=> b!114319 d!36694))

(declare-fun d!36696 () Bool)

(assert (=> d!36696 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!114308 d!36696))

(declare-fun d!36698 () Bool)

(declare-datatypes ((tuple2!9438 0))(
  ( (tuple2!9439 (_1!4982 Bool) (_2!4982 BitStream!4182)) )
))
(declare-fun lt!173957 () tuple2!9438)

(declare-fun readBit!0 (BitStream!4182) tuple2!9438)

(assert (=> d!36698 (= lt!173957 (readBit!0 (readerFrom!0 (_2!4977 lt!173887) (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305))))))

(assert (=> d!36698 (= (readBitPure!0 (readerFrom!0 (_2!4977 lt!173887) (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305))) (tuple2!9433 (_2!4982 lt!173957) (_1!4982 lt!173957)))))

(declare-fun bs!8906 () Bool)

(assert (= bs!8906 d!36698))

(assert (=> bs!8906 m!170701))

(declare-fun m!170789 () Bool)

(assert (=> bs!8906 m!170789))

(assert (=> b!114318 d!36698))

(declare-fun d!36702 () Bool)

(declare-fun e!75024 () Bool)

(assert (=> d!36702 e!75024))

(declare-fun res!94530 () Bool)

(assert (=> d!36702 (=> (not res!94530) (not e!75024))))

(assert (=> d!36702 (= res!94530 (invariant!0 (currentBit!5364 (_2!4977 lt!173887)) (currentByte!5369 (_2!4977 lt!173887)) (size!2354 (buf!2762 (_2!4977 lt!173887)))))))

(assert (=> d!36702 (= (readerFrom!0 (_2!4977 lt!173887) (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305)) (BitStream!4183 (buf!2762 (_2!4977 lt!173887)) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)))))

(declare-fun b!114409 () Bool)

(assert (=> b!114409 (= e!75024 (invariant!0 (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305) (size!2354 (buf!2762 (_2!4977 lt!173887)))))))

(assert (= (and d!36702 res!94530) b!114409))

(assert (=> d!36702 m!170757))

(assert (=> b!114409 m!170707))

(assert (=> b!114318 d!36702))

(declare-fun d!36708 () Bool)

(assert (=> d!36708 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!173887)))) ((_ sign_extend 32) (currentByte!5369 thiss!1305)) ((_ sign_extend 32) (currentBit!5364 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!173887)))) ((_ sign_extend 32) (currentByte!5369 thiss!1305)) ((_ sign_extend 32) (currentBit!5364 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8908 () Bool)

(assert (= bs!8908 d!36708))

(assert (=> bs!8908 m!170785))

(assert (=> b!114317 d!36708))

(declare-fun d!36710 () Bool)

(declare-fun res!94531 () Bool)

(declare-fun e!75026 () Bool)

(assert (=> d!36710 (=> (not res!94531) (not e!75026))))

(assert (=> d!36710 (= res!94531 (= (size!2354 (buf!2762 thiss!1305)) (size!2354 (buf!2762 (_2!4977 lt!173884)))))))

(assert (=> d!36710 (= (isPrefixOf!0 thiss!1305 (_2!4977 lt!173884)) e!75026)))

(declare-fun b!114410 () Bool)

(declare-fun res!94533 () Bool)

(assert (=> b!114410 (=> (not res!94533) (not e!75026))))

(assert (=> b!114410 (= res!94533 (bvsle (bitIndex!0 (size!2354 (buf!2762 thiss!1305)) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)) (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173884))) (currentByte!5369 (_2!4977 lt!173884)) (currentBit!5364 (_2!4977 lt!173884)))))))

(declare-fun b!114411 () Bool)

(declare-fun e!75025 () Bool)

(assert (=> b!114411 (= e!75026 e!75025)))

(declare-fun res!94532 () Bool)

(assert (=> b!114411 (=> res!94532 e!75025)))

(assert (=> b!114411 (= res!94532 (= (size!2354 (buf!2762 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114412 () Bool)

(assert (=> b!114412 (= e!75025 (arrayBitRangesEq!0 (buf!2762 thiss!1305) (buf!2762 (_2!4977 lt!173884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2354 (buf!2762 thiss!1305)) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305))))))

(assert (= (and d!36710 res!94531) b!114410))

(assert (= (and b!114410 res!94533) b!114411))

(assert (= (and b!114411 (not res!94532)) b!114412))

(assert (=> b!114410 m!170717))

(declare-fun m!170793 () Bool)

(assert (=> b!114410 m!170793))

(assert (=> b!114412 m!170717))

(assert (=> b!114412 m!170717))

(declare-fun m!170795 () Bool)

(assert (=> b!114412 m!170795))

(assert (=> b!114315 d!36710))

(declare-fun d!36712 () Bool)

(assert (=> d!36712 (isPrefixOf!0 thiss!1305 (_2!4977 lt!173884))))

(declare-fun lt!173960 () Unit!7029)

(declare-fun choose!30 (BitStream!4182 BitStream!4182 BitStream!4182) Unit!7029)

(assert (=> d!36712 (= lt!173960 (choose!30 thiss!1305 (_2!4977 lt!173887) (_2!4977 lt!173884)))))

(assert (=> d!36712 (isPrefixOf!0 thiss!1305 (_2!4977 lt!173887))))

(assert (=> d!36712 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4977 lt!173887) (_2!4977 lt!173884)) lt!173960)))

(declare-fun bs!8909 () Bool)

(assert (= bs!8909 d!36712))

(assert (=> bs!8909 m!170683))

(declare-fun m!170797 () Bool)

(assert (=> bs!8909 m!170797))

(assert (=> bs!8909 m!170699))

(assert (=> b!114315 d!36712))

(declare-fun b!114518 () Bool)

(declare-fun e!75096 () (_ BitVec 64))

(assert (=> b!114518 (= e!75096 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!114519 () Bool)

(declare-fun e!75097 () tuple2!9430)

(declare-fun lt!174218 () tuple2!9430)

(declare-fun Unit!7033 () Unit!7029)

(assert (=> b!114519 (= e!75097 (tuple2!9431 Unit!7033 (_2!4977 lt!174218)))))

(declare-fun lt!174240 () Bool)

(assert (=> b!114519 (= lt!174240 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!174245 () tuple2!9430)

(assert (=> b!114519 (= lt!174245 (appendBit!0 (_2!4977 lt!173887) lt!174240))))

(declare-fun res!94620 () Bool)

(assert (=> b!114519 (= res!94620 (= (size!2354 (buf!2762 (_2!4977 lt!173887))) (size!2354 (buf!2762 (_2!4977 lt!174245)))))))

(declare-fun e!75098 () Bool)

(assert (=> b!114519 (=> (not res!94620) (not e!75098))))

(assert (=> b!114519 e!75098))

(declare-fun lt!174224 () tuple2!9430)

(assert (=> b!114519 (= lt!174224 lt!174245)))

(assert (=> b!114519 (= lt!174218 (appendNLeastSignificantBitsLoop!0 (_2!4977 lt!174224) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!174209 () Unit!7029)

(assert (=> b!114519 (= lt!174209 (lemmaIsPrefixTransitive!0 (_2!4977 lt!173887) (_2!4977 lt!174224) (_2!4977 lt!174218)))))

(assert (=> b!114519 (isPrefixOf!0 (_2!4977 lt!173887) (_2!4977 lt!174218))))

(declare-fun lt!174210 () Unit!7029)

(assert (=> b!114519 (= lt!174210 lt!174209)))

(assert (=> b!114519 (invariant!0 (currentBit!5364 (_2!4977 lt!173887)) (currentByte!5369 (_2!4977 lt!173887)) (size!2354 (buf!2762 (_2!4977 lt!174224))))))

(declare-fun lt!174205 () BitStream!4182)

(assert (=> b!114519 (= lt!174205 (BitStream!4183 (buf!2762 (_2!4977 lt!174224)) (currentByte!5369 (_2!4977 lt!173887)) (currentBit!5364 (_2!4977 lt!173887))))))

(assert (=> b!114519 (invariant!0 (currentBit!5364 lt!174205) (currentByte!5369 lt!174205) (size!2354 (buf!2762 (_2!4977 lt!174218))))))

(declare-fun lt!174202 () BitStream!4182)

(assert (=> b!114519 (= lt!174202 (BitStream!4183 (buf!2762 (_2!4977 lt!174218)) (currentByte!5369 lt!174205) (currentBit!5364 lt!174205)))))

(declare-fun lt!174201 () tuple2!9432)

(assert (=> b!114519 (= lt!174201 (readBitPure!0 lt!174205))))

(declare-fun lt!174236 () tuple2!9432)

(assert (=> b!114519 (= lt!174236 (readBitPure!0 lt!174202))))

(declare-fun lt!174231 () Unit!7029)

(declare-fun readBitPrefixLemma!0 (BitStream!4182 BitStream!4182) Unit!7029)

(assert (=> b!114519 (= lt!174231 (readBitPrefixLemma!0 lt!174205 (_2!4977 lt!174218)))))

(declare-fun res!94623 () Bool)

(assert (=> b!114519 (= res!94623 (= (bitIndex!0 (size!2354 (buf!2762 (_1!4978 lt!174201))) (currentByte!5369 (_1!4978 lt!174201)) (currentBit!5364 (_1!4978 lt!174201))) (bitIndex!0 (size!2354 (buf!2762 (_1!4978 lt!174236))) (currentByte!5369 (_1!4978 lt!174236)) (currentBit!5364 (_1!4978 lt!174236)))))))

(declare-fun e!75099 () Bool)

(assert (=> b!114519 (=> (not res!94623) (not e!75099))))

(assert (=> b!114519 e!75099))

(declare-fun lt!174243 () Unit!7029)

(assert (=> b!114519 (= lt!174243 lt!174231)))

(declare-datatypes ((tuple2!9440 0))(
  ( (tuple2!9441 (_1!4983 BitStream!4182) (_2!4983 BitStream!4182)) )
))
(declare-fun lt!174222 () tuple2!9440)

(declare-fun reader!0 (BitStream!4182 BitStream!4182) tuple2!9440)

(assert (=> b!114519 (= lt!174222 (reader!0 (_2!4977 lt!173887) (_2!4977 lt!174218)))))

(declare-fun lt!174227 () tuple2!9440)

(assert (=> b!114519 (= lt!174227 (reader!0 (_2!4977 lt!174224) (_2!4977 lt!174218)))))

(declare-fun lt!174244 () tuple2!9432)

(assert (=> b!114519 (= lt!174244 (readBitPure!0 (_1!4983 lt!174222)))))

(assert (=> b!114519 (= (_2!4978 lt!174244) lt!174240)))

(declare-fun lt!174237 () Unit!7029)

(declare-fun Unit!7034 () Unit!7029)

(assert (=> b!114519 (= lt!174237 Unit!7034)))

(declare-fun lt!174232 () (_ BitVec 64))

(assert (=> b!114519 (= lt!174232 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!174208 () (_ BitVec 64))

(assert (=> b!114519 (= lt!174208 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!174212 () Unit!7029)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4182 array!5185 (_ BitVec 64)) Unit!7029)

(assert (=> b!114519 (= lt!174212 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4977 lt!173887) (buf!2762 (_2!4977 lt!174218)) lt!174208))))

(assert (=> b!114519 (validate_offset_bits!1 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!174218)))) ((_ sign_extend 32) (currentByte!5369 (_2!4977 lt!173887))) ((_ sign_extend 32) (currentBit!5364 (_2!4977 lt!173887))) lt!174208)))

(declare-fun lt!174234 () Unit!7029)

(assert (=> b!114519 (= lt!174234 lt!174212)))

(declare-datatypes ((tuple2!9442 0))(
  ( (tuple2!9443 (_1!4984 BitStream!4182) (_2!4984 (_ BitVec 64))) )
))
(declare-fun lt!174233 () tuple2!9442)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9442)

(assert (=> b!114519 (= lt!174233 (readNLeastSignificantBitsLoopPure!0 (_1!4983 lt!174222) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174232))))

(declare-fun lt!174216 () (_ BitVec 64))

(assert (=> b!114519 (= lt!174216 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!174235 () Unit!7029)

(assert (=> b!114519 (= lt!174235 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4977 lt!174224) (buf!2762 (_2!4977 lt!174218)) lt!174216))))

(assert (=> b!114519 (validate_offset_bits!1 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!174218)))) ((_ sign_extend 32) (currentByte!5369 (_2!4977 lt!174224))) ((_ sign_extend 32) (currentBit!5364 (_2!4977 lt!174224))) lt!174216)))

(declare-fun lt!174203 () Unit!7029)

(assert (=> b!114519 (= lt!174203 lt!174235)))

(declare-fun lt!174219 () tuple2!9442)

(assert (=> b!114519 (= lt!174219 (readNLeastSignificantBitsLoopPure!0 (_1!4983 lt!174227) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174232 (ite (_2!4978 lt!174244) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!174211 () tuple2!9442)

(assert (=> b!114519 (= lt!174211 (readNLeastSignificantBitsLoopPure!0 (_1!4983 lt!174222) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174232))))

(declare-fun c!6940 () Bool)

(assert (=> b!114519 (= c!6940 (_2!4978 (readBitPure!0 (_1!4983 lt!174222))))))

(declare-fun lt!174230 () tuple2!9442)

(declare-fun withMovedBitIndex!0 (BitStream!4182 (_ BitVec 64)) BitStream!4182)

(assert (=> b!114519 (= lt!174230 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4983 lt!174222) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174232 e!75096)))))

(declare-fun lt!174214 () Unit!7029)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7029)

(assert (=> b!114519 (= lt!174214 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4983 lt!174222) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174232))))

(assert (=> b!114519 (and (= (_2!4984 lt!174211) (_2!4984 lt!174230)) (= (_1!4984 lt!174211) (_1!4984 lt!174230)))))

(declare-fun lt!174207 () Unit!7029)

(assert (=> b!114519 (= lt!174207 lt!174214)))

(assert (=> b!114519 (= (_1!4983 lt!174222) (withMovedBitIndex!0 (_2!4983 lt!174222) (bvsub (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 (_2!4977 lt!173887)) (currentBit!5364 (_2!4977 lt!173887))) (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!174218))) (currentByte!5369 (_2!4977 lt!174218)) (currentBit!5364 (_2!4977 lt!174218))))))))

(declare-fun lt!174223 () Unit!7029)

(declare-fun Unit!7036 () Unit!7029)

(assert (=> b!114519 (= lt!174223 Unit!7036)))

(assert (=> b!114519 (= (_1!4983 lt!174227) (withMovedBitIndex!0 (_2!4983 lt!174227) (bvsub (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!174224))) (currentByte!5369 (_2!4977 lt!174224)) (currentBit!5364 (_2!4977 lt!174224))) (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!174218))) (currentByte!5369 (_2!4977 lt!174218)) (currentBit!5364 (_2!4977 lt!174218))))))))

(declare-fun lt!174229 () Unit!7029)

(declare-fun Unit!7037 () Unit!7029)

(assert (=> b!114519 (= lt!174229 Unit!7037)))

(assert (=> b!114519 (= (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 (_2!4977 lt!173887)) (currentBit!5364 (_2!4977 lt!173887))) (bvsub (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!174224))) (currentByte!5369 (_2!4977 lt!174224)) (currentBit!5364 (_2!4977 lt!174224))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!174239 () Unit!7029)

(declare-fun Unit!7038 () Unit!7029)

(assert (=> b!114519 (= lt!174239 Unit!7038)))

(assert (=> b!114519 (= (_2!4984 lt!174233) (_2!4984 lt!174219))))

(declare-fun lt!174241 () Unit!7029)

(declare-fun Unit!7039 () Unit!7029)

(assert (=> b!114519 (= lt!174241 Unit!7039)))

(assert (=> b!114519 (= (_1!4984 lt!174233) (_2!4983 lt!174222))))

(declare-fun b!114520 () Bool)

(assert (=> b!114520 (= e!75099 (= (_2!4978 lt!174201) (_2!4978 lt!174236)))))

(declare-fun b!114521 () Bool)

(declare-fun lt!174226 () tuple2!9432)

(assert (=> b!114521 (= lt!174226 (readBitPure!0 (readerFrom!0 (_2!4977 lt!174245) (currentBit!5364 (_2!4977 lt!173887)) (currentByte!5369 (_2!4977 lt!173887)))))))

(declare-fun res!94624 () Bool)

(assert (=> b!114521 (= res!94624 (and (= (_2!4978 lt!174226) lt!174240) (= (_1!4978 lt!174226) (_2!4977 lt!174245))))))

(declare-fun e!75094 () Bool)

(assert (=> b!114521 (=> (not res!94624) (not e!75094))))

(assert (=> b!114521 (= e!75098 e!75094)))

(declare-fun lt!174213 () BitStream!4182)

(declare-fun bm!1474 () Bool)

(declare-fun call!1477 () Bool)

(declare-fun c!6941 () Bool)

(assert (=> bm!1474 (= call!1477 (isPrefixOf!0 (ite c!6941 (_2!4977 lt!173887) lt!174213) (ite c!6941 (_2!4977 lt!174245) lt!174213)))))

(declare-fun d!36714 () Bool)

(declare-fun e!75093 () Bool)

(assert (=> d!36714 e!75093))

(declare-fun res!94626 () Bool)

(assert (=> d!36714 (=> (not res!94626) (not e!75093))))

(declare-fun lt!174238 () tuple2!9430)

(assert (=> d!36714 (= res!94626 (= (size!2354 (buf!2762 (_2!4977 lt!173887))) (size!2354 (buf!2762 (_2!4977 lt!174238)))))))

(assert (=> d!36714 (= lt!174238 e!75097)))

(assert (=> d!36714 (= c!6941 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36714 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36714 (= (appendNLeastSignificantBitsLoop!0 (_2!4977 lt!173887) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!174238)))

(declare-fun lt!174228 () tuple2!9442)

(declare-fun lt!174242 () tuple2!9440)

(declare-fun b!114522 () Bool)

(assert (=> b!114522 (= e!75093 (and (= (_2!4984 lt!174228) v!199) (= (_1!4984 lt!174228) (_2!4983 lt!174242))))))

(declare-fun lt!174204 () (_ BitVec 64))

(assert (=> b!114522 (= lt!174228 (readNLeastSignificantBitsLoopPure!0 (_1!4983 lt!174242) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174204))))

(declare-fun lt!174217 () Unit!7029)

(declare-fun lt!174221 () Unit!7029)

(assert (=> b!114522 (= lt!174217 lt!174221)))

(declare-fun lt!174215 () (_ BitVec 64))

(assert (=> b!114522 (validate_offset_bits!1 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!174238)))) ((_ sign_extend 32) (currentByte!5369 (_2!4977 lt!173887))) ((_ sign_extend 32) (currentBit!5364 (_2!4977 lt!173887))) lt!174215)))

(assert (=> b!114522 (= lt!174221 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4977 lt!173887) (buf!2762 (_2!4977 lt!174238)) lt!174215))))

(declare-fun e!75095 () Bool)

(assert (=> b!114522 e!75095))

(declare-fun res!94621 () Bool)

(assert (=> b!114522 (=> (not res!94621) (not e!75095))))

(assert (=> b!114522 (= res!94621 (and (= (size!2354 (buf!2762 (_2!4977 lt!173887))) (size!2354 (buf!2762 (_2!4977 lt!174238)))) (bvsge lt!174215 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114522 (= lt!174215 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114522 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114522 (= lt!174204 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!114522 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114522 (= lt!174242 (reader!0 (_2!4977 lt!173887) (_2!4977 lt!174238)))))

(declare-fun b!114523 () Bool)

(declare-fun res!94619 () Bool)

(assert (=> b!114523 (=> (not res!94619) (not e!75093))))

(declare-fun lt!174206 () (_ BitVec 64))

(declare-fun lt!174225 () (_ BitVec 64))

(assert (=> b!114523 (= res!94619 (= (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!174238))) (currentByte!5369 (_2!4977 lt!174238)) (currentBit!5364 (_2!4977 lt!174238))) (bvadd lt!174225 lt!174206)))))

(assert (=> b!114523 (or (not (= (bvand lt!174225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174206 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174225 lt!174206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114523 (= lt!174206 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114523 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114523 (= lt!174225 (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 (_2!4977 lt!173887)) (currentBit!5364 (_2!4977 lt!173887))))))

(declare-fun b!114524 () Bool)

(declare-fun res!94622 () Bool)

(assert (=> b!114524 (= res!94622 call!1477)))

(assert (=> b!114524 (=> (not res!94622) (not e!75098))))

(declare-fun b!114525 () Bool)

(declare-fun res!94618 () Bool)

(assert (=> b!114525 (= res!94618 (= (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!174245))) (currentByte!5369 (_2!4977 lt!174245)) (currentBit!5364 (_2!4977 lt!174245))) (bvadd (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!173887))) (currentByte!5369 (_2!4977 lt!173887)) (currentBit!5364 (_2!4977 lt!173887))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!114525 (=> (not res!94618) (not e!75098))))

(declare-fun b!114526 () Bool)

(assert (=> b!114526 (= e!75095 (validate_offset_bits!1 ((_ sign_extend 32) (size!2354 (buf!2762 (_2!4977 lt!173887)))) ((_ sign_extend 32) (currentByte!5369 (_2!4977 lt!173887))) ((_ sign_extend 32) (currentBit!5364 (_2!4977 lt!173887))) lt!174215))))

(declare-fun b!114527 () Bool)

(assert (=> b!114527 (= e!75094 (= (bitIndex!0 (size!2354 (buf!2762 (_1!4978 lt!174226))) (currentByte!5369 (_1!4978 lt!174226)) (currentBit!5364 (_1!4978 lt!174226))) (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!174245))) (currentByte!5369 (_2!4977 lt!174245)) (currentBit!5364 (_2!4977 lt!174245)))))))

(declare-fun b!114528 () Bool)

(assert (=> b!114528 (= e!75096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!114529 () Bool)

(declare-fun lt!174220 () Unit!7029)

(assert (=> b!114529 (= e!75097 (tuple2!9431 lt!174220 (_2!4977 lt!173887)))))

(assert (=> b!114529 (= lt!174213 (_2!4977 lt!173887))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4182) Unit!7029)

(assert (=> b!114529 (= lt!174220 (lemmaIsPrefixRefl!0 lt!174213))))

(assert (=> b!114529 call!1477))

(declare-fun b!114530 () Bool)

(declare-fun res!94625 () Bool)

(assert (=> b!114530 (=> (not res!94625) (not e!75093))))

(assert (=> b!114530 (= res!94625 (isPrefixOf!0 (_2!4977 lt!173887) (_2!4977 lt!174238)))))

(assert (= (and d!36714 c!6941) b!114519))

(assert (= (and d!36714 (not c!6941)) b!114529))

(assert (= (and b!114519 res!94620) b!114525))

(assert (= (and b!114525 res!94618) b!114524))

(assert (= (and b!114524 res!94622) b!114521))

(assert (= (and b!114521 res!94624) b!114527))

(assert (= (and b!114519 res!94623) b!114520))

(assert (= (and b!114519 c!6940) b!114518))

(assert (= (and b!114519 (not c!6940)) b!114528))

(assert (= (or b!114524 b!114529) bm!1474))

(assert (= (and d!36714 res!94626) b!114523))

(assert (= (and b!114523 res!94619) b!114530))

(assert (= (and b!114530 res!94625) b!114522))

(assert (= (and b!114522 res!94621) b!114526))

(declare-fun m!170851 () Bool)

(assert (=> b!114526 m!170851))

(declare-fun m!170853 () Bool)

(assert (=> b!114519 m!170853))

(declare-fun m!170855 () Bool)

(assert (=> b!114519 m!170855))

(declare-fun m!170857 () Bool)

(assert (=> b!114519 m!170857))

(declare-fun m!170859 () Bool)

(assert (=> b!114519 m!170859))

(declare-fun m!170861 () Bool)

(assert (=> b!114519 m!170861))

(declare-fun m!170863 () Bool)

(assert (=> b!114519 m!170863))

(declare-fun m!170865 () Bool)

(assert (=> b!114519 m!170865))

(declare-fun m!170867 () Bool)

(assert (=> b!114519 m!170867))

(declare-fun m!170869 () Bool)

(assert (=> b!114519 m!170869))

(declare-fun m!170871 () Bool)

(assert (=> b!114519 m!170871))

(declare-fun m!170873 () Bool)

(assert (=> b!114519 m!170873))

(declare-fun m!170875 () Bool)

(assert (=> b!114519 m!170875))

(declare-fun m!170877 () Bool)

(assert (=> b!114519 m!170877))

(declare-fun m!170879 () Bool)

(assert (=> b!114519 m!170879))

(declare-fun m!170881 () Bool)

(assert (=> b!114519 m!170881))

(declare-fun m!170883 () Bool)

(assert (=> b!114519 m!170883))

(assert (=> b!114519 m!170871))

(declare-fun m!170885 () Bool)

(assert (=> b!114519 m!170885))

(declare-fun m!170887 () Bool)

(assert (=> b!114519 m!170887))

(declare-fun m!170889 () Bool)

(assert (=> b!114519 m!170889))

(declare-fun m!170891 () Bool)

(assert (=> b!114519 m!170891))

(declare-fun m!170893 () Bool)

(assert (=> b!114519 m!170893))

(declare-fun m!170895 () Bool)

(assert (=> b!114519 m!170895))

(assert (=> b!114519 m!170715))

(declare-fun m!170897 () Bool)

(assert (=> b!114519 m!170897))

(declare-fun m!170899 () Bool)

(assert (=> b!114519 m!170899))

(declare-fun m!170901 () Bool)

(assert (=> b!114519 m!170901))

(declare-fun m!170903 () Bool)

(assert (=> b!114519 m!170903))

(declare-fun m!170905 () Bool)

(assert (=> b!114519 m!170905))

(declare-fun m!170907 () Bool)

(assert (=> b!114519 m!170907))

(declare-fun m!170909 () Bool)

(assert (=> b!114530 m!170909))

(declare-fun m!170911 () Bool)

(assert (=> b!114521 m!170911))

(assert (=> b!114521 m!170911))

(declare-fun m!170913 () Bool)

(assert (=> b!114521 m!170913))

(declare-fun m!170915 () Bool)

(assert (=> bm!1474 m!170915))

(declare-fun m!170917 () Bool)

(assert (=> b!114523 m!170917))

(assert (=> b!114523 m!170715))

(declare-fun m!170919 () Bool)

(assert (=> b!114522 m!170919))

(declare-fun m!170921 () Bool)

(assert (=> b!114522 m!170921))

(assert (=> b!114522 m!170881))

(declare-fun m!170923 () Bool)

(assert (=> b!114522 m!170923))

(declare-fun m!170925 () Bool)

(assert (=> b!114522 m!170925))

(declare-fun m!170927 () Bool)

(assert (=> b!114525 m!170927))

(assert (=> b!114525 m!170715))

(declare-fun m!170929 () Bool)

(assert (=> b!114529 m!170929))

(declare-fun m!170931 () Bool)

(assert (=> b!114527 m!170931))

(assert (=> b!114527 m!170927))

(assert (=> b!114315 d!36714))

(declare-fun b!114554 () Bool)

(declare-fun res!94646 () Bool)

(declare-fun e!75112 () Bool)

(assert (=> b!114554 (=> (not res!94646) (not e!75112))))

(declare-fun lt!174299 () tuple2!9430)

(assert (=> b!114554 (= res!94646 (isPrefixOf!0 thiss!1305 (_2!4977 lt!174299)))))

(declare-fun b!114556 () Bool)

(declare-fun e!75111 () Bool)

(declare-fun lt!174300 () tuple2!9432)

(assert (=> b!114556 (= e!75111 (= (bitIndex!0 (size!2354 (buf!2762 (_1!4978 lt!174300))) (currentByte!5369 (_1!4978 lt!174300)) (currentBit!5364 (_1!4978 lt!174300))) (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!174299))) (currentByte!5369 (_2!4977 lt!174299)) (currentBit!5364 (_2!4977 lt!174299)))))))

(declare-fun b!114555 () Bool)

(assert (=> b!114555 (= e!75112 e!75111)))

(declare-fun res!94645 () Bool)

(assert (=> b!114555 (=> (not res!94645) (not e!75111))))

(assert (=> b!114555 (= res!94645 (and (= (_2!4978 lt!174300) lt!173885) (= (_1!4978 lt!174300) (_2!4977 lt!174299))))))

(assert (=> b!114555 (= lt!174300 (readBitPure!0 (readerFrom!0 (_2!4977 lt!174299) (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305))))))

(declare-fun b!114553 () Bool)

(declare-fun res!94644 () Bool)

(assert (=> b!114553 (=> (not res!94644) (not e!75112))))

(declare-fun lt!174301 () (_ BitVec 64))

(declare-fun lt!174302 () (_ BitVec 64))

(assert (=> b!114553 (= res!94644 (= (bitIndex!0 (size!2354 (buf!2762 (_2!4977 lt!174299))) (currentByte!5369 (_2!4977 lt!174299)) (currentBit!5364 (_2!4977 lt!174299))) (bvadd lt!174302 lt!174301)))))

(assert (=> b!114553 (or (not (= (bvand lt!174302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174301 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174302 lt!174301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114553 (= lt!174301 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!114553 (= lt!174302 (bitIndex!0 (size!2354 (buf!2762 thiss!1305)) (currentByte!5369 thiss!1305) (currentBit!5364 thiss!1305)))))

(declare-fun d!36754 () Bool)

(assert (=> d!36754 e!75112))

(declare-fun res!94647 () Bool)

(assert (=> d!36754 (=> (not res!94647) (not e!75112))))

(assert (=> d!36754 (= res!94647 (= (size!2354 (buf!2762 thiss!1305)) (size!2354 (buf!2762 (_2!4977 lt!174299)))))))

(declare-fun choose!16 (BitStream!4182 Bool) tuple2!9430)

(assert (=> d!36754 (= lt!174299 (choose!16 thiss!1305 lt!173885))))

(assert (=> d!36754 (validate_offset_bit!0 ((_ sign_extend 32) (size!2354 (buf!2762 thiss!1305))) ((_ sign_extend 32) (currentByte!5369 thiss!1305)) ((_ sign_extend 32) (currentBit!5364 thiss!1305)))))

(assert (=> d!36754 (= (appendBit!0 thiss!1305 lt!173885) lt!174299)))

(assert (= (and d!36754 res!94647) b!114553))

(assert (= (and b!114553 res!94644) b!114554))

(assert (= (and b!114554 res!94646) b!114555))

(assert (= (and b!114555 res!94645) b!114556))

(declare-fun m!171015 () Bool)

(assert (=> b!114556 m!171015))

(declare-fun m!171017 () Bool)

(assert (=> b!114556 m!171017))

(declare-fun m!171019 () Bool)

(assert (=> d!36754 m!171019))

(declare-fun m!171021 () Bool)

(assert (=> d!36754 m!171021))

(declare-fun m!171023 () Bool)

(assert (=> b!114554 m!171023))

(assert (=> b!114553 m!171017))

(assert (=> b!114553 m!170717))

(declare-fun m!171025 () Bool)

(assert (=> b!114555 m!171025))

(assert (=> b!114555 m!171025))

(declare-fun m!171027 () Bool)

(assert (=> b!114555 m!171027))

(assert (=> b!114315 d!36754))

(declare-fun d!36758 () Bool)

(assert (=> d!36758 (= (invariant!0 (currentBit!5364 thiss!1305) (currentByte!5369 thiss!1305) (size!2354 (buf!2762 (_2!4977 lt!173887)))) (and (bvsge (currentBit!5364 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5364 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5369 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5369 thiss!1305) (size!2354 (buf!2762 (_2!4977 lt!173887)))) (and (= (currentBit!5364 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5369 thiss!1305) (size!2354 (buf!2762 (_2!4977 lt!173887))))))))))

(assert (=> b!114314 d!36758))

(check-sat (not bm!1474) (not b!114530) (not d!36682) (not b!114522) (not b!114529) (not b!114410) (not b!114374) (not b!114527) (not d!36754) (not b!114553) (not b!114523) (not d!36688) (not b!114554) (not d!36694) (not b!114556) (not d!36678) (not b!114393) (not d!36676) (not b!114519) (not b!114412) (not b!114390) (not b!114525) (not d!36708) (not d!36698) (not b!114409) (not d!36712) (not bm!1466) (not b!114389) (not d!36702) (not b!114555) (not b!114521) (not b!114526) (not b!114372) (not d!36680))
(check-sat)
