; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58568 () Bool)

(assert start!58568)

(declare-fun b!268909 () Bool)

(declare-fun e!188895 () Bool)

(declare-datatypes ((array!14992 0))(
  ( (array!14993 (arr!7523 (Array (_ BitVec 32) (_ BitVec 8))) (size!6536 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11886 0))(
  ( (BitStream!11887 (buf!7004 array!14992) (currentByte!12934 (_ BitVec 32)) (currentBit!12929 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11886)

(declare-fun w2!587 () BitStream!11886)

(assert (=> b!268909 (= e!188895 (or (bvsgt #b00000000000000000000000000000000 (currentByte!12934 w1!591)) (bvsgt (currentByte!12934 w1!591) (currentByte!12934 w2!587))))))

(declare-fun b!268910 () Bool)

(declare-fun res!224212 () Bool)

(assert (=> b!268910 (=> (not res!224212) (not e!188895))))

(declare-fun w3!25 () BitStream!11886)

(declare-fun isPrefixOf!0 (BitStream!11886 BitStream!11886) Bool)

(assert (=> b!268910 (= res!224212 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268911 () Bool)

(declare-fun e!188899 () Bool)

(declare-fun array_inv!6260 (array!14992) Bool)

(assert (=> b!268911 (= e!188899 (array_inv!6260 (buf!7004 w2!587)))))

(declare-fun b!268912 () Bool)

(declare-fun e!188897 () Bool)

(assert (=> b!268912 (= e!188897 (array_inv!6260 (buf!7004 w3!25)))))

(declare-fun res!224211 () Bool)

(assert (=> start!58568 (=> (not res!224211) (not e!188895))))

(assert (=> start!58568 (= res!224211 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58568 e!188895))

(declare-fun e!188896 () Bool)

(declare-fun inv!12 (BitStream!11886) Bool)

(assert (=> start!58568 (and (inv!12 w1!591) e!188896)))

(assert (=> start!58568 (and (inv!12 w2!587) e!188899)))

(assert (=> start!58568 (and (inv!12 w3!25) e!188897)))

(declare-fun b!268913 () Bool)

(assert (=> b!268913 (= e!188896 (array_inv!6260 (buf!7004 w1!591)))))

(assert (= (and start!58568 res!224211) b!268910))

(assert (= (and b!268910 res!224212) b!268909))

(assert (= start!58568 b!268913))

(assert (= start!58568 b!268911))

(assert (= start!58568 b!268912))

(declare-fun m!400437 () Bool)

(assert (=> b!268911 m!400437))

(declare-fun m!400439 () Bool)

(assert (=> b!268913 m!400439))

(declare-fun m!400441 () Bool)

(assert (=> b!268912 m!400441))

(declare-fun m!400443 () Bool)

(assert (=> start!58568 m!400443))

(declare-fun m!400445 () Bool)

(assert (=> start!58568 m!400445))

(declare-fun m!400447 () Bool)

(assert (=> start!58568 m!400447))

(declare-fun m!400449 () Bool)

(assert (=> start!58568 m!400449))

(declare-fun m!400451 () Bool)

(assert (=> b!268910 m!400451))

(check-sat (not b!268910) (not start!58568) (not b!268911) (not b!268913) (not b!268912))
(check-sat)
(get-model)

(declare-fun d!90942 () Bool)

(assert (=> d!90942 (= (array_inv!6260 (buf!7004 w1!591)) (bvsge (size!6536 (buf!7004 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268913 d!90942))

(declare-fun d!90944 () Bool)

(declare-fun res!224226 () Bool)

(declare-fun e!188928 () Bool)

(assert (=> d!90944 (=> (not res!224226) (not e!188928))))

(assert (=> d!90944 (= res!224226 (= (size!6536 (buf!7004 w1!591)) (size!6536 (buf!7004 w2!587))))))

(assert (=> d!90944 (= (isPrefixOf!0 w1!591 w2!587) e!188928)))

(declare-fun b!268935 () Bool)

(declare-fun res!224225 () Bool)

(assert (=> b!268935 (=> (not res!224225) (not e!188928))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268935 (= res!224225 (bvsle (bitIndex!0 (size!6536 (buf!7004 w1!591)) (currentByte!12934 w1!591) (currentBit!12929 w1!591)) (bitIndex!0 (size!6536 (buf!7004 w2!587)) (currentByte!12934 w2!587) (currentBit!12929 w2!587))))))

(declare-fun b!268936 () Bool)

(declare-fun e!188927 () Bool)

(assert (=> b!268936 (= e!188928 e!188927)))

(declare-fun res!224227 () Bool)

(assert (=> b!268936 (=> res!224227 e!188927)))

(assert (=> b!268936 (= res!224227 (= (size!6536 (buf!7004 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268937 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14992 array!14992 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268937 (= e!188927 (arrayBitRangesEq!0 (buf!7004 w1!591) (buf!7004 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6536 (buf!7004 w1!591)) (currentByte!12934 w1!591) (currentBit!12929 w1!591))))))

(assert (= (and d!90944 res!224226) b!268935))

(assert (= (and b!268935 res!224225) b!268936))

(assert (= (and b!268936 (not res!224227)) b!268937))

(declare-fun m!400469 () Bool)

(assert (=> b!268935 m!400469))

(declare-fun m!400471 () Bool)

(assert (=> b!268935 m!400471))

(assert (=> b!268937 m!400469))

(assert (=> b!268937 m!400469))

(declare-fun m!400473 () Bool)

(assert (=> b!268937 m!400473))

(assert (=> start!58568 d!90944))

(declare-fun d!90948 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90948 (= (inv!12 w1!591) (invariant!0 (currentBit!12929 w1!591) (currentByte!12934 w1!591) (size!6536 (buf!7004 w1!591))))))

(declare-fun bs!23070 () Bool)

(assert (= bs!23070 d!90948))

(declare-fun m!400475 () Bool)

(assert (=> bs!23070 m!400475))

(assert (=> start!58568 d!90948))

(declare-fun d!90950 () Bool)

(assert (=> d!90950 (= (inv!12 w2!587) (invariant!0 (currentBit!12929 w2!587) (currentByte!12934 w2!587) (size!6536 (buf!7004 w2!587))))))

(declare-fun bs!23071 () Bool)

(assert (= bs!23071 d!90950))

(declare-fun m!400477 () Bool)

(assert (=> bs!23071 m!400477))

(assert (=> start!58568 d!90950))

(declare-fun d!90952 () Bool)

(assert (=> d!90952 (= (inv!12 w3!25) (invariant!0 (currentBit!12929 w3!25) (currentByte!12934 w3!25) (size!6536 (buf!7004 w3!25))))))

(declare-fun bs!23072 () Bool)

(assert (= bs!23072 d!90952))

(declare-fun m!400479 () Bool)

(assert (=> bs!23072 m!400479))

(assert (=> start!58568 d!90952))

(declare-fun d!90954 () Bool)

(assert (=> d!90954 (= (array_inv!6260 (buf!7004 w3!25)) (bvsge (size!6536 (buf!7004 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268912 d!90954))

(declare-fun d!90956 () Bool)

(assert (=> d!90956 (= (array_inv!6260 (buf!7004 w2!587)) (bvsge (size!6536 (buf!7004 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268911 d!90956))

(declare-fun d!90958 () Bool)

(declare-fun res!224229 () Bool)

(declare-fun e!188930 () Bool)

(assert (=> d!90958 (=> (not res!224229) (not e!188930))))

(assert (=> d!90958 (= res!224229 (= (size!6536 (buf!7004 w2!587)) (size!6536 (buf!7004 w3!25))))))

(assert (=> d!90958 (= (isPrefixOf!0 w2!587 w3!25) e!188930)))

(declare-fun b!268938 () Bool)

(declare-fun res!224228 () Bool)

(assert (=> b!268938 (=> (not res!224228) (not e!188930))))

(assert (=> b!268938 (= res!224228 (bvsle (bitIndex!0 (size!6536 (buf!7004 w2!587)) (currentByte!12934 w2!587) (currentBit!12929 w2!587)) (bitIndex!0 (size!6536 (buf!7004 w3!25)) (currentByte!12934 w3!25) (currentBit!12929 w3!25))))))

(declare-fun b!268939 () Bool)

(declare-fun e!188929 () Bool)

(assert (=> b!268939 (= e!188930 e!188929)))

(declare-fun res!224230 () Bool)

(assert (=> b!268939 (=> res!224230 e!188929)))

(assert (=> b!268939 (= res!224230 (= (size!6536 (buf!7004 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268940 () Bool)

(assert (=> b!268940 (= e!188929 (arrayBitRangesEq!0 (buf!7004 w2!587) (buf!7004 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6536 (buf!7004 w2!587)) (currentByte!12934 w2!587) (currentBit!12929 w2!587))))))

(assert (= (and d!90958 res!224229) b!268938))

(assert (= (and b!268938 res!224228) b!268939))

(assert (= (and b!268939 (not res!224230)) b!268940))

(assert (=> b!268938 m!400471))

(declare-fun m!400481 () Bool)

(assert (=> b!268938 m!400481))

(assert (=> b!268940 m!400471))

(assert (=> b!268940 m!400471))

(declare-fun m!400483 () Bool)

(assert (=> b!268940 m!400483))

(assert (=> b!268910 d!90958))

(check-sat (not b!268940) (not b!268938) (not d!90952) (not b!268935) (not b!268937) (not d!90950) (not d!90948))
(check-sat)
(get-model)

(declare-fun b!268979 () Bool)

(declare-fun e!188960 () Bool)

(declare-fun e!188964 () Bool)

(assert (=> b!268979 (= e!188960 e!188964)))

(declare-fun c!12411 () Bool)

(declare-datatypes ((tuple4!426 0))(
  ( (tuple4!427 (_1!12196 (_ BitVec 32)) (_2!12196 (_ BitVec 32)) (_3!993 (_ BitVec 32)) (_4!213 (_ BitVec 32))) )
))
(declare-fun lt!408739 () tuple4!426)

(assert (=> b!268979 (= c!12411 (= (_3!993 lt!408739) (_4!213 lt!408739)))))

(declare-fun d!90990 () Bool)

(declare-fun res!224269 () Bool)

(declare-fun e!188961 () Bool)

(assert (=> d!90990 (=> res!224269 e!188961)))

(assert (=> d!90990 (= res!224269 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6536 (buf!7004 w2!587)) (currentByte!12934 w2!587) (currentBit!12929 w2!587))))))

(assert (=> d!90990 (= (arrayBitRangesEq!0 (buf!7004 w2!587) (buf!7004 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6536 (buf!7004 w2!587)) (currentByte!12934 w2!587) (currentBit!12929 w2!587))) e!188961)))

(declare-fun lt!408738 () (_ BitVec 32))

(declare-fun call!4262 () Bool)

(declare-fun bm!4259 () Bool)

(declare-fun lt!408740 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4259 (= call!4262 (byteRangesEq!0 (select (arr!7523 (buf!7004 w2!587)) (_3!993 lt!408739)) (select (arr!7523 (buf!7004 w3!25)) (_3!993 lt!408739)) lt!408740 (ite c!12411 lt!408738 #b00000000000000000000000000001000)))))

(declare-fun e!188962 () Bool)

(declare-fun b!268980 () Bool)

(declare-fun arrayRangesEq!1070 (array!14992 array!14992 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268980 (= e!188962 (arrayRangesEq!1070 (buf!7004 w2!587) (buf!7004 w3!25) (_1!12196 lt!408739) (_2!12196 lt!408739)))))

(declare-fun b!268981 () Bool)

(declare-fun res!224267 () Bool)

(assert (=> b!268981 (= res!224267 (= lt!408738 #b00000000000000000000000000000000))))

(declare-fun e!188963 () Bool)

(assert (=> b!268981 (=> res!224267 e!188963)))

(declare-fun e!188959 () Bool)

(assert (=> b!268981 (= e!188959 e!188963)))

(declare-fun b!268982 () Bool)

(assert (=> b!268982 (= e!188964 e!188959)))

(declare-fun res!224265 () Bool)

(assert (=> b!268982 (= res!224265 call!4262)))

(assert (=> b!268982 (=> (not res!224265) (not e!188959))))

(declare-fun b!268983 () Bool)

(assert (=> b!268983 (= e!188961 e!188960)))

(declare-fun res!224266 () Bool)

(assert (=> b!268983 (=> (not res!224266) (not e!188960))))

(assert (=> b!268983 (= res!224266 e!188962)))

(declare-fun res!224268 () Bool)

(assert (=> b!268983 (=> res!224268 e!188962)))

(assert (=> b!268983 (= res!224268 (bvsge (_1!12196 lt!408739) (_2!12196 lt!408739)))))

(assert (=> b!268983 (= lt!408738 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6536 (buf!7004 w2!587)) (currentByte!12934 w2!587) (currentBit!12929 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268983 (= lt!408740 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!426)

(assert (=> b!268983 (= lt!408739 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6536 (buf!7004 w2!587)) (currentByte!12934 w2!587) (currentBit!12929 w2!587))))))

(declare-fun b!268984 () Bool)

(assert (=> b!268984 (= e!188963 (byteRangesEq!0 (select (arr!7523 (buf!7004 w2!587)) (_4!213 lt!408739)) (select (arr!7523 (buf!7004 w3!25)) (_4!213 lt!408739)) #b00000000000000000000000000000000 lt!408738))))

(declare-fun b!268985 () Bool)

(assert (=> b!268985 (= e!188964 call!4262)))

(assert (= (and d!90990 (not res!224269)) b!268983))

(assert (= (and b!268983 (not res!224268)) b!268980))

(assert (= (and b!268983 res!224266) b!268979))

(assert (= (and b!268979 c!12411) b!268985))

(assert (= (and b!268979 (not c!12411)) b!268982))

(assert (= (and b!268982 res!224265) b!268981))

(assert (= (and b!268981 (not res!224267)) b!268984))

(assert (= (or b!268985 b!268982) bm!4259))

(declare-fun m!400517 () Bool)

(assert (=> bm!4259 m!400517))

(declare-fun m!400519 () Bool)

(assert (=> bm!4259 m!400519))

(assert (=> bm!4259 m!400517))

(assert (=> bm!4259 m!400519))

(declare-fun m!400521 () Bool)

(assert (=> bm!4259 m!400521))

(declare-fun m!400523 () Bool)

(assert (=> b!268980 m!400523))

(assert (=> b!268983 m!400471))

(declare-fun m!400525 () Bool)

(assert (=> b!268983 m!400525))

(declare-fun m!400527 () Bool)

(assert (=> b!268984 m!400527))

(declare-fun m!400529 () Bool)

(assert (=> b!268984 m!400529))

(assert (=> b!268984 m!400527))

(assert (=> b!268984 m!400529))

(declare-fun m!400531 () Bool)

(assert (=> b!268984 m!400531))

(assert (=> b!268940 d!90990))

(declare-fun d!90992 () Bool)

(declare-fun e!188967 () Bool)

(assert (=> d!90992 e!188967))

(declare-fun res!224274 () Bool)

(assert (=> d!90992 (=> (not res!224274) (not e!188967))))

(declare-fun lt!408758 () (_ BitVec 64))

(declare-fun lt!408756 () (_ BitVec 64))

(declare-fun lt!408754 () (_ BitVec 64))

(assert (=> d!90992 (= res!224274 (= lt!408756 (bvsub lt!408754 lt!408758)))))

(assert (=> d!90992 (or (= (bvand lt!408754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408758 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408754 lt!408758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90992 (= lt!408758 (remainingBits!0 ((_ sign_extend 32) (size!6536 (buf!7004 w2!587))) ((_ sign_extend 32) (currentByte!12934 w2!587)) ((_ sign_extend 32) (currentBit!12929 w2!587))))))

(declare-fun lt!408753 () (_ BitVec 64))

(declare-fun lt!408755 () (_ BitVec 64))

(assert (=> d!90992 (= lt!408754 (bvmul lt!408753 lt!408755))))

(assert (=> d!90992 (or (= lt!408753 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408755 (bvsdiv (bvmul lt!408753 lt!408755) lt!408753)))))

(assert (=> d!90992 (= lt!408755 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90992 (= lt!408753 ((_ sign_extend 32) (size!6536 (buf!7004 w2!587))))))

(assert (=> d!90992 (= lt!408756 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12934 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12929 w2!587))))))

(assert (=> d!90992 (invariant!0 (currentBit!12929 w2!587) (currentByte!12934 w2!587) (size!6536 (buf!7004 w2!587)))))

(assert (=> d!90992 (= (bitIndex!0 (size!6536 (buf!7004 w2!587)) (currentByte!12934 w2!587) (currentBit!12929 w2!587)) lt!408756)))

(declare-fun b!268990 () Bool)

(declare-fun res!224275 () Bool)

(assert (=> b!268990 (=> (not res!224275) (not e!188967))))

(assert (=> b!268990 (= res!224275 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408756))))

(declare-fun b!268991 () Bool)

(declare-fun lt!408757 () (_ BitVec 64))

(assert (=> b!268991 (= e!188967 (bvsle lt!408756 (bvmul lt!408757 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268991 (or (= lt!408757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408757)))))

(assert (=> b!268991 (= lt!408757 ((_ sign_extend 32) (size!6536 (buf!7004 w2!587))))))

(assert (= (and d!90992 res!224274) b!268990))

(assert (= (and b!268990 res!224275) b!268991))

(declare-fun m!400533 () Bool)

(assert (=> d!90992 m!400533))

(assert (=> d!90992 m!400477))

(assert (=> b!268940 d!90992))

(declare-fun d!90994 () Bool)

(assert (=> d!90994 (= (invariant!0 (currentBit!12929 w3!25) (currentByte!12934 w3!25) (size!6536 (buf!7004 w3!25))) (and (bvsge (currentBit!12929 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12929 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12934 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12934 w3!25) (size!6536 (buf!7004 w3!25))) (and (= (currentBit!12929 w3!25) #b00000000000000000000000000000000) (= (currentByte!12934 w3!25) (size!6536 (buf!7004 w3!25)))))))))

(assert (=> d!90952 d!90994))

(declare-fun d!90998 () Bool)

(assert (=> d!90998 (= (invariant!0 (currentBit!12929 w2!587) (currentByte!12934 w2!587) (size!6536 (buf!7004 w2!587))) (and (bvsge (currentBit!12929 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12929 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12934 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12934 w2!587) (size!6536 (buf!7004 w2!587))) (and (= (currentBit!12929 w2!587) #b00000000000000000000000000000000) (= (currentByte!12934 w2!587) (size!6536 (buf!7004 w2!587)))))))))

(assert (=> d!90950 d!90998))

(declare-fun b!268992 () Bool)

(declare-fun e!188969 () Bool)

(declare-fun e!188973 () Bool)

(assert (=> b!268992 (= e!188969 e!188973)))

(declare-fun c!12412 () Bool)

(declare-fun lt!408760 () tuple4!426)

(assert (=> b!268992 (= c!12412 (= (_3!993 lt!408760) (_4!213 lt!408760)))))

(declare-fun d!91000 () Bool)

(declare-fun res!224280 () Bool)

(declare-fun e!188970 () Bool)

(assert (=> d!91000 (=> res!224280 e!188970)))

(assert (=> d!91000 (= res!224280 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6536 (buf!7004 w1!591)) (currentByte!12934 w1!591) (currentBit!12929 w1!591))))))

(assert (=> d!91000 (= (arrayBitRangesEq!0 (buf!7004 w1!591) (buf!7004 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6536 (buf!7004 w1!591)) (currentByte!12934 w1!591) (currentBit!12929 w1!591))) e!188970)))

(declare-fun lt!408759 () (_ BitVec 32))

(declare-fun call!4263 () Bool)

(declare-fun bm!4260 () Bool)

(declare-fun lt!408761 () (_ BitVec 32))

(assert (=> bm!4260 (= call!4263 (byteRangesEq!0 (select (arr!7523 (buf!7004 w1!591)) (_3!993 lt!408760)) (select (arr!7523 (buf!7004 w2!587)) (_3!993 lt!408760)) lt!408761 (ite c!12412 lt!408759 #b00000000000000000000000000001000)))))

(declare-fun b!268993 () Bool)

(declare-fun e!188971 () Bool)

(assert (=> b!268993 (= e!188971 (arrayRangesEq!1070 (buf!7004 w1!591) (buf!7004 w2!587) (_1!12196 lt!408760) (_2!12196 lt!408760)))))

(declare-fun b!268994 () Bool)

(declare-fun res!224278 () Bool)

(assert (=> b!268994 (= res!224278 (= lt!408759 #b00000000000000000000000000000000))))

(declare-fun e!188972 () Bool)

(assert (=> b!268994 (=> res!224278 e!188972)))

(declare-fun e!188968 () Bool)

(assert (=> b!268994 (= e!188968 e!188972)))

(declare-fun b!268995 () Bool)

(assert (=> b!268995 (= e!188973 e!188968)))

(declare-fun res!224276 () Bool)

(assert (=> b!268995 (= res!224276 call!4263)))

(assert (=> b!268995 (=> (not res!224276) (not e!188968))))

(declare-fun b!268996 () Bool)

(assert (=> b!268996 (= e!188970 e!188969)))

(declare-fun res!224277 () Bool)

(assert (=> b!268996 (=> (not res!224277) (not e!188969))))

(assert (=> b!268996 (= res!224277 e!188971)))

(declare-fun res!224279 () Bool)

(assert (=> b!268996 (=> res!224279 e!188971)))

(assert (=> b!268996 (= res!224279 (bvsge (_1!12196 lt!408760) (_2!12196 lt!408760)))))

(assert (=> b!268996 (= lt!408759 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6536 (buf!7004 w1!591)) (currentByte!12934 w1!591) (currentBit!12929 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268996 (= lt!408761 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268996 (= lt!408760 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6536 (buf!7004 w1!591)) (currentByte!12934 w1!591) (currentBit!12929 w1!591))))))

(declare-fun b!268997 () Bool)

(assert (=> b!268997 (= e!188972 (byteRangesEq!0 (select (arr!7523 (buf!7004 w1!591)) (_4!213 lt!408760)) (select (arr!7523 (buf!7004 w2!587)) (_4!213 lt!408760)) #b00000000000000000000000000000000 lt!408759))))

(declare-fun b!268998 () Bool)

(assert (=> b!268998 (= e!188973 call!4263)))

(assert (= (and d!91000 (not res!224280)) b!268996))

(assert (= (and b!268996 (not res!224279)) b!268993))

(assert (= (and b!268996 res!224277) b!268992))

(assert (= (and b!268992 c!12412) b!268998))

(assert (= (and b!268992 (not c!12412)) b!268995))

(assert (= (and b!268995 res!224276) b!268994))

(assert (= (and b!268994 (not res!224278)) b!268997))

(assert (= (or b!268998 b!268995) bm!4260))

(declare-fun m!400535 () Bool)

(assert (=> bm!4260 m!400535))

(declare-fun m!400537 () Bool)

(assert (=> bm!4260 m!400537))

(assert (=> bm!4260 m!400535))

(assert (=> bm!4260 m!400537))

(declare-fun m!400539 () Bool)

(assert (=> bm!4260 m!400539))

(declare-fun m!400541 () Bool)

(assert (=> b!268993 m!400541))

(assert (=> b!268996 m!400469))

(declare-fun m!400543 () Bool)

(assert (=> b!268996 m!400543))

(declare-fun m!400545 () Bool)

(assert (=> b!268997 m!400545))

(declare-fun m!400547 () Bool)

(assert (=> b!268997 m!400547))

(assert (=> b!268997 m!400545))

(assert (=> b!268997 m!400547))

(declare-fun m!400549 () Bool)

(assert (=> b!268997 m!400549))

(assert (=> b!268937 d!91000))

(declare-fun d!91008 () Bool)

(declare-fun e!188974 () Bool)

(assert (=> d!91008 e!188974))

(declare-fun res!224281 () Bool)

(assert (=> d!91008 (=> (not res!224281) (not e!188974))))

(declare-fun lt!408763 () (_ BitVec 64))

(declare-fun lt!408767 () (_ BitVec 64))

(declare-fun lt!408765 () (_ BitVec 64))

(assert (=> d!91008 (= res!224281 (= lt!408765 (bvsub lt!408763 lt!408767)))))

(assert (=> d!91008 (or (= (bvand lt!408763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408767 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408763 lt!408767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91008 (= lt!408767 (remainingBits!0 ((_ sign_extend 32) (size!6536 (buf!7004 w1!591))) ((_ sign_extend 32) (currentByte!12934 w1!591)) ((_ sign_extend 32) (currentBit!12929 w1!591))))))

(declare-fun lt!408762 () (_ BitVec 64))

(declare-fun lt!408764 () (_ BitVec 64))

(assert (=> d!91008 (= lt!408763 (bvmul lt!408762 lt!408764))))

(assert (=> d!91008 (or (= lt!408762 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408764 (bvsdiv (bvmul lt!408762 lt!408764) lt!408762)))))

(assert (=> d!91008 (= lt!408764 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91008 (= lt!408762 ((_ sign_extend 32) (size!6536 (buf!7004 w1!591))))))

(assert (=> d!91008 (= lt!408765 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12934 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12929 w1!591))))))

(assert (=> d!91008 (invariant!0 (currentBit!12929 w1!591) (currentByte!12934 w1!591) (size!6536 (buf!7004 w1!591)))))

(assert (=> d!91008 (= (bitIndex!0 (size!6536 (buf!7004 w1!591)) (currentByte!12934 w1!591) (currentBit!12929 w1!591)) lt!408765)))

(declare-fun b!268999 () Bool)

(declare-fun res!224282 () Bool)

(assert (=> b!268999 (=> (not res!224282) (not e!188974))))

(assert (=> b!268999 (= res!224282 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408765))))

(declare-fun b!269000 () Bool)

(declare-fun lt!408766 () (_ BitVec 64))

(assert (=> b!269000 (= e!188974 (bvsle lt!408765 (bvmul lt!408766 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269000 (or (= lt!408766 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408766 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408766)))))

(assert (=> b!269000 (= lt!408766 ((_ sign_extend 32) (size!6536 (buf!7004 w1!591))))))

(assert (= (and d!91008 res!224281) b!268999))

(assert (= (and b!268999 res!224282) b!269000))

(declare-fun m!400551 () Bool)

(assert (=> d!91008 m!400551))

(assert (=> d!91008 m!400475))

(assert (=> b!268937 d!91008))

(assert (=> b!268935 d!91008))

(assert (=> b!268935 d!90992))

(assert (=> b!268938 d!90992))

(declare-fun d!91010 () Bool)

(declare-fun e!188975 () Bool)

(assert (=> d!91010 e!188975))

(declare-fun res!224283 () Bool)

(assert (=> d!91010 (=> (not res!224283) (not e!188975))))

(declare-fun lt!408769 () (_ BitVec 64))

(declare-fun lt!408771 () (_ BitVec 64))

(declare-fun lt!408773 () (_ BitVec 64))

(assert (=> d!91010 (= res!224283 (= lt!408771 (bvsub lt!408769 lt!408773)))))

(assert (=> d!91010 (or (= (bvand lt!408769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408773 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408769 lt!408773) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91010 (= lt!408773 (remainingBits!0 ((_ sign_extend 32) (size!6536 (buf!7004 w3!25))) ((_ sign_extend 32) (currentByte!12934 w3!25)) ((_ sign_extend 32) (currentBit!12929 w3!25))))))

(declare-fun lt!408768 () (_ BitVec 64))

(declare-fun lt!408770 () (_ BitVec 64))

(assert (=> d!91010 (= lt!408769 (bvmul lt!408768 lt!408770))))

(assert (=> d!91010 (or (= lt!408768 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408770 (bvsdiv (bvmul lt!408768 lt!408770) lt!408768)))))

(assert (=> d!91010 (= lt!408770 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91010 (= lt!408768 ((_ sign_extend 32) (size!6536 (buf!7004 w3!25))))))

(assert (=> d!91010 (= lt!408771 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12934 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12929 w3!25))))))

(assert (=> d!91010 (invariant!0 (currentBit!12929 w3!25) (currentByte!12934 w3!25) (size!6536 (buf!7004 w3!25)))))

(assert (=> d!91010 (= (bitIndex!0 (size!6536 (buf!7004 w3!25)) (currentByte!12934 w3!25) (currentBit!12929 w3!25)) lt!408771)))

(declare-fun b!269001 () Bool)

(declare-fun res!224284 () Bool)

(assert (=> b!269001 (=> (not res!224284) (not e!188975))))

(assert (=> b!269001 (= res!224284 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408771))))

(declare-fun b!269002 () Bool)

(declare-fun lt!408772 () (_ BitVec 64))

(assert (=> b!269002 (= e!188975 (bvsle lt!408771 (bvmul lt!408772 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269002 (or (= lt!408772 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408772 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408772)))))

(assert (=> b!269002 (= lt!408772 ((_ sign_extend 32) (size!6536 (buf!7004 w3!25))))))

(assert (= (and d!91010 res!224283) b!269001))

(assert (= (and b!269001 res!224284) b!269002))

(declare-fun m!400553 () Bool)

(assert (=> d!91010 m!400553))

(assert (=> d!91010 m!400479))

(assert (=> b!268938 d!91010))

(declare-fun d!91012 () Bool)

(assert (=> d!91012 (= (invariant!0 (currentBit!12929 w1!591) (currentByte!12934 w1!591) (size!6536 (buf!7004 w1!591))) (and (bvsge (currentBit!12929 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12929 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12934 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12934 w1!591) (size!6536 (buf!7004 w1!591))) (and (= (currentBit!12929 w1!591) #b00000000000000000000000000000000) (= (currentByte!12934 w1!591) (size!6536 (buf!7004 w1!591)))))))))

(assert (=> d!90948 d!91012))

(check-sat (not b!268996) (not b!268984) (not d!91010) (not b!268997) (not bm!4260) (not b!268983) (not d!90992) (not bm!4259) (not b!268980) (not b!268993) (not d!91008))
(check-sat)
