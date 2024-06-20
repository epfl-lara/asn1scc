; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30050 () Bool)

(assert start!30050)

(declare-fun b!154146 () Bool)

(declare-fun e!103553 () Bool)

(declare-fun e!103552 () Bool)

(assert (=> b!154146 (= e!103553 e!103552)))

(declare-fun res!129047 () Bool)

(assert (=> b!154146 (=> (not res!129047) (not e!103552))))

(declare-fun lt!240556 () (_ BitVec 64))

(declare-datatypes ((array!6966 0))(
  ( (array!6967 (arr!3961 (Array (_ BitVec 32) (_ BitVec 8))) (size!3138 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5534 0))(
  ( (BitStream!5535 (buf!3641 array!6966) (currentByte!6660 (_ BitVec 32)) (currentBit!6655 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5534)

(assert (=> b!154146 (= res!129047 (bvsle lt!240556 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3138 (buf!3641 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154146 (= lt!240556 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3138 (buf!3641 bs1!10)) (currentByte!6660 bs1!10) (currentBit!6655 bs1!10))))))

(declare-fun b!154147 () Bool)

(declare-fun bs2!18 () BitStream!5534)

(declare-fun inv!12 (BitStream!5534) Bool)

(assert (=> b!154147 (= e!103552 (not (inv!12 (BitStream!5535 (buf!3641 bs2!18) (currentByte!6660 bs1!10) (currentBit!6655 bs1!10)))))))

(declare-fun b!154148 () Bool)

(declare-fun res!129045 () Bool)

(assert (=> b!154148 (=> (not res!129045) (not e!103552))))

(assert (=> b!154148 (= res!129045 (bvsle lt!240556 (bitIndex!0 (size!3138 (buf!3641 bs2!18)) (currentByte!6660 bs2!18) (currentBit!6655 bs2!18))))))

(declare-fun res!129048 () Bool)

(assert (=> start!30050 (=> (not res!129048) (not e!103553))))

(assert (=> start!30050 (= res!129048 (= (size!3138 (buf!3641 bs1!10)) (size!3138 (buf!3641 bs2!18))))))

(assert (=> start!30050 e!103553))

(declare-fun e!103557 () Bool)

(assert (=> start!30050 (and (inv!12 bs1!10) e!103557)))

(declare-fun e!103554 () Bool)

(assert (=> start!30050 (and (inv!12 bs2!18) e!103554)))

(declare-fun b!154149 () Bool)

(declare-fun array_inv!2927 (array!6966) Bool)

(assert (=> b!154149 (= e!103554 (array_inv!2927 (buf!3641 bs2!18)))))

(declare-fun b!154150 () Bool)

(assert (=> b!154150 (= e!103557 (array_inv!2927 (buf!3641 bs1!10)))))

(declare-fun b!154151 () Bool)

(declare-fun res!129046 () Bool)

(assert (=> b!154151 (=> (not res!129046) (not e!103552))))

(declare-fun arrayBitRangesEq!0 (array!6966 array!6966 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154151 (= res!129046 (arrayBitRangesEq!0 (buf!3641 bs1!10) (buf!3641 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240556))))

(assert (= (and start!30050 res!129048) b!154146))

(assert (= (and b!154146 res!129047) b!154148))

(assert (= (and b!154148 res!129045) b!154151))

(assert (= (and b!154151 res!129046) b!154147))

(assert (= start!30050 b!154150))

(assert (= start!30050 b!154149))

(declare-fun m!240123 () Bool)

(assert (=> b!154150 m!240123))

(declare-fun m!240125 () Bool)

(assert (=> b!154146 m!240125))

(declare-fun m!240127 () Bool)

(assert (=> b!154149 m!240127))

(declare-fun m!240129 () Bool)

(assert (=> b!154148 m!240129))

(declare-fun m!240131 () Bool)

(assert (=> b!154151 m!240131))

(declare-fun m!240133 () Bool)

(assert (=> start!30050 m!240133))

(declare-fun m!240135 () Bool)

(assert (=> start!30050 m!240135))

(declare-fun m!240137 () Bool)

(assert (=> b!154147 m!240137))

(push 1)

(assert (not b!154150))

(assert (not b!154151))

(assert (not b!154146))

(assert (not start!30050))

(assert (not b!154147))

(assert (not b!154148))

(assert (not b!154149))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50846 () Bool)

(declare-fun e!103582 () Bool)

(assert (=> d!50846 e!103582))

(declare-fun res!129076 () Bool)

(assert (=> d!50846 (=> (not res!129076) (not e!103582))))

(declare-fun lt!240604 () (_ BitVec 64))

(declare-fun lt!240603 () (_ BitVec 64))

(declare-fun lt!240606 () (_ BitVec 64))

(assert (=> d!50846 (= res!129076 (= lt!240603 (bvsub lt!240606 lt!240604)))))

(assert (=> d!50846 (or (= (bvand lt!240606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240604 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240606 lt!240604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50846 (= lt!240604 (remainingBits!0 ((_ sign_extend 32) (size!3138 (buf!3641 bs1!10))) ((_ sign_extend 32) (currentByte!6660 bs1!10)) ((_ sign_extend 32) (currentBit!6655 bs1!10))))))

(declare-fun lt!240607 () (_ BitVec 64))

(declare-fun lt!240605 () (_ BitVec 64))

(assert (=> d!50846 (= lt!240606 (bvmul lt!240607 lt!240605))))

(assert (=> d!50846 (or (= lt!240607 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240605 (bvsdiv (bvmul lt!240607 lt!240605) lt!240607)))))

(assert (=> d!50846 (= lt!240605 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50846 (= lt!240607 ((_ sign_extend 32) (size!3138 (buf!3641 bs1!10))))))

(assert (=> d!50846 (= lt!240603 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6660 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6655 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50846 (invariant!0 (currentBit!6655 bs1!10) (currentByte!6660 bs1!10) (size!3138 (buf!3641 bs1!10)))))

(assert (=> d!50846 (= (bitIndex!0 (size!3138 (buf!3641 bs1!10)) (currentByte!6660 bs1!10) (currentBit!6655 bs1!10)) lt!240603)))

(declare-fun b!154185 () Bool)

(declare-fun res!129077 () Bool)

(assert (=> b!154185 (=> (not res!129077) (not e!103582))))

(assert (=> b!154185 (= res!129077 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240603))))

(declare-fun b!154186 () Bool)

(declare-fun lt!240602 () (_ BitVec 64))

(assert (=> b!154186 (= e!103582 (bvsle lt!240603 (bvmul lt!240602 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154186 (or (= lt!240602 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240602 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240602)))))

(assert (=> b!154186 (= lt!240602 ((_ sign_extend 32) (size!3138 (buf!3641 bs1!10))))))

(assert (= (and d!50846 res!129076) b!154185))

(assert (= (and b!154185 res!129077) b!154186))

(declare-fun m!240169 () Bool)

(assert (=> d!50846 m!240169))

(declare-fun m!240171 () Bool)

(assert (=> d!50846 m!240171))

(assert (=> b!154146 d!50846))

(declare-fun b!154230 () Bool)

(declare-fun e!103617 () Bool)

(declare-fun call!2195 () Bool)

(assert (=> b!154230 (= e!103617 call!2195)))

(declare-fun bm!2192 () Bool)

(declare-fun lt!240648 () (_ BitVec 32))

(declare-datatypes ((tuple4!190 0))(
  ( (tuple4!191 (_1!7228 (_ BitVec 32)) (_2!7228 (_ BitVec 32)) (_3!398 (_ BitVec 32)) (_4!95 (_ BitVec 32))) )
))
(declare-fun lt!240647 () tuple4!190)

(declare-fun c!8211 () Bool)

(declare-fun lt!240649 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2192 (= call!2195 (byteRangesEq!0 (select (arr!3961 (buf!3641 bs1!10)) (_3!398 lt!240647)) (select (arr!3961 (buf!3641 bs2!18)) (_3!398 lt!240647)) lt!240649 (ite c!8211 lt!240648 #b00000000000000000000000000001000)))))

(declare-fun e!103622 () Bool)

(declare-fun b!154231 () Bool)

(assert (=> b!154231 (= e!103622 (byteRangesEq!0 (select (arr!3961 (buf!3641 bs1!10)) (_4!95 lt!240647)) (select (arr!3961 (buf!3641 bs2!18)) (_4!95 lt!240647)) #b00000000000000000000000000000000 lt!240648))))

(declare-fun b!154232 () Bool)

(declare-fun e!103620 () Bool)

(declare-fun arrayRangesEq!388 (array!6966 array!6966 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154232 (= e!103620 (arrayRangesEq!388 (buf!3641 bs1!10) (buf!3641 bs2!18) (_1!7228 lt!240647) (_2!7228 lt!240647)))))

(declare-fun d!50864 () Bool)

(declare-fun res!129113 () Bool)

(declare-fun e!103618 () Bool)

(assert (=> d!50864 (=> res!129113 e!103618)))

(assert (=> d!50864 (= res!129113 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240556))))

(assert (=> d!50864 (= (arrayBitRangesEq!0 (buf!3641 bs1!10) (buf!3641 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240556) e!103618)))

(declare-fun b!154233 () Bool)

(declare-fun e!103619 () Bool)

(assert (=> b!154233 (= e!103617 e!103619)))

(declare-fun res!129115 () Bool)

(assert (=> b!154233 (= res!129115 call!2195)))

(assert (=> b!154233 (=> (not res!129115) (not e!103619))))

(declare-fun b!154234 () Bool)

(declare-fun e!103621 () Bool)

(assert (=> b!154234 (= e!103618 e!103621)))

(declare-fun res!129112 () Bool)

(assert (=> b!154234 (=> (not res!129112) (not e!103621))))

(assert (=> b!154234 (= res!129112 e!103620)))

(declare-fun res!129114 () Bool)

(assert (=> b!154234 (=> res!129114 e!103620)))

(assert (=> b!154234 (= res!129114 (bvsge (_1!7228 lt!240647) (_2!7228 lt!240647)))))

(assert (=> b!154234 (= lt!240648 ((_ extract 31 0) (bvsrem lt!240556 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154234 (= lt!240649 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!190)

(assert (=> b!154234 (= lt!240647 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240556))))

(declare-fun b!154235 () Bool)

(declare-fun res!129111 () Bool)

(assert (=> b!154235 (= res!129111 (= lt!240648 #b00000000000000000000000000000000))))

(assert (=> b!154235 (=> res!129111 e!103622)))

(assert (=> b!154235 (= e!103619 e!103622)))

(declare-fun b!154236 () Bool)

(assert (=> b!154236 (= e!103621 e!103617)))

(assert (=> b!154236 (= c!8211 (= (_3!398 lt!240647) (_4!95 lt!240647)))))

(assert (= (and d!50864 (not res!129113)) b!154234))

(assert (= (and b!154234 (not res!129114)) b!154232))

(assert (= (and b!154234 res!129112) b!154236))

(assert (= (and b!154236 c!8211) b!154230))

(assert (= (and b!154236 (not c!8211)) b!154233))

(assert (= (and b!154233 res!129115) b!154235))

(assert (= (and b!154235 (not res!129111)) b!154231))

(assert (= (or b!154230 b!154233) bm!2192))

(declare-fun m!240195 () Bool)

(assert (=> bm!2192 m!240195))

(declare-fun m!240197 () Bool)

(assert (=> bm!2192 m!240197))

(assert (=> bm!2192 m!240195))

(assert (=> bm!2192 m!240197))

(declare-fun m!240199 () Bool)

(assert (=> bm!2192 m!240199))

(declare-fun m!240201 () Bool)

(assert (=> b!154231 m!240201))

(declare-fun m!240203 () Bool)

(assert (=> b!154231 m!240203))

(assert (=> b!154231 m!240201))

(assert (=> b!154231 m!240203))

(declare-fun m!240205 () Bool)

(assert (=> b!154231 m!240205))

(declare-fun m!240207 () Bool)

(assert (=> b!154232 m!240207))

(declare-fun m!240209 () Bool)

(assert (=> b!154234 m!240209))

(assert (=> b!154151 d!50864))

(declare-fun d!50870 () Bool)

(assert (=> d!50870 (= (array_inv!2927 (buf!3641 bs1!10)) (bvsge (size!3138 (buf!3641 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154150 d!50870))

(declare-fun d!50872 () Bool)

(assert (=> d!50872 (= (array_inv!2927 (buf!3641 bs2!18)) (bvsge (size!3138 (buf!3641 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154149 d!50872))

(declare-fun d!50874 () Bool)

(assert (=> d!50874 (= (inv!12 (BitStream!5535 (buf!3641 bs2!18) (currentByte!6660 bs1!10) (currentBit!6655 bs1!10))) (invariant!0 (currentBit!6655 (BitStream!5535 (buf!3641 bs2!18) (currentByte!6660 bs1!10) (currentBit!6655 bs1!10))) (currentByte!6660 (BitStream!5535 (buf!3641 bs2!18) (currentByte!6660 bs1!10) (currentBit!6655 bs1!10))) (size!3138 (buf!3641 (BitStream!5535 (buf!3641 bs2!18) (currentByte!6660 bs1!10) (currentBit!6655 bs1!10))))))))

(declare-fun bs!12437 () Bool)

(assert (= bs!12437 d!50874))

(declare-fun m!240211 () Bool)

(assert (=> bs!12437 m!240211))

(assert (=> b!154147 d!50874))

(declare-fun d!50876 () Bool)

(declare-fun e!103623 () Bool)

(assert (=> d!50876 e!103623))

(declare-fun res!129116 () Bool)

(assert (=> d!50876 (=> (not res!129116) (not e!103623))))

(declare-fun lt!240654 () (_ BitVec 64))

(declare-fun lt!240651 () (_ BitVec 64))

(declare-fun lt!240652 () (_ BitVec 64))

(assert (=> d!50876 (= res!129116 (= lt!240651 (bvsub lt!240654 lt!240652)))))

(assert (=> d!50876 (or (= (bvand lt!240654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240652 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240654 lt!240652) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50876 (= lt!240652 (remainingBits!0 ((_ sign_extend 32) (size!3138 (buf!3641 bs2!18))) ((_ sign_extend 32) (currentByte!6660 bs2!18)) ((_ sign_extend 32) (currentBit!6655 bs2!18))))))

(declare-fun lt!240655 () (_ BitVec 64))

(declare-fun lt!240653 () (_ BitVec 64))

(assert (=> d!50876 (= lt!240654 (bvmul lt!240655 lt!240653))))

(assert (=> d!50876 (or (= lt!240655 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240653 (bvsdiv (bvmul lt!240655 lt!240653) lt!240655)))))

(assert (=> d!50876 (= lt!240653 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50876 (= lt!240655 ((_ sign_extend 32) (size!3138 (buf!3641 bs2!18))))))

(assert (=> d!50876 (= lt!240651 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6660 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6655 bs2!18))))))

(assert (=> d!50876 (invariant!0 (currentBit!6655 bs2!18) (currentByte!6660 bs2!18) (size!3138 (buf!3641 bs2!18)))))

(assert (=> d!50876 (= (bitIndex!0 (size!3138 (buf!3641 bs2!18)) (currentByte!6660 bs2!18) (currentBit!6655 bs2!18)) lt!240651)))

(declare-fun b!154237 () Bool)

(declare-fun res!129117 () Bool)

(assert (=> b!154237 (=> (not res!129117) (not e!103623))))

(assert (=> b!154237 (= res!129117 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240651))))

(declare-fun b!154238 () Bool)

(declare-fun lt!240650 () (_ BitVec 64))

(assert (=> b!154238 (= e!103623 (bvsle lt!240651 (bvmul lt!240650 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154238 (or (= lt!240650 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240650 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240650)))))

(assert (=> b!154238 (= lt!240650 ((_ sign_extend 32) (size!3138 (buf!3641 bs2!18))))))

(assert (= (and d!50876 res!129116) b!154237))

(assert (= (and b!154237 res!129117) b!154238))

