; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59818 () Bool)

(assert start!59818)

(declare-fun res!227271 () Bool)

(declare-fun e!192925 () Bool)

(assert (=> start!59818 (=> (not res!227271) (not e!192925))))

(declare-datatypes ((array!15280 0))(
  ( (array!15281 (arr!7631 (Array (_ BitVec 32) (_ BitVec 8))) (size!6644 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12102 0))(
  ( (BitStream!12103 (buf!7112 array!15280) (currentByte!13122 (_ BitVec 32)) (currentBit!13117 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12102)

(assert (=> start!59818 (= res!227271 (not (= (size!6644 (buf!7112 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59818 e!192925))

(declare-fun e!192923 () Bool)

(declare-fun inv!12 (BitStream!12102) Bool)

(assert (=> start!59818 (and (inv!12 bs!71) e!192923)))

(declare-fun b!273027 () Bool)

(declare-fun e!192924 () Bool)

(assert (=> b!273027 (= e!192925 (not e!192924))))

(declare-fun res!227272 () Bool)

(assert (=> b!273027 (=> res!227272 e!192924)))

(declare-fun lt!410919 () (_ BitVec 64))

(declare-fun lt!410918 () (_ BitVec 64))

(assert (=> b!273027 (= res!227272 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!410919) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!410918) (bvsgt lt!410918 lt!410919)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273027 (= lt!410918 (bitIndex!0 (size!6644 (buf!7112 bs!71)) (currentByte!13122 bs!71) (currentBit!13117 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15280 array!15280 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!273027 (arrayBitRangesEq!0 (buf!7112 bs!71) (buf!7112 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410919)))

(assert (=> b!273027 (= lt!410919 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6644 (buf!7112 bs!71)))))))

(declare-datatypes ((Unit!19267 0))(
  ( (Unit!19268) )
))
(declare-fun lt!410921 () Unit!19267)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15280) Unit!19267)

(assert (=> b!273027 (= lt!410921 (arrayBitEqImpliesRangesEqLemma!0 (buf!7112 bs!71)))))

(declare-fun b!273028 () Bool)

(declare-fun isPrefixOf!0 (BitStream!12102 BitStream!12102) Bool)

(assert (=> b!273028 (= e!192924 (isPrefixOf!0 bs!71 bs!71))))

(assert (=> b!273028 (arrayBitRangesEq!0 (buf!7112 bs!71) (buf!7112 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410918)))

(declare-fun lt!410920 () Unit!19267)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!15280 array!15280 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19267)

(assert (=> b!273028 (= lt!410920 (arrayBitRangesEqSlicedLemma!0 (buf!7112 bs!71) (buf!7112 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410919 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410918))))

(declare-fun b!273029 () Bool)

(declare-fun array_inv!6368 (array!15280) Bool)

(assert (=> b!273029 (= e!192923 (array_inv!6368 (buf!7112 bs!71)))))

(assert (= (and start!59818 res!227271) b!273027))

(assert (= (and b!273027 (not res!227272)) b!273028))

(assert (= start!59818 b!273029))

(declare-fun m!405919 () Bool)

(assert (=> start!59818 m!405919))

(declare-fun m!405921 () Bool)

(assert (=> b!273027 m!405921))

(declare-fun m!405923 () Bool)

(assert (=> b!273027 m!405923))

(declare-fun m!405925 () Bool)

(assert (=> b!273027 m!405925))

(declare-fun m!405927 () Bool)

(assert (=> b!273028 m!405927))

(declare-fun m!405929 () Bool)

(assert (=> b!273028 m!405929))

(declare-fun m!405931 () Bool)

(assert (=> b!273028 m!405931))

(declare-fun m!405933 () Bool)

(assert (=> b!273029 m!405933))

(check-sat (not b!273028) (not start!59818) (not b!273027) (not b!273029))
(check-sat)
(get-model)

(declare-fun d!93370 () Bool)

(declare-fun res!227294 () Bool)

(declare-fun e!192948 () Bool)

(assert (=> d!93370 (=> (not res!227294) (not e!192948))))

(assert (=> d!93370 (= res!227294 (= (size!6644 (buf!7112 bs!71)) (size!6644 (buf!7112 bs!71))))))

(assert (=> d!93370 (= (isPrefixOf!0 bs!71 bs!71) e!192948)))

(declare-fun b!273053 () Bool)

(declare-fun res!227295 () Bool)

(assert (=> b!273053 (=> (not res!227295) (not e!192948))))

(assert (=> b!273053 (= res!227295 (bvsle (bitIndex!0 (size!6644 (buf!7112 bs!71)) (currentByte!13122 bs!71) (currentBit!13117 bs!71)) (bitIndex!0 (size!6644 (buf!7112 bs!71)) (currentByte!13122 bs!71) (currentBit!13117 bs!71))))))

(declare-fun b!273054 () Bool)

(declare-fun e!192949 () Bool)

(assert (=> b!273054 (= e!192948 e!192949)))

(declare-fun res!227293 () Bool)

(assert (=> b!273054 (=> res!227293 e!192949)))

(assert (=> b!273054 (= res!227293 (= (size!6644 (buf!7112 bs!71)) #b00000000000000000000000000000000))))

(declare-fun b!273055 () Bool)

(assert (=> b!273055 (= e!192949 (arrayBitRangesEq!0 (buf!7112 bs!71) (buf!7112 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6644 (buf!7112 bs!71)) (currentByte!13122 bs!71) (currentBit!13117 bs!71))))))

(assert (= (and d!93370 res!227294) b!273053))

(assert (= (and b!273053 res!227295) b!273054))

(assert (= (and b!273054 (not res!227293)) b!273055))

(assert (=> b!273053 m!405921))

(assert (=> b!273053 m!405921))

(assert (=> b!273055 m!405921))

(assert (=> b!273055 m!405921))

(declare-fun m!405951 () Bool)

(assert (=> b!273055 m!405951))

(assert (=> b!273028 d!93370))

(declare-fun b!273115 () Bool)

(declare-fun e!193000 () Bool)

(declare-fun e!193001 () Bool)

(assert (=> b!273115 (= e!193000 e!193001)))

(declare-fun res!227342 () Bool)

(declare-fun call!4405 () Bool)

(assert (=> b!273115 (= res!227342 call!4405)))

(assert (=> b!273115 (=> (not res!227342) (not e!193001))))

(declare-fun b!273116 () Bool)

(declare-fun res!227343 () Bool)

(declare-fun lt!410959 () (_ BitVec 32))

(assert (=> b!273116 (= res!227343 (= lt!410959 #b00000000000000000000000000000000))))

(declare-fun e!193002 () Bool)

(assert (=> b!273116 (=> res!227343 e!193002)))

(assert (=> b!273116 (= e!193001 e!193002)))

(declare-fun b!273117 () Bool)

(declare-fun e!192999 () Bool)

(declare-fun e!192998 () Bool)

(assert (=> b!273117 (= e!192999 e!192998)))

(declare-fun res!227341 () Bool)

(assert (=> b!273117 (=> (not res!227341) (not e!192998))))

(declare-fun e!193003 () Bool)

(assert (=> b!273117 (= res!227341 e!193003)))

(declare-fun res!227344 () Bool)

(assert (=> b!273117 (=> res!227344 e!193003)))

(declare-datatypes ((tuple4!500 0))(
  ( (tuple4!501 (_1!12233 (_ BitVec 32)) (_2!12233 (_ BitVec 32)) (_3!1030 (_ BitVec 32)) (_4!250 (_ BitVec 32))) )
))
(declare-fun lt!410960 () tuple4!500)

(assert (=> b!273117 (= res!227344 (bvsge (_1!12233 lt!410960) (_2!12233 lt!410960)))))

(assert (=> b!273117 (= lt!410959 ((_ extract 31 0) (bvsrem lt!410918 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410958 () (_ BitVec 32))

(assert (=> b!273117 (= lt!410958 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!500)

(assert (=> b!273117 (= lt!410960 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410918))))

(declare-fun b!273118 () Bool)

(declare-fun arrayRangesEq!1143 (array!15280 array!15280 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273118 (= e!193003 (arrayRangesEq!1143 (buf!7112 bs!71) (buf!7112 bs!71) (_1!12233 lt!410960) (_2!12233 lt!410960)))))

(declare-fun b!273119 () Bool)

(assert (=> b!273119 (= e!192998 e!193000)))

(declare-fun c!12590 () Bool)

(assert (=> b!273119 (= c!12590 (= (_3!1030 lt!410960) (_4!250 lt!410960)))))

(declare-fun d!93378 () Bool)

(declare-fun res!227345 () Bool)

(assert (=> d!93378 (=> res!227345 e!192999)))

(assert (=> d!93378 (= res!227345 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410918))))

(assert (=> d!93378 (= (arrayBitRangesEq!0 (buf!7112 bs!71) (buf!7112 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410918) e!192999)))

(declare-fun b!273120 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273120 (= e!193002 (byteRangesEq!0 (select (arr!7631 (buf!7112 bs!71)) (_4!250 lt!410960)) (select (arr!7631 (buf!7112 bs!71)) (_4!250 lt!410960)) #b00000000000000000000000000000000 lt!410959))))

(declare-fun b!273121 () Bool)

(assert (=> b!273121 (= e!193000 call!4405)))

(declare-fun bm!4402 () Bool)

(assert (=> bm!4402 (= call!4405 (byteRangesEq!0 (select (arr!7631 (buf!7112 bs!71)) (_3!1030 lt!410960)) (select (arr!7631 (buf!7112 bs!71)) (_3!1030 lt!410960)) lt!410958 (ite c!12590 lt!410959 #b00000000000000000000000000001000)))))

(assert (= (and d!93378 (not res!227345)) b!273117))

(assert (= (and b!273117 (not res!227344)) b!273118))

(assert (= (and b!273117 res!227341) b!273119))

(assert (= (and b!273119 c!12590) b!273121))

(assert (= (and b!273119 (not c!12590)) b!273115))

(assert (= (and b!273115 res!227342) b!273116))

(assert (= (and b!273116 (not res!227343)) b!273120))

(assert (= (or b!273121 b!273115) bm!4402))

(declare-fun m!405973 () Bool)

(assert (=> b!273117 m!405973))

(declare-fun m!405975 () Bool)

(assert (=> b!273118 m!405975))

(declare-fun m!405977 () Bool)

(assert (=> b!273120 m!405977))

(assert (=> b!273120 m!405977))

(assert (=> b!273120 m!405977))

(assert (=> b!273120 m!405977))

(declare-fun m!405979 () Bool)

(assert (=> b!273120 m!405979))

(declare-fun m!405981 () Bool)

(assert (=> bm!4402 m!405981))

(assert (=> bm!4402 m!405981))

(assert (=> bm!4402 m!405981))

(assert (=> bm!4402 m!405981))

(declare-fun m!405983 () Bool)

(assert (=> bm!4402 m!405983))

(assert (=> b!273028 d!93378))

(declare-fun d!93390 () Bool)

(assert (=> d!93390 (arrayBitRangesEq!0 (buf!7112 bs!71) (buf!7112 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410918)))

(declare-fun lt!410974 () Unit!19267)

(declare-fun choose!4 (array!15280 array!15280 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19267)

(assert (=> d!93390 (= lt!410974 (choose!4 (buf!7112 bs!71) (buf!7112 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410919 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410918))))

(assert (=> d!93390 (bvsle (size!6644 (buf!7112 bs!71)) (size!6644 (buf!7112 bs!71)))))

(assert (=> d!93390 (= (arrayBitRangesEqSlicedLemma!0 (buf!7112 bs!71) (buf!7112 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410919 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410918) lt!410974)))

(declare-fun bs!23556 () Bool)

(assert (= bs!23556 d!93390))

(assert (=> bs!23556 m!405929))

(declare-fun m!405997 () Bool)

(assert (=> bs!23556 m!405997))

(assert (=> b!273028 d!93390))

(declare-fun d!93394 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93394 (= (inv!12 bs!71) (invariant!0 (currentBit!13117 bs!71) (currentByte!13122 bs!71) (size!6644 (buf!7112 bs!71))))))

(declare-fun bs!23557 () Bool)

(assert (= bs!23557 d!93394))

(declare-fun m!405999 () Bool)

(assert (=> bs!23557 m!405999))

(assert (=> start!59818 d!93394))

(declare-fun d!93396 () Bool)

(declare-fun e!193026 () Bool)

(assert (=> d!93396 e!193026))

(declare-fun res!227373 () Bool)

(assert (=> d!93396 (=> (not res!227373) (not e!193026))))

(declare-fun lt!411029 () (_ BitVec 64))

(declare-fun lt!411028 () (_ BitVec 64))

(declare-fun lt!411027 () (_ BitVec 64))

(assert (=> d!93396 (= res!227373 (= lt!411029 (bvsub lt!411027 lt!411028)))))

(assert (=> d!93396 (or (= (bvand lt!411027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411028 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411027 lt!411028) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93396 (= lt!411028 (remainingBits!0 ((_ sign_extend 32) (size!6644 (buf!7112 bs!71))) ((_ sign_extend 32) (currentByte!13122 bs!71)) ((_ sign_extend 32) (currentBit!13117 bs!71))))))

(declare-fun lt!411025 () (_ BitVec 64))

(declare-fun lt!411026 () (_ BitVec 64))

(assert (=> d!93396 (= lt!411027 (bvmul lt!411025 lt!411026))))

(assert (=> d!93396 (or (= lt!411025 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411026 (bvsdiv (bvmul lt!411025 lt!411026) lt!411025)))))

(assert (=> d!93396 (= lt!411026 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93396 (= lt!411025 ((_ sign_extend 32) (size!6644 (buf!7112 bs!71))))))

(assert (=> d!93396 (= lt!411029 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13122 bs!71)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13117 bs!71))))))

(assert (=> d!93396 (invariant!0 (currentBit!13117 bs!71) (currentByte!13122 bs!71) (size!6644 (buf!7112 bs!71)))))

(assert (=> d!93396 (= (bitIndex!0 (size!6644 (buf!7112 bs!71)) (currentByte!13122 bs!71) (currentBit!13117 bs!71)) lt!411029)))

(declare-fun b!273153 () Bool)

(declare-fun res!227374 () Bool)

(assert (=> b!273153 (=> (not res!227374) (not e!193026))))

(assert (=> b!273153 (= res!227374 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411029))))

(declare-fun b!273154 () Bool)

(declare-fun lt!411024 () (_ BitVec 64))

(assert (=> b!273154 (= e!193026 (bvsle lt!411029 (bvmul lt!411024 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273154 (or (= lt!411024 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411024 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411024)))))

(assert (=> b!273154 (= lt!411024 ((_ sign_extend 32) (size!6644 (buf!7112 bs!71))))))

(assert (= (and d!93396 res!227373) b!273153))

(assert (= (and b!273153 res!227374) b!273154))

(declare-fun m!406023 () Bool)

(assert (=> d!93396 m!406023))

(assert (=> d!93396 m!405999))

(assert (=> b!273027 d!93396))

(declare-fun b!273155 () Bool)

(declare-fun e!193029 () Bool)

(declare-fun e!193030 () Bool)

(assert (=> b!273155 (= e!193029 e!193030)))

(declare-fun res!227376 () Bool)

(declare-fun call!4408 () Bool)

(assert (=> b!273155 (= res!227376 call!4408)))

(assert (=> b!273155 (=> (not res!227376) (not e!193030))))

(declare-fun b!273156 () Bool)

(declare-fun res!227377 () Bool)

(declare-fun lt!411031 () (_ BitVec 32))

(assert (=> b!273156 (= res!227377 (= lt!411031 #b00000000000000000000000000000000))))

(declare-fun e!193031 () Bool)

(assert (=> b!273156 (=> res!227377 e!193031)))

(assert (=> b!273156 (= e!193030 e!193031)))

(declare-fun b!273157 () Bool)

(declare-fun e!193028 () Bool)

(declare-fun e!193027 () Bool)

(assert (=> b!273157 (= e!193028 e!193027)))

(declare-fun res!227375 () Bool)

(assert (=> b!273157 (=> (not res!227375) (not e!193027))))

(declare-fun e!193032 () Bool)

(assert (=> b!273157 (= res!227375 e!193032)))

(declare-fun res!227378 () Bool)

(assert (=> b!273157 (=> res!227378 e!193032)))

(declare-fun lt!411032 () tuple4!500)

(assert (=> b!273157 (= res!227378 (bvsge (_1!12233 lt!411032) (_2!12233 lt!411032)))))

(assert (=> b!273157 (= lt!411031 ((_ extract 31 0) (bvsrem lt!410919 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411030 () (_ BitVec 32))

(assert (=> b!273157 (= lt!411030 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273157 (= lt!411032 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410919))))

(declare-fun b!273158 () Bool)

(assert (=> b!273158 (= e!193032 (arrayRangesEq!1143 (buf!7112 bs!71) (buf!7112 bs!71) (_1!12233 lt!411032) (_2!12233 lt!411032)))))

(declare-fun b!273159 () Bool)

(assert (=> b!273159 (= e!193027 e!193029)))

(declare-fun c!12593 () Bool)

(assert (=> b!273159 (= c!12593 (= (_3!1030 lt!411032) (_4!250 lt!411032)))))

(declare-fun d!93406 () Bool)

(declare-fun res!227379 () Bool)

(assert (=> d!93406 (=> res!227379 e!193028)))

(assert (=> d!93406 (= res!227379 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410919))))

(assert (=> d!93406 (= (arrayBitRangesEq!0 (buf!7112 bs!71) (buf!7112 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410919) e!193028)))

(declare-fun b!273160 () Bool)

(assert (=> b!273160 (= e!193031 (byteRangesEq!0 (select (arr!7631 (buf!7112 bs!71)) (_4!250 lt!411032)) (select (arr!7631 (buf!7112 bs!71)) (_4!250 lt!411032)) #b00000000000000000000000000000000 lt!411031))))

(declare-fun b!273161 () Bool)

(assert (=> b!273161 (= e!193029 call!4408)))

(declare-fun bm!4405 () Bool)

(assert (=> bm!4405 (= call!4408 (byteRangesEq!0 (select (arr!7631 (buf!7112 bs!71)) (_3!1030 lt!411032)) (select (arr!7631 (buf!7112 bs!71)) (_3!1030 lt!411032)) lt!411030 (ite c!12593 lt!411031 #b00000000000000000000000000001000)))))

(assert (= (and d!93406 (not res!227379)) b!273157))

(assert (= (and b!273157 (not res!227378)) b!273158))

(assert (= (and b!273157 res!227375) b!273159))

(assert (= (and b!273159 c!12593) b!273161))

(assert (= (and b!273159 (not c!12593)) b!273155))

(assert (= (and b!273155 res!227376) b!273156))

(assert (= (and b!273156 (not res!227377)) b!273160))

(assert (= (or b!273161 b!273155) bm!4405))

(declare-fun m!406025 () Bool)

(assert (=> b!273157 m!406025))

(declare-fun m!406027 () Bool)

(assert (=> b!273158 m!406027))

(declare-fun m!406029 () Bool)

(assert (=> b!273160 m!406029))

(assert (=> b!273160 m!406029))

(assert (=> b!273160 m!406029))

(assert (=> b!273160 m!406029))

(declare-fun m!406031 () Bool)

(assert (=> b!273160 m!406031))

(declare-fun m!406033 () Bool)

(assert (=> bm!4405 m!406033))

(assert (=> bm!4405 m!406033))

(assert (=> bm!4405 m!406033))

(assert (=> bm!4405 m!406033))

(declare-fun m!406035 () Bool)

(assert (=> bm!4405 m!406035))

(assert (=> b!273027 d!93406))

(declare-fun d!93408 () Bool)

(declare-fun e!193042 () Bool)

(assert (=> d!93408 e!193042))

(declare-fun res!227389 () Bool)

(assert (=> d!93408 (=> (not res!227389) (not e!193042))))

(declare-fun lt!411049 () (_ BitVec 64))

(declare-fun lt!411050 () (_ BitVec 64))

(assert (=> d!93408 (= res!227389 (or (= lt!411049 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411050 (bvsdiv (bvmul lt!411049 lt!411050) lt!411049))))))

(assert (=> d!93408 (= lt!411050 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93408 (= lt!411049 ((_ sign_extend 32) (size!6644 (buf!7112 bs!71))))))

(declare-fun lt!411048 () Unit!19267)

(declare-fun choose!44 (array!15280) Unit!19267)

(assert (=> d!93408 (= lt!411048 (choose!44 (buf!7112 bs!71)))))

(assert (=> d!93408 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7112 bs!71)) lt!411048)))

(declare-fun b!273173 () Bool)

(assert (=> b!273173 (= e!193042 (arrayBitRangesEq!0 (buf!7112 bs!71) (buf!7112 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6644 (buf!7112 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93408 res!227389) b!273173))

(declare-fun m!406051 () Bool)

(assert (=> d!93408 m!406051))

(declare-fun m!406053 () Bool)

(assert (=> b!273173 m!406053))

(assert (=> b!273027 d!93408))

(declare-fun d!93414 () Bool)

(assert (=> d!93414 (= (array_inv!6368 (buf!7112 bs!71)) (bvsge (size!6644 (buf!7112 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!273029 d!93414))

(check-sat (not bm!4402) (not b!273160) (not b!273117) (not b!273118) (not d!93390) (not b!273053) (not d!93396) (not b!273120) (not b!273173) (not b!273158) (not d!93408) (not bm!4405) (not d!93394) (not b!273055) (not b!273157))
(check-sat)
