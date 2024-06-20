; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30046 () Bool)

(assert start!30046)

(declare-fun b!154110 () Bool)

(declare-fun e!103517 () Bool)

(declare-datatypes ((array!6962 0))(
  ( (array!6963 (arr!3959 (Array (_ BitVec 32) (_ BitVec 8))) (size!3136 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5530 0))(
  ( (BitStream!5531 (buf!3639 array!6962) (currentByte!6658 (_ BitVec 32)) (currentBit!6653 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5530)

(declare-fun bs1!10 () BitStream!5530)

(declare-fun inv!12 (BitStream!5530) Bool)

(assert (=> b!154110 (= e!103517 (not (inv!12 (BitStream!5531 (buf!3639 bs2!18) (currentByte!6658 bs1!10) (currentBit!6653 bs1!10)))))))

(declare-fun res!129021 () Bool)

(declare-fun e!103518 () Bool)

(assert (=> start!30046 (=> (not res!129021) (not e!103518))))

(assert (=> start!30046 (= res!129021 (= (size!3136 (buf!3639 bs1!10)) (size!3136 (buf!3639 bs2!18))))))

(assert (=> start!30046 e!103518))

(declare-fun e!103520 () Bool)

(assert (=> start!30046 (and (inv!12 bs1!10) e!103520)))

(declare-fun e!103521 () Bool)

(assert (=> start!30046 (and (inv!12 bs2!18) e!103521)))

(declare-fun b!154111 () Bool)

(declare-fun res!129024 () Bool)

(assert (=> b!154111 (=> (not res!129024) (not e!103517))))

(declare-fun lt!240550 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154111 (= res!129024 (bvsle lt!240550 (bitIndex!0 (size!3136 (buf!3639 bs2!18)) (currentByte!6658 bs2!18) (currentBit!6653 bs2!18))))))

(declare-fun b!154112 () Bool)

(declare-fun res!129023 () Bool)

(assert (=> b!154112 (=> (not res!129023) (not e!103517))))

(declare-fun arrayBitRangesEq!0 (array!6962 array!6962 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154112 (= res!129023 (arrayBitRangesEq!0 (buf!3639 bs1!10) (buf!3639 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240550))))

(declare-fun b!154113 () Bool)

(declare-fun array_inv!2925 (array!6962) Bool)

(assert (=> b!154113 (= e!103520 (array_inv!2925 (buf!3639 bs1!10)))))

(declare-fun b!154114 () Bool)

(assert (=> b!154114 (= e!103521 (array_inv!2925 (buf!3639 bs2!18)))))

(declare-fun b!154115 () Bool)

(assert (=> b!154115 (= e!103518 e!103517)))

(declare-fun res!129022 () Bool)

(assert (=> b!154115 (=> (not res!129022) (not e!103517))))

(assert (=> b!154115 (= res!129022 (bvsle lt!240550 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3136 (buf!3639 bs1!10))))))))

(assert (=> b!154115 (= lt!240550 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3136 (buf!3639 bs1!10)) (currentByte!6658 bs1!10) (currentBit!6653 bs1!10))))))

(assert (= (and start!30046 res!129021) b!154115))

(assert (= (and b!154115 res!129022) b!154111))

(assert (= (and b!154111 res!129024) b!154112))

(assert (= (and b!154112 res!129023) b!154110))

(assert (= start!30046 b!154113))

(assert (= start!30046 b!154114))

(declare-fun m!240091 () Bool)

(assert (=> b!154111 m!240091))

(declare-fun m!240093 () Bool)

(assert (=> b!154112 m!240093))

(declare-fun m!240095 () Bool)

(assert (=> b!154110 m!240095))

(declare-fun m!240097 () Bool)

(assert (=> b!154115 m!240097))

(declare-fun m!240099 () Bool)

(assert (=> b!154113 m!240099))

(declare-fun m!240101 () Bool)

(assert (=> start!30046 m!240101))

(declare-fun m!240103 () Bool)

(assert (=> start!30046 m!240103))

(declare-fun m!240105 () Bool)

(assert (=> b!154114 m!240105))

(push 1)

(assert (not b!154111))

(assert (not b!154112))

(assert (not start!30046))

(assert (not b!154115))

(assert (not b!154113))

(assert (not b!154114))

