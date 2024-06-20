; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30048 () Bool)

(assert start!30048)

(declare-fun b!154128 () Bool)

(declare-fun e!103538 () Bool)

(declare-datatypes ((array!6964 0))(
  ( (array!6965 (arr!3960 (Array (_ BitVec 32) (_ BitVec 8))) (size!3137 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5532 0))(
  ( (BitStream!5533 (buf!3640 array!6964) (currentByte!6659 (_ BitVec 32)) (currentBit!6654 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5532)

(declare-fun array_inv!2926 (array!6964) Bool)

(assert (=> b!154128 (= e!103538 (array_inv!2926 (buf!3640 bs2!18)))))

(declare-fun b!154129 () Bool)

(declare-fun res!129036 () Bool)

(declare-fun e!103539 () Bool)

(assert (=> b!154129 (=> (not res!129036) (not e!103539))))

(declare-fun lt!240553 () (_ BitVec 64))

(declare-fun bs1!10 () BitStream!5532)

(declare-fun arrayBitRangesEq!0 (array!6964 array!6964 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154129 (= res!129036 (arrayBitRangesEq!0 (buf!3640 bs1!10) (buf!3640 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240553))))

(declare-fun b!154130 () Bool)

(declare-fun res!129033 () Bool)

(assert (=> b!154130 (=> (not res!129033) (not e!103539))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154130 (= res!129033 (bvsle lt!240553 (bitIndex!0 (size!3137 (buf!3640 bs2!18)) (currentByte!6659 bs2!18) (currentBit!6654 bs2!18))))))

(declare-fun res!129034 () Bool)

(declare-fun e!103534 () Bool)

(assert (=> start!30048 (=> (not res!129034) (not e!103534))))

(assert (=> start!30048 (= res!129034 (= (size!3137 (buf!3640 bs1!10)) (size!3137 (buf!3640 bs2!18))))))

(assert (=> start!30048 e!103534))

(declare-fun e!103537 () Bool)

(declare-fun inv!12 (BitStream!5532) Bool)

(assert (=> start!30048 (and (inv!12 bs1!10) e!103537)))

(assert (=> start!30048 (and (inv!12 bs2!18) e!103538)))

(declare-fun b!154131 () Bool)

(assert (=> b!154131 (= e!103534 e!103539)))

(declare-fun res!129035 () Bool)

(assert (=> b!154131 (=> (not res!129035) (not e!103539))))

(assert (=> b!154131 (= res!129035 (bvsle lt!240553 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3137 (buf!3640 bs1!10))))))))

(assert (=> b!154131 (= lt!240553 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3137 (buf!3640 bs1!10)) (currentByte!6659 bs1!10) (currentBit!6654 bs1!10))))))

(declare-fun b!154132 () Bool)

(assert (=> b!154132 (= e!103537 (array_inv!2926 (buf!3640 bs1!10)))))

(declare-fun b!154133 () Bool)

(assert (=> b!154133 (= e!103539 (not (inv!12 (BitStream!5533 (buf!3640 bs2!18) (currentByte!6659 bs1!10) (currentBit!6654 bs1!10)))))))

(assert (= (and start!30048 res!129034) b!154131))

(assert (= (and b!154131 res!129035) b!154130))

(assert (= (and b!154130 res!129033) b!154129))

(assert (= (and b!154129 res!129036) b!154133))

(assert (= start!30048 b!154132))

(assert (= start!30048 b!154128))

(declare-fun m!240107 () Bool)

(assert (=> b!154131 m!240107))

(declare-fun m!240109 () Bool)

(assert (=> start!30048 m!240109))

(declare-fun m!240111 () Bool)

(assert (=> start!30048 m!240111))

(declare-fun m!240113 () Bool)

(assert (=> b!154130 m!240113))

(declare-fun m!240115 () Bool)

(assert (=> b!154129 m!240115))

(declare-fun m!240117 () Bool)

(assert (=> b!154133 m!240117))

(declare-fun m!240119 () Bool)

(assert (=> b!154132 m!240119))

(declare-fun m!240121 () Bool)

(assert (=> b!154128 m!240121))

(check-sat (not b!154130) (not b!154131) (not b!154129) (not b!154132) (not start!30048) (not b!154133) (not b!154128))
(check-sat)
(get-model)

(declare-fun d!50840 () Bool)

(assert (=> d!50840 (= (array_inv!2926 (buf!3640 bs1!10)) (bvsge (size!3137 (buf!3640 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154132 d!50840))

(declare-fun d!50842 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50842 (= (inv!12 (BitStream!5533 (buf!3640 bs2!18) (currentByte!6659 bs1!10) (currentBit!6654 bs1!10))) (invariant!0 (currentBit!6654 (BitStream!5533 (buf!3640 bs2!18) (currentByte!6659 bs1!10) (currentBit!6654 bs1!10))) (currentByte!6659 (BitStream!5533 (buf!3640 bs2!18) (currentByte!6659 bs1!10) (currentBit!6654 bs1!10))) (size!3137 (buf!3640 (BitStream!5533 (buf!3640 bs2!18) (currentByte!6659 bs1!10) (currentBit!6654 bs1!10))))))))

(declare-fun bs!12431 () Bool)

(assert (= bs!12431 d!50842))

(declare-fun m!240139 () Bool)

(assert (=> bs!12431 m!240139))

(assert (=> b!154133 d!50842))

(declare-fun d!50844 () Bool)

(declare-fun e!103560 () Bool)

(assert (=> d!50844 e!103560))

(declare-fun res!129054 () Bool)

(assert (=> d!50844 (=> (not res!129054) (not e!103560))))

(declare-fun lt!240571 () (_ BitVec 64))

(declare-fun lt!240574 () (_ BitVec 64))

(declare-fun lt!240570 () (_ BitVec 64))

(assert (=> d!50844 (= res!129054 (= lt!240574 (bvsub lt!240571 lt!240570)))))

(assert (=> d!50844 (or (= (bvand lt!240571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240570 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240571 lt!240570) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50844 (= lt!240570 (remainingBits!0 ((_ sign_extend 32) (size!3137 (buf!3640 bs1!10))) ((_ sign_extend 32) (currentByte!6659 bs1!10)) ((_ sign_extend 32) (currentBit!6654 bs1!10))))))

(declare-fun lt!240573 () (_ BitVec 64))

(declare-fun lt!240569 () (_ BitVec 64))

(assert (=> d!50844 (= lt!240571 (bvmul lt!240573 lt!240569))))

(assert (=> d!50844 (or (= lt!240573 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240569 (bvsdiv (bvmul lt!240573 lt!240569) lt!240573)))))

(assert (=> d!50844 (= lt!240569 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50844 (= lt!240573 ((_ sign_extend 32) (size!3137 (buf!3640 bs1!10))))))

(assert (=> d!50844 (= lt!240574 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6659 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6654 bs1!10))))))

(assert (=> d!50844 (invariant!0 (currentBit!6654 bs1!10) (currentByte!6659 bs1!10) (size!3137 (buf!3640 bs1!10)))))

(assert (=> d!50844 (= (bitIndex!0 (size!3137 (buf!3640 bs1!10)) (currentByte!6659 bs1!10) (currentBit!6654 bs1!10)) lt!240574)))

(declare-fun b!154156 () Bool)

(declare-fun res!129053 () Bool)

(assert (=> b!154156 (=> (not res!129053) (not e!103560))))

(assert (=> b!154156 (= res!129053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240574))))

(declare-fun b!154157 () Bool)

(declare-fun lt!240572 () (_ BitVec 64))

(assert (=> b!154157 (= e!103560 (bvsle lt!240574 (bvmul lt!240572 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154157 (or (= lt!240572 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240572 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240572)))))

(assert (=> b!154157 (= lt!240572 ((_ sign_extend 32) (size!3137 (buf!3640 bs1!10))))))

(assert (= (and d!50844 res!129054) b!154156))

(assert (= (and b!154156 res!129053) b!154157))

(declare-fun m!240141 () Bool)

(assert (=> d!50844 m!240141))

(declare-fun m!240143 () Bool)

(assert (=> d!50844 m!240143))

(assert (=> b!154131 d!50844))

(declare-fun d!50848 () Bool)

(declare-fun e!103561 () Bool)

(assert (=> d!50848 e!103561))

(declare-fun res!129056 () Bool)

(assert (=> d!50848 (=> (not res!129056) (not e!103561))))

(declare-fun lt!240580 () (_ BitVec 64))

(declare-fun lt!240577 () (_ BitVec 64))

(declare-fun lt!240576 () (_ BitVec 64))

(assert (=> d!50848 (= res!129056 (= lt!240580 (bvsub lt!240577 lt!240576)))))

(assert (=> d!50848 (or (= (bvand lt!240577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240576 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240577 lt!240576) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50848 (= lt!240576 (remainingBits!0 ((_ sign_extend 32) (size!3137 (buf!3640 bs2!18))) ((_ sign_extend 32) (currentByte!6659 bs2!18)) ((_ sign_extend 32) (currentBit!6654 bs2!18))))))

(declare-fun lt!240579 () (_ BitVec 64))

(declare-fun lt!240575 () (_ BitVec 64))

(assert (=> d!50848 (= lt!240577 (bvmul lt!240579 lt!240575))))

(assert (=> d!50848 (or (= lt!240579 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240575 (bvsdiv (bvmul lt!240579 lt!240575) lt!240579)))))

(assert (=> d!50848 (= lt!240575 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50848 (= lt!240579 ((_ sign_extend 32) (size!3137 (buf!3640 bs2!18))))))

(assert (=> d!50848 (= lt!240580 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6659 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6654 bs2!18))))))

(assert (=> d!50848 (invariant!0 (currentBit!6654 bs2!18) (currentByte!6659 bs2!18) (size!3137 (buf!3640 bs2!18)))))

(assert (=> d!50848 (= (bitIndex!0 (size!3137 (buf!3640 bs2!18)) (currentByte!6659 bs2!18) (currentBit!6654 bs2!18)) lt!240580)))

(declare-fun b!154158 () Bool)

(declare-fun res!129055 () Bool)

(assert (=> b!154158 (=> (not res!129055) (not e!103561))))

(assert (=> b!154158 (= res!129055 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240580))))

(declare-fun b!154159 () Bool)

(declare-fun lt!240578 () (_ BitVec 64))

(assert (=> b!154159 (= e!103561 (bvsle lt!240580 (bvmul lt!240578 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154159 (or (= lt!240578 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240578 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240578)))))

(assert (=> b!154159 (= lt!240578 ((_ sign_extend 32) (size!3137 (buf!3640 bs2!18))))))

(assert (= (and d!50848 res!129056) b!154158))

(assert (= (and b!154158 res!129055) b!154159))

(declare-fun m!240145 () Bool)

(assert (=> d!50848 m!240145))

(declare-fun m!240147 () Bool)

(assert (=> d!50848 m!240147))

(assert (=> b!154130 d!50848))

(declare-fun d!50850 () Bool)

(assert (=> d!50850 (= (inv!12 bs1!10) (invariant!0 (currentBit!6654 bs1!10) (currentByte!6659 bs1!10) (size!3137 (buf!3640 bs1!10))))))

(declare-fun bs!12432 () Bool)

(assert (= bs!12432 d!50850))

(assert (=> bs!12432 m!240143))

(assert (=> start!30048 d!50850))

(declare-fun d!50852 () Bool)

(assert (=> d!50852 (= (inv!12 bs2!18) (invariant!0 (currentBit!6654 bs2!18) (currentByte!6659 bs2!18) (size!3137 (buf!3640 bs2!18))))))

(declare-fun bs!12433 () Bool)

(assert (= bs!12433 d!50852))

(assert (=> bs!12433 m!240147))

(assert (=> start!30048 d!50852))

(declare-fun d!50854 () Bool)

(assert (=> d!50854 (= (array_inv!2926 (buf!3640 bs2!18)) (bvsge (size!3137 (buf!3640 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154128 d!50854))

(declare-fun b!154201 () Bool)

(declare-fun e!103599 () Bool)

(declare-fun call!2192 () Bool)

(assert (=> b!154201 (= e!103599 call!2192)))

(declare-fun b!154202 () Bool)

(declare-fun e!103598 () Bool)

(declare-fun e!103596 () Bool)

(assert (=> b!154202 (= e!103598 e!103596)))

(declare-fun res!129089 () Bool)

(assert (=> b!154202 (=> (not res!129089) (not e!103596))))

(declare-fun e!103597 () Bool)

(assert (=> b!154202 (= res!129089 e!103597)))

(declare-fun res!129090 () Bool)

(assert (=> b!154202 (=> res!129090 e!103597)))

(declare-datatypes ((tuple4!188 0))(
  ( (tuple4!189 (_1!7227 (_ BitVec 32)) (_2!7227 (_ BitVec 32)) (_3!397 (_ BitVec 32)) (_4!94 (_ BitVec 32))) )
))
(declare-fun lt!240614 () tuple4!188)

(assert (=> b!154202 (= res!129090 (bvsge (_1!7227 lt!240614) (_2!7227 lt!240614)))))

(declare-fun lt!240615 () (_ BitVec 32))

(assert (=> b!154202 (= lt!240615 ((_ extract 31 0) (bvsrem lt!240553 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!240616 () (_ BitVec 32))

(assert (=> b!154202 (= lt!240616 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!188)

(assert (=> b!154202 (= lt!240614 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240553))))

(declare-fun e!103600 () Bool)

(declare-fun b!154203 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154203 (= e!103600 (byteRangesEq!0 (select (arr!3960 (buf!3640 bs1!10)) (_4!94 lt!240614)) (select (arr!3960 (buf!3640 bs2!18)) (_4!94 lt!240614)) #b00000000000000000000000000000000 lt!240615))))

(declare-fun b!154204 () Bool)

(declare-fun arrayRangesEq!387 (array!6964 array!6964 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154204 (= e!103597 (arrayRangesEq!387 (buf!3640 bs1!10) (buf!3640 bs2!18) (_1!7227 lt!240614) (_2!7227 lt!240614)))))

(declare-fun c!8208 () Bool)

(declare-fun bm!2189 () Bool)

(assert (=> bm!2189 (= call!2192 (byteRangesEq!0 (select (arr!3960 (buf!3640 bs1!10)) (_3!397 lt!240614)) (select (arr!3960 (buf!3640 bs2!18)) (_3!397 lt!240614)) lt!240616 (ite c!8208 lt!240615 #b00000000000000000000000000001000)))))

(declare-fun b!154205 () Bool)

(declare-fun res!129088 () Bool)

(assert (=> b!154205 (= res!129088 (= lt!240615 #b00000000000000000000000000000000))))

(assert (=> b!154205 (=> res!129088 e!103600)))

(declare-fun e!103595 () Bool)

(assert (=> b!154205 (= e!103595 e!103600)))

(declare-fun b!154206 () Bool)

(assert (=> b!154206 (= e!103596 e!103599)))

(assert (=> b!154206 (= c!8208 (= (_3!397 lt!240614) (_4!94 lt!240614)))))

(declare-fun d!50856 () Bool)

(declare-fun res!129091 () Bool)

(assert (=> d!50856 (=> res!129091 e!103598)))

(assert (=> d!50856 (= res!129091 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240553))))

(assert (=> d!50856 (= (arrayBitRangesEq!0 (buf!3640 bs1!10) (buf!3640 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240553) e!103598)))

(declare-fun b!154207 () Bool)

(assert (=> b!154207 (= e!103599 e!103595)))

(declare-fun res!129092 () Bool)

(assert (=> b!154207 (= res!129092 call!2192)))

(assert (=> b!154207 (=> (not res!129092) (not e!103595))))

(assert (= (and d!50856 (not res!129091)) b!154202))

(assert (= (and b!154202 (not res!129090)) b!154204))

(assert (= (and b!154202 res!129089) b!154206))

(assert (= (and b!154206 c!8208) b!154201))

(assert (= (and b!154206 (not c!8208)) b!154207))

(assert (= (and b!154207 res!129092) b!154205))

(assert (= (and b!154205 (not res!129088)) b!154203))

(assert (= (or b!154201 b!154207) bm!2189))

(declare-fun m!240173 () Bool)

(assert (=> b!154202 m!240173))

(declare-fun m!240175 () Bool)

(assert (=> b!154203 m!240175))

(declare-fun m!240177 () Bool)

(assert (=> b!154203 m!240177))

(assert (=> b!154203 m!240175))

(assert (=> b!154203 m!240177))

(declare-fun m!240179 () Bool)

(assert (=> b!154203 m!240179))

(declare-fun m!240181 () Bool)

(assert (=> b!154204 m!240181))

(declare-fun m!240183 () Bool)

(assert (=> bm!2189 m!240183))

(declare-fun m!240185 () Bool)

(assert (=> bm!2189 m!240185))

(assert (=> bm!2189 m!240183))

(assert (=> bm!2189 m!240185))

(declare-fun m!240187 () Bool)

(assert (=> bm!2189 m!240187))

(assert (=> b!154129 d!50856))

(check-sat (not d!50848) (not b!154203) (not d!50850) (not b!154202) (not d!50852) (not d!50842) (not b!154204) (not bm!2189) (not d!50844))