(assert (not b!154110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50834 () Bool)

(assert (=> d!50834 (= (array_inv!2925 (buf!3639 bs1!10)) (bvsge (size!3136 (buf!3639 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154113 d!50834))

(declare-fun d!50836 () Bool)

(assert (=> d!50836 (= (array_inv!2925 (buf!3639 bs2!18)) (bvsge (size!3136 (buf!3639 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154114 d!50836))

(declare-fun b!154174 () Bool)

(declare-fun e!103579 () Bool)

(declare-fun call!2189 () Bool)

(assert (=> b!154174 (= e!103579 call!2189)))

(declare-datatypes ((tuple4!186 0))(
  ( (tuple4!187 (_1!7226 (_ BitVec 32)) (_2!7226 (_ BitVec 32)) (_3!396 (_ BitVec 32)) (_4!93 (_ BitVec 32))) )
))
(declare-fun lt!240587 () tuple4!186)

(declare-fun lt!240589 () (_ BitVec 32))

(declare-fun lt!240588 () (_ BitVec 32))

(declare-fun bm!2186 () Bool)

(declare-fun c!8205 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2186 (= call!2189 (byteRangesEq!0 (ite c!8205 (select (arr!3959 (buf!3639 bs1!10)) (_3!396 lt!240587)) (select (arr!3959 (buf!3639 bs1!10)) (_4!93 lt!240587))) (ite c!8205 (select (arr!3959 (buf!3639 bs2!18)) (_3!396 lt!240587)) (select (arr!3959 (buf!3639 bs2!18)) (_4!93 lt!240587))) (ite c!8205 lt!240588 #b00000000000000000000000000000000) lt!240589))))

(declare-fun b!154175 () Bool)

(declare-fun e!103578 () Bool)

(declare-fun arrayRangesEq!386 (array!6962 array!6962 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154175 (= e!103578 (arrayRangesEq!386 (buf!3639 bs1!10) (buf!3639 bs2!18) (_1!7226 lt!240587) (_2!7226 lt!240587)))))

(declare-fun d!50838 () Bool)

(declare-fun res!129070 () Bool)

(declare-fun e!103574 () Bool)

(assert (=> d!50838 (=> res!129070 e!103574)))

(assert (=> d!50838 (= res!129070 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240550))))

(assert (=> d!50838 (= (arrayBitRangesEq!0 (buf!3639 bs1!10) (buf!3639 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240550) e!103574)))

(declare-fun b!154176 () Bool)

(declare-fun e!103576 () Bool)

(assert (=> b!154176 (= e!103574 e!103576)))

(declare-fun res!129071 () Bool)

(assert (=> b!154176 (=> (not res!129071) (not e!103576))))

(assert (=> b!154176 (= res!129071 e!103578)))

(declare-fun res!129067 () Bool)

(assert (=> b!154176 (=> res!129067 e!103578)))

(assert (=> b!154176 (= res!129067 (bvsge (_1!7226 lt!240587) (_2!7226 lt!240587)))))

(assert (=> b!154176 (= lt!240589 ((_ extract 31 0) (bvsrem lt!240550 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154176 (= lt!240588 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!186)

(assert (=> b!154176 (= lt!240587 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240550))))

(declare-fun b!154177 () Bool)

(declare-fun e!103577 () Bool)

(declare-fun e!103575 () Bool)

(assert (=> b!154177 (= e!103577 e!103575)))

(declare-fun res!129068 () Bool)

(assert (=> b!154177 (= res!129068 (byteRangesEq!0 (select (arr!3959 (buf!3639 bs1!10)) (_3!396 lt!240587)) (select (arr!3959 (buf!3639 bs2!18)) (_3!396 lt!240587)) lt!240588 #b00000000000000000000000000001000))))

(assert (=> b!154177 (=> (not res!129068) (not e!103575))))

(declare-fun b!154178 () Bool)

(assert (=> b!154178 (= e!103577 call!2189)))

(declare-fun b!154179 () Bool)

(declare-fun res!129069 () Bool)

(assert (=> b!154179 (= res!129069 (= lt!240589 #b00000000000000000000000000000000))))

(assert (=> b!154179 (=> res!129069 e!103579)))

(assert (=> b!154179 (= e!103575 e!103579)))

(declare-fun b!154180 () Bool)

(assert (=> b!154180 (= e!103576 e!103577)))

(assert (=> b!154180 (= c!8205 (= (_3!396 lt!240587) (_4!93 lt!240587)))))

(assert (= (and d!50838 (not res!129070)) b!154176))

(assert (= (and b!154176 (not res!129067)) b!154175))

(assert (= (and b!154176 res!129071) b!154180))

(assert (= (and b!154180 c!8205) b!154178))

(assert (= (and b!154180 (not c!8205)) b!154177))

(assert (= (and b!154177 res!129068) b!154179))

(assert (= (and b!154179 (not res!129069)) b!154174))

(assert (= (or b!154178 b!154174) bm!2186))

(declare-fun m!240149 () Bool)

(assert (=> bm!2186 m!240149))

(declare-fun m!240151 () Bool)

(assert (=> bm!2186 m!240151))

(declare-fun m!240153 () Bool)

(assert (=> bm!2186 m!240153))

(declare-fun m!240155 () Bool)

(assert (=> bm!2186 m!240155))

(declare-fun m!240157 () Bool)

(assert (=> bm!2186 m!240157))

(declare-fun m!240159 () Bool)

(assert (=> b!154175 m!240159))

(declare-fun m!240161 () Bool)

(assert (=> b!154176 m!240161))

(assert (=> b!154177 m!240157))

(assert (=> b!154177 m!240151))

(assert (=> b!154177 m!240157))

(assert (=> b!154177 m!240151))

(declare-fun m!240163 () Bool)

(assert (=> b!154177 m!240163))

(assert (=> b!154112 d!50838))

(declare-fun d!50858 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50858 (= (inv!12 bs1!10) (invariant!0 (currentBit!6653 bs1!10) (currentByte!6658 bs1!10) (size!3136 (buf!3639 bs1!10))))))

(declare-fun bs!12434 () Bool)

(assert (= bs!12434 d!50858))

(declare-fun m!240165 () Bool)

(assert (=> bs!12434 m!240165))

(assert (=> start!30046 d!50858))

(declare-fun d!50860 () Bool)

(assert (=> d!50860 (= (inv!12 bs2!18) (invariant!0 (currentBit!6653 bs2!18) (currentByte!6658 bs2!18) (size!3136 (buf!3639 bs2!18))))))

(declare-fun bs!12435 () Bool)

(assert (= bs!12435 d!50860))

(declare-fun m!240167 () Bool)

(assert (=> bs!12435 m!240167))

(assert (=> start!30046 d!50860))

(declare-fun d!50862 () Bool)

(declare-fun e!103603 () Bool)

(assert (=> d!50862 e!103603))

(declare-fun res!129098 () Bool)

(assert (=> d!50862 (=> (not res!129098) (not e!103603))))

(declare-fun lt!240633 () (_ BitVec 64))

(declare-fun lt!240634 () (_ BitVec 64))

(declare-fun lt!240632 () (_ BitVec 64))

(assert (=> d!50862 (= res!129098 (= lt!240634 (bvsub lt!240633 lt!240632)))))

(assert (=> d!50862 (or (= (bvand lt!240633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240632 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240633 lt!240632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50862 (= lt!240632 (remainingBits!0 ((_ sign_extend 32) (size!3136 (buf!3639 bs2!18))) ((_ sign_extend 32) (currentByte!6658 bs2!18)) ((_ sign_extend 32) (currentBit!6653 bs2!18))))))

(declare-fun lt!240630 () (_ BitVec 64))

(declare-fun lt!240629 () (_ BitVec 64))

(assert (=> d!50862 (= lt!240633 (bvmul lt!240630 lt!240629))))

(assert (=> d!50862 (or (= lt!240630 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240629 (bvsdiv (bvmul lt!240630 lt!240629) lt!240630)))))

(assert (=> d!50862 (= lt!240629 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50862 (= lt!240630 ((_ sign_extend 32) (size!3136 (buf!3639 bs2!18))))))

(assert (=> d!50862 (= lt!240634 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6658 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6653 bs2!18))))))

(assert (=> d!50862 (invariant!0 (currentBit!6653 bs2!18) (currentByte!6658 bs2!18) (size!3136 (buf!3639 bs2!18)))))

(assert (=> d!50862 (= (bitIndex!0 (size!3136 (buf!3639 bs2!18)) (currentByte!6658 bs2!18) (currentBit!6653 bs2!18)) lt!240634)))

(declare-fun b!154212 () Bool)

(declare-fun res!129097 () Bool)

(assert (=> b!154212 (=> (not res!129097) (not e!103603))))

(assert (=> b!154212 (= res!129097 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240634))))

(declare-fun b!154213 () Bool)

(declare-fun lt!240631 () (_ BitVec 64))

(assert (=> b!154213 (= e!103603 (bvsle lt!240634 (bvmul lt!240631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154213 (or (= lt!240631 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240631 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240631)))))

(assert (=> b!154213 (= lt!240631 ((_ sign_extend 32) (size!3136 (buf!3639 bs2!18))))))

(assert (= (and d!50862 res!129098) b!154212))

(assert (= (and b!154212 res!129097) b!154213))

(declare-fun m!240189 () Bool)

(assert (=> d!50862 m!240189))

(assert (=> d!50862 m!240167))

(assert (=> b!154111 d!50862))

(declare-fun d!50866 () Bool)

(assert (=> d!50866 (= (inv!12 (BitStream!5531 (buf!3639 bs2!18) (currentByte!6658 bs1!10) (currentBit!6653 bs1!10))) (invariant!0 (currentBit!6653 (BitStream!5531 (buf!3639 bs2!18) (currentByte!6658 bs1!10) (currentBit!6653 bs1!10))) (currentByte!6658 (BitStream!5531 (buf!3639 bs2!18) (currentByte!6658 bs1!10) (currentBit!6653 bs1!10))) (size!3136 (buf!3639 (BitStream!5531 (buf!3639 bs2!18) (currentByte!6658 bs1!10) (currentBit!6653 bs1!10))))))))

(declare-fun bs!12436 () Bool)

(assert (= bs!12436 d!50866))

(declare-fun m!240191 () Bool)

(assert (=> bs!12436 m!240191))

(assert (=> b!154110 d!50866))

(declare-fun d!50868 () Bool)

(declare-fun e!103604 () Bool)

(assert (=> d!50868 e!103604))

(declare-fun res!129100 () Bool)

(assert (=> d!50868 (=> (not res!129100) (not e!103604))))

(declare-fun lt!240639 () (_ BitVec 64))

(declare-fun lt!240638 () (_ BitVec 64))

(declare-fun lt!240640 () (_ BitVec 64))

(assert (=> d!50868 (= res!129100 (= lt!240640 (bvsub lt!240639 lt!240638)))))

(assert (=> d!50868 (or (= (bvand lt!240639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240638 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240639 lt!240638) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50868 (= lt!240638 (remainingBits!0 ((_ sign_extend 32) (size!3136 (buf!3639 bs1!10))) ((_ sign_extend 32) (currentByte!6658 bs1!10)) ((_ sign_extend 32) (currentBit!6653 bs1!10))))))

(declare-fun lt!240636 () (_ BitVec 64))

(declare-fun lt!240635 () (_ BitVec 64))

(assert (=> d!50868 (= lt!240639 (bvmul lt!240636 lt!240635))))

(assert (=> d!50868 (or (= lt!240636 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240635 (bvsdiv (bvmul lt!240636 lt!240635) lt!240636)))))

(assert (=> d!50868 (= lt!240635 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50868 (= lt!240636 ((_ sign_extend 32) (size!3136 (buf!3639 bs1!10))))))

(assert (=> d!50868 (= lt!240640 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6658 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6653 bs1!10))))))

(assert (=> d!50868 (invariant!0 (currentBit!6653 bs1!10) (currentByte!6658 bs1!10) (size!3136 (buf!3639 bs1!10)))))

(assert (=> d!50868 (= (bitIndex!0 (size!3136 (buf!3639 bs1!10)) (currentByte!6658 bs1!10) (currentBit!6653 bs1!10)) lt!240640)))

(declare-fun b!154214 () Bool)

(declare-fun res!129099 () Bool)

(assert (=> b!154214 (=> (not res!129099) (not e!103604))))

(assert (=> b!154214 (= res!129099 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240640))))

(declare-fun b!154215 () Bool)

(declare-fun lt!240637 () (_ BitVec 64))

(assert (=> b!154215 (= e!103604 (bvsle lt!240640 (bvmul lt!240637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154215 (or (= lt!240637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240637)))))

(assert (=> b!154215 (= lt!240637 ((_ sign_extend 32) (size!3136 (buf!3639 bs1!10))))))

(assert (= (and d!50868 res!129100) b!154214))

(assert (= (and b!154214 res!129099) b!154215))

(declare-fun m!240193 () Bool)

(assert (=> d!50868 m!240193))

(assert (=> d!50868 m!240165))

(assert (=> b!154115 d!50868))

(push 1)

(assert (not bm!2186))

(assert (not d!50860))

(assert (not b!154175))

(assert (not b!154176))

(assert (not b!154177))

(assert (not d!50862))

(assert (not d!50866))

(assert (not d!50868))

(assert (not d!50858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

